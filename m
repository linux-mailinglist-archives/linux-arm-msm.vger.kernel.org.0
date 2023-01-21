Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C987F67653C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 09:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjAUIsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 03:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjAUIsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 03:48:07 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9469AF754
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:48:04 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d30so11238311lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H10VW+xEg3DX5kE57CYgEU08kcjqqLocBifj9fl974A=;
        b=oPPK6jwSu6wF18Q6YJKvr4hzat05yDF3cvvX1mjjRBpu4hvtrUbTjCXIA4xvsg9STl
         t0sPoYP2GLk7NjXx/saq/RliBN45Y3VctkwokmZHrhzwMCLbj2126Cmpbn60Fg92Afiy
         sllB5W1gSKzYeLNyVc2iGYbgrm3TYD1LOkaUruKhW2vQUaz+A6GeUUiTlEQ3TiYFmtwk
         uOI7ivQ968U9VvsDG/38LyGDYIp8du9Cl6VBKueZGg+YUziddxvjGMUcQXj+iyCDzCei
         B+YTU9LkM0G9jjIKNOupq85U9JvRNsxxeI9M+fQSsWPwNs2E1FswqIDGFHc1lzkmUV9d
         naHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H10VW+xEg3DX5kE57CYgEU08kcjqqLocBifj9fl974A=;
        b=oQufFQxRd3ZwljQPcrb/4Ctjn6In1p2R6Igyr81lIBrTGM0i+GpRvA/tU0nVZc8ehq
         klzzMljre054Q1GguR8SQcN5fAqfLb4i7mRdqaPYkdEKZ6ymJ9nV1MsTeeKTVN+ZQ6si
         ChfTQO8aDyc7hScHmgNxqV7bbTbewVuhfBt680L3owxsqgwQf0+d+kaQlmYiS1PYrKWh
         3XWjczP5myXLNFKXRt7iN1Jvsv4wmFCqTA26qn5xN4y2YUkboZZwMxZbSie/FZKMdt4S
         JP9FI2HrDvfEAImuteQDl7cUoWFtmgJcxpUVQx8ZGrfNVLwkS1xZqUqwPJWfHAd1dT9P
         uNZw==
X-Gm-Message-State: AFqh2ko1T7ZZAgavUbpPTMOFdqNsyS6ENuiwzowlRRnh3+Jsnd0skV+J
        CnwORYRJFFo++uCVp/fyxpSpIA==
X-Google-Smtp-Source: AMrXdXuTJi1DKWpTKn9ZgZ92EMIbiHdTEpu8XWSLYmf3cjTDsQ09kWsV/SGG3xYYkkyiZ33wH3JVDQ==
X-Received: by 2002:a05:6512:158d:b0:4b5:8054:1ded with SMTP id bp13-20020a056512158d00b004b580541dedmr10409354lfb.9.1674290884148;
        Sat, 21 Jan 2023 00:48:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e18-20020a2ea552000000b0028b7cb86d9dsm1937649ljn.56.2023.01.21.00.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 00:48:03 -0800 (PST)
Message-ID: <fc955b13-cd54-a567-8a94-2b828af0e2f9@linaro.org>
Date:   Sat, 21 Jan 2023 10:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn
 out labels
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
        devicetree@vger.kernel.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-7-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 23:00, Konrad Dybcio wrote:
> Add the mdss_ prefix to DSIn labels, so that the hardware blocks can
> be organized near each other while retaining the alphabetical order
> in device DTs when referencing by label.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts |  2 +-
>   arch/arm64/boot/dts/qcom/sm8350.dtsi    | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

