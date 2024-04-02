Return-Path: <linux-arm-msm+bounces-16092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74689527E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 14:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB541C2116F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4284578691;
	Tue,  2 Apr 2024 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Atpfl7GC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A976C76
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712059683; cv=none; b=r+FyCubAwbI6XWU5MmII9Oyfv+ikg7G/ajD8SRhEk7Pz5K9T3FMANAkIU/MgVCQCvs8xT41FBC+Rez8w7+UxbXlNuxKXiU0ckhK/eg5BRjfaCaieCXE+rCygMIs2vq5pmVITym5mUMgSrWMp6wDzJYK1M9ahYaYMIUQC/67xLfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712059683; c=relaxed/simple;
	bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3szzy7Ch1W7TmCaQMhBw1srZ96NIUyVfa56m/8kazaiTpg2pFgkAiZXt4qKJvleDwNNmnaqy4IvFuf+B1m8pHBwAAuDOZNlX0lnkjKXfWin8YVit/FSMqkITKgXpf2ZHzXmbiaj27pPQYg1MHfizrdQqkQXIceTYBg2iaiSneg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Atpfl7GC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4e65dec03eso261574666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059680; x=1712664480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=Atpfl7GCACBiZg7Ys5XDmXD1K46kBxqz4yGtQQijYMkBWgLJNvOveukP5I6+AWrULO
         ef0MdmfJrThuJSquEaTM9jeFxBU7d/aa9dWzu6/S3x2IJbhYGzByzs4t0XCJtl9TtH/b
         Rk7hT4uXLgJ74+sazNxRq7iYFSbFeQQMnqSg9syqWwjJfPPpa1tc618K7YcOgWyHRo27
         ceEIYEXW7wdJ7gIF/7LxowpQCp0pPbyc8nMvkE8ZG8X4O86IG497ClVyawt184Tf/s09
         QlvYeX/yaQKDqnH76uEUIAmyGf9MVaPe+LJp3ejv9fjv0MU4tqXR4aW2vF9GjsOHTz6a
         fsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059680; x=1712664480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=dvLS60SNH2b1XgXovFg6RJ4b5fsmq/qAth4lh3gPXESukVNv0u/eP+hg0j+AuGSidp
         LXzo0WjKc4H99lsCd4iAYUQC1ycYYU/pWvq5BbgOAMPiYNSOAOKHwQKP0LmnsLXtRiut
         /XdTquMX2gD6pyaorNfH51d9JqFyMXbpchVMBpYVxdXsXsNMbwanGHA/0mKlG3Kll8QA
         0GBJidP/AB3ykGER+MhiLWK2ZKvd10v5CvhbXkOiyDfb1NUhZIuXjd7J1GI8C4je8A8R
         8pGvHfqUgIbW3DBPS7/m9EIx+BJZpbIo2MlkMFdhqNj5/gBBjcQcUGfL/AWP3/8NJQFW
         OTpw==
X-Forwarded-Encrypted: i=1; AJvYcCUqNGg+eQkLLnSm4iXu/bjHT8FgJ8seNXndYGXPtC0Js9Itah1VIdZrT+07oqfdvydqvxEmzpnH3xEzbiY7Dt+/3y/o4KiotQ+v+1467A==
X-Gm-Message-State: AOJu0Yy/OeX/q6fU78umx7aVxu+sJlYl8ZOU34gK4qLIttBHNf7Qj6a0
	mPImGo7nWjxBqFAs0IvVaUYOk01nyJp+vF06vODClt+qHgeceSTZcu9jWDdj4WM=
X-Google-Smtp-Source: AGHT+IFic8oTxMWwbq/opl+R/WMY4B81eIyhGlcF04iuyhaO02RdXMJ+iUNSsBYJ7n5NMVSgBWknQA==
X-Received: by 2002:a17:906:1809:b0:a4e:1449:511d with SMTP id v9-20020a170906180900b00a4e1449511dmr8612893eje.46.1712059679543;
        Tue, 02 Apr 2024 05:07:59 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:07:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:31 +0300
Subject: [PATCH v8 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-2-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/URJbnokK1pOxrlYzamDCfFKUmEZT+B4Is74
 Ejx10d2ideJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1EQAKCRAbX0TJAJUV
 VucqD/40449kY2bmDx8dRfmVCXUNV2maAgBuk+qFdisysi/c5g25GTKPHDPEkoHQK5092FeSdFM
 mSQ4TUiu1MKT7Q6FQTT1lzU6utya7fHEwJsSr2811MozIiGezifkL8lhOQ4YBCqZuGom23Cw+dC
 beZ3C/BT2JioCtDx1exH7gNkul1SHK4sunrpYPHHRV7PI34dIXTRsLH4J1fE+w7F0fUARv1KZ2v
 8iQKMQnTH0eaSkXP7NQ/og20GOccJYfu7FXQgPtmYWb6JQEv3SeQrM2dXr4mQ2IGEkgYJ29oSyl
 p4GUue5hL2exrGFO4bKaWRr0hrzwa9J3hxaQ94XcvjMjBvhAWhhHW00NsWR0QTpBmRHO2aaRkke
 R7OYMVvFqb7hIryD506O/5ZCC6KUPlwLBQFenTabd8JhLDAbJ51RgFV7zYaHEOR6s+YWv+86Xts
 zjJrJo41C/+44LEsgr1K6vnJQwyrQpukM/khxcKJDHwpHhrCSUAwfN4gZ4VetsDSoxouJuyoAhF
 bCCs/F42Ih4p6ish3ReuX8gviUfx65ATl7+7WjB/nUk0U5Pzz4qN6dqNndDAVSmdPG2t+Gw4VTi
 FJu+e7D/MQOxH3IERM0IcFP5s78WGoxzWXWYNYK1SSZyxE9yfABpDHNPBI/aEe19vqV5SBDtbKC
 H8HKQO+70CsB6CQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

As it is optional and no platform is actually using the secondary bus,
deprecate the qcom,bus-id property. For newer platforms that implement
SPMI PMIC ARB v7 in HW, the X1E80100 approach should be used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index f983b4af6db9..51daf1b847a9 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -92,6 +92,7 @@ properties:
     description: >
       SPMI bus instance. only applicable to PMIC arbiter version 7 and beyond.
       Supported values, 0 = primary bus, 1 = secondary bus
+    deprecated: true
 
 required:
   - compatible

-- 
2.34.1


