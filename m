Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3713D66221C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbjAIJwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237031AbjAIJvu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:51:50 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C590120BA
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:51:12 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id co23so7553785wrb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3rGtdDW0VJw7KN93Fm1fjQQQqFXotbWswvCHbihqy8=;
        b=awMV8tF+q++ycvhLcvJKnSGujJT7HKYrOy52OsNlhAdm9ScD34wITUPjYsT97FwJT4
         j/98Z27xnRT2+/faoIPQIvJkOdcnVeNOX8UXSxd4PjCDmd+Jp5zAsbIYBvl72G8eW7mn
         1Kq3kEvS+pQ+0OupU/AqBjb8B0zwyKWXxrnf1/YxHWup9Oli0urUEpcFdy16/v2FEHX1
         Xz3BD/3nFbcnmWUhxUS8KGtP/xXTxBhxSb7+EucCcGsVTZuwowKkBDNJPpKdSNR1nyVE
         rfHahEh2gqsFJiVI1yhH3dVLEVtIoGdPLPRwnUJ1Ebn9/KGgs5U5cc7hij0WJRqehDdU
         mY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3rGtdDW0VJw7KN93Fm1fjQQQqFXotbWswvCHbihqy8=;
        b=xkoTmyNMR6zJxWKNAB/Rdcvi4/zXdgBj8xrZpPcCJ7sZNlemsh6ISpD2gep0vqsC4k
         sZEwKYJCQxi0b3WYz6J4ZoVPiqOxC+0yCf8Nsd9rltaJh5ja9E3HmmESpUXoXL7ekhuL
         iGPf49j21XF6JENV+3cIZVIPTxXpsR8prvJ8J3mxFKCO/Oof/lE1TebDT6ov5V2TVnDl
         ZtwshnHP8DRuh0wZx23Wu2XGObXo3pEtahB2Zfxryj2T4sq5wXyx46E5U/jxdNsHNtP8
         eWvJD8pvx28EcdCvn0di//HlleYQzRGCi48jhnv05dfUw12GIfCTgrFggqDdh0snqqFb
         CZGQ==
X-Gm-Message-State: AFqh2kqff47fm1Jz7+KZL1Xa1VvMBa9J8TzSjUZNisjNEYB4ejOAxA5M
        hGrsvrafCItUmIskgjeudHp0hKAD8SZ1LZi7
X-Google-Smtp-Source: AMrXdXvJrU0pWeGYYQrTaHP+pbhxB15ZcOYhNi6h5OBW6UKkbzybHDYa4SrdPI49A01OMCTe3HE2XA==
X-Received: by 2002:a05:6000:383:b0:242:8198:625e with SMTP id u3-20020a056000038300b002428198625emr41917435wrf.63.1673257870641;
        Mon, 09 Jan 2023 01:51:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v14-20020adff68e000000b002365730eae8sm8032539wrp.55.2023.01.09.01.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 01:51:09 -0800 (PST)
Message-ID: <2bc5d781-499b-fe39-2dc5-92bc9ba8396d@linaro.org>
Date:   Mon, 9 Jan 2023 10:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] dt-bindings: reserved-memory: rmtfs: Make
 qcom,vmid an array
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230109093947.83394-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109093947.83394-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 10:39, Konrad Dybcio wrote:
> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
> others really don't want that. Since it has to be conditional, turn
> qcom,vmid into an u32 array so that we can handle the NAV case, as
> well as other similar ones if they pop up in the future.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v2 -> v3:
> Rewrite to accomodate for changes, don't pick up tags
> 
>  .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> index 2998f1c8f0db..cfc2fda30eba 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> @@ -27,9 +27,9 @@ properties:
>        identifier of the client to use this region for buffers
>  
>    qcom,vmid:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: >
> -      vmid of the remote processor, to set up memory protection
> +      Array of vmids of the remote processors, to set up memory protection

You need now min and maxItems.

Best regards,
Krzysztof

