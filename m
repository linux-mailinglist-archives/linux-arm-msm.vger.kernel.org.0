Return-Path: <linux-arm-msm+bounces-90885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJhDOOlAeWmAwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 23:49:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D669B39C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 23:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8542C304BC34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 22:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA48329C33F;
	Tue, 27 Jan 2026 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie2caQ/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A62EA743
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554099; cv=pass; b=k8uRL/BVLf3QZSVLmiiYtlaYU8tPrGh1qImE3F0xytVyHJBtUzPEQJh3qAA3LmNw81u+pXv7MndgBXqFjX6wW/KqhyaqsJjtlS4oOCJNfutzmwbejOqJCGgqjROoOghZR8nQS2ga2ZEs1p5dn03uIi9WyTaHanZtKYHn4418PqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554099; c=relaxed/simple;
	bh=2NL5AU87jw7eHv2qc9bZdWKH47aqOOf4AHFuhvmkk6U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Q820cSl3eeFsww1zfBFiPDqVKxIxuN6oPd1nCjYIK3gFlts1Avsttg2Pl7iJ1AHlEhEYhVzpJSWLafsNPBTyNaw4GENk0xkgSV4+PIDv1e452FtqeCZm8B87jxG3siM2+O1GF1N6KH790DZMDStKDQonkAJydbMjgiSujVeMyCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie2caQ/2; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b9fee282dso5735097e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769554096; cv=none;
        d=google.com; s=arc-20240605;
        b=azzijZG1e9ZggcdEqIQ99EbrSA0gqKcwC3RxVoDF52FjhqUIakpsBK9Ot3ZFhdR0Qr
         Olu4Vdh9g5+hi20Nm1QsWFHVnSFXLLzfSzl+KSRNBT/ExKrPgD2GK/CxbQUtO4fu6TjU
         Aj42Lq+lnwkCeA6MjlJfgKCrethrZ4bsKFNBGmc29JltLtxie9dJnUZCLKBojzx866jo
         ZRnARZLA3HNYn/btoAwb352pPEYWSR5+5QJnVqZyJ0yEPpFtV8iaanThU28UG8TFaKQm
         d26ufOpZ8WebRuD1sHJpjjuaISKuC4xF00YodipeLSozo7r0DXtYb76ja8+w+tweAX/V
         o2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3DRH690mL4UNAvYwFOry8Dvkh4ilXtn44oEglO3OUM4=;
        fh=4DSx710/R75jCegsRZ6qHzUBAuib6L37GCW1qeOndFc=;
        b=RaxAssEMbM0cjCYICKItS7GT51TYnKiO6dhhiqBOVW1jNqnCm45sWQ1MptKkOGyF2p
         TcuyPoTXbm/+DxKawhdYTbq7VfSUe0kpU3phUk1OS3Bu+aRibA+girH7qzoMfIL7dWLC
         yfU9G7O9AYJREogPEaftXFYHsOJDzV0Rb+J2CN2d/mW2QfFrBdpO2AyDDmL1YnaGmDMz
         mr7FTmeiJqoKFs0I7xj4Q7ipSRod0W+t9YwXxiHzozP5NVio9AwMiOrOdQuyAzeirM0i
         m1gpIa6ZZdH5tA80qYPP/LWybfjd7OxNhWJzc0AeC0BeFKqy4mrLaKiH63hLd6EfYi8W
         hdcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769554096; x=1770158896; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3DRH690mL4UNAvYwFOry8Dvkh4ilXtn44oEglO3OUM4=;
        b=Ie2caQ/268ygSZ/YCuEOKoQldkTcSkViYVSz6a9JNJE9Ue4YSvVO0wLDjvrpfnc9BA
         gP8lvvMTeKSRox19iV8ipcu7UOUVQ3LT6rgOFLryEySEUHsyrgnn2uDgVHfmBt1eU+3f
         tMUt6YMZFGcTy1Y8e/XcL+qOV7aQGAvTliGIw8rdX2nXlRS8c8yUg5g8n//LqrY0TMhW
         BTtwIny/zMdIrcgctoTMPzbBz3odIJeRm5UU542YQTHAWdHaWexyd85aNIvKpAIyl98J
         vgsDVcs5PWdpDcAr1k8ItEfOCjJ1NOICLvnyHLU0LRHikR0Fgf/Lh2cSBgfbeNbZa1C/
         l/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769554096; x=1770158896;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DRH690mL4UNAvYwFOry8Dvkh4ilXtn44oEglO3OUM4=;
        b=TtOsWmgSR77MFskIOjHf1sM5hlY8ww2aRm8mBijU1nVMnXcC1HG83defe/KHlTiUjB
         C8ZEmdm7Q4HAqM3G30WhQcP19ZOWvKZrKslknYCALLQ2GJJqikzuz5PYettJbBqYAJX3
         AYTBdL2NQRn1GRXvJzQU6im16A4uNeh8oOqtlu+paLcGrKbxDVCZHfDfgIbBEFulrgvX
         thNujbDlt69QYIjNZToWd5NswL2YRbfPHpLpzdMoISSbGK+8UpEhaMVnciaB7sXpioAY
         F4cUH5iUUAhXszAwsShXPC1ram3lrpAo4VOGVo70vXAwFAPApfU6/SL6nTQbwZYo2elT
         4D/w==
X-Gm-Message-State: AOJu0YyXURU6IO8bkaWOZxBeKFc38u3tQOxihZjeN0QS36XOX72EkeYn
	DRMCnaVQXJHevn25I3YNkAo9Esc27c/rA+5zq57IWuJmGTeUjYXlIEQUlwjI2rRQtWklnm8yALn
	x8GNVeGKPvvDj2HfZWEYJ5RVucaYaIhit+eVv
X-Gm-Gg: AZuq6aL6KBwjDr/nOhRt7k5pZtxHLJh0OBWbc9p/DXK9ZdoNxBatKZs/5stZ1Cv5Mug
	sbLC62w4SM22AYTRO30Jr9TbtzjgHdlYcEk3a4rU1KsJoILmKFIOWRpGNZFlZpshkj7OEmIO9oL
	x+WMDvTDaCA2NK5tYAj2HZAanbBd21kCKbO8yC9Fx/I+prI9tQY1cvUdZiSiv1KiW1ld916pEl4
	lCs6eW0VRZxgeADvhQT48hLOP/ZQ5fMbB/86LJstgjcyFYszJAywRwp9OwW7A/zB9hquER/TrtQ
	+BD8OjbS1hYw88EUfBD+KVRY2DX4LNF5vLpcXYs0eEYBI6YKC/ZARZh2fat/IWuevHk=
X-Received: by 2002:a05:6512:3ba8:b0:59b:7291:9cc2 with SMTP id
 2adb3069b0e04-59e0413027fmr1255079e87.37.1769554095929; Tue, 27 Jan 2026
 14:48:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 27 Jan 2026 16:48:04 -0600
X-Gm-Features: AZwV_Qh8YnJ6_dmSvI8GtgI6R1gwxwTVk6nYVEat9vMh5Ny9xjQymMXyzb_wNbg
Message-ID: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Subject: Questions About SM8550 Support
To: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55D669B39C
X-Rspamd-Action: no action

I am working on the AYN Odin 2 qcs8550 series of devices, specifically
for Android, using mainline kernel drivers. I have come across some
missing functionality and failures that I would like to inquire about.

* ABL fails to load a dtbo using a baseline dtb unmodified from
mainline. Using changes described in the gunyah watchdog thread [0], a
dtbo loads and the devices boot as expected. If any of the changes in
that post don't exist in the base dtb, abl will fail to load the dtbo
and go to the bootloader menu. This appears to be an issue in the
baseline abl code, affecting all devices of that generation. Would it
be allowable to merge a change adding those changes to the sm8550
dtsi, allowing an unmodified mainline dtb to work with overlays?

* SM8550 does not have cpu opp tables, thus cpufreq does not work. I
have locally copied the commits from sm8650 and adapted for sm8550,
and that seems to work okay. But no measuring of bandwidth was done,
so the numbers are likely not entirely correct. Is there any plan to
generate correct tables for sm8550?

* As part of a series to support the original Odin 2, a patch to
update sm8550 EAS values was submitted [1]. But that series stalled
and this was never merged. If this change is valid, which per that
discussion it appears to be, can it be resubmitted by itself and
merged?

* Per the mainline kernel device trees and audio topology provide by
the oem, these devices use primary i2s for the speakers path. There
was a commit adding clock support for that as part of an hdmi series
[2], but that seems to have stalled. Is this going to be picked back
up?

* Inline crypto fails to detect hwkm support. And I see other logs
online, such as for the sm8550 qrd, that logs the same way my device
does. I traced the issue to the check for wrapped key support [3]. On
my devices, the derive call is supported, but the other three calls
are not. I was pointed at the downstream headers for sm8550 support
and only derive is listed there, the other three don't appear to be
used in the downstream driver. Is this expected? And if so, will this
case be added to the mainline drivers?

* Some gpu related clocks complain about being stuck off during boot,
causing stack traces, but the gpu does work. I tried to do some
research into this, but quickly got lost in the weeds and I have no
idea where to even look.
[    0.367278] gpu_cc_cxo_clk status stuck at 'off'
[    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
[    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
[    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'

* Sometimes when starting rendering, a bandwidth submission times out,
then the driver immediately complains that said id was left on the
queue. I have tried increasing the timeout, but the same sequence
still happens. Timeout happens, immediately followed by a matching
unexpected response. Implying that this isn't actually a delay /
timeout issue.
[ 1848.517020] platform 3d6a000.gmu:
[drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
[ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
*ERROR* Unexpected message id 1015 on the response queue

* Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
unsure if this is a kernel problem or userspace, so I'm submitting
here first. If the consensus is that it's a userspace issue, I'll
submit it to mesa.
[ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
00000001512E9000/003d ib2 00000001512E7000/0000
[ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
[msm]] *ERROR* 67.5.10.1: hangcheck recover!
[ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
[msm]] *ERROR* 67.5.10.1: offending task: Thread-23
(com.futuremark.dmandroid.application)
[ 1860.258126] revision: 0 (67.5.10.1)
[ 1860.258132] rb 0: fence:    2884/2884
[ 1860.258133] rptr:     36
[ 1860.258134] rb wptr:  36
[ 1860.258135] rb 1: fence:    -256/-256
[ 1860.258138] rptr:     0
[ 1860.258138] rb wptr:  0
[ 1860.258139] rb 2: fence:    41563/41569
[ 1860.258140] rptr:     1752
[ 1860.258140] rb wptr:  2319
[ 1860.258141] rb 3: fence:    -256/-256
[ 1860.258141] rptr:     0
[ 1860.258142] rb wptr:  0
[ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
[ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
[ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
CP_SCRATCH_REG2: 41562
[ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
[ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
CP_SCRATCH_REG4: 3736059565
[ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
CP_SCRATCH_REG5: 3736059565
[ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
CP_SCRATCH_REG6: 3736059565
[ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
CP_SCRATCH_REG7: 3736059565

Aaron

[0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
[1] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-7-e0aa05c991fd@gmail.com/
[2] https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/qcom/qcom_scm.c?h=v6.18#n1285

