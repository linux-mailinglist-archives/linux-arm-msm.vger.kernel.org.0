Return-Path: <linux-arm-msm+bounces-91593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF67B4qQgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4062D4FCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71F29304AC08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BA136B04D;
	Tue,  3 Feb 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OES8Hmhp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHv724sA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91736BCEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098797; cv=none; b=WLnn4CeS0+wWleIdbBHgdhVvCr6MFyhcLwHW0nJWXS5gaKf8y/wkQu+cmjyFWH40JPVzcq9BMpy4mlMlwuEXQCRm+ceWV5SeyXgJdztGpT73hwNEUZHTCsGdZJXnFDpmykKmllIT266xaK/haI6XleVXw1d0BPXXqsYwmLzj87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098797; c=relaxed/simple;
	bh=QeXv5QhcjW9e3PGF26jUwAAbWZlI9ybpYMc7vtWT8Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogaecXFHs28wsUYwaeo1X52zQJga5NgSCsfDLid2OVZDXPXoWSKBbzJPPbHUzOWPPb4D/G422F5EuenHPBmm1ydUq5AohZ0G2ubCf2CaDIDnxJTrdLDO4VuT+fH/bVu3kl9/f4K+DcmOHMNZJ0zha1pK19YETZArIpyFy39o45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OES8Hmhp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHv724sA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JTaYu3459128
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=; b=OES8Hmhpm44yDl9P
	wuAOrCqAOJFq5IFjLGdBzcBXcncnzRSaOT2n03k7OhIcITjrob3JzfX0G/mIevhO
	SIO1ipxbUvhBruu1Bpuw0YbHaPEKo85U7WGlgy+gsbs3n3Ync2aGyL4RkAvaQz9h
	xa0zhvAsjqiyEpG3QzIh2OjuCbkfUrRS6mynI4A1IOQHZNaTdBV6Ug6n1YHjk+eh
	zHjeumuJCIe6lGtnJbdnLQ22ga8L4w/EvwrQZ8iC5cpGLUu8xc1xBNKIuCrLA5Y3
	PQl1Wf54gwXPBq1nxd8TltlXpLDpDZVGe1G+v5lYvkKnR6xsR5KOSH01Lruc4QsJ
	HNalcQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbk308-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b715b26fc3so7163190eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098793; x=1770703593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=;
        b=iHv724sAE2AoPncyhmst+eRz9HRn+/2hm6nBRu73lzb4JVddErSyp0LwFJhXa4d1/4
         qOWr9Ek+ewPfwRRRij+m5M93YVtyexYolwkiPFm2Y21rStvdmJuaXPdnyrfeEDMEXmw5
         piJbHz1FB3wyg+7qMmlP4+Kof9t+beniHFID4TNHaJhXYahfDgXeDlW9X9kfU08x6NDD
         CwlGkjiyiR/Vf0+1SZpCmLE5SXhdjZPpNTJP8hUNM7p8bB0sfMVGx3T0nV5EtS62dDyx
         TcPvvZxP/O9B+jf7KD2G3PJrtJ7wEdPfXoDUIxkAcCIBwbVwUquN3jOrkLIgAe+84XeZ
         gRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098793; x=1770703593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=;
        b=EfsyjsVV33ToSL27wRSwOsx78v4VnaFMv0HIJ1OA21HAJU246qRSjgGqu5OEi6o/l/
         P0DWibBAeVoFUgHYLKJZ6T7oHj2FzVlqpzUen2MPKx/VDi+RPdEN1Qp+JT+cqgrpUpg3
         gDGESVyI4EaNLSn4n/zKGC+f701+MCN61EOMyQbE8c8DKD4isACP8xXfuSFi8AvW/BAg
         J+m4GpCOJVUvNnVjwlm1cBRGJOaR6kSYs4lvbhldxqdDyNO972XzRL7ZlARmOZNwGHDC
         E60gXBu/1fqUdlPy0U5wsFCjCcfEte0btSaBMVeze5H4Tz9EMpj0X52I06pSISaprbNd
         apXA==
X-Forwarded-Encrypted: i=1; AJvYcCVlviseqqgknAH1MfIMHRLs3YM1Bt8jlkqP/Tj7U1wrrEdiCYCUTz7o3oM7F6Ji4Zb1pRuLT5ECs52akP7E@vger.kernel.org
X-Gm-Message-State: AOJu0YwRGBjJOL6+KvtY0TK0BZOHZhgusMybnOfduSc/ogXjc4FAUrcJ
	NrJ6TviDkUoq9kU7CV78t3zoSVbbtVkQJRwc8xaRSW3tjOdX7MDkxLVSQG5Me/JvQoNLFAIC/rb
	P/7Huif71wpACWFBCLNEV9c6ak/DeX0nXZbxTQKVr46qsDPBH6iOL3YUUbQBZcjfEXDxM
X-Gm-Gg: AZuq6aJfjcV0OTqu5PK1nUmIV8gcXfxySERmbHmy2EnnMXaTpe6wgTd+9qwbMzY/Wkf
	Ym9YxV4/w0cZy00zMRdf9tuZWGRaMIZrTcYGoAwc9vBbo14aaMY3eZUgXHAJ4mCF35w9A7I70TR
	SbHDkdeKRlEELLQMTdPRa4ubrBHC3GvM4QonvEcGZaleV0A0zpzM9FIfprl/Poor9IK3pRD7NjX
	hK7+8K1ScI7q4cmy1ow8d194IUGV8tYYv6NocOFLCCRrAsnQtJxIgLftLj+vq8Up3dAVLe8fay9
	kUx+yfJEO1Hcb8hgDA/DlbkK13o9rqb87muPoe8oOlm79WNuMTt5vTRgAna3kMgTXDIrEXFOFZt
	DDCeSuJMfBbejtZVbuB0TyG9FT5v2gT6BHt/WZtag66hRC+9Pv3G+0yV7tDWd
X-Received: by 2002:a05:7301:7c03:b0:2b4:700b:3d8b with SMTP id 5a478bee46e88-2b7c8940881mr6725504eec.37.1770098792266;
        Mon, 02 Feb 2026 22:06:32 -0800 (PST)
X-Received: by 2002:a05:7301:7c03:b0:2b4:700b:3d8b with SMTP id 5a478bee46e88-2b7c8940881mr6725486eec.37.1770098791629;
        Mon, 02 Feb 2026 22:06:31 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:31 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:20 -0800
Subject: [PATCH v5 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260202-knp-dts-misc-v5-3-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=21820;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=57BK10vrSKxDmNIb15WOBEDGWrb50WLKstLYTMBM8Qg=;
 b=oTOWvzEU1WpqF0iCfN7EFKXMOAdGWqOILAKnCKAoU/8VgNOGu7GyPU7xVZk7NdNTkdLS7zca0
 Hzbxg57w3pWCzMp1J4+j9095OXur5gNQwnyWvIJg4G7t/FeLsU930UE
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: utpLOtdV8jxN0yYyFAzxU7Wyobblbgyv
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=69819069 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gpPq06xVYaF9EkK19g8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: utpLOtdV8jxN0yYyFAzxU7Wyobblbgyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX4HOjuSvF+HMK
 8HnF5DINFJS0pdlmpmuYuRFfZjrb5YxXW7g1NCf6/GtwnZeja2KMzlKyr4Uu9GZXaVO+9+uVrPy
 3Z+NLqaUMrKk8gSLnBySnEumpk4bdOAYiMWtOtTE+kKuomK95Dr+lHrQbMzj/hdwHTvktDhmxwR
 5BCbaEl6XpYreSphGO9n2qbV4FncoUE11NZMDJJQMed808NSEHNSG2D1tMoq2X4vdu62smYn03p
 +dfFydxFvrIni7Pxkp2NTsYmWmtul7J4XFVdEtctXqWYTX61bLkkaSWbB8DmFYcMhA7N1mHFA0Y
 +9LJOt6cuvvNXcuRffR9Uiy6/IlBrmgV1KMVmOXGhge0q9H/fmF9HPgOeKMmzLPX5z+XEIfqTpm
 OhhKGyOltnQ0b8RLS5Ks24N326FzZg3BhK4Yqx4d3mAQfPLYVOZwyBWOP6zq3tA9DKAlq35A7vt
 26lEj2oVP9jB7HtvynA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,c22f000:email,qualcomm.com:email,qualcomm.com:dkim,c22c000:email,c22d000:email,c22a000:email,c22e000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.100:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4062D4FCF
X-Rspamd-Action: no action

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The Kaanapali includes seven TSENS instances, with a total of 55 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 130°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 120°C and critical trip at 125°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1075 +++++++++++++++++++++++++++++++
 1 file changed, 1075 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index df05d204ed41..251e36cf7477 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2583,6 +2583,90 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c229000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <5>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22a000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22b000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22b000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22c000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22c000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <4>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c22d000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22d000 0x0 0x1000>,
+			      <0x0 0x0c226000 0x0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <8>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c22e000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22e000 0x0 0x1000>,
+			      <0x0 0x0c227000 0x0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens6: thermal-sensor@c22f000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22f000 0x0 0x1000>,
+			      <0x0 0x0c228000 0x0 0x1000>;
+			interrupts = <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,kaanapali-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
@@ -4795,6 +4879,997 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	thermal-zones {
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				cpullc-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpullc-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				qmx-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-1-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				qmx-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-2-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				qmx-0-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				cpu-0-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-0-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-0-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-0-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-0-2-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-0-2-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-0-3-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-0-3-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-0-4-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-0-4-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				cpu-0-5-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				cpu-0-5-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				cpullc-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpullc-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-0-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				qmx-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-1-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				qmx-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-2-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				qmx-1-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-3-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				qmx-1-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-4-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				qmx-1-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				cpu-1-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				cpu-1-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				cpu-1-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				cpu-1-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				nsphvx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				nsphvx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-2-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				nsphvx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-3-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				nsphvx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				nsphmx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				nsphmx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				nsphmx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				nsphmx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				gpuss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				gpuss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				gpuss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				gpuss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				gpuss-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				gpuss-5-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-5-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				gpuss-6-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-6-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				gpuss-7-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-7-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-8-thermal {
+			thermal-sensors = <&tsens5 8>;
+
+			trips {
+				gpuss-8-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-8-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-9-thermal {
+			thermal-sensors = <&tsens5 9>;
+
+			trips {
+				gpuss-9-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-9-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-10-thermal {
+			thermal-sensors = <&tsens5 10>;
+
+			trips {
+				gpuss-10-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-10-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens5 11>;
+
+			trips {
+				ddr-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-0-thermal {
+			thermal-sensors = <&tsens6 0>;
+
+			trips {
+				mdmss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-1-thermal {
+			thermal-sensors = <&tsens6 1>;
+			trips {
+				mdmss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-2-thermal {
+			thermal-sensors = <&tsens6 2>;
+
+			trips {
+				mdmss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-3-thermal {
+			thermal-sensors = <&tsens6 3>;
+
+			trips {
+				mdmss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-0-thermal {
+			thermal-sensors = <&tsens6 4>;
+
+			trips {
+				camera-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens6 5>;
+
+			trips {
+				camera-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens6 6>;
+
+			trips {
+				video-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.25.1


