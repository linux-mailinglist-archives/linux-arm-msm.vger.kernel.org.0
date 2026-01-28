Return-Path: <linux-arm-msm+bounces-91071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JOqM8NYeml55QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:43:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21733A7DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF10030432E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4F0336EC5;
	Wed, 28 Jan 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQjT2Wnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0537105B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 18:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625744; cv=pass; b=iyTiKqj2z/EaYAVVJfWsF/4m/Kn76DJZQaRDeOpC8yxIJay8Wmr5TfLAEKeFpFcKeD6p5l4ULH1ln6mdeCTP6wQEsS4wlCXplpevtz2YpO4VQLtbnMrPppRM4vJjAODfq0FXP4uRLf1v61Urdm8j3KWgGhN4xRQTp9j0NHoVEkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625744; c=relaxed/simple;
	bh=SSN2ESpT8myS2TGnYD4kekZqjwLGGsC/hCIYKj1miJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oP95Zd3D0sRAJmM03O/Dbak1EvtIL3dYKSmthC4bCEZwZ5okjHVb+6748Sr2DY+mput0jZtDtb62AluxIVBEYZYONtBGWcuWbr+VHwl7CBIf/S4Vg0z7GvfCI+M0ig5xj4rfEFvcYThX0iX8QOAKKdZxWba40YS0B1NhhL2+sh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQjT2Wnw; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de66fdb53so83358e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769625741; cv=none;
        d=google.com; s=arc-20240605;
        b=ARVyzypteikqXvQ6PoQWh5nHs1KHxbeTlpNzYKamoz7WfJnS0+aIwh4PLlUGxU25ef
         usJnhZlGRRQJXCKAwsL6dtWJc/EL1ITSTOA+EX5EuXYjLQf7kSUCdieFpxrKUi3tH9op
         D4KJviUCmwi9GXeDRMDHqdnofXVzE7Jw0xCuW12+6/Fn1cPc6+ggHb2p33OWPySYJMG6
         nEGEonWfyLCFlths0YuNeCEVsj0sxGTA6krc8Bw5mPCR1lHUc2GEhKC6vlZKXiGjcEe+
         YCiwkZxmhK84luC4p1eK2BOGMHfthPtKxbQAQ+SQOmr3nsd8iBiaP+Te6r5/FGAV0YlS
         PPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QShngfLNwpN56u5U+rPdj8r0Lm7eqOfAdSaQu+jY3S0=;
        fh=3uB+SAy1WMf9LkfBCjpLONsZCuIziSKmxhXfs/XV4wc=;
        b=hhjieK3qnyuW/Ny61PPe0lz3RSVNnLxAAtcxdBGEKOKHyf1MuQXNv8mRd6QRYSRdiv
         I+Dr/EapMS3JmzrluLPtLj5rqUdVRxNSXS8ipEC+D5edjGzNHcHgVs8PxUa6oBtHtgQP
         ahvXeZJtEjlj0jtuA8yFueWICZFCHuDTCo4W/cATHaYrVl60/9sfUkoE+YY6lvb/S869
         syIUzQpvH0SYQFT+QvC8iaEfe7zK53bIZrq3MYU0koUbn90a4Ol9I/nJxH9z3FGCKOcE
         KFQeGTICZdDIewquSlOYbOZ9d+DDp8zYd5PP6SNy+R1QKVGjHQ63rF+9lFGln4tdPlhO
         d/Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769625741; x=1770230541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QShngfLNwpN56u5U+rPdj8r0Lm7eqOfAdSaQu+jY3S0=;
        b=PQjT2WnwQsnGW+nu2l9B6/lQWm1+8A5wj8bfoxJzzkLCS346QyVKg7SZQYCBLYZDP8
         v/5LAb05UzJYulOwPiutisyxwWH7DUaNJATTfPc2MgyG0f+KbfSzO8nE0hmdzkA2fW2J
         DTcf5Z7KNZqCBd/65AjT2yhz8ipwfqSt6b5tEenVCmKBOcNHkNRvhp5PrKQ4RIPedT/l
         EfVjB2QI93AA4KNbFKU8PbdndLnz4MoAPyxViOPhXe3911SLAaKerQkZW9VwZYY/SRon
         OYij0CI/s8yKGiyFx+hFTmoNJzfztEyAtfjVLaUYpogFRrrK2v7r6Hji5xe1NmSbPbfT
         r5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769625741; x=1770230541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QShngfLNwpN56u5U+rPdj8r0Lm7eqOfAdSaQu+jY3S0=;
        b=tcA9sQ2KDrPWQQp6uKJhADf0lHW5PHYuCrUhC7mT2zo02yh7SOPB01HW+ES8GjeI9X
         SX8DKylz/nZu+/u/dd5YPxEP9LN9dNDVQkhIaye16JRk/NHhyHfaUBv5nqe8DDX5rfjP
         gcR3vGOC+Vs4Ya6QefqhSCP6seJ8cpCsq50P7O+Ju/pecjycawBRfpLynVmTCvk7Lx94
         fTEpuIjwYo7uMvof1Fqct1YpdFCpmrqV2rQOettuqLiDzavYLgbFRQsPf5Yktc0oGpyz
         eatg+TOT4WNk245kjT4INjeI6ac+lAJTFP/Ir8o+U6qenyW1u0NLJh5QFHdCA0LXrTLY
         hs8g==
X-Gm-Message-State: AOJu0Yzf4qVP07abM50VuZ0zBULGGZuIHDsRDD1eJSLQRMCr17e7Lgqj
	Q6UaCZHkicUzYi7OKNdeTYjx1ruvE9hiGiKO9GfO4tGYEn/e2XRcKUuB1en0DcJ9CUrG3murdTM
	jNEiV2h1VjxAJUJyrjPhdGxRB6kQEWGXOLvdaddk=
X-Gm-Gg: AZuq6aKnybW7myqQDCRdXghs40ZOTTWCWkDDnhtXioe/Qpfm5dvFx2eOsBLcKB7VPww
	OaG/QkAL4/+QFBw39J3DFgD74kW+ObXI/LyVG/j1aHLLFnJnC6FsFQfboDHm/uji/a44muyPpBG
	SZ2SCyKsNwNauP14PjkfEuRc1RANI3XRckV8hY5tYneN7Lj9loMbM34pLtdACFHSKs8QtAdUupt
	nuD3eqnJjwDmgzMIXEyYEyRITKfZ/HMCnFo4okuSEEOUQGzQ3ptaSDRNiDnufwDAB5e0z3GqFnf
	aURs3P1XU2WNMAM7BcJTyrOcCt3Duo9gZli1tUW9fOVJgR0MQcP+XsNPZw9tPRvrpno8pzTrbvu
	FlbIlF3GT4p7Ngg==
X-Received: by 2002:a05:6512:10d2:b0:59d:e77e:adb4 with SMTP id
 2adb3069b0e04-59e040253acmr2690914e87.29.1769625740411; Wed, 28 Jan 2026
 10:42:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
In-Reply-To: <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 Jan 2026 12:42:07 -0600
X-Gm-Features: AZwV_QjqheuLV-SztuyoJ0ZuoR266U6xcHr5DYyQ_S-x2E5m7eIPUh0SSxQkHew
Message-ID: <CALHNRZ__VTqAZ16Hn9QVN6-tS3eb7mfeY6hzDfw5AmBOHqfKHg@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91071-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 21733A7DA9
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 2:50=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 1/27/26 23:48, Aaron Kling wrote:
> > I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> > for Android, using mainline kernel drivers. I have come across some
> > missing functionality and failures that I would like to inquire about.
> >
> > * ABL fails to load a dtbo using a baseline dtb unmodified from
> > mainline. Using changes described in the gunyah watchdog thread [0], a
> > dtbo loads and the devices boot as expected. If any of the changes in
> > that post don't exist in the base dtb, abl will fail to load the dtbo
> > and go to the bootloader menu. This appears to be an issue in the
> > baseline abl code, affecting all devices of that generation. Would it
> > be allowable to merge a change adding those changes to the sm8550
> > dtsi, allowing an unmodified mainline dtb to work with overlays?
>
> Any addition to the DT must be documented in dt-bindings, so if it's need=
ed
> for boot they should be documented and added for sure.

I can make the change and see if bindings check reports any new issues
before uploading.

> > * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> > have locally copied the commits from sm8650 and adapted for sm8550,
> > and that seems to work okay. But no measuring of bandwidth was done,
> > so the numbers are likely not entirely correct. Is there any plan to
> > generate correct tables for sm8550?
>
> Cpufreq works but not the interconnect scaling, so doing the same as sm86=
50
> is fine but since the values were calculated from downstream DT tables,
> the same should be done for sm8550.

What am I looking for in the downstream dt? I'm not greatly familiar
with that layout. But if I get pointed at the right stuff, I can do
the legwork.

> > * As part of a series to support the original Odin 2, a patch to
> > update sm8550 EAS values was submitted [1]. But that series stalled
> > and this was never merged. If this change is valid, which per that
> > discussion it appears to be, can it be resubmitted by itself and
> > merged?
>
> I missed this patch, please re-submit, I also need to update the ones
> for SM8650.

Ack.

> > * Per the mainline kernel device trees and audio topology provide by
> > the oem, these devices use primary i2s for the speakers path. There
> > was a commit adding clock support for that as part of an hdmi series
> > [2], but that seems to have stalled. Is this going to be picked back
> > up?
>
> No, I do not plan to do this work, it required adding callbacks in the
> code to handle the clocks like done for the pre-audioreach firmwares.
>
> >
> > * Inline crypto fails to detect hwkm support. And I see other logs
> > online, such as for the sm8550 qrd, that logs the same way my device
> > does. I traced the issue to the check for wrapped key support [3]. On
> > my devices, the derive call is supported, but the other three calls
> > are not. I was pointed at the downstream headers for sm8550 support
> > and only derive is listed there, the other three don't appear to be
> > used in the downstream driver. Is this expected? And if so, will this
> > case be added to the mainline drivers?
>
> Does hwkm work with you remove the last 3 calls ?

I would assume not, since the ufs driver [0] references all four. And
the plumbing doesn't do any further existence checks and just makes
the smc calls.

> > * Some gpu related clocks complain about being stuck off during boot,
> > causing stack traces, but the gpu does work. I tried to do some
> > research into this, but quickly got lost in the weeds and I have no
> > idea where to even look.
> > [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>
> This may be related with the display handoff from ABL, did you add the
> plat region to the reserved memories ?
>

I did not, for these logs. Earlier in bringup, I did try to make abl
leave the display on by adding the splash region, but that just caused
display corruption before the kernel reset the display controller, so
I pulled that back out. And I saw a comment somewhere stating that
seamless handoff is not supported. Is that still the case, or should
seamless handoff work now? It would be a much nicer user experience if
it did.

Aaron

[0] https://github.com/torvalds/linux/blob/master/drivers/ufs/host/ufs-qcom=
.c#L311-L314

