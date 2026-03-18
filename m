Return-Path: <linux-arm-msm+bounces-98356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEH3BDBmumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:45:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1702B8552
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A800300B9C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DC038F632;
	Wed, 18 Mar 2026 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IQTZRtCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FC2BB1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823528; cv=none; b=fUxqaUXRqZH2V8Nsm+mPxlEv4ex05XaQxN10IZ8zil59ByhTWdGWvPi+/CtBeNstfa3uWP5FOr22DkZClHSE4ZH39Mwy1o0bC1SnO4W/Si8EXXd7E01PGc4Y9pUESPf49g0W+mwUcvFJk9KObVbshyTOSOkJVT8SpceQuV3Qapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823528; c=relaxed/simple;
	bh=vpkIzwAlbt2wev8FSusK7M7mrMVmaNBRwgRTC9/C208=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=RKIrOuigrQRy4j9Q+YBZ3mMc+OHgm54//rzpqk2cCxUanOFIF6lzOaK2+eO6AoMKdo+RYbzzX4D1Mo8n9VnpSq3TbuIVf+gGzJHC4gDrpIjYAss7e8Q6ruf5QamVu5c1BmnczNY7sf39w9cs0w/GJYYGH6CNaVOk+8aHGR3m1T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IQTZRtCx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso8878340a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773823525; x=1774428325; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2NVg5azhBgjIMGuyOtSlU5XnHGYpWJdykiqlxTKsf8=;
        b=IQTZRtCxePGZNmG+parrgZ0y1XGi2JA7E0cEsjMvfyCRE7lBvxrb3thls84sefgYjy
         3OklI4aayVwjHpsoHsyecpIVOgptUAQX7cCB3nHeKX4bv+2Ig4wf3h62vxA7F2CYc3Kn
         5Q3svzRRpxmsPEeyj7APadxwjaREYta4XQyyOyovINSiXC59pNPNrUTVd40uMP6vvzoa
         VEAyhUsoqIcG8UzSlL84yNiHJFpRZxAgk9DIJLkpj7nYoHt3k7w9wEvdfd/+2NzXEPTe
         dZiADn/zIC8Xu6PyLdUqWkh10KIG6VVNqBxeFFVVmpigkzRLdEUOKiU1Gsy4ikKfgDqP
         bqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823525; x=1774428325;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2NVg5azhBgjIMGuyOtSlU5XnHGYpWJdykiqlxTKsf8=;
        b=JrvOGfMCmhtfwVCJAtluv1xFC4+FYRZTmiTwRhIxBJLfxdu4qc9/fxYr+SXpoxFduh
         FpyBIcrG0FsENt584x+KYddJ4tjzUwPkMQpEU4TpcT0WKNzaKsnAj13pVL0kUJ+e4lxz
         n4K+ChjSKKrrFY7mxDzgERwmgCKIFcXxysDOGMg3pMlb+f89XeQGjHClSCaGNB3WJ1u8
         dcZnLyIoxKdKfJYtk2740JF+sdFXMyAvXI1ayB2w8zZ5SOjVknhSPCF8Ewbma3tOvCJQ
         ZEzgfGX7x9CRhxtavTrIYUtlLjqbmTVgKHGptlyxpSvAyVIQwPImjxjmPdjLzPVpWQIc
         CSMg==
X-Forwarded-Encrypted: i=1; AJvYcCVPN9/fiwgxEsUQgZyrJQ6E+vqLdh2qii66K8cEPAFe4uMha9tlO8TCvM2i8STiGWETV4v1eZ9vosF5XXz4@vger.kernel.org
X-Gm-Message-State: AOJu0YzEU1vOUeEyJiwuDnAU05ivaH+LWxThSawPArsD+836bxv5a4IP
	vQDvqFRDL7DhsPq0q3uiidYXN/22DH4EVZhwSr8Btrv3jrswBg3ZwdS+2LIhJyt5iz8=
X-Gm-Gg: ATEYQzywAX/LpWNCGxovy1ZgoVYB91VSG5wQHT0Wwdg/V7pTUVHHP3WZ81IOhmumE8e
	eAInOGZm0E7q8cuSMVtIj1hYyc0OerlrI+ybLum8SBrfgwFT+W6cQDZshoINjy2v4tEry3K9hNz
	a+1i82Efz07UXjUMYAaZsTat9DS23mYUKNVMGtAdDEt815Xh7FOQjtQw2RHFhn1oXmbNOCDOmoA
	Y2ZxN2SPw9pCIRuFv6cE/ubUs8ciHV/fhwKX/iNST64jEfWcwodCL9AL40yYg6vbCtEwkqA2LMr
	bGjSQTdkPaxBw2ags8O46x2vFvQ10Ycsq1eRmjtef6C/ZkqQRIGw8PxLKxaLi2lVHEJObfkztS4
	PZU8+hKjwkpFxTSGJZSgaRHKuKyo12/PhCjZZYgFy13eZZglaqHMNY14icVGA9toXspqIbcSa2r
	orLearmK/uM0MmMwKnEJOfjIfMeWnuYQDyry5P6+SyxF0Olxltty0la4gIbCmBXC91CH0G
X-Received: by 2002:a05:6402:144b:b0:666:d8bb:85ea with SMTP id 4fb4d7f45d1cf-667b06e45e7mr1800366a12.0.1773823524789;
        Wed, 18 Mar 2026 01:45:24 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm1186045a12.17.2026.03.18.01.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 09:45:23 +0100
Message-Id: <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
In-Reply-To: <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98356-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:dkim,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C1702B8552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 6:45 PM CET, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
>> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
>> >> Hi Mahadevan,
>> >>=20
>> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
>> >> > On SC7280 targets, display modes with a width greater than the
>> >> > max_mixer_width (2400) are rejected during mode validation when
>> >> > merge3d is disabled. This limitation exists because, without a
>> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interfa=
ce),
>> >> > preventing large layers from being split across mixers. As a result=
,
>> >> > higher resolution modes cannot be supported.
>> >> >
>> >> > Enable merge3d support on SC7280 to allow combining streams from
>> >> > two layer mixers into a single non-DSC interface. This capability
>> >> > removes the width restriction and enables buffer sizes beyond the
>> >> > 2400-pixel limit.
>> >> >
>> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display fo=
r SC7280 target")
>> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> >>=20
>> >> This patch is causing display regression on QCM6490 fairphone-fp5.
>> >>=20
>> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on th=
e
>> >> screen. When reverting this patch everything becomes working again.
>> >>=20
>> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-li=
nux/-/issues/41
>> >>=20
>> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
>> >> quickly?
>> >
>> > Could you please provide the resource allocation parts of
>> > debugfs/dri/0/state for both working and non-working cases?
>>=20
>> Working (patch reverted)
>>=20
>> resource mapping:
>>         pingpong=3D# # 68 # - - - - - - - - -=20
>>         mixer=3D# - 68 # - - - -=20
>>         ctl=3D68 # # # - - - -=20
>>         dspp=3D# - - - - - - -=20
>>         dsc=3D68 - - - - - - -=20
>>         cdm=3D#=20
>>         sspp=3D# - - - - - - - # # # - - - - -=20
>>         cwb=3D- - - -=20
>>=20
>>=20
>> Broken (with the patch)
>>=20
>> resource mapping:
>>         pingpong=3D# # 68 68 - - - - - - - - -=20
>>         mixer=3D# - 68 68 - - - -=20
>>         ctl=3D68 # # # - - - -=20
>>         dspp=3D# - - - - - - -=20
>>         dsc=3D68 - - - - - - -=20
>>         cdm=3D#=20
>>         sspp=3D# - - - - - - - # # # - - - - -=20
>>         cwb=3D- - - -=20
>
> As we have identified that the issue is what downstream calls
> DUALPIPE_3DMERGE_DSC topology, could you please also check several
> things (with the broken kernel):
>
> - What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
>   the broken config)?
>
> - If there is any difference in working and broken configs between
>   values being passed to (and programmed to the DSC) in
>   dpu_encoder_prep_dsc() ?
>
> - The same question for pclk calculation in dsi_host.c

Is this helpful?

Broken:
[    1.247165] dsi_calc_pclk:649 DBG pclk=3D111546490, bclk=3D83659867
[    1.490559] dpu_encoder_helper_get_3d_blend_mode:309 DBG BLEND_3D_H_ROW_=
INT
[    1.491008] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=3D0 initial_li=
nes=3D1

Working:
[    0.998043] dsi_calc_pclk:649 DBG pclk=3D111546490, bclk=3D83659867
[    1.233836] dpu_encoder_helper_get_3d_blend_mode:313 DBG BLEND_3D_NONE
[    1.234277] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=3D0 initial_li=
nes=3D1

Or do you need some more things? There's a lot of data being passed into
dpu_encoder_dsc_pipe_cfg() for example so I'm not sure which values are
relevant for this.

Regards
Luca

