Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0126774270
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbjHHRp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234841AbjHHRo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:44:59 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5789003
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:20:23 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso90511151fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511582; x=1692116382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlY5pXEYcBgHeb5qjzLwZeG+1V5JyWmwzq+8kailYB8=;
        b=AXjpokP7gQlPyYtxe8cBC/8fim2+gbeg90MTM4kUgmoLF0tmWNdFW7nPBr3+MCeTbp
         p4481l+F9NbhxT7Rzm6htviNdxEBCWWKPQg2GI6QT/AZWkhJZTV8XnD6Qfth1lZp/xR+
         4YBSxRz/xfbmSZIAHfHRljmEoE9rcoTtwAUtPGrSzRW7mbbM4itdxdq75h46dyQi0GFn
         ZbXYuNMdgXXLXuAun6MS9joYtGW4N5JwdbQgXEafNZ05sEhleHCCNJEN1K/0EKHNHJ2L
         YVAbcNcKohiUoFjvMANbk2l0+Tu07TEwVn3GGTwsXCrY8wK13HwcXns4Koiws3ciWL98
         5CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511582; x=1692116382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlY5pXEYcBgHeb5qjzLwZeG+1V5JyWmwzq+8kailYB8=;
        b=c6mzxIRQVHDElT11U5HI+VVNZucmsh9RH9gAAphVwrBxkwuBkIjM2tNK35M7aRBd3J
         Rnnc+l86pHnksOKwV7iLxoBRF6ua1Jtsyc0e70eHU2Hk5cILCf3hPBq3VEoyzgGErXuK
         z4dvXUJCyLdzTXDbXJpGUcOJ2ETbl/XDGJj+GEOU/2ZYvc7K5vqH+iRRKMkwcE9UpQXS
         GRUIu7T9m/wvjPp3qrygRgkRfRJ48fQncNqDo7FzY+pfkYqryN9YF0N1KfOkaSuxgSwd
         PI/Wye5y6j2gByD+IL31n051UzbdXNi/zspEEEy+jMRYMqVJnChXGFxU8/2A2xIjsgH7
         XRjA==
X-Gm-Message-State: AOJu0Yy6ukYmAhwZs/E95O3in+Bb+ojzwXz2avyje5y2zz0ErRnzi/r6
        OPElT5Qjz9qb4pk6KTIvkOBuangvbqmoedy73p4=
X-Google-Smtp-Source: AGHT+IHh37iYuUiKI2GbU0AYhtJBCPFDqyHRg6hHZo0rvcAp0zMmu3aywLaX3w+vkrjWoKcJi+lCTw==
X-Received: by 2002:a05:6512:20c1:b0:4f8:58af:ebd7 with SMTP id u1-20020a05651220c100b004f858afebd7mr6593359lfr.39.1691487897383;
        Tue, 08 Aug 2023 02:44:57 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:45 +0200
Subject: [PATCH v2 5/6] clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-5-34273e275c51@linaro.org>
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=1105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=87zmBNCrKExC5fA2pDw1hJreUEORhjqL4+NYXqa3bgY=;
 b=VT9trWuRQROU5ByyIvzOsud1+jUCahMFSSwl7lXsHgNEroaV6TNcWL2Qi+2HDnBgH+uqXNQKx
 XLni2Mv9lxlCRZ/eHiiHKdcIHZUZoGsQGa7E5QjDCIxTVH8MTuWmOw8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SMMU GDSC doesn't have to be ALWAYS-ON and shouldn't feature the
HW_CTRL flag (it's separate from hw_ctrl_addr).  In addition to that,
it should feature a cxc entry for bimc_smmu_axi_clk and be marked as
votable.

Fix all of these issues.

Fixes: d14b15b5931c ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index d0a5440e2291..4fdc41e7d2a8 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2627,11 +2627,13 @@ static struct gdsc camss_cpp_gdsc = {
 static struct gdsc bimc_smmu_gdsc = {
 	.gdscr = 0xe020,
 	.gds_hw_ctrl = 0xe024,
+	.cxcs = (unsigned int []){ 0xe008 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "bimc_smmu",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | ALWAYS_ON,
+	.flags = VOTABLE,
 };
 
 static struct clk_regmap *mmcc_msm8998_clocks[] = {

-- 
2.41.0

