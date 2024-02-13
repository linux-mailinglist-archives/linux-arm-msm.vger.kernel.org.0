Return-Path: <linux-arm-msm+bounces-10871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B1852F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0DC71C22AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337A054F8F;
	Tue, 13 Feb 2024 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkkjoKGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC454BE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823348; cv=none; b=rxZOM1fMNeXikTEyNpkw8of/nIaRnTf9PkzKlByNe21zb2s8kXYmc4iRMlNALb04JizuFjv634vij+4SUmz0NxgCl31MTgXexlzvtFsiehGqS4wUp1b7Lt0esrNtSE0h/oyXW0NDHEC5x1kNW9tTTBTKhEsV+TCIn+CYVdd/0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823348; c=relaxed/simple;
	bh=fiDOpLgmq0dhXTsGReQzn91SkMU/B6/9yS5El4QNj7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC+V7uaJXR3oSs5uzK+AJAYfmg7eW23MzYTQeEExAjss57ApE5ZkRh2iCGxOhHx/gwD7YsDMjDm/zTcFoa3DRRMovpreLdhKiWMsFUqYzWM00XihYxoqk7UoFZfgSPViM51CFfYjIf+tawUDNWjGb1Y4yh1LNuzNknsR9YZBHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkkjoKGh; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0d799b55cso52470371fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823344; x=1708428144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKhZjVbHN6RAMy80lvLoRdR/PUJnnb+mAzCw+vwLxqM=;
        b=MkkjoKGhvHQJlfIXrEo1a3PKW8FSUm+7UWLrJUlX4X47z/o/uv2GqWdyhqsKQkOmXJ
         baTxx/XKRla3HjCAgOPUqLYntUSVmtiROUI2jvqjS51gzOmiBtkxWLoCsrAxSerlGZfJ
         cXfkNNeV53Er3XFFNMYCJJyuy8bXJGPJjz1O6kwKSFmpBKeRWGZm0A06TG9wzM3rabxA
         aY4mGgIpg/y48X3Vtt8+/bEuDQIy3lhedyYtIsFq2hGX1ZzJQUtIu9PDsGgxsU0utB17
         L5JbO8TXkJCuFQUgS/sQfe0dy0vRSV34yuLZ+C6owe8310dF7jSSNZR9v5IZ0u6qBZHa
         2s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823344; x=1708428144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKhZjVbHN6RAMy80lvLoRdR/PUJnnb+mAzCw+vwLxqM=;
        b=fEo/bVBaFVzGsHtXdph/K70gh+OANZ8khp24pjb/fNYQe0Jzmq8DlD2oigtxSR7zeW
         p9GnQBbtFEshHuh8a/YHBoc3cEC+4KymRXO//ocEst0VgXL/p7LgWJqc9eWcGMYmcSPz
         +OQbEunf0Z/SXNYEKVc4cc6FqUMDyDhuubYS2qUjizMXnr+W7dQqG/ZtQ55IWoMTQ3lN
         mHuWGXnU1hEVVUpNGxG74xFBaNDtCC7KsLnvDWF9RWZzisF7+qXfuZC3yxAbzd9QFOoQ
         UYu439m9/tmcu16ZZVH8yEIKYi5owDQ0tc0chYDHoJpvU28Fsn4X81PAoy2YiJg9/GTZ
         ti2A==
X-Gm-Message-State: AOJu0YzOzr/8GYWp4EBgRYhvqYqneh2tEqVFo0u7qD9Ts3VUfg3m0JEY
	ABKwLYXuBnPatedaIpblrvqamO40D8Lyc2O7UUNwV2fAepk8xS22wrXGpQyWrEY=
X-Google-Smtp-Source: AGHT+IEfKB4rkfLfcmlvvSC+ML77ImJf5Qz2nc3HMVqhmVDix5KcD4l0ahj80Mz2EDYHTLp7On3gmA==
X-Received: by 2002:a05:651c:19a1:b0:2d0:a3b3:e39e with SMTP id bx33-20020a05651c19a100b002d0a3b3e39emr8871029ljb.28.1707823344066;
        Tue, 13 Feb 2024 03:22:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlgeog5zkkC5HnKBSlVf00lxaiEcElHKCsR7k3mgKr3yGs7tHAzxjGclItisLH6Av+5f1NDe0laTv6yZjbwhwSH6g1Mzu7ILpIAmRanY0Q3USzy0mbQcUxAD6H3dHjXyiGCIv+7ZXDcQw5wNL17Z6SMwCrwnRkVfrlrstdn/65TQyiPD5bhP3u86d+sky1rRbHZjpt0FLIVWd1D3MM6w2Yjy5K6XlpR3mIGol48Yl3Cll8hJLnFFmNpb/TJrVYLv698eQleyw7rtZZcqct+MghhJlEWBioER3b49tOE8GrtlBSZ096reWw6Kru8R66kR/YYh+O/H1Sll234eHDxQKgpAwVSB6WCYGvsEB/hV0Gj0DDyoFfqK2Y83PydVuyy0o64KB9zSxhPPUPBRDx9RuFJJnIZ6SDl8lmZq1OW2tOO5jlG2ikCo3V6TssBHJzh5tSjoZvbGCCZ8xUEGvzpcxKnNwe661QaYnYvf+yFsPY8wU1AvEg6CDQKbQh0Bk7dDPMsNA7ItdksuXVWnXLyelPicCgycof4Yf5RcsxO8O9BOVpenyyrYbIZAdZDyEKEjAkzSF39YW0fOa2KixiCe/zBQHB9E4nb6Tezsv/JjkcxIM=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e964b000000b002ce04e9d944sm451107ljh.69.2024.02.13.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:22:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:22:21 +0200
Subject: [PATCH v2 5/6] dt-bindings: ufs: qcom,ufs: drop source clock
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-msm8996-fix-ufs-v2-5-650758c26458@linaro.org>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
In-Reply-To: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fiDOpLgmq0dhXTsGReQzn91SkMU/B6/9yS5El4QNj7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBly1DrjoC0cfqzBfI582y2/cjvC/gG/oni/soOP
 qVQceJ34YuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZctQ6wAKCRCLPIo+Aiko
 1Y5XB/9x9Zjm8dG4TiVQ6VBhIH9rBhhUwn32IfI88NCVeb4igYO1Bda90yPhuXv0PTF2ZulG00A
 psWtbU8INsbzt5E7/SyZ917ZGP/L2owmuZ/D5/jmx3EzDOwJ6tRpiCWv//aai6Ydjt/VUjjhlnq
 7UQZQHmufqFps2dOLK6PvCd8AXcNdwFMdZDpq9f11zdnWXtQmskNj5lAUBcokQvhmrW8eD0aK9U
 2ggNZGZKvCqbZcajpEoKt3UmHW41J0mBMlbmImK7P0x37XsXHx8dLZzsVjhC0rzsY/rZpf5TWRc
 7uKK1s+AjS+PYAlFgVCz3h4zuHhJd+qyH3y40vIQ1j7WlzC7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 9a4f2b43e155..649f7951ac01 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -44,11 +44,11 @@ properties:
 
   clocks:
     minItems: 8
-    maxItems: 11
+    maxItems: 9
 
   clock-names:
     minItems: 8
-    maxItems: 11
+    maxItems: 9
 
   dma-coherent: true
 
@@ -189,16 +189,14 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 11
-          maxItems: 11
+          minItems: 9
+          maxItems: 9
         clock-names:
           items:
-            - const: core_clk_src
             - const: core_clk
             - const: bus_clk
             - const: bus_aggr_clk
             - const: iface_clk
-            - const: core_clk_unipro_src
             - const: core_clk_unipro
             - const: core_clk_ice
             - const: ref_clk
@@ -259,7 +257,7 @@ allOf:
           maxItems: 2
         clocks:
           minItems: 8
-          maxItems: 11
+          maxItems: 9
 
 unevaluatedProperties: false
 

-- 
2.39.2


