Return-Path: <linux-arm-msm+bounces-3781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2C8094E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 22:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F781F210F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 21:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C99840D8;
	Thu,  7 Dec 2023 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wr2voJ1Q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="tW/MJDf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AFF1984
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 13:48:18 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFAD21D8F;
	Thu,  7 Dec 2023 21:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1701985697;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/XLa3KDxqRWHmGVjr8d/G+sX8hjiP3/Fno8wa2agTg=;
	b=wr2voJ1QFWfZP2KIHtm4oN2BdmUqpmUqm3AYq4oJGkTLrzgyveYk7uVzwijyM4sLgmxiky
	ZRwp9COxYa6TMxRiASkU1wRAGgMlV1W4wjG8X/bFZ06JAPBbmva2PvaRiLMkG09Qmfrfm/
	MTvZXclIUOCvKm4LebY32UjKjYWjszc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1701985697;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/XLa3KDxqRWHmGVjr8d/G+sX8hjiP3/Fno8wa2agTg=;
	b=tW/MJDf07Vx91n7qtQF1Hc2imtmSWTY5n8hk1TXpsaB/38iXIPY6XGvcTInvR/AbrAxdAu
	9PtW08jvnTuM9ZCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E69113907;
	Thu,  7 Dec 2023 21:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id PoKtFZ89cmXLIgAAn2gu4w
	(envelope-from <pvorel@suse.cz>); Thu, 07 Dec 2023 21:48:15 +0000
Date: Thu, 7 Dec 2023 22:48:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Aboothahir U <aboothahirpkd@gmail.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Message-ID: <20231207214809.GA302808@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231115205318.2536441-1-pvorel@suse.cz>
 <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
 <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>
 <644f49ae-26f0-4a4b-9a3a-53076be31d87@linaro.org>
 <CAA8EJpqmvKQHzPtzseCJ=y0GwP5Y5H_cR4RpjU97y=8q=b-zDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqmvKQHzPtzseCJ=y0GwP5Y5H_cR4RpjU97y=8q=b-zDQ@mail.gmail.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.00
X-Spamd-Result: default: False [-2.00 / 50.00];
	 HAS_REPLYTO(0.30)[pvorel@suse.cz];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 REPLYTO_EQ_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 URIBL_BLOCKED(0.00)[linaro.org:email];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[linaro.org,kernel.org,vger.kernel.org,gmail.com,somainline.org,collabora.com,postmarketos.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]

Hi all,

[ Cc Alexey Minnekhanov ]

> On Thu, 7 Dec 2023 at 21:26, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> > On 12/7/23 19:54, Dmitry Baryshkov wrote:
> > > On Thu, 7 Dec 2023 at 18:27, Bjorn Andersson <andersson@kernel.org> wrote:

> > >> On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
> > >>> From: Petr Vorel <petr.vorel@gmail.com>

> > >>> Enable support for the multimedia clock controller on SDM660 devices
> > >>> and graphics clock controller on SDM630/636/660 devices.

> > >>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > >>> ---
> > >>> Changes v1->v2:
> > >>> * added commit message (not just the subject)

> > >>> NOTE motivation for this is that some not yet mainlined DTS already use
> > >>> both:

> > >>> https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts

> > >>> Kind regards,
> > >>> Petr

> > >>>   arch/arm64/configs/defconfig | 2 ++
> > >>>   1 file changed, 2 insertions(+)

> > >>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > >>> index acba803835b9..10a098aa8b1b 100644
> > >>> --- a/arch/arm64/configs/defconfig
> > >>> +++ b/arch/arm64/configs/defconfig
> > >>> @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
> > >>>   CONFIG_SC_GCC_8280XP=y
> > >>>   CONFIG_SC_GPUCC_8280XP=m
> > >>>   CONFIG_SC_LPASSCC_8280XP=m
> > >>> +CONFIG_SDM_MMCC_660=m
> > >>> +CONFIG_SDM_GPUCC_660=y

> > >> I'd expect the GPU clock controller to be a module, can you please
> > >> clarify why it needs to be builtin?

> > > To allow the display to be enabled early enough?

Yes, I feared that it would not work when it's a module.
Also, we already have CONFIG_SDM_GPUCC_845=y.
I suppose I'm wrong, but I don't have any sdm660 device to test that.

BTW people who are using this use both as builtin (CONFIG_SDM_MMCC_660) [2], but
maybe it's just to help testing (boot the kernel and don't bother with modules).

@Alexey, you added sdm660_defconfig [2], do you have sdm660 based device to test
if both options work well when compiled as modules?

> > That sounds like a terrible bug in drm/msm.. Display should
> > be wholly separate from Adreno.

> Let me quote Rob's email ([1])

> Userspace does have better support for split display/gpu these days
> than it did when drm/msm was first merged.  It _might_ just work if
> one device only advertised DRIVER_RENDER and the other
> MODESET/ATOMIC.. but I'd be a bit concerned about breaking things.  I
> guess you could try some sort of kconfig knob to have two "msm"
> devices and see what breaks, but I'm a bit skeptical that we could
> make this the default anytime soon.

Thanks for pointing out this.

Kind regards,
Petr

> [1] https://lore.kernel.org/dri-devel/CAF6AEGs89FRmFsENLkP-Dg1ZJN2LzCfxY2-+do9jH9b8L-XZxg@mail.gmail.com/
[2] https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/configs/sdm660_defconfig#L504-L505

