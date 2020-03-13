Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14616184172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 08:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgCMHWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 03:22:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:50422 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgCMHWk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 03:22:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4877FB042;
        Fri, 13 Mar 2020 07:22:38 +0000 (UTC)
Date:   Fri, 13 Mar 2020 08:22:38 +0100
Message-ID: <s5h36ac67nl.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ALSA: compress: add wma codec profiles
In-Reply-To: <20200313070847.1464977-2-vkoul@kernel.org>
References: <20200313070847.1464977-1-vkoul@kernel.org>
        <20200313070847.1464977-2-vkoul@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Mar 2020 08:08:39 +0100,
Vinod Koul wrote:
> 
> Some codec profiles were missing for WMA, like WMA9/10 lossless and
> wma10 pro, so add these profiles
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  include/uapi/sound/compress_params.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index 9c96fb0e4d90..634daa354b58 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -142,6 +142,9 @@
>  #define SND_AUDIOPROFILE_WMA8                ((__u32) 0x00000002)
>  #define SND_AUDIOPROFILE_WMA9                ((__u32) 0x00000004)
>  #define SND_AUDIOPROFILE_WMA10               ((__u32) 0x00000008)
> +#define SND_AUDIOPROFILE_WMA9_PRO            ((__u32) 0x00000010)
> +#define SND_AUDIOPROFILE_WMA9_LOSSLESS       ((__u32) 0x00000011)
> +#define SND_AUDIOPROFILE_WMA10_LOSSLESS      ((__u32) 0x00000012)

Are the profiles are bit flags, or they are just enums?
All other definitions are set as if bit flags.


thanks,

Takashi
