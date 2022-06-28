Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1FA55C368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241441AbiF1A3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 20:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiF1A3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 20:29:07 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D790C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so2604819wmb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fOncqFOL4cD/VqA7SHbK/ZWzLlcJK+/jxUQrf4ImoVY=;
        b=jUicXQ60nek8n1EEGGxuKrtitiKBRfagX/FCmNl3UYrk3zH+/ILkjVYOAXX5iqkkc8
         eSVppRQOId2GpSFDlsJs6XLTU+w1mOeJvLJWldL6PWaK1oMwQ1WjfwEOSV4NueK31e/Q
         RXOQ+h+6Xf9cxcNOjx+PbpLybB03ItEhYSiY8FufoiW5sTNUe1fm2xXoiC9uAoN46pFa
         Kn0pEevsQZ3HucUWv6aCu7p1KR4xUMKQbslflginRbIWB0nEvohd45YRCLJnlrTOu7Zp
         RwOSL0gaK3jpk+Dn+WAcKoeopnD1gvy/9qBY/oYfaROsjnM4JIRg6h/bxE+2VjmPipy3
         iEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fOncqFOL4cD/VqA7SHbK/ZWzLlcJK+/jxUQrf4ImoVY=;
        b=60+tzSdCGpTltMv9jNZZlsckMCVvp8FuOfhBaNPHoZS9piZRqU9MOwdIPJfpxx/n3h
         i+QOKtE5Miqe1MjmgeT1V1qqXEWCOedFziDDvBA4NeDrLmdvdGWSsP7VhMvEKppj94Yh
         mIjAWklNZ0oklbR0DdhTjK0+jGwGnAQ2DhA7TOcxL7tiP1hKn8isE0UJ+RDbiI1pq2Rt
         ynZvne0MR9BREdn49nyAswIe3OW81BKAFmULurZUTBqgkhErrI3tNBj8+XXZi3VUm3+l
         Po8fAv5u8z3jqXplYYsGgwtS851pI8bCLzjokyZfGat6rLgk88s9gc33XlhW3+f2VVC0
         3hzg==
X-Gm-Message-State: AJIora8tI0UqsGjlsOpmWjMOWMbE0dBB4+DwFvbOgVAJO2Rj9iz43CNT
        GI6KK4AAiFyq8HOY8zzeZ8BjYA==
X-Google-Smtp-Source: AGRyM1tShn9JTmkar8VZPVp7ofhESWrbGuYNgwiUOu6137frSg1MIFQb5WD7Mc8deWfRoNsYXJ8/Og==
X-Received: by 2002:a7b:c24c:0:b0:3a0:4d4c:dc96 with SMTP id b12-20020a7bc24c000000b003a04d4cdc96mr5633580wmj.111.1656376144796;
        Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date:   Tue, 28 Jun 2022 01:28:58 +0100
Message-Id: <20220628002858.2638442-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 05472510e29d5..a101b2871d5f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1422,7 +1422,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.36.1

