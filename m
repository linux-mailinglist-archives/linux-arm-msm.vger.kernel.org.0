Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897B8574967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbiGNJpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238407AbiGNJpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:45:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D26312740
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:45:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bf9so1853887lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U7bE4AFFaqlBpYGWGp2bDcGNToCNNNh+R2dU+aim+1I=;
        b=aAacLcEaAKm5bx3USPkdVVrwv0zguEu8rs1lY5F6lNOeMAWK+8D/A9m4WBr/44c1XH
         LjpTQrqg2GOuzh62iX8vVHYvrvM1BmWkK0TdoeVHMYGqu7iNBK9Pb2WlWt2yiiW55k7O
         a1Uewv3Eh3QXfplrqJHwnIuip7m5R6MSqvAol32na8mvx6P5EFZjqtYZI27p/kvwznqU
         hFCVjuNsjXUEC8J4Oz2Br3ZlaUgC47Cmx086b+Cinv7CqI2/LLhOBboXUA1tbSATjM0q
         iRvtW5lwOF31ZgAmE0CDH0K6oNH0tLR1IJyD/s/wWqaUMm1KTImvgYg5uALvwAQ1+2Oz
         3/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U7bE4AFFaqlBpYGWGp2bDcGNToCNNNh+R2dU+aim+1I=;
        b=53nMrhmpN5/tJJgCx8C/2QuEButSQDvgJOE8+bRTmt9BdhYg1ARLWIBKzF6QP+EHa1
         nkMJOPe9L6yibS5NvsaKJGjvbLTCLNpHC11xIDr0AUeVHpz8M5OFTNIbu+eF0Jr80cki
         n6h+RBukb0f8GMbPr9ZomqPvqj42eHkZdsL/hFg7+FAWC++yt2biwTWQMhr4+MYL4v2+
         68+Ef2C/lGqibE2vCkAlBfB2PbTW3VggzaJOz6G8wNrnIf1/4VijUMAAirVlex1avDTw
         Aj8KXEJTF7cgH8CFmypWg2E0lQfl7oPY7YOqjtvRUYrL40U6hHQj/F12LUdIDBT94Jk1
         cMBA==
X-Gm-Message-State: AJIora9D3Bdw3M3mUgQ2j3cQD1qgma+X8F39uBNmm3MJFVgLotIWckAU
        F/rUYWQo1hBYclz6RQAFZ5TRVQ==
X-Google-Smtp-Source: AGRyM1vGpON0DG4ORvaWqjTmXe+q+KTMeS1n2R2I9F705IDWK+oapuyCfjSrtWQhaNSEqjPpmb36Ug==
X-Received: by 2002:a05:6512:139a:b0:48a:1a73:8adc with SMTP id p26-20020a056512139a00b0048a1a738adcmr757796lfa.226.1657791929867;
        Thu, 14 Jul 2022 02:45:29 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 10-20020a05651c008a00b0025d2d495dc6sm185480ljq.66.2022.07.14.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:45:29 -0700 (PDT)
Message-ID: <4936df27-e5b5-8ef5-5831-82fdf414ea90@linaro.org>
Date:   Thu, 14 Jul 2022 11:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: msm8916: Drop MSS fallback
 compatible
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> MSM8916 was originally using the "qcom,q6v5-pil" compatible for the
> MSS remoteproc. Later it was decided to use SoC-specific compatibles
> instead, so "qcom,msm8916-mss-pil" is now the preferred compatible.
> 
> Commit 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific
> compatibles to SCM/MSS") updated the MSM8916 device tree to make use of
> the new compatible but still kept the old "qcom,q6v5-pil" as fallback.
> 
> This is inconsistent with other SoCs and conflicts with the description
> in the binding documentation (which says that only one compatible should
> be present). Also, it has no functional advantage since older kernels
> could not handle this DT anyway (e.g. "power-domains" in the MSS node is
> only supported by kernels that also support "qcom,msm8916-mss-pil").
> 
> Make this consistent with other SoCs by using only the
> "qcom,msm8916-mss-pil" compatible.
> 
> Fixes: 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
