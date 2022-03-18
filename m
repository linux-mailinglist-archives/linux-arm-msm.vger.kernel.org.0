Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBBA4DD194
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiCRAFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiCRAFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:05:36 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801D4267FA8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:04:19 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b24so8432029edu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
        b=EFcmlZxQVZdmxurMBWghVQOI5rZtJ0CxcvzDKkyvCNRIWyFwEOG91za76YnKwGchla
         Xi1Ive9X2CNoEOSbIUFvrIcLnuG6Q+OgBvCxMMKcrkX44zbHB52V5RMw7092LSlqV/aZ
         uYlseCKaHPm8mppiKMXEDwWCFGJNFOGF5bHgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
        b=HVPLwVkHTLaJxROBR3RIpxaV5ANdOPDmeOp1UPSeiC4E+wjtvBA7a+3QbWYR3lROAT
         WdcyAs6WmLt0VVPZGvKpnQyaHpJN59R6t1vbCK/XjylmiVky1BZJEbkRCyx6SWCsjwxc
         6gX2kJMnANlRutMvyQHRCCCZE+Vyg7pHB0gDL8BkB7aVylVETijqg+f4wpp3Xt4W/ig5
         MHQhzflSJvU8b7kbsW6wh2pX6AtQep6jFL+R0/xosOtNIrYKtwMGQ3/ddq2ME1vL0kyT
         9cDF4oebRquHPd+CeKX/U50QoO4Z7KP8SLGFV5Bfnpb75a/Kk6OQasE8MPubNDLydONr
         I2ig==
X-Gm-Message-State: AOAM531EjmSffL8vse0WMT+73tCM3p7ynhTap9HciYClOniVapviB565
        1SmONhi59voIeYUP+aaqVPqyziQ4+vPxeA==
X-Google-Smtp-Source: ABdhPJwwldMBmDQqQgtncEAmZv9xB5FkR17FBQyGGEBWn2h8RmNieB4KqN70hYyNXvDY34rsq95r8Q==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id j7-20020a509d47000000b0040f9d3d97b6mr6932840edk.392.1647561858123;
        Thu, 17 Mar 2022 17:04:18 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id hg11-20020a1709072ccb00b006cee4fb36c7sm3035459ejc.64.2022.03.17.17.04.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id h23so9006435wrb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3705265wrw.422.1647561857230; Thu, 17
 Mar 2022 17:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com> <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:04:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] drm/panel-edp: add LQ140M1JW46 edp panel entry
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 16, 2022 at 10:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add panel identification entry for the sharp LQ140M1JW46 eDP panel
> with power sequencing delay information.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This is trivial and going through a different tree than everything
else, so I'm just pushing it to drm-misc-next (which is setup to land
things without regard to the merge window) without sitting on it.

You can leave it out of future spins of this series.

9f493fd71d4b drm/panel-edp: add LQ140M1JW46 edp panel entry
