Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235934737A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 23:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240469AbhLMWgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 17:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240372AbhLMWf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 17:35:59 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8759C061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:35:58 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id q72so20748367iod.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=g56lY2uZHfW8VuQb8w+7vuXp1OUfSK44r08Ap3amQlI=;
        b=XtPPRXIBsShqS0QNIdOKkK7eoeW0R/M0Bb/Zd7YLdbXp4DIUpqZ3sDLinT6XzbdMnO
         j38b+MEYzQCxmIT/0GmMlwa0mb5cM4m1oESIN3D8iRX5CxhLLvTx22NFuAm1Ye5tyQq6
         HY3OFV/1bJEGfd6vZzcdejo3+lLnnCZ1FYUC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g56lY2uZHfW8VuQb8w+7vuXp1OUfSK44r08Ap3amQlI=;
        b=S1qLTB7s9mp02k/iuq7CAJpfJzhYdqTQhjj6y6lDl6OvHcLPAwk0OzuwNWAejEeLZv
         GGtxDcCCLyuomXwfC/WUJ9IN97MTz9iC4RbtRId2d4L3IBLcf5jzl+tfNEiSdeU0Hv45
         uR0T+lGUT5rUPUIiY3ddpHWaV1/vIWmTQJIvL64yQIlQFi9ooOq5TxKJOvZ3FV3r8sml
         omJBRL51UwzK1EDdQa1YuwMU9xGsvwhGTzCYb+TCGl9DaDJG0/fwnfaUnXr2K3wbbibM
         ViG99Qi9Hb0Rkw0Cy1DjsfkFvpZobf4lltSJBuTyMBOES/S4opnsHxfPqZd347ybTrj/
         fwMw==
X-Gm-Message-State: AOAM532bY3Om79ofq1URcFuT0YIljrj4rFPOPy/OHe78FxSM3lNz7rqe
        +a+bknHSnmr96St9cBipErQQbA==
X-Google-Smtp-Source: ABdhPJzqPTbNv/Y0INIGTu2ApU1UUda2oXCk6Y9BzHyhtuxNTFNX7LW0gOeGKHGi85PMOaN1Fgo6/w==
X-Received: by 2002:a5d:8999:: with SMTP id m25mr1049672iol.185.1639434958287;
        Mon, 13 Dec 2021 14:35:58 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-2faa6b4da11sm107913173.27.2021.12.13.14.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 14:35:57 -0800 (PST)
Message-ID: <d476ec49-6bb5-de44-11f6-e4e0881acaae@ieee.org>
Date:   Mon, 13 Dec 2021 16:35:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH V6 1/7] dt-bindings: Added the yaml bindings for DCC
Content-Language: en-US
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
References: <cover.1628617260.git.schowdhu@codeaurora.org>
 <1765c436635ecc05fc463524c1e7517297660728.1628617260.git.schowdhu@codeaurora.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <1765c436635ecc05fc463524c1e7517297660728.1628617260.git.schowdhu@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/10/21 12:54 PM, Souradeep Chowdhury wrote:
> Documentation for Data Capture and Compare(DCC) device tree bindings
> in yaml format.

Even though Rob has already reviewed this...  I think it
would be nice if you gave these memory regions names, such
as "config" for the first one and "sram" or something for
the second one.  It's a little more descriptive than just
looking them up using their positions.

					-Alex

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>   .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 43 ++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> new file mode 100644
> index 0000000..b7a6619
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/msm/qcom,dcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Data Capture and Compare
> +
> +maintainers:
> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
> +
> +description: |
> +    DCC (Data Capture and Compare) is a DMA engine which is used to save
> +    configuration data or system memory contents during catastrophic failure
> +    or SW trigger. DCC is used to capture and store data for debugging purpose
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,sm8150-dcc
> +          - qcom,sc7280-dcc
> +          - qcom,sc7180-dcc
> +          - qcom,sdm845-dcc
> +      - const: qcom,dcc
> +
> +  reg:
> +    items:
> +      - description: DCC base register region
> +      - description: DCC RAM base register region
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma@10a2000{
> +                compatible = "qcom,sm8150-dcc","qcom,dcc";
> +                reg = <0x010a2000  0x1000>,
> +                      <0x010ad000  0x2000>;
> +    };
> 

