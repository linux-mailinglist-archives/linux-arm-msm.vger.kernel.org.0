Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9ED5F3D60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 09:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJDHiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 03:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiJDHiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 03:38:12 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619A24D248
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 00:38:11 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-333a4a5d495so127682937b3.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OSMuFVsbci918WMEsC7sFXDY5UEKrP97lF7jwpn3ZKY=;
        b=YUpCQLVh/ZbPEIM6MRSoBRL5dBKPIbED6Jc5x3rLs3i0ZeY74CIthfaKS89OvtzUbJ
         evJX0WkzNNEHZKx3NZthh7TCtRjKGZfSCXYj572FYJmnWLCNNPeQeE7e7OMHfDMBQgMH
         iFueADEecwzMszu4qHBUBbfJwnohw3RLekyz+y05PGT8cwVRuNJ9RE/n6ESVgncDkj34
         DQO7u+mzUTZEUzIypv9gUmKkzpMj+idrKkuLP9Z9/oo7YL2mVu2y1liXo7JWBPzSYBmb
         gV9oF+WusRD8KAjKLq5izmywBwapiXXrtq5jWYdQlfQRWuaGUB7LLR2d9yAN1L9IEckJ
         AeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OSMuFVsbci918WMEsC7sFXDY5UEKrP97lF7jwpn3ZKY=;
        b=RM4BFgTa1zOHx5lILhn3FOYVlaZLBediysi+TEb972XGtNAcLM2WaL4rQGGHRMflm5
         9gQVyDP0g62DRbWqSFbcIhT27W+axF0KIB/OL3Y74JNjCqRC+pH8xUmWCpzWvQl2txRi
         cPh6NSvcIbJfjnOvrOhCHo/3zCBRXSdUXBJIMUuIEtjEc2nP3M/6Q/AH6MMdVsAAZH58
         uoKjNu28FNJg0+7KUdfsa8c0VEyq5zsxfyc4FmsSLHLa7E+fKHPnsH1E57DTMa00LA50
         7t3eoqp3gjTL3nGJDZ4e/HFjP2s30FJrKXdAja2ENAbnG/QihWiQxr3fUI/jDM2wx7Mt
         a85A==
X-Gm-Message-State: ACrzQf3mBJBR3IWgjSoXaNQoUDRLjCBIronfGvR9AEbX1TwMYGki26c2
        GA7fC5bKq852CrHqW1/wdofbzskdxQQk+ZSIt3cC7A==
X-Google-Smtp-Source: AMsMyM5j+XEoX2xOKukGTbIUyxbRXejrMOAtr1bbMRrNN55E8u5O5TLP8bVa8lmMZpIgATy9l002URxzu/ufb7quNyI=
X-Received: by 2002:a0d:f685:0:b0:343:bd3d:80b2 with SMTP id
 g127-20020a0df685000000b00343bd3d80b2mr23377204ywf.485.1664869090657; Tue, 04
 Oct 2022 00:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220925112103.148836-1-krzysztof.kozlowski@linaro.org>
 <08E290AD-C842-4BF2-9C57-2CE59A4C5D88@linaro.org> <441153f6-26ee-cbb2-fe42-101de91952c5@linaro.org>
In-Reply-To: <441153f6-26ee-cbb2-fe42-101de91952c5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Oct 2022 10:37:59 +0300
Message-ID: <CAA8EJpouyuCn5Kz-3RgRJPd+K1sWwtidz1L_mXY_U2AFQq8oOg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: restrict drivers per ARM/ARM64
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 25 Sept 2022 at 14:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/09/2022 13:43, Dmitry Baryshkov wrote:
> >
> >
> > On 25 September 2022 14:21:03 GMT+03:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >> There is no point to allow selecting pin-controller drivers for Qualcomm
> >> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
> >> kernel configuration more difficult as many do not remember the Qualcomm
> >> SoCs.  There won't be a single image for ARMv7 and ARMv8/9 SoCs, so no
> >> features/options are lost.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > I haven't checked which restrictions apply to msm8916 at this moment, but it might be worth adding 'depends on ARM || ARM64 || COMPILE_TEST'
>
> This is limited by ARCH_QCOM (top-level if in the file), so I am not
> sure what would be benefits.

I thought that it might be added to represent the fact that this is
not an omission, but a special case which can be used by both 32-bit
and 64-bit archs.

-- 
With best wishes
Dmitry
