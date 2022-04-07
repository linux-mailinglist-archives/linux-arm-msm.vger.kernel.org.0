Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F4B4F7AF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 11:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiDGJEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 05:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243607AbiDGJEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 05:04:33 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA471FFF9F
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 02:02:28 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m30so6866959wrb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=USC7C7RCVNx7KuEUt+BY/YKNIMEfhL2JjE70IEcuxEE=;
        b=RG94Ae0RY0Ql8bXpoWaw7oEdKOADumRFMHqZyC8iQGSeS9kOIbxXBGx9jEKZL4+ZnE
         Dw5kxlQPY5pu0NDZ01Y5tOgZXeQOf/bzU5O1b96B0uyRHFv8GouQsMlYIOtojCErkI8X
         3eYdOpp4takmZCE++lSBbtRR549fY3PeDHvTbdEMi3l/22aM+r2YZt9jXtBSvTzg9vKR
         l5MQoYKuMxlE3w5/a8X6aYyH8f1KJu1yIUN4ySD7joybh1a3DbDjbJWxFgZKJzzbOryL
         y8lKxQyhMWVGIRzxGDFwXYkiJs3yn2Eo74Y1OOoIIjMn6tpQbXPKzud3d7l6F+lNqs+A
         nPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=USC7C7RCVNx7KuEUt+BY/YKNIMEfhL2JjE70IEcuxEE=;
        b=qZzhtLyJqHZ3BV9AT2cNy382Q/FscYrjAczWPvbZDikS25QaQvZKZFkYOYnuQ+KwKg
         oiZ6KSixE8pm0BI37KQBx2cqYnw8fs6iWnUHLyaS5w5DM+z4y5vlvcJk8Gsi+aOPEEGp
         mRCMz1f+CZAE4/B4eYSBH/776igRhHT66dt0i49BTMg1+AXU8exrDmVz8/mPIhhk+LM1
         +ceJJXfpsxbs/t/abfJ/pSAKLdRWnIyflGmMRGENk5CoufOlg1bkKcIMa5F6C4aY+hRj
         fauAQhPJkQO5UT9xQijyiGBkse3++r5Gwa58GG6C568km4LsE4JPqV9oqEWNUXY3+Gu2
         lLZg==
X-Gm-Message-State: AOAM532KaA0rRj0/qv6xrjA6OZ2j0cTMg9SfPDUZT+nVwYUzwDpnizgl
        mzSOy2lGLlfQXOZc3HTt4uO+iQ==
X-Google-Smtp-Source: ABdhPJzF7coRnBfWLLqluJRervg9467q13ZsvflHJDge79gXpqC21tQ1cPoa/MFzvvpqmqoXL6xn1w==
X-Received: by 2002:a5d:64eb:0:b0:205:d418:4798 with SMTP id g11-20020a5d64eb000000b00205d4184798mr10078636wri.11.1649322146858;
        Thu, 07 Apr 2022 02:02:26 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c? ([2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c])
        by smtp.googlemail.com with ESMTPSA id f13-20020a05600c4e8d00b0038c949ef0d5sm8640927wmq.8.2022.04.07.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:02:25 -0700 (PDT)
Message-ID: <66db272d-0bc0-8c77-a106-327cd0bd3405@linaro.org>
Date:   Thu, 7 Apr 2022 11:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: qcom-tsens.yaml: add msm8960
 compat string
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2022 02:26, Dmitry Baryshkov wrote:
> Add compatibility string for the thermal sensors on MSM8960/APQ8064
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
