Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6777BA08C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 19:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfH1Rj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 13:39:26 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:36925 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1Rj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 13:39:26 -0400
Received: by mail-yw1-f67.google.com with SMTP id u141so185821ywe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qFpGxWkuqJvzGEyaIhW5jLfEJosqdgJDRUmrRBBeYNs=;
        b=MA7imn2ncsnCHudQTmqQ5VNmGP5xmFYdXGG3IQLhQSRJBwKfS7igz5Tj3J25Zl9xza
         KU3CGRXXNayp++1iMedSJO1s4CBH6XYix460Ds56VGq3d0ZwGI9EzPhh9sUG6keZGuLx
         rm+4kkgsTNggulY9ExRns+6vzU/YZE/bfWtXM6GUBPHYmbbMbHwEcNlCVNhMrxXGQyek
         jeNBueGjMnKw9Pri3cmDJAiLZPSVg6XfDKQuq7UGs46jHubFTsyYZVGC1d4LYX0ubV0C
         Nf0nom5s1riI86vEeEhTPzf3lNPNtewKpqTGthpXeceEptS+Pv92dEukR9Va11d7uU/V
         irIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qFpGxWkuqJvzGEyaIhW5jLfEJosqdgJDRUmrRBBeYNs=;
        b=PCAcw8xCy611vQkapJbyd0GuTOBv3yZZ5NsWjTgfmIKJrQ/vZSHwmEmTxjPrNYAwoF
         qWOKiSLnH0YCWIxNr/OnAkDkkqQLwAaeqTFqlQ1uAiK5SCcXXlu2ph6pU4b+It0do3J2
         EEJsxDp7he4UMFYfEQ7nB5tQpBvbelP999MNXzTWgRthuT5mkvefd5Gvfpv4oOwmUH8l
         UQWBQ223B/MkPjnEtGZkCmR/KTt4S0QH+fIwCCEdvzbc2kRz8tYA6LEDmb1gHgrLO4jD
         HODt6Wp79vfW6C44TiaVwVdC1g+OIfLVGqzc/mRMXfv2LX6pytwX9SDX9seN3v/ZFrhD
         lLhA==
X-Gm-Message-State: APjAAAWw5lTvg7ONhNojsPPiEusLp4RsPntsyTt1zjlNC7hXeq/rOHtX
        tccn+8hBSjk2zwOcyqnHvngWzQ==
X-Google-Smtp-Source: APXvYqyrVae82GONg6G6xNXh2GuQpBKNgcXrFoQjXLJtaTK9ENwDFPeV9rgnIhlfcztUqTBdkROW9Q==
X-Received: by 2002:a81:2e0b:: with SMTP id u11mr3819761ywu.219.1567013965380;
        Wed, 28 Aug 2019 10:39:25 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d186sm614964ywf.28.2019.08.28.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 10:39:24 -0700 (PDT)
Date:   Wed, 28 Aug 2019 13:39:24 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bruce Wang <bzwang@chromium.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: remove stray "\n"
Message-ID: <20190828173924.GD218215@art_vandelay>
References: <20190827211016.18070-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827211016.18070-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 27, 2019 at 02:10:09PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The extra line-break in traces was annoying me.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 765484437d11..eecfe9b3199e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -392,7 +392,7 @@ TRACE_EVENT(dpu_enc_rc,
>  		__entry->rc_state = rc_state;
>  		__assign_str(stage_str, stage);
>  	),
> -	TP_printk("%s: id:%u, sw_event:%d, idle_pc_supported:%s, rc_state:%d\n",
> +	TP_printk("%s: id:%u, sw_event:%d, idle_pc_supported:%s, rc_state:%d",
>  		  __get_str(stage_str), __entry->drm_id, __entry->sw_event,
>  		  __entry->idle_pc_supported ? "true" : "false",
>  		  __entry->rc_state)
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
