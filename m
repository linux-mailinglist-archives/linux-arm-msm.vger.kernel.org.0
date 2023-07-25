Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3E2760B08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjGYG5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 02:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGYG5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 02:57:37 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B791BD;
        Mon, 24 Jul 2023 23:57:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 16A77218A2;
        Tue, 25 Jul 2023 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1690268255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9Oi3czKnpvE6a+3o5E+2OD3NX8ZHwPHEeEjkU+816sI=;
        b=0zxnnVkqjhYogR+gSX8ALAzMUJOePN8qiWPDDTsnTWm/yobi1+3EfgQcJPR/00OSQE3cns
        lovd+FP4k4hD5UunNTWUeUimHGaaPPsjm2QqNe1ITsTrY8NCMTzqcg/pXDEM0WEBjABovF
        hvsNvTBNDqkuhFP0aVEMpfGAfGZ65dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1690268255;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9Oi3czKnpvE6a+3o5E+2OD3NX8ZHwPHEeEjkU+816sI=;
        b=jGs9ToYVVp0Pnq39eX42g+FlWEbZnjh5urcI3qMPD09lMmi+Ywi9lpeBohzDI/SDbw6+Ym
        zyLzL4gbUmK1P5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8278713487;
        Tue, 25 Jul 2023 06:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7VDhHl5yv2R1BgAAMHmgww
        (envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 06:57:34 +0000
Date:   Tue, 25 Jul 2023 08:57:34 +0200
Message-ID: <87cz0gv5pd.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 19/32] sound: usb: card: Check for support for requested audio format
In-Reply-To: <20230725023416.11205-20-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
        <20230725023416.11205-20-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Jul 2023 04:34:03 +0200,
Wesley Cheng wrote:
> 
> Allow for checks on a specific USB audio device to see if a requested PCM
> format is supported.  This is needed for support for when playback is
> initiated by the ASoC USB backend path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 28 ++++++++++++++++++++++++++++
>  sound/usb/card.h |  8 ++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index a3fad66a3337..365f6d978608 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -142,6 +142,34 @@ int snd_usb_unregister_platform_ops(void)
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>  
> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction)
> +{

Please add a comment what this function does.


> +	struct snd_usb_audio *chip = usb_chip[card_idx];

Is the dereference safe without locking?
If the call is supposed to be allowed only in a safe situation, it
should be mentioned in the function description.


thanks,

Takashi
