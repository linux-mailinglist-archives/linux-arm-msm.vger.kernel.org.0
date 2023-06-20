Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82CB7374A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 20:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjFTSzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 14:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjFTSzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 14:55:04 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B97210FE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 11:55:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so3883769e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287300; x=1689879300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev3nPD6GwYzGBN7yec4vjhXlCkFHq/OZHrB8h/dAp/A=;
        b=CaGwPrWJ5gsL3bn4bbmbtgC4/mXhAET/Xhu7A96WzDYtaKuEUHpauwVtuxF2C5snr2
         86h+siez74X2brVC6BmoREBXL0a/I+Af0pwok1q12u6JnvsRiVy2RmNN+r6HmAJnZpHc
         49u0hTHRRRIHiQMgpco/9YfQW4E+B3yETDc7kybR0MVVTTinJdMtQucYHkb0P0E4AlL3
         MTMT9Q5DMXCXNt2fmcherBq4gGTUwOmY9HK3ECY57b3W+/RuUAjZxH+cd1TNbu2dnBmC
         +hj64E24Cmy1ux2+IOimydcznUv/2VyC8BBQ6ZnsMy8FuF+W+gH2j7Z8YkEQy2rPqMlF
         mG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287300; x=1689879300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ev3nPD6GwYzGBN7yec4vjhXlCkFHq/OZHrB8h/dAp/A=;
        b=PKo/WlN8qM5YWtQWLKtuAYbv5bnD2KPLkbp82AWAPNMuWaLrU9AAI0VLuje8yxWGh6
         ZrxyARkW3I33PSl5TQtwUt7N32nljQUndekEfZTCvH81F6jZTtZ+tTSqbF8ZI8wscNSu
         FIHSjOcC06viAuMQIk16TKscVoJdBVVSvp7I4aIn7CpC1BRcDRHy+8ZiFd95fEtl3FRW
         LotgmAJ2eSnEBhvDowQpVsKOFHKnLDJ7F7brX4keBQ3oOwVI4kkgaK5x6ADyyHdRzAM6
         9lqWeq9hKZIoRTEG0PsHUzobz1zYiH87kQjAkpVyl34a7RhKXffSCLQf8UO+EIZZ8Hbq
         5t+Q==
X-Gm-Message-State: AC+VfDxGOFz0teh+gRjlz95XmP/FDg3+5tBpv5tt4KMSxYRAKdcZSfTz
        r6pdmPHEOhw67SDSyKo5mEbMdQ==
X-Google-Smtp-Source: ACHHUZ5jaki8WPwoAnKqtR+pF4gbZ2rCMKmN8eyEOhc5ohPQ27Y5nnUkPMkwDffHf+L2wOSefAcAkg==
X-Received: by 2002:a19:5f1c:0:b0:4f3:a9a8:8d84 with SMTP id t28-20020a195f1c000000b004f3a9a88d84mr4254526lfb.6.1687287300206;
        Tue, 20 Jun 2023 11:55:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25921000000b004f867f8d157sm463899lfi.124.2023.06.20.11.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 11:54:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] Fix up 8280 GCC GDSCs
Date:   Tue, 20 Jun 2023 20:54:57 +0200
Message-Id: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAH2kWQC/x2N0QqDMAwAf0XyvELtoJP9yhgjibEGpEozx0D89
 4U93sFxB5g0FYN7d0CTj5qu1aG/dMAz1iJBR2dIMV1jTjG81005GA9piK/CXEbj0FOmmyAhThk
 8JTQJ1LDy7HHdl8Xl1mTS7//1eJ7nDwrEjxV7AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687287298; l=842;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=be7CX1oyBDl5r8EBSxgst9VwjeV4ciTjSNSkVCkX7Ag=;
 b=w4aCT3nB/SurV1CtWdtGaBejKzLQpasyU1RUf5C6xuaNYIoy6NvdMQfIvqN/VPcySw03qY3BL
 yfJ50SR6jYlCc8Mny4ML/NpfMxaN486mdH6qMF/6khHKRcHKkp8t1AR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Part of the SC8280XP GDSCs were not fully described and others were
missing. This series attempts to fix that.

As usual with the laptop stuff, please test it on your setup to make sure
everybody's still happy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      clk: qcom: gcc-sc8280xp: Add missing GDSC flags
      dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
      clk: qcom: gcc-sc8280xp: Add missing GDSCs

 drivers/clk/qcom/gcc-sc8280xp.c               | 121 ++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  10 +++
 2 files changed, 124 insertions(+), 7 deletions(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-sc8280_gccgdsc-1b6b7eabaaf6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

