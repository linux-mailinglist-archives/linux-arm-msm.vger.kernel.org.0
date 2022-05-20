Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5704152F449
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350636AbiETUO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238561AbiETUOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:14:24 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E4A18540A
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:14:24 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id s188so7395894oie.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
        b=L5wdilZPPhLeZ6H9txo7C+yQMMnJoaeLu6EewH66Q73sZn7CgIshPVfGQt58p2T1rF
         z7QeS2uLJnC624MbM5zt8fBPnBh+VHRq7OO8RY0kOqZapAwf1WxaNEnVe9wSh6nhfAU1
         u6lKg8SoY9PqpD/V98ioNwwwLlmY/2daDSeTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
        b=T9bf9Oq2at6MiRtbycI9V8pvyPudu0qbc7jhPFIbwloTsC0dFaR5gl4OlnOH2jJpps
         C4daIkeZTUns84WD2H0oS26vw594xSfRpOjF4fN0+42psdeY49kH/2ZMZPl21rF+1UZA
         L25YkjBv/WWFBuy1WHzebttRhM3oxwEV+7Dz4h4w6RotBM0FGcGcu6KJfA0t3+yQ06r2
         /aA63ZBodNL9fSyOwNgqw4L6o9d61wX9aHoqVDRdKnzifsn4LqzDoPp7pf6duRHBQ5ez
         KM0aUC326967t6mwFusslzLtU7z0X2JbxuFFUQ+dUix0v+6mzVDBeRezg/fAck02f8qU
         VE2Q==
X-Gm-Message-State: AOAM533+WqsBW+ayuyK6LEL9Soge+3cGOfeHIjrWaB6qqFaOryz0crf3
        NWxpYTky/ra0bA8lsCVt55XctePhB3WoSq5AvdgFZQ==
X-Google-Smtp-Source: ABdhPJwP7L0SMXKFI6625vEQZTfFfECarUErW2tlmkzH+D2As2PkcfrO1Fh8376ZDCpcT7+qRqUbX8ACus/aB+6rZHQ=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr6601653oib.63.1653077663519; Fri, 20
 May 2022 13:14:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:14:23 -0700
MIME-Version: 1.0
In-Reply-To: <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653077167-16684-1-git-send-email-quic_khsieh@quicinc.com> <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 13:14:23 -0700
Message-ID: <CAE-0n51B3Crb0ZFUppu2MXAGfCEfRcO9FX-6KMTTcPia3w8TkQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-20 13:06:05)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..0b7f318 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */

Why aren't there checks for errors on these API calls?
