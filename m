Return-Path: <linux-arm-msm+bounces-91227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nLYTHAoZfGlgKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:35:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E004BB67E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10FF530059A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED992C026C;
	Fri, 30 Jan 2026 02:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoj8VeoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB7487BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740551; cv=pass; b=Fh1lhpdkCrjBiGsM06xhF8cF+eYrXpmXDa5QHygHuJLF02wQmXsNmWm0KjhNGhiV1TmHEektoDdtR4UAUHWbESgdSsR3QRsOKR9VqBMMcIBhh3L9Jz3cXvFJ4/eGVnIGL16AgDVsKLgMBq1k2C+lqMe8SQzZNCR/ZNkl97Y99CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740551; c=relaxed/simple;
	bh=j3MmBobUyZ/Yewca+Z1muJGdrp32BQOliI48GaCvb4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYwfYDndi7B8uBSaVrUQpQfPkqiup3rGY+7aimyKe/648O5Y1EGkApUTr0d0VBqz2A6bEyiEEsU42XxjI+9o/qNTKp4HcL7FmKtohP97vVivOzwcqOYbUe2Lts6BmEefK8VjPFtMFXnoaji1WGW7aFxC12aetY9tzineSk8ENXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoj8VeoU; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b9fee282dso1485307e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 18:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769740548; cv=none;
        d=google.com; s=arc-20240605;
        b=HTBOMjum+SFSepTHgwYa1R+Yf5BVZnDPgNOTkZJAI3Mz8JDQ/oTBdeCE0BIjldSUfO
         O9QChJs/8snlox0POHViqPhb9+eMZmiVahq9AEr0zkDP6RzkJa8D9tvsN2HGMAQ9iOZt
         2TruBPN0NgwXQ6J4UEu9AuMvNCkzmrnzRRCrDp07AKGzaH/B6eunCRfP/Fy/g6nYtSj3
         WjmqS5ydj3HdcHoEpIyS4uRkJLNyqAcKmSIo/QohWN8k6Zh1n0KcGCNoLYJ4Oajmam1k
         AFldqUJS2rb/oo5MYTIK++GF1XVgr3hq4J/GgYLCvTfJcidOMEzyr0S+SNV8U2HEFyYo
         nNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfQevY56npd3hwhZFM0P1grjhwf9evHQq33AVRfyxJQ=;
        fh=+cPfRTS+HgckzGpeaiO0/OzkCZG+3+O9Pju1URbRu6g=;
        b=gImKCaZRXl6ixUEKkMg8DiMfNBGLGcXiD+Q3DHy4qeYUH2QL2qefajMXjkazqs7N//
         rVnJrvZPUjWQ6F4Wm3ui61idzsTPox4j7dxEcsot8qZedtkn9aa62B2Y+9xu61z7inzt
         qSQ5unFZHR2HVoI7ygF116tnD2TwPKeWWP9sV5PM12h49y3YOGeDostQJ37XR2duzK+N
         t4CUNekXtOntNLWyXFw4iY6l8QSRbIIbrEgvhe2SUX6ChyV9aScMZV9/rIvxMRZtVvu9
         ysXSgpIBfsDRt+kq8K/aw0O16et+aFvthWwHY78/tZCz89nKqSnau4z9/rQSqhl3x3Lr
         yiEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769740548; x=1770345348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfQevY56npd3hwhZFM0P1grjhwf9evHQq33AVRfyxJQ=;
        b=aoj8VeoUgh5xiB5LZag+t/jmvZx7ItBy7nQGMjNZDg13AWDQRW7J+myKG4vI+7GWUd
         7767Zi5b8EAEfV/06+c8lNT9fzCPg+OeP6YaM6OMwPEhwZvGrsswxhl1xPKPJeASntoz
         g8H5mJLm7LvwKZsDkxrYggmKW+bT3rsrFx3cM753Ap/BIBUWydkkLP5Eu1OnNSQFjsvB
         Q0GhUWF/ILw33BSJ13dgMWaHz4U6GilSVh6EJidSckoDfE4KihtPkxcaz61zlq2ZK5ak
         E5DTa8hjK42r+K3KWlm9jWo7QcZtM72yB1VvJu2r7RYtZE5NMknYXtPxwq5RCjN/oBcO
         DHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740548; x=1770345348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfQevY56npd3hwhZFM0P1grjhwf9evHQq33AVRfyxJQ=;
        b=nPayRg40rPFIepq54DT/eOoua39EaKrQGJF7HA4AZBVNb1G1EeYEi8dQPyCj/+IMAX
         f3VFOEkIg1kYBhhMhZZ6xHqGdAgaBqUdGcyFy507G4TaB9JmfrpdbilhWVmvM/Yqdjvr
         x/bX279lXON4i5sSWaDT3jPLMLvV45u2ylSgQcndQJBlWeR9FUFReYDVIus6lx+4L3OI
         QwZgVuOzy9eejBeOR8wioPP3qFtrsPFxflW1e5H1KdMOI0L5HDM5FQuqdNodxR8nuZuc
         UFK/J/7Z3sHwsRtNh6IXDN8HptiNyyOOlzr5L0Ng4sRNpItIV26IvblmgLNU77ZkDvKs
         sWdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0iAsmJPNf+1y0zhgirflImqVf8/F/1jdESHFlWOMCT4K1yU8C33Rc5vSYmeZKHkQ1tm0qlwo4u1Q/5TSw@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVcKpeI3Jx4zq6JCj4V9SxYC0+ONnUtPCfFC3D+mvMwor/KUu
	5snxtMJIKrdYbS/E2M9I2zHIGA+i/ZFabzKdC9KRalOo2NrsCYVGLfObPRN3mLg90NLhFBcIomV
	k3Co1bFcO1rmIpf0oISZNUtFdJVuU7UY=
X-Gm-Gg: AZuq6aKUP/5iuaBo3k2kCiPFE+6ncU8khKCAzl7O9Y4Of9AV5Dy9ovKXKyBLq5qlrCv
	OXwRFq+wCvO9UdI2kIBCGl0yAJL54djAuxlhuIIEbtGIdWGQmgX6yePflsCDejb1y6kc5c/pXey
	0S26YD0mnNGC0z2/5FK7wV1r0G7Eppssb8bfSvBrdGN57mwVpnR4vcges7/ZQqxjBCUWo6QZsMP
	2SalRyh8HoRUU3cIJyOo/K+FV/4FUuSskQGoaSJ86q6889t8RVEJfNTMJjsNhMAmI0RT2/rEbVe
	3yEVvRNQBCJrzElpHz/+hH/ZzYTzQuerPmfd0pQkv/KvhFw1NoTBPrb+qXrP4F6cz4nLDbiehFn
	5dWUlaob+Ov/6
X-Received: by 2002:a05:6512:3b90:b0:59d:fac0:3a11 with SMTP id
 2adb3069b0e04-59e1643dd08mr412935e87.45.1769740547482; Thu, 29 Jan 2026
 18:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org> <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com> <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
In-Reply-To: <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 29 Jan 2026 20:35:36 -0600
X-Gm-Features: AZwV_Qj0EiH-Ul1tuHcwh_uRRfBu1BbBMERdqo8JreQ7IqDvTJvmFLTfRttAdiA
Message-ID: <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E004BB67E0
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 5:11=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 1/28/2026 11:24 PM, Aaron Kling wrote:
> > On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
> >>
> >> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> >> <neil.armstrong@linaro.org> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 1/27/26 23:48, Aaron Kling wrote:
> >>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifical=
ly
> >>>> for Android, using mainline kernel drivers. I have come across some
> >>>> missing functionality and failures that I would like to inquire abou=
t.
> >>>>
> >>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> >>>> mainline. Using changes described in the gunyah watchdog thread [0],=
 a
> >>>> dtbo loads and the devices boot as expected. If any of the changes i=
n
> >>>> that post don't exist in the base dtb, abl will fail to load the dtb=
o
> >>>> and go to the bootloader menu. This appears to be an issue in the
> >>>> baseline abl code, affecting all devices of that generation. Would i=
t
> >>>> be allowable to merge a change adding those changes to the sm8550
> >>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
> >>>
> >>> Any addition to the DT must be documented in dt-bindings, so if it's =
needed
> >>> for boot they should be documented and added for sure.
> >>>
> >>>>
> >>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> >>>> have locally copied the commits from sm8650 and adapted for sm8550,
> >>>> and that seems to work okay. But no measuring of bandwidth was done,
> >>>> so the numbers are likely not entirely correct. Is there any plan to
> >>>> generate correct tables for sm8550?
> >>>
> >>> Cpufreq works but not the interconnect scaling, so doing the same as =
sm8650
> >>> is fine but since the values were calculated from downstream DT table=
s,
> >>> the same should be done for sm8550.
> >>>
> >>>>
> >>>> * As part of a series to support the original Odin 2, a patch to
> >>>> update sm8550 EAS values was submitted [1]. But that series stalled
> >>>> and this was never merged. If this change is valid, which per that
> >>>> discussion it appears to be, can it be resubmitted by itself and
> >>>> merged?
> >>>
> >>> I missed this patch, please re-submit, I also need to update the ones
> >>> for SM8650.
> >>>
> >>>>
> >>>> * Per the mainline kernel device trees and audio topology provide by
> >>>> the oem, these devices use primary i2s for the speakers path. There
> >>>> was a commit adding clock support for that as part of an hdmi series
> >>>> [2], but that seems to have stalled. Is this going to be picked back
> >>>> up?
> >>>
> >>> No, I do not plan to do this work, it required adding callbacks in th=
e
> >>> code to handle the clocks like done for the pre-audioreach firmwares.
> >>>
> >>>>
> >>>> * Inline crypto fails to detect hwkm support. And I see other logs
> >>>> online, such as for the sm8550 qrd, that logs the same way my device
> >>>> does. I traced the issue to the check for wrapped key support [3]. O=
n
> >>>> my devices, the derive call is supported, but the other three calls
> >>>> are not. I was pointed at the downstream headers for sm8550 support
> >>>> and only derive is listed there, the other three don't appear to be
> >>>> used in the downstream driver. Is this expected? And if so, will thi=
s
> >>>> case be added to the mainline drivers?
> >>>
> >>> Does hwkm work with you remove the last 3 calls ?
> >>>
> >>>>
> >>>> * Some gpu related clocks complain about being stuck off during boot=
,
> >>>> causing stack traces, but the gpu does work. I tried to do some
> >>>> research into this, but quickly got lost in the weeds and I have no
> >>>> idea where to even look.
> >>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >>>
> >>> This may be related with the display handoff from ABL, did you add th=
e
> >>> plat region to the reserved memories ?
> >>>
> >>>>
> >>>> * Sometimes when starting rendering, a bandwidth submission times ou=
t,
> >>>> then the driver immediately complains that said id was left on the
> >>>> queue. I have tried increasing the timeout, but the same sequence
> >>>> still happens. Timeout happens, immediately followed by a matching
> >>>> unexpected response. Implying that this isn't actually a delay /
> >>>> timeout issue.
> >>>> [ 1848.517020] platform 3d6a000.gmu:
> >>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> >>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> >>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> >>>> *ERROR* Unexpected message id 1015 on the response queue
> >>>
> >>> Weird the timeout was extended for this very purpose
> >>>
> >>>>
> >>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> >>>> unsure if this is a kernel problem or userspace, so I'm submitting
> >>>> here first. If the consensus is that it's a userspace issue, I'll
> >>>> submit it to mesa.
> >>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
> >>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> >>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> >>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_work=
er
> >>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> >>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_work=
er
> >>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> >>>> (com.futuremark.dmandroid.application)
> >>>> [ 1860.258126] revision: 0 (67.5.10.1)
> >>>> [ 1860.258132] rb 0: fence:    2884/2884
> >>>> [ 1860.258133] rptr:     36
> >>>> [ 1860.258134] rb wptr:  36
> >>>> [ 1860.258135] rb 1: fence:    -256/-256
> >>>> [ 1860.258138] rptr:     0
> >>>> [ 1860.258138] rb wptr:  0
> >>>> [ 1860.258139] rb 2: fence:    41563/41569
> >>>> [ 1860.258140] rptr:     1752
> >>>> [ 1860.258140] rb wptr:  2319
> >>>> [ 1860.258141] rb 3: fence:    -256/-256
> >>>> [ 1860.258141] rptr:     0
> >>>> [ 1860.258142] rb wptr:  0
> >>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRAT=
CH_REG0: 0
> >>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRAT=
CH_REG1: 0
> >>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>> CP_SCRATCH_REG2: 41562
> >>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRAT=
CH_REG3: 0
> >>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>> CP_SCRATCH_REG4: 3736059565
> >>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>> CP_SCRATCH_REG5: 3736059565
> >>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>> CP_SCRATCH_REG6: 3736059565
> >>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>> CP_SCRATCH_REG7: 3736059565
> >>>
> >>> @rob do you have any idea how to solve this crash on a740 ?
> >>
> >> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> >> something is unhappy about gpu pm.  I'd focus on that first, since
> >> that is almost certainly the cause of the later issues.  If things
> >> _sorta_ work (rendering UI, etc) you could try removing all but the
> >> lowest gpu OPP as an experiment.  Could be that power related problems
> >> surface when the GPU ramps up to higher OPPs.
> >
> > Things work amazingly well compared to what I was expecting. Using
> > mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
> > in the benchmarks that do run, compared to the stock Android. And
> > rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> > gives about 89% compared to stock, but there are graphical glitches in
> > some of the benchmarks.
> >
> > I set gpu max_freq via devfreq to the minimum available frequency and
> > ran the failing benchmark again. It completed once, but failed with a
> > similar stack trace on the second run. And per sysfs, the gpu did stay
> > at that minimum. Of note, that causes the benchmark to fail, but
> > rendering does recover and the unit is still usable afterwards.
>
> In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
> table. Can we add those (from downstream dt) and try again?

I don't know what I'm looking for in the downstream dt. But if such a
change gets pushed to lkml, I can grab that and verify.

> Also, are you using the latest stable release from Linus?

I'm not using stable as-is, no. I am using the Google Android Common
Kernel, based on stable 6.18.7 for my last set of tests. I
unfortunately don't have any straightforward way to boot pure
mainline. No uart serial or devkit or anything similar, like I use for
Tegra, which is what I am more familiar with.

Aaron

