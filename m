Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9565B185D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiIHJUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbiIHJUN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:20:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B996EF2E
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:20:02 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l12so10697475ljg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
        b=eVOLIW0jxAzVmlkmIbnvK2aSkpKg/2XmlleU+EkV3uBV5z3psBN00RQs0ccy2YDjO9
         DmpQInSSQOFdxywzsACE9UvcsQDnOtNbOy7iqGVwxNDpJs5jQ9g/IWz9QAu2Fh844h1P
         6TVHS2MRkMZOazSS7dcjj/h13R3Ug3g6N0pzGQdPfxKU8oxC6p0GEkFr2b4bFFwBeyLi
         BjzAKSlnvvqqBLWP7D08JIKtxEfvoqNqQsdwIn2KFseKddVSgvpdhxntUxjDPcBUpLnD
         RqauW4GBdfCI37nToJHaxMeyztxZUfdGw/5lNiQg1ICkn3PYclKQJQpp3H6C1ZqtuyO7
         euKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
        b=zsUpxdm+lOM9BNGfPlp8hcqH0OK3KzJAX5Q9Yh6ideR0aJP7x4r4LT+yLfJ/AB35NK
         WfNy83dk33DRZacWUf93AZYDKMQ+D+Kuhwb02SUEwXmDYdxYpEmnoDUs0Dxs48yLDJrK
         +f0LisCikjGltIGkLK672/WMK47v/cP7YUB/fmFlSxyT+Hcuz8jxMO2Q+W7MlhWL8K8w
         7UTeKSCKnxNQBck34Y4XMXQ8wVGpMksFowC2ZY7ftYL9Yx95D9meKRXQbcmvXllb6t3W
         1fCdvfpVCx1TDTcSIWkU+wkkmXZ9iIJLXGrWjC5NQmEHzU6dKdA+7avD0pH0FrhESqAe
         wyEw==
X-Gm-Message-State: ACgBeo27BqEJhmZ1Dt9T097ja3a9ZVNHjpzQjsFu/ZFyYwU/KPVGw+OV
        HnadPGd63rT5TRn6MXsMM3o4iA==
X-Google-Smtp-Source: AA6agR7SvoJrTW/AcLEkiVmjJFApQ/aR06fIu8LCosGVJ2W7ZDnn9+22+z9f0tPqXWGQugKKZfm3Pw==
X-Received: by 2002:a2e:a790:0:b0:25e:cb61:c1a with SMTP id c16-20020a2ea790000000b0025ecb610c1amr2108771ljf.177.1662628800642;
        Thu, 08 Sep 2022 02:20:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 02:20:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/14] arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
Date:   Thu,  8 Sep 2022 11:19:40 +0200
Message-Id: <20220908091946.44800-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The node names should be generic according to Devicetree specification,
so use "clock-controller" instead of "cc".  The bindings so far did not
define this name (as child of APR service).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 84b4b8e40e7f..6ee8b3b4082c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4799,7 +4799,7 @@ q6afedai: dais {
 							#sound-dai-cells = <1>;
 						};
 
-						q6afecc: cc {
+						q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
-- 
2.34.1

