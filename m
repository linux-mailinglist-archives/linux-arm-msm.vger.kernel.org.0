Return-Path: <linux-arm-msm+bounces-15428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12388EDB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DAF71C32A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A131514C2;
	Wed, 27 Mar 2024 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRHSIiZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435D8150994
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562935; cv=none; b=tYIvtyBbElE4tbNHly9vLz9hZKxOx58Rb3lBk4QeR5XKzXl6/1HTbDuwwM6bwQq7Gh4gvRLsipRHCdeRJvHyxOnwE+a+qb4Am7UlL0lihsgKkrTw/dRWdlSYc4uHVvtSCSvVRbWuMEz2/qMzMiL+3bS4/IzjP6G7viwdqAXALhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562935; c=relaxed/simple;
	bh=0FsCQVaaR6mlZkTyREXWtukXCjlINsoRv31QgmDTlf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDh9p6/egJVOF3cBRtBtFE+A6M3fDT02BxXUgTIcNs8rwPBb/ozpA1GQIz3h5eNx6K8m2olpQIE9L4vqpWe5JQM/msqEfc7Jnhs09XO1uCUgL/R8qKqg8nR/TPiM4JgbSEZVdLiy6u2ye86rWo+zBlBnb9gH7MFuNFYQhmb4scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRHSIiZz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4751063318so16623366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562931; x=1712167731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cpiy05x6+KmwppdZDoeFtIMDjcMCWVRc+LYx5JwTOaY=;
        b=QRHSIiZzE9NdURx5SjtD2dmOvBjQioEuGVTBX7DeV8JvcMS36dFt6WbNlw8iS38QVA
         sBsEayhr0WjumwsEPah0fzq5/uL6qMa/XAz4Cdg8hD6zWi2vAIeENlrXstjaQCxikax7
         O9iIjhBYVFxbwUWaXHwXirXCkqzUPAttS+E71MbVlX62GuKqG9bu95tnPb0Vnz0Fsjyz
         kNlFTBKUgM6ir0ssAepSYW0F5Rfh7oD8bKLZPihrqhvOyROTyd2dj9P6Q/VbXdx0z9VE
         430Le/SH3rK1BGZfs1f0Pg7iojQbTeVwBLftdpqZJ+Q1e0ElFXbkjcKTrnQZLriCzsLr
         REnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562931; x=1712167731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpiy05x6+KmwppdZDoeFtIMDjcMCWVRc+LYx5JwTOaY=;
        b=sj+aoCSxYZ4fzuYFg8a7p/UVQOrVeZW9aIFTdv6FeFhKywMQQTx72sMye4CnoC5Nvs
         I0sZoHUWGgK1Iy/VoBF9ZZ7huzvQPJsQ/++tSBmQkYg2OUar6/EBae0VkNA6eeO/JS2m
         C2q+V4mDSlXhD0hmYAYIC05iXOnDdyMKREPVM0Rnc9fcWP+kpuAn3/gVPFUkNc0qHqfN
         Kk9rJ3jofrdd2TYVyoMPpGnE1NHNChAuL08FWKXJJRg2Ot06Y0KFcYrnx+69s7SQmUkG
         d5VuUI87OxB7r3JI/nBNn0f6eFiLl2ybXLVtcNIY7gHZXyJwCXPxWqsTaD+nObHSMmqj
         MyIw==
X-Forwarded-Encrypted: i=1; AJvYcCXdHiS0g0ks6XYAL9bh7CdOpG/znjTfL8Ijx/B1yAavxw/7ad5+XSu6Pzt311sanUGFsyFCMpQsROBnGgsUWTUEhnCIOJO6v+IH2vBHPw==
X-Gm-Message-State: AOJu0YwkemgckU4hbN5kr+bRvAhEblCJxMHTKe1zSprIXKYob99P6NTC
	ulQELV1YFc5UQ2Q1xsWJVX6qO3VztQPwrQWB4xPgdIXnfLP8dLqyw6JfgKqE5Ek=
X-Google-Smtp-Source: AGHT+IHydqg0ryKTowRqgPPxpikjTmMXrNDLePw6z1aW3FjnX1XIQsJWSdcaJJk1RsmEiO76VwqCHw==
X-Received: by 2002:a17:906:e209:b0:a47:29ef:f3ca with SMTP id gf9-20020a170906e20900b00a4729eff3camr165767ejb.31.1711562931607;
        Wed, 27 Mar 2024 11:08:51 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:41 +0100
Subject: [PATCH v3 03/19] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-3-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=2193;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0FsCQVaaR6mlZkTyREXWtukXCjlINsoRv31QgmDTlf4=;
 b=XnknYN2sPi2dJ+IqyT2Vfoq8/8onJ2qiUbiRyC6uKY00P0GSoy+wFqTEbOhtzn8LOy+0HBZBn
 bddAPSiXr86AVYTi8xNlIi7MUuDCciF+i/4xzPBAPKg+681HKPrZD3/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make it easier to understand the various clock requirements within
this driver, add kerneldoc to venus_clk_get() explaining the fluff.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ac7c83404c6e..cf91f50a33aa 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,6 +23,34 @@
 
 static bool legacy_binding;
 
+/**
+ * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
+ * @core: A pointer to the venus core resource
+ *
+ * The Venus block (depending on the generation) can be split into a couple
+ * of clock domains: one for main logic and one for each video core (0-2 instances).
+ *
+ * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
+ * domain, so this function is the only kind if clk_get necessary there.
+ *
+ * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
+ * statically defined a decoder and core1 an encoder, with both having
+ * their own clock domains.
+ *
+ * SDM845 features two video cores, each one of which may or may not be
+ * subdivided into two encoder/decoder threads.
+ *
+ * Other SoCs either feature a single video core (with its own clock domain)
+ * or one video core and one CVP (Computer Vision Processor) core. In both cases
+ * we treat it the same way (CVP only happens to live near-by Venus on the SoC).
+ *
+ * Due to unfortunate developments in the past, we need to support legacy
+ * bindings (MSM8996, SDM660, SDM845) that require specifying the clocks and
+ * power-domains associated with a video core domain in a bogus sub-node,
+ * which means that additional fluff is necessary..
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
 static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;

-- 
2.44.0


