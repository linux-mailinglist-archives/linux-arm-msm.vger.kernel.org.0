Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0075EE2B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234571AbiI1RND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbiI1RMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:12:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C46EEEA4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:12:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k10so21364298lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5kRE4HIl4yd6yot9Qh7CT0RKBxSrc6Cx0jn4OI8AxWM=;
        b=Zi1kzUu+ibmRth2YxgcBFjTjBcnGQF4hegED+CR2BWpD3uV4PXQ+/Ic+AbO0YKqLtY
         j5cbzCQjTeoAtbqMQIgPJ4NPJhk40VaVTO1fPU6/fM5HWvj51hqdfhCKbddf38RfZGe4
         vLv5znO9YUbF8ZeUTy7e6D2AZY+KtOpE+mIb2rIjGF7EKeST/3D7BdDCgKflMntud4vE
         +J02S6QlWMhRAKrDbyZjfxNpQ/USCmMbJc9A3yVJI8zvQrbHDtuNu66HtdN8YVJGCvMG
         io6L2mdEZJgIIekxOfAfApR4kMgRi7vbTwiENDou0bMrBhFENaht5v1XFe1QqNB6SA1p
         KYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5kRE4HIl4yd6yot9Qh7CT0RKBxSrc6Cx0jn4OI8AxWM=;
        b=wS49MWWwcaXQDqgSN1TotXa+LtYx+Yr8TeC/TdNLX56NvgkJ1UpaT75Jvm9ZTJo7EF
         i8/d/cInypZ/L8NNBINz0IEqDAECieEb5sOve6gZCiM7+QB6uvmsVRKjVdKTmLXwJ4Cb
         KDJXiZ/1g9eahA9FbGxuwePnHDLiuc4jahS6jwViaY9/gZPZjv4sCmZHKgTd71bDSRXW
         n/a5HQHZmSBOLpI/9FUh3FKJOVTBYU8eSSWBcx1ITrgpoGdYX8/R3N2DmgSVBDTnB48y
         226cu/1D47ninvE/Qf77KhKjG6Df0FYAKaT/vBla2wQdjKmUEq1oGHE/1lmrq0+qVDy0
         tEgw==
X-Gm-Message-State: ACrzQf3+gGvbtmbagjywlQc7n2QOpDx6NpeFvMqxtYKHaoKWOF2wJCPZ
        I04lAx3AKnVGoAWzIPR9jJXHNQ==
X-Google-Smtp-Source: AMsMyM5ZQ3mZirTPCfjxx2g8etOmmzLUOJNAkr9WrQMRnF90WGq+P2T4AB6GjsYEg6J4n4dCjH2OuA==
X-Received: by 2002:a05:6512:32c7:b0:49f:53f2:a51a with SMTP id f7-20020a05651232c700b0049f53f2a51amr15234758lfg.236.1664385145257;
        Wed, 28 Sep 2022 10:12:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o22-20020ac25e36000000b004946c99e78asm521688lfg.277.2022.09.28.10.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:12:24 -0700 (PDT)
Message-ID: <b04d42c1-1ce5-702a-3153-ab5d2179870c@linaro.org>
Date:   Wed, 28 Sep 2022 19:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 02/11] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8974 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

