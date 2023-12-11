Return-Path: <linux-arm-msm+bounces-4172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD980C470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91CFD1F211C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D722111C;
	Mon, 11 Dec 2023 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhVa6+It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD29100
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:24:07 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1fae88e66eso39276766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286645; x=1702891445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wn0vmS+DlZFfx9caCjg1W7hM4xi3LW9kbH1lruHFYM8=;
        b=fhVa6+It0JMXd/jjVk0rRNBKbtb2bDM+CBXPtE0xK9LWIz4gfkYlLqpISWvP5sUC5a
         FVKGllofsmZxgxU07jN3+pQ1EliTVEBfA2xA5ntQRfqHNwf2WBg1aeda2tycVhqDkuTE
         p+mcV0CKg62EilS5HYCP2ZQQPCO/Qrjhx5j8Uvjg0DF/xTNfxGDkzJvnUt+tJAHGekAZ
         CojFa3jdqCha/sbQ6YEhIYluaqKmShlKJdyRDBVdYHlddF/S95sH7fpepAlA8x7YkhZ3
         MmS8gSFhVe3W+nRrMEtkU0yikTnWjZSclcFFjYgOSqZWY1jZ/fUhMKuq0FSYODel/clc
         Z4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286645; x=1702891445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn0vmS+DlZFfx9caCjg1W7hM4xi3LW9kbH1lruHFYM8=;
        b=FvEzAeezmdMisCeFnnhe15APlhK4pdxSAi6Yt8dVm6Eoj8McDncw/QcLREqthAUkJv
         p4fKo2jnsh5V5xRaRWoOSrEE0X39VmtwbtCuAVK0ARv+82nBtaap0TZuDcgMHhyaUGcb
         T+ZUyLgYdDIdapaOzqELObvsFbGnizTQiGXIYONWk6nyP7bwUv6rembjvUuFtTcvac+E
         MJrbK6ESFgKZvowTFLZdS8ELaaJqug75LUrzDQQKJNRjcTLw7Nr2LAOeQsikR8AiIaCw
         4IEs/Qd9LmxylheDiQCvbg3GgnU1oBvRBEVxkQh9KkM1pVGQptDbDp90SWp/TAqSDu2N
         Pqtg==
X-Gm-Message-State: AOJu0YzPRkjIyIfdtrcRsRQSs9tYw/EQUHXG4ws/787wyviSctRB6YQ2
	470Ceq7P6kH1nHra5Qp2asj8hw==
X-Google-Smtp-Source: AGHT+IFw56eFBCLAYXPgrXfR+4po1IIGRgaiClklQGaZVuleC5pauurJOuMcBMmBsMTXqq1S4uSJlQ==
X-Received: by 2002:a17:906:f753:b0:a19:a1ba:8cdf with SMTP id jp19-20020a170906f75300b00a19a1ba8cdfmr1955220ejb.125.1702286645634;
        Mon, 11 Dec 2023 01:24:05 -0800 (PST)
Received: from [10.167.154.1] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id tb21-20020a1709078b9500b009ad89697c86sm4570248ejc.144.2023.12.11.01.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:24:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 11 Dec 2023 10:23:58 +0100
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom,msm8998-bwmon: Add
 SM6115 bwmon instance
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231209-topic-6115iccdt-v1-1-f62da62b7276@linaro.org>
References: <20231209-topic-6115iccdt-v1-0-f62da62b7276@linaro.org>
In-Reply-To: <20231209-topic-6115iccdt-v1-0-f62da62b7276@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702286641; l=921;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uoFy81O4yXaBoZ14IfFvS77gswFxZ0y4ucvu/5N+9NU=;
 b=Lo7Y7n07+eqt/vVZg2bMFag6ynbxLC6bxQwLgZq1AfXMi72k7breiL3owOIJKg7oO2hudqng7
 nQA7i75Hlc2D7xUYVl7hlBzvePyoaouSEVOaWRTh60rrzfk88J/O7eZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SM6115 has a single BWMONv4 intance for CPU. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index a88cea732370..05067e197abe 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon
               - qcom,sdm845-cpu-bwmon
+              - qcom,sm6115-cpu-bwmon
               - qcom,sm6350-llcc-bwmon
               - qcom,sm8250-cpu-bwmon
               - qcom,sm8550-cpu-bwmon

-- 
2.43.0


