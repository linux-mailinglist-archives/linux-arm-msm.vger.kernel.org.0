Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5F765C03F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 13:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237703AbjACMuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 07:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237693AbjACMuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 07:50:01 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0B51174;
        Tue,  3 Jan 2023 04:50:00 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C44F938C77;
        Tue,  3 Jan 2023 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1672750198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZEzIhKt2C2SI/WYm+OZI65abirl7ySTd6WBWg9jxJDk=;
        b=xc9iI98/J3TaTDSNEDN0tpUTzZ7pBlb4s9VbKSDV3irSxGxu9MC3m9O2xA+IJtK4WjsMcT
        5tNjAm6/QzaqS3AaXRVB2w8VU1GOg2ZvZUjSlUxgoZUDz5H76mxNRKCOwwizuxnWNebxdi
        +5l53mluriuk68EV6wYPYV1wBAeqD98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1672750198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZEzIhKt2C2SI/WYm+OZI65abirl7ySTd6WBWg9jxJDk=;
        b=4Dt3mtDNy7NwTEv/sGp959JFzQTcPMqu6tgsJqvfJQvfdi2az26te36H/fdn0CADh6tjZ2
        9v2JJ+sVbixVE/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56B111392B;
        Tue,  3 Jan 2023 12:49:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5eHnE3YktGOeEgAAMHmgww
        (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 12:49:58 +0000
Date:   Tue, 03 Jan 2023 13:49:57 +0100
Message-ID: <87v8lnrde2.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        quic_jackp@quicinc.com, quic_plai@quicinc.com
Subject: Re: [RFC PATCH 04/14] sound: usb: card: Introduce USB SND vendor op callbacks
In-Reply-To: <465bb512-2ea3-ebfc-4b21-7b493f019fc3@suse.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
        <20221223233200.26089-5-quic_wcheng@quicinc.com>
        <80f92635-6d14-8ff3-17ac-de2e5b977947@suse.com>
        <87lemqxpet.wl-tiwai@suse.de>
        <ec632e64-2d9c-3f71-4fe7-e1c6acb81393@quicinc.com>
        <465bb512-2ea3-ebfc-4b21-7b493f019fc3@suse.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 03 Jan 2023 13:20:48 +0100,
Oliver Neukum wrote:
> 
> 
> 
> On 30.12.22 08:10, Wesley Cheng wrote:
> 
> > It may depend on how the offloading is implemented, but we do have a mechanism to force the audio stream off from the qc_usb_audio_offload. Regardless of if the UDEV is suspended first, or the USB backend, as long as we ensure that the offloading is disabled before entering suspend, I think that should be sufficient.
> 
> You would presumably output garbage, if the UDEV is asleep but the backend is not.
> 
>  
> > The reset_resume() path is fine.  Bus reset is going to cause a disconnect() callback in the offload driver, in which we already have the proper handling for ensuring the offload path is halted, and we reject any incoming stream start requests.
> 
> How? If we go the reset_resume() code path, we find that usb-audio does not make
> a difference between regular resume() and reset_resume()

Note that, for USB audio, there is no much difference between resume()
and reset_resume(), especially about the PCM stream handling that is
the main target for the offload (the mixer isn't handled there).
And for the PCM, we just set the power state for UAC3, and that's
all.  All the rest is handled by the PCM core handler as usual.


Takashi
