Return-Path: <linux-arm-msm+bounces-50179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28CA4DEB5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0B2176CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FD020468E;
	Tue,  4 Mar 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkMwFDLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848B204593
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093636; cv=none; b=g668t4VNHGankNFa/j0c2kQVyKtMDNdXIiQnk09D6tmdtqQFmVQwNIiXUF6tu4bnDapqCO0pEdjxtwVZF9exoWomKqsbEMBgHIZgzY/7LWz7cXWsKLXzx+hALbY9/s9Ve2LjdAtUuZhPzIMR3H5jxOrHeK86EeQke17iSDURFnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093636; c=relaxed/simple;
	bh=p6tzcyV2ztMb72HG02Epla8JNG+sbRzfglIoOgRfNwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Upw96q38tYURJRu3+2ObKpJNUu7rZuoe1LQ04PipNb5tHtiUY5/9yhOEdZSURM5xIg1wgiD/aLwpDK2J22nMtc+aF7Jhp4HLfqaZpaQL08YXZdqXiihdcS4B6eajUH5V7tSC4f7UWgkSLVTyGvL5sApEb9GpBo0SZ6EdjdbbwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkMwFDLG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390d98ae34dso4538757f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093632; x=1741698432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc2UFOQyH0/Jqy9uNhciWp/BhWlHs4mucXqaZLSwSf8=;
        b=nkMwFDLGaPHCB5at7uJPeHsUP8pwpzLi97cqZV5krLgWbqXvC93L5eaW5BJ5kKxZkk
         jti261WR+Vro2Ln1EUutzd3hM/OZ9uiM3Zi6rN/qffqXjEu6gr7DCYCEjg9Kjkm1yyR8
         M6enXZzW8fA6o+f+xmgXMu1g+s/0TpylibQhAagZGLwGIQEEwCqNPGt9yT6hlUdBd9sc
         bWDPECWykPopWieVh90cRRn2pLEdReOIEilbtj03fkSCu3IB2CJvXSGQI+ZeA4L324yb
         xFQCadgqPVNZrSkPAluvVsv/IddiQeZxftf//VfBf1kY9XYnYmXrksQ388OVza8LFQWv
         ZbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093632; x=1741698432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fc2UFOQyH0/Jqy9uNhciWp/BhWlHs4mucXqaZLSwSf8=;
        b=AFYx/jKUB/Cnh6HB5bsScXla9lBhHL3FUX+7UeP0jiuD8RFAwh4gOR4hOFLp95cwAV
         R/yZU6jIJEf20pqOdxumBTyeLyfmLE/u1QgR4Ovuz+i8M1Sb3KCAFDPv1lnPPWlhV/uc
         BESh+OJabRhg0xPAmmPmOdDx1fDgE06c7yrzK6rapALrLCY3oQW0tWoP6L2YsUk/NW1G
         ZIlt0ZROfc/s120J4QcvY+YNv4d+Ib3ndTewZKRKFeZSdI+RFRcOv7PypwRmByz7APZC
         /Ly8M++tnQ6lAkZdUvkBARPZN4KO3PVvfl+FBYf83nBKNynLYFs/q+M77lnilr0OUf5J
         wewQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9nrMxNKXwcAbCfqf8Y5Y6bBast8UQAXbzSvyFnWNNprZrrXkGcFmrz7RWSoFx3V9r44tUoUOzuvcWkR58@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kyM8c4pAvuK84K5j8NgCLj/OoN8/kRJLNSSyY4G2NTqhro9Y
	J8pJbsh8h3yUol7s+OLxrP6eQQyVoymygiNTbtNstvBhjzvLDrL7Gu8HPB8T2b8=
X-Gm-Gg: ASbGncuDUezkyZoekX+//0OjFplXq+Usyu+KYy5otQS1Vp4TkptH8w6STdl1p4FMY3P
	3M6G5Wb5Ns8ldqsxpcMAR9mGhbXFSKQzZDdHS4YjH5hKGxC2D7NHPwHjqxH6GgPeA65Jh7Rg7Wf
	C57n/XGadQSAMlX65MCwvfFj+gAoodTGzMK/vIF2c+CcfO7lOcYpGGH60wGhXY6MPw6JokOxqQV
	CfXlvWAoOkm8sHJHjBCW9BBSuxCcUWGKVbg3hSDCNoF1zHUHZtNEZdXnaL1sffQOYDhRf/NmQ0L
	6d6QNn8Xahf/I5Z3FE+aqAOowrCqCBEULahiMeVLY/mtUJ9hTVmjjxOuvfxh8VDAUO8b5AhsfYD
	coLM5tA==
X-Google-Smtp-Source: AGHT+IFlVQpbJbhy5jiyL8Usdv0nuA/4jjTLzZGkc9256Np8g3V59AFfddEVwJtu35RRPr2UhvWQvA==
X-Received: by 2002:a5d:64a6:0:b0:390:e535:8758 with SMTP id ffacd0b85a97d-390ec7ca0e7mr13859515f8f.9.1741093632440;
        Tue, 04 Mar 2025 05:07:12 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:08 +0000
Subject: [PATCH 2/8] media: venus: core: Remove trailing commas from of
 match entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-2-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

Even though it has zero effect on functionality, remove them for coherency
with other drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-2-8c8bbe1983a5@linaro.org
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 77d48578ecd28..61fb59788a810 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1058,15 +1058,15 @@ static const struct venus_resources sc7280_res = {
 };
 
 static const struct of_device_id venus_dt_match[] = {
-	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
-	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
-	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
-	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
-	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
-	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
-	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res },
+	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res },
+	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res },
+	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res },
+	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2 },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res },
+	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);

-- 
2.47.2


