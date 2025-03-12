Return-Path: <linux-arm-msm+bounces-51163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC0A5DDD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61EF33A665E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BAB24291B;
	Wed, 12 Mar 2025 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zy1eqKe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35D23FC40
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785743; cv=none; b=PiwZvV94VsNGzxgn9joc5lACcl6EnCAKBRytOdJ8XO2FyvBCzim1dPqtSZQLXID2PEoUovhRsGmlMvLCR9H692PLjPdVMHjsTrOa1XPgGx0aNMblaFneapnUm7XtpjQtvnJFNQkVN2X7oJRkHZbdYhPWUS7zEPmGleJPz5TXp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785743; c=relaxed/simple;
	bh=9Hewtiu8JjbwogqT63eypvNEbvZAQwy6h+Jz1+bRl5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsxYujNjaiDBB9lBEF9dclRjlgAMFAQq3ZeF29kSYWrHRw2BwAC5MMVRwX2xxwu0K/wl29S0EgDcd+vGqWauPAPgxoA9oT6z+z3oPA2lSEHbj1NFGapjyryY4+aDv2ZDrRTFzpIagypR6uZNtEJmHIgVk6xpGdW7diYCwTMvS4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zy1eqKe6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso148685755ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785741; x=1742390541; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
        b=Zy1eqKe6vL3238nzqEhyniWfhzISzfYYXRTJ6Qdz7yAoaDs/Ld86gvOGJD11I7d8s3
         ADAB40PZhvjD6zCyOl4TZGmRRfbOQIt3swFB+lDGeYus1vMJIOnljRmpJHp82Qh2D/G3
         TpNHzb2bpkLw14n72Vpp/gZunFdMNA9qBfVSZgyaGTz0cw3vvTQSWFBSTIVZtlW2Vxv/
         QBVS1dIJoUxLds15QUAxhhR+GG7Y9JzPyf3fUNmsHGjfSWmcGgc/Sgzw32ZRRAHrczhe
         WndA5e90KQTdFHkV6deBqcWC0UJyzPd6cgKoUE4xX+Ap2zieowwNLpcIU9RQq/ZxwRjC
         Evjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785741; x=1742390541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
        b=CpO2Lmw7nOwO2q+OfoqT+b8ACVwBWWdDu6xiPAhqumybuo+NOPCgja3rGW+XeaX8n5
         EbksBEfkBO/S8oL48wKiJytcRhIzYmw7FFTry8/9wKBF88EZUSJfbL6j27eIMxW+nk6m
         OO3ALLMHPRl03tL0lOWw0235O/ruG7f3yeLuPs4b/HqvpbJ45dqLLhfihqfxOMv4HG8a
         Ve7iqshJAg1dT4xVaaqakUJzdbgvdrTRLoxLAmW5AAnh2uMqcp0wB5vCkQZFGJMWl8af
         zddeUAyLVHpMVoT/VFkxO5vESdkbW0BAcOKYajnjlmIDIuHlsB7s9UiHl4XiTSCHok3n
         4fbw==
X-Forwarded-Encrypted: i=1; AJvYcCV/CrOfaUqWdqZJnE/vz03d4JXxV2L+t4fmxCwa77v5HiKPPTaANjwAtT98enp6nmDS3ywXQYRoeKPAjKJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jKtI0IeA/w+rSnyokajmaE6MT5EtPnKzz//1uEyzEwCWvLwB
	T8euyhMdoECfVoOJ2lZfmCIoO7AlweEs8bzhaxvy/mvSuSoAmZwhN1oJ9KvEg0iQHeKmTCwHAJN
	XHUwz4hTYh1RgXLLOMVKBXWsHl/J0h2FZIqQMLw==
X-Gm-Gg: ASbGncvxqk34wNcKuM7iPNqAqVolMLPSAWb0TgxtTc2X3XyC2ZCphipogPHINuDLwCp
	blZZWdUQ4L2tB7+MDjS2zx41lcFCMwT0KmGFyqfovRKoQ70PNBOwsGT7QEqeHf5MzfUTg46zGb+
	JA+Sjeb9pdkghBW0IKZvgAwlEfRwEFyFw4FsR+eA==
X-Google-Smtp-Source: AGHT+IGmt/3UktMaOMFJgApftv3nZ067gpwV3LHvs4wr2QCvCVRTWlevRuRQpnJ3GdbEdKToZ/jiLjTzfEOKYcYZ6Lk=
X-Received: by 2002:a05:6a00:987:b0:736:4830:68a6 with SMTP id
 d2e1a72fcca58-736aa9b3cb0mr30689940b3a.4.1741785740656; Wed, 12 Mar 2025
 06:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
In-Reply-To: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Mar 2025 13:22:09 +0000
X-Gm-Features: AQ5f1JoVaTUjPnEeh2tsJVsCs5mqAeippvAwDr6IKbNgE69l9whq43Fk1D-kCtg
Message-ID: <CAJ9a7Vj=Ni_o94u1B+oouv0GD5DVmST=N31-hsN=SPSbaoqO_Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] coresight: ctcu: Enable byte-cntr function for TMC ETR
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 10 Mar 2025 at 09:05, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> From: Jie Gan <jie.gan@oss.qualcomm.com>
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is tiggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer if the IRQ count is greater than 0.
> Each successful read process will decrement the IRQ count by 1.
>
> The byte cntr function will start when the device node is opened for reading,
> and the IRQ count will reset when the byte cntr function has stopped. When
> the file node is opened, the w_offset of the ETR buffer will be read and
> stored in byte_cntr_data, serving as the original r_offset (indicating
> where reading starts) for the byte counter function.
>
> The work queue for the read operation will wake up once when ETR is stopped,
> ensuring that the remaining data in the ETR buffer has been flushed based on
> the w_offset read at the time of stopping.
>
> The following shell commands write threshold to BYTECNTRVAL registers.
>
> Only enable byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
> echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
> Disable byte-cntr for ETR0:
> echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Disable byte-cntr for both ETR0 and ETR1:
> echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> There is a minimum threshold to prevent generating too many interrupts.
> The minimum threshold is 4096 bytes. The write process will fail if user try
> to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
> for 0).
>
> Finally, the user can read data from the ETR buffer through the byte-cntr file
> nodes located under /dev, for example reads data from the ETR0 buffer:
> cat /dev/byte-cntr0
>
> Way to enable and start byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/byte-cntr0
>

There is a significant issue with attempting to drain an ETR buffer
while it is live in the way you appear to be doing.

You have no way of knowing if the TMC hardware write pointer wraps and
overtakes the point where you are currently reading. This could cause
data corruption as TMC writes as you are reading, or contention for
the buffer that affects the TMC write.

Even if those two events do not occur, then the trace capture sequence
is corrupted.

Take a simple example - suppose we split the buffer into 4 blocks of
trace, which are filled by the ETR

buffer = 1, 2, 3, 4

Now you suppose you have read 1 & 2 into your userspace buffer / file.

file = 1, 2

If there is now some system event that prevents your userspace code
from running for a while, then it is possible that the ETR continues,
wraps and the buffer is now

buffer = 5, 6, 7, 4

Your next two reads will be 7, 4

file = 1, 2, 7, 4

This trace is now corrupt and will cause decode errors. There is no
way for the decoder to determine that the interface between blocks 2 &
7 is not correct. If you are fortunate then this issue will cause an
actual explicit decode error, if you are less fortunate then decode
will continue but in fact be inaccurate, with no obvious way to detect
the inaccuracy.

We encountered this problem early in the development of the perf data
collection. Even though perf was stopping the trace to copy the
hardware buffer, it would concatenate unrelated trace blocks into the
perf userspace buffer, which initially caused decoding errors. This is
now mitigated in perf by marking boundaries and recording indexes of
the boundaries, so the tool can reset the decoder at the start of non
contiguous blocks.

If you do not stop the TMC when draining the ETR buffer, you have no
way of determining if this has occurred.

Clearly using large buffers, split into smaller blocks can mitigate
the possibility of a wrap in this way - but never eliminate it,
especially given the extreme rate that trace data can be generated.

Regards

Mike


> Jie Gan (4):
>   coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>   dt-bindings: arm: Add an interrupt property for Coresight CTCU
>   coresight: ctcu: Enable byte-cntr for TMC ETR devices
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  45 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h   |   3 +
>  8 files changed, 556 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

