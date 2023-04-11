Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DCE6DDA26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 13:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDKL6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 07:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDKL6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 07:58:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8921FE0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 04:58:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z26so9937896lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681214280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aapgAIG6r1gVGZnUHo/96o38L20O2dFsi2Xt6bv67J8=;
        b=kZQipqGbczW6Tr+ISim8GGtVZ+UtkGTfUeq4QsulHt8vB69B2s4suwdlPYu6gBDuwe
         L/ckfN2HvJaH1xEugA3W8jmkUifUyB/YflfXbORw414IAbwZqo2rwpY9VgI9a7/sAU+1
         sAqFeT7znHG9N2NOJkKiDmeqMtfxnkSLsZDwFjmQ0jhBAGU8FyfG7HnlVKamBNnFV3ND
         3WR8mZ/5Qzm1WtkYyxVq1RZFSsGAQ7ZsA6lIMSz8qEauH32tZ8vBHsMrYgpz+t3YSFyv
         XpIuzzd3YcN+FxnuHPvLeMWGQ7rHxJTiDu6jYVH6+w3SJmGdoZUuf3pXP1lgG3shQTkK
         SC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681214280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aapgAIG6r1gVGZnUHo/96o38L20O2dFsi2Xt6bv67J8=;
        b=FYd5v+aebAOPRnnx4xHfpXIqc9EDmNa9H08aBnoLnHNh1lyAxTVVNHCDaUEdJHS5B3
         42R0CgD5mTNUMPYqRhhBhP7uRFdfJ1hyemQHs9UjZMK1xhLzcKrBA7BUjVng0Wq4FhXY
         TZq1l7VJUIydYQcOA/8AGtw1VOuz5Vbhw5h36o2yE5djfnQx4iwB4aFacRIBd6F5jKv7
         dCjqutmzK1IHa3sac61cYnALkJASMbtPfyuqd6uDgqmAnUHZcdFqVHMlSJn2GoxodXa5
         NVjYMzpZElCWCikS3Z+3lPq5XUUW62hcpkHStyEk0V7yhHbm0fdLowoZX605GqxWUkap
         muMw==
X-Gm-Message-State: AAQBX9dbIj0ZmeaB1mbwN2Lbprr+TASofYtMzxeZ1cvaAcxPr2oNywto
        j3c0eVMsqNdubpneyr4WJCTZrA==
X-Google-Smtp-Source: AKy350bzg+dGCnFbrYvUrKMXicSL2i74wKjBNT8MOUw9IP/fkam5MNgvx2YIqhIhmVkcwRvh6T+Fug==
X-Received: by 2002:ac2:5a41:0:b0:4eb:1e87:b1fe with SMTP id r1-20020ac25a41000000b004eb1e87b1femr757356lfn.58.1681214280579;
        Tue, 11 Apr 2023 04:58:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id q10-20020ac2510a000000b004ec5229092dsm2446846lfb.34.2023.04.11.04.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 04:58:00 -0700 (PDT)
Message-ID: <ff5691b4-df1a-57a8-6e96-f997bbe340f4@linaro.org>
Date:   Tue, 11 Apr 2023 13:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qrb4210-rb2: Increase load on
 l22 and l24 for uSD and eMMC
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230411072840.2751813-1-bhupesh.sharma@linaro.org>
 <20230411072840.2751813-4-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411072840.2751813-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.04.2023 09:28, Bhupesh Sharma wrote:
> Increase the l22 and l24 load used for uSD and eMMC VMMC.
> These need to be increased in order to prevent any voltage drop
> issues due to limited current happening during specific operations
> (e.g. write).
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
You could have simply squashed this into the patch where
you enabled the controllers, so that that commit works
reliably for e.g. bisect

Konrad
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index c9c6e3787462..dc80f0bca767 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -171,6 +171,8 @@ vreg_l21a_2p704: l21 {
>  		vreg_l22a_2p96: l22 {
>  			regulator-min-microvolt = <2952000>;
>  			regulator-max-microvolt = <3304000>;
> +			regulator-system-load = <100000>;
> +			regulator-allow-set-load;
>  		};
>  
>  		vreg_l23a_3p3: l23 {
> @@ -181,6 +183,8 @@ vreg_l23a_3p3: l23 {
>  		vreg_l24a_2p96: l24 {
>  			regulator-min-microvolt = <2704000>;
>  			regulator-max-microvolt = <3600000>;
> +			regulator-system-load = <100000>;
> +			regulator-allow-set-load;
>  		};
>  	};
>  };
