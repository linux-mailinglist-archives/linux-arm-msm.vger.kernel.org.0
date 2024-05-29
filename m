Return-Path: <linux-arm-msm+bounces-20949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CA8D39BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72315B2535F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BB917DE0D;
	Wed, 29 May 2024 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7+wBM/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78CA17BB0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994031; cv=none; b=j88orvgvUm0RWQuab5YdsJrp4jy4dRK/wFUK2TyHiLyMoSIAwzeZWwNujjACMeeYT85gANuEbV1HQcveoWBRZAzPah5XVyF+UavWWM7tYhTLYAy8G7G+4YT1r0RXN3N4RRXpApprbssn6spGpS3DuAuPvkw58WkRVN562cmyKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994031; c=relaxed/simple;
	bh=07w4w+wcz+s8WoLWWVideIAadh1jMDKIz4U0xNk1izU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHpAWtgxVl9EVeir02nVjXsrFvCUzmhRpGlLImH+64C44Dnt8nxtDS7LNQU2lzpQHG8/BG/y6qaEQW/YAIeBn6jcw0Ra9tmAalTjx7KvwPUjrQGqmIXgxlT5SRzHn1F+YLJYDUy//MurXWx5b6I2c0VH685bRSUK1SsdPNEi174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7+wBM/K; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e716e3030aso19881071fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994026; x=1717598826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnc5iU5guGKDIIwBfgQZYLnSXcG7LxADDm3Oopk5kxo=;
        b=p7+wBM/K0YG4ofkXkcut5WmWwkDUrAUq23UrQdLiOSYRwrbSlUdG9Vi4iTMBEt9VdV
         uakAFt2+5lVskYXtlz5x+8dYX32FLrulIPxFMrpp2vTMuC3EWnohF+DglbK5M3EXwyPA
         MW/rrrRHbToSPfep4QRijIE+ogAA2C42KISBLToaNojDHHssPldcuyxq9SU0uo2cH+Wu
         n+t1D4xHcvuqYeUo7hUrg+mJqahVEqvDpoBErC3nC6ijhbCXVit92aR9uK16biCSbQRa
         t4dZejQf/hh5GKbBeiDeUzK6Mz4QohgAZnw1aa8qqVj8UEMRYT2XjfdQhw1foeAj7FbN
         3WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994026; x=1717598826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jnc5iU5guGKDIIwBfgQZYLnSXcG7LxADDm3Oopk5kxo=;
        b=Wz0LfR50NkoeDo8ghYmjSsBNzB3luEozpAL0uIZA+v/Jr+si/SItT6qeUOYkSoIxuM
         RuXGpIiJhuQ487IlzRDQ3BYwkcIkSHrQkCcW5njcHq18p1W/UshBZ5XbJ4lCQlW+PRTY
         GDBix/qVXhovSTsHwDwo3MAVFpUa+2BHQIRBfsXD6KczPBG1mCjAP3+qdODQY3t8Qtdf
         KGlmC4rzRrzY7XNsv9rRvhVAknmj37oAxwlIeqSt7qnfUzEaXftTKMe1rz71kWhIORA2
         O3x2/Xp/sX+lYWt7hyc7Bgxsl8JLtmFsMS2rtWT6vKWZPXVsL3N/aFw+5YyfxSpJwnh+
         jRVw==
X-Gm-Message-State: AOJu0YxTVdrXOvGyDHsVex3HaPC2gWPjNGB7D0kl1s31HcxsuDNouBgK
	O04Jj1ARiKFJeM7XhRsERlCFDgcPveZNp+HQvJPMxp5shkj0AYZAHikQhaKTy8I=
X-Google-Smtp-Source: AGHT+IF9klEj3u2d0bxALWZkHF45QG0akrcIFU6EXrt6OznAUUQkCYBFepCVroxYrlosTc5qCbm4sw==
X-Received: by 2002:a2e:3518:0:b0:2e1:7acb:6c40 with SMTP id 38308e7fff4ca-2e95b0c12f8mr86853821fa.29.1716994026263;
        Wed, 29 May 2024 07:47:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:02 +0300
Subject: [PATCH v2 04/14] ARM: dts: qcom: apq8064: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-4-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=816;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=07w4w+wcz+s8WoLWWVideIAadh1jMDKIz4U0xNk1izU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q4/RPvwEXd6yStWu9LTj2UtfzZnm/r1BIeOp8M49eer
 PneSUOjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATsShg/1/0jS/rya76QG3F
 9997Izhywz/2P69jNZG0qTvpvNcr2tbV8fcO7vv6X+1ttRQDXNNtv5Xskaucu6429GXTzwcFyzn
 8r5es+D5BbmurbSTXqXXL5L1Dn7ieW915M/7Hu1tztNvn/NwpEGr/UNjGxVhKdXPZ1s6TKRoNhk
 xcH2fI3Mnz7mj1OPeg/5FrxiO+ySt7VD/a+WUofUk9qnnZkde2U3y+cevBgkM/JvHw2C90szz+6
 LT0tbxizdcvfS5usap22vhkkeglz3cbfKuuCth5JISbXSlpTvhj22k5O2n2tCqPjU8Fkt43NMjU
 1Hdl8PtsWqigxXF+StzsCYnzr+kFbFCI03Iq/NFg6n4CAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On APQ8064 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 11e60b74c3c9..178a3b424670 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -684,7 +684,6 @@ gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-apq8064", "syscon";
 			reg = <0x00900000 0x4000>;
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			clocks = <&cxo_board>,
 				 <&pxo_board>,

-- 
2.39.2


