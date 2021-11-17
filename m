Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBC445483C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 15:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235941AbhKQOMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 09:12:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50778 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbhKQOMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 09:12:51 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 64AD81F46217
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637158191; bh=8jGdqijZ7q4/yAvbc1vyzx8rEXr6SdlAgU/wrMeMGyU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZYUm3dSpuLo3m4ldKc6vQ+dw9LItM0E+Zh+WN9cwPB4dQlUrVqLKkJ/8mhCY1kUhQ
         n0ahswTWMYi9xPzKycAWKux6bysNN1fATzi79F897ZXUILZjeABg/2F2Aml+i/V1uv
         OFJ1ldFCD70lK+fps9CNQ722WSvCuG+fRJ04lEN6NCwSRvexCG46BnHniFzOhmEIwC
         4DxirUboKEloDChAb0lw9pUGgTc7wurQXJ5CdRtE2U6hUdmdPT6GmKnsnLouhnEVdA
         nfGnuGAHtF65PN2FTGQUWzAX5vYJbyPwg7TxbQPFGhb3+FMdr9aEQN6XWrYzplopJy
         cJbQhWEYUuCzQ==
Subject: Re: [PATCH] drm/msm/devfreq: Insert missing null check in
 msm_devfreq_idle
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20211117111134.315709-1-marijn.suijten@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <969a8521-4eff-ddd2-4971-4990a7ba0fef@collabora.com>
Date:   Wed, 17 Nov 2021 15:09:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211117111134.315709-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 17/11/21 12:11, Marijn Suijten ha scritto:
> msm_devfreq_init only initializes the idle_work hrtimer when it succeeds
> to create a devfreq instance (devfreq support is optional), yet
> msm_devfreq_idle is called unconditionally from retire_submit and queues
> work on it.  We're seeing:
> 
>      [    2.005265] adreno 1c00000.gpu: [drm:msm_devfreq_init] *ERROR* Couldn't initialize GPU devfreq
> 
> Followed by a pagefault in:
> 
>      [   16.650316] pc : hrtimer_start_range_ns+0x64/0x360
>      [   16.650336] lr : msm_hrtimer_queue_work+0x18/0x2c
> 
> Moments later.  Just like msm_devfreq_active, check if the devfreq
> instance is not NULL before proceeding.
> 
> Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
