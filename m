Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F6362F100
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 10:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241106AbiKRJVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 04:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241880AbiKRJVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 04:21:39 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2033A478
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:21:37 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so829287wmc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6/kM6KP+SnBs5M0JuT/vYW786ouIvPBbX7I3EVelKY=;
        b=i9DT/eD2K77yPUZzee+4HC6ansijp0KuuccSv+lEc4Doo0eJc6sTzRXQhudFqNvZ+G
         WGY0QTxykHtNRlwHh/IoiWqWzs+jTNxHBwtLtF9hxKfTroOj9RwAhn8pz4AG4dOfsBaq
         BLCKuPwLfal9aPsdx4JKvFqWNR36xWF/LZrDjzDcO3mxdGUbRST1iAwiRMdmN2aFRgMF
         JtZX0tE9hNl2fmipv/UNXSRLWAzYI81U3rpUOS77ZKrW3uz480vlx7ucaOEXbi2jbwQq
         73wJcwO3A6/wdY0uapguzvNy7niinRA1hMeLMJ0gnBHR03P7guZjW/eO/R2n49VgMyOs
         As7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6/kM6KP+SnBs5M0JuT/vYW786ouIvPBbX7I3EVelKY=;
        b=6q13PjQawi0T22kJUhnLJHoL5YZcxhBmDD1VUg3p005UJb6RhYfKyv0DEw/8cW8CJ+
         +jcjombzst3FrfA3J+Qa00eJrZcK7Vs2N1hHxJfVanCpFKId+hEiGEiB4PPKTDFvGWq+
         8iOJ5cVwfTXcejcZPSJIwSTShLXgtn1ucdlnslTz1OViMwzs0wzRbnIMpH0OseZJHG1x
         7D51oFCMursKFRNthVgjQlOQnf1WgVPYPk7Kk4cqAISmODX6KnGYlnkgL/2IT0Ol6qbv
         a/APIFh1fSwh6c2vmPCnYjVq+OjHN0ZDDPZ2LpLg8KtLPP52JNrjpVWdLQYh4Z2Ei7hp
         v4/w==
X-Gm-Message-State: ANoB5pmVOZ23pVrUtCNMYRQQaDAsAr/6VU1fk2ADomomnqf1pFHmVPrL
        3ByrQTu4wCpsRYA6zgbehpFANg==
X-Google-Smtp-Source: AA0mqf43KTq+HCm+j8RvGz2WAgU75ljkntP/K45HcsptU3hV48ubtmG5WgFylKoJZCB7PzWN4UFkag==
X-Received: by 2002:a7b:c4d8:0:b0:3cf:b0ed:de9d with SMTP id g24-20020a7bc4d8000000b003cfb0edde9dmr7493708wmk.188.1668763296369;
        Fri, 18 Nov 2022 01:21:36 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bc8cc000000b003c64c186206sm3738421wml.16.2022.11.18.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:21:35 -0800 (PST)
Date:   Fri, 18 Nov 2022 11:21:34 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss: Add compatible for SM8550
Message-ID: <Y3dOntoHWWhKIdPA@linaro.org>
References: <20221116113128.2655441-1-abel.vesa@linaro.org>
 <adc327c7-9e99-4f2d-9641-2981b380ee47@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adc327c7-9e99-4f2d-9641-2981b380ee47@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-11-16 12:43:26, Krzysztof Kozlowski wrote:
> On 16/11/2022 12:31, Abel Vesa wrote:
> > Document the compatible for SM8550.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Why this is not part of other SoC patches? I just received many single
> patches for this SM8550 topic. All these should be set of few series,
> not 10 or more...

Fair point. Will do that next iteration then.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,
Abel

> 
> Best regards,
> Krzysztof
> 
