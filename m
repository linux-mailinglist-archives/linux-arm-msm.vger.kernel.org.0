Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865316397FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 20:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiKZTEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 14:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiKZTEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 14:04:22 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1267615FCD
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 11:04:21 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id z4so8696022ljq.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyzwzT+WwrFM+CjpxBOrQdYctaWDznQ/WphWUZdPKsE=;
        b=n3nGOfkJIEMRNu8dMrJylxK8dzsUovN1mC5QFI3zH5t+97fR/wumj6LMMVM6+4tkBe
         jOYlQ2hlJl1VLwtPTv2z/q7E8VW73XihCAsLWlEV4xiLcCS8pCJefjd8hAdUjwE8TLC/
         vAR6LBXalz/tV4Rs7X9J5Hql7rBYy+1Ii3ZLes5v8dEyGjcGwjBZwGQQdzeo3CvQno/Z
         9eyYfEVKFZGrk4HfsLkCxMx4gqq+0e9++MUWFFk+ldbahSEfDr377gar1g7a+h43BkoB
         KMsicWCZWwuZp3h15mwp0G9EbXTitYnqV11GImesDkm90fWU7kSSFi+IoGgDv6AxGco/
         HgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyzwzT+WwrFM+CjpxBOrQdYctaWDznQ/WphWUZdPKsE=;
        b=BJE5GzcgSv6dKEj89DuvfIX+OnwGDQB4u/+s67LZBIwGaf8QqfaeUWs6rb+IwWan8i
         IDTQxUio2dFTiLlJEMv7y63rjF7DwVReKVo6p3AuS+QVGAoW9q/JXMGM3YtEh540K/VN
         TR9hiC3cR8Il6DehRUzZp6M2RtT5RyG4pnVIhfnTziA6sk1XojGbTuzKmSxFyjt/LPxC
         mqACaK02zCAd+0E4auGRGdLupyPjKZQI3l3Fjlvq8OC1rH/0vt+4gYSRDFRCLSHk2+/l
         kg7V0sDpcr5KX8oHsozOu0vT3QUmjgw28hrqUzgEwdZRATlkyE6TOckDYI1ZkKmNfnwS
         SbsQ==
X-Gm-Message-State: ANoB5pl9n8kGfiXI7OHKPD31q1v1Bn/Kv0Dh2CCPGESY7tsT4loFOysK
        yc9t4PxaY5ChFn7V91VQwJepYw==
X-Google-Smtp-Source: AA0mqf5hYsw/4JWIgSJ6mGIhPRCDka2xGpUjs6SqX0VHzgleUdx0I+5zjhfK7HRUzLuORnTrW//xiw==
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id i28-20020a2ea37c000000b0026e0093980dmr15258413ljn.488.1669489459446;
        Sat, 26 Nov 2022 11:04:19 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f44000000b00492b494c4e8sm1002101lfz.298.2022.11.26.11.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 11:04:19 -0800 (PST)
Message-ID: <65824eed-d988-2de6-5fd1-380aec116d13@linaro.org>
Date:   Sat, 26 Nov 2022 21:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sdm845: Add compat
 qcom,sdm845-dsi-ctrl
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-18-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-18-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm845 against the yaml documentation.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

