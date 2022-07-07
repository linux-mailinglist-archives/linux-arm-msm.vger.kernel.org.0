Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A11569815
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiGGCb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbiGGCbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:43 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53F52F64B
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:41 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c0119dd16so12676406fac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lMUJhKO89u0bEYdwv708x6FRjBuFDPClx2vt9C6ftyQ=;
        b=AXdnyDKRdWBJ8HLmERnGQQcAuvWwNkuFpLIRyW9jdHiqXs2F3R22dB7sGRl3Oj7ZXF
         b/PSwtiEIR3T+eCJxQY0G2C6ENd6x/vJzmIo6Z8QORyJNsB9tNxz5U3wYg67B4hYeeWz
         t43j7bcp7d5N4WNwQUtkHX3HYnOGaoykIhjesi7BHnhFB/ULDsBMR0mNI4uG6QQxOuzL
         /ZMkscV5RG3MsG6gLiEljhI6TyrRAnYDjmF8Ju5IG0oJVS7Cz7v1jmxw2lCKo0jZISTr
         CfT/oI1IHtdG/400aeHNwYDPrOdLmR4ubFSxzGWjCvU8i8i2TPRNF9FhO7JyMa/HSUMI
         KA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMUJhKO89u0bEYdwv708x6FRjBuFDPClx2vt9C6ftyQ=;
        b=bXGibd779I0dYdV9Kmjx4uzi7uLEFTT6PbtpESAF3cpq4o6h2V1FnAKNghds/H41W9
         Dvdx5DdD18k3L3FdOe1bIDppyVz/3XjUkqtNYzaA8QhExrZTk5j3Dp/Z5PtCiyANBowX
         JPJhzgr9sTeCzasJM0G9PO4lHrkGlVcw2Ic5OAtbXaAJCuVxnYPXUWBByiwtH6HdXXHg
         mNf4xQxJJJqEwy8JuLbWg6Hbue+Fr/Q4HB8xw9hxcfRzofrDg0O3YWypP6khjFfuThfz
         CLCEPYu0pYci4PyM0rs+6NEo+6mSsAu4bubiYnqOkEuYx5vlP0hPZD1uNLnGzh2ZjkC8
         BFaQ==
X-Gm-Message-State: AJIora90frHUL+06ewcsXXiXLVA4GrBuH2cDic6cHh/as4cXeyrgVpBT
        5Mkw0gSTB7lc+sMJkfelS05i23oyyj+dLA==
X-Google-Smtp-Source: AGRyM1t2/ufCsHlIzpPLiSl6dF9mKf9yxlJaTNfwUeqjfBG61nASkF/gwlTEXKt4KqtzGYNu5YxiUA==
X-Received: by 2002:a05:6870:2490:b0:101:d94b:c9fd with SMTP id s16-20020a056870249000b00101d94bc9fdmr1168616oaq.73.1657161101255;
        Wed, 06 Jul 2022 19:31:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org, jonathan@marek.ca,
        mturquette@baylibre.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robh+dt@kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH v8 5/5] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Wed,  6 Jul 2022 21:31:18 -0500
Message-Id: <165716107314.864223.14143394880939195764.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706154337.2026269-6-robert.foss@linaro.org>
References: <20220706154337.2026269-1-robert.foss@linaro.org> <20220706154337.2026269-6-robert.foss@linaro.org>
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

On Wed, 6 Jul 2022 17:43:37 +0200, Robert Foss wrote:
> Add the dispcc clock-controller DT node for sm8350.
> 
> 

Applied, thanks!

[5/5] arm64: dts: qcom: sm8350: Add DISPCC node
      commit: 9fd4887cdec6395a4ff447af8988bce61b707fb0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
