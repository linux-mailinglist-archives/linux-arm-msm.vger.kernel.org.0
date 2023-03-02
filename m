Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4493D6A81AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 12:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjCBL6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 06:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjCBL6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 06:58:21 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9EC2D52
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 03:57:54 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j2so16246826wrh.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 03:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677758269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aNoaPp+XOD7YmUqmc30OX7zc1uyaAdMpxhjOnrCDxY=;
        b=gNeZGzZD69V+FbMlZMTC3lGNvCEtuXRXYWyio+RWl2qd/mDWgwduHAzpKi8GzMBXFq
         BX+zq++A3Uf9pFwAHETJtnYeurrmdWzSR3o9qYPrWTEF03N/Mh43VtsfqjCibKj9GMZJ
         kLWwx3DwL1xMzqD5i+oerkaKhVcifJQgjCqMdSJc+UBACPtcSCkWRuF50eGueHit2I3Z
         mwQ3ToNjRZj8sDnJGEhD2jPT47LeBiS2Ap+TpQW0KrOQF77rXgD3q7irwQfH/PE/n9qc
         QmK0l9fDizEyUcyB7yfH0N7tjbv4+hJEI5pyjkZZhuasZgzQmN7cytY876uLfEKmOk6A
         CyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677758269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aNoaPp+XOD7YmUqmc30OX7zc1uyaAdMpxhjOnrCDxY=;
        b=a7sc69kmVJtbpL4qJYvLw7QVDS4r6VfDHT7tnZ9Nqhi15PpP/SKYZSgj3ZKdFMGF74
         GUdFn5OSKlzK4x78Joyv0ZYtfgEG07jCVnuj19kp3qRyjmTFVeQTTwuKXqVNRN5bPieX
         0tf0Ab8lZyR/aus7szCLsViTRYjlY1mVD4AxTiMNWcN9At0dhsg52QFWTzWakEbp+dqJ
         L560NsTJPDZO4U/0+A27+8GnctKHxVgIs2PEkD+tbeoMe7dnXrADGTGtupiAIP4xLo7b
         QEayw4RKA6JF2Zdn08T+yr9ATlkT5uNqDhpkjXzqNw7td0AUgkpBEkTU9fwAVNiaWKk6
         epqA==
X-Gm-Message-State: AO0yUKXgq3JxCVzaWvEaGRDZM/Op2K/bmm+GUSMUSOnZ691iP+U+VkVS
        Vp9vt6y26dMn2SiPVPaJtLT85A==
X-Google-Smtp-Source: AK7set8IS9A2vtv3Wz4VhrzKtN5+/Ry1+UxuJ6ha63DMEVjamAjvGhDs/76N15Fith5xRvjLtj24fQ==
X-Received: by 2002:adf:cd8f:0:b0:2c5:4c7d:53ab with SMTP id q15-20020adfcd8f000000b002c54c7d53abmr6869836wrj.20.1677758269542;
        Thu, 02 Mar 2023 03:57:49 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b002c5526234d2sm15298209wrs.8.2023.03.02.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 03:57:48 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sc8280xp: fix audio dts
Date:   Thu,  2 Mar 2023 11:57:37 +0000
Message-Id: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While testing DMIC on the panel, its noticed that some of the settings in
dts seems to very incorrect. Mostly around clocks and frameshapping data.
An another patch fixes dai link for dmic which is incorrectly pointing to tx macro.

Along with these patches, with a pending csr patch device switch and dmic seems to work
recent changes in x13s ucm.

Thanks,
Srini

Srinivas Kandagatla (4):
  arm64: dts: qcom: sc8280xp: fix rx frame shapping info
  arm64: dts: qcom: sc8280xp: fix lpass tx macro clocks
  arm64: dts: qcom: sc8280xp-x13s: fix dmic sample rate
  arm64: dts: qcom: sc8280xp-x13s: fix va dmic dai links and routing

 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi         | 18 +++++++++---------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.21.0

