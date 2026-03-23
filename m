Return-Path: <linux-arm-msm+bounces-99104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODyjAc3cwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:25:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8742ED061
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F01A30427CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508552D73BD;
	Mon, 23 Mar 2026 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9kYarj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNHoEmy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03AB2D8399
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246812; cv=none; b=RihHVfIi2h5LyiUgJurOz2FtcG4jE7WWv7uQLGWG07RBZFHkF2R76ZJ2UpW96oRqlLzrz0gdnbRqppuuOyeB73VEAOMrX4AzWOjPIV43zKF4k+ZtcnI9B5C8QqeBXs/IvwDi3LJodRq0HymKMczFZwQFlPhYv1IO0zOpmOLf+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246812; c=relaxed/simple;
	bh=1v5Hv1hQAbl8uRI1XzadMby+2bGvnnrzQsrGpn5TKlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oz3SmDJMskwoqJQFHczA+gtYkUTjae5s4v6MYQHbMpziKSmO3XPZtio5hyLuRrZAGF8LqTXlMjv7f+hKyewj8f3qR49ZU9QyMClL0fR7OnDp8wFdvSbYw8nUGBttPct0Y5QL3ztZWIw4QLUekHKOvKscQznlbO2foTGt4k3brmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9kYarj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNHoEmy5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N69Ygx3522918
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	II+C8Jdfh9k04NdktYB0/2NxCSBW8B9O0gt735hqb+k=; b=N9kYarj8UhQI/IJL
	s6X0m9g45VQM6ChuphTnxNuiNTPJd0/7PpKhp5iytJSOKvlQ3XUuLHbSVQmLKlje
	1QrWh4ZnOm+8zEn0C9Y8F4Z07LzeqsmffO+BOnUhtBdtmGmlOW7srVuGg+1IEqcS
	hi4NE0WkgPkN0qjIxmScOD8yTUAzOtSmdYF/Uohn/d/jGfMRV7wNMdkoKkAJSK3r
	S5PKAFBBuSJRR5IE9cyId+X/I1JXlps4wKnONF3mpESFXdgGjBIcUj1dRTnd6KcW
	ytM9fcHhZkrIqif5U9FYgYrqw5BK0zZNViugIdVzKZz2+CeF3yp2UtaE4Z1NT7Fc
	iZZa4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1kw4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ffce2570so7627084eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246808; x=1774851608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=II+C8Jdfh9k04NdktYB0/2NxCSBW8B9O0gt735hqb+k=;
        b=KNHoEmy5akx3inywQ6iyJI2EDpVwz9Qp0n448S3wiBEHTmbK7v1Uk6exz5FDGb+/2n
         2hxTb846JVafRu+c+hkdYt0VGulEKC/dg2ND5BPEGptxjme0uW2u3K2N9IyuieEqvQ+z
         u+RwqtlEKqDyiSU18I0ABrdRMZf8GQUl2pOqhXjLblMdOKnLf31LrzwF+5s/ezDt0Cru
         wyLgm/xfzUPRXDRowlhunQwV1QUTmOozNv3tXgeNQeLVO2MX1CsWjCmWTno+coI0W1Lk
         I8siFwwlb0i0vuBqDNA/q0MaZP1IxqC7RpBatgxr4o8j7JY0Jmjx9SDpK1FLQNz2m+54
         +NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246808; x=1774851608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=II+C8Jdfh9k04NdktYB0/2NxCSBW8B9O0gt735hqb+k=;
        b=hgCs8G2GSgBzZowCvJ6UlKQ1ZOkiHcqzv5bMD8SFkNlEB7XgqFMFHLXAwXUPjWjf8x
         K2VQWud2a+2+OIpyp7y7nK7Z19fqtcHtrMUEdVD8AHg0TNuYxz/JugGW0yC9tMSfL7dD
         tfJmX924jitpkNtMnteoxs8oAV5wWoCnpwNUQF5lpvZO7Z01jdcKnq+/m2Y2Qc4yDoJ/
         Y/lDxSgBYplheEt+E+A/B2W3q+eLmSPry1Da6d3TcNGFx7FbkTs9mIZwuHxVxUyT2gJy
         uL5li6lcjEcuCWUL9aGcWKlWmykfyrIz6ERz54nyzYtEuLoXwV6hxzncvWURyU+obva2
         lXZg==
X-Forwarded-Encrypted: i=1; AJvYcCVfvYbTwTiTBUdsjgdLSko74Goz8DaQcblx0G7USDYSA7S8uhcZcPNJacN1F7i0NtYNyZnFhX0NZjjfJGZr@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMh8PdtZJeypEUhq1W/p5/xW7jsEDmAEkkPCefnyfE6bjkmGH
	nzc5H23q3car/wjqblhIb/iTMj9A7Zh7SPuuXzx+qTMu35vWlOiufY6V0Ll6pRYWE8zgmfIB+md
	AsWObM3l7rUoBiX4NyIZAjI+IJlrHRAvvGOoAlKS67Kj9IjH/4khOEz6mc7PubyZP5CLe
X-Gm-Gg: ATEYQzza9LHIZjyD5BXZyRNOUIS/assWraLIHyCvcxwYCw0YdfsMdVOLWxMEAgjoYlQ
	0dsodKpDDSDYxb2Dkm/DBgQk+TPY5BZ5lq+V6XKENicQhlb3w2ZMg701/NhTKQwEvXpc0eoRaFx
	s1gAM176QU6r2cQW/Dk5zTSEhTtudy1hdiEpjV+NJg40ocKRs6VjrTHjWsmgMt5TuDZdbD6Em0H
	YPP2k8RJleRTpsBqawND0NyF2WEi4A+9DLHF9uDwRDLvjqk1MMoxWIHUBEUhdpx8IF7BXcDbGyG
	s8kH780TBxQpjCPDXX6KOlRqxho3t3IjEgaEGPAvyjsBteX3iCHtLbhrNTK9XnX9AyLZCbVvZsF
	vI1cU8i0326WPeOS5kimUQLMgNG1q6xfMPmHZi7EgvJkRkjTUoAOUL+GZIb4oSmrnOYrHkd9z
X-Received: by 2002:a05:7301:5791:b0:2c0:ce11:7724 with SMTP id 5a478bee46e88-2c10940944dmr4866725eec.0.1774246807894;
        Sun, 22 Mar 2026 23:20:07 -0700 (PDT)
X-Received: by 2002:a05:7301:5791:b0:2c0:ce11:7724 with SMTP id 5a478bee46e88-2c10940944dmr4866709eec.0.1774246807264;
        Sun, 22 Mar 2026 23:20:07 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:45 -0700
Subject: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=7174;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ET7AlHju4QdPwosZx24+HbzlN/hum+VoJGcHfUY3eoE=;
 b=1yC5Etob8lYqVkBtT30oxu+u/Kwn430xR5Ijxmqb8H1I/6bl+sS/p6fizNJsNzYNCb8VgVff8
 Mo+IMg7ZDySBEg8z1Twzl6J5G0IzVJd2Abeh1oVI3soiQL5ksROh09C
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: jbTOd8D6vb7NzAN3lj7jKKSpY3WbXL0f
X-Proofpoint-ORIG-GUID: jbTOd8D6vb7NzAN3lj7jKKSpY3WbXL0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX/t7ADAgFIQ6O
 cIcRMc+2Bl/LSLufFJNxA8mtdH2fAhtKXCu5ngx/vXFr1ZXQH1hRJXGRtakv0JMu2KE+xNWtX5m
 d/gYuuOJb5/x1m5533pD6ADPq21M6RK/xifTG+gda+/ZZTHJLbfmJKR2sLtJBrpfgbF3/akZK9h
 kQQ+MX3b7dxs6p/cepYJJWLV3iSC5tpzvA6zNbmMyirqmb8Y6uq3PgCanDs8Tbz4PhwAaHdfC8y
 Nqndv1E67XL1vQsMkSc4Xv++TugTFXkChkr74lIHDeK9n4Ahckr0x8g7FRTYjGihy1QsVxgeeLx
 SEtZq4W7YEG/SScwmvBuaZc69W8vcGOPdANUfRJ0B9u7Lp8xWvKLsbIVJt914+Gf84XXSXZdaKN
 NiVHep20k2htxPWTbTPYGkVkMnzq0+RoiiYYbjZ5G+lQWlcMLKufs7jy2zUX5jinmrCLuPDzjVB
 cgWq/VzUHL3qu9PnxSg==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0db98 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ekcQ59J20JkAXHuyNo8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99104-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A8742ED061
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
are not included.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 242 +++++++++++++++++++++++++++++++-
 1 file changed, 240 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index f0de06b2c20b..bf3c6eb496e1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
@@ -3156,6 +3157,243 @@ camcc: clock-controller@956d000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@9800000 {
+			compatible = "qcom,kaanapali-mdss";
+			reg = <0x0 0x09800000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_SWI_CLK>;
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x800 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@9801000 {
+				compatible = "qcom,kaanapali-dpu";
+				reg = <0x0 0x09801000 0x0 0x1c8000>,
+				      <0x0 0x09b16000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf2_out: endpoint {
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-156000000 {
+						opp-hz = /bits/ 64 <156000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-207000000 {
+						opp-hz = /bits/ 64 <207000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@9ac0000 {
+				compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x09ac0000 0x0 0x1000>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC0_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-250000000 {
+						opp-hz = /bits/ 64 <250000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-312500000 {
+						opp-hz = /bits/ 64 <312500000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@9ac1000 {
+				compatible = "qcom,kaanapali-dsi-phy-3nm";
+				reg = <0x0 0x09ac1000 0x0 0x1cc>,
+				      <0x0 0x09ac1200 0x0 0x280>,
+				      <0x0 0x09ac1500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@9ba2000 {
 			compatible = "qcom,kaanapali-dispcc";
 			reg = <0x0 0x09ba2000 0x0 0x20000>;
@@ -3171,8 +3409,8 @@ dispcc: clock-controller@9ba2000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>;
 

-- 
2.25.1


