Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2AD157D059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 17:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbiGUPyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 11:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbiGUPyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 11:54:02 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DF550721
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:01 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a10so2336336ljj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9nLGNhoNf4Voy480b5Pk+iT6tUcYySn3oFp235i7EnA=;
        b=Xormtx+3w0AkAYy82BWI5py02GzG9dTy/6dEMmOnRFS5TRjYz2GrFvOhRG5JMhhLQ2
         FaTRboEEMZWBkkDBDXvqzFZlypTpyeFSPQ14ze523yIcJvU76NYvavOkncxIIhi/3XLx
         DoTMe735WHWjoD9GeQ6l040n3Vdkr/0IVsECSUhCaoz0vndR2lyhse8HzloVyMtxqNQd
         v8URQ3xulGVoWbb/PeZpTAhAjonbXgWrLOa0POAT6IaL47IjW7l2q75JN2X0SVHI93S8
         3WpnhpRNIYS2kZoaR96MC96nTvdjt88SRv+NHIar7EOakdbgV5/6/ac8J3UsNHiUpi1j
         4NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9nLGNhoNf4Voy480b5Pk+iT6tUcYySn3oFp235i7EnA=;
        b=NQpjVEsRLMavaPx8RBHnySgJRquQ/M3nGWBfzLSxC07axHS/z0VEVFMqP6jumnMdtK
         9myrbyM0rSU/WB9TY4eiNz47OqHYhjGyp9fAoB3OKoiwjo8UZ3DxX9EN4ZBmhZhZodv0
         7CTmQfTaU+gtg8Uc6M/LhgNHF9aeRz5nOD/UV/qAgqpMFBOUj2ssb6HZkaQunFXw3aHh
         Wl8/DPv0y81bvJSfYmsYaXlr35sU9ooR7UpydfaZ1en48By/XL5liVqmhilG3Ej/NUgo
         uI274pFxIrLkId5lTQamkVy0DvPV87clQIl/ZMUim21WALGTtYy1rbGfqNjEA0DznqRO
         zGfw==
X-Gm-Message-State: AJIora8/m3hxcqsTvvrrIxx802dtmofJ4IUVge/w00OSHvp0PC6dhUBR
        Y31Lg3vlUxZdW78NUwYqS2tB+A==
X-Google-Smtp-Source: AGRyM1vIzC9/PwUQ6dM7nJwDfIudNc4gJT9freeiOOqJAWeIM+ZO4wzJHh+ASa27AXn5beLKYnPpoA==
X-Received: by 2002:a2e:a7cf:0:b0:25d:6b92:9c1a with SMTP id x15-20020a2ea7cf000000b0025d6b929c1amr18221021ljp.107.1658418839689;
        Thu, 21 Jul 2022 08:53:59 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512214e00b0048110fd06c4sm516432lfr.53.2022.07.21.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:53:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] ARM: qcom: defconfig: socinfo + cleanup
Date:   Thu, 21 Jul 2022 17:53:53 +0200
Message-Id: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

v1 from June [1] was did not hit Qualcomm patchwork due to missing maintainers
entry.

Resending with changes:
Patch 1: no changes
Patch 2: new patch
Patch 3: resending although recently Arnd posted global rework.

[1] https://lore.kernel.org/all/20220623110535.177326-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  ARM: qcom_defconfig: enable socinfo driver
  ARM: qcom: include defconfig in MAINTAINERS
  ARM: qcom_defconfig: order items with savedefconfig

 MAINTAINERS                     |  1 +
 arch/arm/configs/qcom_defconfig | 57 +++++++++++++++++----------------
 2 files changed, 30 insertions(+), 28 deletions(-)

-- 
2.34.1

