Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89781841BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 08:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgCMHx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 03:53:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgCMHx3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 03:53:29 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6D3B206FA;
        Fri, 13 Mar 2020 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584086008;
        bh=02M3P2Zxs5dVvaBf5blffcFjm6XvmTXJxXybLj3CmlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pGZ8jwdBNbCtcx1eXL+kgMOZksL+1pN8+mn/JdKV+ybcymsKKqRJQRCJ73n75yfCm
         C92zfrJDEOeV6hpOSLDUh1PxEakVm1+JFcaoDpC+a34RHAfCUUkbBLYSVmPfsCjfP+
         J36sEn1WBdc7pFXNGB/tSGdYErOaN9z1ycPNlJRw=
Date:   Fri, 13 Mar 2020 13:23:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ALSA: compress: add wma codec profiles
Message-ID: <20200313075324.GA4885@vkoul-mobl>
References: <20200313070847.1464977-1-vkoul@kernel.org>
 <20200313070847.1464977-2-vkoul@kernel.org>
 <s5h36ac67nl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h36ac67nl.wl-tiwai@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-03-20, 08:22, Takashi Iwai wrote:
> On Fri, 13 Mar 2020 08:08:39 +0100,
> Vinod Koul wrote:
> > 
> > Some codec profiles were missing for WMA, like WMA9/10 lossless and
> > wma10 pro, so add these profiles
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  include/uapi/sound/compress_params.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> > index 9c96fb0e4d90..634daa354b58 100644
> > --- a/include/uapi/sound/compress_params.h
> > +++ b/include/uapi/sound/compress_params.h
> > @@ -142,6 +142,9 @@
> >  #define SND_AUDIOPROFILE_WMA8                ((__u32) 0x00000002)
> >  #define SND_AUDIOPROFILE_WMA9                ((__u32) 0x00000004)
> >  #define SND_AUDIOPROFILE_WMA10               ((__u32) 0x00000008)
> > +#define SND_AUDIOPROFILE_WMA9_PRO            ((__u32) 0x00000010)
> > +#define SND_AUDIOPROFILE_WMA9_LOSSLESS       ((__u32) 0x00000011)
> > +#define SND_AUDIOPROFILE_WMA10_LOSSLESS      ((__u32) 0x00000012)
> 
> Are the profiles are bit flags, or they are just enums?
> All other definitions are set as if bit flags.

Yup, sorry missed that, will revise

Thanks
-- 
~Vinod
