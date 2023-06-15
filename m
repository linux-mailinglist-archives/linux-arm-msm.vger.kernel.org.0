Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19A9731241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244858AbjFOIeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244881AbjFOIe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:34:27 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1302949
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:26 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1b084620dso23379051fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818064; x=1689410064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJFKJAYqrSeLSn08BaS5NCXpSvtm/VGCV0MO7zrEdus=;
        b=kQm9HBXBLCWqWWjmqAGTx+9KXTmzZ58a91bfYXpKqg5WmESYO+ouRIY+hi4+0Wi24m
         PnFz7OODuz1W297flc+XyyzgqHX3AU7jT8tY34k1DCpiEjcO4RNStrB+o+NIe31joO+V
         HS4t9W2DgjbhBhDSJzBI0IGRQSvfpA3KePL4c8xF/XWpCT2bc4wqOOf1jyiBVB2deYlk
         PHOZBi91VB3qPxyNK1XC6/Q5jZgCZJH4Ppj6HH6JSGPsXkuuMnCMDA3AIGrnlPqccOSu
         qa9jOlDvBZ6CantvPcSfH9LnOGL2IhT1hCmZAlTMWF4KrXdzV6nxw9TMcE00LZKsDQDR
         hjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818064; x=1689410064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJFKJAYqrSeLSn08BaS5NCXpSvtm/VGCV0MO7zrEdus=;
        b=EWfpGgTR+ORx8PyTEM2cgVTKp9ogI+0AzMQWm+icQdDu+HTF3UM0UtM5m3NUVE26Wo
         IZES1TgwVkN260LJV9Shqm2oY+lvnui9SheSxbuTSynAfJ+YlwVvapbr+e0eT/M55XlN
         V4m2gEpVIgU1XKCYpie+KruSuiNAkkioB6Xl26KCK+ujksTaqrfNO35ThtMcxZjEM0wZ
         6wf5oPHVtdL56jnoAinKscisc19Qe4Bd/xEoF5nFb9GE2UwUHG+q7eiG8Wx7Jr7OoIfp
         AuF+FGgUrJ3Ab//DNSTa6gAADhUcFhalpNMJGCgnkD9c2kvmSmzQYPw+GoPxULHwkXDL
         +TNQ==
X-Gm-Message-State: AC+VfDzOiDSJKu9F3K4fC0o9Upopzl+KyG2DD1aCiq43ubZNg7aHTDRx
        dT9c3SaQKZciF0oPrpSJKAAOVw==
X-Google-Smtp-Source: ACHHUZ4gX6dkU216Y8KtfPpymyv9rbbUOWqovitEDtnowQoj+Jae1TkQ8CzY3CmYaZwl+nqSy9UpNg==
X-Received: by 2002:a2e:b04e:0:b0:2ad:b01b:d458 with SMTP id d14-20020a2eb04e000000b002adb01bd458mr8628954ljl.30.1686818064225;
        Thu, 15 Jun 2023 01:34:24 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a2eb173000000b002ad92dff470sm2971209ljm.134.2023.06.15.01.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 01:34:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: rename HDMI labels in a correct way
Date:   Thu, 15 Jun 2023 11:34:20 +0300
Message-Id: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In [1] Konrad noticed that the commit f43b6dc7d56e ("arm64: dts: qcom:
msm8996: rename labels for HDMI nodes") is a mess, it changes all HDMI
entries, which is plain incorrect. Rather than landing a fix, revert the
offending commit and land a clean version.

[1] https://lore.kernel.org/linux-arm-msm/ZIrJ86IsLOm_Scbc@gerhold.net/

Dmitry Baryshkov (2):
  Revert "arm64: dts: qcom: msm8996: rename labels for HDMI nodes"
  arm64: dts: qcom: msm8996: rename labels for HDMI nodes

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 14 +++++++-------
 arch/arm64/boot/dts/qcom/msm8996.dtsi       |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.39.2

