Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED5C6F9B08
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 21:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjEGTHl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 15:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjEGTHk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 15:07:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62673588
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 12:07:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f1411e8111so4170181e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 12:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683486457; x=1686078457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABYh65MiyXgMJl63EwNEzCBdTUVUiEBGqjwe8UOHeKM=;
        b=M982EYGuMsxmmYzxbSQtS8NJjohJSOLCLVfdiYxkXIab6wwd1RrTroB/7z/tZxHCpY
         eOAtxgNNWgkwcm8kWF2bewDJi8o7yVl5LVwwvGTM7HG5gUb/fnXvcGSP9OloTKDWQx01
         34orH3O0Ez6TkEh/rbnC2whWt7I7CrSrdUy2XFne37bkTrDYtewp4fCvMLEHUJCo5EF3
         MmTxdbg6MSXP6bHJHpxZ5GQEijWZtTx6Nxkgk6H86yq60/3ffwcAs+3AEVINMwmAmg54
         SMjtLK3/dmYEfc1nonHM5bgJ+xPZqORqVQovHGeDJPc8Xj+dYddTdVsT1ODK+5UXWCtH
         0/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683486457; x=1686078457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABYh65MiyXgMJl63EwNEzCBdTUVUiEBGqjwe8UOHeKM=;
        b=RKKDh/qF5DNs3NS05tOSdOJH1L5vtxhsYqluRFdWDXIWs6eUUR07SUZMtP5woWf8zT
         gJMawu8NhI4jEaTxFyKu4NExssUopwhrACEhp1CctluQge9yDNmRHXpGafAmOoxSbtgL
         tE70nt1C2CL4ZDxoc57QIwRyEBAxERk+Q1tAFnZqFfRFfpCfmFPy+bDs7C+JphbxFlHc
         UFPiCdWsJbsosazZv0c/W3pFRJlYUVzxIbIh0CEGkzDYfZTTVMtR9TQkPsboI6pA8NYd
         xnlGOybdXfmLvkayYWWUT8hECuoiDkyuPmB5jr2OZRuIYWHV9CDKPFlUirsiQj0RREeP
         ZUEg==
X-Gm-Message-State: AC+VfDyvVHqT1EjBaJ433EG123jn0bUEbE6QXZw14DDryR3ryHKHiHJ9
        5DP9A2DBzxedOBQkJgsEEzdj5Q==
X-Google-Smtp-Source: ACHHUZ5XoFeyN2O3kCNUI3REy8stWt4PK64GzNK+eCFHUD3RmZWA0TwqgFWE5NXWZoItmKzKSeqEhg==
X-Received: by 2002:a05:6512:11e8:b0:4f1:1de7:1ab6 with SMTP id p8-20020a05651211e800b004f11de71ab6mr1985504lfs.20.1683486457160;
        Sun, 07 May 2023 12:07:37 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 12:07:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] ARM: dts: qcom: apq8074-dragonboard enable DSI and remoteproc
Date:   Sun,  7 May 2023 22:07:31 +0300
Message-Id: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable GPU, DSI panel and remoteprocs on the APQ8074 dragonboard device.

Dmitry Baryshkov (4):
  ARM: dts: qcom: msm8974: add ocmem clock to GPU
  ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
  ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
  ARM: dts: qcom: apq8074-dragonboard: enable DSI panel

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 83 +++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.39.2

