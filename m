Return-Path: <linux-arm-msm+bounces-23928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E75BA91495A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B1291F246E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6A913B586;
	Mon, 24 Jun 2024 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHfor9H/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7D13A884
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719230997; cv=none; b=Y2dyJ4pia+6dMg/jb1D9Zl2jV3Ke5op8GbdQOh0VVdh25guyY3ss4YRokfi1NyS7ktJR7+uL6Ydn5qzB56DnIR2tBdRg2LRsxE9K/1vYDMxg9rXoSPOAQgLpcXol3NpTchqJjvUMv7GxDHEKgN6pHANop98osVPe9lov98m+C5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719230997; c=relaxed/simple;
	bh=xcGf3/iitYzl5ANnd3BgjTG/HZRXCADu/ZHVJGALtRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j55DALEBFC6Ktiwny7MbyHdNJe2s2/x8caQiC6yZLzZijQMdF9BvzpjorHOfHsid7mavc4KzXgXn/BG418WfMpcgQ1SHNVpYKKKB2MlCgq9MZmo5tP4esPAfXf3GQZYe8UrYmVWOAkqqIlxLuyprsWSJlch3i+dbioCgR1ucOqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHfor9H/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so57882711fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719230994; x=1719835794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIGYlfS+Ua50ZsHWwz1Y48eq+epyebiBLbUECLU3y2I=;
        b=CHfor9H//rsMIBJrbjuuCqqnpitiy0xtPpLeoSDv7RLdb5AI4RqYNhKvTHTUKJUoTp
         FwuouNLWBpe3idTbknC9UfTkbDu0VYP+LkuIWfBtTujLfqgp4CZ7HIh2ez4yLKb1whi1
         88Ye7GIBT/OR5dW0/3fg1GaJIy+mM+mWkg+/sMrR2sd/07RKAwvzrkuu2+Gs4/LpPgeF
         7N4NDQ8wkZiWwFyO8QRzpJdVErwHmqbXOTWX14IYNTQPhHGhqcf+j/o1zo68I03nt06t
         obVTnOOpn9dcRnsjomUl+2XswLpRPzkNzVCSCpL51Y5FCJlNCLYmSmuxuREdCnQRLFvv
         Anng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719230994; x=1719835794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIGYlfS+Ua50ZsHWwz1Y48eq+epyebiBLbUECLU3y2I=;
        b=Smwcg/1SjwxbaDvvseCluQVpT3q3rMIWHako22fSulzeZsHQAP29m7NdPDbpqizU3n
         jIK/EJTdF2ukFdFNujnRoiOj8sss72xHcrHH/R+poQIXVjtqk/CA/djwr+wgcWIs4/eZ
         SMM7OjXERbCEsybEE8my+PYoaX1ftbdMU3OG50CjEbKYoqfZ6P15ENfFWahTlrDhl9TT
         JT+7eQ/YOTNIdq0TcW8SHKqSov6ClXvg5KaajK6IG5RYWMGw3KFtiafYTR2tUsAp/Dbm
         qazqJzRZwSckTKG5bDbqYXhzfb1GVvAMmB4kjpmfmQzhJcK5sLuhHbCbeNNAK/lc6Amx
         3ZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpp3IRFwhhwTCV4N/CFGbRLDvpMYT7fZ7Twa7HS/F5z5pk1oWRMl1y4ud6tgfn5g0Ec/L0A9WG0W5g/m9sH0itLcnZLZaQc4il8lYy+g==
X-Gm-Message-State: AOJu0Yyfy4QxO4xMNGi9sZJ/3o7xTaUP347h9HBBtg0In6LLtJPyywRB
	6NXwYjv4AAFjMzSNxl8hHv/xfQadReKHmIZC5BMcWaiZ9ym38SIeOhzInQ5uQBM=
X-Google-Smtp-Source: AGHT+IHXlOi6EFr8doW3vP9pcHJHWuVxLfznu4H+Dwe6fvIaCoMcnyH49jvh95vBEblZtxjoWmwI7g==
X-Received: by 2002:a2e:8242:0:b0:2ec:597f:664 with SMTP id 38308e7fff4ca-2ec5b2c4fa1mr31108131fa.2.1719230993559;
        Mon, 24 Jun 2024 05:09:53 -0700 (PDT)
Received: from cymric.caleb.rex.connolly.tech ([2a02:8109:aa0d:be00::52af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428c18sm404086966b.24.2024.06.24.05.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:09:53 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115: add resets for sdhc_1
Date: Mon, 24 Jun 2024 14:08:36 +0200
Message-ID: <20240624120849.2550621-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are documented and supported everywhere, but not described in DT.
Add them.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 21fbc9f15938..48ccd6fa8a11 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1087,8 +1087,10 @@ sdhc_1: mmc@4744000 {
 				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
+			resets = <&gcc GCC_SDCC1_BCR>;
+
 			power-domains = <&rpmpd SM6115_VDDCX>;
 			operating-points-v2 = <&sdhc1_opp_table>;
 			iommus = <&apps_smmu 0x00c0 0x0>;
 			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
-- 
2.45.0


