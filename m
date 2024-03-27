Return-Path: <linux-arm-msm+bounces-15427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B588EDB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552DD1F377D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B68C15098B;
	Wed, 27 Mar 2024 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ID10q6LU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4014F9C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562933; cv=none; b=gaQ/7UZoRhSq39IQ0X7N8+cRhVGb32H/mZzZtepg0vnYIBmNF8xGXQzDd/hAG9n9W24/1zOuCTiQHQeAYnyzdM4ukTG7DkkZoPeOdERRuNzPzGetojIpCyFlJZ78F2MuYs3KTCCgvi6m0E4xvkCqX1o+Sdd9I5aQGTJ3k4D/VAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562933; c=relaxed/simple;
	bh=2J4GFcJEb/ok1nMNM2COXn5TmyzEayEQndQUNkB4dqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcE09smlddlCGN1Ko0WsXHtAtdPJUUQPamsl7nvQSpumhwAjJyQSubqN8EQzB+pb0lWD7ZlYe0iJs3l3j7Hl7YSs0/ghX9dElEZY9EIH48yrzwOY/2oSMuJmVeNsrQvGpC4+en0F7zTHYiKokMrYAPNoXQVuBl1QA4/uF7HbxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ID10q6LU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41490d05bafso1010415e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562929; x=1712167729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKtma1geY0OQRnHtThKspHVPEwvhLZRJr0GFmraQ2AM=;
        b=ID10q6LU1ckyZB31C81axJhTEpxxDrxTzEY1LFFSo794UBXhXggRBWA9KhevGFSu7r
         FQxYgWJfo4VM3ou4aGovieHYZUwv7kdzJxQU42yOIUOqI6gKBL8m6AxnvpnsyPO14V+L
         ogRAv3DQTvb+yLO3BgwcgaZ+HV5ZEo1F6WerghIImikunto2NTKSkSu7ENNVyKzdyovY
         W1dO9pianpovlizjjTK2iVKKFw6wPxuuxlYveHWGMuLgJme+O6F3LCr4HJVmYp3rpWzc
         3jXSrvXE3hUFle0HXec9PkTZw4F+AOVGs+xbBWtvs0+YM2JzXFK6tU+1dSHxW3rECpNT
         v5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562929; x=1712167729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKtma1geY0OQRnHtThKspHVPEwvhLZRJr0GFmraQ2AM=;
        b=doaZLBZTDYKVyywHhWaF3+13NZjhl5fHhcqDCsIhNQ8NXlugtC0iCPLx2ByHiFgcMZ
         hVs0y5oah3iVAqzFhTJif4c/ljk42/Fjd+TfoLSgBplWBhizik9fVs/kAFpiJe73bVhT
         HkZEE1eKFWqgU/iHIti72hrMqmAjcLwGtOESIRoH/lW9lu+9BB6VDR7VRvp/vV/AeH8A
         ZTvFTpEU0R6dFUQ53gTzPzUoxUyiI7mhiAFJ+Alo1MrVtH7xUMizomkhjSLBZyXksAk5
         r3IDO1rFcgZTAF1kZivD78kNC4RZ+Hu+dnA4OqE63KYfQ4noHwpnq41hM/txvb8zxYtA
         s48Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb+sg8C+Ak8iZVOt98Vqu4unqiGcu3fs6lJnHpfwZeyfvxA1IZzexXC8aM3HhY3uMut4mftgkr1fiMCxGkVBb0Z8Prt6R7/73gW83XRw==
X-Gm-Message-State: AOJu0YzO3RCpIsDBnzGIQddtBwIcbLmEhPisW10mG7rW0TjIvhak1NoP
	zK3R0S6iCeK8YSuFAfcFhw29C37ZIijM/FqHqwbMwy0oypmRGAuKCn3PWwRAfXE=
X-Google-Smtp-Source: AGHT+IHsB3GLxgP5XIxcW+UPWTDprzqykwmuw33rABaQFAjPbcDfqcHvD3oXaa7/QCIBqaYiG6I5CA==
X-Received: by 2002:a5d:6a92:0:b0:341:bd4e:68f5 with SMTP id s18-20020a5d6a92000000b00341bd4e68f5mr713223wru.5.1711562929578;
        Wed, 27 Mar 2024 11:08:49 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:40 +0100
Subject: [PATCH v3 02/19] media: venus: pm_helpers: Rename core_clks_get to
 venus_clks_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-2-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=1211;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2J4GFcJEb/ok1nMNM2COXn5TmyzEayEQndQUNkB4dqo=;
 b=rWV62J+CudHYBsig6BzDDpFCVZyvMzuo7cNi9KQPbqPsoeQ1YAY48CyGpCanimW3iJhftI1OC
 uZeNr0vPJoDBcjrFoVPEbLo4EKqjQaQoXYnESFn6PBHgNv8cGSOOaD8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

"core" is used in multiple contexts when talking about Venus, rename
the function to save on confusion.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8bd0ce4ce69d..ac7c83404c6e 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,7 +23,7 @@
 
 static bool legacy_binding;
 
-static int core_clks_get(struct venus_core *core)
+static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
 	struct device *dev = core->dev;
@@ -294,7 +294,7 @@ static int core_get_v1(struct venus_core *core)
 {
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 
@@ -961,7 +961,7 @@ static int core_get_v4(struct venus_core *core)
 	const struct venus_resources *res = core->res;
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 

-- 
2.44.0


