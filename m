Return-Path: <linux-arm-msm+bounces-98728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFXhEITju2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:52:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930F2CAA60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AA733021B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F0D3B0AC2;
	Thu, 19 Mar 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDvEiZfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFbP/Uxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED2379ECF
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921004; cv=none; b=ZHMVhk7cPJSDIh4usaN5VplgFN8oCO7upgUqKyS9syLIS8Tv5ntpuWvq75s9Ufv05TTDSWWH9t7+B5aecY15684JsxgIfHWcnNsd+CCoTb+O6Oi/WEFa36vJ8KB7xec6p0FXQ2wGU9sFCUzD3Z/Ofi96z9A7nc4d3wy8+9W/mi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921004; c=relaxed/simple;
	bh=0pSRlFP9JZFkvrkuzDCFcnjTv2airPDZfsRDadw3Udo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lJRe0SZAwd3bUjloug4degZfdBmU9xX5suAh6/fD+lNj8OF1tEQMpbKoddDZqznkG2wvsECakJ6nUWQilneD14NHS+Vy4vZMEQiFkZ5Snw9S0rRVurLutv4TD/v+W1lNugmY2KqBOIS9+2vJhqdLnBR75ueCSvJsyJ8tSsEtEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDvEiZfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFbP/Uxa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740nq1027130
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3BOAWOzvYk6fMJYOVMFQZw
	ujVI5/ZU4UPq/N1RwuEBg=; b=ZDvEiZfJPz/ZObUnFvI5nhH8/Uy/afgFNJZayl
	tK3jPs3gTnKn7SHcyhoiwEpoo8gYZTp/X+IBn3RpNnGgynDdvrLqJmOhX32lhY3g
	DtGmARFH6LT433pUoMNb9bni7MFLuYQyqKWA4eo642e0g3+tJWidZ1l2LtuGU5ss
	3NbRXkPgOq6XQrVUceSVmpa/AreXtM054TZZl+0L0pgq7uopBL5AaZ4NeXhCvkTP
	EnQ40hYUr7BOqJYRTSH4vrzyvHsnkx3wCGUwrg2khU47djIwA7TxYz/iwWAWHaEd
	kndmL/cTlL8kfvNgzX8ScxMlX/xOmw+2wy0ZNxjJl976fS+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032k4xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091a96f0bcso48346371cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921002; x=1774525802; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BOAWOzvYk6fMJYOVMFQZwujVI5/ZU4UPq/N1RwuEBg=;
        b=LFbP/UxaUuNip36h6I80NmFtr77XHLxT1/sB9ifjmt+/gkH8NCtFlE68CHr8AHFmWG
         pxXQPoaL7GFMqnnTyVSZh4h9Il5jXgP1adamp87Z18SrScnDcRWDVqcbrBteTOKzOipe
         afFS7G8OoFxCW5h2QCRPy9cteZdASVz81956WvqsiGWIX3GX/CC+LkZ2482e9mh33pgv
         pfF0htcz+/FteB8b3KIZjXWBRz/sLhlLtaJ0hP/PtdO0JthU2km9k0GxViH41VESkR/D
         cwA1nTXpQgx9LLJnELz/lZXCYZR2BLv1F3/skSjR0vjd5RKkZsn58tcimdv6exNoVhxN
         cdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921002; x=1774525802;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BOAWOzvYk6fMJYOVMFQZwujVI5/ZU4UPq/N1RwuEBg=;
        b=KZrHqTv/DJ/Ir3j/A1Kydtl17IZotb6OB1/IrZBTsn2ufY/OU/uWjJMqswjpIApjtu
         psG9SGtVIbQiZtLckpy46LwCHQfTZ0Zkt6VMWkMvS1gTP5ygRcAxUGWzVZFw4uCjzVF+
         LpeM2L8b1CrQfg2MtjqYdlJCx3qdFn5a2kngSalI4mDv3gjf0UGlyHRTLQPgC40ig0T6
         gfrXxNUYBjjqWNcDxDr37cZER9HhJRH4nt6VD35ceS9eAv8vpmMPGos7RXEF6nBYjBZe
         UbwqtBYkvcVXDKrMoYzODTe2gKQly/l4ROR1yjr7Rs038AI6gj3YMU5DqW6g24Lp04U1
         9YyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHGgw7QhekhiEn6VVzgRHXCN9IkPmdz7WL6OZHdp0oitwqSMYFG8vuTItziU1zaDqKcQqBEHddqyTp43PZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mchMPNlSfAdn7Adl9hWAF40xJxwAjivldvfD0svJC4P+ns67
	obPJQ9/UftaRZxF7TEL1sQT6/wbf62YDIPADy9a9mkdui1++ECmeeSxHtNzvun0a9DwWRDROmiW
	EbZaYmEn/QMHFkFoi4WTqDUD0iMjUnPB0XHItMcZX8lBTeoelK51TqY4DNcWRlQnwSwz8
X-Gm-Gg: ATEYQzwlru5T4zdYuI56KzGZgT7QjKp7gmLNVnDlmshMZvnK9Cwf2q54Ia5XloNq7sz
	HHZGHQIKJTBhK7bYAxLCgyhLNSYJccnDNEYZ42naN4DjznzUemEK0lWWEpEdYJKBHZk+jDUez+3
	fRo1pdHNEurEHleTAxXq/LX/Nfk2TR68s0rhSpc/FjqaXkNWGut72FSefJGMUK2pBG7DzhF9ujT
	SyOG/Qso3xP++VdmFsCY+9DMVpGg0V+EWhR6Ph/d/PQKvtf6+sd5/nhn1x+EmiMR3y/93b0pg9p
	eZxis8Wf6U7Jqy1YnWDG5fDvy69AkTEfEjkZLiHl2opmd8ImEy4suo2rzy8JL4cgN/BmILzg8xC
	9uUO1eBAt4MyV1ejbZJhSUXL7647avBVSJwK7sJHpD1kU
X-Received: by 2002:a05:622a:1890:b0:509:2032:d23e with SMTP id d75a77b69052e-50b14881e43mr86418581cf.38.1773921001901;
        Thu, 19 Mar 2026 04:50:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1890:b0:509:2032:d23e with SMTP id d75a77b69052e-50b14881e43mr86418081cf.38.1773921001387;
        Thu, 19 Mar 2026 04:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm66384605e9.2.2026.03.19.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:50:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] clk: qcom: Add Eliza Disp CC
Date: Thu, 19 Mar 2026 12:49:41 +0100
Message-Id: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXiu2kC/4XNyQ6CMBAG4FchPVvShaXx5HsYD6UdpREotNqoh
 Hd34ORB42WSf5ZvZhIhOIhkn80kQHLR+QGD3GXEtHq4AHUWMxFMVEzympruSifje2pdHI2h0Lm
 XplbiuNa61FYSvB0DnN1jc48nzK2LNx+e25vE1+4/MXHKaANFw6CARhT64GPMp7vucLXPsZAVT
 uITU78wgZgyrCwV55Wy/Au2LMsbVZHzLw4BAAA=
X-Change-ID: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0pSRlFP9JZFkvrkuzDCFcnjTv2airPDZfsRDadw3Udo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu+Lk5Dt/XzIDCvRSYPJIUIkzVSQAO6yXbvWE/
 OEJRZXSltKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvi5AAKCRDBN2bmhouD
 133eD/wMwdSyvj9QZEuj8mFiE4dgiUm0vTUTOpeEZNuJ+aw1PIV+mfOKLGnNu7ZKQLI4LWePR7i
 ZUqQYxirlw1o4AZWftQ+oBm2NkK+nl+q0dcpZYo9tOyTcNtAqxv68ZBRRn/yc5vXhEqTmcTyTMR
 3UwlRVV08//YP+gxaGsLKEY7lc45XKJFb8ESb3q8pLq7+2poNAd2SPUwmgi0+MtIbdnT4K+JV1R
 Zhe97k5H0DtL8EgblR/eCWacO6YvlWLhUHbJN18SCq3LGRdxnyYVo8Jkf8H3HWpx1sy7Ok95RIR
 69ZSQ3NI4VJgDmHjSRCk4xifFDLTNKOfnlfnkPK5BJR5s8Pn4g7LDCDAHvxVWpCbt+UIpnFoDKu
 +HmxEJOFoewcTrkLSWLIgwyzLP00AAhCbJL5/HprYzwRM1izUe3PuC3jFaMhmNQMzz9M9ZFTvHg
 cv57L5hRh3/qrnl5TdPO7k4wKEcQZ6FdtdZrslKD49wEmK0cfMBd57Qa+xe4nZHr+Gce7xrIqZr
 5xbQnKO6E6zGyQkzgzekzwRIeCHXK0L9NKMim0Xi1gtU3beqkbd39OxPdNmgidwqlWOcjAjFDpT
 ddtSkgoXq7RaT864HUVv05uboy8kV+aC0mWueIhfrPV5pXbWFqiVn3lqJho4Hadsyjmg4x/i2HV
 WhygRbrWDiy+rpQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: nwTjcS6uA8fXa-D7S9XV6kZ1dwnFhGuW
X-Proofpoint-GUID: nwTjcS6uA8fXa-D7S9XV6kZ1dwnFhGuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NSBTYWx0ZWRfX+Xzmf5GWyysD
 sYwtrB9s0mHwJRNl0m6OpD624mofyeBiaN5aOl27gteyd5sXLufHAAZtJeuFJyrAV2ahHLvnkL1
 XvK6aQ2VDjGHq9svSGYPrVPMvlPMvMgPxy/pvJkRTQsRTeqUq6Hx9l/D7Tij93bSTZW1Lxng4tM
 jFYUwdmhJLL/yTbCMYiUOyybfbv/yxBmx7yfFVpW/NFme5K0glx9FFhIF/xHTbTTc3WI17GnH/d
 4BggGBA8e5+hv37xRpxa++TM4Nd0NTLqguFWZjJfHfZfRnklb4mCqb8/6PckmhnU3KgYg/339ZH
 Z6RjJWAN6Q4ZtM2aMz+gQV7Mp3LMvlFK+4xn70u7nTjVd3keXIdvvgou8lf55t4ity6wg+sQ8ii
 8HzqtLVHWhFrmgES9xvvJXu11z97vBjA+tsRi+/xow/NIvM9kWRJWu8HAYaoybYm4mQ2HGIxDb/
 Fuw9NluC7ROtzySxYSw==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bbe2ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sWils1Yjnwq4WXAT-ZUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98728-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9930F2CAA60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v3:
- Patch #1: Use maxItems
- Patch #2: Follow legal requirements, add missing disp_cc_pll0_config
  usage (W=1 build and actually test), regmap_set_bits.
- Add tags.
- Link to v2: https://patch.msgid.link/20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com

Changes in v2:
- Patch #1: Drop redundant descriptions from bindings domains - use items
- Patch #2: Use new qcom_cc_probe() syntax simplifying the probe.
            Few style nits.
- Patch #3: New defconfig patch
- Link to v1: https://patch.msgid.link/20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com

Add driver for Eliza SoC display clock controller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

 .../bindings/clock/qcom,eliza-dispcc.yaml          |   96 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-eliza.c                    | 2121 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 ++
 6 files changed, 2346 insertions(+)
---
base-commit: 91154e9cd8b56f1c2ee4d57b03b3adb3ae865d15
change-id: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


