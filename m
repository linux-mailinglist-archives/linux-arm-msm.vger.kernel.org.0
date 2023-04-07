Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA756DB0B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjDGQe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjDGQeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:34:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002BDC154
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 09:34:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g19so41984803lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680885260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
        b=Zd3qxX1eMvUbWNHlNFJpQr1IW9sKUSqmV5VO2F6q3ZofrQcEu9R1utBg4mkgi14+Ed
         NmMEyHFk1xPRHx+wbV9I6I/gUBaXp1M8AGbPtKJYCMtryWy3yvSXL3Lh4J8Uh7BHlV33
         y7jxzYBqA93sFwBQF++Dz1QZpW/nAKpe92lBzyAjO7a9A4i8p0FD6lfZ3fV7XH3x6Es2
         DBxtHKdFYaIb7l4T+KSGlb/Vb4mQytUcU2GlB8vjHF3h/VmhJgJ6gbZU6jhU1OB9C+WR
         tPpbF/DEHec62VEnr754lztIaWAHrLYFdc3xK/6D3F7s46kBh0n6tiospMzOHWRQ2fYg
         I9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680885260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
        b=Yijl6HdE7TSwdx852XwPPQ/+eep5NU+3QF2zc/u49izvQ42+AsgKNiyMECCFwOG6Xn
         uKasD6uWOkggllr94PuGgoH84PDUieTWZ4dAJYL9uwnHeTRlMrvaKZjXVjxjl47g8vLp
         tEsxa0aQYAJNzugAo2DTiPfMwQIZIRDcFs0/lwkr1EPmBn1bsRzhmyaO6VgSs9Cqd9nv
         pKAKMsmPn+psuV2pw2UNYW1YPK3Kluk7rhVfI4JxPYgGK2tAziI8Fi/M5mz09WXSg9mQ
         5VS/vrACPjlJHRy0GuE57jFnUxBKZTzkTmKJECbtLCYNo1HZlqvzq7En50hVh8C83YtX
         LXNw==
X-Gm-Message-State: AAQBX9ddFg4NB7xGcZBmiWhH/6EZOiru4BxIBgdFZK9jItkqWWKxETSW
        MWXmv6Y4g37XdDKemXcz40myBw==
X-Google-Smtp-Source: AKy350aeMn+uduz5SM1Q+zIFL1amX8/Z79FODoWr4RrabDEAu57MaCpeRCFE4XzvSXWyJrDeJL/JEw==
X-Received: by 2002:a19:f70f:0:b0:4ea:fdcf:8f62 with SMTP id z15-20020a19f70f000000b004eafdcf8f62mr978422lfe.0.1680885260281;
        Fri, 07 Apr 2023 09:34:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac24850000000b004e817c666eesm774924lfy.193.2023.04.07.09.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:34:19 -0700 (PDT)
Message-ID: <118af32a-c5d8-2c93-887d-8da83779eb9a@linaro.org>
Date:   Fri, 7 Apr 2023 19:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-GB
To:     Mark Yacoub <markyacoub@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-10-markyacoub@google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230331221213.1691997-10-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/04/2023 01:12, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> 
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
> Changes in v8:
> -None
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

