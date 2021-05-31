Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3EBE396759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhEaRrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbhEaRq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:46:56 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99CDC0431D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:15:39 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id j1so5117941oie.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iUt8SawagKvadLty0R2egCby5GFPDSWF/2fAwCO1WO8=;
        b=zSw+AuImUIvbaG+SENdRXVf75DqA+hNVwWWi02Rgo5PKBhnn9yMiEm/Wg+C3cPO98Z
         5xUYtifNJieL8Ux014tKJTwJw+Ugqddjje4CcWdzLPEjDUsY9WT8cjxDndQ0RQMPTQLU
         JiQocHzymUCqlCZPZ11qsL9jjzDENFRAgi8Odf4Q32o8QZHyilojAHdcuh712E0L0l4d
         hANoZ5AYFTnj5PEsCDDpNeHWiDeA1+/UVQsLk5NFkRTJC20yBf/y14DOFkBHNrrKpnai
         h7/4HVkdWBoc465yU3Rw0ul5KbwaFjkospDokkNum9mGHwkhhYu/6i70QjOledS2Js03
         yipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iUt8SawagKvadLty0R2egCby5GFPDSWF/2fAwCO1WO8=;
        b=WWds9VI871rGy1HzgOkIlxJE71sHhNJDmhUFQCf0U64ygdRhbsnDozjCsVNRFNF3mD
         efyZAThhTjbMaQ7Y+JY4pzgnYz8WwBc1fKZwZcg6gSMNKGriltUx5WUY7vVtoYlS7AXF
         KKvKp2j6IMGDesIuCuRk9HYkeW5ZhPT2khpWNPelGvN3Vjcia93ndmRojv/YBVM6pVKw
         p3pNWnL2xhqdG+y3EqlnwDa9OoZvk4cj5xmL2brHl9NhWfvePbaDrszocRB2muTzuj+H
         O4tKrPM/IcQdKOM+pzeq9r2pQYEu588cQoJtm1PjiHXKqLhlbI+Yqu2NYz8/mT3UymSZ
         FZJQ==
X-Gm-Message-State: AOAM5337SqPQ913vNAxP0QH5Vx5YOGcdyiLsvsJE+6SZWPOA1a1Kw7a8
        D87qHWTnDqFFrCZ9xfbxvLY4kw==
X-Google-Smtp-Source: ABdhPJyWIyQ2ftS7+5k7U8g5MCX3+iB3x50iEKcUA40a0tLmIrmfe7c3HX3IfCXL7EIIkaYf3pAmtA==
X-Received: by 2002:a54:4398:: with SMTP id u24mr14750888oiv.81.1622481339198;
        Mon, 31 May 2021 10:15:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o20sm3155316otl.2.2021.05.31.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:15:38 -0700 (PDT)
Date:   Mon, 31 May 2021 12:15:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     broonie@kernel.org, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add lable for secondary mi2s
Message-ID: <YLUZuP4F1nPWLY5f@builder.lan>
References: <20210531143557.3975917-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531143557.3975917-1-judyhsiao@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 31 May 09:35 CDT 2021, Judy Hsiao wrote:

> Adds lable for secondary mi2s to allow overriding.

"label" and can you please spell out why you need this override?

Regards,
Bjorn

> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293ef56d7..2027914a0bed 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -772,7 +772,7 @@ mi2s@0 {
>  		qcom,capture-sd-lines = <0>;
>  	};
>  
> -	mi2s@1 {
> +	secondary_mi2s: mi2s@1 {
>  		reg = <MI2S_SECONDARY>;
>  		qcom,playback-sd-lines = <0>;
>  	};
> -- 
> 2.32.0.rc0.204.g9fa02ecfa5-goog
> 
