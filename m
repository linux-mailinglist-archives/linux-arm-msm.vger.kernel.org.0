Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E30576CB2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbjHBKoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjHBKno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:43:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5A23582
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:41:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe44955decso1003699e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690972898; x=1691577698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsoFtm17lHc1E4c7Z/2gnQacNpom0Bf4d4YqKE+AWL4=;
        b=ZcB1ZW+tHuIdaM/3k/Evuw7JUeiEfKfg7EqMh/tAzzSggl7OnnUxPSFouIRj0m4zuH
         zwPajMZ1vDqA+nYf2TUEPCPxF/oprueeVZl6Yijh82mBfV/oVBPy6ZQ5jdu3sLq2kTjk
         6kPbaVJA1r8E4zcuqeKkYohQsOm0uGrGrQZ10RffgFXSBH0AeqELSTggDvLNx0lhmJu3
         DO+wyx2sHallgIL3C6975I8PC4kyyLUGVIU/vTsckIH0kd107yGTDrIrcvy4+/kOVIGs
         J0PxvdYbBXODuuHDTvZw8Pi/1Qc54fzcm/6jXu25NOKOtKD1Nul43R1GNPJRJEUfERzr
         9t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690972898; x=1691577698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsoFtm17lHc1E4c7Z/2gnQacNpom0Bf4d4YqKE+AWL4=;
        b=ZvHM6iYToMCApTF1IIX952SHn4+yOqJJw7xS+mI+Ima86qZkv0+u+9F/iomRBisCj1
         dAw4KImavF5B5uSPvSbObBJPCeivaShs1wGYHZOE84sb+Ndk7WCF21zJifl3KvH2SP1W
         GO1JY4IJudUpOySb/mjTH+a+UmepT7ouR/N1+T6oSEeIhO+oRmP77KpRNNk679ZLpKc3
         lHl8XI3fE9j33GjEvo7Jdp5OAhm6fagGiCVkWIHFbUNeBx9EObmkj3nsGOuXyCu+rzm+
         3ywXDtsPNkYRnMMBZJUlTPkqEO2UuYe5Tn8UuHuaOV9XxQhdjd9FIvUZq6pEbt2ZxRjN
         /JuA==
X-Gm-Message-State: ABy/qLaTHszt+bi1tqZ/gw/NLOq5NHBTU83jnOPToGFAQS2PHak52ZY0
        y8xiYndIUxNSdNX3qb5JiGYUwmNfmgRHp7gMoO0=
X-Google-Smtp-Source: APBJJlENxlpwgdPOa5MQ1hwUOEpIRZ2wex8fGo3NR4RJj1NALmAF7imhxUVmgGGKlUPb20+GFMU3DA==
X-Received: by 2002:a05:6512:2812:b0:4fe:28cd:b3f with SMTP id cf18-20020a056512281200b004fe28cd0b3fmr2192251lfb.5.1690972898535;
        Wed, 02 Aug 2023 03:41:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b004fe22967123sm2299974lfi.153.2023.08.02.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:41:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PULL] qcom: add RB3/db845c sensors DSP firmware
Date:   Wed,  2 Aug 2023 13:41:37 +0300
Message-Id: <20230802104137.1282273-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the firmware for the sensors DSP used on the Dragonboard 845c aka Qualcomm
Robotics RB3 platform.

The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf6d:

  Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-07-07 15:24:32 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb3-update

for you to fetch changes up to 742bf577e1406f61716f477fa47e868765596dce:

  qcom: sdm845: add RB3 sensors DSP firmware (2023-08-02 03:42:15 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: sdm845: add RB3 sensors DSP firmware

 WHENCE                                    |   3 +++
 qcom/sdm845/Thundercomm/db845c/slpi.mbn   | Bin 0 -> 7028860 bytes
 qcom/sdm845/Thundercomm/db845c/slpir.jsn  |  21 +++++++++++++++++++++
 qcom/sdm845/Thundercomm/db845c/slpius.jsn |  21 +++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpi.mbn
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpir.jsn
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpius.jsn
