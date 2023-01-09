Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7C1662D8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 18:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237547AbjAIRsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 12:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbjAIRrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 12:47:07 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5780210DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 09:45:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so9007784wrv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z32OObItYDU5Snv+OKv7I8Kte9b3truphqMhTjg9bvg=;
        b=V0SBMwVnRaQX+3Qqk9nABhO/dRGl4eb/dljK1gQ5Zviw+b8Axzr52HngVGgiUxmz7f
         jhz26jhU6WQM9ewMJ8DZIjcAYP6jErBIUidEuOo08WHJ6RIW/lISNoS21pvcEW4u7ZoU
         1qws2X0PVwSAoZzkIs8HgOsZNv4bayRKsnXBaW27tl+v1hiLF9/g4J1I/AJ7ZTQpbyk3
         Z/Zk+aqbPqwPt5vhyIniaEIPhrlalZHlKLpm2azb2EsHxSpjcanaDlBf/S0LItgjc2Fu
         jNLjgxA/M5XUSyyEMNFT0EigNMXp3IjqqtXhmdFxinbNEa3f3z6CwqJ24CvSmJ/J44LC
         RAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z32OObItYDU5Snv+OKv7I8Kte9b3truphqMhTjg9bvg=;
        b=G0x1ojlvk8qOcWnY6YVtLMjGIqQuw4FdLpcPLkHie4rsGeAwa0khTsnFo42wMD2cmN
         kbEunbSE3leABthBKtHx5Yl5FqsaTZh4yDQdVCV+jMSbomWbeQ0t3/iOWrv6H92eOpKH
         SoyaIZsdw6pxuZHz/HZrvzaHYndWpYd6K9T/fvuyloe0DnYHKjsN0d6yPWr4ZIhPuLLD
         J+K4dE7npIx4+x2harrBOn4ORe0bgzpW6dsPuXOSy/piB1wwuR9wQPUBXEN6ozm+zgBV
         AsfxtV5ZkLYui0WfpZuyH7A2/6dkNRWWHo8G5RT7PaS+L/CGOPppyp/Afi9BMSm8VQ2N
         biHQ==
X-Gm-Message-State: AFqh2krsoRNNzVIktAW2kgQk7OjC1kYFMIj14LeGHsEueEVxjTpw2sio
        TpAnMll0V2+Y9VUpfx7VopU2dw==
X-Google-Smtp-Source: AMrXdXswgiQkZmy7UbcCgilLLNteNPIfoelgr03hyWLBncvJUD039+3M1xfBnxxIZ1BJEVW4NHg8jw==
X-Received: by 2002:adf:fa4f:0:b0:2ba:f3a5:d0fe with SMTP id y15-20020adffa4f000000b002baf3a5d0femr8184847wrr.63.1673286353546;
        Mon, 09 Jan 2023 09:45:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c88:901e:c74c:8e80])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm6142902wrv.113.2023.01.09.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:45:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 16/18] iommu: arm-smmu: qcom: add support for sa8775p
Date:   Mon,  9 Jan 2023 18:45:09 +0100
Message-Id: <20230109174511.1740856-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109174511.1740856-1-brgl@bgdev.pl>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the driver to support the sa8775p platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 91d404deb115..5e12742fcfd9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -500,6 +500,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
+	{ .compatible = "qcom,sa8775p-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.37.2

