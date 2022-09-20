Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C705BF053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiITWlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiITWlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:41:16 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5CA6745F;
        Tue, 20 Sep 2022 15:41:15 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id g8so3682376iob.0;
        Tue, 20 Sep 2022 15:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FlMLWqjsEhvvN9ALe+BbwKktL9+Dx8brwwgQenKGt2w=;
        b=WI8D7cv5AZmDkN4ttg4WESnrYZlMkYc+I75Yjz/udZtGHW6fOOlelxZ1TfN6DAlGfY
         cJyXYmECYMg4cNoQZuruYtL2NsVhMzEuXYGRwVrfoijNO1g3iTATKJHZIfLzmu0Ehl/+
         7yMnPdGi1jdgc7ZC2EZn+GHBJJixCPWGlXJKH4gJdnq3b8T1IgzLS97gKAtO76kycVxv
         j/tg7iqOtP7puKTrTFiSWI4fY+otdWgp38ah8/7OPArqc1j+EOit4B7ZVMdjTVweMqQW
         GddxzD96qbuZgnFq6wo3P/U5NShsIgsyWdqvzntO5j56R+3kybwi9Jp8NND2pfDP0xlw
         o9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FlMLWqjsEhvvN9ALe+BbwKktL9+Dx8brwwgQenKGt2w=;
        b=zYHkMN/mQJ3xzUUV+xbm45BuR+E/oeV/MopAjPDkc1L29wvOAE3Y2mu5RQM/6+CI3j
         s+uLcvJ6Pg8/ZxU8OTwbY+oWQJ1JsDHRj3V06QiAiXOvImcRgoO16SZcThFL8jTJy71H
         IvBIcEScSYTTkI8hM52Qi7UXwJgSZqnIk8PTj8Vn1LH8qRjpJQ1AKVcSou1O2HDHUm9Z
         cHrtqJ4+waz8Ka5LXWw5yYSOhKGybs4qx1rBy32VVJzv8haPTEolRDKMEKP09mOIITb4
         LJGbGuGUNLzVpoem+2umV+KffRKCVZ8RA36ufaY7Z2Y084DFLo6qvOTWsmjVxuFVb6oT
         LxZQ==
X-Gm-Message-State: ACrzQf0PVzqNlTLQT2opTk1DrRgON48pE+kB7zVpdbvf8R/Mz0OMTJR5
        TZl9Aa8DnsJn2LF+QJEiXaiFK/CrwyI=
X-Google-Smtp-Source: AMsMyM7DChjcxcQ05YM1UPiqeTWc90XICrCceCVpbT8ax1IaDzOSdV3dn3C0H8CbRGzvxdyjpdIRYQ==
X-Received: by 2002:a05:6638:13c1:b0:35a:54e8:a388 with SMTP id i1-20020a05663813c100b0035a54e8a388mr11985045jaj.268.1663713674992;
        Tue, 20 Sep 2022 15:41:14 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id q12-20020a0566380ecc00b00349cee4ef4asm394392jas.62.2022.09.20.15.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:41:14 -0700 (PDT)
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
Subject: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Date:   Tue, 20 Sep 2022 18:39:56 -0400
Message-Id: <20220920223955.151507-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223955.151507-1-mailingradian@gmail.com>
References: <20220920223955.151507-1-mailingradian@gmail.com>
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

The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
support it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b2708de25ea3..bf9653b9eb89 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500" },
 	{ .compatible = "qcom,sc8280xp-smmu-500" },
 	{ .compatible = "qcom,sdm630-smmu-v2" },
+	{ .compatible = "qcom,sdm670-smmu-500" },
 	{ .compatible = "qcom,sdm845-smmu-500" },
 	{ .compatible = "qcom,sm6125-smmu-500" },
 	{ .compatible = "qcom,sm6350-smmu-500" },
-- 
2.37.3

