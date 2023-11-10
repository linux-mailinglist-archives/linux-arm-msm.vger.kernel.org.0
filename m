Return-Path: <linux-arm-msm+bounces-397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE497E7662
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27685281814
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A4215AF;
	Fri, 10 Nov 2023 01:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVm1Gepx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E81365
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:05:00 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174274228
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 17:05:00 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c54c8934abso20885001fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 17:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578298; x=1700183098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=kVm1GepxG7CjuP/CSk3gtvvT6PzrXnahWDwPtHTJpiEa3x7F+jrEZI8WmzPysqmSoE
         OjqPb850bxrsXOly21iA14glW2B07eBnIes7v3WKnRwbUccHLVLlRx6teXZQQZArk0pB
         SyL+UZMspwOu2DtCRRObK/7TkoAAuakXzocNbj/HOQ0OspmEgLAJ83KEIfXnYiwvFl5r
         /lAxHQIEb6aLHsuMvirZN1yuuu6hRDEYGw1yhrZVvpwEbNqtf5cgKrQTnUJbkzSVFXrq
         lrKvqPj0SOTKAP8NbjSPx6tDn7FnmRAxpSwVKhVwlmupJrEBtJFQwwTp4nJhPmyTS2Iy
         ND5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578298; x=1700183098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=KNGOv6nBFgw8PNqIQXw390v/3faGpJRGf3hJmiWw1koRnrItHFGej7ZrAXSeZef+f1
         8npo1A/Hxt2NFP7U3kHKfjGkfK3gkNY4bSnIqPxW1qNIlezAjwbYqem8Q5PXgmuNXUC6
         FDfQTYjM1jVbcTY3W8pt1B12R7McQKZM00B7scRnemx2wOBDWiIAepMNzeOiIDLB9GYD
         Bd7f2XfJQqBhEoZFKMzVSMUuRHr48yXRYpzxkzThApl7GyxhJNLtYR7e2kwqEDaHhvJN
         eiTyd5fTWLSAFgpt2BqzeKHyD/kKPW5WekL/GfVuktczsmfp3lq4vbMFY7aEcDt9gMqS
         MTuQ==
X-Gm-Message-State: AOJu0YyvOO8FqT91LJ9h7O2c+llsrUBu4xc0FOo4uQ5d0WTztiyvvlWO
	+IweXZwS1bIvxM2rJ9MfbWm6Zg==
X-Google-Smtp-Source: AGHT+IGO6UmvZMd+QDCGUZMGgoA1QAKWo2qz6+2Fs6vQvRw/QvQsKdJg7ZqNXqHhXGL9zsVGvNFJlg==
X-Received: by 2002:ac2:4306:0:b0:508:1332:558a with SMTP id l6-20020ac24306000000b005081332558amr2632106lfh.2.1699578298239;
        Thu, 09 Nov 2023 17:04:58 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 10 Nov 2023 01:04:51 +0000
Subject: [PATCH v5 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-6-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

sdm845 uses vfe-170, sc8280xp uses vfe-175-200. Lets rename the file to
capture its wider scope than vfe-170 only.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e22223589739..0d4389ab312d1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.42.0


