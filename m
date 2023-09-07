Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3577975AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 17:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbjIGPwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 11:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237494AbjIGPs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 11:48:27 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7910C46B4;
        Thu,  7 Sep 2023 08:39:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5352521860;
        Thu,  7 Sep 2023 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694101131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZEqj/TaMjwHlTs/viCIGXa1aFhlVcHEDbr8DfvrhoN8=;
        b=vBDAI4/PiCVn0AfPsBB++vFHV29E9kYYThDdSDAKY8U39NWoxg3qaUZwqlvn9vYxMrxsI5
        7y7Vcvo8lubTaAyvP76ZYuxoesuoQxlimCWSz8rDvbXICY4YT2m9tw53ueSspATKfQ54Jn
        +EM58KQCjqr6sU+x5BuX5wPA9ONiojI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694101131;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZEqj/TaMjwHlTs/viCIGXa1aFhlVcHEDbr8DfvrhoN8=;
        b=EwXU7EZKC+nUnxytU6JT1R0nmGcVE9XPQDvpF0P0Gr8AQTIgiw7A2ewAsWC2zsCm174trU
        JAEhfGyY/upGdvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B42B5138FA;
        Thu,  7 Sep 2023 15:38:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id R8TKKoru+WTZAwAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 07 Sep 2023 15:38:50 +0000
Date:   Thu, 07 Sep 2023 17:38:50 +0200
Message-ID: <874jk6at85.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_plai@quicinc.com>
Subject: Re: [PATCH v5 12/32] sound: usb: Export USB SND APIs for modules
In-Reply-To: <20230829210657.9904-13-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
        <20230829210657.9904-13-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 23:06:37 +0200,
Wesley Cheng wrote:
> -/*
> - * hw_params callback
> - *
> - * allocate a buffer and set the given audio format.
> - *
> - * so far we use a physically linear buffer although packetize transfer
> - * doesn't need a continuous area.
> - * if sg buffer is supported on the later version of alsa, we'll follow
> - * that.
> - */
> -static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> -			     struct snd_pcm_hw_params *hw_params)
> +int snd_usb_attach_endpoints(struct snd_usb_substream *subs,
> +				struct snd_pcm_hw_params *hw_params)

This doesn't only "attach" endpoints, but it does more other things
that are needed for PCM hw_params procedure.  I'd rather keep
hw_params in the function name instead of creating completely
different one.

Ditto for hw_free.


thanks,

Takashi
