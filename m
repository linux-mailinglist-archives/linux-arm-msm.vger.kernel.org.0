Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730207151E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 00:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjE2Wgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 18:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjE2Wgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 18:36:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3435CD
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 15:36:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso2693774e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685399800; x=1687991800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAnUWpSKK6l41AS9672288ydxu3/VZl63dbk9kxKDjw=;
        b=s1XZVqEQSQASnsDt2XEi7yhUV73XrgBEetrJrFOBM58Ck9N4t/H4RGnpEARIeLWWVZ
         fmlw7HOvWMCwEvw6IBJqvxGUdsE974HeUCa8wByTKaFOQYguWg8aGHG1kJQgNhcHBWfT
         6sjTbvRVjUX5y14IjBzvLvhH0nFWLa6C939w89tGBgiRjY6xHINRIEG3H9fJoUxNXg/0
         JPV3Ce/RaZcs4SaJwJon+l+k3zreVnG3AyCywQca+vd96PDUkotmqhoHPHj/DF/9LFcP
         bH9uYE/q7BnD/MzDekEM1HPDNDS/dnj5sjRvYOv0GuEDZODrgZhjOAxlGG/IfUw0VgEa
         yRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685399800; x=1687991800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rAnUWpSKK6l41AS9672288ydxu3/VZl63dbk9kxKDjw=;
        b=PXOnt6ProiaMCNu+mpEsxlwk/cpCmFw48aeT+3K3wKPoFWUG/U8VFuDBGQF36UMXH3
         QAXrMz3LvFPlvxfa23k4EI1EgJ7D0HU1ZadYt1gLGmgti+gLAJL59Dnnrb1Sqbq8uDYd
         NZ9iZEfZPRXR49LQDPZzWwnwtbvtyElxijgrqsTvpQQiKkljAHht74uEpSoMEZCp0XCi
         gRzKNXNFSTGiruiVzkllFdohQc+S74tu+kE4N9S4j7xC7cMmVxvPIfhx+4cF6eQz62GT
         I+msP8fHXcB41jfPH22w/msN8kEhSrQevNM0iH0dp5Jsvo7biPfa2KV1XmF8FYgUHW1b
         AVmQ==
X-Gm-Message-State: AC+VfDyBYnnvU+T2gGT0v/6IsXn5VMya5+wxGXJ8joxJym7Vrp6eeQP1
        5pDBOpO/at1DocUiITTtGbMVnA==
X-Google-Smtp-Source: ACHHUZ6kQQV4gAjW1OJAD9ogabePKfoMe2Xitwes5igmZMF8vyZr7USNGkDV3Ju00LxVrR6+Q7e/YA==
X-Received: by 2002:a2e:9c0c:0:b0:2a8:aec9:b0ba with SMTP id s12-20020a2e9c0c000000b002a8aec9b0bamr470lji.11.1685399800107;
        Mon, 29 May 2023 15:36:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l20-20020a2e7014000000b002ab5421959fsm2629226ljc.90.2023.05.29.15.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 15:36:39 -0700 (PDT)
Message-ID: <6ac6c00b-981c-4726-3824-6ab8eb4799f4@linaro.org>
Date:   Tue, 30 May 2023 01:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia
 XZ3
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Caleb Connolly <caleb@connolly.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 00:11, Marijn Suijten wrote:
> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> <snip>
>>> +	if (ctx->dsi->dsc) {
>>
>> dsi->dsc is always set, thus this condition can be dropped.
> 
> I want to leave room for possibly running the panel without DSC (at a
> lower resolution/refresh rate, or at higher power consumption if there
> is enough BW) by not assigning the pointer, if we get access to panel
> documentation: probably one of the magic commands sent in this driver
> controls it but we don't know which.

This sounds like 'a possible room for expansion' which might never be 
actually used. I think, if we ever get such information or when the 
panel's DSC config gets variadic following the mode, we can reintroduce 
this check.

> 
>>> +		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
>>> +
>>> +		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
>>> +		if (ret < 0) {
>>> +			dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +		ret = mipi_dsi_compression_mode(ctx->dsi, true);
>>> +		if (ret < 0) {
>>> +			dev_err(dev, "failed to enable compression mode: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +
>>> +		msleep(28);
>>> +	}
>>> +
>>> +	ctx->prepared = true;
>>> +	return 0;
>>> +
>>> +fail:
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	regulator_disable(ctx->vddio);
>>> +	return ret;
>>> +}
> <snip>
>>> +	/* This panel only supports DSC; unconditionally enable it */

-- 
With best wishes
Dmitry

