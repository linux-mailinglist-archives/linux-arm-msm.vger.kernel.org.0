Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E9E41F552
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 21:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355980AbhJATCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 15:02:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23696 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhJATCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 15:02:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633114856; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2WRN8CYwUb8dJhM6DEuz3ESRgJ55mSYDeeU1ERUv/XI=;
 b=Wc4SbXp/YLD5sU4NBr0kI1iCzY0mzD598hXqffQ4y9Yg1pbhy653mwv8dgJDW8gGh4pltya2
 lEAH0WcnGvFb0cZciue1PP1m3Po0GeasHO1h86pliuqhHNpuGgQnjlsATx3ozPnoPPu55ivT
 cGIFsIf2dWezZ0ZOTw5PsI0GP+w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61575ab463b1f18658967b55 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 19:00:04
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43F44C4360D; Fri,  1 Oct 2021 19:00:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A721C43460;
        Fri,  1 Oct 2021 19:00:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 Oct 2021 12:00:03 -0700
From:   jesszhan@codeaurora.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm/dp: add debugfs support to DP driver
In-Reply-To: <20211001135937.GA10064@kili>
References: <20211001135937.GA10064@kili>
Message-ID: <934251d1ee057a0bd745d10265425980@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,

Thanks for the heads up, will take care of it.

On 2021-10-01 06:59, Dan Carpenter wrote:
> Hello Abhinav Kumar,
> 
> The patch d11a93690df7: "drm/msm/dp: add debugfs support to DP
> driver" from Sep 12, 2020, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/dp/dp_debug.c:194 dp_debug_read_info()
> 	warn: userbuf overflow? is 'len' <= 'count'
> 
> drivers/gpu/drm/msm/dp/dp_debug.c
>     46 static ssize_t dp_debug_read_info(struct file *file, char
> __user *user_buff,
>     47                 size_t count, loff_t *ppos)
>     48 {
>     49         struct dp_debug_private *debug = file->private_data;
>     50         char *buf;
>     51         u32 len = 0, rc = 0;
>     52         u64 lclk = 0;
>     53         u32 max_size = SZ_4K;
>     54         u32 link_params_rate;
>     55         struct drm_display_mode *drm_mode;
>     56
>     57         if (!debug)
>     58                 return -ENODEV;
>     59
>     60         if (*ppos)
>     61                 return 0;
>     62
>     63         buf = kzalloc(SZ_4K, GFP_KERNEL);
>     64         if (!buf)
>     65                 return -ENOMEM;
>     66
>     67         drm_mode = &debug->panel->dp_mode.drm_mode;
>     68
>     69         rc = snprintf(buf + len, max_size, "\tname = %s\n", 
> DEBUG_NAME);
>     70         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>     71                 goto error;
>     72
>     73         rc = snprintf(buf + len, max_size,
>     74                         "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
>     75                         debug->panel->max_pclk_khz);
>     76         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>     77                 goto error;
>     78
>     79         rc = snprintf(buf + len, max_size,
>     80                         "\tdrm_dp_link\n\t\trate = %u\n",
>     81                         debug->panel->link_info.rate);
>     82         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>     83                 goto error;
>     84
>     85         rc = snprintf(buf + len, max_size,
>     86                          "\t\tnum_lanes = %u\n",
>     87                         debug->panel->link_info.num_lanes);
>     88         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>     89                 goto error;
>     90
>     91         rc = snprintf(buf + len, max_size,
>     92                         "\t\tcapabilities = %lu\n",
>     93                         debug->panel->link_info.capabilities);
>     94         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>     95                 goto error;
>     96
>     97         rc = snprintf(buf + len, max_size,
>     98                         "\tdp_panel_info:\n\t\tactive = 
> %dx%d\n",
>     99                         drm_mode->hdisplay,
>     100                         drm_mode->vdisplay);
>     101         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     102                 goto error;
>     103
>     104         rc = snprintf(buf + len, max_size,
>     105                         "\t\tback_porch = %dx%d\n",
>     106                         drm_mode->htotal - drm_mode->hsync_end,
>     107                         drm_mode->vtotal - 
> drm_mode->vsync_end);
>     108         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     109                 goto error;
>     110
>     111         rc = snprintf(buf + len, max_size,
>     112                         "\t\tfront_porch = %dx%d\n",
>     113                         drm_mode->hsync_start - 
> drm_mode->hdisplay,
>     114                         drm_mode->vsync_start - 
> drm_mode->vdisplay);
>     115         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     116                 goto error;
>     117
>     118         rc = snprintf(buf + len, max_size,
>     119                         "\t\tsync_width = %dx%d\n",
>     120                         drm_mode->hsync_end - 
> drm_mode->hsync_start,
>     121                         drm_mode->vsync_end - 
> drm_mode->vsync_start);
>     122         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     123                 goto error;
>     124
>     125         rc = snprintf(buf + len, max_size,
>     126                         "\t\tactive_low = %dx%d\n",
>     127                         debug->panel->dp_mode.h_active_low,
>     128                         debug->panel->dp_mode.v_active_low);
>     129         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     130                 goto error;
>     131
>     132         rc = snprintf(buf + len, max_size,
>     133                         "\t\th_skew = %d\n",
>     134                         drm_mode->hskew);
>     135         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     136                 goto error;
>     137
>     138         rc = snprintf(buf + len, max_size,
>     139                         "\t\trefresh rate = %d\n",
>     140                         drm_mode_vrefresh(drm_mode));
>     141         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     142                 goto error;
>     143
>     144         rc = snprintf(buf + len, max_size,
>     145                         "\t\tpixel clock khz = %d\n",
>     146                         drm_mode->clock);
>     147         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     148                 goto error;
>     149
>     150         rc = snprintf(buf + len, max_size,
>     151                         "\t\tbpp = %d\n",
>     152                         debug->panel->dp_mode.bpp);
>     153         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     154                 goto error;
>     155
>     156         /* Link Information */
>     157         rc = snprintf(buf + len, max_size,
>     158                         "\tdp_link:\n\t\ttest_requested = 
> %d\n",
>     159                         debug->link->sink_request);
>     160         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     161                 goto error;
>     162
>     163         rc = snprintf(buf + len, max_size,
>     164                         "\t\tnum_lanes = %d\n",
>     165                         debug->link->link_params.num_lanes);
>     166         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     167                 goto error;
>     168
>     169         link_params_rate = debug->link->link_params.rate;
>     170         rc = snprintf(buf + len, max_size,
>     171                         "\t\tbw_code = %d\n",
>     172                         
> drm_dp_link_rate_to_bw_code(link_params_rate));
>     173         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     174                 goto error;
>     175
>     176         lclk = debug->link->link_params.rate * 1000;
>     177         rc = snprintf(buf + len, max_size,
>     178                         "\t\tlclk = %lld\n", lclk);
>     179         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     180                 goto error;
>     181
>     182         rc = snprintf(buf + len, max_size,
>     183                         "\t\tv_level = %d\n",
>     184                         debug->link->phy_params.v_level);
>     185         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     186                 goto error;
>     187
>     188         rc = snprintf(buf + len, max_size,
>     189                         "\t\tp_level = %d\n",
>     190                         debug->link->phy_params.p_level);
>     191         if (dp_debug_check_buffer_overflow(rc, &max_size, 
> &len))
>     192                 goto error;
>     193
> --> 194         if (copy_to_user(user_buff, buf, len))
> 
> This function does not take "count" into consideration so it can end
> up copying more than the user wanted (memory corruption in the user
> program).
> 
> Technically if copy_to_user() fails it should return -EFAULT, not 
> -EINVAL.
> 
> It's weird how it return -EINVAL when the kernel can't fit its output
> in one page.  Normally we would just print the first page and hope that
> was enough.  Use scprintf() instead snprintf().
> 
> 	len += scnprintf(buf + len, size - len, "blah blah blah");
> 
>     195                 goto error;
>     196
>     197         *ppos += len;
>     198
>     199         kfree(buf);
>     200         return len;
>     201  error:
>     202         kfree(buf);
>     203         return -EINVAL;
>     204 }
> 
> regards,
> dan carpenter

Best,
Jessica Zhang
