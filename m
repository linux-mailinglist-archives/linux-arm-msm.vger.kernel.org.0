Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF1F659A68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 17:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbiL3QMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 11:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3QMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 11:12:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFC31BEA2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:12:21 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so32255412lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBbD6UJxbg5TeHZvm6bxZJed/H/TqNWwFVXvTuH++oI=;
        b=YuGLUyTlg0z3sWXGPKIe87R6tClSoUEotXhn0yxmvxF1WcLoL8KDnAa7iMezRL1VR0
         KrTpcFUnzEspHqJXyiuxm+bwvdj7qHL7fJQMRNjQZevRHtNOF+1Kmia0zBfGjucqC8ci
         xKp0AfwHXUYK8+JbwDiXz6tG2tgv1NLYCiBNOQ/FOXNM/3eFm/rK2aXujZAN96HdnTll
         Snl8z4QWDYjygcR45jTCNZANm3cFsHOxdZA/VpGnj2DvlnPvit5MA7w/zU9XV+1q2jva
         ZRNYowto8UFSOg8JsWDNgoTBaTF9rp6B2bGxRCMmP2q6QJDaVpBs77VWXmG5USPRTQeT
         jrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBbD6UJxbg5TeHZvm6bxZJed/H/TqNWwFVXvTuH++oI=;
        b=Exz838S50o3JWv9r2N1wbOhgA05ELCqNqpK/OuarvqHP8v8RRhN6msDKnfpSSYtvn4
         /+ft4iKM1uLQkoC3K+4DGG9lGOwMzVqJoa40WG5u3pl5KtTEvM8PaIhGiITWEGQCaQwg
         0EGEbq2fjLOqt3paxxPjo6hVDMcWfn43f6dyagq+72pZ0Um+li93wWcTrnOpg611K6sX
         Tz7slek2nKdGzIZdTVnfXvKEMF63sPqHy1HgWssbUioqTQdLlbvB9wpWaHr7LOJoSz65
         ccu064YOK3YdHcVoMUopyo+FFLTCdlB/18nq2qWRBaszfR/jaUakfcRX1agEEh4EsItj
         fv2w==
X-Gm-Message-State: AFqh2kqv8Bald5p54fa2L74hmxjQB2h197tC4Wa5h76MS+fkCVmBefOH
        XEA7REYphGVSI0LCtlKFP27ugg==
X-Google-Smtp-Source: AMrXdXtvYA8wjxT8SRcJt+MfkDiV6OP17b2Fh0czUZwLZzNjAkGXbZD61rZlVwh+ZeU9wafo9PeAeA==
X-Received: by 2002:a05:6512:4015:b0:4b7:31c:7779 with SMTP id br21-20020a056512401500b004b7031c7779mr10401585lfb.4.1672416739493;
        Fri, 30 Dec 2022 08:12:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o22-20020a056512051600b004a44ffb1050sm3509314lfb.171.2022.12.30.08.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 08:12:18 -0800 (PST)
Message-ID: <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
Date:   Fri, 30 Dec 2022 17:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@gmail.com, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, quic_jesszhan@quicinc.com,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230153554.105856-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 30/12/2022 16:35, Robert Foss wrote:
> Use two interconnect cells in order to optionally
> support a path tag.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

I think you need to rebase to include:
https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/

On which tree/revision did you base this?

Best regards,
Krzysztof

