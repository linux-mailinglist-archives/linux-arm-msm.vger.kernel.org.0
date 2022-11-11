Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8090C625DAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 15:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbiKKO7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 09:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbiKKO7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 09:59:31 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E7F64A02;
        Fri, 11 Nov 2022 06:59:29 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BA0F96602A53;
        Fri, 11 Nov 2022 14:59:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1668178767;
        bh=+s8U+ysOQ3GldrqmWhai/Lpf4c/N59+UHllqmAZ7ue4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c/TK7nM727YT6ta5popYpO7ux/3o1JbfwxfHFijgAW4tIxOZo8QD3lwGpBigrTacY
         ydlA5EFtIYMTHKJNozdVS6O/nQ6hfdvvuYKsjdKeowv4FJZLa3Pfltpk5JAumDpkWB
         IOTTv57a+GESrRJgxIVKQ/qZ2ArpVfHvCGbciGUvbG7GVBOYXTD3yWsW90zqCEHGto
         TbMAUMqCOWL0SEcHBhDXjykvzJOG3FKLJSdMWZqaCwQqQEiRyvTqOjdqEbyEUfONx2
         4Gy6ThSCSDbPMWD0xJM6iV1NesHlH6xX4Y6grDtk6cuteweyp2Lj+/FK2E55F0N1nl
         Tly/ertgIkr8Q==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        marijn.suijten@somainline.org, kernel@collabora.com,
        luca@z3ntu.xyz, a39.skl@gmail.com, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/8] dt-bindings: iommu: qcom,iommu: Document qcom,ctx-num property
Date:   Fri, 11 Nov 2022 15:59:12 +0100
Message-Id: <20221111145919.221159-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111145919.221159-1-angelogioacchino.delregno@collabora.com>
References: <20221111145919.221159-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new "qcom,ctx-num" property to force an ASID number on IOMMU
contexts where required.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
[Marijn: Rebased over next-20221111]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..7d4e0a18b08e 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -46,6 +46,7 @@ to non-secure vs secure interrupt line.
                      for routing of context bank irq's to secure vs non-
                      secure lines.  (Ie. if the iommu contains secure
                      context banks)
+- qcom,ctx-num     : The ASID number associated to the context bank
 
 
 ** Examples:
-- 
2.38.1

