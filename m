Return-Path: <linux-arm-msm+bounces-115605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iw3qKKvORGrI1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:24:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C286EB0E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:24:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e5lNQB5O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=daYD7YwH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21134303DAE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9464A3B9920;
	Wed,  1 Jul 2026 08:19:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0A3A48D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:19:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893971; cv=none; b=IW5XleyxKHgNNZ8rxsz6AluTX1B2FvgDyXI/CXHdCy/YlmqCJs3vtsmqyTO0qPM0TYEf45/KO9nnIVXGW4gTpbFIblfLg+bpiy/ISr7KE25g7fptmiaJAPaLsu8AOLx92hggVemhN6eOTCW79rWDPDJjYhx18PXjISvdJ4nshYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893971; c=relaxed/simple;
	bh=zOe0PoFB06W7bv+xQ3kS6/KxYjU1YURvZ/8yB9Exrfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rq29/kJIfQWzlqqpJNmoQn9WsaiEAyy/tuh6R4874ODb1uBOuu82od5e6Dwy/Yj1xg2nPFcHq2gP/qHO37kRjml8zp9roWUt1sEW/c6xtTyk4BC9yUETcou64pon4S/F+BJOlCVsWzXDDBbMui5+dMdEJAPuEf0egS/k7ZgNF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5lNQB5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daYD7YwH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2tT456045
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YmmDw2gQT6d
	hJFOum3rKwnU0UrognhoNf14V4BrZFI0=; b=e5lNQB5Os8bT3jvGWecXQFo6roZ
	jrI1n7Ivb3UkXObypUNcUBJe5FBEzaaIL5CpdptLVCWAPc9633LSQouzI/6DwFRD
	rIUW91o3Inih45OBC9+S78i3Y01vjPK4aPFFmk32zxZT3oy64G1VwBwgICORHo5f
	XhANqkwHzmWR0sYlJjzyEeMGHWaAlRcnOuMqGoCVBNfWcSeniKyTcHXm5i14rP2K
	b/PG6yxQQ3I/0nrlrXicGArNY60mJpNKWrKHWHElEgJYG1QYSQQyG1w14NQukfkx
	CWEuLe9lg4FSbmsH1r6KyUQIlIWpO6+ywwly6kHzEBkBnbiJSY/mtUF+qjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwayh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:19:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f3e4728so399092b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893968; x=1783498768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmmDw2gQT6dhJFOum3rKwnU0UrognhoNf14V4BrZFI0=;
        b=daYD7YwHxcoCfzZX4joONYMQqW8ILbirs8q/zTpZ8abCuLXOU/vPI6RryqGYXU12h6
         UR3+awV+jB/VIPN+ina5XFoFkMjDXsck4V1moX/g3DkDWVKT5bqAGORXXRP0AO+mjxOZ
         xWMiLPPsfUr5Amhgt83UrWsGo9c36+tGH5IZ9JrqcZm4BqmwdA5vznRCXtr+BcNtbTod
         jGa2BMbTcXHfHdD13+FShA0Px62Hb2Bp5TUHJB1iHrWtkVCT6DitAc1z9gFn11vbfTTZ
         bMvE20a1YEcimQJEJ0KngeLuPWEdKCtGk7eD4C2qh7RsFvnRbO6iv4OhOb9PFOo8v3jS
         XJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893968; x=1783498768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YmmDw2gQT6dhJFOum3rKwnU0UrognhoNf14V4BrZFI0=;
        b=H4zYdQxF0A54J499ZUqToHHG3dp1d/Hr/MEnKmdURzjp5uO73Bg8SLiryIaH0G+8tA
         YL4mdJXq++WHjU//9YY1+TYT0zVjHyrRFFQ8Hp+eTbN+cIEXnJM7B+HBTdi1JWB+f6YW
         ztVS8At3bIt/tQ+C0QY0FC0EqajI8IFVPuDNJynheigbXg7a2iYwptZXlAHpHeATUe6m
         ITugJnX7axs0lXEcHEpSZKl+/VGPv/evbaGRRuZtndxyN0lNQRzoufd1cyg9AIHQNv4Y
         8xAuv+L0SrOtqeNCd8Tt1O23UwbN+tNqtG0dvEzRM9+F9IfBeBBX0VJzy/3me05QHm7n
         DvSQ==
X-Gm-Message-State: AOJu0YzueK0zbjaGc3cPD5qKMaYRpxI6Lla9tPoFkCLUm8iuUknk1Sah
	XCJlUG5afean1c9JRc20MmHSbkgAJMZpQvATzWu5t9vDKMdLhv0fRo3pXdqMoGq6Q/47duduON8
	7RJrQ+4wAAdEgzhXoyYhMwYKM4U/K4su7K1SoNlJm787ub15imI4obj69ayPEmLt3T4nA
X-Gm-Gg: AfdE7cny6rPCGAmPycSGjbe9SjtPDV/sLobZwDCG5TFJTyEn5BqP1ejdOCr7ZuAMwIX
	4p7+11xQiAbyH1hbJ8BbyTM2kT/WCYRh6fN6wTjD++2R7PKZHWG2iAz3s/KS2c5RXaS4CISwWVJ
	HLaYnuChITWjyV/PSn5uPw1vxGUQt6M5WaG6BaqbIOYUuPN/fNiPqnyiM9z/arMj1LHXlLuv+cu
	lvB9g/6ChDNu0ypcbLn7fGLeDVbpK7KqMHBenxuj9XL/DE+cAXL+1H2COkYu2GmJFUuQXG4w/rn
	4tP3E1Qd4Z8egy2oTTb44r20XBY6pj6IJdCIz/hI72rqgOsZghV48M/DtXDTSphA2sjf5mChfbw
	v35cul2ugbC8chfr3x8VRtkMuXPeJguFq/G8DS+BxWjCS5g==
X-Received: by 2002:a05:6a00:3685:b0:846:2f3c:3f66 with SMTP id d2e1a72fcca58-847c099c281mr521765b3a.60.1782893967564;
        Wed, 01 Jul 2026 01:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3685:b0:846:2f3c:3f66 with SMTP id d2e1a72fcca58-847c099c281mr521728b3a.60.1782893967018;
        Wed, 01 Jul 2026 01:19:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Wed,  1 Jul 2026 13:47:13 +0530
Message-Id: <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AnymjOmF0rgZmvkK25-SsAhTPXKDFnEL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX8K9MLMnaZtW/
 C+1kdz5SUpA+20icvYx1e0rRmiGzbFTy9fmTMHAUAXdQp6N/j934wrt+/xUuNpkBNs90gDXwRWN
 VSkRTQDIoQ2LOoR1v8muCJwi1iwQUDg=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44cd90 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: AnymjOmF0rgZmvkK25-SsAhTPXKDFnEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfXyRAx9LsO7vzo
 67/ej6WKT7PW5ciJau0WTn3zvag0HP7dIbgOjt0Ym1nDfsy79+5s9SGdb8vuUXSEyH6XEcSPovo
 p+uQjjRI9/Nipd8as5C2SU9fNoE5GpAAahN8WF6u8UPhyuuZE3xcJniBQCmTmslleKu1RfIgR1l
 3zYQkKJFXsdjEEL0U7PfFHAIPfac/FoTquIhes+ec6n9GWSrl2rx5Fo1CX6JkVGhhvCMqCF+xiP
 pah9vjWP4MOYrWpuOQzxq5Tdmj3FF78TPJCFs9KCwqSyG5P7HEmfk93ayMg9pQBL9oMkbbtDNw6
 zSP3PdvLn58jblrwWlx+pjcPFqKA5NUtXluFq0AkBtWzwYjSCCnn5NHVUV9T7aMa5QUEBbto33s
 AGUm04pxz/tKNVRfSBC9sJUCtH06sbPcLdghxX96nG6lm9dBy5zJicUSuNIsBr3a+S1ButI8otP
 hhMSGYzFDTfmHX4jW+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C286EB0E2

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..6b146fdd6ebc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..e82cba350842 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4832,7 +4832,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1


