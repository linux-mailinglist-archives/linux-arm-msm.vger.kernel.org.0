Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A7D6D86AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjDETTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDETTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:19:16 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F636A4B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:19:13 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so38336142pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zlksD92y91W/zBiGYAiTH3OBW9sw1/DW7nrq7m6H8A=;
        b=Tl8NBWMiJl9vi0VjN3/5ExPfrReizRoo5kUk43xO2MZ4ES/Meyyl10g8bSByHqrnA7
         nXq8pLWn8eup0i1CwY3XfmnQM86lZQvv9y3Hgnfyd7LlO1iOSh6fj74qJWf5ZKnMu2LC
         UPjngBqvWGV2POebFrjV23T02xTWE/vlJArmaLwNMbCfsGZ+9Fic3gmBFtq8Goar2bmk
         VOD8Z0NY6OiRBjK3v10or97jKnbUTQdQJma2x4MFObp7E/4cVLWZVTzO0SRAh6AXIbW2
         QgD39X+nNeNPPjbNa93ExmFP3hH5/A86Qu3TDraeNoTx3vN3xa6pafG7Z31vC8UrvOkF
         WEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zlksD92y91W/zBiGYAiTH3OBW9sw1/DW7nrq7m6H8A=;
        b=KrYBIwHkUcW+jonLgnB2tKHQh/zgbDb19NsBZTEH3TmzsWPmv6RFj0qkyn9iWpvjSX
         Vvup/VqYtWu9+XP1zNJURq7qSrvtHzBpJXgOj8AnOjKEnu1GrY2ObL0AoyGlY+IKmeUG
         2TjP+NkxWvbRDgIIBPAkbUk7BGo8H933ag8a7MS9f+T8GLesPehv6YpL/I5+Qp7t9kLZ
         I2KjKfe6kCsJsYVS36v1tKp3jVvW/U3xwWPmIHwLQ6oIQ1CMW094CB2yYUZ72Wz0+1pp
         WfWgO15YHoUH7kUmsgQmmL2qTOtil+iLBx9WoWP8qcnHxhoKIoPoQ6Qctlfy9tDNhkf3
         IB0A==
X-Gm-Message-State: AAQBX9ctZCSu2SAnobhVFbXqGNecqbrr0RlJu19aztXEpwoj1QRRNkWe
        OQMlHgWvu8kKlgPnreWR1NYTQ7A2OwnBC3X5RUE=
X-Google-Smtp-Source: AKy350ZnCH0zsQ7BpkuAXwC/NfeSdLVgSm8Gk9+vTwYOmSnoat6y6vPz+7X6Fr1oyoUrhW00QR6npg==
X-Received: by 2002:a17:902:fb05:b0:19a:9610:b234 with SMTP id le5-20020a170902fb0500b0019a9610b234mr3167771plb.1.1680722352018;
        Wed, 05 Apr 2023 12:19:12 -0700 (PDT)
Received: from localhost.localdomain ([223.233.67.41])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902aa8900b001a1d7329235sm10478097plr.234.2023.04.05.12.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 12:19:11 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v5 0/2] Enable USB SS qmp phy for Qualcomm SM6115 SoC
Date:   Thu,  6 Apr 2023 00:46:31 +0530
Message-Id: <20230405191633.1864671-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v4:
-----------------
- v4 can be seen here: https://lore.kernel.org/linux-arm-msm/20230401154725.1059563-1-bhupesh.sharma@linaro.org/ 
- Collected Krzysztof's Ack for [PATCH 1/2].
- Added more descriptive commit logs as per Dmitry's comments on v4.

Changes since v3:
-----------------
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20221215094532.589291-4-bhupesh.sharma@linaro.org/
- Fixed v4 as per the downstream driver code: https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296

This patchset adds the support for USB SS qmp phy for Qualcomm SM6115
SoC. For the previous versions of this patch there were conversations
on irc as to whether this was a 'qcom,usb-ssphy-qmp-usb3-or-dp' or a
'qcom,usb-ssphy-qmp-dp-combo' as per downstream code and hardware
documentation.

But after a careful look at downstream dtsi (see [1]) it appears that
this indeed is a 'qcom,usb-ssphy-qmp-usb3-or-dp' phy and not a
'dp-combo' phy.

[1]. https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296

Bhupesh Sharma (2):
  dt-bindings: phy: qcom,qmp-usb: Fix phy subnode for SM6115 & QCM2290
    USB3 PHY
  arm64: dts: qcom: sm6115: Add USB SS qmp phy node

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        |  4 +--
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 36 +++++++++++++++++--
 .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.38.1

