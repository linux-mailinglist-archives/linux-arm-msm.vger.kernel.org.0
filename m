Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97276709D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 19:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbjESRFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 13:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjESRFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 13:05:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051C618D
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:55 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so3915771fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684515893; x=1687107893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
        b=z3yvfQ4KllCaIiBPBzGr9FG7c5sdwTiPqU6aglyOS4rJihClrvueBLtwUcEXnJTQhE
         KlBTPqEwHR5um1+ryteThNBiq3Kv3LgHLa8HPLErzzMrUm+2kKOBMLyqJNnVrN+8dKEY
         3m3pTPxnqWLSpGlNWegJTsWft6XfG0P1wCxfXxjqXzgqd0catmm3Ku0GmWczouxrKs/y
         2LH8VuuUaOSrNDmFbiHZ6rp3jxyNtSRD97xY2lflSuVPUdm166+HMvBXLEgxL1ia4/Bw
         UFDEIicCYwh0FLE1ePZv5oMLb9U5k/hMD6Es+M4rCtTnjsJh9iRUzJ/mLPMtf4nZBmJk
         rtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515893; x=1687107893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
        b=OiQnr48/8apQZlsmfB+JIa3CcADYsc8GPj+aQpbbYd5ON1aBRomaophGi+J/ge1Bwi
         Ls5J2rSLS4LtIlBRFuXqk2Spy27jCXtOip6BzGdJ/GNg4fFrrY0CcfOGshSFcAVavCB6
         /EqyzEBFo1VzTz9B/ZJVzwqZ9CRqSNE4wrjt7Uarir+xmf5N9yuvgziwvu6bAZMPKxb2
         S0/qeHi1/s/E481REVouUZMmmWBuMr0qOhiMmFRgZl/fVaI7lYzlUcdN0OdBLL60xyQe
         fYbu3oG2UibzJf+vs4OioV7Th5Xqazgcr9s0Sd3WrY7loCO7Ub36wAGwuI/N2qESPNh6
         YpKw==
X-Gm-Message-State: AC+VfDwixLpWvzt4WajhGdIPxkB20ORtS1r059g2oCWsGn2TlQvn/den
        jTMQk+ByXyN/F917h0cXjKsBwA==
X-Google-Smtp-Source: ACHHUZ6hb+9tW9dZymi1gZLakhlpllRE71/FgqhEmtf6uNPbPo+mBDJ1VJEFHKSoSos09di8OsIesQ==
X-Received: by 2002:a2e:3213:0:b0:2af:1eee:84af with SMTP id y19-20020a2e3213000000b002af1eee84afmr1168912ljy.26.1684515893318;
        Fri, 19 May 2023 10:04:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:04:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 19 May 2023 19:04:33 +0200
Subject: [PATCH v4 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-12-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
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
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=d3S3xhOuliIdaa9KoHmUn1yxgnvenr1zId8Sw3Pr4Gg=;
 b=ihwHwr0j8S4l2zwqo/DbkiQez0VWcdnrFgJZGS+0sED5bEZluFPe94qSoPP/csG4/zAKv0PiV
 fDngCeGT1ZID8bR3q1gXI/bL59YYGxIww0TnxuHMyLWg2Di1qBia5nL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add the SM6350 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d7d5d1dbee17..e64c737724c4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },

-- 
2.40.1

