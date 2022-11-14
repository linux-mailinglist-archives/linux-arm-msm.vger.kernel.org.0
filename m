Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6B5627B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236178AbiKNK7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbiKNK7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:59:24 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9242E1C10D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:23 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id v27so16734551eda.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFo6xyXzYm1Z62iYsNaJ8ArmDJI5GLoTpJMyLcKsERg=;
        b=Ri+2vTNDvigT+aG4H1KgN64EAR0ptZzMaKxGsKFn2h3BI+WhllUqRbpLVsu0Q63Aeg
         S7EVSsYBGL49Q7AxLfsID4aHPXnP99HwgncT1REK3RkpVhhLsHVoiCjc5xgowFgAGogK
         Zmy6GEd9Z5/eQ3lg5ZnvocewVT5tT9+F/jcU8wQzcB48uUCIPsOnCobdu0Ue1I2Yx7BO
         vRTDybPzGN5q2NIMI8x09xLHVh+kOtRmg6407ZHB+Xmm5zGzoHZWdq/fD8nLXxyOzH1u
         sMEGfmnZMEHC6JU8BFnli7cfsEq6jInacSujBjDdI/YcqllwWnSnuijXQDkK8sEhX0JP
         YC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFo6xyXzYm1Z62iYsNaJ8ArmDJI5GLoTpJMyLcKsERg=;
        b=SSy2DKz7wl1XLiCMWNgi/kcs8bifn6TBc+Alxv1fX2ZPXaJpySm1DO3wrPWhIzzh4/
         Zt/jcpI8tgvBV69GgP8ASe6S4p4gg6VR38/t2Q0RGnNy/JByWQNGl7Ga665G2wW/7/A5
         ajbzOHV0SZrQIAgHgtC2zOgoJ6ncemV091oNf0IRSutq0aqZaoMF6r/zFNEMMSHvFIiI
         SnBVUo75nh8DnQDu1CuGBihlDsI6pzCMd/B90q4Ukd47wIj8PmxgC636ie2yfXSrLK7y
         a87wzMz3DdjiiDvjsbDu6Nx5Dq4zd8R50qPPv9fswWAoZMiYyjWG5nKuddJjEbTndWNO
         tP5w==
X-Gm-Message-State: ANoB5pkXi1ZadMCiELY7LYuKlzzWWpLhbPqBjI3RK8NizJhOCEI+e2uz
        OU22nzwLnDf8cHuUV4xjq19wdMdtTzKq1Kv9
X-Google-Smtp-Source: AA0mqf6za7PwKHKcOt/pIA+1hyeMx2bNfUHGvPuTJWzcb6vQNP6IgLO1nnfTmEpzmis4oRIH3v6BrA==
X-Received: by 2002:a05:6402:17d0:b0:458:d064:a8c2 with SMTP id s16-20020a05640217d000b00458d064a8c2mr10642182edy.346.1668423561949;
        Mon, 14 Nov 2022 02:59:21 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906210900b007a4e02e32ffsm4036308ejt.60.2022.11.14.02.59.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:59:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm6375-pdx225: Enable ADSP & CDSP
Date:   Mon, 14 Nov 2022 11:59:13 +0100
Message-Id: <20221114105913.37044-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114105913.37044-1-konrad.dybcio@linaro.org>
References: <20221114105913.37044-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the newly added remote processors and assign them a firmware
path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 4741b9120aa2..25b0c5a33c74 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -123,6 +123,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/Sony/murray/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/Sony/murray/cdsp.mbn";
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
-- 
2.38.1

