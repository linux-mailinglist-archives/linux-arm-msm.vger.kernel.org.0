Return-Path: <linux-arm-msm+bounces-87916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300FCFE38F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 15:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4122C3099541
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 14:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B0A32A3DE;
	Wed,  7 Jan 2026 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNWfVmQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB132D439
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794981; cv=none; b=M30uX72Rrz4y7/DYyBPQUB+c5HbObAZJHV+hdIsD1bMH9HzskGoencqEUEWt/gEvPg9yd2XvnMpoE1bOe3heQ0lI+b0sW6ceKn8mHL3MRsCfVQpqSuo28+Zsh+Zvc4n9yLA2s22tbuSarJuJEq/4lmmHwpP5Sj0gGl7uuJ6pQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794981; c=relaxed/simple;
	bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HwzGUaLEydRwXwB/LngUQZUTH2wM1d/PdtV+/zcINWiZ7JL8w4xnfVuPKUxXaXpsb9aF5zLMGYrgKjqjzHnmFmfbU5up0toT+Y+0coNEvVGWym/rLUAu/8CAIsngFdSZ+ZFEAptckqbz1LzknQ0ec5N64f+XQFG8MpDhfgtP4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNWfVmQu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so327109966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 06:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767794977; x=1768399777; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
        b=YNWfVmQuiDWTbbQ7X1PJvY6RcaL3eoXqMlAa96zw+XRP4yAv5gAeSJExZ5iipsBxtT
         EN8sPQxVx5AHo8u1ZuETu1xshyjNpoKmF3UzRA0wv/NxpmM6i6ai4/9hQ9aS6lqQC2x+
         08j/aQFWtMUMfuZMVOyulNs8aMxKW9QWmDonsejUQo5F2XyrCF77uR6Y0YVt9TXAP+p+
         a2Q+VKicvY2dgPL71pUm23ujkGDiWw0EMMbIRXI7f5mVwNJ4vMfjkUzRhH/8BlfQFjmd
         4BcQSLku/XxjTUd8Sel05sWy2SM2DQUd9xc6HyjPlig5h+eCTuRJk0II5mlCi1GKOUoa
         hilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794977; x=1768399777;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
        b=U7eHhfOo5rkfD6foSoTEJKj1qnn3AN2C1hSE5wWPiUfs4KMjtR1lEjOyDJfXYEDRVk
         RYpI0Zshw2rqKCSPwaEthbGTGleO8tiM/IZ9gAtLzcMYewu3ewmuZnKPk6xA2yqs6niv
         ytJZ8FtUi/b0mcWmmToPMTyYm+k31+2ya2Nj+sBIctcu4JmSW4tlmkCGAb324dRUJHzC
         +CIyqKg/2btFakK3f93g02eslLWDQ5ewYRKcD+4aFgQOWe01wNLZ+UtWpJsJNpiajCEn
         y2iiAlkfbh0WprDVxY02z5G8htUw9GppgifrAEj4jnlPVgFdjuCuKzFDET2hJb59mtbi
         apiw==
X-Gm-Message-State: AOJu0YwBOXkNydOH9GjMzAEkg0t7zMkOZk5EwCbYcI8bJA2lCku77KKR
	LaGaso3iGnX5MRO21DhPJiTxAIfYKjdlrNDWbFSEneXZmA0z3DwUPIcmREOwzrIMlzu+OXL5s+m
	v8dpLq8pvf/sd7qKO8CzqaUj15fKuvpuKJ2uI
X-Gm-Gg: AY/fxX6UFMqdU0EALhhYYitOW1bbwLxPqUoye92fzJx3pQhKUQpKFDQlM/Sv62SFt1d
	gtMdhml1d8i0rIgYN5B6jg+e497Y1BAgtH++Mm+qQloZki0oL9p9bLq6/5eOmIMbHFQGxp3YnjU
	qsW2uKePygZP+1N18P6TzSezCdTsFihHIcoyZrFi0+bh2m7eav2v3aInJmLgLHOGNoCY2N+NtdN
	/zAccXydfbGhlR/9dIDqTaG77s1mGOuOUs3XMXlntzmvEc3tR5RZJp3xMt/itDIArtMq2WOGQ==
X-Google-Smtp-Source: AGHT+IHB1ElVLKUSfybEW8BNvkAIlPOaoJx/n7ohxMjm45b+TUZUmz97L0ViKc0aq9l8mzOd8JIwzjAVbHviBOrx/O0=
X-Received: by 2002:a17:906:6a17:b0:b76:2517:6927 with SMTP id
 a640c23a62f3a-b8444f96644mr300137466b.43.1767794977053; Wed, 07 Jan 2026
 06:09:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Simone Flavio Paris <simone.flavio.paris@gmail.com>
Date: Wed, 7 Jan 2026 15:09:10 +0100
X-Gm-Features: AQt7F2q_NMfMrHAxqv_gXcfGQz0UA6xO4k2pT_5mE3o1VekhFBiY9XBCUjS48RE
Message-ID: <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>
Subject: [BUG REPORT] arm64: dts: qcom: x1e80100: Audio routing issues on
 ThinkPad T14s Gen 6
To: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am testing the latest experimental kernels on the Lenovo ThinkPad
T14s Gen 6 (Snapdragon X Elite).

I have encountered a specific issue with the audio subsystem: while
the DSP and ALSA stack appear fully functional (firmware loads,
streams are processed without errors), there is no analog output on
speakers or headphones.

I have performed extensive diagnostics and manual mixer path
configurations to rule out userspace/UCM issues. Below is a detailed
technical report of the current status, routing attempts, and logs.

I hope this information helps in refining the machine driver or
topology profiles for this specific device. I am available to test
patches if needed.

[Technical Report]

Target Hardware: Lenovo ThinkPad T14s Gen 6 (21N1) - Snapdragon X
Elite (X1E80100)
OS: Ubuntu 25.10 (Debian-based)
Kernel: 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC aarch64
Audio Topology: Qualcomm ASoC / SoundWire / WSA884x (Smart Amps) /
WCD938x (Codec)

1. Executive Summary

Despite successfully loading ADSP/CDSP firmware and creating a valid
ALSA UCM profile, audio playback results in absolute silence on both
Speakers and the 3.5mm Jack.

speaker-test executes successfully (consuming periods/buffers) without
I/O errors on hw:0,0 (MultiMedia1) and hw:0,1 (MultiMedia2),
indicating the DSP is correctly processing the PCM data. However, the
backend widgets appear to remain in a muted or power-down state
despite manual enablement.

2. Current Status

Firmware: Loaded successfully from
/lib/firmware/qcom/x1e80100/LENOVO/21N1/ (qcadsp8380.mbn).

ALSA Detection: Card X1E80100LENOVOT detected correctly.

Mixer Controls: Accessible via amixer. Note: Many controls have
verbose prefixes (e.g., WSA WSA_RX0 instead of just WSA_RX0).

Symptoms:
speaker-test -D hw:0,1 -c 2 -r 48000: Runs successfully, time periods
elapse. Result: Silence.
No dmesg xrun or I/O errors during playback after correct routing is applied.

3. Troubleshooting & Routing Attempted
I manually configured the mixer paths using amixer commands to bypass
potential UCM misconfigurations. I confirmed the routing logic against
the topology file.

A. Speaker Routing (WSA884x)
Path established: MultiMedia1/2 -> RX_MACRO -> WSA_MACRO -> WSA_RX0/1
-> SpkrLeft/Right

Specific Mixer Settings Applied:
cset "name='WSA_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' 1"
cset "name='RX_MACRO RX0 MUX' 'AIF1_PB'"
cset "name='RX_MACRO RX1 MUX' 'AIF1_PB'"
cset "name='WSA WSA RX0 MUX' 'AIF1_PB'"
cset "name='WSA WSA RX1 MUX' 'AIF1_PB'"
cset "name='WSA WSA_RX0 INP0' 'RX0'"
cset "name='WSA WSA_RX1 INP0' 'RX1'"
cset "name='WSA WSA_RX0 Digital Volume' 84"
cset "name='WSA WSA_RX0 Digital Mute' 0"


Analog/Amp Enable Sequence Forced:
cset "name='SpkrLeft WSA MODE' 'Speaker'"
cset "name='SpkrLeft DAC Switch' 1"
cset "name='SpkrLeft BOOST Switch' 1"
cset "name='SpkrLeft VISENSE Switch' 1"
cset "name='SpkrLeft PBR Switch' 1"
cset "name='SpkrLeft PA Volume' 30" (Max)

B. Headphone Routing (WCD938x)
Path established: MultiMedia2 -> RX_MACRO -> RX INT MIX -> HPH

Specific Mixer Settings Applied:
cset "name='RX_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' 1"
cset "name='RX_MACRO RX0 MUX' 'AIF1_PB'"
cset "name='RX INT0_1 MIX1 INP0' 'RX0'"
cset "name='RX INT0_2 MUX' 'RX0'"

Power Mode Forced (Critical step):
cset "name='RX HPH Mode' 'CLS_H_LOHIFI'"
cset "name='RX_HPH PWR Mode' 'LOHIFI'"
cset "name='HPHL Switch' 1"
cset "name='HPHL_COMP Switch' 1"

4. Conclusion

The PCM stream is successfully traversing the DSP chain, but the
backend widgets (WSA smart amps and WCD codec headphone rail) fail to
drive the analog outputs even when manually forced via mixer controls.
This suggests a missing device-specific sequence in the machine
driver, a missing GPIO trigger for the amp rails, or a specific
register configuration quirk for the T14s Gen 6 implementation.

Best regards,
Simone Flavio

