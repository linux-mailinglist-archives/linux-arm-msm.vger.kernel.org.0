Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4573E6B266C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 15:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjCIOMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 09:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjCIOMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 09:12:20 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C626F63A9;
        Thu,  9 Mar 2023 06:10:54 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B0D11200FF;
        Thu,  9 Mar 2023 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678371052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dZu5yaZ5mJZQqJA4nKclTyIWmm8PdKTNVvbEDEeVGT0=;
        b=FWF8Ci3XEzSZihVeE3Z2GsWUNVr0BiNeI+Z25ci1Og5smj48XhbfdpN1wrKbQL2uxsFogX
        /dHx52MJNF0d5UwsA95bJ7XpgSV06H6rgRzlqo0yXBJvI4Wf/98MXsE2J7IXK1y9XHYDLR
        VDXeFqLaKr711VDUO/nwdlErSi5P+BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678371052;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dZu5yaZ5mJZQqJA4nKclTyIWmm8PdKTNVvbEDEeVGT0=;
        b=3oXZAtoM2KjAq7gkFLoZqPany+K5vsoQpLYADa4vO/1eVZoutbCq9eGoZ3M6pvIVFVewD0
        gHfZ6owjjeNeIMAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 566981391B;
        Thu,  9 Mar 2023 14:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oYtDFOzoCWSGLgAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 09 Mar 2023 14:10:52 +0000
Date:   Thu, 09 Mar 2023 15:10:51 +0100
Message-ID: <87r0tyf21g.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
        andersson@kernel.org, robh+dt@kernel.org, tiwai@suse.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
Subject: Re: [PATCH v3 09/28] sound: usb: card: Introduce USB SND platform op callbacks
In-Reply-To: <ZAmAPX6Q1m0HU/Qo@kroah.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
        <20230308235751.495-10-quic_wcheng@quicinc.com>
        <ZAmAPX6Q1m0HU/Qo@kroah.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Mar 2023 07:44:13 +0100,
Greg KH wrote:
> 
> On Wed, Mar 08, 2023 at 03:57:32PM -0800, Wesley Cheng wrote:
> > Allow for different platforms to be notified on USB SND connect/disconnect
> > seqeunces.  This allows for platform USB SND modules to properly initialize
> > and populate internal structures with references to the USB SND chip
> > device.
> > 
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >  sound/usb/card.c | 36 ++++++++++++++++++++++++++++++++++++
> >  sound/usb/card.h | 20 ++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 26268ffb8274..9bcbaa0c0a55 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -117,6 +117,30 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
> >  static DEFINE_MUTEX(register_mutex);
> >  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
> >  static struct usb_driver usb_audio_driver;
> > +static struct snd_usb_platform_ops *platform_ops;
> 
> As I've said before, you can not just have one of these.  They need to
> be per-bus structure.  Or per-device, something dynamic, not static like
> this.

Basically the change for USB-audio driver is a kind of add-on/plugin;
that is, it allows the platform_ops to override some operations of the
standard USB-audio driver for supporting the offload operations.

So, in that sense, this add-on itself is neither per-bus nor
per-device, and it's fine as a single pointer for now, IMO, since this
is the only known use case and it'd simplify the code.  If we'll have
more similar requirements in future, we may extend the implementation
and the API to allow the registration of multiple addons, too.

Though, there are a few obvious coding issues in the current patches,
and they have to be addressed, sure :)


thanks,

Takashi
