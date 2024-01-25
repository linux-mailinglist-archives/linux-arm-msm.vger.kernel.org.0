Return-Path: <linux-arm-msm+bounces-8202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B983BCD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 072BD1F2EDC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B2B1CF8A;
	Thu, 25 Jan 2024 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="L8i9rPO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8571CF83
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706173483; cv=none; b=e/QUzd9UYbM5vavxG5ydKW4qo59ZCqwoHkrJAi7lJA/l3jnIYFl46S+Sp9ZjMd9IaFHHz3kctPF8kT0uw3CsNy7btJQvRrztvhnC+36fRAsNzFdZzWq52oIfGSdqx/s6Vr2gOv1EqLwon5GGwgLs63w91RhfjkQii3Nycn2zHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706173483; c=relaxed/simple;
	bh=1ZuHMz0UPf9fpN+oNp/CzmpVpY+TQmRD3sVoq0vJuhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bTzZboE93Cp0bytZHLVk0Pu2VKdzvQP11hmHMRhRy7TlfJRlnmFgONOBVMhbWCaWOGIb9F2pSdIB+aMZ2Frt+nM+dibzKU0Ud7v2MiWz34qSjcKtcuMM2IiGRleLIq+wJ0ExV/piviE8BDrkMM4JuzmB4dUnNtZw02rT8zHwxec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=L8i9rPO6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cf3f342831so448531fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706173480; x=1706778280; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3N3URrnd5ucFNbanADos3DaR9UQgjlnJH35oPDjMhLA=;
        b=L8i9rPO6y4TPsGURcuw223e9NcHf0l5iD/hLm8ae1zD/eMRrNjMJIeQMGLTVVVONWD
         akaQ9DAE5Wz79jD25jdrp6Tn721AaQUt9SdezJHG5xxWDzFI0U0ZXus+RX3O03E3YvA1
         zcMRADS9mndMKM7SehZxoaSygDiBAIxxTZF5k5vy/ii3L4SqZXy+yOKGDFFsvu/a0s6e
         TKJsyVfw/fWk4NaHASP00Z/4KB9Qcc3wrhDtPF9rUxsaeE1UR2A9TeE+0KrFfEW/H9n5
         fI8G1PBcd/UF4hZjmqP77fe/DdPuUpSyPFBzLMS7HHJl2dHAhuTockLg345mUYbx2Anq
         Rohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173480; x=1706778280;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3N3URrnd5ucFNbanADos3DaR9UQgjlnJH35oPDjMhLA=;
        b=FjkVKWBaTN9wpmaQF9nxZyAZoRPK4ByXBvP6N8tfiH6bp+zMF5be6GlxukA0MhbCXM
         WCiEv8kmcTXpZiGI6CmuE7E2tjOVmS2cuvWH7B840jmRXKvBH9pVKHyDLrUbtb0QNiGv
         /gKXAG+c8tiWGqD3RM1VehZ8mr034yMB4r1QkqJoHC6yJzHnkVILoVO3Ewa/24/HGPxQ
         1cV4mzF1hKSNKpWIRKiQWqP/cch+H23V5Io7v7C7pYz/tXdM6U20kPMbQGqD9cjF6+sn
         EpL8krbyq5renCTg787zyZKrv0zEOEfYAludw7qMLwTXn+GFJqulxkqVRpnwVau2ZYiY
         BCJQ==
X-Gm-Message-State: AOJu0YzNlFiW5kMNV0ktxCQZcM0fDAJTIyrQsEazy/zxuiHzXmceOVIW
	heA/81Ca6oKG3inAfn0co21+wzMdORCirf4x4DMJTyRTmnjb8bszKwFQsTqgFnA=
X-Google-Smtp-Source: AGHT+IGeZLWcNi7/tozSCzATkAk0zTJjMA7uaR3SVHOkGyoGZ2O7O/8Hh+NozR6HMMEGEy0QWlmUrA==
X-Received: by 2002:a2e:a268:0:b0:2cd:1d5d:323d with SMTP id k8-20020a2ea268000000b002cd1d5d323dmr216560ljm.22.1706173480319;
        Thu, 25 Jan 2024 01:04:40 -0800 (PST)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id m10-20020a2e870a000000b002cdf8c9af34sm229123lji.57.2024.01.25.01.04.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:04:35 -0800 (PST)
From: Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mantas Pucka <mantas@8devices.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: ipq6018: add tsens node
Date: Thu, 25 Jan 2024 11:04:11 +0200
Message-Id: <1706173452-1017-3-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1706173452-1017-1-git-send-email-mantas@8devices.com>
References: <1706173452-1017-1-git-send-email-mantas@8devices.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

IPQ6018 has temperature sensing HW block compatible with IPQ8074. Add
node for it.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 3d0f6621ee97..f2765fe8c20b 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -330,6 +330,16 @@
 			clock-names = "core";
 		};
 
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq6018-tsens", "qcom,ipq8074-tsens";
+			reg = <0x0 0x004a9000 0x0 0x1000>,
+			      <0x0 0x004a8000 0x0 0x1000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "combined";
+			#qcom,sensors = <16>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		cryptobam: dma-controller@704000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x00704000 0x0 0x20000>;
-- 
2.7.4


