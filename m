Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B228577D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 10:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbiGRIDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 04:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbiGRIDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 04:03:04 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204B9186F5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:03 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso17429392pjc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tpx7W5AzNmBOehXTrR+NiJH63xJb4zhf9twlR2Umlp8=;
        b=n4GcIOOUgmkPFZSPNZ9vmAGyrFcQcMyjs5VXvOMP5kSEC6tZm+VlMkiJdsAzzJB7y7
         2IgEbJpEkIm9lILBygY6U8qtv1ITXov7SL75oITsMw+0p3SNy/Slnh47h3TYkc1e7U2G
         HA9d/Sue0vMQqV9LnwsWgdToJVThTFQ5oDFTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tpx7W5AzNmBOehXTrR+NiJH63xJb4zhf9twlR2Umlp8=;
        b=Z3RT9ZAllrCrPuY/ZDdVOwtMTZvhu1xrzH/MsuKQ+wkiZV6ftD38QgqD1cAjJtSCD/
         wG3FHCKf/xfqZ5Ot+oHzC/x40QASw3estr+i5I/GI1FN3GmjqLFf+L7kHmb83hKPmA99
         v+GDX4tH59jYIE0hKEk4PF9dEzKZKS1H50glMSwlE3ElJ58V9FoREUYiSN8nMLKxfgfC
         PXyTHzzML4jK596gOHoAMOsxfJx/KcN+wRygupY73VOA0wZn/cBZMGlMLJEpMjaJbfja
         sewGA12N1hgFQq+o8FCfvC35Pxf47FsCXhUfG4JNadV8vtlb24VMrb8U0SdtkFTEpNSv
         p9iw==
X-Gm-Message-State: AJIora+dk/x3vGRpp63F6GjxVvr+tO/UMhcwDS0vA/HHNUStEmHArdk7
        yOG6p/HPWMjUkuVkLfhtlw5+AA==
X-Google-Smtp-Source: AGRyM1uVbXs2+/0SOe8+R5P/ru1XgCwk3NUIvM/gVNY7x6gLmXpuSX3Ydr8CGsW6azhDEeXZsxAgmg==
X-Received: by 2002:a17:90b:1488:b0:1ef:82bb:5f08 with SMTP id js8-20020a17090b148800b001ef82bb5f08mr37241118pjb.214.1658131382639;
        Mon, 18 Jul 2022 01:03:02 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c10100b0015e8d4eb2cdsm8672616pli.279.2022.07.18.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:03:02 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v2 0/3] Add dtsi for sc7280 herobrine boards that using
Date:   Mon, 18 Jul 2022 08:02:49 +0000
Message-Id: <20220718080252.789585-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put sound node and lpass_cpu node settings for boards that use rt5682
codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
choices of headset codec for herobrine projects. Common audio setting
for the internal speaker is in sc7280-herobrine.dtsi.

Changes Since V1:
- Not to include the herobrine-villager-r0.dts changes in this patch
  series to avoid conflict.

Judy Hsiao (3):
  arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
  arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
  arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
    in herobrine-r1

 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 121 ++++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  15 +++
 4 files changed, 138 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

-- 
2.37.0.144.g8ac04bfd2-goog

