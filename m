Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B587576FB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbiGPPTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbiGPPTU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:20 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DBA1EECB
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso12822039fac.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pZOSkcNfh6QEts/D5ER9Wn7qtlpWbY9jlfuonnCfELE=;
        b=ucizGStdvD0K5tqcAJ9Uk4BwAJwJB8VEZ+WQd6NqWhz3gBUDVLBCsiSEaYwBHlolfM
         6I4acZFaJ6czdDa3zs3jME5gzq8v/yWt0Ppw/eiVC0Fc1PhXmPhGazkSDWVZ0LmeN1IP
         XRvK3bsdAwChBvgm1yik5w6vYT7cegBOKzjzQGAe6tOjpipRxyAZzoH3ElpYvglq6sQz
         BNV1crz9sIlRfs1TW/0NzlYUv2pz6eckgMSsVQ2IRg+df0ter5s5vs52HzPLjcJ4eIoD
         Aaiebi5xCRuufO5mvXhHwsrqQi+LPKMp+VWPmAQvUrW9Aomv4WOrztiUp1XQt7Gc8uyJ
         ZW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZOSkcNfh6QEts/D5ER9Wn7qtlpWbY9jlfuonnCfELE=;
        b=5fJ/RlBDXeDVGALK0Dl70sQZ0Hg8trDQMdvbjJkYKCCvLFp2QVQwjK9eVPJcyEnUy3
         C9zXGmFAxrH0ovFkl6uwkRw9P834vfOxSpDCgf3VQTSJwN6+viI3v94Qq2n08xe8Km5F
         vmdARMPwIQCcNQ0TZiFTxtuUkYmoU0rz54OsLdLg33mAKPacNFCGdDKSJX2n86xSMYmj
         g8vbMVB92VsPFDZDrFR8qepcHoHGWk67IaDz7AOnV88rln4gdUtDUs/0VPDIVcBXeLSb
         mU5u+gVsslgS8D0eoaHPAdqWUpfnsEZ8phhSzoDRfk6j+8xmxuLqb3DEcDq14dy42m2E
         qz5A==
X-Gm-Message-State: AJIora+pvr+DPCmmGu0k9SSY6dvhyhv18Y/VBLtt156rIKTR8ghXV9p7
        LvTdcc0gdicc4wGhRT4Yx8vf81H7bs4oFA==
X-Google-Smtp-Source: AGRyM1v4YlZR+OBx9xoktPZFAA7detM3a3H2PiB+7KpeRGKYRYWTFaWsIfFvv35OTB42iHJwK7f8VQ==
X-Received: by 2002:a05:6870:b4a7:b0:10b:fb83:650c with SMTP id y39-20020a056870b4a700b0010bfb83650cmr10351055oap.27.1657984758609;
        Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm6350: Replace literal rpmpd indices with constants
Date:   Sat, 16 Jul 2022 10:19:01 -0500
Message-Id: <165798474063.1679948.11675191794753328799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507224645.2238421-1-marijn.suijten@somainline.org>
References: <20220507224645.2238421-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 8 May 2022 00:46:45 +0200, Marijn Suijten wrote:
> It seems the SM6350_CX definition was temporarily replaced with its
> literal value 0 in 1797e1c9a95c ("arm64: dts: qcom: sm6350: Add SDHCI1/2
> nodes") to prevent a dependency on the qcom-rpmpd.h header patch being
> available prior to this DT patch being applied, similar to c23f1b77358c
> ("arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX").
> However, unlike the revert of that in the sm6125 tree the next merge
> window around in a90b8adfa2dd ("Revert "arm64: dts: qcom: sm6125: Avoid
> using missing SM6125_VDDCX""), this has not yet happened for sm6350:
> replace them back now that the definitions are definitely available.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Replace literal rpmpd indices with constants
      commit: 7a9016dbc8760c4f8a610e5cb0ae0f815b0cca81

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
