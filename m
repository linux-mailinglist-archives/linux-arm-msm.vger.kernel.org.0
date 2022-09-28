Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237835ED15A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 02:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiI1ABS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 20:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiI1ABQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 20:01:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2952F71737
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 17:01:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e18so7530501wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fMcBsEpDSyuJ1C7A9eWnkm76CW5M85rNBijPmUt8g9U=;
        b=egbsnscIOzit4PlrMAXfcSTng8YqJBaPjpfU3XNQf8MaQNJF7SN4SH5ZccpYj017ok
         LpTWsLDQ6O3jkadeMD3HuXrROBtbdTZINbSxrNBd43joB8qJRaAT0v81/hRc+CSYGkyQ
         BUF3mX1/7s6JfAu+5Ks0NlurTgAXzQHdK+qs0tpDmi3PUIcw+jX3qx2ZsCHX3z4Tj79s
         FZ8R5m3nAtP9xvnZEFeOLIHAy8FhEzc6wnnbHmhscaUku//O2++AJ7BfrMYa/Cfh1JWA
         dh0XVy67b89ciEfal2bjoxpubIhzwejjBvBTVtBr64W25LtNy+Rv/bdkPmlJJgTSR2SP
         iZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fMcBsEpDSyuJ1C7A9eWnkm76CW5M85rNBijPmUt8g9U=;
        b=blTeEmNq93I//IJW0w1TB5ugW9rAsGcRWj3wfxgB7ixAZvlP8tmMkVH960HfuHtVMR
         rubuaLDU2mCJTgTCY3j9/qh+ubhCTaKIUoivoQGSHdP7jNd7VKTRWRRu07NfcAAQSO7N
         PAj2O6D4T8yHbMdJCfyIlFfbSAp2WYZgg0Lo5ShUvP8BFRPxVuVtmk5pnB/lD4TjpzFO
         Zp0dZ4MQQpv70fhQNRjUU6j0M2VIRd6kuK0rUTvrk4lVURbVK0atd9NsRpbmaJx1n79a
         uhp3Aj0WYROuDTEEGFvh8pgjQDxm8Q4X2Aw0RweZ0QrSfzm1welmKQXYHSoMP4WLHxwr
         35bw==
X-Gm-Message-State: ACrzQf0gnBJzEbmd2qNQs8l1KpJzQ5zzRKPc2ctpNMy8pBQavZ3vJn++
        Iqmzbw0+E64CFGQi1wuTiiSbmg==
X-Google-Smtp-Source: AMsMyM4o0M//sa+2D5J1EKjxbFe4Bcy/lfr6PR9JfqXLTsgaDNu2kTaXOakdsxnSCG1fa8OWOesWjw==
X-Received: by 2002:a7b:c40e:0:b0:3b3:3faa:10c2 with SMTP id k14-20020a7bc40e000000b003b33faa10c2mr4644903wmi.32.1664323272671;
        Tue, 27 Sep 2022 17:01:12 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f13-20020a7bc8cd000000b003a62052053csm212955wml.18.2022.09.27.17.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 17:01:12 -0700 (PDT)
Message-ID: <32557cfb-f379-c408-1e91-8a5441069be0@linaro.org>
Date:   Wed, 28 Sep 2022 01:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 2/2] MAINTAINERS: Mark Lee as Maintainer not Supporter
 for MFD yaml
Content-Language: en-US
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220927235108.227566-1-bryan.odonoghue@linaro.org>
 <20220927235108.227566-3-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220927235108.227566-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 00:51, Bryan O'Donoghue wrote:
> Running scripts/get_maintainer.pl on
> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml gives Andy Gross,
> Bjorn Andersson, Rob Herring and Krzysztof Kozlowski but I'm told my yaml
> changes needs to go through Lee.
> 
> Change up the MAINTAINERS file so that get_maintainers.pl includes Lee as
> Maintainer in the output list as per
> Documentation/process/submitting-patches.rst.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 936490dcc97b6..ee3bafe9a08d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13905,7 +13905,7 @@ F:	drivers/media/i2c/mt9v111.c
>   
>   MULTIFUNCTION DEVICES (MFD)
>   M:	Lee Jones <lee@kernel.org>
> -S:	Supported
> +S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
>   F:	Documentation/devicetree/bindings/mfd/
>   F:	drivers/mfd/

Hmm.

Actually maybe Documentation/process/submitting-patches.rst should be 
updated to state that anybody appearing as "supported" in 
get_maintainers.pl should be mailed, instead.

I'll V6 the yaml standalone and propose a change to 
Documentation/process/submitting-patches.rst separately.

---
bod
