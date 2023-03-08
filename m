Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4056AFE94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 06:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCHFql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 00:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjCHFqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 00:46:40 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFF6A5928
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 21:46:38 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so955585pjz.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 21:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678254397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI1Dr5bu7w3qXi8ffygZPrAEov3EaoxJgB9FdyYzp7A=;
        b=ZEJaWoHYGiqOKzBsXevIwkneM/an8vfZQ59QlX/QuW/lmIXAQi4cRyCppgt5ohzj5C
         +aDH4wsqliQoZwt7Q+b63sd6y8L60NthfJkRSOXqUA4eoKdHB0CUyYQpAGPMgoyhdnWK
         zDFWZwFigzWoforeXWexd1ftbPKyl4DpPUMWS1LYO+1jd4vm6dko9NVnHwfrtaLUeJP9
         3P76U1KE8WfgNnUdXLv1iRKqgBpv7HyGywjEbt6DkMDioSIMfG+IeD52YseOXop6YUUC
         MyScmUfKmtjxReZRW+DZBgICndJZPXNap54pHzeNawuU2Fo9l7hu4XIUClREVhityC2e
         GM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678254397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI1Dr5bu7w3qXi8ffygZPrAEov3EaoxJgB9FdyYzp7A=;
        b=7IV8v4Mw5zg16gF8F357FWx8OFUBb2Vc+ss8muFzyB0NEWE0m6Ppz0JRW/j3VBiM5x
         pwM0q4VyPmJYy9d49KNM90QcjbCnG4kBT8HoZ41offw22lRh2LVpq7FH4Mn2cZwDUykA
         rtWlMFM0X31DbTYE7mszDviNMaDRmcsIJDCBiNU2IgRAIQzSGfYObVE/eHz8to9QOiM4
         ZBtj4/8cTaJM/5jYclK970P+0q/mXqOlwPn8bciLjvqVJs6g/6Cly8CwrHSNFmJH0N31
         kfe5WQBC1zY81/fLXFLXwWv2gxKlmiHyuCZe5sS4TOP6jyq9/nOYTlz/m3tZt10Iv3c2
         bB4g==
X-Gm-Message-State: AO0yUKUx0L3FO5z3mMDlHCsktahYjb6rZ1GUKlAjq6i0cKv5jiwiPBIE
        vFXW3GOGCUPyKkvM5P9keMtU
X-Google-Smtp-Source: AK7set/BZiGIRUUyv15xkHBpun0YO6eT6lgClDW3OiLxmaSV9L/9ENLuw9CD40dhD6+smp5YxOiVKw==
X-Received: by 2002:a17:90b:3a92:b0:237:6d4b:7cb7 with SMTP id om18-20020a17090b3a9200b002376d4b7cb7mr18171866pjb.41.1678254397556;
        Tue, 07 Mar 2023 21:46:37 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090a429100b002369d39672asm8153148pjg.33.2023.03.07.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 21:46:37 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: Mark UFS controller as cache coherent
Date:   Wed,  8 Mar 2023 11:16:30 +0530
Message-Id: <20230308054630.7202-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS controller on SM8550 supports cache coherency, hence add the
"dma-coherent" property to mark it as such.

Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ff4d342c0725..5315e24fa525 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1905,6 +1905,7 @@ ufs_mem_hc: ufs@1d84000 {
 			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x60 0x0>;
+			dma-coherent;
 
 			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
-- 
2.25.1

