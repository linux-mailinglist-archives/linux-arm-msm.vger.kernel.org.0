Return-Path: <linux-arm-msm+bounces-83490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F142C8AE56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A61DE4E4BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F3B29B204;
	Wed, 26 Nov 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="dIE+O+wW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0F33CE81
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173718; cv=none; b=Nw/+WhzL9zhnfgSvIhoithyiTCIge0zuAQJ1UC6VhSnCzYkZut5kEc58Rc2myycATZzCUVoqQ5lAb5UsYVLm0/ADYwRK3Jrb7jNkywXt0U8YSCoIE5ab44ym2gGT/riVJJ9ud7nHHP67kownU2h70QDwjAd/y5+aNK9O2sI/QL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173718; c=relaxed/simple;
	bh=/X+ceXJHJ+neul8yscFlRipUljB6mrMr2Dvav7ImqnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czJ1iad4OLbTwYbZkEPvI0J+kQoGnKK/cQgo46/4BuZlZBSPxz85vWPu8VAy/WHSoDOpGY9O9HOEiF4tKJ7Pin6Z8oFw6eLWC3yxVKt/PJvtZHAUVY+hqIFpnmsBCNNlwQdIShoRNNSSYGPUBQ6UPTxbaBzXGJvjCcFq/B8uSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=dIE+O+wW; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1764173702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfurdNznTv8KjGcosKX6t6uwsXs3tgXKWLDLkO4XdUw=;
	b=dIE+O+wW31FtpX+nCzSaHLKtO5tGsiIUwoLGhwdrUYhlakuMdEgm3eQq3S+P01HSkjxoXD
	3WpS6DtHzowrGIzJH/MW933XSbcfk3o1nQqPb28/2MyjoL2I47IfW0DBG7h332Lv9Htl2o
	0gcwrY6bykx2r4Ea2xlEKbeJ5RnXTHMYf5YzztrEv5E3h3jh+29j+RJ4dv/1Dx+/x0y2UK
	t0YwiTBl2c1gXdaPrqvrrI5X+Maprd16EV5SWqKCe2LWvHjRqpNp7nt42JIx5l8jLerBpj
	0z4Ryv2dwyO5q+GXPGxWX931Z4rRmnQXGBosAFWSHVc4zfa3tavBik/NAQomjA==
Date: Wed, 26 Nov 2025 13:14:53 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
> The reported problem of some non-working UHS-I speed modes on SM8450
> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
> SDHCI SDR104/SDR50 on all boards").
>
> The tests show that the rootcause of the problem was related to an
> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>
> Due to a missed setting of an appropriate SDCC clock operations in
> platform GCC driver the workaround of dropping SD card speeds from UHS-I
> to high speed was spread to SM8550 and SM8650 platforms, and since
> the fixes in the clock controller drivers are ready [1], it should be
> safe to remove the speed mode restrictions from SM8450, SM8550 and
> SM8650 platforms.
> [..]

I see you have tested with dd on the raw block device, but have you 
tested hotplugging SD cards that have partition tables and filesystems 
on them?

We have this kind of issue on Hamoa where we get I/O errors early, right 
after the card is inserted and the partition table / filesystem headers 
are being read:

[  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
[  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
[  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 
phys_seg 1 prio class 2
[  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async 
page read
[  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 
phys_seg 1 prio class 2
[  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async 
page read
[  714.516512]  mmcblk0: unable to read partition table

and b1f856b1727c ("mmc: sdhci-msm: Avoid early clock doubling during 
HS400 transition") did not help..


~val


