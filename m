Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F57764B54D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiLMMlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:41:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbiLMMkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:40:18 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A891B9F0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:34 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so3365802pjj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BF8JndXAe7RFMWzoj2II+IDSsudG7x0IX18blakTqU=;
        b=aFeUADQqf2xN9haWcEEq176sYYEkoT66D6W4F6Cc0gBcIuvjXrhMg04MXvqZEZbRFS
         aHuMSYQ9sjBA/JggARg3iYMm0U6tCKHiX252IW4BZI95aRV/0ZZ1W27hQGBSx+btTGZX
         512gTKbiWw2KgyvJzgw+33CAlNZF4ztarYfF2/1w5rnY+XA+JPBBJdicdPfZGQT8Kd1M
         qdYHRUa6cXP8T7D+5pEiebcqdpQ2cJtU1gd1yL3Hmwn9wpKiMs42cgFtaEu2jAhf3blS
         /OKzz5cYnIsbSqn4up74jE8C81Q+xWks4xtS7L5U+3CkM4PRNQVEd8+CacOFZcQlMuDs
         0k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BF8JndXAe7RFMWzoj2II+IDSsudG7x0IX18blakTqU=;
        b=HcLqtc2zVAnU7JrddsO2SwAYAt3hjZmgwP3CEYoJU4Xuc6doHu55RyWj9itKhnCrzN
         SQeHR/KndR5dSRX+l500JxwJfbo9uzIlwEvAvAi26NrjOdfuX1FcnHnN3AQ1Ai+BoPPj
         atikPB1+FRw1mfyAGDgi932/vITRCVmJqKoj0RsJ+aZfTdNr1JdLkYzwsUP5V6ikV2pw
         0oL7UwkrTLyaFu3TT3YDOAo0XWY0z//kEcn3vDsonDFFN+zCoq6INd9TYa0Uv2/3t6H0
         pUyVP96L7hDgcafeP4mYY0M6su39lJ3tCLC8b/vTrZZUibHDRA7yl/5fFT54dnQBZjUV
         pFww==
X-Gm-Message-State: ANoB5pnH9RJ59K8t9v2j74hXCN+FsxQj8E5H+ewQdsBpgYGKh+0FAHwI
        2m1RA+rb7JwJ+MTb3IGT9aaHcIVGtrSttFy9mSo=
X-Google-Smtp-Source: AA0mqf5MSPjudIpNA6MAReWXCCofjZkVhmBjYKad9SStcXY7QUi9Q3DdzYkcPANTvyE8t2ry11ff5A==
X-Received: by 2002:a17:902:9b8d:b0:186:605b:7527 with SMTP id y13-20020a1709029b8d00b00186605b7527mr19263795plp.48.1670935113345;
        Tue, 13 Dec 2022 04:38:33 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c60:4bad:5c3:ab51:3d81:6264])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902c44c00b001889e58d520sm8297011plm.184.2022.12.13.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 04:38:32 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Subject: [PATCH 0/3] arm64: dts: sm6115: Add USB SS qmp phy node and perform some cleanups  
Date:   Tue, 13 Dec 2022 18:08:20 +0530
Message-Id: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
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

This series adds USB SS qmp phy node for Qualcomm SM6115 / SM4250 SoC
dtsi and also performs some related cleanups for USB nodes.

Note that this series is rebased on linux-next/master and is also
dependent on the corresponding dt-bindings and driver series sent via [1].

[1]. https://lore.kernel.org/linux-arm-msm/20221213122843.454845-1-bhupesh.sharma@linaro.org/

Bhupesh Sharma (3):
  arm64: dts: qcom: sm6115: Cleanup USB node names
  arm64: dts: qcom: sm6115: Move USB node's 'maximum-speed' and
    'dr_mode' properties to dts
  arm64: dts: qcom: sm6115: Add USB SS qmp phy node

 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  9 +++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 46 ++++++++++++++++---
 2 files changed, 46 insertions(+), 9 deletions(-)

-- 
2.38.1

