Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0536B7358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 08:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbfISGoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 02:44:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37497 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbfISGoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 02:44:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id f16so2542614wmb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HPKpCYeZt44Wxe7+ROnpucIXUhXx7j6zkak3wJnTo8Y=;
        b=zng02+cP5nw7zeVwoGeTAK4jvStLBmHDSAOTw24ol+HAcD/mu18jlEjITZ7GNpIBec
         TPp85lx07+tFZrfYXvPZ3AXWtb+L9in1XLzfmLhnCL4bO4jmdIZUuyTFUDV05kaCIY/H
         Ig/8+16xlrHJIxmDwIT5MSqPp3+a/Ps3a6MHldQrEZ62Qg0MJ78RFwLDpnPqhFrU/ZVb
         wpL6BloXgF77S+A4I2ANGv05S8NZA0uC12GjmAQMUHGonoGZskio6Erm3B1cP0typbzT
         4MkITGkKE3V3mxW+nlD6/OmBg5MO+kl1Ul7FVTdYBuXz6SxGmWkv5fuHklutiuIDBgCF
         afvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HPKpCYeZt44Wxe7+ROnpucIXUhXx7j6zkak3wJnTo8Y=;
        b=rqLDJxnN8OGFZR4yOLdC+B6ttc0UrfP2eE0cThisfKKfx/niv7BkNkNhNG2QKlhZCU
         hFBrJfEdnX/E5YRUj3QCuzJVzhfGlX4DWC9ZSsDp/M3KknMfmLZtupF3YvKPdDweI3lR
         8fY0I8F+Ay8Ict2o5QXIIlj8ov72gvVMean0xGGPOfRjNHgzClnGqo+PB/2fe/6B4K7/
         DYbOwVVQ3lI3qIfoWdTMuynyLxMkjTJpAqAeVoCBl9cPCdqaMcOMWPQB61PkDrrBvoro
         CQCLdGV3qxs3dYCZiavBJYrQxXdTnWPya8TwRyRDgjlajLIVK0GhuHw55EB3jTFNmjA/
         CmXw==
X-Gm-Message-State: APjAAAUFniJyzUQqK0ny0BoDpBVHtNV1fNvrRT7DTDmqv29XGQMkbyiM
        5JTKIKdN83DwdgD3LHwRYtOutQ==
X-Google-Smtp-Source: APXvYqwPFlMN526NVgaXJ44Kg4v+oAGNcZ10wIgEPPdv5d3XLuCwMsb6MWMCd9ueBzVpwgp142vw5w==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr1480935wmk.150.1568875446177;
        Wed, 18 Sep 2019 23:44:06 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id z1sm15070167wre.40.2019.09.18.23.44.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 23:44:05 -0700 (PDT)
Subject: Re: [RFC] checking drm_framebuffer against config width/height
To:     jsanka@codeaurora.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     sean@poorly.run, 'Sean Paul' <seanpaul@chromium.org>
References: <09ee01d56e9a$a2739380$e75aba80$@codeaurora.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <db26145b-3f64-a334-f698-76f972332881@baylibre.com>
Date:   Thu, 19 Sep 2019 08:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <09ee01d56e9a$a2739380$e75aba80$@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 19/09/2019 05:30, jsanka@codeaurora.org wrote:
> Hello All,
> 
> I bumped into the below check [1] enforced in drm_framebuffer creation which checks the requested framebuffer width/height parameters against the drm mode config width/height limits. As I understand, drm_mode_config: min/max width/height indicate the upper and lower bounds of the display panel (drm_connector) resolutions the DRM device can support. But the pixel processing pipeline can apply cropping/scaling transformations on much larger input framebuffers and flip the buffers within the display resolution. Such configurations are very common and the final resolution will be still within drm_mode_config bounds. So I believe the checks should be relaxed / removed from the drm_framebuffer creation api’s.
> 
>  
> 
> If my understanding is incorrect, could somehow explain the motivation behind having these checks here?

I already reported this a few months ago, here is the log of the discussion :
https://patchwork.kernel.org/patch/10625707/

TL;DR it should be removed but these checks should be moved to control max screen size
in atomic_commit paths.

I planned to fix this, but haven't found time yet...

Neil

> 
>  
> 
> Thanks and Regards,
> 
> Jeykumar S.
> 
>  
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_framebuffer.c?h=v5.3#n303
> 
>  
> 
> *struct*drm_framebuffer *
> 
> *drm_internal_framebuffer_create*(*struct*drm_device *dev,
> 
>                                *const**struct*drm_mode_fb_cmd2 *r,
> 
>                                *struct*drm_file *file_priv)
> 
> {
> 
>                      /* snip */
> 
>  
> 
>         *if*((config->min_width > r->width) || (r->width > config->max_width)) {
> 
>                DRM_DEBUG_KMS("bad framebuffer width %d, should be >= %d && <= %d\n",
> 
>                          r->width, config->min_width, config->max_width);
> 
>                *return*ERR_PTR(-EINVAL);
> 
>         }
> 
>         *if*((config->min_height > r->height) || (r->height > config->max_height)) {
> 
>                DRM_DEBUG_KMS("bad framebuffer height %d, should be >= %d && <= %d\n",
> 
>                          r->height, config->min_height, config->max_height);
> 
>                *return*ERR_PTR(-EINVAL);
> 
>         }
> 
>         /* snip */
> 
> }
> 
>  
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

