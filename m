Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB07F695360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 22:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBMVtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 16:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBMVtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 16:49:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721FFEB6D
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:49:39 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id p12so7675556edc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgFJ7WP5/aQ3NluuT93tSKXCSYsdZX4LGCi7cSWevq8=;
        b=xmd72FGQOLvdnEriWfOGMMya7fd9XHpHh1fJDUIaKxAACBQk/GqDJrvUOlEZV7QdBe
         xM3UUh/Nqa5rm/jgcI6PIrZUK0AC3qILfm6mp76DBZ0buGPu1nQioAOJRdGQfxEnlwFR
         VhAV/8/r39OXG8UEBv4HOck0NMjMYBLktb6s7v+u0eyQ58p38zMV5jVya36QFk4PktOB
         Oel0paMAUXdfmU7B+qUcoGkyEG69LFxpEXYAHs0qWUtVe8NWXAPZWyB2eKpRh/rPTeF4
         e03BCwoJ/gwuFa/WcMq3pcLksN5w9h1kkoocGw7FmhXP7rmyzFcZ4e3NA46o7am5WUAd
         eReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgFJ7WP5/aQ3NluuT93tSKXCSYsdZX4LGCi7cSWevq8=;
        b=eBrP5lS1MPZlRpnes3o/jy7PHFZR4WXZnoZuM/2dGZh9KzNnC8fKiMN/xUVZgIEV4D
         nuNqDnHWKsagEKSaou/yafCRbR2HSFV+YNIMMxST9nE3vbyqCBOijTobrSpeoxkEWCr+
         3bMoSBIFJyjYNM6SHrNgEfsj/wVWggbNcZuA8bjyRocKtvrQCikPnvXtWv8JZsH4XUkH
         9uY1LPwPmWYyrYk0n94XdDuc/r6e/GNfFcau1ugGP/rIUKQ5DZdRgW8l/0dAGBRb/Z02
         TAkpKKKYt7v6YRHU4crOp4Jt3jGwxKjewIEYY4k6BA8njeVPLLdrDHxfayNZ/RZz3HBc
         FNaA==
X-Gm-Message-State: AO0yUKUGPgAQjZvktmoOhixxSsURSxRji3uqoo8mtXLdNv9GtbX/ibVL
        9y/c0LVAydMrDqXZU2R4LKoC6A==
X-Google-Smtp-Source: AK7set8d4SLsjD+XttY8D3PsH66Er6RGiL4rUP4KCx34brMmzTgCNpL16KvuvhhFV2zNv6DJapCg3w==
X-Received: by 2002:a50:9e23:0:b0:4a2:6573:5c35 with SMTP id z32-20020a509e23000000b004a265735c35mr158012ede.21.1676324978032;
        Mon, 13 Feb 2023 13:49:38 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id r30-20020a50aade000000b004acbe846b8fsm3270242edc.34.2023.02.13.13.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 13:49:37 -0800 (PST)
Message-ID: <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
Date:   Mon, 13 Feb 2023 22:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing property for
 OnePlus 3T
Content-Language: en-US
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        kernel-dev@igalia.com, kernel@gpiccoli.net,
        Harry Austen <hpausten@protonmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20230213201651.1902323-1-gpiccoli@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213201651.1902323-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.02.2023 21:16, Guilherme G. Piccoli wrote:
> Commit 5a134c940cd3 ("arm64: dts: qcom: msm8996: add support for oneplus3(t)")
> added support for OnePlus 3T device, but missed the "qcom,msm-id"
> property - without that, skales-dtbtool fails to build the device tree
> image. Let's hereby add it, mimic'ing OnePlus 3.
> 
> Fixes: 5a134c940cd3 ("arm64: dts: qcom: msm8996: add support for oneplus3(t)")
> Cc: Harry Austen <hpausten@protonmail.com>
> Cc: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> index 34f837dd0c12..5dc8f0adab30 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
> @@ -14,6 +14,7 @@ / {
>  	qcom,board-id = <8 0 15811 26>,
>  			<8 0 15811 27>,
>  			<8 0 15811 28>;
> +	qcom,msm-id = <246 0x30001>;
Hm, this doesn't sound right.. Internet says 3T has 8996Pro..
Could you check:

/sys/bus/soc/devices/soc0/soc_id  # reg[0]
/sys/bus/soc/devices/soc0/revision # reg[1] after some shifting

Also, please include include/dt-bindings/arm/qcom,ids.h and use
the preprocessor constant from there instead of a magic number in
the first part of the reg value.

Konrad
>  };
>  
>  &adsp_pil {
