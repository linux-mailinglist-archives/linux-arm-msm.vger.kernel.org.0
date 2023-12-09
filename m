Return-Path: <linux-arm-msm+bounces-4098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9C80B695
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 22:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30C41C20849
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 21:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817791D520;
	Sat,  9 Dec 2023 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuUk7UQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D315E103
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 13:56:04 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2cb54ab7ffeso4841501fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 13:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702158962; x=1702763762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCiH7VJZwpltElSwE2uiX4KsLg2Kdu2u9uVH8b3tZTE=;
        b=DuUk7UQMuAzeNfb6th9ygejU/qZKf4rJ0ZBWX7n+m+U5as+45/TdqU1KJoIOhskeO0
         rzeCL1ofoKX/EfLR3ODm7JGmcF90aaoQAKQ9RswEMVfaOPM9MHaoDO4fs0kfXmvRBM6O
         yh1xc0tiqvPiXdfz+elT9V9r7DCLDRZsSm0DaXsWQ0LCTXeCJgz37RrFNyB3/G2sbh0z
         OfwKBTeuXS3gHSmpqlQYXQFZ1lum4xIAEKud1Y5umtJbT3rKaygl71exAuA9+sgQuWiS
         5r3HIITGntwv6oHS/sX+u/TjHZC6j7tBRnjecosC2Og2VOGmr7JfSoYToqbNJYF3b5HZ
         UsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702158962; x=1702763762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCiH7VJZwpltElSwE2uiX4KsLg2Kdu2u9uVH8b3tZTE=;
        b=boFAph3xFygtze9t7YOec85maJILrY0zzncOCRJ8WZ7iSRUOI/rHm/MYEHus4wC4tW
         HJ8GQ24j6Nhjkr7QftKLu14gGnQ2ysDFXuXnyHFs3zlJyacdN4M6x79IpPXLpUftq5sZ
         ejJd5RMq2BYLP8gFYl1CgEm0IymYiRcEbrmlRIzgg+dZL5dJgC20uY2p/XskQ7SI0eHw
         qs+rsJqnakZq3R4NhwgwdGTZkwmcWbtZd05P8JlWrbzsrwUYhRPQQRT9Fbygx4RGwmxG
         +hUa64YjYC1AyyfIbOS/Fx2NlMI5RldiqYCqkcxBvct0P9bHLyy2IKaPUiqEET0hr754
         BmTg==
X-Gm-Message-State: AOJu0YzJd2oWhHPmo3vDWf9ucXOM+Cq+odq+hAvp+oIt/ltCyd5Qy0qo
	+g8/DbXTnOFTOwiQDKMf3YK8nw==
X-Google-Smtp-Source: AGHT+IG4I7nJ9kJ9XEWjT4j9Uf7hn29TI+AjcVDCvuEEjgVnlt2L/UHjNHdGSl2xJ/noGoVAo+gm0g==
X-Received: by 2002:a2e:3a09:0:b0:2ca:db6:a13 with SMTP id h9-20020a2e3a09000000b002ca0db60a13mr785573lja.58.1702158962402;
        Sat, 09 Dec 2023 13:56:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e22-20020a2e9856000000b002ca061aa9d1sm665103ljj.88.2023.12.09.13.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 13:56:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: soc: qcom: stats: add compatible for SM8150 platform
Date: Sun, 10 Dec 2023 00:55:58 +0300
Message-Id: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPMh stats on the SM8150 platform have 3 stat slots (unlike sdm845),
but still doesn't have DDR sleep stats (unlike other generic platforms).
Add SoC-specific compatible string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48a..9cd75bedc7d2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - qcom,rpmh-stats
       - qcom,sdm845-rpmh-stats
+      - qcom,sm8150-rpmh-stats
       - qcom,rpm-stats
       # For older RPM firmware versions with fixed offset for the sleep stats
       - qcom,apq8084-rpm-stats
-- 
2.39.2


