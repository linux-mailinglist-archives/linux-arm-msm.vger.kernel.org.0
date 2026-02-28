Return-Path: <linux-arm-msm+bounces-94597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGtsKAbpomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:09:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAF1C3242
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88FE630F8532
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655B343E499;
	Sat, 28 Feb 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkHbKbcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsY+FJVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95339A803
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284100; cv=none; b=RBIkw457YJCPf0yoE0E3NNo7uSTBFU4RYejv85ncP5Ec0yk3fQClxELkbuiXZKeoI6TOMKYvkb3b/WS5iw1RJ/O2efoLxwyN8TNv6UYisqQdIV2Kp/UyuMOuDJCwm9Z0awIwOAY285udLw5P8zt/zwRyLgeM9YuxugHamapF4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284100; c=relaxed/simple;
	bh=QYBFbOz9TiMQxoHQtRM5/kLIez9/KH1TUS2fZ8GLZp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCdt5HbA5Tfgvmy1HRES9jfAw1n9PN6MJoOP30SfEvk4M6XVKFXI4adDh2AlaY1+HHwD7BB27gUE6WXiiCBz7iCBB+pz7CDggVJEnp83vaBNz57vFk4EZ4s3AO0qF0iFW47PLLGHlJcClksjFP8N7/sQMlU0T3W6wLBskkAS3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkHbKbcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsY+FJVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90Ais2128402
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOs9PR2qqOHj15q9IFPpGhkkcvSZeAVnHLJV93pHR3Y=; b=JkHbKbcGqMJp/t6o
	z0sLFDUFCQwG2RG7PxXhXJU7eX9u6kS3trNATgbh8G3L6fjqLkUpAmMNL1WC8AXF
	wbO+/RXz8n6RhYK1Zo3IcvX9Eb2U5TkGSo4gNE/DEsxHLW1HrGlT7/GF7t1sCAo2
	4WbGxVkeIJwOBHusfirmsZyMCjwGMolJUwAIDfIbqsZVoDGLTi9Rqd7lyYfgv0Kq
	Ss83jHoVttj9CwrrvPYdUSoQJ99ctk+fZeEPX5GHntv1z7/l20VKMdUDpJHyiths
	GbezJm2Y+nFp+/H855Lr1gV5+xM9wSl0l7L5jol26XSKSoWx8gQdlhnExlcj/Rom
	c9fPZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq0y7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2254007a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772284098; x=1772888898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOs9PR2qqOHj15q9IFPpGhkkcvSZeAVnHLJV93pHR3Y=;
        b=fsY+FJVfWxJ3/XCzPPsyORhUTnhDtzgpzhPi8HpBZi5quo3wKIFN6dbxjhJRK+nMEf
         OE9ruAFXwBJGr3YhCvhhhRobeyZ1ZNKdLKmViv9c0qWx4YNxMWJbPeNb13U4GvWwr/rN
         yWriB1Jo0jw6aB22khuYMbwPEGxl5Tg5j3aDVHAczauhAix6KagyX6EOakDofdEdopbS
         zoLrafG96xWXhLXIqcwwzpdJD6obiRFkYpGURu2GKAIWPwfWlnguu+sCN8PXate5+sPQ
         lkaDdW0dLqBOw2Cn1CmFyPxPduVE+9r7Vetxd0dKENg0ZJ9egHPKKF2znMhz4eamH7Pa
         72sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284098; x=1772888898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOs9PR2qqOHj15q9IFPpGhkkcvSZeAVnHLJV93pHR3Y=;
        b=ghqJbk9u0yCdtQyGbz3FP5Iv29mLIvVmjw5frf4ug2nAauuNcY/tv1cbbTJJd0OVSw
         tG+qyS9jUPo47ARakeXSc3WJj2DtlN3mo5DnTEo3nPk18NCDnF44O9uK8iqEySEv4gOU
         jHXf9OQxjCtCgopEVI/EDVvNCxoagWrNlbPKNmMDzpbXgaUv/QvkYIGI33XjbZenel3M
         R0gph6YIdDKa+0lVwsuSupHEuVErIyyxdxg5wmZsaIabqC+lg+LBB5OTKq8nDwZQwxjU
         8L5QUhsmx7iDYNaA49UyJn1KMS2flBDaLtHy/odOBNOaBjAKkUlD7l8Jo2KYcCLCwLZO
         8f+g==
X-Forwarded-Encrypted: i=1; AJvYcCWWy3Q2ojNeMdUd5c3k9zReSRQIhiuH8z/s7XLZyUL+W6K54lXOydJg74lZDYTl6tqhPOukS/5PtuLq/ao6@vger.kernel.org
X-Gm-Message-State: AOJu0YxOtmCnmRW5KjncRErxuiY4DhGwn2EjB6gCtC6smFRzDIIQoCzq
	qRWHymm36DQeEQy0FF6FKaagXxDu3EWBfugIQ7k8T+v7lqWXerDg5Aecf2ylQXHl0sn3p6ONpFj
	BAl2IK53hNH+O/8KDxa3mct0loEPU173eUd6lf5rY3jXJyF7lHjtrWl67f3I29rIJM8Ib
X-Gm-Gg: ATEYQzzEuBPqWkNWT71GRbNGDjOIcQ/9UhqvzK0MZ9S/YBhgKsOjRDdba9ogddzgjTE
	w0YIoBJ8Mmi4OiZsPejVRd5YOUC2DAWG/K4pBD8zy1R2KHFRuihMUgJ36xVJgxMLXWJQzemH3h2
	rkzj50IqiEHzsPtBBcd+Ct+4ViahZaUlQUmBZKO3gTt3+VLUbJDeBGdhDciwBCaF5iupUhBXUrF
	9pkVGMQKv5oCPsMR2nSrZ4/7nar+fhA+CHxlGw1I0l5ygfwnRj4dtvfnimVHToXIz8VMpi4/yj1
	9CVGXMD9uIFm+zkaCzGm3aPVshmJXSzf5QAppej95GeuWL4Zd6+b5MHMebxtJVBmz1cKezQGE0V
	Qlj8MWGlV1+BjbTz+KycY2IRZSuCrlLPvEqsiSa2cjcPq1SEHiHEH1C59lgwhXI7YjIzeJlMRmk
	5aCzvoJXi+Y+t7BU8ARmlA8Y6p+M1NZWUMvAziBLRYdpT8HqgILwltQ76f
X-Received: by 2002:a17:903:2c0e:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2adf779a7e4mr104157715ad.0.1772284097782;
        Sat, 28 Feb 2026 05:08:17 -0800 (PST)
X-Received: by 2002:a17:903:2c0e:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2adf779a7e4mr104157485ad.0.1772284097334;
        Sat, 28 Feb 2026 05:08:17 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm83947035ad.50.2026.02.28.05.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:08:17 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 18:38:02 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: ipq6018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-imem-v3-3-20fbcc1a9404@oss.qualcomm.com>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
In-Reply-To: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772284083; l=1215;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=QYBFbOz9TiMQxoHQtRM5/kLIez9/KH1TUS2fZ8GLZp0=;
 b=L4J13fODHMSDcDjw9bFyfBmLBlvTVCcHiMRSghuWlInx2nuTxjFcwTkt64uYvR75+ZrCOPBac
 51kH33ZhdtiAancYjOnJhGM2G7SV79NCYXY7Fge1e0XmiuKd8mGKHQu
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: V3b7z-lA3uhkKmfB_WKNv6-2p8QGvr4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX4zFnFlMeGuX4
 5Mj9Z2DUCTjyHTmqkBk0WI5ZuDc+mK/cytsJ23uJyAByXGCbqFBZxKg9DGutCM5tgXxMPVCVg4q
 C5KkitgdzrsIuqJ4GcdxzRGzPWHl15NxRJ0x9qFL+cQGDCsBxNEt33dNrT291fKDUzGFj6zvCX1
 dHRvi08xA/9u4lJowDtwDCzI16Y5VInriQIMsBrELbm8ddWeuWpCuSz2TaA3x7N5EL7TKVpnsnF
 EJyiTHK8yKigMFleyenwnozBJ75VNCkhgFU8/Gv2WYfwSDcSsTLFoeewiqnlY2l8pi15f12Ajng
 XIQsoqO5fTD1CFSUDZ5fjWa3z9FzZSJB9ReTDkiyhda2rQWjEw9DBLxnvwChezuikD7NYgjTyun
 GQvcNpyv7UIwMp+5MOCJ2STtrDxsyosSYQpnQX7q2jvbuOB+uRsnkIwCebvyENSdrnebfRAkOf1
 m1IjeuhVnGdPnfhuPag==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a2e8c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kuyrhOGAXNEpbtS0LE4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: V3b7z-lA3uhkKmfB_WKNv6-2p8QGvr4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,8af8800:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,79b0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.131.57.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94597-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00CAF1C3242
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 40f1c262126eff3761430a47472b52d27f961040..7d6f1821fcc8809c643ce974380b02828b438b90 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -659,6 +659,17 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq6018-imem", "mmio-sram";
+			reg = <0x0 0x08600000 0x0 0x8000>;
+			ranges = <0 0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
 			reg = <0x0 0x08af8800 0x0 0x400>;

-- 
2.34.1


