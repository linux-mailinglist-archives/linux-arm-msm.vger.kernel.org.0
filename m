Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C4F76318D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 11:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbjGZJSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 05:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233769AbjGZJSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 05:18:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148F35BB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 02:14:27 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992f15c36fcso1090676266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690362865; x=1690967665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBNaL4R2l6hdwWD/142gRI2boOE0YiHyAV9PIcKLPWI=;
        b=xBCZWSbh21eMLQfHBo7UXc3G6P7mjLXqgkKcaEH7tmgFHCRqsjX0Sn90BX0Gi2xsSz
         r2laJNx0jiCRFR7lnNMgbxkjOia9yMBdr7saDdhFBfpLQE5FCfq4EdRziLhS/KU3MtTh
         q5cwT7r7iIoy1iTpiKalgC3NFZXYNkgOp1Bni2XdLX+crgOZElPoxcSKcMqOJml7Z2FC
         kdDTEGtFHNXhYgV3tBaw2EKmhDXP6iL1yTdovjlBSW525O3r+nZylsrfcGpOab9qs6Ke
         yZdhkWpxgzyM7A+biOk9z2pOoSYQ0i8las5mu3gewwQJUmhkYfu9bHN65J08KlDb+R+G
         IeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362865; x=1690967665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBNaL4R2l6hdwWD/142gRI2boOE0YiHyAV9PIcKLPWI=;
        b=hxp/AkTt9QL94jQU19Tc4tB8+h8YGDWyKG9RXSfvdvUr51jk6ZceU4OU627KMXh+0g
         zZ/Lc+O1u20GBaTkORVXnImie0HOPJZsRE1SPjh2SFd8WF8JuyV/gWGQtySqPE6WMJh/
         MxjTbbURFMomM+U8DleFrOE0X6Ki9EXiHxC0tB3nYWcNbP+IX46268yQRykyjQvHoy8k
         47OzZiZOZEYpEb7UsVEwbmxSnnEvjBnZy6vFzS7H6CoVXOuipwlM3Q7MwyJbosGsLbwA
         6iRsGQyWdT5zIlq26wkpu8xY4iCHASXlD1yf2pQd4obglTRvsiq1rMb720XHXpXJ1Rxl
         sFiw==
X-Gm-Message-State: ABy/qLbcPwVT4H7TNRblMILxgL7ac4MTVya3xGoNKW+mxgvZrnCdG/gq
        T9WTkOytYf9Xr2gtlXvlDD5Okg==
X-Google-Smtp-Source: APBJJlENHS1zX4Rvh36zpRv8rVcGgK91e8CGUWJyXMRNxPf0sEuzwMhIO9VfThOGQJHa3oTVDJpKAQ==
X-Received: by 2002:a17:906:cb:b0:99b:b2fb:27b3 with SMTP id 11-20020a17090600cb00b0099bb2fb27b3mr1341837eji.41.1690362865041;
        Wed, 26 Jul 2023 02:14:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm9384492ejb.84.2023.07.26.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:14:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 2/3] pinctrl: qcom: Introduce SM6115 LPI pinctrl driver
Date:   Wed, 26 Jul 2023 11:14:15 +0200
Message-Id: <169036285578.127914.3038916520706013414.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722-topic-6115_lpasstlmm-v2-2-d4883831a858@linaro.org>
References: <20230722-topic-6115_lpasstlmm-v2-0-d4883831a858@linaro.org> <20230722-topic-6115_lpasstlmm-v2-2-d4883831a858@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 24 Jul 2023 13:39:57 +0200, Konrad Dybcio wrote:
> Add support for the pin controller block on SM6115's Low Power Island.
> 
> 

Applied, thanks!

[2/3] pinctrl: qcom: Introduce SM6115 LPI pinctrl driver
      https://git.kernel.org/krzk/linux-dt/c/63f7c8445ffe6667ac4cc9720ca36ad7d407709f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
