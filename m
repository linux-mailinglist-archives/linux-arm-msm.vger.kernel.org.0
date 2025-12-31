Return-Path: <linux-arm-msm+bounces-87086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED0CEBC4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836F330725E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0E231CA72;
	Wed, 31 Dec 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKrwz9OX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bG5zgmAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655C31B803
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176343; cv=none; b=pGAh3Dm5HH7gu3lSgm3OVIfID8nzekwiKW37dz+zj4hSW9iqw7bVdKY1rBJalCziJqnF4GHMnkQlWV1gVWEfN0SGI0/hQc7BErIv7eq6OD5fblUkbRoZZfwHkG1Nllq69N/0eVxf4RnYNH4fI5uu79TR7Tlop2oy6bNWN0LBAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176343; c=relaxed/simple;
	bh=WfDTSx43o07srL4cnb6/DW50kGeyfYTJghxLpiyPa4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTeL7acWUGGD8WRaGnIbCRc5EwrLaxbAP1CRy14Y5J/oHq1Julade0R0V8atRmPvvrFrarN1ubpf1Nwh75va2xz6XV9vnFSvflX1Bqknig1qw3OwxM5rIss4t0lWf4EJjcsPKaCgFt4U80nXOAaHrV6X5IYVcr/gPSWCdmtFaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKrwz9OX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bG5zgmAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV61w4T2049473
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KW7JFpPP2nQ7w0Xe2QOc9OWC3pEhCW7TP3OIUDY3TcY=; b=oKrwz9OXoo3rjtry
	EFO8jpf0Rf/5RhQmYV2LMdPI3oRGZJkSmOL5+fmLhb0BJTkjz3c7bcwAkyw5xQVt
	fD9KZVbMKCIDP4wUQCAe0ARa86P9XYmNXKN3aS1SSnYIKrjGK8a02F3MgG/swBSD
	WnWmgetyFlr8qUwRLeYk5SspZVhNjDbIbWzL4hT2zCHvLLlJ7PD38QQiXndK2MYX
	v1pJJUirsTiBsfNL7l7cX2JucsGBjJp8Sx8cc9D3YS7mR6tb9P1lWtBF+xyMy/32
	LyeCfaA+718SXlVko4XX5NmPEYIFcV1cOcr0TWsZY09NadWXpiRdtLEsxiEPkVnY
	AsCgxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx748e9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34eb6589ed2so9479603a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176338; x=1767781138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KW7JFpPP2nQ7w0Xe2QOc9OWC3pEhCW7TP3OIUDY3TcY=;
        b=bG5zgmAGWVIorvKx4tAhTflStVVcYOgrbnd7lpaC5HBBFJEbBP1es+QJTGFR7GwbUI
         EgR0kckUIJbJbiXFCskZzXWuXzYclCkxu3+Ew2UiC5FdVBo257wdmmzAOk4AIXv/o+gk
         iaoI3jeUj+GT4VnqQBcVefD5M38TDaCjF3p5nERD7sdKv9ZYO6ITdxx/77kEdc14q0o/
         GHhUGdtIZm5gumMElym/OQ5Kj67bbdrVZ4/2RZWOB1KcI5fjqOjnGOcdRKl82vEn4iW+
         jfUxl5exGg2I99vJLVfI850d4GyVh84juengOsW9p7fwVp/TdOqy7V6s/hbzuXAX0nzP
         WqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176338; x=1767781138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KW7JFpPP2nQ7w0Xe2QOc9OWC3pEhCW7TP3OIUDY3TcY=;
        b=nlu/zciqxcvP5ItT3aQwm4lK70KL5vwn+2/3DheoH8tOeNaoVlCR6xBVWeDzsE8NrP
         Et+MiFMrAEHpNm0mgOPGUb5E+AAk3qWbfISVRj1MgcD+fj0Q96Vu7+7dy2sy5i0Wjb9w
         Ia6mnVGO1p5ZDb+kGmiUaQiDPwUkKD6opajFCAAH9Wy/rJAA54qoPV/Ryiiubo8+7d2X
         WXR11qz0RAepK1CLnaL+BhhnTta0Mh525/GeuInKIXsm91kTYmdC+QLeG68deHiL3bcG
         g/NUWh36yQ0937WEtsyGs6+OrCi95GMfg/+iLvE9aeiSdcSZDjFYPCPpvfAsySJ3Ap6m
         XOgw==
X-Gm-Message-State: AOJu0YwMX+z2gCv6TdWhxR9o3ZsgnsrbQ84gJtev7FP8i6bss5yx1DDh
	/VwsCJa4vVXYrW/u1f9gOU2L5YYzifl6UE5Og5KZzryqPXXDHY75eU+qxOt02NO8trRogASCku5
	Hjk+wM+8kexqr/4IVdRDbhVXsIWOhbN7BYfWG0lApLg9ts+AeffjCWIxky0LE6kvjSiCqdG3lLJ
	L1
X-Gm-Gg: AY/fxX5LFL0AZD7eVjvrwHC5WFp/mvhF38Dzv+E/c8YcvLYA9m7wHCQq924y6V20rAJ
	rAaqxXApxvdCxtyurmEhMsL5y0t/iOMv/TrT4qcQJsM1ofjQxOmxOIJtlCqz0ZXNcIu3l/wp8io
	LiiqY85IG9mo1BCga4mWAQhF6tXQLPxd0sCIRfKlosvvnyi0bZbBmgG+CiDL9hNywNDCpfqOBaX
	A7R+nKptBOpULiqclnunwBEx7P/AiNfxQ0mgPFDdtuik4tDJ7L5oiqQ9mETr5aJRfTNzYtwZ+Fz
	XzBlF4sLLwz4x46nVAmG4pqQEjqCLWeBr0ErSnDgfuW2mtKA3eI0YMTrUPkEyY3a4jsxGHpQ7RT
	/3vud90Lkf6075aselybhBYOp0E27Fur33s4PUA==
X-Received: by 2002:a17:90b:3c4b:b0:34c:e5fc:faec with SMTP id 98e67ed59e1d1-34e9212f72dmr25100785a91.2.1767176337521;
        Wed, 31 Dec 2025 02:18:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGveq9ZL4Yy9lRSvQxH8/k9XbLAbQjNLqrDY6DJdTGOCo9Ub/f/K0iDFP5s4YVmtZ+C1sSJkA==
X-Received: by 2002:a17:90b:3c4b:b0:34c:e5fc:faec with SMTP id 98e67ed59e1d1-34e9212f72dmr25100770a91.2.1767176337035;
        Wed, 31 Dec 2025 02:18:57 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm30085504a12.18.2025.12.31.02.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:18:56 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 15:48:46 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: purwa: Drop the Hamoa workaround for
 PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-purwa_pdc-v1-2-2b4979dd88ad@oss.qualcomm.com>
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
In-Reply-To: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767176326; l=1101;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=WfDTSx43o07srL4cnb6/DW50kGeyfYTJghxLpiyPa4I=;
 b=wATgeCfO0issVLNkteXCDat77LVMkMGrU6VK/aT4g2wSHEj4qHVaB5g0BQY2e79H4FBYmchSJ
 CKMRue5nB0TCv7jbiPSmohckheR28BGCPqoK6yXehEujmFBoWl+y0y/
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: xzVnNjhovGVC6Ot6SbBMwsz800CEP_ed
X-Proofpoint-GUID: xzVnNjhovGVC6Ot6SbBMwsz800CEP_ed
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6954f892 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CaasDedagTLKq8XiIZkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfX59R6+E9/3unc
 JYtjPNCR7kusJzQjJmZnIauovGCbzxKIaCF2SG8Y/klq7/l4ybM7pn2XLBx53/4h8TPXTLxOb/h
 ZIIeocz4JcQe8SZKkLuKsaStOSaCpQszVZSBJEeFvA8dIo8jejHUkBVsmIo1tbVdoLUaXZmLlDk
 F5vvm9KQuDcaZ76JpGMc5x8KkKDB/SvIBWjtSgpSSxLEZa5Pq+4rWVy/VdWtY1JGFpapWQLn+9+
 4ufNv3W6R2h8zwvrYDHee1tXqHzVH2K+h6uI9HBdMq6q6MbDRd7YzMNRuaODMwN21VN7GEm3jfF
 kGNv4iONqDtDItjwXWIrWU7hFionxKPkTXzTlBtCetWzCOBZDRzB5eps4IZ2U3nwflYi/UMdwJ3
 Vlyfus2bQScsKdbZNFZA+PaxMC2hsNBHyWx4ZkCIViDqFwPoGrqfOkjlTsv4A3IFjIP22Yy2efY
 7Lsb/TYkaQfcVGkZosw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
hardware register bug on X1E80100") is already fixed in Purwa silicon.

Hamoa compatible forces the software workaround. Use the Purwa specific
compatible string for the PDC node to remove the workaround from Purwa.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..e3e2dfedf0b3cad90b767d6b28fb0c60078d192b 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -152,6 +152,10 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.34.1


