Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFAAD68BAA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 11:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjBFKom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 05:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjBFKol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 05:44:41 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4F37ABF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 02:44:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id mf7so32882942ejc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1Iempz3M09BbHziizB4P4d8THx1f4RE8dK1qpEI8Bw=;
        b=JZDcosQ+KeXXz65xlrHSr3okKyEdYut5ZN4GuFh2DGYLko78Zr/JFAVgxmJnsElbqA
         BPop+rdVObU3p2nis1b/l0Gm+N05WgRnCQdrl5xCwT5PTxs663kcTgfTexiIeRFq8wEV
         5mxlHWuLEAu9MXkm3r4gC08H/zgHbsZe1l/ewjc0ekv/Jprq5YL42dtkaTwB3XPLgKST
         qAxrh7zinJFpWDjSuN1dZWwkgKSsCKie4hT3T2po1T84Pu+0zJcjQo8PEEjQDqw9xLTp
         1uPS+Qu13fH3QKSgzK6pFzSx7EI565Q1ozbwLafxkHv+ijLIXzAr4DSWSF+17yOawXn0
         +UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1Iempz3M09BbHziizB4P4d8THx1f4RE8dK1qpEI8Bw=;
        b=0CNHivQ8TfAjCJgapCxe8vsNkCdl9TrZTFIWaf1QA1cFDqar7/NmOxUUUhN479Euqi
         m/eYmqGIpFSGTE67BOXPVi34oii3ReVmNY1yT6VruseEqpLg6z79MXhPe3BfBcgmjwbk
         5uDhwQ5A7ESvjM8N/b5YniIMmxnm2yMRTYvUXs8I3wmqHRh4ujuGfG8mkIQaSJ0lYFpU
         BLNJii41NAKGy1jxe8opZBYXieIZ8ab5HZDCuTWAkWWEVUcy7KJ+CeQfd6bQMuLxcGwm
         Pwgnz2UHON5HCcssCAkOXDEMljjbGtwBF0bDrqHxlS/xaGYhY+MIGkL7pQxzxfuMH4YE
         Lyvg==
X-Gm-Message-State: AO0yUKXp9Q9AUvKb3Hmhq6YQddEGz3zJuOhTtWOySsoXm6ZTZSE98WNA
        xLpWZae+3cljHl7WN8V96JOMdQ==
X-Google-Smtp-Source: AK7set9epcGwzF22cdUrtDa7YO+sKgIkS6xcAldSY/IvGSqQATO+wss5yMLF5C8bWbidZHuCbpuFwA==
X-Received: by 2002:a17:907:72c1:b0:871:178d:fc1e with SMTP id du1-20020a17090772c100b00871178dfc1emr23906772ejc.77.1675680278961;
        Mon, 06 Feb 2023 02:44:38 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906348800b0073d796a1043sm5186319ejb.123.2023.02.06.02.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 02:44:38 -0800 (PST)
Message-ID: <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
Date:   Mon, 6 Feb 2023 11:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.02.2023 01:27, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8350.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
Wrong patch?

Konrad
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4a30d10e6b7d..1bf8e87ecd7e 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -211,6 +211,7 @@
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>  #define RPMH_REGULATOR_LEVEL_SVS	128
>  #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>  #define RPMH_REGULATOR_LEVEL_SVS_L1	192
