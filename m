Return-Path: <linux-arm-msm+bounces-112586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Rw1CFpFKmrylQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:19:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF566E791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:19:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e7zJhaOv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xslk6t80;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CAE3309691
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA475369D56;
	Thu, 11 Jun 2026 04:59:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA136A370
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153985; cv=none; b=RWXD1GJl6HSXz3HaMfEG9HBiu40qds7lKExRZ+qoHx5uUFXV+1GJhzW5wBUlG3gaJZSz2hZPXhMXSKfdLHtvF2barZ+vkNLyGDjZVT3igY+y2I5SZBThv3yy0peyO9mh6d1j5x33DYjYKW7k7WofDTixOcUCFLgiN2y20gAuVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153985; c=relaxed/simple;
	bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rg21YoOmytfzkYgcybk+KPiN3TnYQm4psvq/uYHvvx5IdYeXf2kayMOzVgY3pSAoELhEDEFm62HWPQ/xEHQYhuCM1hiOXM0Dre3bHEsmEO0D2Ls3llKjJP4HuSGeFgEStDDiIMlrm20nlz0Km0U4D3cExSUVjaH0Y3zYnhFm6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7zJhaOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xslk6t80; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Ngqt3082820
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=; b=e7zJhaOvalx32FaR
	5trEjje1WWYDund1D/VjrRUuQcLiPQsh0zSrapXww2+/BSYkXintuxtOS8uZI+Yn
	f+o4y1dPqfv7ptBDh0/zG2q2ASVuX/HEgRP+NhkiGoZuCsjbXR/0ULrcS76TFAga
	UVIURX0AIHf3V3/tB0tDtVT04qwUEDBJhLule4Jb74HqLnwasNJefcetVkw3aLa+
	gtreAZnFWwmiYNbI1XI28RgfJoxtrmOrd15BLhHSjtrae6bz6APOx4M3SQNeUckT
	fonw0U+e8i52KTMcl+X10dg77oKvAQIm2O+K9OfoZWBYLHch3xY0dbRruqBDZ5DT
	3P/XdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so109189465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153970; x=1781758770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=Xslk6t80qERY595Lnkk6LKGu7q0q925Tg+kg/mf2//n798oj8xFco9ygm4se1BmTcm
         5H95Os/ndm24/0xivqyIZTshNrSum5No+tdKps1rHuqNRIzObFsjyoWlf0SkNQFHEFf4
         8Gd/WqlrqL7Wx82gYwWptLhwQzMiMZFumZKnoGQVTHmVsBtoxP79sA2yRoQJBoq+AMNj
         vai9K4YDMrA8WJrii40wFrUJuQKe9G3Ep+cdVZG6enlXAgBlp9M+GqoBcSEiP79X6MKL
         ObN7kPSwcTSRWqv/5SZB1J0piS6X8BIotkgL7v2HH4ZUW1/NgdAeTckJQVoJzl4wtK/H
         kwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153970; x=1781758770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=gqwbsjij8jIJM6lpnJ3eA1C0Dvto7YeSDMyOKF3GUSC5s40U/WjvT7h0cG/7rrcFN6
         g/uyo+xxK635b3VQLYSL3LcKC2auqNJpgjtLf8MUhb43iY1P1uJip9iO447zPiZBT2tK
         31nVjSghseS/QfHxmA/hEyoMANHBpshIvxSMLg0KiyYwYDa796FJ/geas/lU+XCMWrCM
         yUkAI1uZfRw1u2he4j2aIGWuYiXnqECFV53FxHMqwhus3INt27edVEwActgKCOodeesF
         Qi38Yw1HgH4/MwZYNh6Dfd/0pJAQfUSg94p20KEO3e2z9bDZNhoxREt6un9XC/T4A+dK
         18fA==
X-Gm-Message-State: AOJu0Yx0ki8iyPqmHoFD8rkdP1KRgxDE6DU2tx1grsTE9OFk6lDJutCf
	2sKeZ9P8Ei6xMCBWRsb/kRXH/WFu/gk+iMp/E7pSv/UfErWLJ3nGSFkw+P2v0VGSwWmAM3hMv4X
	doWSgigLt0dMb3Iw8NJ5u/kG1OlxwH2bsVm8AWCvUd+1Z3enMb3pdzX71HYya/JeQ2wxh7snPn+
	Y8
X-Gm-Gg: Acq92OGA53vD0Nm/8WjGpc545++1bQOulWvqUCtYw/F0Sy1IlL2GSkjH4/uW5GDgQFN
	77NhSbedUPkETeXecQDbhxsx79D/1XlM3W1g5+8MSF4U2aLvOTiUbpM38egNVGhC9ew1l7QMHZr
	GPxZWieEZskVQohYW3rZkRDmFj/AzQDi9ATLTZhAX7QiS9vvUjHzqWIL9BNLAcgrXAOK17ryz+S
	Xfus/viQaA1okcNy6L6kcTIHcs8G1hsC/TFV/CdkyV8GU1OqKgVrpeBsBnsPulBPDsVl/PeX5dp
	TN2ua2lHVpnWOsu4uPtWhzHw7vkGc7kxyA4qWlglLbSAjgyBJgSsrvUw38rylphYLuTi/3jDhlG
	1lINUNlf5ZXfOoovDm97dWGsa+ZaAid/YyAvdaksWk3w8YB/FmOV9BG4OXRlMwKfe/i4=
X-Received: by 2002:a17:903:247:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c2f09323a8mr13063275ad.15.1781153970226;
        Wed, 10 Jun 2026 21:59:30 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c2f09323a8mr13063045ad.15.1781153969810;
        Wed, 10 Jun 2026 21:59:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:45 +0530
Subject: [PATCH v2 09/37] arm64: dts: qcom: sm8550: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-9-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
 b=3GD5k+588Uv+wL91q08mxwgXUGuPN9Qo9AC4/idKOPkk+CW8nkhucZ1KmRfJag0iLXFb6tp1B
 WipfYPoXUoCAlV6NA0WqbmEh5xmKI4VAvZj63YWp/XRWD1NPyQ0HGCE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXw6LN1VvqMcey
 +Iu5Wpk4GzuWXky0fqA1iSvy2mCoeVLlz4A3eGpG/H1rN1L+x1UFivouUi95KGxlnS9J8VhT6EX
 KPpOzhyP6wwvtTJ0npL7/mVB/rJkksQ=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40b3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX79IfW1fgr/23
 lP2JrQ9zYoLEmppnrcz6v/kEHGvZY7CZr/82E6uQnndvAB1irwofYf3scZUOitftWBOWkyaEqTv
 Bwub5q0p/ksUa0bgElH7ZURfSmhgHUls+CI1UQt+eD7luHi7xSeyyiNVJYieqjFG34BiHUFtXlp
 sUBKxxqxozDtmpRJqv4Bdn2XBYjH46A+ujUaFDtRKynQSWhNh2qtHF04IpffpnDlKRRlKbRq4Xy
 E3c3XAfOXSH0vpbSLAVngoymrcobA71BtdE/1t/YVC1VuVGk396nkGeSfBDzwt/96z8LAUjmsE9
 kuxDbETnqtnAtJuuKI3e54FJZVrXD05/L3ENVoFKEiY3NV5YtHRLKrhh1xGGE3z3iE2L7niPpN1
 bphkkYziPUs662PZM6aNjbsjXaVz34bj0b4+hR4IrGWwhBMoOSQuIKJLYCA7Tu+tRFGs7LQnqXO
 RdTQz1wqp6zm2Cl3rQw==
X-Proofpoint-GUID: hjd1ejbPBpPzplbkqjnBbrFwpWtCiZ6E
X-Proofpoint-ORIG-GUID: hjd1ejbPBpPzplbkqjnBbrFwpWtCiZ6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112586-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56AF566E791

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ebb643203b..5eb4626c6129 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -336,7 +336,7 @@ &mdss_dsi0_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -349,7 +349,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..4709eb34521d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1037,7 +1037,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5769be83cfbd..7703ebfc1b67 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,7 +739,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -756,7 +756,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..5ce81ac3ab4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,7 +903,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..cf4e4e9d9e26 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,7 +510,7 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 0e6ed6fce614..d23fe714bd27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,7 +584,7 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


