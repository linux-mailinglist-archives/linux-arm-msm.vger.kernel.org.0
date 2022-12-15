Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3034B64D8E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 10:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiLOJpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 04:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiLOJpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 04:45:49 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB8B272B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 01:45:47 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id o12so9886125pjo.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 01:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69DTVCg+3X6hPpP3I2st4EfUly1VECQI6r/v/bEiKyM=;
        b=m+JARgKSuAmfQ3OGq2EV4c/JFF0K9yB5R1E5cHpLT1wIA/x29W5v2nDtF8eRV1qiSO
         gy0Sz6uaZ6Fz/YYocDittXvsUOXpOK4aEw8tNcK2OcaIwxfgdpKHkxPBzaSL1GdGfBI8
         AimKxI/2X27WuhMvSOFDAEp+2ONZAich7uNrr1F7Pf5Qa4sXoYtM8X4CiRpm2UPsGRGM
         tkJ4gz2wNldNV7Etxt71GdCEnLpjQp1cgNjfxc2qWnKjdkX83h+THcOn/fyZWGIluq4/
         hU+WL/IddkWOnIUj5RmmthXczAuUzUXhJ30sPCIo1K1BzF1hE5ddzzLdGh9ulyEtJyT5
         FPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69DTVCg+3X6hPpP3I2st4EfUly1VECQI6r/v/bEiKyM=;
        b=7Wg+mJxO/1ho7RAibFz8QqPwsf3AhB4SmCfkyxEhrvvfxXVOTcRUId9/h4CsOolV2Q
         Ut+Bqs2QLcGF2A5rOjKfVm0r1dlAXtLlROue64HlGIeWHsUW0xgK9mibVG9NtLzZqzCE
         VaWM+oRVFAs5RcZZFr9+BAMzgdOkaQY82eCBviDTNkQmLsBbI/0vgg3lBYyIirEyggdH
         TgmCPCexuRsZTd8NNgYpTB97YyQKebHVcR/D+De1euSxYqFgFVY1bnbB+i5dmCdChFvN
         mLit4RE5FhkQHlmDKxWi6nVykyhb1Z8SV4Yn8+0osufgCcbG+LUJV/fA8A4v0lrTPJLz
         KB0g==
X-Gm-Message-State: ANoB5plrCr5Clxj+CmKndB+1wLySrt64dIszL902Zb+zCUhVELFiOPeQ
        bwVFZmnVnHvu2EGWivrPATOQXF/JBgFL4lSGjG0=
X-Google-Smtp-Source: AA0mqf4vsjXuCsyebttyjsOalmUalRLKZVTz/aYCl4Y+ivTXSOXjLOZ5Ksvbs+/IMzQRLlaV62mIGA==
X-Received: by 2002:a17:902:b284:b0:189:c62e:ac34 with SMTP id u4-20020a170902b28400b00189c62eac34mr33042797plr.47.1671097546111;
        Thu, 15 Dec 2022 01:45:46 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5f:4e45:ae49:8018:6d22:e5b4])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b0018971fba556sm3342646plk.139.2022.12.15.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:45:45 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Subject: [PATCH v3 0/3] arm64: dts: sm6115: Add USB SS qmp phy node and perform some cleanups  
Date:   Thu, 15 Dec 2022 15:15:29 +0530
Message-Id: <20221215094532.589291-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2:
-----------------
- v2 can be seen here: https://lore.kernel.org/linux-arm-msm/20221214203124.564537-1-bhupesh.sharma@linaro.org/
- Fixed a blank line issue in [PATCH 3/3]

Changes since v1:
-----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20221213123823.455731-1-bhupesh.sharma@linaro.org/
- Addressed the review comments from Konrad and Krzysztof regarding the
  USB HS and SS Phy usage in sm4250 oneplus board dts ([PATCH 3/3]).
- Collected R-B received from Konrad on v1 patches [1/3] and [2/3].

This series adds USB SS qmp phy node for Qualcomm SM6115 / SM4250 SoC
dtsi and also performs some related cleanups for USB nodes.

Note that this series is rebased on linux-next/master and is also
dependent on the corresponding dt-bindings and driver series sent via [1].

[1]. https://lore.kernel.org/linux-arm-msm/20221213122843.454845-1-bhupesh.sharma@linaro.org/

Bhupesh Sharma (3):
  arm64: dts: qcom: sm6115: Cleanup USB node's label
  arm64: dts: qcom: sm6115: Move USB node's 'maximum-speed' and
    'dr_mode' properties to dts
  arm64: dts: qcom: sm6115: Add USB SS qmp phy node

 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 12 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 45 ++++++++++++++++---
 2 files changed, 48 insertions(+), 9 deletions(-)

-- 
2.38.1

