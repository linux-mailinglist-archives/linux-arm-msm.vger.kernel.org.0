Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8842694845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjBMOkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBMOkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:40:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA669031
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:40:44 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qb15so30349591ejc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBayqw74PPvQCx2HJiiYQZDL5HXV2Ozwx8vKgVmuZRs=;
        b=qlhybUUjcgP92wOVOEsL8uC9F6J/KLndphTynsijnjtSfCgU+VTPeKkib3wKq+FBSh
         hpLh/EkIcKu1bUM/o5joK4otQIDxCOUMlUThj/sDn8W+XnK5VLHc0oXLA7/BDm7Ss5ty
         Po58OAoyJdYr0sASipn0/TfUyBXsQ1FYXTVrAAGzvd5E02/a/Exz3I6+W/VnSPSAtqCT
         EKpRwKrKyitNYiH84ML4u9qG401sMcic1aRM8oxrmKY7RMeimkERPQrhWQBl1y3GhxSC
         0JHmK153CSzBh6DKTk69WZ50E7Rdf3WmLsQZ+xXkEVK2pwxf9qHKlghie4Z1i1dqxNGm
         CC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBayqw74PPvQCx2HJiiYQZDL5HXV2Ozwx8vKgVmuZRs=;
        b=qKzHFgnE+9a1njqHYXm5ihSu7Swy87kHJa3RGnbL0WDL0/GTcP87qTssEqi32IzgwY
         SXolVD2K357qMgP7kNa82P7sJEAg/o6YL+qVm3Q7jeSCmlmWw28JuAv0LQ4R56eC6C2X
         2MfvlbtNERQIBqjrfQiLjHonAJxASFv7yfPekws4EN1NI1I69isO7+swi6TxMqiTuULF
         gDQ+FEyVvJCWG5uYmJ4l1EwRyCWTrVxO6WaFxz0Qv4fWR6ds7tps6AnuVBICx+8mwJ+a
         v6mM6fg9WnUbEafV4f2rS6nf8Rtu083uMJr9yZ9HCFNxhdQPwiJqbqM+y58WiitgA6Z+
         +Reg==
X-Gm-Message-State: AO0yUKXo82S0IzAzTPefnO7is6Okru6FX1KF9aw+IB/XVQ9baJyeSIp3
        NKXS5Ul/uLwk+XO4GSC9zhEdoQ==
X-Google-Smtp-Source: AK7set9tx3xgc/kdgdq2vLHkUJ9hI7Db1NOLUCnZqYjelQSQagQp4bPgdFVtWnRoiOS8B9Yhl30n5w==
X-Received: by 2002:a17:907:7e94:b0:85d:dd20:60a4 with SMTP id qb20-20020a1709077e9400b0085ddd2060a4mr34744336ejc.40.1676299243518;
        Mon, 13 Feb 2023 06:40:43 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id ot11-20020a170906cccb00b008775b8a5a5fsm6834465ejb.198.2023.02.13.06.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:40:43 -0800 (PST)
Message-ID: <f25f9854-8faf-7469-19bd-5ff998cdb97d@linaro.org>
Date:   Mon, 13 Feb 2023 15:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: enable
 remaining i2c busses
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
 <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
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



On 13.02.2023 14:26, Luca Weiss wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Any reason you've not enabled GPI DMA yet?

Konrad
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 86114dd2c0c4..d0f08b42592f 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -359,10 +359,31 @@ &cdsp {
>  	status = "okay";
>  };
>  
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* ST21NFCD NFC @ 8 */
> +	/* VL53L3 ToF @ 29 */
> +	/* AW88264A amplifier @ 34 */
> +	/* AW88264A amplifier @ 35 */
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* HX83112A touchscreen @ 48 */
> +};
> +
>  &i2c10 {
>  	clock-frequency = <400000>;
>  	status = "okay";
>  
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* PX8618 @ 26 */
> +	/* SMB1395 PMIC @ 34 */
> +
>  	haptics@5a {
>  		compatible = "awinic,aw8695";
>  		reg = <0x5a>;
> @@ -495,6 +516,10 @@ adc-chan@644 {
>  	};
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> 
