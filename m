Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8920F5F338D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJCQ1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiJCQ1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:27:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C10F357D8
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:27:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bv17so8591023wrb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=Dl6J818dJwrhqnKO5E5mdAPhbBKNty5zVADBP/KSUUI=;
        b=dA9OgXS/YlrqbAdOXrxpMy+1W3pj3hVHXCvnHtGG1qlmT6se06P+WRH2sVfNBHWtrG
         9AHJl3dEx1aAVYKdlI3j8QH2cC2oYJMX3D0bqEpt0g1mfUpG7wNrqgtTc2YXa8Oqz/HM
         bRsvDS0SBbgDgqW5K2BhcKxKCse8KGYOiQUpj0TEBOBq4gP/koAc9q1gIsbwhrYZMaFj
         CoipeezN4v3TpGz2dkajmX3WPLGOttTMnOIA+DBthAuk5br5qzcyn+TYETHY9tJ5122p
         E+dB12thsULeILfaAGRL5aDeslk3E2A0N6KQ+QMuDuM/xLYdICd/rt+s+VOe5gE9nOSy
         y1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Dl6J818dJwrhqnKO5E5mdAPhbBKNty5zVADBP/KSUUI=;
        b=zgNEwJREjrfPtiudtFs3Q3WN2ydaA97IDE83poHQiYKBT/bmMZ/d9ZSYqF5vlxkXgp
         5DieFyWy4S4Jo9Hq/2jykWyplXmOeOOeVhOdaWP321H80TEvfCJYsdZOkxIPKT1s6EVZ
         Tm/ellHeCVGmqU29sXVxd3XilXG092rGdFq9PcvfdjWcPnvhP35ZwNmH7OiQu0CXiLd+
         Ja5kk+s8LUJEDdEUj1aPzHgd7M/SCIR33jlVbcsP6ApPfABeZJ8xPmr2+mET2r4HscDF
         wjapEeZDYuOtrknV4FQ61uNuhKYw9rXmdUUY09IzvuTZl0pPU7YlG95ODu53HdTei6QW
         6hrA==
X-Gm-Message-State: ACrzQf0fbFOjUwpBi2TYq/68eyUzH89s7KF1NnqliwkFHlNT6lTguy6s
        xXChm4LJVJbqTgGQhp7edg/h1A==
X-Google-Smtp-Source: AMsMyM53xsp7GlVsROwFmfxlbooyHzSIEs5vHbzPnxq1F8H0V446CUeiOm6oiso6tpVVDaRz+h8csg==
X-Received: by 2002:a05:6000:243:b0:226:d241:11e6 with SMTP id m3-20020a056000024300b00226d24111e6mr13364344wrz.187.1664814470207;
        Mon, 03 Oct 2022 09:27:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id z11-20020a056000110b00b00223b8168b15sm9940586wrw.66.2022.10.03.09.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:27:49 -0700 (PDT)
Message-ID: <b52151b3-39ef-0a8c-c4fa-d0e80aa41055@linaro.org>
Date:   Mon, 3 Oct 2022 18:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/23] ARM: dts: qcom: msm8660: drop qcom, prefix from
 SSBI node name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-24-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-24-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8660.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index 60edb4bd5bbb..a5e02301178f 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -333,7 +333,7 @@ ebi2: external-bus@1a100000 {
>   			status = "disabled";
>   		};
>   
> -		qcom,ssbi@500000 {
> +		ssbi@500000 {
>   			compatible = "qcom,ssbi";
>   			reg = <0x500000 0x1000>;
>   			qcom,controller-type = "pmic-arbiter";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
