Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBB45BF054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiITWlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiITWlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:41:11 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7690460536;
        Tue, 20 Sep 2022 15:41:10 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id g8so3682226iob.0;
        Tue, 20 Sep 2022 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BXZcT0E7Jcc0vW0Dx7kPuxWsfI+ZPqAybt6l/VMr1KI=;
        b=ebT0WQQ5Ujpx59vwyT50M5q2rqtt/BPqShL1yERo5xwrUFKiBLy9XEV2Owk7LpSBNy
         4bwU1b/JpyL7LDC9BwPBHa5OUNozbPINErat9wBD9K6VqONoXjOGK1MrJjrgk3OyaK7n
         81mempDCiN5b0GddHkZk6D323cGvAZ1OQpBUKYLTV9I9717YmktrX8tBSX3T63clu1Xn
         XF5WgnH5n9wARfqL4prk3neF366kxlWhPMgWtntnTuZPk5OENXAWvOyYSivBFtMkTT6U
         HvnfEz6msRBEZj41pM5aVWvsIyyfCQyhDDRxUtvZCH8Z6ZyvL6Ha06TjynkECwlKIaCK
         2rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BXZcT0E7Jcc0vW0Dx7kPuxWsfI+ZPqAybt6l/VMr1KI=;
        b=FugeGz4rE8N1i8EFzsrtVo0eNIEBn4EaHuCgV+RI6l9T1WlJDS5NP5uFRUND652IBg
         T1V1ujaKvaJit7IuaaQbcJYO1jJGFtR3Tm7Ym6CKwfgSl8OZVvNqtaLbA8MG6kHmYPha
         LlRijLViXNGsBorlju8IndXZFxRJtf25W9z0jaDJnRK6T/NHLO+7FEzePHrlk3yeUJ1s
         sVrPwwndYucAyAOPVGt/fc5zjhyjtokjbvokwtyh0Vs70VZG+QV8YEMEYg2dafYdHW9C
         Mv/OUe1EVBMXd5MlkUZkRkQcRuGL8a7U8z3cB1Mbl2dCgN726JKM2/bAZJTauP0fZ2Em
         lyOA==
X-Gm-Message-State: ACrzQf0rEKIkomBpb8jWSZNdLSSBZABBxAvhvyucNteaBfhYFFxqXCeI
        FZC1fZrKBcs4oq2d5Fjb0YpwiHSwuBI=
X-Google-Smtp-Source: AMsMyM7NkZzTh0GRIEY+1f9ui/U2uufl/iyIvknAsND/nMHbPXS7jDpvdSDmPBzieXbh/etrDlVQnA==
X-Received: by 2002:a5e:c819:0:b0:6a2:ef12:2f1a with SMTP id y25-20020a5ec819000000b006a2ef122f1amr6980737iol.133.1663713669646;
        Tue, 20 Sep 2022 15:41:09 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id x2-20020a029702000000b0034272baf43esm366081jai.168.2022.09.20.15.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:41:09 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/2] iommu: SMMU for SDM670
Date:   Tue, 20 Sep 2022 18:39:54 -0400
Message-Id: <20220920223955.151507-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the compatible string for the Qualcomm Snapdragon 670's SMMU. The
SMMU is necessary for GENI I2C, included in initial bringup because it
doesn't need non-trivial patches except for patches conventionally added
before the initial device tree (global clock controller and pinctrl).

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 2 insertions(+)

