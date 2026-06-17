Return-Path: <linux-arm-msm+bounces-113499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8NaKhQpMmrRvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065716968C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YHm9k3kN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dJb8Tiqo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113499-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113499-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B28931B2F27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6897533CE9A;
	Wed, 17 Jun 2026 04:51:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345B340400
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671877; cv=none; b=XjolaGmQeGS64QRKGp5pdj7P5/87zy0bUZiwRP6TbYSSwiKE0p3XNPCzIFhcSGjtdg/Dlwv/hmutJ9oEcznXiJO0y7Z5JXsTV8rnPRWPbUevfJ4GIn7yl8mbY+06g9oPUMJVu3PFOX0/qtnUD7HMW0moKGaWHMuczzl1ndHAO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671877; c=relaxed/simple;
	bh=4n6dn6i/Lbu50iXsvDsgw2Z2Ze680qElqnviOJCdZSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VST0oqdHJ+ct1S2UBUbtpoAb5/Pet5fkmtKe8LUcLiiQ3QcxWdTNuPdCyTOr/d/S1/jOhZDs/fc8x8N3olW535Jv1Nl8tWDccBd+NNoRQ+3zqNRP0xXQmqtnyAVFOtQe5whQCFgKsTll3I+0EmwYryrfejl9wVHRL1ZxxBiQGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHm9k3kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJb8Tiqo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTcd4736849
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=; b=YHm9k3kNWakKHhnE
	Z4x6wgnmFW5Odg5EaYa+576N4YBrw138wwPFe8HRCahc4cNu7gM6C5ijeekkdetH
	tibkIATVDK2YDj0iTq/oV376rwS9jo0jzlQt8QTFAvCphy63ogwMw6BBIxD7i60/
	CzlNYuC8O5su/4IjkajWN0nkZefg+k35F91Tl7v+JynATmYLQWEwLaeVHUqeisZ0
	BMcOCvh4AOKoSpS4r/8pc1PgglGPLcVye5Yq3ANNY9hhOY+B2VW5zBy2R/JWo2lA
	6lKKzWHScwRwbTHWSX0oKjjorjFU9ve0Q3ckGVtCBQqbtrQ0WtwB3zECa0tx60GN
	WZAKsA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeshevr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422f987f2eso8558722b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671870; x=1782276670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=;
        b=dJb8Tiqo4og0I8NqCCXs0UhkSxBy3eCVABPgotMIsnzfT9ZDFo/HySBmriZ63lM5WK
         uK7lIG9urZXNMznpgvay4BHxPDB8soPULOHysDy4PsVlLsp30MuvYHHAxykHOiXQdv35
         quXM8MZxLwSsp/48d6bOhSr7QFMnowZkMnjixXAgCFLha4VmXNUf0+6iTvQbhJBEeT3c
         N2V1QhsjkBp4+kjye021RPHj09L1Wu6jUYpAVr5kTfx2EYZHWTpxcjw1ys7+CwsLdivP
         QpVX0i7/O38jgp/sJfcu55D5OknIiiGazOhyMNq8A3WScHhGsgfVFO9QK76tPyVAYMgj
         vesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671870; x=1782276670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=;
        b=hCI8c1nzMJDcz66lSeDsdO820Jq8T14VhEVPmzU9OV1To89nnZKSonfGvDDbbgauPv
         3h522r3HUiiT6oxZUuWSjcoPEgGsQRd8oDka2Q32wo+ThSrHathJmPfLvxwJFM5yJ0OG
         74+IQsLwqccSo0Gk9VLoIpjt6fmsX4G/oHhJPooMkTdIl1DGuVNpERWn8dlXFOHggHUz
         XmhJrh5pUjAj5aCJMoKWXrwl+mCvdrd3SXmpfxN3vBxWCGi/zHuVKZ60Z1wsPJVZph+J
         fI/0NLLOyKVAP96Ju8duwrlC9u6PRcT994sAiDI6TnVb+QBHYNckewSgjKDfDy6V5wgp
         WszA==
X-Forwarded-Encrypted: i=1; AFNElJ9r52ATE9RE/jnH4Bsa5zOxKGZoDQM3otNTSgd31Ou3KeZRwYiq7Minxd3u/nYacjy4v4cMGymdwWSCeH1T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzkr5eEzidEj+al3Q6cEZF0vrx1US8DfdXFpf3TH+nFKi3klDm
	DHuj95TadwECQ3YpE2wNNu7cxF0nDtjAf8i36S55ySNfr+vs5l/Sx8gIQPYRmdPJjyGS+wDR9j3
	ZTpPAW7CtvJIg+lEX1iRkU55rtyNkp2gsc1M5oNK2XKTVdkwoiVQQ9g1OtH0Mwf6xCiYm
X-Gm-Gg: Acq92OFBHAN/t+KNxtl7OOjE//X5J4Bu121AOJhdVblXk9Bf+MdKRn8p5NpecrIt9rb
	PpAZISHX6DJton7DxBCdfYtMITh4GgzNIuB0AGQimo6IQW0gCF3MgZI4CQQXOiYPiBTIB/NcHXy
	6vdZRdgIYudt2oekUQpR2+QzIUE6krfh5N3pq9Tbuyoxc0ao/8DFkkO3q5SN1hZ9uyzpz7r6RXu
	7kanvbr+RKTPVsHy0SA+6V4nQ7m7qvuSzDn3Xq8kDHoz6fjr+ak+oCMf2Uo5cfuhkw5eWvEwQyz
	OIDsZiMZJE/MHZH6Knf28R/kPIBc49x9568L5uEFJlmIdm5c8X1BYLAl8whvKq7E7HeDkRnIuGz
	KlAih8kDSW/DDJB/1YtlBIBpte4rd4iY+YDMNLCPh7Ugy
X-Received: by 2002:aa7:88cd:0:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-84524555db7mr2246695b3a.23.1781671869607;
        Tue, 16 Jun 2026 21:51:09 -0700 (PDT)
X-Received: by 2002:aa7:88cd:0:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-84524555db7mr2246666b3a.23.1781671869060;
        Tue, 16 Jun 2026 21:51:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:51:08 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:20 +0530
Subject: [PATCH v7 6/6] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-6-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=5789;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=4n6dn6i/Lbu50iXsvDsgw2Z2Ze680qElqnviOJCdZSg=;
 b=gXxIqPWNVLPpuiR7m1MmYY5CjS9pZ7DlPrDZ4nZW/XzeqwFJ8yzykR5HFK2L8beTLwMUL+0wz
 5krujsqnq8GB3+FYDwzmKCW/YQSjLvADOq5mcqmjy4ntgefwCtsihHn
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXwJnZ0f5A4/Hm
 B0rUsUPFwLI8H6Zy2n1A1gxtNQtSgC9AbFQo9DM3ffHUdRWEXpERIG0aKlfLjTSWLTztwjxythh
 tKfveAzPZk1MW9GPuQb7ugGTuBrf2OFVVX9BFDbI/xK98I6FhAO7NVQ0erhcrMJ7+Jh6NV9et5g
 ubGDW3dfkwAJlXOgvdX2h9kDPrdiT3WVxdkhJqJJsIHME6C2mCRDAtAsQT52qhdJdpiZqUbNFD6
 bkOqwCKD1rDPgwX3I9wbmZ1T2jU7phAhn83Pbi04yEx/UHAfVj0POq20xSO68stK/dSI92fOtL6
 3d+4j5bmGy9Ud8WNrbAIuGHhphOrzAFdd6L9ajVY14gbgIom3LDDSDMYgGDdMzw7BgM10jJWxq/
 AHRjSXqvLg4WyQj48kuWh6tubqahdK6ux5q5QD09r0sEk/S32PnD4my03cLGBmr5VDu8CCU0pUp
 flODiax2lQ8TQeKomfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX8M7PVKv/oGIL
 +FOWw9P6H7YIxfHcst7L7Rpu8JPPFNUGZw/b6pd9Ix4NbzmV/Qcd8WfC9oktbIiNF9+P0Kv9RtB
 hlP5wHpaLnRxMAerm0/Ui2QMW4ezPPY=
X-Proofpoint-ORIG-GUID: 19XPX495yKQAB87reTJHi746ZRIzOn_e
X-Proofpoint-GUID: 19XPX495yKQAB87reTJHi746ZRIzOn_e
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a3227be cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113499-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 065716968C5

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7
- Added Reviewed-by from konrad.

v3->v4:
- Added Acked-by tag.

V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 92cccb1cce69..96dbf04138be 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -80,6 +80,10 @@ enum geni_i2c_err_code {
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -200,8 +204,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -214,6 +219,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -919,7 +925,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1045,8 +1053,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1101,7 +1110,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1159,15 +1168,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -1175,12 +1186,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 
@@ -1220,11 +1233,25 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
-static const struct geni_i2c_desc geni_i2c = {};
+static const struct geni_i2c_desc geni_i2c = {
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
 
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI
@@ -1239,6 +1266,7 @@ MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

-- 
2.34.1


