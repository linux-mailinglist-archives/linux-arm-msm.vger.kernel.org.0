Return-Path: <linux-arm-msm+bounces-70411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4023B31707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65052B03A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938492FFDCD;
	Fri, 22 Aug 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkOUBPXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA392FF14B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864286; cv=none; b=aiNOvLAKmPRNSHkR65cr6aPg76QFPlbJBEtMaaf4f8iBcDZkO0R3q1ufSwmlglArfe2AMPCPk5Y5CLvfnpQ41jAmdMVjTydQtAwzlb7A3MzrzJ+traIXvC1jQhDbiRKoQGsBkmuUpK8xS6ruEAY6Ys8O6RQI0XfU0f62CESYZvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864286; c=relaxed/simple;
	bh=+m/VbJ8LuXiAvJGDr8ib87nIKbN+2PZQ69yZYJYr/6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIR/AESFmR976DhcTJmjica1u6HA3NCh+3OOTP4LbFv2ZoQuULOPim4cORi1Plh240TDlkXqu6hwnikB3gY5JXAq1cpbzJLqZ4+Aj5p8jRsdAtj4jZ/QqTLuHT44IKmCpBSe2GxNLEDrbowseXGE26E+XM5/2UVlLAk1DGq6qAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkOUBPXO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61c297e8306so21925a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864283; x=1756469083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK3Q063m1xlWvbyZ8GthB7BdAbmwNNtZ50Wt0YimJNs=;
        b=nkOUBPXOAJr5Wf2qAM+Fr2U+36IWXYVR7ouIoDvgMdpeBqyKgwesVuNW6ipqTv4n9/
         J4ndOUTvPPwVOovOUtF6Q3lhYr9zGsefvdL5wpZEEq1YVMDC2bQRTuUyMJrnPygi4OHX
         iAceBcpumAHNjDEUKeUvZmlYZb1oGOLmGA4ux1wjaMzZStCetRESiWXolSbvglQHsvKC
         fyuttRzzAcNHYILoy6lyScTsBs9FWaU/i/BSH7yQQHgXTiT1PLkcywE6Jw0JmiquXMup
         Sxvo9AEC+FC7k48lAdfnY5Suy97Pd0NSd3FIXSUXFmRwoZH5Qyn3cjWSdYPY0lWwf7E7
         1C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864283; x=1756469083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK3Q063m1xlWvbyZ8GthB7BdAbmwNNtZ50Wt0YimJNs=;
        b=k+IKD8CH/i77XIT8b9QbBrOqUKt4Z3bNBIdGzcEuHOrxXZILMpqREQQkqCiZz1YNux
         O9U4TiXfIC8VYLitGphkzM548atM4/9xknAaAEOBQhzwAC1UVcMGWDN4VLil/IjT03W6
         jZFLIrcYunxBK6bf8t1Hvz3NTC1KhA7Ykhm/iZDa3AztYl4l99AE385cKkakvr4iGMvk
         Clf2I+G9mofX5nuGr9f9APK73JjHwWn/d20WETv7FHH40U6N1HiDUte6p23swO5CoF0Q
         fwAU9SQtMB85i/Szj+cEpsi/Mt99L1Ajs8sd+GK+c0ifrhzp9yt9H/DhuNSKHjChst6K
         uk0w==
X-Gm-Message-State: AOJu0YwpXIDugoHWjj2rdo6pF/17Y0dWyjyjtl6T1LYw3XcDtz7+gqZO
	ntLHIG1BTXBR3vo7E8Hhq7aVR1UkzeHNk53zypCDArSDC9j6eQsDxJ4DandnSK0mRyE=
X-Gm-Gg: ASbGncsCMGQ7jLsD263tTxslKBrpUHEFPDoffFiQ3qnT5z95wEqG3++QTHzt7H17Vs8
	/vwteb6H8f+fEgy4KpLQMY5IYbI3aIlqw5TuDSOeGqrvQrw6gTVhodILR1DjBEasXluiwgTIfzS
	fM90BO2PjhlBOpLJaW8Yz6VXpVZw68xIAZLclJVem+3i/k7hHT20PTUdwNxGHD+JjubvsMBOy3S
	H1rf4+nudsIgaLDdTF2S4x/iqY5VYYK7vY4XKlujXoHZc8xA9Pn03JgfjtvlgbUYtlUyLm+waco
	8Q96ku/gqBhplENtactEHECKPc8eXLvOt9UTOL8Ka4OWxO8wTS1uQHmTdgKeWPwwoxvRB3WuMG4
	yLpXq55FQ+1ThdqirzhEh2RqPiDkbcIXpcMYRoXw=
X-Google-Smtp-Source: AGHT+IHOn7Ywt2vJBoupkCqFb1G1kiiUtaTbQGeCMZcXvMgExy6cHVcB6KdGKY1IP8daStonceaLhQ==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61c1b91089cmr1189584a12.8.1755864282676;
        Fri, 22 Aug 2025 05:04:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:12 +0200
Subject: [PATCH 12/15] ARM: dts: qcom: apq8064: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-12-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+m/VbJ8LuXiAvJGDr8ib87nIKbN+2PZQ69yZYJYr/6w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFzFSEPLcWHEEIyGDj1vtyh070nNpkYopnCYm
 4AIARReRDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcxQAKCRDBN2bmhouD
 1xczD/9JFCFLGMWHqU+utqJLMr7zQ3zCHcEsQ3nKHnHYA0/LpTnKmnfiv2B3zQ1HQwu4wlpKBra
 8BB5ip1gF0jCmTPdwz557fzvxWIZGz41OX8n2nhU6SNlvbVcJqVB5WG6BoemtJongNwBx2o9cWH
 mZ3oBEkteXLhrqoME0faO6UuuxX3RPW+/xRhQBbSU+6f8ZY/+x9qjvLi/AnjPHOs21ehA1YynDn
 SbHlug9VjXpAzPOA08bMpAdkBiWxJS+QxmVH0woeaba0tzsNRhpC9XQcvjmOcMF5RVFZw0rLucT
 uhBwoU7xEPSSs8gqZFYaZb0AbSyqLdID3W76Z6E9c8ohqwsvPlwdcs+nL2HsjzzTX7UjqaiuCgg
 i94j2+YCE/lL7WBBBAjx9IzTnFxEUZEnyslB0NOE7jX2bzyzxdDQvQl8FBxYw8kD9tIyuAg8DaK
 SA70OSyGYIGArB0v9luqh//yQFBqTJ1lPssCieT2LkJieDWt8e11YnpXrOi4JF7a4eqMploFTMw
 e3en6EOhQka7Nrfl1YMCiV7l4jtzafj2yiyPaS69zM387AUKaThzLg+LJeOOlgtIfYZJLiVkuW+
 P5zZSu/OBqDiDYF+yBRn7UXt3uCU8Gw8Iyf9GFnywBWB9/fFsDvsDRV4mRE6mVc/tGQtgaBOWZC
 mSxAcIVN5gsxyzQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map:
    Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 17e506ca2438b33675477b65584c2b15bc1ae11d..4c9743423ea880515a05148091ed97411f08e8a3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -342,6 +342,7 @@ sfpb_mutex: hwmutex@1200600 {
 		intc: interrupt-controller@2000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x02000000 0x1000>,
 			      <0x02002000 0x1000>;

-- 
2.48.1


