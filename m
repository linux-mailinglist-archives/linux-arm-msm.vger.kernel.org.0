Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC9C6D3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 20:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391189AbfGRSSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 14:18:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44014 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391178AbfGRSSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 14:18:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3ED6A611D1; Thu, 18 Jul 2019 18:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563473924;
        bh=s2i0fpH51lhrVs4GYLacMeK/1FuA13qFGeXtzi0LvfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cdeOP5hjJ36A34yjs6EJM8AWhARTTfc1guKVbPo5e2a3JZ4GD7KFIM5EJVTtecCbV
         gz1gdnJX8k497gCjSh866cimbv8BOWT18LjL8soOtBeFLqex0aRCYhSnKZUd/1O8M5
         CdSgamIMF5cnLE7jAm2lrBnWcNvDTc/OFiAIVyt8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 983BB6074F;
        Thu, 18 Jul 2019 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563473922;
        bh=s2i0fpH51lhrVs4GYLacMeK/1FuA13qFGeXtzi0LvfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NdFlkuGm3ew8Xa+B05bOJvE2DLw6CM7Ng46KgrHlqglPK4Yu+9c0K55tXKdh0EzuI
         BQ4lLHfotl0ytqrbUPbMamQXsy7nmkRoFSTee5UnOU71j/wpoga5OHyGk1bg4aPzYB
         NiV6kj1NlrPiIgQRR1ETbRQJo5r+jkcwoUqrFX+s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 18 Jul 2019 11:18:42 -0700
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@gmail.com, pdhaval@codeaurora.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
In-Reply-To: <20190716090712.GY15868@phenom.ffwll.local>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
Message-ID: <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-07-16 02:07, Daniel Vetter wrote:
> On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
>>     Hello All,
>>     	drm_mode_modeinfo::flags is a 32 bit field currently used to
>>     describe the properties of a connector mode. I see the least order
> 22 bits
>>     are already in use. Posting this RFC to discuss on any potential
> plans to
>>     expand the bit range support of this field for growing mode
> properties and
>>     ways to handle one such property needed by the msm dpu driver.
>> 
>>     msm drivers support panels which can dynamically switch between
>>     video(active) and command(smart) modes. Within video mode, they 
>> also
> support
>>     switching between resolutions seamlessly i.e. glitch free 
>> resolution
> switch.
>>     But they cannot do a seamless switch from a resolutions from video
> to
>>     command or vice versa. Clients need to be aware for these
> capablities before
>>     they switch between the resolutions. Since these capabilities are
> identified
>>     per drm_mode, we are considering the below two approaches to 
>> handle
> this
>>     use case.
>> 
>>     Option 1:
>>     Attached patch adds flag values to associate a drm_mode to
> video/command
>>     mode and to indicate its capability to do a seamless switch.
>> 
>>     Option 2:
>>     drm_mode_modeinfo can expose a new "private_flags" field to handle
> vendor
>>     specific mode flags. Besides the above mentioned use case, we are
> also
>>     expoloring methods to handle some of our display port resolution
> switch use
>>     cases where the DP ports can be operated in a tiled/detiled modes.
> This
>>     approach will provide a standard channel for drm driver vendors 
>> for
> their
>>     growing need for drm_mode specific capabilities.
>> 
>>     Please provide your inputs on the options or any upstream friendly
>>     recommendation to handle such custom use cases.
>> 
>>     Thanks and Regards,
>>     Jeykumar S.
>> 
>> Jeykumar Sankaran (1):
>>   drm: add mode flags in uapi for seamless mode switch
> 
> I think the uapi is the trivial part here, the real deal is how 
> userspace
> uses this. Can you pls post the patches for your compositor?
> 
> Also note that we already allow userspace to tell the kernel whether
> flickering is ok or not for a modeset. msm driver could use that to at
> least tell userspace whether a modeset change is possible. So you can
> already implement glitch-free modeset changes for at least video mode.
> -Daniel

I believe you are referring to the below tv property of the connector.

/**
  * @tv_flicker_reduction_property: Optional TV property to control the
  * flicker reduction mode.
  */
struct drm_property *tv_flicker_reduction_property;

Sure. We can use this to indicate whether the connector representing the 
panel
can support the dynamic glitch-free switch. But when the panel supports 
both
video and command mode resolutions and such glitch-free switch is 
possible only between
video mode resolutions, we need per resolution(drm_mode_modeinfo) 
information
to identify the resolutions enumerated for video mode.

Below is an example of the compositor utility function which can use the 
tv_flicker_property
and the proposed modeinfo flags to identify glitch-free switches.

  bool is_seamless_switch_supported(struct drm_mode_modeinfo src_mode, 
struct
                  drm_mode_modeinfo *dst_mode, bool 
flicker_reduction_supported)
  {
          if (!flicker_reduction_supported) {
                  printf("flicker reduction prop not set for the 
connector\n");
                  return false;
          }

          /*
           * Seamless switch(if supported) is possible only between video 
mode
           * resolutions
           */
          if (src_mode->flags & DRM_MODE_FLAG_VIDEO_MODE &&
                          dst_mode->flags & DRM_MODE_FLAG_VIDEO_MODE)
                  return true;
          else
                  return false;

  }


-- 
Jeykumar S
