Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569FF624EF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 01:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiKKAgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 19:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKKAgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 19:36:15 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE082DE5;
        Thu, 10 Nov 2022 16:36:14 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id o13so1880290ilq.6;
        Thu, 10 Nov 2022 16:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbdXluDmtwIUQ5Fk/3X9JKjl9348DISPBtcRQT1Y7qI=;
        b=dbHjL7+KR/6hnZw6YfJ+IDYM1sCeAaA9K9vFKnpnOGO8a/yNWSD6PpZD/juUMATPm4
         oAXahUsnSeF3vCBaCFYL8UEaZANdHhqaZGsi3tAgp+S0DA443Lki1sO0szLvqk+uMQnM
         QpVUqsWCA6Y3YCIpQFZE/8gXyQ1nqVFtdhe8yaYZ3qD0SwQMf5mRVL0ONIA3emWAO5Sx
         e4e8V0gL93byHCejHE16v/dRK5bTpHgo1unYeTAi+vqYweKRMaicYujEkxC6P4y+g/DD
         811lYu7AB3whQyf1Xdtic/GZQfu4QtKyky7cxYQZ3i/Ag1A/7IIAoIPL6Zf/Q1ToVgeV
         CoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbdXluDmtwIUQ5Fk/3X9JKjl9348DISPBtcRQT1Y7qI=;
        b=kEcy8+hk9hd/Chh2w9Fey/9d00dKLBIwZ46PGVMSYEozL21L3/XFGl90CnouiEv0JF
         Hazz3DIFm1hJHNw3HGpAwsguXuNYykpQXuflxGv3BRAPF+mfyNMO57AEGyGfcy739gD9
         fWwNWyQ41xwo0RHGQ349xd7sEgVjdYJfoc6rG8FJdOigcYNmtuaiK+zFK8OHx5boI5xl
         yunt6HQzjbiZCP/9KokO5VjYOx2Kp2vBP1CQg/ne6svoYTtxSKa6d0LFTEt6YYWo/js0
         TgvFHgV6OnLK02ADEw9zWsyw4dNV4XUjlyrXGbuAZjueEpYSmIGZ5nVd/ZwjLQizseiq
         0nKQ==
X-Gm-Message-State: ANoB5pnzchNwnljyyVN+hj+MiJxRIdpZ6/atCt/wUp5jXD6J9CGtDDEO
        6F1xXakkMisPmA5pDPTOR6I=
X-Google-Smtp-Source: AA0mqf4R4LohboNPAz0xIx9WUPcsbNzThvEpUaSgVXHILSNfmQI5g2eZVdiFy/+22yMSmHCGRRY3ig==
X-Received: by 2002:a05:6e02:68a:b0:302:38a1:917c with SMTP id o10-20020a056e02068a00b0030238a1917cmr1004549ils.87.1668126973926;
        Thu, 10 Nov 2022 16:36:13 -0800 (PST)
Received: from localhost ([2607:fea8:a2e2:2d00::61cc])
        by smtp.gmail.com with ESMTPSA id d99-20020a0285ec000000b003635a42d653sm306716jai.134.2022.11.10.16.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 16:36:13 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 0/1] iommu: SMMU for SDM670
Date:   Thu, 10 Nov 2022 19:36:05 -0500
Message-Id: <20221111003606.126795-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
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

Changes since v4:
 - version bump to fix double v3 (0-1/1)

Changes since v3:
 - drop driver patch (2/2)

Changes since v2:
 - rewrite driver patch (2/2)
 - rebase on (1/2):
   https://lore.kernel.org/linux-iommu/20221102184420.534094-1-dmitry.baryshkov@linaro.org/
 - reset review process (1-2/2)

Changes since v1 (no emails related to this series since last week):
 - accumulate tags (both were added because it seems like the discussion
   ended in agreement to keep adding compatible strings to the driver)

This adds the compatible string for the Qualcomm Snapdragon 670's SMMU. The
SMMU is necessary for GENI I2C, included in initial bringup because it
doesn't need non-trivial patches except for patches conventionally added
before the initial device tree (global clock controller and pinctrl).

Richard Acayan (1):
  dt-bindings: iommu: arm-smmu: add sdm670 compatible

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.38.1

