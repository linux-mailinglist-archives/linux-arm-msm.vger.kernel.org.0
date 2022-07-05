Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74E556762B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 20:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiGESIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 14:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiGESIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 14:08:05 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C811E15FD5
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 11:08:04 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l7so14772382ljj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=924SP9sfvPU1dx8dGbTZTUGZTjhuN8RJUEbbG03QnDM=;
        b=dqNap05fL763900ovU57l7XCQPqasl5Su2weztMWwQJiq8gVSeSqwD/YzZJmVVxVV8
         uYgaT181twYvEn2pcqDnvrPPHrdmmWfS9bUDioxJ2BeeA+du6nn22VVdYchdaD8bx82j
         cKMqFzjpkh28mG9X2h7F5NrPZpcRQjL4mR1HTbJjqzWpYbZPHpzj/LO5ahjy2ZXf2XLk
         W+XdxkW3GB9hFTtQErBo24ecz5YRo3m8cxsYag9aMnmRx1sIzy8ddvMCMl63GBPo7XBe
         rJUbgdYaOZNFbDUT+S+1z93YtpReo63hhjt6FuJ2h18rGkGL7WicNmwwa4Wm+MD6JCdo
         YpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=924SP9sfvPU1dx8dGbTZTUGZTjhuN8RJUEbbG03QnDM=;
        b=l9KRsjInCc9JAA3heU4zCOtpGqb/4LBkRA/jKjG7K3wJCZP/A7q8NKFHlkiOmjs5eC
         CVPA4y5pe1+kv6w7jEmUElcspcZCYzuyfEoDh0SxFMcMmZhx9rqycT+DrxLdRwwH/Lsl
         YUe9ENwvMeueBtkNbaCho3SfmTD74F426KWnCHoYdJM9DRI/YXn4+AumjfTDfr3bcVAf
         6Mjabz2iN41/VrIEOZOC1laIFhMRD3SmOh99W4NqWubseVDhzpeuGMD68iIVzQCSYPtn
         djq7X9oAEF6KWmQ24RpAQmy9EUcsS8tPPtPTg1GtNe06hcgiRoHm89ANPc+ciGZiyj6P
         /uOA==
X-Gm-Message-State: AJIora9+jxTy+Tlwelf0/iKm34X3AED7N6gypSiI9fSbOMmzdlr1u53z
        VZG3N0aLQjxaHkeQzow/GZ6hQtKW+c52vg==
X-Google-Smtp-Source: AGRyM1vB0wzDA/TQSLB2Up6+c+hgj08Fweiha6I0CS7jcy2C8AQxuiUia/XGhNE0VlhIhi24TwA0DQ==
X-Received: by 2002:a05:651c:12c5:b0:255:767b:8b80 with SMTP id 5-20020a05651c12c500b00255767b8b80mr21636241lje.321.1657044483182;
        Tue, 05 Jul 2022 11:08:03 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id z9-20020a0565120c0900b004793240041esm5810802lfu.277.2022.07.05.11.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 11:08:02 -0700 (PDT)
Message-ID: <a58ed7b1-f10f-3fb6-1d8c-bd525722164f@linaro.org>
Date:   Tue, 5 Jul 2022 20:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom: smd-rpm: Add MSM8909
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
 <20220705143523.3390944-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705143523.3390944-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 16:35, Stephan Gerhold wrote:
> Document the "qcom,rpm-msm8909" compatible to describe the interface to
> the Resource Power Manager (RPM) on the MSM8909 SoC.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
