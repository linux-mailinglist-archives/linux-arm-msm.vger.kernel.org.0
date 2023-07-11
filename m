Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162CB74F9C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 23:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjGKVfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 17:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjGKVe7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 17:34:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38675127
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 14:34:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso96013211fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689111296; x=1691703296;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kdVuwXm6t95AcBuBM8m7iArVjotqNWDs0Iyq3HVAYg=;
        b=NkqZys+bin9V5fVkkxHI6QhlxChpa/RkNbEBdYOBEEEo9ee0ztANjJ9JvOD41diumx
         w7VZ/PzElygPNgUCjrnj9k7EyE4i9w+WAIv6IT2776fuExrUtDcjq39qyRMHIE2/frEa
         AWvN9zMI3J10jBIlBjqSSJJO+aaLzubQCvqfWyRy5MYa0ApR3cYx9huE/xfecmG7snik
         bTFJTaE6SeuAMT/+LXCqhOqoUfz2gZXyciEe1ZtQmw8N1I+gh9r/znni0PHun0d4ohYS
         yR6cltNg96DS2y4zjsX8j6skn9gJd16Z9dTXPWl5400p2c2xDOauvG30BRSHuLcxJA19
         tR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689111296; x=1691703296;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kdVuwXm6t95AcBuBM8m7iArVjotqNWDs0Iyq3HVAYg=;
        b=FwdSW5vh/eRRYAVOdhYLH4GG+k5E0GRHP0Yc5RnXb7lSou/KwRe4pKEPS9KGAe5WjO
         LjWX4zuSEEYxQtrXcr7RNLRFk7nX5/xtTirlEnS01SYz4HAionF+bLyDLchaAZu/JIVk
         lgWeSM02toYvpzGKJKhITLmP+QqB6/nflxfCqeuHYQZAEXJWHTsnlmtBSE0NFLla5WcC
         ALSgg5Peowwz94nhjc2nQmebh1fplc0HGYeopAl7v4InMxoF1tqaQIPHYXd6QM2sqcu9
         /1/P25vNuU2CxIr+MO0fcQffeX9bSZY964LEzgPPTOQBj7oWGWVoCDPdriJbiVVDwHJf
         quZg==
X-Gm-Message-State: ABy/qLY/lctkYGihmvZS7bcm17eflNll6F2tq2Zj3ybO73jdfkIW/o1g
        HSSP8h0/bY5cQtKI/oWRoA6k9Q==
X-Google-Smtp-Source: APBJJlFvpJE95MGXlJyrIpKrgbrKL35PzAVwOnW7cxv5hb1zbqpIUZgMx6jvKV++u6SvtTpjyfoWrA==
X-Received: by 2002:a2e:a0d4:0:b0:2b5:89a6:c12b with SMTP id f20-20020a2ea0d4000000b002b589a6c12bmr14055670ljm.10.1689111296389;
        Tue, 11 Jul 2023 14:34:56 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e9310000000b002b6cb40e9aasm597832ljh.103.2023.07.11.14.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 14:34:55 -0700 (PDT)
Message-ID: <da7cf83c-8026-c6dc-e3cb-c632c1b59d96@linaro.org>
Date:   Tue, 11 Jul 2023 23:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8250: Add DisplayPort device node
In-Reply-To: <20230709041926.4052245-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> Declare the displayport controller present on the Qualcomm SM8250 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
19.2 MHz, VDD_MIN

> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
270 MHz, LOW_SVS
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
540 MHz, SVS_L1 (ok)
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
810 MHz, NOM (also ok)

(but then - there's qcom,max-pclk-frequency-khz = <675000>;)

also, what's up with the PIXEL1 clocks etc.?
they are capped at the aforementioned 675 Mhz but I have no idea
what they're for

Konrad
> +					};
> +				};
> +			};
> +
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8250-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
