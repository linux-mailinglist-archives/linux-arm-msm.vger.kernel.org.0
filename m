Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D520377C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 08:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhEJGg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 02:36:56 -0400
Received: from ivanoab7.miniserver.com ([37.128.132.42]:57944 "EHLO
        www.kot-begemot.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhEJGg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 02:36:56 -0400
X-Greylist: delayed 2046 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 02:36:56 EDT
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6] helo=jain.kot-begemot.co.uk)
        by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1lfyz9-0006DY-Qs; Mon, 10 May 2021 06:01:44 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
        by jain.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1lfyz7-0004m2-Bb; Mon, 10 May 2021 07:01:43 +0100
Subject: Re: [PATCH v2 0/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210510031606.3112-1-thunder.leizhen@huawei.com>
From:   Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
Date:   Mon, 10 May 2021 07:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510031606.3112-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2021 04:16, Zhen Lei wrote:
> v1 --> v2:
> According to Anton Ivanov's review comments, detele the unnecessary local
> variable initialization "ret = 0".
>
>
> Zhen Lei (1):
>    drm/msm/dpu: Fix error return code in dpu_mdss_init()
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
I do not recall reviewing this.

I think you got the wrong Anton Ivanov - I maintain UML so the previous 
revision hit someone's else inbox.

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

