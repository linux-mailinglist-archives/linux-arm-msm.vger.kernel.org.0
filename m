Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB056443D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbiGCD6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiGCD53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:29 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C045CB4A1
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:21 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be7325c29so1566145fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4gJephEWpQo2YAYUe5ZemM5pyNL41Styy55VtkH8kZQ=;
        b=uKPUcNC2VjWhkAbFI/l7B5zRX2aW/+RtRrEezv3FRnK8jN2/x+Kkmh3HakX4UUJ6hq
         1H8x3dPuLxM229iYHaG7lsD3yBjgiZ5wnD9QDtn5zOD9pFXzGI5Gek3AGcIPNelDy3N5
         GT3V3Z7mrYgHhIgNvwaHnexCrEkZNZ2sV56SfxgZ2h5yiHoTP8oGk1V8qVxQMbirNfDQ
         U2ysTJNRIYwnBB9ZgJIY0bqE8SYrhLY/yhujZXtPu0CIAspBk1S9+Hhrr5PmICrEro2m
         hF/UxsEfLerczVoNbj7lsIKL31yAyt8nzt9O4EpGmo/YA56wOjjv5xH2XKaWUM+mOVc4
         hJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4gJephEWpQo2YAYUe5ZemM5pyNL41Styy55VtkH8kZQ=;
        b=qXue9fc19mqQvrZ2Qw2rBEIrfeMU9qn9ZCRWv0nH6H84H0rnuI3s+s8w0tDhxUf4Iv
         2buh3vcW3/motDL46/Xc2Qqp0e9fcmkB2NW83oHEcXjw5iyYzi7TeEoaCafOZbqI3rda
         t1zkl+B74jguDHtfBTFT9JZ+sBFbFGjkrTlXMJ2B6Z9W2UKR3UrbcxBxDvGBSS/lUKpA
         VoG1iapIXD4/EsIq/u+IMl38PSDjOMqE+UV6Zj4sgEGQSg4gtt6y9fCYt5q7K+bwvtXC
         Xl0+qq5ex9XTzGvxMUHlk0sL/PKUNeiB2BToBiVBdCZryeRKfe8/oATdztTEBjfJ00Ra
         3jYg==
X-Gm-Message-State: AJIora81U1IwGqXXflipKCM1GWplRBI3wIMx9YYt8XiT0oBx9Is29zeE
        SKGcq0NcziaTTWLbWvbEJPW4Bw==
X-Google-Smtp-Source: AGRyM1vw+rNI39bqyDfMI9VZmZqU3zf78r2zUwCJdmgIsk75UphAWfvQK/hrtIP4vglf1yXTy+vISw==
X-Received: by 2002:a05:6870:c698:b0:101:fbdc:d044 with SMTP id cv24-20020a056870c69800b00101fbdcd044mr13724429oab.269.1656820641093;
        Sat, 02 Jul 2022 20:57:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Brian Masney <masneyb@onstation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 01/14] dt-bindings: sram: qcom,ocmem: cleanup example coding style
Date:   Sat,  2 Jul 2022 22:56:17 -0500
Message-Id: <165682055971.445910.7675838409702902328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
References: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 7 Jun 2022 19:18:35 +0200, Krzysztof Kozlowski wrote:
> Fix the indentation in the OCMEM example and use generic node name -
> sram - to reflect the type of the device.
> 
> 

Applied, thanks!

[08/14] arm64: dts: qcom: use generic sram as name for imem and ocmem nodes
        commit: bed0855657afebbcdd9d8a29546c550848452cf1
[09/14] arm64: dts: qcom: qcs404: add dedicated IMEM and syscon compatibles
        commit: b2b86a2d89c26de048e44d3be439d9b2b1cb7ce5
[10/14] arm64: dts: qcom: sc7180: add dedicated IMEM and syscon compatibles
        commit: c220f33e03a0cc4136ef205513b2266faf025e2e
[11/14] arm64: dts: qcom: sc7280: add simple-mfd to IMEM
        commit: 2ffe4f99cbdd0639fc9a1254d39abd7b9dbe075e
[12/14] arm64: dts: qcom: sdm630: add dedicated IMEM and syscon compatibles
        commit: 616ab047bec7c47d881751bc537d3d6f6ae0c6d0
[13/14] arm64: dts: qcom: sdm845: add dedicated IMEM and syscon compatibles
        commit: 7cc60f6c09f49f0d8f8fa3083e7ff4fddec39ec0
[14/14] arm64: dts: qcom: msm8994: add required ranges to OCMEM
        commit: 07f3c7a11dadbead580b6d6e7d86bcc87119fe74

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
