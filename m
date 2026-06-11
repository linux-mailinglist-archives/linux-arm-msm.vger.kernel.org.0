Return-Path: <linux-arm-msm+bounces-112584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bjGSDvhCKmp0lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF666E65D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JRG/i9Ss";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aB+juEo+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112584-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112584-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC45632D4A97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8925637204A;
	Thu, 11 Jun 2026 04:59:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D3360EDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153974; cv=none; b=qNffQrL7SmmVVZYLJf8LBOI6KfCNCMEii3+sKgXL713FcmruRggpXhnMnfuchBbYPK98V8V7vHa1Zo5VxsWnAtd8fX2l5eOaWg5GRK0C7yL0EFHK0xBS+B18JFTwFPQOkAfR4AYy161sPP27dQgq4HZFX3LamcXLwGqzXFhMX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153974; c=relaxed/simple;
	bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nfg5H6hKe7LgxekBlMtevrdRH3TXvjThCGNxd80nHSX8Rwar9kstge157RQFnYDWUDYSl+OHHHu2L2IskWwOtOFQp1c63h2+ZwUH0kznshm8FyfCVnULwDnfnA/qVlPOd/nFQ1OHD9sePnVPerJd+wnpjw/zJ36np/ufK2ND1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRG/i9Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB+juEo+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0O0e83184235
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=; b=JRG/i9Ss0cdiY2bG
	0d6pPaEFwP8aVRJd1kokBWl21bJR4NlChp4ZX60g6yPRDoVuNPrJtNgvRGC2iWjY
	4on8EjdFCxXdg9kcEvMCrD80jai5fjroOCfeJu+fHu+KtRuOfHhR7shuEdcDAkx4
	RGfYLm7eK5bhYmYOHROs87CZV5K7H7h3mJIhFTb3QWSjFfvLmB2pmfIFNFQzaP9E
	c27NcsGXFJ2xeY0kER6kqqshNcqOxdJY24lwdq+kf0OT0XJLHfbbtoojMyjxbwng
	muguK1BnTmMUBHholUU+vg62L7aouh1hy2Ub1TXcWoTQpdT2FwJLxdZpWQUeGEt1
	BrXHJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1njq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso12271035ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153962; x=1781758762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=aB+juEo+3twLYkR7HY5p7ykFqI4XqSZoEMAU4ziLlhv6vRSL0g0vgcm/+Rjz9SgMf+
         xTe1aULKb0f/GlBOd31hhUnubS/kihiDNq/fTLqwRR2tmBSIlhsMnnx59zlMyv+KOLow
         Rg9qE5h5+qH6AgWrN4PgxF2Yuq2qlSn0dhHZ4SOklAYGl5L911ymvzemEmj0m1rzAmqA
         2O9G4/Wfdpv1bRYAaqJHnhDdc2XiJWX313XtFSrw4j0KP9V5JV/nl2A+LnbZzUlWXFfC
         Hqx2u19Ly0XcaXlSN7V57yhLlJRcojsP9LBi57qp0iBjNl6mZdC7dDisjoibWESzqvNA
         NPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153962; x=1781758762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=ji88R3AeRh/P/ycayNRo7o872Mqq9jt9k6MlFI/G9jbdz/116amlChxOVfPIoYXG+M
         fi9S4OCt+A5m02pz6WZUPKgRJNc9R/4xC78VM4k2YruAS/7R5byTtKu41Bga/x/RjrT3
         yLDH6tzDWqPZN82dG2xb0b//T5L6g6kB9+wSeVZ9seadTR0iHQdwWaMAnRqkxPADnU8x
         jF855JZfcfBVHI1S5mE18RWs325UhiWrYWvj8tgYQHD8icFYk294Xspq187BOxu7tE+O
         7uGITambSGkIdRM8n23FwX9UfOcuy+pns8l4KAWuatk4iz2LQZ4MBK5aZQvqAgQ9IKfa
         Fszw==
X-Gm-Message-State: AOJu0YwIwUzjUCdb31MDNafm4u1ssuq7/W/McUr/Oqev0dh3JF7iwrl4
	r9vs6hjUNM2xQr7e9z2PnAY8EViLMVeiaGKONc5EGHYDugFxYa7jrobYNDA0+VFa8aZgFGDubMe
	VlAAVLoIchAcQ1pxJvNw1klm99EAgZbKngGaep9JFstKc9ue1yvjMv3bk+FNjvlHXG1cHsyH6Yh
	oe
X-Gm-Gg: Acq92OHEqvyhQdJWR1TX+RKsxMiReNMzw+xf7VRFrxpz6gh6e7lJAwO3DIr174B3KAE
	KIUzsl26q56r+U2BW2Tp6RMcbYLVAMlRTmrwvUHZxVblWS/FasePuxMOcYiYnNVLA/LB+V1JTKY
	MVA56RTCIVlF3cmYSblqYwOOMhbuLv8r1IcVjijeFnMiCn3b7l6uyPjtP7c90AB9n2QyLm/j+X+
	V5WBUdjoA/RuDg/SAHNzLZHoK0ERNmVdHqz2N4Nkyu0GMDhH5H/sXVsq/bVQsmBKDmqQCpfsc9Z
	rWAWuEu1SGFYffkI1ZEGc+a1DvWqeKChKiU6XE8DIs6IJ23EFzCnhKi5GsQIjM+VKLlYs9WTxPG
	/QP88opUMNA+aDh2IVUDsBBbRmOyXwjuy7PrXkzIVJXGSLj5X7Ye79fPICsBl1tXjjYo=
X-Received: by 2002:a17:903:2f04:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2f024e464mr14431675ad.9.1781153962096;
        Wed, 10 Jun 2026 21:59:22 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2f024e464mr14431405ad.9.1781153961709;
        Wed, 10 Jun 2026 21:59:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:43 +0530
Subject: [PATCH v2 07/37] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-7-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
 b=daBMvekOqyq0+bomyJ8cqwhEwCMJyrzpy7rI6eIrkR4hT8fgOVOBUogyNzUhYHVBGrNkM7CfX
 mChdYrPebv1CbUlUa43WUCGBorADCNqr5wmITHK/K1OfM5TW2DtL6RY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 8WB2gC2XHATYyNoT5dTZFJc9fMdX0d3a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX46kRMzN/mlML
 ERJR42ck5j1zBZUDmUFH1YzoIr1pqjKJ5yPKEdU8ss1rc2lpQk+P7Qu5QWndJXltXgO2jqhjnby
 Gab0k4eE4nFkbGAj5dXP2C0hucDeN9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyr9NyQjXB61L
 FX+wIIgSCciNMDhMxV5aQQc6Fwmom6aWVBOF2lYmcnM6SjTZhR8gNdIbEwnEocOdR7uDuKan+BQ
 bNCto6sg5ho270iqE6Ffs8MydwEscWKWtcZj9yUjFUH8746q7k7zx6jD5jD8PUVQDdXEqpYMEFV
 X+WOOd4MUmPdD71tstm+rQ2/88lacQUsBxXjr6JhVO+vk1Bu4sfb3gtNWNNoZEvCxmT1UyZ8EgQ
 SG2HLArMzJ/xz/t5WOII+P39adrQSjksQqXC6tVrWXalY47yoBdiA8Ic7yyOSxDsHLE5QpSUvl4
 FwtV7qVRSnVvIkbg9AJTUwBmJkU5pccKjHELUzN5xNm17b/WEpUpTmAh5ytJ1LvwIJp4h3kccFo
 waRG6yoArwcwg1eE5gJcRUDlrQ2b9BTKIzWe6cGzr1Sl0yNw8W+3CvVWUnWEqydmZm+vfxr+Ngl
 Z2780thORojOTuiOMiw==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40aa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8WB2gC2XHATYyNoT5dTZFJc9fMdX0d3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112584-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76EF666E65D

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..0897ed1bbc6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -494,7 +494,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -508,7 +508,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


