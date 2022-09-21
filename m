Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6565BF7C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiIUHdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiIUHdt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:33:49 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03FA83BF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:33:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a8so7706392lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=aQe4EbEwH+Te0he6Q+LesKbwiVWeT2RRaLMZab1VYVc=;
        b=ZGGRhdXjuUgKIURwXvZnh8kSkfpsyqxgt0sEy77zBa57gAtYN49R7qgpCn6MtAKspp
         6mk27COPAeO7YEREqjiPzss317/5ubdKcPwY6YBwC/Vmp8piNwb9jvZxsxeFBNBlDzkd
         6JlABHQuPDUm2sp/Srxxg88vUvbCxYJc+Q8BwjwbzUHL7O1wy0RpVa5rKy/vr94e5n2s
         UvW6Bl7467JMwvoKM04o0x6LgYjUX+ieDXlj33qWsNwVZUKVMT6WzGgxYlREve3EGUws
         r0bxocxCMvDDwXLRvkq9UYL3LMWPb5FrOzGSY3yT8vSF6Re/66KajnXpOuwE4f0k4C2e
         8ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aQe4EbEwH+Te0he6Q+LesKbwiVWeT2RRaLMZab1VYVc=;
        b=bLTg45RU32cUwaMIVt6xPhI89EEfBKpus+8NkLVYTh0ywsoLVEp0ru4DFcubdifv0t
         oXm5l70nkhVtMGXOsT1s3Ovg1SGyPxZ8fPpqutIkxEI8+ikbFHy4G8B5FaylpqA3kvQA
         zjvQ8/5zDTVxMGEkwPrA3ZtsTKF0ceRFSCoYw9O0Eio2JHMm+e1Ji5QceaIrAzWqqrnT
         fs9MyHj8GeDDoogDwybH8j/7uNyUnFyKgvFBa7HG0KA3qEpXS/JsUHvgTqsOw01hbsBr
         5XbL7Xrdw50pMiixPVkumGYtwbtDFq0MHNWfvR0jB+lRURDTCN7b8/cVyxdvdlETCqfX
         5KEg==
X-Gm-Message-State: ACrzQf0+32qgJ6jnXXXsYQBxph8JJqQhWYgCGtlZX83m8ieC6evIL9zq
        URMX7uSZj9PAh+enKyMZqPkJEg==
X-Google-Smtp-Source: AMsMyM4vSON1N8m0Ol1b19FpnmbrXqUNNqyWHu5KucxAN2jD4RDa4f61a5MrJj+hQMxzB3IxGQClqA==
X-Received: by 2002:a19:5f4b:0:b0:49f:a4b7:3f1c with SMTP id a11-20020a195f4b000000b0049fa4b73f1cmr5126375lfj.333.1663745624970;
        Wed, 21 Sep 2022 00:33:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b004946b549a19sm324282lfe.45.2022.09.21.00.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:33:44 -0700 (PDT)
Message-ID: <571f8852-0602-04ed-685d-cc972a897f10@linaro.org>
Date:   Wed, 21 Sep 2022 09:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/3] usb: dwc3: qcom: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220920224320.152127-1-mailingradian@gmail.com>
 <20220920224320.152127-4-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920224320.152127-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 00:43, Richard Acayan wrote:
> The Snapdragon 670 has DWC3 USB support. Add a compatible for device tree
> semantics.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9a94b1ab8f7a..34b70c3c2f70 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -1010,6 +1010,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
>  	{ .compatible = "qcom,msm8996-dwc3" },
>  	{ .compatible = "qcom,msm8998-dwc3" },
>  	{ .compatible = "qcom,sdm660-dwc3" },
> +	{ .compatible = "qcom,sdm670-dwc3" },
>  	{ .compatible = "qcom,sdm845-dwc3" },

No. This does not make sense. You already have fallback.

Best regards,
Krzysztof
