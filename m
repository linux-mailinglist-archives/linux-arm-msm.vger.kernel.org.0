Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63F3644A43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 18:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbiLFRYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 12:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiLFRYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 12:24:23 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45AFD107
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 09:24:22 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u12so23530031wrr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkjOSaePaW4cwPgy6cKdaGFLlxgNwbwbhmDlbNQQNyA=;
        b=pv4LiDYE7+vhr0QpgKXN4tARx11ydjiGR6pmv/PBZOummq3valRAL64ufcMh2ZhvKj
         fp+vbWUsAoANZLgwe0ROiC3DBWrUUAlKDaDqBV6bRbzoI0f4CUdfHO4ULR8FnHwfuz+U
         3Fm4d3T3lNaMPJ2Cp44HIhmEHaQNNAyw368ERNcK/IPEMEPzOfSdqYDIhVSeJzYzjxJ8
         1PXBqBA7tb+GRL3a2SVZFpgnnHQbTJA1jOH4IpWnPtmXqDpOYrSuf5PodlZ4tCv7nM3V
         CXHyuVnnLQivwN/zagQDOYLKS0QGISD/Bzz6p7u0THaRR1fqLq79dvsFi7DzHqqdI78X
         hmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkjOSaePaW4cwPgy6cKdaGFLlxgNwbwbhmDlbNQQNyA=;
        b=2XAQ984rvtde3m7UN/82NqF3O0Zj+bmztudfeZHS5qUvNDSY4xlmEI/3pcmMiMo62q
         mvZKcnTF8mtONrKpa5rBUuhfx360mNxw+3oO7/0K1dlRDX6R+4Cuc8U+4n7JxdHnSBki
         TEYSFoa1zSxZABk/F5DniPxRbFpM8eq65u/Xq/z5S/hyqNTYYKNVfPLuHb3zAYIpXrgD
         eXZVvGhklmv07MFEsiu5tIm0etfo4XvERWDolafR95PA7U5bhuaXTHQM3FTkq4jk5TtH
         9OdSc8QpVWRl5mcnF5g2SXUixYl9cy3Jxfrh4/gZSsrLugotm5FPcfiuM/4nFOPXyxP2
         9Qmg==
X-Gm-Message-State: ANoB5pnOHFPYi/+wXvoeNX/RMGRf4YDIgM0uiOb1H/kIZEIV+7fJetXe
        SPm/JAFEXrj5zyNg8CpnaJpwqw==
X-Google-Smtp-Source: AA0mqf7uX5D13d2dZmniVhruFUG6up8wnz4YlxpwhY4ufp1N31TFjORCg9NlqaJoWvsPgHZG0SDxMg==
X-Received: by 2002:adf:e990:0:b0:242:6c62:84ee with SMTP id h16-20020adfe990000000b002426c6284eemr4667192wrm.598.1670347461335;
        Tue, 06 Dec 2022 09:24:21 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm27920686wmq.31.2022.12.06.09.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 09:24:20 -0800 (PST)
Message-ID: <df1f3014-9432-60b9-a29b-3af77858bcff@linaro.org>
Date:   Tue, 6 Dec 2022 18:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Add compatible for
 sm8550
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-tsens-v1-0-0e169822830f@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-tsens-v1-0-0e169822830f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:09, Neil Armstrong wrote:
> The Qualcomm SM8550 platform has three instances of the tsens block,
> add a compatible for these instances.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

