Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10E7695F22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjBNJ2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbjBNJ2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:28:01 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A1725289
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:27:21 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a2so14927586wrd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/B47bE8TEfIlwi0qudqXOToGhOOwF+9/IKyL/OBYwwM=;
        b=HtB+4uy0R7dSoCt090raVGS7qvZQvx5WrbILkZZ7CvFAhcke1jWlvYFE5RWmLJwMpO
         t4nwDEdKSNv4rDaJmARvtEOFimeuZFq4V2siLywcwJexjfFxeW6nNajv95w6js9sS0QO
         bFepuDxhqsvTjvYsN44TOI3YzPWr70DS7WdQMMu4XE1GuryMWVUWrrGC4aoSFgz10qfl
         y8u8B7/UGL3lG+OGaWropHipixel0L/E6bBtq8lDK5wI5qrh+xg90YcQMka9PAxQsykB
         t/3WpwtTobfW5lxNSypVaJHEq+XVte43EDbt2y7YSnvnwrbhyEYPyysdZQvBzzHwAJfU
         Ec8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B47bE8TEfIlwi0qudqXOToGhOOwF+9/IKyL/OBYwwM=;
        b=Kmqu4A57Eudw0/UpuLbeGNK2T0eOu8xrIrjnTd1WKe8elqFfquZz2w/9Kkw7ezGyh7
         G36LRzjFOnbBzEN3bcvIN0VaRvF2fGV1Go1LBtGmWgZjwkh9z7fxi1BDqSZ481mgUcoP
         DMGYVnOj7pFxbhQjjJyRUcBEd64w0ACGThAfneCAwB3uKSfvx2zldWlCAynHPtinTg5V
         BpIlOvh5WubfPCFJzGU9tKExxzdGXufT26ial1o9yxun4eEF0QNfv6rp/EK+kixMV1ZV
         P0MeTZzlnqD3qLyi9/iHi4PUJRCCUiYcw/LGff0QYraRtW2dbWXOeG8L0xLpq8bad00M
         +WfQ==
X-Gm-Message-State: AO0yUKVhbYMHZegPSeDGYOwPmBe7wOr0uru9iw2k+AFk/iRtUKfDunHC
        XIfJhFnY67oOQcRKafkHeJk8SA==
X-Google-Smtp-Source: AK7set/4H2SVEASkO1eQtPPR2W2rsKOI0syaJ8qp8ORtqLlai90YCKXoISxAgAZt/UopwFfDxi5NmA==
X-Received: by 2002:a5d:6182:0:b0:2c5:48bd:d494 with SMTP id j2-20020a5d6182000000b002c548bdd494mr10170683wru.29.1676366838305;
        Tue, 14 Feb 2023 01:27:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4b:bef:7edd:1af1])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d6d42000000b002c4061a687bsm12687602wri.31.2023.02.14.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:27:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 0/2] arm64: qcom: add initial support for qcom sa8775p-ride
Date:   Tue, 14 Feb 2023 10:27:11 +0100
Message-Id: <20230214092713.211054-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bjorn,

I'm resending this because it's been discussed with Qualcomm that we need to
drop the watchdog node from the DT. Please don't apply the previous version.

I've also dropped the patches you already have in your tree so these are the
two remaining.

v3 -> v4:
- drop the watchdog node from DT
- drop the watchdog dt-bindings patch
- drop the patches already in Bjorn's tree
- collect tags

v2 -> v3:
- reorder properties (reg always first, etc.)
- tweak node names
- remove properties filled in by the firmware

v1 -> v2:
- lots of improvements all around the place to make the dts pass dtbs_check
  (with some additional patches fixing bugs in existing dt bindings),
  make dtbs W=1 and checkpatch.pl
- move board-specific properties to the board .dts file
- ordered top-level nodes alphabetically and sub-nodes by the reg property
- fixed licensing
- set #address-cells and #size-cells to <2> in the soc node and update sub-nodes

Bartosz Golaszewski (2):
  dt-bindings: mailbox: qcom-ipcc: document the sa8775p platform
  arm64: dts: qcom: add initial support for qcom sa8775p-ride

 .../bindings/mailbox/qcom-ipcc.yaml           |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  47 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 805 ++++++++++++++++++
 4 files changed, 854 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p.dtsi

-- 
2.37.2

