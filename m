Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A7539AF3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 02:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFDAyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 20:54:32 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:39764 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFDAyc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 20:54:32 -0400
Received: by mail-lj1-f173.google.com with SMTP id c11so9412255ljd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
        b=JOmB2bGuNQSVZesELXq7kgWG5GtOYXhL8kI/x3kQrNHvB7/M6fmmDaKhhsnlOeywzR
         pUWUYbqF8f/aZ27tG2QiZSg793i3bBd89UkP2aCQMm5cKEQE5LRgha9N8azIYpZ8EnMA
         Q932dDMGQt4UMgB1aq/XdlGEPRXTXr6HdmazmGBQ0P5LYdc8lP9NKZngQMYq51XpNB9r
         O6uX2Tb3t4YL84IRQYvvC6SaUJMr9PDp5zC6rZ9dMfVRGi2UfwghPuN7hZRGsndI0ST+
         PFhY2vqVwNrjH6h+YtALzUeOMjHf94TJ72x3BWZxTFWYyzd7pyDDb6VcXkVM3HXJ48SV
         RKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
        b=hdE4D89WqnckO4bxAer9+eZEzyXfGG+qKrNS0UHb4rtAHKlahGp/UxAzf/LvckmnXt
         WrLGbJ1QyXtgFGqmGOyCarGxx2mdJsQtQbQkesfSxQAEkIsJTIYk8KR+T20tqtU4wBqL
         6HfaD0XGpcLzwXKnKZH/wnG7BtGsY5+wYhJdfrk1LnmloPB2r9CHzHnKJJoOEpZSP6PJ
         ToqBu6bXCGb/WoMQBX9Hd7y0X07Db4/pQZs49xXObV1J7x0q8N/o8TIyrYm9YZJpW8l2
         o9Kq0TDbO1Q7AiaRHpMphveBcPP8l0gNN6s5OzfYzCpHPejNhQdHMp86GvdmsHeT3SNR
         Qlcg==
X-Gm-Message-State: AOAM532xO64blF2XxoD0nCGShbkEhLp6cTyZ+WGLNEDAA4bD/k4fQrLB
        6DPf+YODdWLSNoCrl3fHVTqG/Q==
X-Google-Smtp-Source: ABdhPJwqxUWLj44z5pV1IxYjRC/4BbSsQYK/woXmzbgMRsur3QtiLC9JK1TbDTSqoIVXvRm2UjIBew==
X-Received: by 2002:a2e:350f:: with SMTP id z15mr1394722ljz.303.1622767893346;
        Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d24sm459811lfn.213.2021.06.03.17.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
Subject: Re: [RESEND 14/26] drm/msm/dp/dp_link: Fix some potential doc-rot
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-15-lee.jones@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c6f630b6-715a-2dec-0b91-f918adcbdbd3@linaro.org>
Date:   Fri, 4 Jun 2021 03:51:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-15-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype for dp_parse_video_pattern_params(). Prototype was for dp_link_parse_video_pattern_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype for dp_parse_phy_test_params(). Prototype was for dp_link_parse_phy_test_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype for dp_link_process_downstream_port_status_change(). Prototype was for dp_link_process_ds_port_status_change() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a5..1099604bd1c86 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
>   }
>   
>   /**
> - * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
> + * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
>    * @link: Display Port Driver data
>    *
>    * Returns 0 if it successfully parses the video link pattern and the link
> @@ -563,7 +563,7 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_parse_phy_test_params() - parses the phy link parameters
> + * dp_link_parse_phy_test_params() - parses the phy link parameters
>    * @link: Display Port Driver data
>    *
>    * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
> @@ -961,7 +961,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_link_process_downstream_port_status_change() - process port status changes
> + * dp_link_process_ds_port_status_change() - process port status changes
>    * @link: Display Port Driver data
>    *
>    * This function will handle downstream port updates that are initiated by
> 


-- 
With best wishes
Dmitry
