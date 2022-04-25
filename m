Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D105850ECB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 01:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbiDYXjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 19:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiDYXjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 19:39:35 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF409D4E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 16:36:29 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id m11so8134946oib.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8CYkzLyZNDYyfxPkGfe6LKGFiAIegv8y3Y+39SG6y/0=;
        b=iElhaDiq7666Pe1ltzVcIyHEia/YX/Pc93gZQXu5H76/L7MrqrNRsMlMKCoQWEbulH
         oTBC6SEunGrcGhSMfhUj9r7Tk1YjTxapEgEJPbxbH6QAWfuzFo4pJ/Yr6AGR7CZ2mKvi
         D1GkWs8F2kN0J0jGUUtBQOWmJav+YgbFPXpXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8CYkzLyZNDYyfxPkGfe6LKGFiAIegv8y3Y+39SG6y/0=;
        b=ZsUZeGmC8QOEm+cmH8/UXKrzkFYos3Ckg9FuJx7hnDHcY+a2kSbXSsgwnI7dJlxYrX
         WgQqx3/3GX4aUtoR2H1ts7/gJgWUqrGF42KQcykZW+nrTK3qXseCFksaZI6B8jirm1zt
         xDZfvvESWqDj7sBPEgAxHfBx+mQIjO4uwFpsPTv3R7LE9EZz9sL7d0FtFBg0nofhQnGJ
         cBlpqWBIorkbNjwxZJVhNALgOtYmEd4hVKlZJ7/l49jmdr5Vh+I5jX8WdYRApymQw+Y2
         N+dmbsIhX76Om+rXEkPQaSuerVjHK8oXjgKZNCi5JX7Wt9Sv9mofs9nEKEfnoobxkdT0
         2wEQ==
X-Gm-Message-State: AOAM530i4vuR52l43zg6lsDoVPEoqURlRa60vqkpSupB//rL3BhJwQDv
        WJo4OddVEqiW7xeaAmY6kiABFCCdJOGtuECRzKqOUg==
X-Google-Smtp-Source: ABdhPJwJdLuhTmLM1sAkCD1ZUwA3O1OfcfJESjTRieFzCIvosW4mzYhx+MOJVTCdWblyz/gBvfFcbYY73xTNZt3LZOw=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5575460oiw.193.1650929788965; Mon, 25
 Apr 2022 16:36:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 16:36:28 -0700
MIME-Version: 1.0
In-Reply-To: <1650924663-24892-2-git-send-email-quic_khsieh@quicinc.com>
References: <1650924663-24892-1-git-send-email-quic_khsieh@quicinc.com> <1650924663-24892-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 16:36:28 -0700
Message-ID: <CAE-0n51djgvHx=1CTRUnzeQ2deAPSXFPobET==A4P5N1HTvMaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: reset DP controller before transmit
 phy test pattern
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-25 15:11:02)
> DP controller state can not switch from video ready state to
> transmit phy pattern state at run time. DP mainlink has to be
> teared down followed by reset controller to default state to have
> DP controller switch to transmit phy test pattern state and start
> generate specified phy test pattern to sinker once main link setup
> again.
>
> Fixes: ee35444be0c8 ("drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run")

What commit is this? I think it's supposed to be

Fixes: 52352fe2f866 ("drm/msm/dp: use dp_ctrl_off_link_stream during
PHY compliance test run")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Otherwise,

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
