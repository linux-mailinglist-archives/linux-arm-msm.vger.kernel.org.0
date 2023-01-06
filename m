Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2C865FF58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 12:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjAFLJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 06:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjAFLJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 06:09:16 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC446E0E1
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 03:09:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w1so958719wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 03:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjAQD38pxiEXgn8SrcGAtQM6DHABHmwwbQFSb0l8uc=;
        b=RkF7ZVQtch6xw67PWA3+/LfX+gMZYZqImylKOVrowoCZttEVOOn2I5sA3tglW1GYmP
         Ql+xzroChCkzI5DvA5bAhUQDLbjyVVVeJBsFij+xt2RAdVaU/JOtZnkGyoHqfMtqpaok
         Xsv0zOerP0ypotJ8i3KicX3BslWi0RcO5fLlqZMnvzZYeTryrcI32e7DV5ymKLFUmRnX
         phZ9apfhp3wF63TgwAkyKqgEiggmr3Iiw6azu+VTxOSqofRIjekvcVRBjX+FoWZQ9vkP
         cj3TKPs4h1pHTUOAQpnGj5ISms4F3N3MpTpAHYHV2HHOPt5TkqDMN6n4buMaC1rqwKuL
         vFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjAQD38pxiEXgn8SrcGAtQM6DHABHmwwbQFSb0l8uc=;
        b=3GbZ21XL5A5fZNzWH7uPVnZW28ZxQoEvnhrqMk44T4gxkrUzEzTKywnO5M55xKep1I
         P5Whnp3NNw0OpCvmGJuTiKTx0B29NTpBKzM1G0gaWx394sufZgNKfWcYU+0VCS8GAXh9
         bqvaxVuSgvIYsPeN5AVToZUv4/mBYyEvfXjECVrg/kJ9asxtSnMIaIPc06MEc4X2M4id
         QnQDRUHlsroCZxZ0URJzutKVdx8wfszGbfYWEu/YFGi7kog33Z6ssj9v39mHq2HY0++6
         IXTNucdqx+z5Fmc4uu/4mbcMPZCzfNOXEXKh9uKshdcsQRnrAoHsiMonu7K92VecFImu
         2YJQ==
X-Gm-Message-State: AFqh2kqoKX4XddChV264MCETZAk2VsxmgJRe21uHIm43fu9G20IMFQSJ
        7l8/4znuI/68ApWIIoTL9tUHRQ==
X-Google-Smtp-Source: AMrXdXv76kJX9rJjgsKE6uWsRKKxpQABEBmxqCWDIbIGUsnUMkvXBkxQ9Pr7SXvbIoECfDhN3N+fTQ==
X-Received: by 2002:a5d:51c9:0:b0:29c:73e2:68f1 with SMTP id n9-20020a5d51c9000000b0029c73e268f1mr9749308wrv.54.1673003353650;
        Fri, 06 Jan 2023 03:09:13 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n5-20020adfe785000000b00281eab50380sm937823wrm.117.2023.01.06.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 03:09:13 -0800 (PST)
Message-ID: <8ba0f169-e820-6e4d-957a-ee6b65a41bf2@linaro.org>
Date:   Fri, 6 Jan 2023 12:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 8/9] dt-bindings: interconnect: qcom: Remove sc7180/sdx55
 ipa compatibles
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
 <20230106073313.1720029-9-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106073313.1720029-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2023 08:33, Dmitry Baryshkov wrote:
> These interconnects are modeled as clks, not interconnects, therefore
> remove the compatibles from the binding as they're unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 3 ---
>  1 file changed, 3 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

