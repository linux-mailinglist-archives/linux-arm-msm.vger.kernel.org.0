Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4E41961B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 00:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgC0XC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 19:02:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46003 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727732AbgC0XCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 19:02:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id o26so5292146pgc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pko9nAhDt6mwlgRfyc6XKtINQbmF/ebYK6c/ZMMljOI=;
        b=wDv27M1cr1T04ee69Hy1SrhA+XbdaY3eDftXg2xB8lJQ8inMOhdeEXNJXrEo7q7t3t
         6eB9zC8/Bv9mLJ2bOewXKTZ2FkwX64sHSQPnYtvFoLj3WC2vPLJHxv4pPOXi3nodaSqs
         A94S3RD7J4kxfu7L3w+pl6x+HKDrV2M6vOWGZjfiXENOjFzAN/7ncjOC36Y72p99DEF7
         QZXYRKrTMl7vlATbTTVdSjSNYb76CqTou39S/h0lGX8LIJGloZ4sglWuDm32ljv0HURf
         IIVnTU0FzO+NSXPtkboaIM7yz80aPuDUQD424YANs9bLogatUBmIYjXG/XZ0fRlPvmfB
         xRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pko9nAhDt6mwlgRfyc6XKtINQbmF/ebYK6c/ZMMljOI=;
        b=b7yd2Y0F3KSVMBhwgPQ4kW6SMjAbev2nA0mM49Pv1V8G2p7MpfVxEcN/mk2ttu6qPy
         RPbn4IC4vK3CKhrxeG5kIqJDaGLLizQNp64gb9Y7iwOyaQ1L9HGCW74Dq3BtpcGgaDgS
         W3dDLuienTi8dm7LJFa/sPAogpkP3aa0Di195zEbxu1q50HbisPx9O0FRJjIhryynnXm
         cnoym+OH7vPw32w3Jjy47E29czvZHWYVCJuLZ1V3uw1/+ZJtdEisJMgSQBzdPt84eWl9
         hk/FLIML6P2TZUE7CZT+rTFR2vinPZ9A4JYUH/qlGSpLsiuwbNJS8eiLN6oOpU7k3h0k
         p9Kg==
X-Gm-Message-State: ANhLgQ38B9RvqWycLJlwMroAvD2nckbE9WRej+OJIyor8tbIGu+gdSXa
        8Ss07bKCf8nTNbqP5DeqARO9FQ==
X-Google-Smtp-Source: ADFU+vsjmqswulmh3XPk28yPydYs/4jXf/b13hstJ4o6GS/qxxeJWxQ8s40fIIu+VnhFkLkIkKOoHg==
X-Received: by 2002:a63:161e:: with SMTP id w30mr1655585pgl.110.1585350144395;
        Fri, 27 Mar 2020 16:02:24 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y142sm4983301pfc.53.2020.03.27.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 16:02:23 -0700 (PDT)
Date:   Fri, 27 Mar 2020 16:02:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V2 1/8] interconnect: Add devm_of_icc_get() as exported
 API for users
Message-ID: <20200327230221.GK5063@builder>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 13 Mar 06:12 PDT 2020, Akash Asthana wrote:

> Users can use devm version of of_icc_get() to benefit from automatic
> resource release.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/interconnect/core.c  | 25 +++++++++++++++++++++++++
>  include/linux/interconnect.h |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 2c6515e..f5699ed 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -350,6 +350,31 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
>  	return node;
>  }
>  
> +static void devm_icc_release(struct device *dev, void *res)
> +{
> +	icc_put(*(struct icc_path **)res);
> +}
> +
> +struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
> +{
> +	struct icc_path **ptr, *path;
> +
> +	ptr = devres_alloc(devm_icc_release, sizeof(**ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	path = of_icc_get(dev, name);
> +	if (!IS_ERR(path)) {
> +		*ptr = path;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return path;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_icc_get);
> +
>  /**
>   * of_icc_get() - get a path handle from a DT node based on name
>   * @dev: device pointer for the consumer device
> diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
> index d70a914..7706924 100644
> --- a/include/linux/interconnect.h
> +++ b/include/linux/interconnect.h
> @@ -28,6 +28,7 @@ struct device;
>  struct icc_path *icc_get(struct device *dev, const int src_id,
>  			 const int dst_id);
>  struct icc_path *of_icc_get(struct device *dev, const char *name);
> +struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
>  void icc_put(struct icc_path *path);
>  int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw);
>  void icc_set_tag(struct icc_path *path, u32 tag);
> @@ -46,6 +47,12 @@ static inline struct icc_path *of_icc_get(struct device *dev,
>  	return NULL;
>  }
>  
> +static inline struct icc_path *devm_of_icc_get(struct device *dev,
> +						const char *name)
> +{
> +	return NULL;
> +}
> +
>  static inline void icc_put(struct icc_path *path)
>  {
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
