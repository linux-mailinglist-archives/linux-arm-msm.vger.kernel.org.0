Return-Path: <linux-arm-msm+bounces-91069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON+gOEdOemkp5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:58:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EADA75D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B62A03001599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502E23612F7;
	Wed, 28 Jan 2026 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7zviqvI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6714B32AACF
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622904; cv=pass; b=PtVMThO1AuqoDJzVftTvgRbHA0At2fEKhuFNeRJWFOJLIzdp/9cRPuhssgEnvgQSbXEQROdCqe5kS0t632N6ANA9ch2K7V2YXFC3OzIIATOB8etU0ovp1GSaToGBirsd9txrfXP6gCtNIXVS7HlkfmiNGwpJiXrtywQyuQKOzbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622904; c=relaxed/simple;
	bh=NOO9hbQ8CLL3ignR4ssL2tF5jT4Kw3WzIa9FwqenBMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zc9pij6AA7t5kMN2Lsdj0T/KsO6wcfLV4pLp3SkOr7KxrSRngi+unqfcLhuYHEgV6WUye4UhDpAJRHiouqAGHcG/I2A2bZJLIXjznr35I9+2YxkYORPKmNKZRSnLvAh4AormuDaZluT+wpjoidmgzCmh494RNZguJXRiZwEzXM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7zviqvI; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b6f267721so48508e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769622900; cv=none;
        d=google.com; s=arc-20240605;
        b=b7y33T+kAYraAS1s/AqE+QQii5LaDbORjZ/ZTNWYeHRKTBABT26ZqEfbFw/uQdiLWW
         COgr5HX/7RpvICE0Q1SZKW4eeYWJu91ZvMmfch9H3PEMbul51GcuqmrPDm+gFMSYlmBz
         LjykOLye8nSIloBCHNO0rTFMxxF8YJg4UxyalwEt017HxoPb+V/ZHYrreRpMHrnHbl5o
         HamPsSVnP4UQri+H6RCKz6fqmSpMmrCroWSIw2c0tKSADr5pVH+V0m0mNmCjzM4VcRvM
         DsTUsPEh0ny/cWblt0be9xCuHWPyKAdmH5ILyyfM7JGnigvsAZsosQBDcvGsxR8QCBNy
         EN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/bzjCXj5l70khunrOti4+5Gr8UHVn0/er6X1dgJpVM=;
        fh=xCDkBesJ2mGyGBJ6IPNMHQJeFO9i82rDjdo1T3Viv04=;
        b=DWAKLe0Ei3rGxKlkKvppF9tf6SBsBnRi/JKFR2LKnIMpIn2PhcCbrUbgUF3y4ojY3M
         G2WVZeavBSAOmSL+DrGEX312XjIWu7T3M6SmW28A0YiZjWX08A3rl3sibyKDfrkq6m+k
         ESvVv9z522nOJUyX2u3d/ha9S7DEEgN6nBzE5I6FubdyoA6YaRHQzjTeTC4hu1ybwjqh
         Bguh2P7M5vRdNDVKyuwTWkuFw1dMr1qmdx0vkRcWUhFlBM34BQCe5u9JDPVnSnvWZfrn
         VobuY751ApJ2Juh7+ExTS3G03Q/kboZyLWScCChcIRbSsNVVxw84NOpIUXrlfn97n0R9
         NyDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769622900; x=1770227700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/bzjCXj5l70khunrOti4+5Gr8UHVn0/er6X1dgJpVM=;
        b=D7zviqvIi+kizYtG403mx+gwQp07dIRNqOFYpl1UAWHmZ3WcfxEalTnlwwIRkqjzZK
         s2MeD3uFGiRNceY8q4TnNiGop6KLdJmZxH4go54BVAnHB7mz645XbqmN0O8xDRcYWx2l
         HZ1t55dzv3omkWJanjcoqzniz/7rti5ZywLfqZEexnEFq3iGDCWJMcV10Y/JcT9gdP2f
         aa71kgvNCkBBtxhZzA/m6VqHwKrFGXE/S5MPAZwpOgT8qln1pLp3XqxsNbEvleXBtv7u
         uK0QlNdSajsFyo/WlkEqqlqR6q2x2fbDulJGMJB4js409QNFX/cVKRVsn1nQg09tXHNy
         avdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622900; x=1770227700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/bzjCXj5l70khunrOti4+5Gr8UHVn0/er6X1dgJpVM=;
        b=fMfqC945Lcwdm498aNpONRLViLfmGaAZTD28w2jy7xbN3M+qmEOQeWc91bAsR7JIE9
         B97ktX6UCO7fpiMBh7LCc5yorCzAxuKjZvLOX1KCwXB5Gt/jnlW10WOcujjIjMQP51HY
         f46NSZadhVR2hZJquqhIRLA5tWghJcO1UOr7IJ6TdAVRzaML25/iSziPuUG5UJVnsLvM
         +vMcoUVh/9q56wyV7uowJt0B8/fYE1hWKmSl3eZhk2ENTcqLVxcrZMQ3l5cuGKSPosfY
         hXwd9IUkjBCeYdN/fgI1DT1JVH6a/60H7qhjBR0K2W4Lgob5ZB6vIjvoT8bOm673jO8C
         ataA==
X-Forwarded-Encrypted: i=1; AJvYcCXEPc8dWrZ6u8FYW4YdCR8FtrNyOCc2qT9me9Fmt3rSl8wjEX6SDT+Kuom+I2ySul1OoMdQd4KOWBzicjm0@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYUz/r2LzYeyxvVBvrpk8pkfmvT0pL4q8EnElXjIiN/ayU+sk
	gbSiCKx0gQJdxglKyGZJMJ5trfCaJvzUscqtn2WkwWUPTgjzJo0dm+lnfCzZAYtPjm3Xu7/H752
	6JlfbmoNUxBEf9Rqs8ZvyVG9fLZHweIiJgQ==
X-Gm-Gg: AZuq6aI7v3htshfkw1Q/E7YQtenjBXipgMj+UxeVo6nj6J3KXAG2UH26QT6ncyxc92O
	aH0rdFMkdfP1zfh2ASneQEuWn5P7uUSqzv5bf061+ptH7/SzkbnqHB2xxIQzn06KnYeEK3rAgw7
	ZH+Nebs6bnbBv1YSia3P4rDWq2kNLNAJ2eZXF3K+MYX8qgW3y6En1SyxIm1qAH1mESkioQ7zVEM
	epmOvgSqVcpyBsr3vTa4pVSuAeswEP5TY91fERfPROn5CRY9Mh7JvFofdlLjraHMGGvIrVfG4dj
	4sLLBF4LaAGItTzh2jog3yXNcvlqCTojfFTBEI7dAM9Seanp/QkN0p01OqLuxxUFDCaIE20Zt5Y
	Uu3RBm5DiTpUwLg==
X-Received: by 2002:ac2:464c:0:b0:59e:6f4:d24c with SMTP id
 2adb3069b0e04-59e06f4d35bmr1077546e87.25.1769622900160; Wed, 28 Jan 2026
 09:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org> <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
In-Reply-To: <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 Jan 2026 11:54:47 -0600
X-Gm-Features: AZwV_QhGNb7VCvaxdAsO0b-aiKY2W7WC82ZmNCOp7e2P46a4DTFyYpW8pgy52dg
Message-ID: <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: rob.clark@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-91069-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 19EADA75D8
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> >
> > Hi,
> >
> > On 1/27/26 23:48, Aaron Kling wrote:
> > > I am working on the AYN Odin 2 qcs8550 series of devices, specificall=
y
> > > for Android, using mainline kernel drivers. I have come across some
> > > missing functionality and failures that I would like to inquire about=
.
> > >
> > > * ABL fails to load a dtbo using a baseline dtb unmodified from
> > > mainline. Using changes described in the gunyah watchdog thread [0], =
a
> > > dtbo loads and the devices boot as expected. If any of the changes in
> > > that post don't exist in the base dtb, abl will fail to load the dtbo
> > > and go to the bootloader menu. This appears to be an issue in the
> > > baseline abl code, affecting all devices of that generation. Would it
> > > be allowable to merge a change adding those changes to the sm8550
> > > dtsi, allowing an unmodified mainline dtb to work with overlays?
> >
> > Any addition to the DT must be documented in dt-bindings, so if it's ne=
eded
> > for boot they should be documented and added for sure.
> >
> > >
> > > * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> > > have locally copied the commits from sm8650 and adapted for sm8550,
> > > and that seems to work okay. But no measuring of bandwidth was done,
> > > so the numbers are likely not entirely correct. Is there any plan to
> > > generate correct tables for sm8550?
> >
> > Cpufreq works but not the interconnect scaling, so doing the same as sm=
8650
> > is fine but since the values were calculated from downstream DT tables,
> > the same should be done for sm8550.
> >
> > >
> > > * As part of a series to support the original Odin 2, a patch to
> > > update sm8550 EAS values was submitted [1]. But that series stalled
> > > and this was never merged. If this change is valid, which per that
> > > discussion it appears to be, can it be resubmitted by itself and
> > > merged?
> >
> > I missed this patch, please re-submit, I also need to update the ones
> > for SM8650.
> >
> > >
> > > * Per the mainline kernel device trees and audio topology provide by
> > > the oem, these devices use primary i2s for the speakers path. There
> > > was a commit adding clock support for that as part of an hdmi series
> > > [2], but that seems to have stalled. Is this going to be picked back
> > > up?
> >
> > No, I do not plan to do this work, it required adding callbacks in the
> > code to handle the clocks like done for the pre-audioreach firmwares.
> >
> > >
> > > * Inline crypto fails to detect hwkm support. And I see other logs
> > > online, such as for the sm8550 qrd, that logs the same way my device
> > > does. I traced the issue to the check for wrapped key support [3]. On
> > > my devices, the derive call is supported, but the other three calls
> > > are not. I was pointed at the downstream headers for sm8550 support
> > > and only derive is listed there, the other three don't appear to be
> > > used in the downstream driver. Is this expected? And if so, will this
> > > case be added to the mainline drivers?
> >
> > Does hwkm work with you remove the last 3 calls ?
> >
> > >
> > > * Some gpu related clocks complain about being stuck off during boot,
> > > causing stack traces, but the gpu does work. I tried to do some
> > > research into this, but quickly got lost in the weeds and I have no
> > > idea where to even look.
> > > [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > > [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > > [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > > [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >
> > This may be related with the display handoff from ABL, did you add the
> > plat region to the reserved memories ?
> >
> > >
> > > * Sometimes when starting rendering, a bandwidth submission times out=
,
> > > then the driver immediately complains that said id was left on the
> > > queue. I have tried increasing the timeout, but the same sequence
> > > still happens. Timeout happens, immediately followed by a matching
> > > unexpected response. Implying that this isn't actually a delay /
> > > timeout issue.
> > > [ 1848.517020] platform 3d6a000.gmu:
> > > [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> > > HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> > > [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> > > *ERROR* Unexpected message id 1015 on the response queue
> >
> > Weird the timeout was extended for this very purpose
> >
> > >
> > > * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> > > unsure if this is a kernel problem or userspace, so I'm submitting
> > > here first. If the consensus is that it's a userspace issue, I'll
> > > submit it to mesa.
> > > [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
> > > fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> > > 00000001512E9000/003d ib2 00000001512E7000/0000
> > > [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worke=
r
> > > [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> > > [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worke=
r
> > > [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> > > (com.futuremark.dmandroid.application)
> > > [ 1860.258126] revision: 0 (67.5.10.1)
> > > [ 1860.258132] rb 0: fence:    2884/2884
> > > [ 1860.258133] rptr:     36
> > > [ 1860.258134] rb wptr:  36
> > > [ 1860.258135] rb 1: fence:    -256/-256
> > > [ 1860.258138] rptr:     0
> > > [ 1860.258138] rb wptr:  0
> > > [ 1860.258139] rb 2: fence:    41563/41569
> > > [ 1860.258140] rptr:     1752
> > > [ 1860.258140] rb wptr:  2319
> > > [ 1860.258141] rb 3: fence:    -256/-256
> > > [ 1860.258141] rptr:     0
> > > [ 1860.258142] rb wptr:  0
> > > [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATC=
H_REG0: 0
> > > [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATC=
H_REG1: 0
> > > [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > CP_SCRATCH_REG2: 41562
> > > [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATC=
H_REG3: 0
> > > [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > CP_SCRATCH_REG4: 3736059565
> > > [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > CP_SCRATCH_REG5: 3736059565
> > > [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > CP_SCRATCH_REG6: 3736059565
> > > [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > CP_SCRATCH_REG7: 3736059565
> >
> > @rob do you have any idea how to solve this crash on a740 ?
>
> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> something is unhappy about gpu pm.  I'd focus on that first, since
> that is almost certainly the cause of the later issues.  If things
> _sorta_ work (rendering UI, etc) you could try removing all but the
> lowest gpu OPP as an experiment.  Could be that power related problems
> surface when the GPU ramps up to higher OPPs.

Things work amazingly well compared to what I was expecting. Using
mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
in the benchmarks that do run, compared to the stock Android. And
rendering is correct everywhere that I've seen so far. Mesa 25.3.3
gives about 89% compared to stock, but there are graphical glitches in
some of the benchmarks.

I set gpu max_freq via devfreq to the minimum available frequency and
ran the failing benchmark again. It completed once, but failed with a
similar stack trace on the second run. And per sysfs, the gpu did stay
at that minimum. Of note, that causes the benchmark to fail, but
rendering does recover and the unit is still usable afterwards.

Aaron

