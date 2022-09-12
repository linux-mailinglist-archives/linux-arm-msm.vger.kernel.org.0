Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682F25B5762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 11:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiILJqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 05:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiILJqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 05:46:52 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410923343C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 02:46:51 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id d189so11822057ybh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
        b=J26G1kaMCpU/huj4irkHRikMR78rM4qjrNcAAA16uuwYo4KHGrkB3MD9z261dObhPe
         FQAde/ufBcq+XuvrIokPHQFZLQMAjc3yw0uWhax38vmOHboiVGCgfafR4ktU0G8or/jT
         EALcdewQZ9sss/15BthDtZ6ymq1psQreDc5PFYlhhOx8jf5yXZdu/Oggf9ZA7Tcr5TKl
         Ip0gx3FfwYUrEW/yCRx5WEK3qg5KoADWFgUY0QVJidOVzWZLI2HAUMdTA8YO14nVTNJx
         SmPGSQVsXoChrCjaH0R55SM2+EYpVcIsSCEUeyPwHxrcMeVshcqPhsdLrNsCvBwoc+Vj
         n8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
        b=0EDyrCd6KVZZ1TPvZ7kmXWkykHju1agyFzbqcGilCVHMK/0lUlMPcqznW/r7qBPHj8
         cMcdbxyJytzIdV5jQAzbQ5wjBUxV+tILv4ZCu9FRZg/k3XZlIf5nWMxMqI2j0/FAZBAJ
         obIVkOLVyPQaVBg7HUqhM/Vkx4GqK+rLG2xIp39Bh+42vsYtF0O3YfG4FlMFpHEq2IMT
         AmwlG+wsrPROZJOpUTL+XBKWozvBVlJIEZdYwH1eljO2ooDiqxkmM85UwriRPNQUw6IB
         8R5YQSF5QwzU1pue9wqcNL7zk7LmDsYewRC6byeHyWjcsemMmitdawDpnS3E/J/M2Z1+
         piRw==
X-Gm-Message-State: ACgBeo11zOie1Db+HkVyVe5ufOMIvCs3ord+jGcuVRq1kUgPQNQEDRh7
        LIhvy4Q1Zll/Kjf3IzkCdRZ6+0M8OBIS05ggn7tZvg==
X-Google-Smtp-Source: AA6agR7RW9+RmdeYJyXDjxjNa3U1UZkW1XIRfbT2VSl9GyvcI1tMz5HBJwbMMG2bNjXo+8COy7PU0giK8+qyA3nCQfQ=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr16075200ybh.288.1662976010418; Mon, 12
 Sep 2022 02:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org> <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
In-Reply-To: <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 12 Sep 2022 12:46:39 +0300
Message-ID: <CAA8EJpopeXeaec8Yhsu-aQsN8j4v74nBZ0TBSz0WHKiwq9f1wQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/bridge_connector: perform HPD enablement automatically
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 12 Sept 2022 at 11:51, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 29/04/2022 21:51, Dmitry Baryshkov wrote:
> >  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> > DRM driver do a proper work of calling
> > drm_bridge_connector_en/disable_hpd() in right places. Rather than
> > teaching each and every driver how to properly handle
> > drm_bridge_connector's HPD, make that automatic.
> >
> > Add two additional drm_connector helper funcs: enable_hpd() and
> > disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> > is the time where the drm_bridge_connector's functions are called by the
> > drivers too).
>
> 09077bc3116581f4d1cb961ec359ad56586e370b ("drm/bridge_connector: enable
> HPD by default if supported") was merged in March, but I think that one
> is  bit broken
> (https://lore.kernel.org/all/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/).
> To get omapdrm work without WARNs we could just revert that commit, but
> I think this series makes things cleaner.
>
> There's one small problem with this series: in drm_bridge_connector.c
> the drm_bridge_hpd_disable() function is called from
> _drm_bridge_connector_disable_hpd() and from
> drm_bridge_connector_destroy(). This causes two hpd_disable calls when
> removing the driver modules. I think the call from
> drm_bridge_connector_destroy() could be removed, as
> _drm_bridge_connector_disable_hpd() should always get called when
> removing the drivers.
>
> Dmitry, are you still interested in this series? Can you rebase on top
> of current upstream, and revert 09077bc3116581f4d1cb961ec359ad56586e370b
> first?

Hi, I've been a bit reluctant to continue this work after the
mentioned commit got merged. However of course I can update & resend
this patch series.

-- 
With best wishes
Dmitry
