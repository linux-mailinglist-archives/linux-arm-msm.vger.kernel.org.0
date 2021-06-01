Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8558397768
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 18:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbhFAQDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 12:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbhFAQDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 12:03:14 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B00C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 09:01:31 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u11so15957143oiv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ivRylvAoXWYGi0EX7Wjf2GRwNOYBh6koZn9LtD0Oi0o=;
        b=mMMV4R4HRszVvRwUR34BU3fHfE9s3UWX21Hr5qVyKvNQkEPMtyvT+NnetgjSbY7nzN
         z9z7J+Vgy2hXQy3pEZ5TPVNrTP3R2YOSlXVdWVejfQydgwr6/DFIfNddtZocX+UCMM3w
         DgXEydpN+gflCCpGcM5ZuRmbvpOQM631lPM+8FzhXy83Gw5WyZtXFP7L9B96a/2i1b7U
         40P6xYNMb1GOmbW2abbTVEkaZX7C4+dBaPOrMt1DsbxSnqqzqhoenH3qNmzLBymB+Sbe
         AV7rL1NTA1GUTLzqVMIj+uqYfx1xX0NwigiJBSBrPt0q2QdnHWHir/omT1KGV0wktkFF
         Onvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ivRylvAoXWYGi0EX7Wjf2GRwNOYBh6koZn9LtD0Oi0o=;
        b=uDRthlzDSjMQzTzMWuOyUEe7mzD6WMAJYX5SluZaHJmTJ3MQsRpOFBEHwsb4qcHkHn
         CcJqQ8PZ2G1rpPzNRKyykic4GJ71j7DxXMJQgBsQdnCLBMc8OSk7tFxZOzZo/oThb4ME
         jwLsQcQ8wl/1O7FZF8ed9kOIZ3/j589jx8jGcFXodv1q47koDB7uG0opMFJg7UotT3+u
         +9D5BRYTkImiPlUzfsLyKFhadbXz1Hs908W21ZBC0WjFJdoXmf+vPxuHLSRILTap1JvB
         obNnDivGLVigQMEmAjnNpHaD4qe66IBQrisvTpt3lL3Qu24lyqdjaikf7LDluYU8zxu0
         3BsA==
X-Gm-Message-State: AOAM532g3UkCpxJ9rrLZ3CLtiT8JGhHSjyGtjkwgiKNJ6Y4yaYMjeQsD
        5HvGs9E581EswNl02qL1wMOrEA==
X-Google-Smtp-Source: ABdhPJyiEYPb4B5zl9mHjhnZ9gz3r5vQbpvCP9o6iAbqLjQr9URkhGGUDiwBJYlNnBWlsssskP8PoA==
X-Received: by 2002:a54:4e87:: with SMTP id c7mr464614oiy.82.1622563289363;
        Tue, 01 Jun 2021 09:01:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l20sm3417058oop.3.2021.06.01.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:01:28 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:01:26 -0500
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
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add label for secondary mi2s
Message-ID: <YLZZ1iEGwkpcQUo7@builder.lan>
References: <20210601022117.4071117-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601022117.4071117-1-judyhsiao@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 31 May 21:21 CDT 2021, Judy Hsiao wrote:

> Adds label for MI2S secondary block to allow follower projects to override
> for the four speaker support which uses I2S SD1 line on gpio52 pin.
> 

That's much better, thank you!

Regards,
Bjorn

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
