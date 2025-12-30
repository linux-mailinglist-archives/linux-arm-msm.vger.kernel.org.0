Return-Path: <linux-arm-msm+bounces-87021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5FCEAE40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6E13032FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C7D2EFD95;
	Tue, 30 Dec 2025 23:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uz5bxghF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DizC8ebk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB3D2F3636
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137780; cv=none; b=OCAsVCe3ZBF8+DeQNXQBlA2QlBY7cxGZM7rVM/NexTXxfpGQa2NCVlBN2uZYxJxsj0sAXVBzHszDlBA7B7+wQQyWM/OMQPxR3xd5Z46uxawB1QvjAjhcZl82O9yIWUN9uVC40bHyYk6vbW8mDdrGuofLfwzcP0VYEUSiXg5idG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137780; c=relaxed/simple;
	bh=EjTShN8dVXi1WOodHyvaBSpGXyNPhP2Q+wFwV3+ERgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dz7e8MR9VOcXfMhB2XyX85qb8GGBnIC3YHi3YIM06JYDiQVWo817yk+Z5GIfopcvghwDGAbBOje/U9e7KhejuMIuo35lFgde2BSUtu90JSRE1PfFl53Wmkzzjj0InG7mZp7ptm9iJMydfJhFAjb1yY8RXCL56tal5b26V9AcnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uz5bxghF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DizC8ebk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB3wk3956498
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=; b=Uz5bxghFa+jtBFKW
	IoDA2XsQZUMCDrzo6flSzVSEKzTo4IPY1NuyFnKtSgAIMZ5+jKBbcv0MH2C528d/
	SmHWNbD2ep4LldxYBX2smVzeo5nSdV2Wfl/VEtDgqI+tAxxQTms4kMYcvIvwTjWY
	Fv6QYVtXmsXfoRrjTCr/Jx7QRKUVGIoNKxUo8MRgPY88EwNcDvsfCELIeMIXYytU
	TMC4mmqPwT8ugKAUtBZHVVlMC/1n+Pe+xIVcr/W40tK8NcgMaKMlwi1Y5OijM4d3
	IUrgxL8vJJ7E9qalneDRlmXo1ydiF1NxwJlL+OWl1rtfhgKzyzCUYA6gL0ZeXmDC
	YvDF5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1ccys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso142435171cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137776; x=1767742576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=;
        b=DizC8ebkNXb9TYMdZh+q0XB1Ae/08E7H75as4vK/Tj2kfc7HbtwYc7pMqdd5RZfZ5f
         FAU6pSn595ywCF5q/ouVRnOOt26DTFTFVhgsyFDa488C8sWKO2FCOQWoek/E1FK5YsAp
         i19IRQIUE9aqmveqpahTcNMc7o7XjRHQZHZ8j1r7M/whQvJFhDfiQ3IvN0QS9nB5v1oD
         XAe9DUdPz8WYKEcQs13lBBbiNMZN4tGxhoWj32IXUNJ4JpNag8aGap6GLyhVwdK3wXZp
         tFy6umIoYm9OmaFg8ztZTZU/gk8t11zjszxtXk1uTTObVWgHneGiGSktiyOtbIZcdSUO
         ClzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137776; x=1767742576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=;
        b=frFTrH5iH29oL2hYKR03dInRy8S1BwBtLgyFgVN2DjFfZi4SFRtSPEVvbshRof1W9d
         D19cDvwUXhN29LntN4zlAzRO19H/Mb056T/qpyCzLWuU0gHVmGLeZUupNmPPIDRI34Gm
         qHuSMo2sIJwkzXqBgZsIAhQEIAq53Mem93U2Ro7JIOQ0oUIUFDDO2TXrhvfM9h9jWAzF
         6JM4VRKzculvt3GxPwen1kggYd3clFgcYj4IkiWk02Ue74vwBTjlconKduLS979XV3nP
         tDhsThC4MBGzwInulQmWjWW7DhJ42i8ctcuZ/PnF/UMb3acl8LU5DXALWkYtVBuKHQM8
         pONg==
X-Gm-Message-State: AOJu0YyxROh1CsTvP/2PLzVwvrRTggWJDZdVI0s/MFhUeISkSDRfe4fr
	VSOOiOqzI3ASCNitHudzmL3eARcDbN5r+XVhOS0W+JbmuxHQX6maGLDNXBr9W3PFwMRqcg8mrAI
	I2sS4I9832xJvEAHcEFXgVDaQuy8a23jL7biKErgcjJp1CQjKU37P8zeXyrHqMbVE9E56
X-Gm-Gg: AY/fxX6hTMPxzYMKm28k80NKEFUvngjw3Oj5vA423cxdDKmfl43WIxEGmnxSTlsZw5/
	HHdpurrK9gGsHfPVp2QwQjp6533CQsr8j/Yv72lOR1m8cHlKKyiQXvpiWkNBQUXw5mOZ3G2BSkt
	obOiDKNWuUXEctVT75lG6fUnYZ+Fk+rrnDfLa2a7vi9QIMLjyzLjVT1azZkyGkeKUIJ7J2dpHxG
	NflhXQk/eEPPe8j7EKkU21bgnn/Ca25beYXn4bANAw4Xij0SrWWhI9AUlVP9kRo8gaaf2ieANZF
	rIKp/dZXecsll2xQ6EyD1bO5gV/RBkNQxiPHKfRQjH6FdmRtDIzxNW7J7TjvuLRsfFUD8VxMeVl
	oORJhAE4xnSLy/sTBVuOUduZ+JflMWokMFwFmvhgQZkULpoUENsJoSktKTZIiS0klSEGPuIbsLE
	xp8xfnxlx06J2nYKI1EM5PpSQ=
X-Received: by 2002:ac8:7d8d:0:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4f4abd8142emr556974871cf.55.1767137775742;
        Tue, 30 Dec 2025 15:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeHlzNHwWVyNiGrkZdVK9sqC0WDCaSDH/a1Qm9AsXJCXQ2gjEF5zMOFMszSi6RF6Kpz0yqFg==
X-Received: by 2002:ac8:7d8d:0:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4f4abd8142emr556974561cf.55.1767137775304;
        Tue, 30 Dec 2025 15:36:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:57 +0200
Subject: [PATCH 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EjTShN8dVXi1WOodHyvaBSpGXyNPhP2Q+wFwV3+ERgU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkSBQ04fZj+gnaMzS5W5ExjJFumBCj37eku
 0e91W+btOGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1Y1yB/9T2MJ50lAxN4Ym0ghqy8gq4J89OST84ANmpJsQq9cplqyWHEvCVx/T2VbwkWRlA/UYm0q
 4/g5GO+XzahA20G/QYH+jZhfyMlXbk9IIKMqSTL6cm/HV5UyyxH1mf+DNGYTGQK1+WzmT+b7ttl
 itCNZGLz9atRLFBp/AzRaVmYxzSQkrdNN1PdUtMLFLsHxaCBDZO1BgQW7Zp1e+JUJMEMD8iMXpL
 lm3OELTeBy/npBOI1Nz5DyLicQEjQukdWZfWUB7nRkfGjJ/v7FIcqQYzJmQLOlgsjGxat63qWbb
 1xZL3SvRz8+RgPhN1OkpsLwtLB+QmBieIqcz+P7G5tRqEhC5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Vn5lyCEHvBqzZlyDitTji-wVjnW_OHHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX4a12W6bZFtDt
 m/s7nWwf6eFHpP4DklZqr6iE6yjSCs0ewjTZuTFAm76zqZk6erStZ7JvGsnwxGMghOrFGPEfGtE
 moLgS0Ikru1xaVrr+AJAAQumjnSNQzn8ExVUq7Gz37nVDCa8Eue/O5iFlQRaHLhp6HEyyWBQNSq
 e41Bbp1ST8ZBJ7hEmMVEp7ek4FTyTKM1NTEeCCIuUuLoDEXeaAGM5gKmhsJ21eBLdItnkoofSRV
 7Nz17tw1UQb7WUI70kFxoQ09k0sFQik+dsFStEzF19RMXGSDURjJVzIZiCvOZNGVS33kqOxDrcB
 8cfwZuJNAQ2DgyBOHbxTYnVWZdm+XSEKPgj86espU3YhxWCN0SIW8K9e8ONqKPx8CP57A8MVh03
 INshNPXXXkJ2B9oZOrb7ahgpGYqcjlVAy30VRvJYU05tCzvSCevY/RgRI/bujHfXpNLtVYDIJnJ
 I5nEJKMxAdP5k6xYjBg==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=695461f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vj5tKrsnPMLlX677hvEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Vn5lyCEHvBqzZlyDitTji-wVjnW_OHHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211

On SDM845 SPI uses hardware-provided chip select, while specifying
cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
with the normal host controllers pinctrl entry.

Drop the cs-gpios property to restore SPI functionality.

Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316..ad283a79bcdb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -850,7 +850,6 @@ &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&qup_spi0_default>;
-	cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2517fd";

-- 
2.47.3


