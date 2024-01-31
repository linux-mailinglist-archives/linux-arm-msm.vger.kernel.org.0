Return-Path: <linux-arm-msm+bounces-9167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855C843724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D492B23B28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D669255C24;
	Wed, 31 Jan 2024 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKorYLF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF155C04
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684894; cv=none; b=m/4bTtOEgXT1iaas3lz0xQdFvj2am+HYblE9ejDcNpPb+nDwsT4H8AgFZFa1g3YqsRBnt3YZsBVsbILorcTH/FteM/rPwfCaQ3IDyQHa69qaqWLOFBhhDaaWqPXzUa4Y6C+XXVMJ8LxNHVh6QhSNRnDgk5sluLku2fLqUld6X/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684894; c=relaxed/simple;
	bh=Oh+qBJcINLq2OcoHBhkxeh1csmVsCpWRCken5YykIEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8qVHToSYfjuiGrcw1UnQOhGwb4Z6gNxim/YFu6ju6i9vrLG/KENM7dmpF7t2kBT5EM/hUl7yaOItr+NDPOz97AQcYwf8GJU10w6NxQDFiFf6bjBf8FtMCxmFG4lmre8S0XS6qKv7ejXW8IquFrsOy+oFGClzXeRbwvH4Ut/GHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKorYLF3; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e125818649so1963373a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684892; x=1707289692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQzh0HKJLV9OIo7v+P8AXxLZS3sXrPK/5N8JyocCrC8=;
        b=vKorYLF3vNRwFaEv9XN8kgxd60oClUXukLF24RzPHZeXfGT60/RpTOpsDj00R6emlX
         tdAJ2bZ+8jA3hnSq/oWtukhnoGLAz4QLFBpcD06mFmFfltHE6l8vAckvJYX5ULAQo2pS
         GzjyEBSWnYzLoGeDOek//Xw7ajm+8SuFg9GUXbUqwTqACQ60Zuaz2mPn7Z9BduQNQYV+
         3bFel+IZt11cnd5ptskDzTWvPtRdnBn/9dso4WvyhEcuy3N0GNY/2Z6/yQ5Qef4OiyZ+
         heVYYccAzw3l8i5TBXNt8BiC53HGcYjQuBAczOqKSfYxzrRKHw6oGbxTtAM8SSTtP+Zq
         OtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684892; x=1707289692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQzh0HKJLV9OIo7v+P8AXxLZS3sXrPK/5N8JyocCrC8=;
        b=vaPktK/2fzWUYFb3My2eF37oe07OGiZqyCycwel3N+i4SXPWRvlOGxJjnDcPZnV7Ie
         fROI65HFLh7/32fGrUgiD0bl4cMRi3IX6V5mdUN51Y19TAVfH93+fDUq4DnLHCdb8rqz
         gRYaDH7A7lndffATUt0p9FMb2TWo7V0fG0MpJMbJpH1DwGj70JNkpM2Dv4MAzVVHg7L7
         KrJ8pnxhhMTAiLsBuYbu61qGeHhOMOhZgPVaQ4LBVrrkt238IZMjZy2oAxHIDxuReSk5
         F+4RNeNgrE4nSaz0B/JfaUsA8i/1nO2xMG/Q5pYsSSJEDwyY398TTeyASLvbyc0tY7cq
         3ofA==
X-Gm-Message-State: AOJu0YxDm4SUMeO2klICn8iBhVhGRLNRWzL4IUao07vitqHQ7wHvzuCr
	aJnvlXog9zSR7C4ly+0d9ApwHXPAkV1dcaecxJG6TrwWvXsXcMA4X7QpcuSBTg==
X-Google-Smtp-Source: AGHT+IHhaczXoyebcX0Ci/z75+z8a7nwadolealrO3mrZHk66PieHH3wFp2W4NYZNelqO7uo+4O0VQ==
X-Received: by 2002:a05:6358:2915:b0:176:a5f5:d266 with SMTP id y21-20020a056358291500b00176a5f5d266mr660926rwb.6.1706684892422;
        Tue, 30 Jan 2024 23:08:12 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:11 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:26 +0530
Subject: [PATCH v3 03/17] dt-bindings: clock: qcom: Add missing UFS QREF
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-3-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Oh+qBJcINLq2OcoHBhkxeh1csmVsCpWRCken5YykIEM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG7TeUQgpF/a42PzE+MhGgIrIUjlECuigRwm
 nPn0vpTJwmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxuwAKCRBVnxHm/pHO
 9a8JCACUr5RRPWChWvqVroeXCyW19FzPPkP3kW7i8BiXlVihSOZhiZS6z/ylsgq+r19Zl6xggQr
 KS6VA4AAunNd/PnXR1+GMTulirXY1SngbpM4hRKAk0aipixyBHTwFMCq/4ZjdVDDScdOy9BIh4A
 cENw388V5jgp2GpU/w24DE5sWW4jQC2A/vsco5bqDvqCwAmdb4puPFxQxwb7tQvMXMBtc58sXoA
 xPigBzG5dyXSa7DiX7MN2DlPazv1/1ZfxpbSqFCn/mECiFjPMr6gGdEa4IlK1mHFGrmwDA/zUod
 14V05wtx5CuXwbyj+vhpTDv5PULQo6K9etzwCzxeryQCW0a5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Add missing QREF clocks for UFS MEM and UFS CARD controllers.

Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index e893415ae13d..90c6e021a035 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -246,6 +246,8 @@
 #define GCC_PCIE_3_CLKREF_CLK					236
 #define GCC_USB3_PRIM_CLKREF_CLK				237
 #define GCC_USB3_SEC_CLKREF_CLK					238
+#define GCC_UFS_MEM_CLKREF_EN					239
+#define GCC_UFS_CARD_CLKREF_EN					240
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1

-- 
2.25.1


