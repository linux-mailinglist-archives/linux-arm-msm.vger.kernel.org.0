Return-Path: <linux-arm-msm+bounces-38553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BC9D4115
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 18:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96957280D12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 17:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5811619F41C;
	Wed, 20 Nov 2024 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="gIImquSD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TscKSRkj";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="gIImquSD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TscKSRkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B114831E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123380; cv=none; b=CHa99yjlE0+lrGZUIfYsCjJEc43yBnSGZnNXwZo7EgOMbSMC1RNQVbVVcf0/XGdBRijZfg6eO+6Wj5y3MBE49jhvdThBXMfC1mFT5OdLedvhDznj+s6YuYcLnXiP6byaVX1uqLqGFN1O2573J0XW+JsPQ2zPHMOXTd5AF8WBMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123380; c=relaxed/simple;
	bh=+OpmX36I47ryTtzXmN0hqRs0NhXasOnU6047Wg/DMqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCh/4xvNReJ+a8ZxHe99mOOCdS5XaKvJfgGLZl6fEGmUGb5UyugwOhbFrDO6dNIvw2xioBZLJRtc2gILCJlpuEg8aU5z7tuqOBJYnMO1pwPI2uUkm2G6XoIhA0HhOjufN6dHuLLFGtaVBtGRMc06FVN+3RN1QsWTGkU0tbkYKUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=gIImquSD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TscKSRkj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=gIImquSD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TscKSRkj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54A591F7B1;
	Wed, 20 Nov 2024 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732123376;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08aJaWeObe77avLOJk3Q7AD9Cjdcc+R8GmLyAeAUptI=;
	b=gIImquSD7csfsf3WagORB58uuhZmNkpBmBHullTyn7Az61aimOHdv3FeUJNezs+xBBHgN4
	X8mt/t0tDLCyjHXObxegGh3Wj1tY4jTN1HWtpLNI1XYBBzuOPxluy1+qfdEyE5CMHkKe4s
	AeOVp9OOwXZBKWq4ql3RbiaqM3yR6a8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732123376;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08aJaWeObe77avLOJk3Q7AD9Cjdcc+R8GmLyAeAUptI=;
	b=TscKSRkjHud9EqEZywXQcmW9mKWt8AKZ4WQ8pjcqykpwvAHJTx3KTUqscuTKdGV3y4FiHH
	DgxsqTwuX3S74gAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=gIImquSD;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=TscKSRkj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732123376;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08aJaWeObe77avLOJk3Q7AD9Cjdcc+R8GmLyAeAUptI=;
	b=gIImquSD7csfsf3WagORB58uuhZmNkpBmBHullTyn7Az61aimOHdv3FeUJNezs+xBBHgN4
	X8mt/t0tDLCyjHXObxegGh3Wj1tY4jTN1HWtpLNI1XYBBzuOPxluy1+qfdEyE5CMHkKe4s
	AeOVp9OOwXZBKWq4ql3RbiaqM3yR6a8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732123376;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08aJaWeObe77avLOJk3Q7AD9Cjdcc+R8GmLyAeAUptI=;
	b=TscKSRkjHud9EqEZywXQcmW9mKWt8AKZ4WQ8pjcqykpwvAHJTx3KTUqscuTKdGV3y4FiHH
	DgxsqTwuX3S74gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1BEC13297;
	Wed, 20 Nov 2024 17:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id drSGKe8aPmfVZgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 17:22:55 +0000
Date: Wed, 20 Nov 2024 18:22:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [RFC PATCH 1/1] arm64: dts: qcom: sdm845-oneplus-common: enable
 resin/volume down
Message-ID: <20241120172254.GB38310@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20241120145317.31406-1-pvorel@suse.cz>
 <ab1f91bd-8b6d-4825-90e3-b6a995e346f0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1f91bd-8b6d-4825-90e3-b6a995e346f0@linaro.org>
X-Rspamd-Queue-Id: 54A591F7B1
X-Spam-Level: 
X-Spamd-Result: default: False [-2.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ixit.cz,gmail.com,linaro.org,dylanvanassche.be,irl.hu];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.21
X-Spam-Flag: NO

Hi Caleb,

> Hi Petr,

> On 20/11/2024 15:53, Petr Vorel wrote:
> > OnePlus 6T (fajita) downstream device tree contains volume down GPIO key
> > and resin. I suppose it is also in OnePlus 6 (enchilada).

> The volume down key is already enabled under the gpio-keys node in
> sdm845-oneplus-common.dtsi does it not work for you for some reason?

Thanks for info. I'm sorry for the noise, obviously I was wrong. I noticed
before gpio-keys but later forgot on it (staring to too many device tree files
during day).  That's how it endup if I dare to send patch without testing :(.

> I don't believe the resin node is used on this board, it's ignosed on
> the schematics at any rate.

I saw resin in the downstream device tree (get from phone, not just by reading
downstream source codes), but obviously if volume down is working resin is not
needed anyway. Another example of how downstream device tree is messy, I would
also trust schematics more.

Kind regards,
Petr

> Kind regards,

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi

> > reason for RFC:
> > * Unfortunately untested on the real device.
> > * OnePlus 6 (enchilada) is nearly identical, but I haven't compared it's
> >   device tree.
> > * Other sdm845 based devices just enable resin/volume down key the same
> >   way. But what confuses me is "gpios = <0xe7 0x05 0x01>;", does it need
> >   to enable gpios like sm6375-sony-xperia-murray-pdx225.dts in
> >   795ee50e55f4 ("arm64: dts: qcom: sm6375-pdx225: Add volume down GPIO key") ?

> > Below is snipped of the OnePlus 6T (fajita) downstream device tree.

> > Kind regards,
> > Petr

> > gpio_keys {
> > 		compatible = "gpio-keys";
> > 		label = "gpio-keys";
> > 		pinctrl-0 = <0x2f7>;
> > 		pinctrl-names = "default";

> > 		vol_down {
> > 				gpios = <0xe7 0x05 0x01>;
> > 				linux,can-disable;
> > 				debounce-interval = <0x0f>;
> > 				label = "volume_down";
> > 				linux,input-type = <0x01>;
> > 				linux,code = <0x72>;
> > 		};

> > 		vol_up {
> > 				gpios = <0xe7 0x06 0x01>;
> > 				linux,can-disable;
> > 				debounce-interval = <0x0f>;
> > 				label = "volume_up";
> > 				linux,input-type = <0x01>;
> > 				gpio-key,wakeup;
> > 				linux,code = <0x73>;
> > 		};

> > 		cam_focus {
> > 				status = "disabled";
> > 		};

> > 		hallsensor_key {
> > 				gpios = <0x34 0x7c 0x01>;
> > 				debounce-interval = <0x0f>;
> > 				interrupt-parent = <0x34>;
> > 				interrupts = <0x7c 0x00>;
> > 				label = "hallsensor_key";
> > 				linux,input-type = <0x05>;
> > 				gpio-key,wakeup;
> > 				linux,code = <0x00>;
> > 		};

> > 		cam_snapshot {
> > 				status = "disabled";
> > 		};
> > };

> > ...
> > qcom,power-on@800 {
> > 		qcom,system-reset;
> > 		compatible = "qcom,qpnp-power-on";
> > 		qcom,pon-dbc-delay = <0x3d09>;
> > 		interrupts = <0x00 0x08 0x00 0x00 0x00 0x08 0x01 0x00 0x00 0x08 0x04 0x00 0x00 0x08 0x05 0x00>;
> > 		qcom,kpdpwr-sw-debounce;
> > 		reg = <0x800 0x100>;
> > 		interrupt-names = "kpdpwr\0resin\0resin-bark\0kpdpwr-resin-bark";
> > 		qcom,store-hard-reset-reason;

> > 		qcom,pon_1 {
> > 				qcom,support-reset = <0x00>;
> > 				qcom,pull-up = <0x01>;
> > 				qcom,pon-type = <0x00>;
> > 				linux,code = <0x74>;
> > 		};

> > 		qcom,pon_2 {
> > 				qcom,pull-up = <0x01>;
> > 				qcom,pon-type = <0x01>;
> > 				linux,code = <0x72>;
> > 		};

> >  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)

> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > index 46e25c53829a..6cb074de7696 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > @@ -847,6 +847,11 @@ speaker_default: speaker-default-state {
> >  	};
> >  };

> > +&pm8998_resin {
> > +	linux,code = <KEY_VOLUMEDOWN>;
> > +	status = "okay";
> > +};
> > +
> >  &venus {
> >  	status = "okay";
> >  	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";

