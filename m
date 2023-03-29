Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A426CD496
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 10:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjC2IaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 04:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjC2IaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 04:30:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33FD2D55
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:30:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s20so15248278ljp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EcWROde/fSgB7fPEne2rQ8lUn+CutePNUDujtYA7t0=;
        b=gL+HFX+UhfxR+hU55ZY21NJKH/JpKaqPvyepmPKZTsgNgUk665G+FybMJpJ7b2UsYU
         73hEhQOcimb5SzcSUzVLxA2u9Gf/6m+M6cVvbtNLv4gVPEBLZjxMytOvnIY2jwtWh1dv
         Io0teIfK6CnYj033dYLkwjrrdOmj+e4LxvzC94FM+zEU7IQGQ4apAOrYMQ/hdYy3ZEoY
         KeKCrqKSNyfPsI+5/GC+u4NqwT6a6fqnkbhK1UhhqqaQZsWuJpVvj9FrBAqH7pL6LTy/
         mIt8vXuccLZLCbdRRnlZgQvWeSRxQPKvAmXU5LbqBBFOnNciY2/z3Cw5c1o1QeKJCufn
         mxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EcWROde/fSgB7fPEne2rQ8lUn+CutePNUDujtYA7t0=;
        b=Ip1uw5kOtNG8hoO6pZG8V8NzOvZ5jfOT1S+eZbcOuF1xWseAR9jjyz5VGd7Ph/IWS2
         GLAdXQPI1rbmnJvYEru61nGTSTysPXWwphS4qCj1J5xNiXabnY0S5QtvyyFumhvXmUFL
         K8Dsi70gV41KmiIJa9pngyXxZgyRtX5aWkwwD1B8Q5xbx9edaIEA0qw7aoymX5/CbPun
         Ff/fXgKYObx3vHLvMjLEah5ll2aPprImWb+os4rBf5YA28VN0wJ24gbvqqKGN3sqLi+Z
         Gvb7yFf47etnIbeay92E5YNB7BIbUlN7sUa65wuihLXVjI8YkMGdEcI/KIoE8nALE7Zv
         BcQA==
X-Gm-Message-State: AAQBX9d38mVFmhYQfKAlSEFDeGu0jupC9/KDh6X5TFJY5xuV8Y3L2R+0
        6WiAfZLb7iWRw2a2+EOoTkmoPw==
X-Google-Smtp-Source: AKy350bWalFraWgsfObpbZdx1IhK3P7b5bpTIysDLckqLJGKrj+nH2qcQbBQfYQI+c7C4OLAM80NWA==
X-Received: by 2002:a05:651c:213:b0:298:6a47:bec6 with SMTP id y19-20020a05651c021300b002986a47bec6mr6274246ljn.35.1680078603212;
        Wed, 29 Mar 2023 01:30:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c1-20020a2e6801000000b002a421ac8629sm2005273lja.49.2023.03.29.01.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:30:02 -0700 (PDT)
Message-ID: <cb058c66-7a66-0c3e-4f76-a24b3ecd1767@linaro.org>
Date:   Wed, 29 Mar 2023 10:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: describe the GPUCC clock
 for SA8775P
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20230328193632.226095-1-brgl@bgdev.pl>
 <20230328193632.226095-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328193632.226095-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2023 21:36, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add bindings for the Qualcomm Graphics Clock control module present on
> sa8775p platforms.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>

Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
commit msg. There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under the
--- separator.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

