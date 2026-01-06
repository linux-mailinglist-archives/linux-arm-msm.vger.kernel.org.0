Return-Path: <linux-arm-msm+bounces-87636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D3CF6F46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB678301A191
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55BD3093CE;
	Tue,  6 Jan 2026 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSOKydMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB71A5B9E;
	Tue,  6 Jan 2026 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767683034; cv=none; b=TpAFxlGVlFIdrEMFfAJ+IyVQuGdIgoZRNTnnSerENdyXf7bryw9kHm6PRt3yHVYq2BPdhU+oZWCld24NcmcbUVAqhHIiEZ/CDuUQ2UDyTbUufA1/lIvDtMqC7jkmkkMqjnJ851NoatWPlkjUZ5If+P/2vo7VH5PwBra8y17NnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767683034; c=relaxed/simple;
	bh=TyDpzVCfXSEzxpOpSTPH4Gsp4a/xRH/Bm5jQHxFg2is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfG/Vy1tyu6sEcKL17ZirI1gK0hKvHdu2HSyIQ98bGcSfwPQ9gmOl1uEJqiz945SD8ayyf33/XhjzkRGPcZaGkyfZQ15+8pDGIiCROfNhZeRTDRX79KovWDqEXqGTnAXdGbM3gqmmJcKDQxh0DwB4Co4pjQYgT+dIjs8ovYZAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSOKydMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29DFC19422;
	Tue,  6 Jan 2026 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767683034;
	bh=TyDpzVCfXSEzxpOpSTPH4Gsp4a/xRH/Bm5jQHxFg2is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSOKydMkTtRLMoel9mnmls4t+2rc29aIn1Pv0vyRLzjP8ZHeO+uXQj29c/LtnPMvZ
	 a/5wQXK9bATnpRPfj4iPeMSXTASw2F24Bnt1JIaqL5hUlNSHr0GcUlH1d5RhFga4yx
	 dXpuVbR3HDjmzopqvr6bRehIoQZzgp3emam7CGSVmbkfImuWQDLVdF9stkWTl7s+lR
	 d6ob/ybQKh0Y4kw3Wo5NxdkLVaovqu697aZdEcL1Gx1haZpoRVBknnYjf3a+NxfNjS
	 OVtEfSxRFGXGbAYs1vbRwGeh2CPmD//zi476rw5onl1eot1gzr17/zHk9niLyiFYFi
	 RfFygm8axOxFA==
Date: Mon, 5 Jan 2026 23:03:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
Message-ID: <20260106070335.GC2630@sol>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>

On Fri, Jan 02, 2026 at 06:10:18PM +0530, Neeraj Soni wrote:
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
> 
> Tested on SC7280 eMMC variant.
> 
> How to test:
> 
> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
> fscryptctl that supports generating wrapped keys.
> 
> Enable the following config options:
> CONFIG_BLK_INLINE_ENCRYPTION=y
> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> CONFIG_MMC_CRYPTO=y
> 
> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
> 
> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ rm -rf /mnt/dir
> $ mkdir /mnt/dir
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ dmesg > /mnt/dir/test.txt
> $ sync
> 
> Reboot the board
> 
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ ls /mnt/dir # File should be encrypted
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ cat /mnt/dir/test.txt # File should now be decrypted
> 
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

