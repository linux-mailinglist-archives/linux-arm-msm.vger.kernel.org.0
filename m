Return-Path: <linux-arm-msm+bounces-114042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfmPCWNSOWpSqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAFF6B0A95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e6QUJmDR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 784BC3005660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D59376496;
	Mon, 22 Jun 2026 15:18:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41043750D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:18:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141536; cv=none; b=Tlvxa5ZyzXQcAtMRY4RdavuMbiUqktQ8cUOMjOA/XuAIUbyHgjV46qNB5s7RYXKHHPrs4tUqUfyD4POPopjHBvkzlHVWdTHCqwfG2IPsSvTbFhKpIw7SgVDIU0D5vJq24MFAOPMUx3JBfsoHnGZIsQPnnjKOOw3zvslzpBHA66E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141536; c=relaxed/simple;
	bh=eO98CC1dq9xwepVqr0m1in8xGU1uGdR/vd48GlAlx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KViKtTvaKgMpo/o2Kn3aj83CUN49JQXZW4beN0QR1t7c/Ih5b3XKZj9WIisjH3+C/xXiw1GQEH27kkjUo+mAsoeAGwEbkxOKyVLC96sIKsCyiZxUXXDiMU13I3dMzmg160HmD6GoDwaGU0ZwjAdq9ebG+y5R0dSdsCnv8xuI/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6QUJmDR; arc=none smtp.client-ip=209.85.160.181
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-517dc520840so48060181cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141534; x=1782746334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=e6QUJmDRHXFIReAbVdxh3LMsnkhSYcpTYjyzw4EKufchmN1f+yqYpFIqP8qA50xnXf
         FeMi6ehYMZgFfC/R7W2CWcCeGgZ/7r8yeOxz+G8RWmd1zgJY9a/6Thv4KBe4bQwHiITy
         +9hmVDtkLIwIXttnoGguXAgFagIwrpfOi2kj6f3Bv0BkOwxRFaE3c3C0tXAeAIP57kBx
         nS1hhTzz4fmxhjhyzrwHVj6eRZ1GMcxupjzaeBW6iMIxGHnxlRKS/T47WTZkYFhCPxoL
         ZNTOlE+IgywElLSh8gJF7v1bO6g1gSgFUn90/jGdhgu3lYd4Fl/enwjyqrSphxw8lzqO
         qlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141534; x=1782746334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=Mfg99yj3U9HVMxuj2trjiTtOkMiANC4tQXakR8Fq1qGcO9o3bi/Ezmf1o2o9XqBprg
         mEaYmlWFUim8BNuDV/babGLkDaBFEjs960A849nCX38yP+XqNSNqIL5nZFszjQEOnVZj
         dJC8rMXDDBxkw9JCfsAVi+1UxPZ11Ahj/FdpMn15AHjg227H3Hoac7QZ9Yn2gYm1bFvg
         O9rNwK/ai4sEKxYL8FJZkWRfwyvm9Uey704R3JxAdrsWJa1m0wFP3R1RFEtEp8OtN857
         +FhAlfcDmx/QzXqFs2Mfv1Fv82wLQzEpZz3imt3YE5JCafSZcDXvmkfsDpE9LiGOHzac
         waog==
X-Forwarded-Encrypted: i=1; AFNElJ+XjkohOwfsdzNDxUTFZJH6S6u36VYM5PaT0UCb8E/GD7qGMxbmBYpsJ8HvOeBo5CRGaOGIf2AH7srCGd5d@vger.kernel.org
X-Gm-Message-State: AOJu0Yx08OCozExElITxiwulhnkqrcjwJv596I4YIKv5q1+T/avWn/Xd
	agWEdguPYE+hRkGRyIUKY10UJuGACArN8b1fizHU4ohH5+8clR+826q/VhCXaA==
X-Gm-Gg: AfdE7cnW/HcnwkX8JgJa/PVGi/5aYYYpWYVe3cwvHKfIj2EliqJSRat3l1yoiylS+qt
	19Z+G96+1ubbgPIUvtuAWKpy1HksPYmALiQRa6bWMkexE25a9NsuqgehLyjyjDy9t7s4RutuNtc
	STWlTM43gCUs6aPNgKWmgonBgMbF2cbcjcUPYBTAbpmUQ7bPX4KKazA6anGKoHMDZRyNd6lhAOB
	df0iCYbfmFb1nDFVWe8QfXwX0WV8Ak/N1xrl92G1/2pGw8Rfu6bB/8QOX20gApWTDG9eQ7WtSnd
	wc32KXXctryM3OH9ejo2M1K/x8CO1g4Z37dphHTM0BGJfdXWhvvUiZEQ3spDuXmq0h4hK6CDHsD
	+HBw6cocdGSbMCelzudTfIX47NDlxmG+UwDGXAgX/Ns+JAL1tgKNO7SjHQW+a2tMoKXC31Dkdxr
	tUAEJSO3fparhlF/yQ
X-Received: by 2002:a05:622a:5c1b:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-519e4c27793mr220029711cf.30.1782141533547;
        Mon, 22 Jun 2026 08:18:53 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0989f0a8sm70034291cf.22.2026.06.22.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:18:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:18:51 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ajlSW1NYc5qh1bL1@rdacayan>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
 <7f94caa0-48ba-46f3-922e-f16e39fd22c9@kernel.org>
 <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114042-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rdacayan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FAFF6B0A95

On Sun, Jun 21, 2026 at 05:54:17PM +0200, David Heidelberg wrote:
> On 14/06/2026 23:40, Srinivas Kandagatla wrote:
> > On 6/14/26 8:26 AM, David Heidelberg wrote:
> > > On 14/06/2026 01:53, Mark Brown wrote:
> > > > On Sat, Jun 13, 2026 at 09:55:59PM +0200, David Heidelberg via B4
> > > > Relay wrote:
> > > > 
> > > > > Currently this worked only because the cs35l36
> > > > > codec mapped both DSP_A and DSP_B to the same hardware register value
> > > > > (asp_fmt = 0), which is inherently DSP_A timing.
> > > > 
> > > > > The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which

No I don't think so, this devicetree property has no effect in
sound/soc/qcom/qdsp6/q6afe-dai.c.

For the Pixel 3a, it only mattered with the RT5514 codec.

> > > > > produces DSP_A framing.
> > > > > The codec format should match what is actually on the wire.
> > > > 
> > > > > So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.
> > > > 
> > > > That sounds like both.  The Cirrus driver is definitely buggy if it's
> > > > mapping DSP A and B to the same register value, at least one of those is
> > > > wrong.
> > > 
> > > I need to clarify. The CS35L36 supports by default only DSP_A, but when
> > > extended to "take DSP_B", speaker just works.
> > > 
> > > This was done previously.
> > > 
> > > Since there isn't any different configuration on the codec side when
> > > added DSP_B into same codepath as DSP_A, I would assume QCOM ASoC send
> > > DSP_A, just marking it as DSP_B ?
> > 
> > 
> > 		qcom,tdm-sync-mode = <0>;
> > 		qcom,tdm-sync-src = <1>;
> > sets the short sync with 1 clk delay making it DSP_A.
> > 
> > for DSP_B you would need, no delay.
> 
> Sure, does that mean the sdm845.c is currently correctly setting
> SND_SOC_DAIFMT_DSP_B there? or there is some missing part of logic deciding
> it?
> 
> Because the reason audio works when I convince driver either:
> 
> a) sdm845 ASoC it uses BSP_A instead of B ... or
> b) cs35l36 it uses BSP_B instead of A
> 
> implies to me, that:
>  1. both devices are setting the HW to either BSP_A or BSP_B mode (just
> don't know which one)
>  2. but the driver flag for ASoC or codec we setting on the driver side is wrong
> 
> If one side really used BSP_A and other BSP_B, the audio should be at best
> heavily distorted, right?
> 
> Please correct me, if I misunderstood or if there is nice doc I could read about it.
> 
> Thanks
> David
> 
> P.S. I did quick search what close-to-mainline repo has for Pixel 3a to
> reach working audio and it's slightly different, see [1]. There isn't any
> change done to the cs35l36 driver in the sdm670 tree.

I just assumed DSP_A and DSP_B were codec-specific.

> [1] https://gitlab.com/sdm670-mainline/linux/-/commit/9eba5aa993f5fb7b4bf5cc936ec22852987d3f9f

