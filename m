Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF5418448C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMKNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:13:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMKN3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:13:29 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 243C120724;
        Fri, 13 Mar 2020 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584094408;
        bh=iAw9u4aWzxZM6fbv9mNZZWBz2qN7xEeu3pNeidvP1nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hdWB4E7DDe2h/L1sWI4v//sZDt38tFF5fk3wkVcvt8f39IE4vTDqME+1hNpGrmU5k
         M9bf48iynKaHV+2Q6OjmD0eUQTIcTkIoJrWF8bDrQOxQlZtFEpfx628OOa4K7d0JUd
         PY7K4M6owViHUmRKjJU36Pi0XXDmXySWa3EnMgt4=
Date:   Fri, 13 Mar 2020 15:43:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] ALSA: compress: Add wma, alac and ape support
Message-ID: <20200313101324.GB4885@vkoul-mobl>
References: <20200313095318.1555163-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313095318.1555163-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-03-20, 15:23, Vinod Koul wrote:
> This series adds more WMA profiles and WMA decoder parameters to UAPI and
> then support for these in qcom driver. It also adds FLAC and APE IDs and
> decoder parameters to UAPI and then support in qcom driver
> 
> This was tested on Dragon board RB3.
> 
> Last, bump up the compressed version so that userspace can check for the
> support.
> 
> Since the series touches compress uapi and asoc, it would make sense to go
> thru asoc tree with acks.

Oops threading is broken b/w cover and patches. I will resend this

Apologies for the mess!

> 
> Changes in v2:
>  - use bitflags for wma profiles
> 
> Vinod Koul (9):
>   ALSA: compress: add wma codec profiles
>   ALSA: compress: Add wma decoder params
>   ASoC: qcom: q6asm: pass codec profile to q6asm_open_write
>   ASoC: qcom: q6asm: add support to wma config
>   ASoC: qcom: q6asm-dai: add support to wma decoder
>   ALSA: compress: add alac & ape decoder params
>   ASoC: qcom: q6asm: add support for alac and ape configs
>   ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders
>   ALSA: compress: bump the version
> 
>  include/uapi/sound/compress_offload.h |   2 +-
>  include/uapi/sound/compress_params.h  |  37 +++-
>  sound/soc/qcom/qdsp6/q6asm-dai.c      | 136 +++++++++++++-
>  sound/soc/qcom/qdsp6/q6asm.c          | 243 +++++++++++++++++++++++++-
>  sound/soc/qcom/qdsp6/q6asm.h          |  51 +++++-
>  5 files changed, 462 insertions(+), 7 deletions(-)
> 
> -- 
> 2.24.1

-- 
~Vinod
