Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEB1673B6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjASONs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjASONJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:13:09 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E746594
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:12:27 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mp20so5973511ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVwpwP4L2BBwb3CX7YjZPuDAVWCzEvEalSJdJwSRjy0=;
        b=K6D3cZTtI4P0GGX9GapAMig+nqZ+ed3QgZmNNYCNmRjkFhQdLm5Pet2+pp53RiIbvi
         rNnYocJlG6PyYNC+7s+J9isvVJ6mfH4UtxUJm3P0edKa77oKjaPAGHA/Dy6vHVP8PhlC
         zD1b6EZ1YcZRVfsAcgzaSXHDONvhCkM3/5SvjiAFRCsAWSQK4O0TabgRpOxi8Y5NcTNw
         ND56jyVHwPC+vsGkJIJGTu8U3qdX2Re0apTHvZuhQIs/xrr0LEpaD7JVAnQMuPt9cPXt
         ACHDxqzVTZzjs3jW5Nueb+B3x5IV6494792I5DX0r9sX6a7KOqLAaiv0gLbSEo+FIdj7
         4rNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVwpwP4L2BBwb3CX7YjZPuDAVWCzEvEalSJdJwSRjy0=;
        b=CfdMkk2C6fQTcziM+SHZyh6/bZdZ88Ru5xyK9PBSF92pdFlJtSo4UCSrxUxSU2KUNf
         0NUq+O+0Hls4C4sIOc5kp0RVo1JQzNnqgybLr8elFD2rODlmPjBnYod8f3BhvVVG5pJB
         sEsC44gPSnxQ+UZN4t/zh9qJ3/lHCfUjioF8m+dF+icEHD7Doe6olggHxuJqDlEd6JeM
         C82jArsLkLgONoBXQDy7R5KYCogbpYS2em/GwJi7T6/GSwEFwk9CV5pjmiPUI3AkN8rh
         Nwsp7uUEO+WL0PT2uG0FfUXoEkjGZDp47ccrnGEYh593k3T6U3CYAOah3v5jTGGJYGYG
         vmWQ==
X-Gm-Message-State: AFqh2kpnqd3kVGRjusUVsNBeZlq4vbUpOjdPumpIHUN5VZLE1GrIIk1Z
        9XAAsKdt5HHfr8dSXS5LjtqKbA==
X-Google-Smtp-Source: AMrXdXuSLrB/4Yal9O+dE3vloHptxIe4v96pa+K0yU3MXj7aUevxYZtIqSE8JE+iVqmZ57coJ5RerA==
X-Received: by 2002:a17:906:eb99:b0:7ad:c8d7:4fd9 with SMTP id mh25-20020a170906eb9900b007adc8d74fd9mr11284421ejb.36.1674137546286;
        Thu, 19 Jan 2023 06:12:26 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id kz11-20020a17090777cb00b007aece68483csm16450322ejc.193.2023.01.19.06.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:12:25 -0800 (PST)
Message-ID: <3ead87e3-7ba6-4455-8f21-0e482df4cee9@linaro.org>
Date:   Thu, 19 Jan 2023 15:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's
 hdmipll clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 82c795beb8a1..b7e5b45e1c04 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -867,7 +867,7 @@ mmcc: clock-controller@4000000 {
>  				 <&dsi0_phy 0>,
>  				 <0>,
>  				 <0>,
> -				 <0>;
> +				 <&hdmi_phy>;
>  			clock-names = "pxo",
>  				      "pll3",
>  				      "pll8_vote",
