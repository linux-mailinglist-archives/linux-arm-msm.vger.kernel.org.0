Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72E95622A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbiF3THS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbiF3THS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:07:18 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E773F880
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:07:15 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id lw20so40851178ejb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=piUvaKld1qnxNrwH7NkZMI/BexFhn+OSQaZXyTTeJsI=;
        b=eQw6FUbHKgkJq1YC9al1cNe3NQgmszYemmYaTiH1/rsAigg5ZM1R5g1fWZGQyi8OtI
         cZYdnaLOcyS3TdfPJaFd+QYRKRKQNA24W/PbMEyn4VQwLsEiRzf5BKAaW+lXS6t/fqJy
         pAI+SGeQ8kuqDVz24cIxREJAnuOSlYDQEqj/93nnnIFZ403sQwUN+Cvvu7H7nGkBTocd
         1R9pwmDlFrMy4o0/O5Y+ZK573GqPjvOOYaQ2R5JAMo13kgIZSDOofajkaoqo/H+05r0a
         n7iymGYTobF/QUFBZDqxebkdLVhUzKgsswOfJH9p7AtjBpOrKr44Ard2UehbZMAm8dwp
         tfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=piUvaKld1qnxNrwH7NkZMI/BexFhn+OSQaZXyTTeJsI=;
        b=ihlqzTBX+BtR7GDnh04JlSQu35Pjk8zpoTsGBiy39wz/5BCJlu35pdniVK5lv4PP8b
         7A505YLry7QpeGfHP1VKmylhZpieb5crDzDHgcaw6fbOvYs7TBssqmiIpXJD4DiFueAr
         HagGbXtndMSmFzYm9oGmZbbjys5nxsRvZ4mfLY+SpeM+roRSbP+vKIx87D47UciekyE/
         4nDbsq6O6V8XugxiC/enhrMmtjbLe8Zfpul/qm3bqob7mXEd7JTaA5z+H2oVH1Lh08n8
         gdLG0bm+EjdnhyQB6sqRL8YMlGUWNeN/UXATDd+h1fdDCPgVwOIxv3GNltMKu9wJxe2U
         TzoA==
X-Gm-Message-State: AJIora8z2TxkZFw/M4ycXuFyfIdI7Ucu8N6zPcuP6tErxBsBeoc+mil9
        EBPjkItrMGz0QjZ704TeYM5ZLQ==
X-Google-Smtp-Source: AGRyM1sN9V+G1ISGzNAljgC1ZskGE8aiGAvRJTluEXUI/K/w5Rtck42hyZUKEfhoNWVmdkLfJ0jXlA==
X-Received: by 2002:a17:906:c151:b0:726:9266:ab90 with SMTP id dp17-20020a170906c15100b007269266ab90mr10468471ejc.525.1656616033978;
        Thu, 30 Jun 2022 12:07:13 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fi9-20020a170906da0900b00722e5b234basm9496996ejb.179.2022.06.30.12.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:07:13 -0700 (PDT)
Message-ID: <f1d3cd34-bece-c0de-1c3f-ed53b9a8118b@linaro.org>
Date:   Thu, 30 Jun 2022 21:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 7/7] dt-bindings: msm: dsi: Add missing
 qcom,dsi-phy-regulator-ldo-mode
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
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

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed this one.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 9ecd513d93661..3551e166db966 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -40,6 +40,9 @@ properties:
>        - description: dsi phy register set
>        - description: dsi phy regulator register set
>  
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    description: Boolean value indicating if the LDO mode PHY regulator is wanted.

You need type:boolean. Didn't dt_bindings_check complain?

Then description can be shorter "Whether the LDO mode PHY regulator is
wanted."

> +
>    reg-names:
>      items:
>        - const: dsi_pll


Best regards,
Krzysztof
