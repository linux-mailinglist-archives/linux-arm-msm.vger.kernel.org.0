Return-Path: <linux-arm-msm+bounces-53979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 872BFA85948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE4D19E47E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D90278E67;
	Fri, 11 Apr 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeprfV+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D91362
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366611; cv=none; b=eQavpQzYToIS2YUbS3+XNG73rmcCLJQmIYS6R68UZ6Tl7YCidkvFZrEplo+Htvijdl2pnH67rnl4FJM68fPh3hvHCU8jeSjAqeyYS1f2sgksNufnbKmL/qvy2gr2HI8wiO62V3vmTL/SRQvS6KvHk+N0nuKz/gYxeh+nX+QZgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366611; c=relaxed/simple;
	bh=1hotVe9BlhwBGJJos/NulxBjTlOD2ZF1/TLgGJwSgxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oL0cGwraxctKmMew7XkfERjob56zZqsPq7sne9AjYIr08ZvYyNAqJne7JT3CGAILFldI5i6hFE/LlctF9BLk4OfZCK/eRJ+G/TFqEOXN6BKgyN30C0pIdflrOP4RXm3Jhk2qyqDS+dN1N3dodGNLyLedzMkJX8A/ILVSK5h9Pz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeprfV+g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22a976f3131so19197805ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744366608; x=1744971408; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=El+yBbYFfa3m33PcQZ+/sv5AA9CYKsrtHMnxQf73yYk=;
        b=AeprfV+g+QIa1hL1zFvDhMoeBqecv+AGDgEWbTbS8/gj7PFCWAB6Da0F3TDYSjH+qp
         JofLEPjszsrcDCQe0EODD8dApTnbULQVcIwHaOzWgcBfDiRFbklqTo06uwDy+rJuTSzo
         sGH6E+tu9T7wVn5O2lHPwxx/R4T00VgYbp9/aT/0KSI+mb/zMDkvWNnApO9IeuFhYjiw
         L/S/chgEbFTs7K7CvgW2nrL7Oob2FmKFq/Rk/iIzi3R9poJ6lzLOu5DX4b0+TXFmXLNq
         +ukY/D0wq84dg/pzLnyyTRWNouLMzMqVLuuwWZlIhdBgFwH0YS0kT3wnwwMV+9ozmvZW
         F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366608; x=1744971408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El+yBbYFfa3m33PcQZ+/sv5AA9CYKsrtHMnxQf73yYk=;
        b=QjKEWXNhw/XrPsI+bt1SyafUNJxjS3joYEMTvQqRywWusP7qYn02LWd4YVh79wVb1o
         RHv/yjXdQ0bTiba020sqwSmL5EwPjWpXA3LuPeiUSqMrLLsa/NK3FrEQ1gq5U/OLX53h
         c6CUXSsmZcf1Awvvm8RdLGVIaqSYgyflili02SVBUB2w+RvOgL2fp4T/KXZ97VpDYvIq
         zNcsGRwcvDUUk4eGY3OOP/pzf1MZGTBzhPRzn7VieY8W6PSnfvEYxjMTwR7grS342Gh2
         270wvR6LX581t1uwhh10ZMPnRhx8YvMwjA6CsfXWKSPeeVHvMdJ4fjqY9/Qe+sRByHQh
         S4kg==
X-Forwarded-Encrypted: i=1; AJvYcCVib16HKN2SYRbWDyvRsXwDHJGsaoZdSWPq8hofeWfFNfvqrmro5CAk7xZ1Dt9rlfUi9PVWBAYPHvmNd+xM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rpZQ2J4PH+rUMBhzJyS+CGrXE3LAqAhB4HnlQp9w9fm6R1Da
	XO57sPkRUhlDJdDzCJ5WpPViNusfii3L+xGv8KZTngZaGmVqRfmmo1vetIitVuxFGWOfRu7IIS9
	C2Ep+kelfCNFpZDImf3AN5FyPCMemf3Zt5oBdaw==
X-Gm-Gg: ASbGncud2YxUApBoLbi3/7Sy9dLZ93Pze4UVZoA35fsfvyuOEnDlR2uq3G0qqa7evNq
	dG+q0oFjAfFWaaBdcDMAnvynprn0COAzsfsqMoUkg70bwiv6U2VJwDVIqj9dqtPU3kuZTJV2X7n
	pF9tKpGDU54xZ2OzOjvsKmTTw=
X-Google-Smtp-Source: AGHT+IFS/a80yyyuZi5urEnORY3xQw5mQjSwHZr0ekHuMVLTC+K2x+MxrDzUzO/bjiGCm5Susl2ueRJyb258GnM4w9s=
X-Received: by 2002:a17:902:f705:b0:227:ac2a:1dd6 with SMTP id
 d9443c01a7336-22bea4c6e17mr42758175ad.24.1744366608577; Fri, 11 Apr 2025
 03:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Apr 2025 11:16:37 +0100
X-Gm-Features: ATxdqUEraod8yrwnTn49b9tk1NYUizm-a1oIyjVCeHuX2V2MVcCKfTUobsggqZA
Message-ID: <CAJ9a7VjzxnOGNbAM974ybRAD4eXxWhr8d+UC1rEG=yMtug2XRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] coresight: ctcu: Enable byte-cntr function for TMC ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>
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

I can see that this patchset has fixed some of the issues raised from
v1 - using the existing file handle for read, and stopping the ETR to
read the RWP.

However the fundamental problem that it is still attempting to read
memory without stopping the ETR has not been addressed.

As mentioned in mine and Suzuki's comments for v1, this means:-

1) you cannot guarantee that the buffer has not wrapped when reading
data back, which will corrupt the trace decode process.
2) The DMA buffers are not being synchronized, so the PE could be
reading stale data rather than the new data written by the ETR.


Regards

Mike

On Thu, 10 Apr 2025 at 02:33, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is tiggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer if the IRQ count is greater than 0.
> The read work will be conducted ASAP after the byte-cntr is started.
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
> The byte-cntr read work has integrated with the file node tmc_etr, e.g.
> /dev/tmc_etr0
> /dev/tmc_etr1
>
> There are two scenarios for the ETR file nodes with byte-cntr function:
> 1. BYTECNTRVAL register has configured -> byte-cntr read
> 2. BYTECNTRVAL register is disabled -> original behavior, flush the etr_buf
>
> We still can flush the etr buffer once after the byte-cntr function has
> triggered.
> 1. Enable byte-cntr
> 2. Byte-cntr read
> 3. Disable byte-cntr
> 4. Flush etr buffer
>
> Since the ETR operates in circular buffer mode, we cannot fully guarantee
> that no overwrites occur when the byte-cntr read function reads the data.
> The read function will read the data ASAP when the interrupt is
> triggered and we should not configure a threshold greater than the
> buffer size of the ETR buffer.
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
> Way to enable and start byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
>
> Testing case has conducted for the byte-cntr read work:
> 1. Setting the buffer_size of the ETR as large as possile, here is for ETR0
>    echo 0x1000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
> 2. Setting the threshold for the ETR0 to 0x10000
>    echo 0x10000 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val
> 3. Enable ETR0
>    echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> 4. Enable ETM0 as source and enable byte-cntr to read data
>    echo 1 > /sys/bus/coresight/devices/etm0/enable_source;
>    cat /dev/tmc_etr0 > /tmp/file_byte_cntr.bin &
> 5. Disable ETM0
>    echo 0 > /sys/bus/coresight/devices/etm0/enable_source
> 6. Disable byte-cntr and flush the etr buffer
>    echo 0 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val;
>    cat /dev/tmc_etr0 > /tmp/file_etr0.bin
>    ls -l /tmp
>
> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
>
> 7. Deal with the file_etr0.bin with following command:
>    dd if=/tmp/file_etr0.bin of=/tmp/file_etr0_aligned.bin bs=1
> count=12628960 skip=40336
>    ls -l /tmp
>
> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
> -rw-r--r--    1 root     root      12628960 Apr 28 17:49 file_etr0_aligned.bin
>
> 8. Compared file_byte_cntr.bin with file_etr0_aligned.bin and identified
> they are competely same.
>    diff file_byte_cntr.bin file_etr0_aligned.bin
>
> =======================
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>    node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>    suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
>
> Jie Gan (5):
>   coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>   dt-bindings: arm: Add an interrupt property for Coresight CTCU
>   coresight: ctcu: Enable byte-cntr for TMC ETR devices
>   coresight: tmc: add functions for byte-cntr operation
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 119 ++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  88 ++++++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++-
>  .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 175 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  10 +-
>  9 files changed, 483 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

