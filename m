Return-Path: <linux-arm-msm+bounces-113933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id buRvJZPXOGqwiwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:34:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CD16ACF4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iCXoXeLA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bvOdfpor;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113933-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113933-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76CDB3007884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADC235E93B;
	Mon, 22 Jun 2026 06:34:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2D34E766
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110094; cv=none; b=VHRwamdsLz1a0FzXyikbOzclL+BOGZ6AISjmEpkHCouy0DoETEMhEe2qMP7H9SDxlK2dF4n4+brxhkUOp4u9/e3PiZlXdu3VUonCzbyxMiFJJ3EsfF4PW81JNYWCoD7ZesJQhEfFfU9jOvndhaZlnX9kxBqeVbdk3W/znlkQnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110094; c=relaxed/simple;
	bh=y2wQGhHfzqHJ8XiSXx6NumNVZHYZ5cj7ZzBR6/fGk4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sX7hKAQbMkZq4Oih/WQ/qYR2olWVfGFjSc5sSNAP9XeJVAlt/5tTS8L0DjCg6QRAfYdO8rc4WgQbfsBgJxBo46o8H35NOUO55EmrCEX2jHe6MbwersuXSt+EZ8NGC2fobeJDg92QPJPMyXP6t9N/z+E2qCRuNi6UtfTsvqXu70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCXoXeLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvOdfpor; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5Bnvv172653
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2/zbJ7RlGGpzLIcbdISYH0
	4tzgGv8nCYhHdJBWBVGp0=; b=iCXoXeLAVipEeEmRkRlS8syMvhLY/AJADt5cKb
	riZMsjvLvjgEI8GF5tSaPVhgYeqx7NLLw2GH1tyXQaHaq4v9MFlzr2JN3uMySCLf
	9wp/ES/vlLlfSAwesU3zw9hCLvQwNstuHaLl0LRXLkBG91h52ojezasb3rYA4+WJ
	+3+bAvsqknYZsSiuOwq8gLznircQ717WrDY/EO1x/4jnFXlagI18wD5II7OeF2xN
	Mo7QSZKUkSUuPEsyjg7f4lX9YoLR2tmIVVxEAP6iziDnPHHjXnr2ninzY/9X3aLL
	GMZpvS7a08Zw0II/bkea/nPvZbl5GIcE+jDvTc85XxDL3hlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexw56d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:34:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c85c9ac50so3572446a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110091; x=1782714891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/zbJ7RlGGpzLIcbdISYH04tzgGv8nCYhHdJBWBVGp0=;
        b=bvOdfpordPQn9v7udEnTswtuqfPlZUBvvYAEDPZmhVpakiS1KFRir32VRQVvDH+SMI
         UCdLxiSqZQ+10AG+kFR0LndjzRDaU63MfWd+wI1HCkd4RWz23bse3InvzhykJ/FKukpv
         GWxtiqvvdOy/qdqZ5Oc+L9Y/BT3svbQsUolziR3oEoi3WZDnSQ/7FkZkh5C+wRC/luLL
         1l2oswRtCUMJnHUVqfZzVj7GFndmNSRZUPw1YX6tFtzYdTjX6++vpi9W9gJNMcAr2rXJ
         iXKWca4Ny4sFpor9tVBMlfBnkNCebXZ3YFNdB2AMt6aSCa4NbeDCU35rN7jhUX+37W5D
         TLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110091; x=1782714891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/zbJ7RlGGpzLIcbdISYH04tzgGv8nCYhHdJBWBVGp0=;
        b=Iuqedut8XzpNG8dNPN7N7rnV+a2prvKtjvGaP5eU8P7xQou8tkKLkHXZu4i9wfNfUi
         Douh6kzAATqsExIqZjpASMdfEDQLxVrj2Y+7nFck3XUEckE5pD2roEx1ebkuwI5WClSA
         dh84Bk1BEl+mpyGKnE6Px1X231CuriBMtVidfXwvscY1txB3Tz1tUFiObvqhFxqHQeQw
         7nFEWDBEMhjdaZKyQ5FaYBaw1dGyjDNrMWChTGiKDJe4JE9+Z5GuV/7HN8UGA7XX9mWz
         vwht4P40j3mcElYnsqfzP96OXGbBzZ9R/0bUwKXsFeQCDfaQPzAY1ciFXmaLQvU9zhTW
         sm9A==
X-Gm-Message-State: AOJu0YwUdnH8wEvtB1cZ/ufrrV5rutyMqdsPF3Asm8Rjn3dlTeiZRf3w
	69DbveyOelzx3VnwmOnwjS3Ufq9bBeetJqMxc7DviHJjly/vFd4OJLAPe4VYoWaN9siuSJEJz7C
	PLAd0eXLf/tbyIpu6Y5LaaHLhaTMN2DRpIjQU529PI0CdxbIbrCxGS2igc6vvmxjtZmZ4
X-Gm-Gg: AfdE7cl/j5YsGK8/5rzDm89UDYWk137fT4b24ltt7jdsJ/cPHY2IUnhcDqZvkeSQ1xJ
	k8r7qaYuufwcao1Hgd3aZTcgF9ZosT2wpvsVvKLCwU9FFTFycr/Z8MR6O1rYfZJdmSsg+v8q0iS
	FKTCxJu3aSQzSz8MKnUbnT2Clw2GjKndu0yTH5+VOSbrhO599/CVgtf50w7/k9zlznQkV1tkEYw
	9rO8RB6k85kvfS/82K9+Iwz5SziwrtK0NC4EVFHYYlO1E2vLneoajPvgTMdJEIBJGzdubIaA7LZ
	L83qUV0ye5jvOHvW1cKpdNRgbSB5j7XXF6uclm8CV5sVEraxW9aDpPEbaqMWOX/obUKm1kuEjkb
	CIbmKDLsyFFbxHeXyvgmPbDHR5yyORfhweQ==
X-Received: by 2002:a17:90b:384f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37d1a32ba39mr10978184a91.17.1782110091101;
        Sun, 21 Jun 2026 23:34:51 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37d1a32ba39mr10978169a91.17.1782110090631;
        Sun, 21 Jun 2026 23:34:50 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8de8bsm5928321a12.6.2026.06.21.23.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:34:50 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: Add support for upcoming Maili
 SoC
Date: Mon, 22 Jun 2026 06:34:44 +0000
Message-Id: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITXOGoC/22NQQ6CMBBFr0JmbUkZSUVX3sMQU8sgY4BqB4iGc
 HcLbt385CUv788gFJgETskMgSYW9n0E3CXgGtvfSXEVGVCj0QZRdZZbvrJz6phrnVU12rzaQ/S
 fgWp+b61L+WMZbw9ywxpYjYZl8OGznU3Z6v3rTpnSSltbYGHIHPLi7EXS12hb57sujQPlsixfK
 x3jPbsAAAA=
X-Change-ID: 20260622-maili_icc-94001df2a4d3
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfX+tw1UqImVcZu
 OGe++t6iJiKT0Q+fRzUySUtHVlySm/K1WOY6q+nVK/d1nfcAvvSvU1y7KhY3lzXG21fw+tdmn2I
 sjDGqJ5D04TSajgJiJ8ShYnu/2RO0abATn8EJEoJ5ks1VEUFeXW7igvqJy3VHhdFFuU9C2vimpy
 vbwQ4dV+b8FrgS8FMLmJZn4+vfgo8rblJSi8TZ6KlLGF1dGwjMpe0fZACZvNYc/bXCAo/MxRDk2
 ZBtBcI7LXPhcCtNZXM0MeEGb72bjW2OKvohsRqHYp75baGy3LljT+rlC3Is5KVdOC5qnQ1wegtU
 CyU++2wACuIn+7GOcs+qOf5A5+AANltIFDeZUrktH0wfoY42F+s30hdGSOi2i6+CLHRxtjB+Jc8
 XzcM4Io9ZghYax9gJ6GiDmKvwc1M1z5Bg2FouqUFEvWmLW3MzA3HIirPAxWKPUNnR4xs8RgKzco
 XQWlqGkw7MZpQnhaoew==
X-Proofpoint-ORIG-GUID: W2oia_zvgpJ_AUC7roHWKkc6zmLJOkwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfXwWK34vMJnKI0
 ayY3XvVHaZS7cvST/uU2IbNB61h5BgiFGYo/AoeTVgUO2tPtOZRKwpwXFI85y8ua46qzDuRsFSY
 GwBrOOz/tGmKN5iDQB/9iPUei8POFRY=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a38d78c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e3PGyOgw--WO3KluFDwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: W2oia_zvgpJ_AUC7roHWKkc6zmLJOkwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24CD16ACF4B

Add interconnect bindings and RPMh-based interconnect driver support for
the upcoming Qualcomm Maili SoC.

Device tree changes are not part of this series, they will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
- Fix the incorrect endpoint ids in binding header. [Sashiko AI review]
- Link to v1: https://patch.msgid.link/20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com

To: Georgi Djakov <djakov@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect in Maili SoC
      interconnect: qcom: add Maili interconnect provider driver

 .../bindings/interconnect/qcom,maili-rpmh.yaml     |  127 ++
 drivers/interconnect/qcom/Kconfig                  |   10 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/maili.c                  | 2091 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,maili-rpmh.h |  171 ++
 5 files changed, 2401 insertions(+)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260622-maili_icc-94001df2a4d3

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


