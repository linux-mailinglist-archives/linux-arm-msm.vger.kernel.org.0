Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72B02E8B15
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 07:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbhACGJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 01:09:53 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:56568 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbhACGJx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 01:09:53 -0500
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id CAF20607F1;
        Sun,  3 Jan 2021 06:09:09 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Craig Tatlor <ctatlor97@gmail.com>
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <ed665a03-27e4-11fd-edce-7520e0d2fd61@postmarketos.org>
Date:   Sun, 3 Jan 2021 09:09:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested these patches on Samsung Galaxy S5 along with other patches that 
add panel driver and enable GPU support on this device.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 12/30/20 6:29 PM, Iskren Chernev wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> vram.size is needed when binding a gpu without an iommu and is defined
> in msm_init_vram(), so run that before binding it.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
