Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E7D52F011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 18:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351363AbiETQID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 12:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351362AbiETQIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 12:08:00 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D92179C2A
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:07:58 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id w200so8114876pfc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnA/uZftv5ibDJtyyKJZc9HKIOvccsTGLZumziMaAAw=;
        b=bUsNviV8m7NGmgUISpwui0rgRQH4+2/JgKB4mQ30RXUjqYj9doqedIBePSHfjjakPU
         P1FDqWXqyjj5uSi9tiB7jr2R7Gn306/SXB+GwPS4gSlWw9Xq9uOBCqteSUBd0cV/8NZo
         qJnLtA1T22ZCevI1gtAgLbf3Hz2liN2XWFJac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnA/uZftv5ibDJtyyKJZc9HKIOvccsTGLZumziMaAAw=;
        b=qiZeRH0E/kT03r/EvD3Rj5vwa2T1Vy1VBlHjcsxEggYTMd5Zlf8bVsoAHr85/TVfgF
         RZFp8iPeu0NK1o9kGGiAwOdJ5U3SO5wGjYlvXi4U1H3Ol9nti6ZDudA/VgQYX/35XV4V
         d7Iq4f6cM/4j5wwVerzXJuWjTeTnX9fwOtTPqH3E4di7eTxaHNUh5OCAAj37hZ7cTuXl
         x2xIhykNykCCRyq2sufJKsDBe2Zjj/ZdZbq/BuQPWiF7SSMSjZ8MLbfaE6CB77JnRmDZ
         JJUEJijlBe9CNh7yGk1VsZtDi/i4DdYX7bKI9xiLURM/RD3OjrBzd8LeMutKFbKrc2JN
         +eaw==
X-Gm-Message-State: AOAM532riYST9W7i9e/Uhj6xHP+/sndboaIOalmCOx9xuoU26WKSfCvL
        SeRmZmzb2PeDKa3OpllDcOf2Ow==
X-Google-Smtp-Source: ABdhPJxd/yvJkwiqDYr992Plqw9QYTomQlW8ZR82tuUc2HFppBnlFrAW0OLzlh1XNGOKtM09EZ11EA==
X-Received: by 2002:a05:6a00:851:b0:518:50a9:32f5 with SMTP id q17-20020a056a00085100b0051850a932f5mr5841117pfk.47.1653062878068;
        Fri, 20 May 2022 09:07:58 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b00161a2d98a8esm5856138plb.226.2022.05.20.09.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 09:07:57 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v2 0/3] Add dtsi for sc7280 herobrine boards that using rt5682 codec
Date:   Fri, 20 May 2022 16:07:51 +0000
Message-Id: <20220520160754.1141281-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put sound node and lpass_cpu node settings for boards that use rt5682
codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
choices of headset codec for herobrine projects. Common audio setting
for the internal speaker is in sc7280-herobrine.dtsi.

This series depends on:
"Add lpass pin control support for audio on sc7280 based targets" [1]
"Add soundcard support for sc7280 based platforms" [2]

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638776
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=643589

Changes Since V1:
    -- Remove sound-dai-cells in sound node.
    -- Add dependency list.
    -- Update patch subject.

Judy Hsiao (3):
  arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
  arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
  arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
    in villager and herobrine-r1

 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 120 ++++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
 .../dts/qcom/sc7280-herobrine-villager-r0.dts |   1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  14 ++
 4 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

-- 
2.36.1.124.g0e6072fb45-goog

