Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34835676539
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 09:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjAUIr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 03:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjAUIrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 03:47:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAD236453
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:47:43 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a11so11363083lfg.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
        b=W5owJGCIo19xG0s4TWPnTP5L2WRmNRoDLz98R8+5Ee3JtEa++A4mEiwOIdqcu1G+WY
         1hIPpzdDTyQi6YpB047N9YC0Y1e2qZKb3Keh4rY07d6oF2Av3y3pOkc9DnSjLrYPrp6P
         fx5h2mN6RTcwydiP4fBM3KR7PZn6y0DStj0kG91UK9ZOAn2euxr8tXEg+52SmO97QUAt
         J4eWvHbtEXZtWFh0Qv9XJoBRujX59h737j+hkTT5/Ee/d0dyq0TDZZj9H2einZWHBDL9
         jlBMe3MKNYm3N2mWQ9K8SA90x/iXDg4ohZ4fv19TjDYkL3T3y+J7qpT6Q2DP09r5PuYS
         NH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
        b=fU1Z7o9uX31fzeqHj3P2Bq6vSSePCEniyx9wQT2Jax2f+Unl1raWMvDN51e+0VkL6m
         7hfyFPppDKPP6Mwk8EctEYmz0g7CmweUciMD7pj9QkzTGTMm4tIX1KNRvIoMm1BaXojM
         rObN7NnlVNIQDDDpaUNCGet0fXFOcIM0GhBoX+2LbAruHqOHOSTEOX7CZ5obCCzaNoZm
         2fPN4U5r0wluesNMknB+q9OIcCYXUCTZav4hdoRciOEiTgRO5GWlZmReujq0I1QG1IWq
         OraBi2UW4JwnU9YlSSSD+WYCOFymUJDhByefFox/Wr+EJjOnnuQ9Is4lEeTGYwEMwM4z
         25YA==
X-Gm-Message-State: AFqh2krEHtaZ262xQNYr+Ay8MCXtwS3nZqT3jrm0fewWycyQVl2KBaig
        Ekr18ivPWXZWp1Dhs+CqckkB9iLe9lbRoqbVY5A=
X-Google-Smtp-Source: AMrXdXup3aeZB7gxcaRq1cbDz6dQNOHgNRDof1U3LkTjlihG8wz/4mKtuTiCJJ7YlMFIBXiCMWag6g==
X-Received: by 2002:a05:6512:1046:b0:4b5:2cf4:cc1d with SMTP id c6-20020a056512104600b004b52cf4cc1dmr6256085lfb.68.1674290862243;
        Sat, 21 Jan 2023 00:47:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm6234855lfu.188.2023.01.21.00.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 00:47:41 -0800 (PST)
Message-ID: <f324aa87-8df9-25be-d6b6-6341460993d2@linaro.org>
Date:   Sat, 21 Jan 2023 10:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-6-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 23:00, Konrad Dybcio wrote:
> As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
> wide. Fix that to reserve the correct registers.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

