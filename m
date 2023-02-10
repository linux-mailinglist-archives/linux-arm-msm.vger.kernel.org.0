Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7246921D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbjBJPSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbjBJPSx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:18:53 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B157534D
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:18:48 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id rp23so16710299ejb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTrO0+Hb16Dwx8dCNpH5NI+RsYPIYieTzZZe10P29jw=;
        b=ySY7RxpaqV2HY9FGqcE2zcSd+PgtI475d+BgkR5T6WcjQdYq77wgt4IQfz4ADfeeNR
         +d3iiSH+Ukt5Htj8Ij/E7xAStZNVEvTQYKJr2dNBAQQDOgWwmvbXeoOa6y5Z6zdnvAcn
         2utD1WW/rSGvhEiJP1tpUZbaaxfL0vNaC4kxukx3MJ5e/Ys5dHJkN2KTvaQVdZCPh+iO
         54hgQYe7XfY67Cv7Ld7xnDm6SBxhWgoLoWev+s4+4yJ3EWV+2b/TAHRglaD3G+oa4FX2
         27Z7Jnq7Jyw36KB8sTLvuLbPxaplzYiHlPpHzktEdKTYTMgmVgmcJgKJulqjMJjJjT5I
         JUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTrO0+Hb16Dwx8dCNpH5NI+RsYPIYieTzZZe10P29jw=;
        b=TPr/RiiD3oT+2cYNemWdpU7hfkEPbM9zHM8TcDIusyFnk1uF+R0chh/ZIcVlYUDjbm
         bFwLWVePTmlUtiMwZ7wsYj3vVkfuAvBCeLNDFWcS38GIFCc0omJ0Kc/fJ9jVauq3KAh4
         auqWZJEoqSN/yrxRGt63MuUeFpsPkvSllDDjRF6LT0H5orVFk7wEx7BMpQw2+EmE8g6d
         aAExCmqOa1+R4kWcrQz7Pmz8vucq7uLsAHHYw9gYYTOIobEB2pYi5EVd0InStP78Rvfm
         5mOl3AJ6pHbxmTB1aA5wbDE2UtNiB60s1MD0kyH3cicIwXYxjonIHHf8ejDKFWHIeAEW
         IQ9Q==
X-Gm-Message-State: AO0yUKXWMVgmsAcxXlpGui+mlHP3S5BC/p3OoosvGgT/N/i2NgcuQkZV
        lP9D+aB0RCbVSTveW+sctGfTyA==
X-Google-Smtp-Source: AK7set+wB2F1D1yafXt73sb47xKeVWVy5imjwfiTNYit/QK0pZoxEzn7pYyun3egopr92hzm3yYD7g==
X-Received: by 2002:a17:906:1614:b0:87b:dba1:1bf3 with SMTP id m20-20020a170906161400b0087bdba11bf3mr15955265ejd.30.1676042326666;
        Fri, 10 Feb 2023 07:18:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b0088cdb05f1d5sm2524339ejc.113.2023.02.10.07.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:18:46 -0800 (PST)
Message-ID: <d5dd4982-af33-6f9e-afd9-61d632df7c8a@linaro.org>
Date:   Fri, 10 Feb 2023 17:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8450: switch to usb3/dp combo
 phy
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-4-636ef9e99932@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-4-636ef9e99932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 16:44, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 +++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 27 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

