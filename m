Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14B97242DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 14:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbjFFMpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 08:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237789AbjFFMpB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 08:45:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087E01705
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 05:44:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so41275081fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686055465; x=1688647465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
        b=V1ReI/T+XetTpZFV6pPbBNshd5IFECMTZE+/Ns0lqS2R+pNJudcsgIMQlDZyyK8ZXu
         mwymOckDZ9+J+c4V3PXyZWiExBZkJQkQz6Sa+M8eqGcjD0ffi7Uo+JJyN3bZ0bEBJ9L0
         fwhuoalot+ziIUjYt0vgKeYjSkCGgJbjnClOH9mqB7keqlTTmb20Aq2633UiOSKnclht
         3u/rFF3iTcVM2P4fAhNUFEHyk7JTbpSujYZtFRdnrXbpY28AijIHHgm5LL7kUXXOuAdr
         6qfvmBh6UjMSYb8YtvqJQbqXf3gS2zrT9YuAmKyI/bbe7fXEyAComsn5M7BBwjFmLry1
         9/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686055465; x=1688647465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
        b=RdhOEOKOPNO2zwLWLt1B8GcsXMcKDnRcVh2npoWUM6sW7RMsy5yuJGzftQSwIbhdPS
         71O5RmEnWGECzIKI9scpHofnGwDKwxyg+tSDfZxcD7Sjze1wc3yiJiaZ8ajNhTTKXcT9
         ey0H0R8/DUx4/145Z5mXIGzGQbbL0C8Y6RAmQSwbrJ0JpXRZRUdsNxPdLcM1ybBMspqJ
         DLFmG6752lCSZLLvv0oWi3WlAl5/QI2R42WNsQzwFF+QjLFq/GmwSW7kyRZ3I1AzEOl0
         qU+OaLimQt4U6bZ8zJM0tJo0c7NMcLZMGVuAuZay8E5jgVdQ4zthIlxQbGDTcnZCn5ZB
         S+6w==
X-Gm-Message-State: AC+VfDyfiK6htW1foV7Rq9s9wZ9x0VVzy1MAW0/QE5+Sm5urxvi9g0Dp
        R/eUCoQGnBQnncUBZzPLKMW7hA==
X-Google-Smtp-Source: ACHHUZ7ekWTowrPVlra8w+zZoWxewe/oa3lUa6JCxAgmo+hje0H7GiRpgvh8WmtcKUSxXWPZeV25AA==
X-Received: by 2002:a2e:3c02:0:b0:2b1:eb9e:20df with SMTP id j2-20020a2e3c02000000b002b1eb9e20dfmr1073937lja.17.1686055465236;
        Tue, 06 Jun 2023 05:44:25 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:44:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 06 Jun 2023 14:44:02 +0200
Subject: [PATCH v6 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-11-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U7GrazUMOESVisMUp1R2X/i2E38+ra43yVyDZTsdMko=;
 b=jxGg9uqgLp6Xj4teEsBXHZg3TUHPabmerE8XQFJme0dKqJNcl1H0zer/Z3ueyg2C8OOTX/lsn
 lsiNsc2XIogAgDJnhIjXPMLCHVQZk9ZXI2zac2qD51AlEO2+Dsa/P9J
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM6375 DPU compatible to clients compatible list, as it also
needs the workarounds.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 3800ab478216..cc574928c707 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ }

-- 
2.40.1

