Return-Path: <linux-arm-msm+bounces-95643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKm+KcCHqWki+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:40:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD87212AC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B55030177B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AB639B4A9;
	Thu,  5 Mar 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NplH6MbA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hU12wpoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1270B39A7F9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717991; cv=none; b=iUDzPYIdGizMugAhGH+FUGFOamXVfQa/f8nbOTHv0mklBAckiPIoQD8lI1cMS8fpGn1NgZaGdyYCqH7RbtzAq0DuqeMp2k2ONibvCT3syH/JnftHy79XKwyFig66PyEx7GVX9RlQ3/Qyw74VMrPEJYxSWQFbBdHEgXX9ORINdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717991; c=relaxed/simple;
	bh=EKv8wOSJGRlhpeUGi+dyApwOnzSEKJGSXglpAxxJlcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyukoJpigRRi4h+xXzRyKD07y7/aBts7YhtBpj57mQ583u8MhzMnXEvTXBzHzlfe9xdCTG1ca6VONiHpn4jOknIY8TzDPH8VmCsM+ANYJMTvc7Vie83OicIu7MWre4M38SITKXQFRVluA8kFE6yGUcji4PjqEl8sfdNan0u2SzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NplH6MbA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hU12wpoc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFp7U1517944
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 13:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcpYEMXP4Nu8WtXRYSEcQ0DhOhHdqMNhLIC2zKaCrR4=; b=NplH6MbAbRtklWuA
	9mGLvkyzqj7w0e80dmakLOFcrW4wQxiH+BNX6TiCBmnnwQyylj/6rFvZ2s9ZofNx
	expHyBvIPF287lqiBLknS0q0EHX8LewJsZBo04u8Nu41Uk2RHYUA/EMr/Qk6iWZo
	mIjrgJUHXQZx9J09rlzQ8VEG9bz3DzyPSbpBrXePiCTMTQhs2dfSYVEngTEkv6vu
	//3mRm+d6Oxahacf5dOY6//kJbLQXWXSFXKHWyFwwggcFHAP8LtCQVczewSsDZL0
	biPx2rIC8IKAVlCVQUeBS/eVxNC3PDSJnM+7I1sOK3aF57l6DfFW73OU+KZEL0pE
	u9MXDg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptjwp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 13:39:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso6776191a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772717989; x=1773322789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcpYEMXP4Nu8WtXRYSEcQ0DhOhHdqMNhLIC2zKaCrR4=;
        b=hU12wpocAT/43bTLXNMqrGyGBzcZqdqGdiZsC+WELnIwooOWrtMWXNAN9gA4XKaRqt
         X0FjFUV98pmCGKcLr6zgNlZs8zfxEwnvdIOdVQRltI3QFs7aep7TioCbhea37DjyBHSv
         2TkLbr0CcNYjoR9JlruQoLmMO8K+1xxqFoQ5Gu25RrDwTXbNLo9hCS+IWHcDbepEWmV0
         c/DmMc5Oy7JXiAMC0L67qOYEVZd4MaX7nF+eOFB9sVa736pSl/GmYZxXvS/jiqOR5wFi
         oGHZom4GxQxGDHEitX9kCdqUNU3DiaFTd9R2ER3dfhevJfbEPD2Ec3qZCKkGEuQ44y7d
         pqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717989; x=1773322789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcpYEMXP4Nu8WtXRYSEcQ0DhOhHdqMNhLIC2zKaCrR4=;
        b=rDQP0bFBWFuPrIH0hFEM754YqTZnfBdgBZm0JMevLKUJB6hJbckF0I9Ym2TLa4kV57
         DKWDhN5fX8LlxzGGCFfbB6q+WND3DHSA7EUURO05+6jvwY1UxwUEAy1P8KcXT5z/m822
         vBQ5oFJXaMm9lgiEwTI3eb308Uf1qWWgdaIDpn25EnpGuyeMAnPWGMWlNc2K2/vj4kdZ
         dmQEGD5Kl8dtTWYg9Puaz6fJQRo9i4DGQgpez9vmWnsyDH+cLJhyoKww01IPYqms9bXH
         qiWPsxXSO6YYmxv11l0iemXrh3MibShzvhHI5NSh59TjD7kt/dZqihX2gMVSGf/WgUe7
         er+w==
X-Gm-Message-State: AOJu0YzPmZdIYN20O3O3RsPvaD153Zwkf3YEivDDOQ/9nkN9QomJsPUa
	ixx0js4adzIUsE9eOeQt9SKW9uKktTaAjSdLGFsGs5Uu9+VjI1xWpybrom6WjImgCxvScAtiNRp
	ToB2y5qWREj911/e5Jpy83eAzGmOlqYGMNQd8684AU2bUTkXnzeIOUh9JkTqF8iLbUcWX
X-Gm-Gg: ATEYQzwn5Jw5/fbUu5EdOOtLcQ2PgLvSFRSdSc1fkkyX/x3XQOL1g2UYruTs+sJUzKS
	jWxvAHEvw59iQWpdOBd8BeFPw7Qgud4yUgNE1f/6rlixxNvw0C0TOSQdJJXPG7ulcBPbXMsjttB
	3HxyolmbqqQQQD8aZsRXTEVV2ZkLmWsLX/vLJAAGZr96Ta0oyw6WdXN9IwKsZ+CMccMrwBz/9OE
	cO8RLUmCnf85K7fS1qPH0VR1bOIK4599BD6usMbeZ1uUtc/6NTD39qz5frQei3tCXebfjFp7FzV
	uAbnpLey9vcOP5OiNy0htQWMcIrEQ1i9oQxNVwYi15PxmdgnZarcIyQGi9Pehr+EZky+Vaks56Y
	QV0WbnLd2+NMh7o2TkCVx8HoF0X7nfYvgZnazCi0KSlmeFOTQhV2bvxjgeg==
X-Received: by 2002:a17:90b:2c90:b0:359:8d70:c4ed with SMTP id 98e67ed59e1d1-359a69a26c1mr5088419a91.7.1772717988592;
        Thu, 05 Mar 2026 05:39:48 -0800 (PST)
X-Received: by 2002:a17:90b:2c90:b0:359:8d70:c4ed with SMTP id 98e67ed59e1d1-359a69a26c1mr5088397a91.7.1772717988039;
        Thu, 05 Mar 2026 05:39:48 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d5fe2dsm2195236a91.7.2026.03.05.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:39:47 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 19:09:32 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
 for PCIe1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com>
References: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
In-Reply-To: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772717976; l=4306;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=EKv8wOSJGRlhpeUGi+dyApwOnzSEKJGSXglpAxxJlcQ=;
 b=57Rdh+0nw//YsAa0uXxLianwueKyTEtSnAGRJzh93o6DwK2vIc/0PL+lkjF63P0W0jwq83uEL
 0Q02AUNUkIWCaDFacs4D1YkmkfrnbRCEfiGogvRlWhv0lDAC4YyFl6F
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwOSBTYWx0ZWRfX5WKErs8EthlB
 pxIlNIcSYqkKJ1C5GQi/lrxHw6fxBVIHwE4S8BIp5osCi8g8wDoRhmmKqXWrI5mDjZ/u2CJg1+T
 vtY3GMJCpQtkQ2PGTHHB92OpO6ia1XZGdhwqDhIsnP+tWbvW40Aw5rGWX4+9B7+iOcgTHyid0mK
 L4ojoDAfZwQKCb0rbNjHKoxNRZvO9blxfRb/j7kvbzUhgRA+FyCB0dgEDPQbtKo8hsCHu7/0Im0
 BIEZ0h/jRR8j+gN6juBVpBkcDwUMFfbFlX/M9fu8ZwJlRZofnEqRxUd1aOyhnJ63VlGPkVkYlti
 EEAE6F/RkHDwQJHAIfkOdiVQzccFQh0Er3kzjzLTpkI5z8ZsRrD3QWejcb4EskHRwQuWtIH00E4
 dkml68BP5igKv4vS/gNZog5c1dMK7OMbswb59ZnLOGKho25AWWuQpDAm4OLox+QWgkrptOnxUrh
 0aibp94yE4q7K4TNOPg==
X-Proofpoint-ORIG-GUID: 234XI5nKWs0uNOjFVDr-OKd6sa7IvbBn
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a987a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bvgCVipTNhjOeuzF1ioA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 234XI5nKWs0uNOjFVDr-OKd6sa7IvbBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050109
X-Rspamd-Queue-Id: AFD87212AC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95643-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.3:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
in cascade to the first TC9563 switch via the former's downstream port.

Two embedded Ethernet devices are present on one of the downstream
ports of this second switch as well. All the ports present in the
node represent the downstream ports and embedded endpoints.

The second TC9563 is powered up via the same LDO regulators as the first
one, and these can be controlled via two GPIOs, which are already present
as fixed regulators. This TC9563 can also be configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 102 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index c58a9ad5c331..2a2b7c2f9210 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -146,6 +146,100 @@ pci@0,1 {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
+		    <0x100 &apps_smmu 0x1c81 0x1>,
+		    <0x208 &apps_smmu 0x1c84 0x1>,
+		    <0x210 &apps_smmu 0x1c85 0x1>,
+		    <0x218 &apps_smmu 0x1c86 0x1>,
+		    <0x300 &apps_smmu 0x1c87 0x1>,
+		    <0x408 &apps_smmu 0x1c90 0x1>,
+		    <0x410 &apps_smmu 0x1c91 0x1>,
+		    <0x418 &apps_smmu 0x1c92 0x1>,
+		    <0x500 &apps_smmu 0x1c93 0x1>,
+		    <0x600 &apps_smmu 0x1c94 0x1>,
+		    <0x700 &apps_smmu 0x1c95 0x1>,
+		    <0x701 &apps_smmu 0x1c96 0x1>,
+		    <0x800 &apps_smmu 0x1c97 0x1>,
+		    <0x900 &apps_smmu 0x1c98 0x1>,
+		    <0x901 &apps_smmu 0x1c99 0x1>;
+};
+
+&pcie1_switch0_dsp1 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c1 0x77>;
+
+		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie1_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x40800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x41000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x41800 0x0 0x0 0x0 0x0>;
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
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
@@ -177,4 +271,12 @@ pcie0_wake_n: pcie0-wake-n-state {
 		bias-pull-up;
 	};
 
+	pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
+		pins = "gpio124";
+		function = "gpio";
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..cd54525e45e0 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -852,7 +852,7 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
-		pcie@1,0 {
+		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;

-- 
2.25.1


