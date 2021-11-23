Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8148745AE1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 22:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbhKWVSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 16:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbhKWVSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 16:18:38 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55C2C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 13:15:29 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso817655otf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 13:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3d/ATowUzU0RGedrbA1wKGLdcmsuRu2s2Mj0pamUwcQ=;
        b=CgGj9XKSU0c7O6da0yfwMd6iOFHkPkzVDAUQWXHqUVzACNQJ9NloXpdlWVjm6v+KOa
         IIV7tUdut5PCikbjvlgVKD5x9YIB5DYIvfgw5LRtrfV3vNIOplZY54V1Wn38ZFsCug1t
         +NXkriC7bPwnEy6BfSptikxv6tEvlI7cEVlsZk7egi5w1BxarFlJaZLxRt3cKT18A9rc
         N6ITt59mICXyjgpB3liD2QcB+BX7+4tLMelGpDdoJDxc/JC+1gtZ5eTF2KducigMAHAN
         4DiXRk+CxnDbO+EzeZLyLz7n3Z+kQ/3DDmqpnztx3vMxHEXxfi/hO3ut3/Q7Otzb0tzL
         SnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3d/ATowUzU0RGedrbA1wKGLdcmsuRu2s2Mj0pamUwcQ=;
        b=w3jeNL51lTq5mISh4yX5MrfjPUqTwrAfDNwp4d2Yfa8GA9+k1bY2t4hPwbf3JwfMQa
         Js+dyJ589At8xgAeQ/ANTd4+FeaddHe1ZYlH3+yOoQXScaLWfNLHfGeek6Z6Ch3ephk8
         aDNmOcXpPC+hgwXs6E0aMLNTpnUFoPxJyu/2SVqFu4Q7LUICG8yJ8LIQbwhkzC6CnvBN
         sanLtVQLG2j/gycUPCcn3xas87kc8EXDbpkHdnpNL8vv7necF/0OFTCC1iRUmfNH7ZFP
         zIfTxtsNhNI06OJqzNdOv3q/1wl9Wl9/+Bhnz9M4eOUoAqlTN5U3pERjk+YnZip+pnv9
         VW1g==
X-Gm-Message-State: AOAM532ngHYy+vW+8L0ySxMt0rwcTApPVo7xuqwa6B4GBJK80pYZRqFr
        emOSALbZyvkvAlH08PNuStIbVw==
X-Google-Smtp-Source: ABdhPJwv8DGRODI4dMmBdwYWgvLpUeoE/yWyLAmjVDluVmRYl/HHeWeud7p1VO26Opw2XEOB3P1QmA==
X-Received: by 2002:a9d:6484:: with SMTP id g4mr7525433otl.221.1637702126592;
        Tue, 23 Nov 2021 13:15:26 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m3sm2429935otp.6.2021.11.23.13.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:15:25 -0800 (PST)
Date:   Tue, 23 Nov 2021 13:17:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add more of the INTF interrupt
 regions
Message-ID: <YZ1aVJLcoCEzV5p0@ripper>
References: <20211123154050.40984-1-bjorn.andersson@linaro.org>
 <d1edfe2c-87eb-ec3e-a145-8466bf0f3265@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1edfe2c-87eb-ec3e-a145-8466bf0f3265@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Nov 12:54 PST 2021, Abhinav Kumar wrote:

> Hi Bjorn
> 
> On 11/23/2021 7:40 AM, Bjorn Andersson wrote:
> > In addition to the other 7xxx INTF interrupt regions, SM8350 has
> > additional INTF regions at 0x0ae37000, 0x0ae38000 and 0x0ae39000, define
> > these. The 7xxx naming scheme of the bits are kept for consistency.
> > 
> More than consistency, this is because both sc7280 and SM8350 use MDP's
> 7x hw version.
> 

Aha, didn't connect the dots.
Thank you for the clarification.

> Otherwise,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Thanks,
Bjorn

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 18 ++++++++++++++++++
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  3 +++
> >   2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index d2b6dca487e3..a77a5eaa78ad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -30,6 +30,9 @@
> >   #define MDP_AD4_INTR_STATUS_OFF		0x420
> >   #define MDP_INTF_0_OFF_REV_7xxx             0x34000
> >   #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> > +#define MDP_INTF_2_OFF_REV_7xxx             0x36000
> > +#define MDP_INTF_3_OFF_REV_7xxx             0x37000
> > +#define MDP_INTF_4_OFF_REV_7xxx             0x38000
> >   #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> >   /**
> > @@ -110,6 +113,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
> >   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
> >   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
> >   	},
> > +	{
> > +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
> > +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
> > +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
> > +	},
> > +	{
> > +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
> > +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
> > +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
> > +	},
> > +	{
> > +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
> > +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
> > +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
> > +	},
> >   	{
> >   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
> >   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > index d50e78c9f148..1ab75cccd145 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > @@ -26,6 +26,9 @@ enum dpu_hw_intr_reg {
> >   	MDP_AD4_1_INTR,
> >   	MDP_INTF0_7xxx_INTR,
> >   	MDP_INTF1_7xxx_INTR,
> > +	MDP_INTF2_7xxx_INTR,
> > +	MDP_INTF3_7xxx_INTR,
> > +	MDP_INTF4_7xxx_INTR,
> >   	MDP_INTF5_7xxx_INTR,
> >   	MDP_INTR_MAX,
> >   };
> > 
