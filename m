Return-Path: <linux-arm-msm+bounces-92480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ErFAbEKi2lQPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:38:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6506F119B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2B24301981D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAAB3168E6;
	Tue, 10 Feb 2026 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlmF/Kb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsqsevoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405503164D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719915; cv=none; b=WLcyQhn/hDoEw7A3WrJguCCX6WnLrro4JbC/J06tOVOuBtsqW4Les7XzlW1mg6pVVh5zjKwfmzBPeZSIyuj1Oy+/nKU4ZPtmsMLK9w0Zyt+IfEwIotBU81oMkiHJp7NYvEELdBhGPugYj+AOWdOBmDuaZQkdSPXf3PUIF3A9ZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719915; c=relaxed/simple;
	bh=I3Nx8cWsJSImoM7W3ix49fyi0+g0f2Cv3/8OUNgIQPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDBtXD0OXFm8MsK3aYrEFUAj61UQFXtA3pg5xzEcALArkpPFpi3I/3OdINS4rpNOcC6GOQDiOwnJfYS7sOt1735vm6PlCa0TBUeIVgvLnfj+T2lA2gQmaswb6+gyjP8lVsR6eu+/TsZnPDQLNZE/ZeUFPV48Lwwkrwoxui5rn+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlmF/Kb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsqsevoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76vQS1151630
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CbUOf8f+2cq
	PAdS3EUjFGmF05TCgL4SOq39zD1JBkRc=; b=XlmF/Kb3Ww7P9ftZW4eCCCncHIP
	8WxXP/X6hK8tK3KRFY/9Q6MHXDo6rSR4RUNkd/Y8df0Lx2G5DGqiUUXX4P5nPaNC
	A3bonMQbnUjw1YhhmOWCx6wjLJYGlEzROP3KMsm6+k21TOkM71j/8HnTJBhdrS6O
	cglGxyxaRpmSjNYZoTN5e6CQZq76N2GE88dgdKyiqlI99Y0HOMmJKIXWcrkBAMUp
	vfuEmZ6sr3l1F+lAmhkPnBGFR6LiSO2S04qEKKrgkycNatLaqzanUUCnmnJh4+AK
	+R/KKDPLLQZl99bTBFuuKeDmLlyFParu41StykYBaj6vj5fcSVYLdyL9AEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j8r0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:38:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a9320d2e7fso14923175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770719912; x=1771324712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbUOf8f+2cqPAdS3EUjFGmF05TCgL4SOq39zD1JBkRc=;
        b=gsqsevoRrBeEvjcXBdr1fo6KenlwrxFJy82CxZTmmqkOBlsgloj1+qLdgjZYn+BlGd
         Nv86XIvQtrrEN7mSGoW6fTRN4SLaB++j6QsTqg3sF5F/AAnoiHnYZ7CkmWC+0/jCybeo
         QYZI80AXvjLVlrebL8TFSnqywQ8yQ2Vw4N7fNztA4JhbujSmgGHR28kW9rt2pTtk3f7u
         o7NAzQkGqyy5VtsNTFB3e09bUykY/sTyE4PE3+XNk8ZAjdl5TCookMdk9sX9OpxJqKUb
         5uYTIZHe8E7FTEpWDsH30dyKEGc0vufr/t6OHJSOLQhI7YKjkfYTmOXg+PnCsSp4y5ee
         q5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770719912; x=1771324712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbUOf8f+2cqPAdS3EUjFGmF05TCgL4SOq39zD1JBkRc=;
        b=Zfk/biPjxaDYgnx7BWRte0gGYp9RbK1qF50vSdzv0n8kR4oVnUsUvJ1Ii3DNMrve1D
         vrZ5Vt/hjJKhAElgxqPyyCI5HAEDhixKiRIHiKvUCjPuntwCOrJu5F80EQlzGeI4xbRc
         VL7jQAYdDTx3qIauj43IjqsWWhCan2Y4gKMoDDjiAfcekhdKjhK/uYTXlTnIalfVdrfG
         gZ3z6271vuZbZI07JMqdq5WvZMpZqW3IRkG9kMJkHuNk7q+hvdAUb1AfCJuY8+Ba3+Cg
         W1K0OU2dcAZF1fT2Aat2iCmPlBMxmcZqb+Ab+TEaUUVAH7xFFxou7MI+Xri1O4VKXoSi
         Vxkw==
X-Gm-Message-State: AOJu0Yy/7KUjbZMm/pmzftMrvajro2YorhbXR92SgS/VyDDkQuOKr9wh
	GiNpoedytf9MqOijXTq2J12u5s9iWFH6weJ2okZL7tLjo2msPcrR59tsA+a25bl1GBvXNZ7B0Bk
	NA5+hy5t/m9EeJ5CouoC0bOnfLPxu8309J0Z1rdji7D2jAqD1PLOz5wTgcrK+MYfi6m0C
X-Gm-Gg: AZuq6aJQIBfXXpwtvUbpnYZ0DZqkkKjBWHgCZl2Mds9wiE/zgql9oiuoV2MWFPsjETU
	TYeBIVD4dL6IpG41hk1sEyvwkKI5D5CAQJUHBJziQkU9Mk6RZiKCdz++hNduR6M/f2PgYJpmkOG
	tlD4CZRvBZUXBOJbSRoRVF0KcqUUYr6Piq/qX1P/LvX6t2cv4Q58pjTsuJwgJVTdAnTsR46Mm0H
	7PHbRF6w3BBM4g3xlXNGfKtNcZkGDxte4ok7wOtraku+2O6dOtAMwk7lGiyAJBLMXTF6eSZtiuB
	MxepXbfAJ/qA/OSs58pG1rv/yFXPl8PxHu7cKw/PVYaMeHKK2oN/rdQCh/ecObVbOazLiOuVXMg
	DD9H42K4WHK/+YGnvflUqkDPL0+8WBUVnlR7BHGQj+lQR9mSv43Lr
X-Received: by 2002:a17:902:d54d:b0:2a9:6281:6a4c with SMTP id d9443c01a7336-2ab12cc647dmr10500065ad.0.1770719911941;
        Tue, 10 Feb 2026 02:38:31 -0800 (PST)
X-Received: by 2002:a17:902:d54d:b0:2a9:6281:6a4c with SMTP id d9443c01a7336-2ab12cc647dmr10499735ad.0.1770719911438;
        Tue, 10 Feb 2026 02:38:31 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c92fc9sm143649365ad.37.2026.02.10.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:38:31 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
Date: Tue, 10 Feb 2026 16:08:21 +0530
Message-Id: <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4OSBTYWx0ZWRfX71Xd8TZ+4E7o
 GZ6rEUAsFAvYLOMaDHuXybeTO/sPKnghWczdwY2z2FRXQgrghh5ddc3cajPsy378cWBF8vekRqZ
 ofmyAFBfXxpB8DY7mF79qbwQ8n5ahqqhnqdEiTsL6nggtB60Am8neZu82tA03dJtwWpTqJ50lpZ
 5y/Jk6tUOSx8kpwDZiJ8J7eS9CqfqY/4BznnzrKDfj2/2IwwphjmTZjCtNTJd+oHaOJdhyH/Du0
 jp7F+nqIG6NiE4VJOAlX6POgyCzEZlNF3lZ6djiDTqpqZRmQ7hd7ld5NulC3KIb8Ydetd7D2hSB
 kfxkUGEPeY7y88Q1bOS820ZmfZlA6Osbe8+sm7NN2CRx+dbHMQ+yjwkKkovu4u/e/fZPm0kpRM6
 DrItk2evbsHaVX5Anc38iBLMfzn+FknnFwTwMY7wE2F610YbIQcH/ziuy3+zfwdgkG43L4j4r3D
 YoymyE/mtrXrJMKTuuA==
X-Proofpoint-GUID: ixVOsb5KruhfK4Lvi3dyw68kJv3t_dc2
X-Proofpoint-ORIG-GUID: ixVOsb5KruhfK4Lvi3dyw68kJv3t_dc2
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b0aa9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=7WwWSvKBDqV37eUiOWMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92480-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.3:email,0.0.0.52:email,0.0.0.2:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6506F119B22
X-Rspamd-Action: no action

The Mezzanine is an hardware expansion add-on board designed
to be stacked on top of Monaco EVK.

It has following peripherals :

- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connects M.2 B-key connector for connecting cellular
     modems.
   - 3rd DSP with support for Dual Ethernet ports.
- EEPROM.
- LVDS Display.
- 2*mini DP.

Add support for following peripherals :
- TC9563 PCIe Switch.
- EEPROM.

Written with inputs from :
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/monaco-evk-mezzanine.dtso   | 189 ++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..009e50c145e9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
new file mode 100644
index 000000000000..7811bd9e7ea6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Monaco-EVK Mezzanine";
+
+	vreg_0p9: regulator-vreg-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_3p3>;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_3p3: regulator-vreg-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_4p2: regulator-vreg-4p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_4P2";
+
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_sys_pwr>;
+	};
+
+	vreg_sys_pwr: regulator-vreg-sys-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_SYS_PWR";
+
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c15 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	eeprom1: eeprom@52 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x52>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&pcie0 {
+	iommu-map = <0x0   &pcie_smmu 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x1 0x1>,
+		    <0x208 &pcie_smmu 0x2 0x1>,
+		    <0x210 &pcie_smmu 0x3 0x1>,
+		    <0x218 &pcie_smmu 0x4 0x1>,
+		    <0x300 &pcie_smmu 0x5 0x1>,
+		    <0x400 &pcie_smmu 0x6 0x1>,
+		    <0x500 &pcie_smmu 0x7 0x1>,
+		    <0x501 &pcie_smmu 0x8 0x1>;
+};
+
+&pcieport0 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c15 0x77>;
+
+		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
+&tlmm {
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio124";
+		function = "gpio";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
--
2.34.1


