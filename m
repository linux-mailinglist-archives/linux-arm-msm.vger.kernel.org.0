Return-Path: <linux-arm-msm+bounces-73724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E1B59A23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090EF4A227F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3D9324B1E;
	Tue, 16 Sep 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSuZ369x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F18258ED4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032388; cv=none; b=Mmfi9pDxO6rvKWnuUt6pohyTLkdkWGA/hQxcjcpjTzA2FDu+v3w/fb1rXzp13iLwjKHvWOQ1m9ocVq8mlUIBtoZwilKN37fqD7LHO/gIAEg+cAlUQNFVhA7TNk2yNNpNdxoQQl9ORh4FEkrJKlnzRmCaghGdGT5L6WrMqQxamQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032388; c=relaxed/simple;
	bh=IkW4nK/vinXYi2bfrKKAAwnIOc30dbD41Dd6dOR/Ldo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMMbwNehl8JhhrP6nUcHbeY7CZjYi7DGMBpdGPPPl/r/LxeNq/G5DmCa9gmwQOfnLsSMKC0KDEcB2I04cpInZDiVT8/XHD/79GSRKdHyZ1/uz4bpeb1cQ9W/Aouo6G1CCYjPbE1dRzhWpmPp3KsEG8681Hv5RpKzXQD4Zw4KCPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSuZ369x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e9042021faso2093060f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758032386; x=1758637186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtjNvPki9FX33kkHGpqKgjuJyKPvLiypLHYyt3prAwM=;
        b=dSuZ369x3at3HvOo1zi/P7neUerMH16IN8qEEjX/PgKSQp6+YOLK16HhHDMsCuCwvA
         vdT32WSgailg55IEn4kbgpql03gu2tJ+bGlDZ6iBECv2RGbTYBnKio4s+lusm93A0mrf
         dxnS9OCGdk1u6+H9a3bFve10aKB7Vf3U/YEjlyH26gfYQCsfoV3hXVCBB0eOr7P9TpbH
         9+vDRmi9PoQHSY7IUGgA9rPsJoOPjTmiBsv+7hlO9AZWC8MUuX9PegxB0phvkcoOPawu
         yokVmsQvr42UZCdMAwj9yulPaxWHaC93PHenkaF4RPYQ6rm63Rmqt9b4lz72bD4KhDgL
         fG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032386; x=1758637186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtjNvPki9FX33kkHGpqKgjuJyKPvLiypLHYyt3prAwM=;
        b=i5H0ejTZCMHztuQFMk5461h715JE4dL9qyWac3fi/qkdoC+7cZcGEGzEBtQRTakd3n
         ssx9IYF7DRl8OQqGNwDM6PkLOTgREwiCVrA6qu59S1B3I+/5oiKelpiBMV8BO3yJQ4fo
         nyAyLh8wiKIRp9lbes5SDCm/RgVNGpq5T8Yp1krYfV6DsPEV9rmJ41c3RiOc1oAJ/7VM
         XG4majJDiA8B7xALBqyY4QawiMy1UTTO6Dqpszh7EXUen3emakSg5YvYe8vWhUjWZ0m8
         wjppSncp5eXyOo8NZu2vEBn89zYmZEfLKh/ZPuC0+5fdwjwppSKObcBRmvbrkj+vK7uy
         WzAA==
X-Gm-Message-State: AOJu0Yzp1QwQa71aKcA0AcKldZAGgYVTXsASjjmRNRtXL1T2G2n1OH05
	l2iCkWT3Z2CoOM4zXfdULBUZ1iBhHP1a1xd7qUroerWjFOnXRTgLFzM/6+ei/T7pd8NDo0NayFl
	cWkD3xvY=
X-Gm-Gg: ASbGncuvUloyK/250MXD1+gjz9S6ZK7voIWpH1nGi83x67XCyfGbBDcLqdTi5IzIvt2
	YxscXtKU8AOOruhNkPqEQv2r/BbC6xIRfNH2F40MpXmpZrMjHXlwVtKxMeHuwtjwSvSkn04pYDV
	g+IHbZI+fsbBHW3f74ZnlhYpPZFCO2eHpIwO605uowS64K4KsG2TNmai5+y/LUvfwZ3BJQSW1Oq
	1sHuxqnFuopCSYN4PKSXQkPYBUS7QuiwD2Fs7fVO4Fj9Z9OQwGqsckCPvsMJuleTfyCnMMxLIMv
	tgF9zhoefwIL6n+tFezrKJKen+/JusTj72phiOy4jGq/dmTp48WfL4FKM7GM4nmSD4ZiM8MEh52
	PXqdHyjyjU6R/WGfpeUkPl6lWZINTrC0=
X-Google-Smtp-Source: AGHT+IFdcw9hqpwZPogQtp5veCDSAw8ABo2+U1X+L5NI/DxNsiFcjHEYgUJ3E2vGvtEZVPnSECGu8w==
X-Received: by 2002:a05:6000:18a7:b0:3d4:eac4:9db2 with SMTP id ffacd0b85a97d-3e765782b5fmr18609594f8f.5.1758032385579;
        Tue, 16 Sep 2025 07:19:45 -0700 (PDT)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d7595sm220245015e9.24.2025.09.16.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:19:45 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH] arm64: dts: qcom: lemans: Remove unnecessary cells from DSI nodes
Date: Tue, 16 Sep 2025 17:19:31 +0300
Message-ID: <20250916141931.601957-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warnings
Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000:
unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

Fixes: 73db32b01c9f ("arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes")
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
I haven't found a pending patch for this, so here it goes, sorry if someone
already sent.

 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fd6eb6fbe29a..a551f2a274a2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4524,9 +4524,6 @@ mdss0_dsi0: dsi@ae94000 {
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
@@ -4606,9 +4603,6 @@ mdss0_dsi1: dsi@ae96000 {
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.43.0


