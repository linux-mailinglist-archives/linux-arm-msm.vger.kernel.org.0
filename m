Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7957BB22F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 09:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjJFHdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 03:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjJFHdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 03:33:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C904DE4
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 00:33:15 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so16362625e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696577594; x=1697182394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:reply-to
         :organization:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igBVYuYeU6Z/6Ww2yei9L3lDx8aWMI/z7rQ7x2JaBS8=;
        b=QzN67j9Ula5ePtLFup5FMf3wOxOMU9ASLEs8KoLEeEPuu+URVu9V9GMM6livfAREAx
         Ow2mKziaK5Sz0kFLPtWiegNmDkjELAHgSdHj22j7Hi0vhVLiiT+mpnW94OlM6mB3/Gnu
         1QNoNMqku1y/F5YA7UMPVezTjlvmelpYnkGEVjOfX/Nzi3sd+vmMwFdlxgtekdExxCY7
         dD+wJQJaTBbphPxq1hGhyRbeLwTB9paGMu10FjJ0MTlXgCyb3rLGRgqcfZJbREjZa/Uf
         YScejQGR1g+mneHeAQEBpY4OQUavm/tti+wopQMIiITMiRm1e47CPT3PRUB0+ZNZzsFu
         t/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696577594; x=1697182394;
        h=content-transfer-encoding:in-reply-to:autocrypt:reply-to
         :organization:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igBVYuYeU6Z/6Ww2yei9L3lDx8aWMI/z7rQ7x2JaBS8=;
        b=Ui+1TbUhXarVIpFfnrOGyZTrCnFZSXdAM9cp0D8zrBdo+iUA9FKGU0p90Rh9TQKe8a
         QJHPsI1dMpB42hkkFUEuqwtwu+OEvDcFU43WrfneWJWpPAoZgXwJcWVbT7XiYPf/QOLo
         VmjA31P7fiKkD19qIB6h/9x43T+nQ5gsU3aDQyposaPyCibhmni515Q86SgF2C915oNn
         LivY9HtZb5NnFXvGmrNYRGXgBlahBXht4i1yvyerIvJabS03aSnPr92njKyXfr8he/FQ
         OnGherfNrV4pxxTdwnJIyxl+stsuv4bZEmFPv5VYDj9bc9kS9LJDw55TvnP4uY05Fpmj
         cX1Q==
X-Gm-Message-State: AOJu0YxjlzgyFm6QvVxww6AFbSJ/Prf03TUp+R5CLyWLdHfvBhrC1Nrm
        lr7OSS9Avv96C0+QaMncdvKkzg==
X-Google-Smtp-Source: AGHT+IFBaGjdHqQusz+QfpIanXT6nugFKblX9KIqp0YD7q5Pc87iWPJ41fVUct4hYmP6ZqkzVCt+dQ==
X-Received: by 2002:adf:e507:0:b0:324:8536:f582 with SMTP id j7-20020adfe507000000b003248536f582mr6709679wrm.27.1696577594172;
        Fri, 06 Oct 2023 00:33:14 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b003197b85bad2sm974445wrq.79.2023.10.06.00.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:33:13 -0700 (PDT)
Message-ID: <825983dc-9a41-4222-8d9c-cbadf25f54d5@linaro.org>
Date:   Fri, 6 Oct 2023 09:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/encoder: register per-encoder debugfs dir
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
 <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
In-Reply-To: <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2023 03:53, Dmitry Baryshkov wrote:
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/drm_encoder.c  |  4 ++++
>   drivers/gpu/drm/drm_internal.h |  9 +++++++++
>   include/drm/drm_encoder.h      | 16 +++++++++++++++-
>   4 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2de43ff3ce0a..cf7f33bdc963 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -603,4 +603,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>   	crtc->debugfs_entry = NULL;
>   }
>   
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +	struct drm_minor *minor = encoder->dev->primary;
> +	struct dentry *root;
> +	char *name;
> +
> +	name = kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
> +	if (!name)
> +		return;
> +
> +	root = debugfs_create_dir(name, minor->debugfs_root);
> +	kfree(name);
> +
> +	encoder->debugfs_entry = root;
> +
> +	if (encoder->funcs->debugfs_init)
> +		encoder->funcs->debugfs_init(encoder, root);
> +}
> +
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +	debugfs_remove_recursive(encoder->debugfs_entry);
> +	encoder->debugfs_entry = NULL;
> +}
> +
>   #endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 1143bc7f3252..8f2bc6a28482 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -30,6 +30,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
>   
>   /**
>    * DOC: overview
> @@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
>   	int ret = 0;
>   
>   	drm_for_each_encoder(encoder, dev) {
> +		drm_debugfs_encoder_add(encoder);
> +
>   		if (encoder->funcs && encoder->funcs->late_register)
>   			ret = encoder->funcs->late_register(encoder);
>   		if (ret)
> @@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>   	drm_for_each_encoder(encoder, dev) {
>   		if (encoder->funcs && encoder->funcs->early_unregister)
>   			encoder->funcs->early_unregister(encoder);
> +		drm_debugfs_encoder_remove(encoder);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ba12acd55139..173b4d872431 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -189,6 +189,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
>   void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>   void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>   void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder);
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
>   #else
>   static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>   				   struct dentry *root)
> @@ -222,6 +224,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
>   {
>   }
>   
> +static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +}
> +static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +}
> +
>   #endif
>   
>   drm_ioctl_t drm_version;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 3a09682af685..977a9381c8ba 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -60,7 +60,7 @@ struct drm_encoder_funcs {
>   	 * @late_register:
>   	 *
>   	 * This optional hook can be used to register additional userspace
> -	 * interfaces attached to the encoder like debugfs interfaces.
> +	 * interfaces attached to the encoder.
>   	 * It is called late in the driver load sequence from drm_dev_register().
>   	 * Everything added from this callback should be unregistered in
>   	 * the early_unregister callback.
> @@ -81,6 +81,13 @@ struct drm_encoder_funcs {
>   	 * before data structures are torndown.
>   	 */
>   	void (*early_unregister)(struct drm_encoder *encoder);
> +
> +	/**
> +	 * @debugfs_init:
> +	 *
> +	 * Allows encoders to create encoder-specific debugfs files.
> +	 */
> +	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
>   };
>   
>   /**
> @@ -184,6 +191,13 @@ struct drm_encoder {
>   
>   	const struct drm_encoder_funcs *funcs;
>   	const struct drm_encoder_helper_funcs *helper_private;
> +
> +	/**
> +	 * @debugfs_entry:
> +	 *
> +	 * Debugfs directory for this CRTC.
> +	 */
> +	struct dentry *debugfs_entry;
>   };
>   
>   #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)

Looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll need a core ack to apply to drm-misc with patch 2

Neil
