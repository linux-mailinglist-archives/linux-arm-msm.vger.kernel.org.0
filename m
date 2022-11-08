Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3955A620FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbiKHMDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbiKHMDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:03:00 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A641EC68
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:02:59 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id t1so8663387wmi.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=hIvdpOhjCyNiqJSBAwvQQBj8Uqill7WA0zit53y3ii8=;
        b=KLTeW1vZJd8TnbnX06b9xU8JdQSiRABXLn7DRR6r2chkTI8Qspl6yxcGULvjrycbDj
         KoMvgeXfTNdukowYA3AaEh9jW0oO6+6zJjlKlTngjvYFYv93shZ9F/iHLpSnHH7bSnPO
         UCHAha/D2MeRWssidl0tuII2MaEdeXTAY7gdkV6/1ABZdhoKIDLRJQh/DLVCNAoponJP
         VlWi/aWNX+/SG3ajPFiYzzgNGqG9owQBFRubPQ6bc7cemTRLLuKb7kAyVKgTs2xV84qR
         2RYCUVZzSkpU/RppH6otY24vHPt3ioI9FeyCOFQ5taXOrPVzZvI+1SyLCvLdQJADO0gD
         x2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIvdpOhjCyNiqJSBAwvQQBj8Uqill7WA0zit53y3ii8=;
        b=1Mp4Q1GghR0EP4OvYIyUzgcA9lQbvHwY86LwLND79J5mz4+I8Tf0K//fLqljO/qVXC
         fUWGVx0TewaHmSfh8h2e0bXbaIue1/s/OlEzsc2HImUOmLcVYfQuBQ9Tds/NN8u1YJHB
         iJ6YjQSEzHN+Lr3YznXdStaux/9b8/QWXfn+T5nN8WtD3Dj8zIWjrZYGPry8v6eqLs2Z
         7z1v1W1eGwRDTDs/8cIvgdJgU8HkCkOEzQPTtWSaukZFBEscy8hTQ1o56yqFYRpafr4A
         u+uo2QLAaqpRTrMV0PDhHQj+Huun1+ny8kufEO1+cDz+rfjd1SfZ+wVJT3/nQasbiU8p
         2jGg==
X-Gm-Message-State: ACrzQf2ct6gR4goXHNQzp0R0VK/jlm6w83f7rstU0kWUiukhcY9jvOXC
        nkBixX/Xav/LbHhbDA8F/foCLA==
X-Google-Smtp-Source: AMsMyM7UPWEFVXALIjatygYKPCSG4hpLFypCBxStqFtN1IpXPmGg97KLO6VUpK072PDk4houkgRRsw==
X-Received: by 2002:a05:600c:554b:b0:3cf:84ea:3097 with SMTP id iz11-20020a05600c554b00b003cf84ea3097mr23114193wmb.100.1667908978159;
        Tue, 08 Nov 2022 04:02:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b0023662245d3csm10056034wru.95.2022.11.08.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 04:02:57 -0800 (PST)
Subject: [PATCH v5 0/2] arm: qcom: mdm9615: first round of bindings and DT fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAGxFamMC/43Oz2rDMAwG8FcpPk/D/532tPcoO8i20hgSB+wudJS8+8Ruo4flJD7B95OeolMr1M
 Xl9BSNttLLWjm4t5NIE9YbQcmchZZay7MeYMnL2SsH+Q49TbQgjOVBHbzPNsuUYkhBcDtiJ4gNa5q4
 X7/mmZdT6fe1ff9e2xSP6//wpkBC9OQNhjwqGj7mUrGt72u7iU9GN30Q0gwNYYwULZJ05gUyByHDkD
 Mqo3M6GWdfIHsQsgxlTDqPiCnIvx/t+/4D6D5GpZ8BAAA=
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 08 Nov 2022 13:02:52 +0100
Message-Id: <20220928-mdm9615-dt-schema-fixes-v5-0-bbb120c6766a@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a first round of trivial bindings & DT fixes for the MDM9615 platform.

This first round focuses on trivial changes, the remaining work will
mainly be .txt to .yaml transition of old qcom pmic & co device bindings.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Alessandro Zummo <a.zummo@towertech.it>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Satya Priya <quic_c_skakit@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Dependencies: None
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Removed applied patches
- Link to v4: https://lore.kernel.org/r/20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org

Changes in v4:
- patch 1: None
- patch 2: None
- patch 3: None
- patch 4: None
- patch 5: Added reviewed-by tag
- patch 6: Fix descriptions, Added reviewed-by tags
- patch 7: None
- patch 8: None
- patch 9: Added acked-by tag
- patch 10: None
- patch 11: None
- Link to v3: https://lore.kernel.org/r/20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org

Changes in v3:
- Rebased on v6.1-rc1
- patch 1: Added reviewed-by tag
- patch 2: Fixes typo in commit msg and added precision about why MIT was selected
- patch 3: Added reviewed-by tag
- patch 4: None
- patch 5: Drop second example node
- patch 6: Drop Andy, fix interrupts desc and fix example indentation
- patch 7: Fix commit msg wrap & add reviewed-by tag
- patch 8: Reword commit msg & add reviewed-by tag
- patch 9: Reword commit msg & add reviewed-by tag
- patch 10: None
- patch 11: Added reviewed-by tag
- Link to v2: https://lore.kernel.org/r/20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org

Changes in v2:
- patch 1: switch to move from swir.txt to qcom.yaml
- patch 2: use MIT licence instead of X11 licence
- patch 3: move reg after compatible
- patch 4: added Krzysztof's review
- patch 5: split into 5 changes:
  - document qcom,pm8921 as fallback of qcom,pm8018
  - convert qcom,pm8921-pwrkey to dt-schema
  - document qcom,pm8921-rtc as fallback of qcom,pm8018-rtc
  - drop unused PM8018 compatible
  - drop unused pm8018 RTC compatible
- patch 6: None
- patch 7: Reworded commit log based on Dmitry's wording on similar patches
- Link to v1: https://lore.kernel.org/r/20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org

---
Neil Armstrong (2):
      dt-bindings: rtc: qcom-pm8xxx: document qcom,pm8921-rtc as fallback of qcom,pm8018-rtc
      rtc: pm8xxx: drop unused pm8018 compatible

 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml         | 16 ++++++++++------
 drivers/rtc/rtc-pm8xxx.c                                 |  1 -
 2 files changed, 10 insertions(+), 7 deletions(-)
---
base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
change-id: 20220928-mdm9615-dt-schema-fixes-66d4d0ccb7c7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
