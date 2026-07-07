Return-Path: <linux-arm-msm+bounces-117137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OJOgL2GWTGqtmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:02:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4109717B6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MtRRBHq2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YsqDTELc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D791730417BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69D8387596;
	Tue,  7 Jul 2026 06:01:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40801386C2C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:01:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404069; cv=none; b=ezOeE3pZgleZW1ulscUF94VvyD93GxDHuPcbwzjgqI1wjLVHOwZucmHspfbHkDq5NsScIV1vxfUU1Qde1QMb9GQbS8eLCtYo6h8HxpW+25MSJixwuCe6neQxWOzFK5TS1SBMSfph5mQfyjOgp0YiwcZPgsomBmG0UvfGJDveY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404069; c=relaxed/simple;
	bh=JQA+v1EfIB+ku2V2nhFxmDsNU3E92/C24KpbpGghiOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVVMER9R8bky4Q76TGmHqEyc87zDsl1WMQ8+9Dr9+ad25gKL1ur1jv9NFAbiYOeFttnbclysBaJ5Dj22kB6w2keA8U8jGUqPX1dlN/6DRBft2gzBMyievEemmy4wLsSena6Tuls8mvkfMXsH5mtfoMW4LMGWiJxm+LeVeN67jvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtRRBHq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsqDTELc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Mhb2658552
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=; b=MtRRBHq2G1lt2pn5
	bPkRbjJSdjThiuQju2XYKSgUEI2hvGpx/offrXUfcHO2c2y8VPyyL8XVkAZgpmRr
	b5TapPga5E4Z/1ncJvbJPj6k8K51O+Nb5QmNtHZWZw1w6liLeUxh1nGsl6J7hNI3
	lMi7Yqg4SYLu+pWruOhAN1VY8p/Zl4F2qB+B9YCMGelkF9absdAq5S7atax/GgcJ
	xmKE0Podl3tfD96HSRPKBTh1gaUo3RcIamMOQHglp+nEEOBLbZaNoy/v/jPz5Q0i
	pcw6BXw04Q7aNgxH8M79mDtoHptUOoSZwI3D3bGTzWIagLgFeOnzXvItOw4316pn
	yQH2nw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r4av5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:01:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso3476167a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404066; x=1784008866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=YsqDTELckM8sbsz49ju+zkuJ/0VmzxcMn2NIKZwA2xqJ9WxKIgRPHuimt+2mmyjYvb
         E8hGlaOexFQlg3GCQUjjNG6bsEGCYkZszUwFHykSGwfO52ScY/c7DVLunPAlZugwMVUC
         BAnsmko8Qsb1mNxPYlLM2iWAfKVFpS4H0uXhmHJ4doniTCJt/hVuvOj9I90fQy58NKtt
         fu2yvcT4aareRhvRCK9wwJGlmkwAmlrhaqzhnBm4a5f7RGdLZSbUgR/7H1K0Oi0Tasm8
         6XfDZbhXorB3J8xlSAR9jK2cLpIDrx6BwVhYt5SPpXJcQLhXsImwQrZ0CGdFL/VLiFBS
         1kPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404066; x=1784008866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=Vyt89sfrFi7pwpiACXdMUSjICS1d0kFxKfqsFscv5YNdqH2uAY4ACuyWQ04CsadJJo
         gIXkoSuR+869ZXS7jF0Y7YUwGT5Q70vWiHLhE1l8GpSV74GaloYXjWi3ReLBmYCZ9NxC
         nVuqmqlYnbum9YPdk8gMudLoE46ETGEBBvtQ24vyoIeyyjCQygQ2qV3bj4EaZfa/pjdK
         OhKdCKsBmBWjzMK87fa1WxPIpK+PCV51CXdcbPfMytBZgIsphxfdoDDIhPi6GXARmQdw
         Ak+Ik0nASCn0BhhTtqvtjTN3ceH3LF+Jf+tZx2U+oPgSSJvIQzSNkjA40II9pC3f+CZb
         DCOQ==
X-Gm-Message-State: AOJu0Yxi1JDrtEuMUrL5mZrN78HXvMKRoH7EV/H1vNOjuaIjk3J+xHJw
	Cisa/sbpXk6RG4RpAUjgPwmAPvjrEZrnKI2+A6MYNxUdyI5M52onA+C+iduse2cvqjJHb5rccRG
	guG+9HRLlTYk54PC7vipUAZPMiPfDFwoNssejvVaKwX6uDz/S+8fEwoGBW5pFtN2urt3a2p0epI
	Ts
X-Gm-Gg: AfdE7cm+4T7ynOvSUYucOk6aQHc8O1hMM7Omkc8HqBeDaqJ9a2YAVbcexk43ryoGa3D
	FSJPggyNhBjGtqzkroF38XSROYF1DZY26Y6+7bzRCJEAPCWCcQOjGw8pIIULGDrJBJOyoOnb1Df
	SsxbSaH7+zUqG2OK4lO94ucfS9OEZQlazmm/HYLz0rfmJkJF3mR+Dg40bBXiJNGcTQOj3Vr5bn2
	Ouu5D0k6McXCX+40FWY7IaN4d78xQqD9Omxn9dOFZQ1kTKCdeWoHEpp+OiSOAm/MqPjw2zEsdRF
	JBVzJvD5guRGHQ6MRm1Rwyr8MHf0bDbRgRdwxO6Je8YY8WQG2gBYlK89VlnQQB3Ifqtiji/Uu1D
	yvRsvZ4SUXidrUqbUREeS8mU0+7qBPvQYY/CZyhhuskbvjll+7VJFpIKZp9xmT1y2UMD+JqOKHd
	dtEbNBKRgUGUwT7WFdhbcD4IV9FG5riBnxLJeKu7T2
X-Received: by 2002:a05:6a21:487:b0:3c0:9c1a:8947 with SMTP id adf61e73a8af0-3c09c1a9c54mr1947410637.63.1783404066142;
        Mon, 06 Jul 2026 23:01:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:487:b0:3c0:9c1a:8947 with SMTP id adf61e73a8af0-3c09c1a9c54mr1947337637.63.1783404065629;
        Mon, 06 Jul 2026 23:01:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm4105919eec.15.2026.07.06.23.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:01:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:30:44 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-08-dts-v1-2-fce82e14cd1d@oss.qualcomm.com>
References: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
In-Reply-To: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfX1B27pLMuyEGd
 xc+Ep7UPMbxurp2vdq8Ys3EqQDd4pCx4aEVuY4QPqvDWiTjtg7vC9oba2r09ZFvw7H3GQAUzrwD
 GppQ9UNjtzZvTQYyNbB5zcRp7goo+Cs164MJJok8hEyGL61eo55dVin6FcQYRZsU3ojuBn4d4yT
 4pRD7icW+gkdMRcv4ci5Ia0q3BO94gaHIBIzOlBmgQpBKJgh60a96wKNIzUSG0g7MZUTymg7doC
 6qA84fWBZLzJ2lw8+fY9Pk/tCaYphMNue+RCcLFsO8a6W72WujXVYBRIoNPjs8ASgEY/6WTfXHr
 Er4Gv2GmhR4BZmpfWk+mlvp5wQ+HYJjZhQzu39QJvRkTwaSwDkI2wQjYyrnU65gRFE3jqH3EhZc
 bWkhqpopN6CGGpq5C/jRVGG2RAVMP1MxhnuNoSLqdRr8eFJVvd6dPO+q9+hcAB62ATHlCmcPIrM
 DtUhjGIOZC/kED81guw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfXyQZv/44RC0OT
 pIMq+gxlpP9eW4ozb26FpFPBJNjK6o6/TU1XHeq1zJa8KI2EmDIhDUDtmHaCxN35jTGS1yN5JZV
 GWiankLbdHFPdwgYmsL60dqoEuakxkg=
X-Proofpoint-GUID: XtlyBe8h8NyT7QU-MVhPvQpJg9V0Emup
X-Proofpoint-ORIG-GUID: XtlyBe8h8NyT7QU-MVhPvQpJg9V0Emup
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c9623 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WPSE4gBbNDprgx3kWUIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4109717B6A

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Hence add the NAND node but do not enable it.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..c47e18eabc98 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -18,6 +19,88 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
 };
 
 &sdhc {
@@ -35,7 +118,51 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
 &tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
@@ -74,6 +201,10 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };

-- 
2.34.1


