Return-Path: <linux-arm-msm+bounces-91575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ1JA0N6gWmOGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:32:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63490D468B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD19C305DB82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA301D5ABA;
	Tue,  3 Feb 2026 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FArgaFMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tubx90pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3A1B6CE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093101; cv=none; b=PLh04CbQ0Fs7Oy2i3ZyZz4FtacOXQmSgxr6yfB/kD3KIo5sI43pApKREnd0dorGA7R0ZRnGmaR85/r3b6YqTznomHFlcWwfX4dSya1DW1BP7BVJiD779bbPurEMt+e2lFM9TG8xMHNHVLHQMyjC+eSeGeBHTp2hGy/pXLs/0maM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093101; c=relaxed/simple;
	bh=9mk67q2Nm7U9N4K8hxF/WDuU5gSRnJaaKjFBP7XeR7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMTdDrsMkK4lU2dDi66xB8WVTjG8QPnfHsGKUIP54SK+VcdVNzTcAkObD59uwUDBCdDFCP9cRjaLRKpPnxX8uQuA3e+BqzV5u/HIxPbaDL3D+W1++arKWqcShA+UGXa+3q5VPgMY7dCoRUQ9V2aZ6XFVBAZ4shRyS149cgGm8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FArgaFMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tubx90pn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612KDCqi277414
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 04:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7q3JrJvoZ71ljdPa5eU6lAaROQA6xQR58WcgdDtxkw4=; b=FArgaFMK9Qjlf77g
	DYfofZzr29wk++HfSoN9rwmP0sgJufPG5W1vOZhnTVh7CGph+9PYdvjxas26Bmmc
	Hf19+Mlx5wRYZo591dNxshCst+FPsExRq07DF8Rz9ptGfoVjPT2rDiOfnqNDeOfs
	BTyXgW1kVq0BqJZKwCmI88WQpaOqSe2kedSxspcl6XUVTFPfp7o2TdYBZvfrBOlb
	TcsYYQKxx6kBnY0uOpfP2moJ3HQxvkfG1IyOPt2LQcYeUWeDOZM6o/9QlrSs0b56
	Z6FNX6dOwLZbDK7YfK0mTrfIKM+/q2tB73dR3z3fb6wmLydsTpeNcxOk/9dgJDF6
	YBe0ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s395kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:31:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso45587465ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770093099; x=1770697899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q3JrJvoZ71ljdPa5eU6lAaROQA6xQR58WcgdDtxkw4=;
        b=Tubx90pnkihXLKT9gfscBMsm9io2xfo5VYEDG3qYxRgzkD5xZMu6L3zqq/bZLQ2yQN
         96B5JeyuSGdRhHYsL3AF6aBlYP/pVIUC9WErFxHgb4wZ7OXHVbuW8SM1MPZDPpEMeKHr
         BUpOE9pNHUQkkgNL86TYIIdFl68NZW6cR+6MlDyItQUhRSftfuM2LCvmfZnethg9SIqw
         wPQro1bUdzHwNcLztzIRYjNu99mEI1NiyN7YsbSN0+mYpIcgqyMFvCgeqjhtqOyCrLUU
         hxks4QDbB/FP9RVkapeLzaXFFwJa6aD2u0GlNcXaMMbeE4s/J5pF2k4dX7WD7qHu/nu+
         1U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770093099; x=1770697899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7q3JrJvoZ71ljdPa5eU6lAaROQA6xQR58WcgdDtxkw4=;
        b=d0AsTvTOPcH8q9ieBYwhYqbD/d2W+tR5x1wOAz62T2ThhkEj5UGqt6zuiChM/MrgCJ
         OnOOdQHw2vYvNmLkrE12ArkmM4G4qkIrXKh1CqbKFQLw3u4GnZfMx31eWe14LREqWrSQ
         8f1/vseGlYzBBJlSgS7x/LINwSTE9bng3mhsP0ENsbU6F+SBujfUQbxbYJnO9TQ1el1p
         /I+yQdDxXNS448E1kB13g8JNmwkNeUQWiYJhDRKFgr53hjd5LgUE3zSbdnkMAOO1qYFa
         NboDDzL7Lj6iozoOsZm2BqVu0S5QYv+9CyfocK8i5oOkLNLeya1+FTYomP8N8bdjF8TL
         hY+A==
X-Gm-Message-State: AOJu0YxkR5kpJWQQj+PCusH0IR43N16bI633d36ve0l7Q/0xkhwIfT8y
	3WHhMiBJS5BMjcIWlgkvkYmol8G4a6CFiqS8c2uDEpfHWeRPr8vg8nMOMiFozbmJuxBLYJPwl6H
	SHXJ9ISyFhSlYd0vzuzTozBkCnCQFgAmvyg9wp/o6N+h4TIetmRW7D+tAUMtqenF/TO9b
X-Gm-Gg: AZuq6aJh21+w+X60np50Rx4VVBvkXOjbEznwpj6aXzy8xuyDf/rzXvcUuNR+qUAmbcA
	S1btq37oNPWPKFkk4fq8PcpzDWC78mdgBWJI72SgTc9IR1Ys8Dg6NWX+EUgb4JyIyk3p2ijsL+1
	jgit+Tl8huWLgXbh0e8+v1umIEoyBoDV8rxsCAr2JakPoCvQtgFKErFav4QVkZ7rXmqy8RbZKed
	ov0TPMyOnsEvu5sygvm0LCgbF4BqZZZm9LCeMlClCxTzVf1fnXM/hNbA0V7eD3Smicvj0wRD8Gi
	aokmyYMJGq95FN2B1pu59MeZA4JAcH6FsBnJU1RzxVnd2nNQSD63ZGqKiQ3T8OGX+22CzPWCO0+
	p4BC2wl2MwVfROySlH8wJjMuhOkIZU7W0IBNIFkLUExy8YA==
X-Received: by 2002:a17:903:4b30:b0:2a9:5a0:22b5 with SMTP id d9443c01a7336-2a905a0235amr73670925ad.20.1770093098661;
        Mon, 02 Feb 2026 20:31:38 -0800 (PST)
X-Received: by 2002:a17:903:4b30:b0:2a9:5a0:22b5 with SMTP id d9443c01a7336-2a905a0235amr73670565ad.20.1770093098071;
        Mon, 02 Feb 2026 20:31:38 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4148d0sm162487605ad.27.2026.02.02.20.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:31:37 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 10:01:28 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for
 PCIe0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-industrial-mezzanine-pcie-v2-1-8579ed6bf931@oss.qualcomm.com>
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770093091; l=4391;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=9mk67q2Nm7U9N4K8hxF/WDuU5gSRnJaaKjFBP7XeR7A=;
 b=Z7AixNHNBZoRfVT1fNMqaNXM6Qlkxj3ix1OmIYfuyf0g95/nU+6bh0i0t1FRCfr7CtpaKeOCW
 k63zcQV4tBoCXvNVVdTHN0w4sLMnM9FM/d9DzqQkMiwbA6rvScI2n0w
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=69817a2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RBLAtJqH_bkH6XPhXP4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5xQ7ODh80RmZKpoAqerBZGjcLoPl562q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzNCBTYWx0ZWRfXxw5DtKLOB0sb
 Ta0LwkrnY+Nfug+Q3sRRHZFHU8wUQTyYU+10X6gYy7oZGgzEJIORQtrBRiIppzuCU0AhPrUutyZ
 wIvsm71IWsaNnoVy4kTzH5oNFMqmGXnFJLwxBssoPcdj5wzm/MuukroY7efXPgK+33+6G0j9wek
 pPQgiJnvWMLNwkyGIDL8GssUikx3gO4lokCxZf0o18n8ifecHsz0MAmTwdtz+AHRQWlplLakp9+
 PHJMO3QlG2atMts3ovJgrBjo/FlZXV6/qKOUm7AUVZh41pzyGshxC/MaSFW6KUm3GL/6D18obWl
 Iv3zJxokoTPoL5hNmj3Wp8//4y2KhvQYj7YeabGgbbi6ZT6d9Q85Xc0INSofNVHWH/0B1sP8J0b
 In8hJq4o3+KkD+IgXhmOuRrmsJ/HFQh76xZ6JVzyQlm8AAwXMLWN4sY1bYBXgL2JqFA/Apose2A
 ekM8ARSFC0khxl6TTYA==
X-Proofpoint-GUID: 5xQ7ODh80RmZKpoAqerBZGjcLoPl562q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91575-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63490D468B
X-Rspamd-Action: no action

Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
has three downstream ports.Two embedded Ethernet devices are present
on one of the downstream ports. All the ports present in the
node represent the downstream ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, which
are on by default and are added as fixed regulators. TC9563 can be
configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 619a42b5ef48..89bbcab0908d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -5,9 +5,47 @@
 
 /dts-v1/;
 /plugin/;
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+&{/} {
+
+	vreg_dc_12v: regulator-vreg-dc-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DC_12V";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_dc_12v>;
+	};
+
+	vreg_0p9: regulator-vreg-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+
+		vin-supply = <&vreg_dc_12v>;
+	};
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -19,3 +57,103 @@ st33htpm0: tpm@0 {
 		spi-max-frequency = <20000000>;
 	};
 };
+
+&pcie0 {
+	bus-range = <0x00 0xff>;
+        iommu-map = <0x0 &apps_smmu 0x1c00 0x1>,
+                    <0x100 &apps_smmu 0x1c01 0x1>,
+                    <0x208 &apps_smmu 0x1c04 0x1>,
+                    <0x210 &apps_smmu 0x1c05 0x1>,
+                    <0x218 &apps_smmu 0x1c06 0x1>,
+                    <0x300 &apps_smmu 0x1c07 0x1>,
+                    <0x400 &apps_smmu 0x1c08 0x1>,
+                    <0x500 &apps_smmu 0x1c09 0x1>,
+                    <0x501 &apps_smmu 0x1c10 0x1>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie0_port {
+	pcie0_switch0_usp: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c1 0x77>;
+
+		resx-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie0_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie0_switch0_dsp1: pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+		};
+
+		pcie0_switch0_dsp2: pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+		};
+
+		pcie0_switch0_dsp3: pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+
+			pcie0_switch0_eth0: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie0_switch0_eth1: pci@0,1 {
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
+	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
+		pins = "gpio78";
+		function = "gpio";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};

-- 
2.25.1


