Return-Path: <linux-arm-msm+bounces-49653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA6A47885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73D617A4282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09352227B94;
	Thu, 27 Feb 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="CfEArneS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D4227BA5;
	Thu, 27 Feb 2025 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646906; cv=none; b=YErW16ssbByrdRFr/q/zVM1sSNMoNRLyRKNcDlMZQ711Ia4XCsR4ymb2lE/v2CcGlu+aJJEg/Ly6KsaRT2581geqQ4+FY2fgQUkjzK+tHVUyNOsKOzZ8GtJyNHVuo+grfFHp9k0t1LqEFhSvJRDr8aook8FPyOX7dX0tSTuPbq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646906; c=relaxed/simple;
	bh=b6xawKG+7vT6ikY3PpBIE1Xreg7uT09HW0pKvc4K62M=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FNsSU9WwsB2mzZMQ9ukK9xENVup8u1QXbyNUVrvQHUO/DH6XFxPhzmLLRVnMiXECXKnyUPdzyMOPhiYZMRnXy31y/Gl/NmA5S/GEDpUYtnaAMRvrzkevv18M4Zt+xuM60jqz3niC00fhkVXZfairRXdGhbYO8F466w8H0pVMmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=CfEArneS; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740646901; bh=b6xawKG+7vT6ikY3PpBIE1Xreg7uT09HW0pKvc4K62M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CfEArneSe8WJxtyotOJ2xbN95m/f4sfT/IXfNy77f08LhPgnt1bk4Z3/p83gy37xj
	 uWx9mufRu90sjk+lDGsbMyZNE2ePyw6Od+Ioeh4LYElFTEEDFQ6D/khEvrYpgtY9oq
	 BMVblAHQqDEMbQRX0vQIlfC06ATfDDtjXQXvCEsXDmrQlEbtno/YipywtnGm139aAb
	 P7Z/4NovCsddchw8QIoGwYvJ5SOqD6jgRaPX0EcywhoV5l5bYXMEBCGndIwsscHD1M
	 m11KFN1Tv44Otrb//s7F/czqDVdwn2+vKdri1SpFBHBFWh7xFNWrNhMVvyRpWbl0Ti
	 1FgZiqYkCuBBA==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 70E3B90B1;
	Thu, 27 Feb 2025 14:01:41 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 14:01:41 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] {vision/navigation}-mezzanine: Fix overlay root node
In-Reply-To: <vq5dcsi55aqn56h6ihysqk4lainhmjbyvot3jiqkxm3i7igsak@da5u6ro7rkvg>
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
 <vq5dcsi55aqn56h6ihysqk4lainhmjbyvot3jiqkxm3i7igsak@da5u6ro7rkvg>
Message-ID: <62a53d3222dfc516accd8dcd5e1adca0@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Baryshkov писал(а) 27.02.2025 09:16:
> On Wed, Feb 26, 2025 at 07:29:54PM +0500, Nikita Travkin wrote:
>> While considering to propose WoA EL2 dt overlays upstream I was looking
>> at existing overlays and noticed that some of them are broken: they put
>> seemingly meaningful fixups into the overlay's "/" node, which places
>> them into the overlay "metadata" itself, not into a fixup fragment to be
>> applied to the actual dtb. This series fixes those two by changing to
>> full path "&{/}" which should work as it was initially intended.
>> 
>> See demonstration of the problem below:
>> 
[...]
>> $ dtc extra.dtbo
>> /dts-v1/;
>> 
>> / {
>> 	foo;
>> 
>> 	bar {
>> 		baz;
>> 	};
> 
> Is this behaviour documented somewhere? I'd say, it would be a surprise
> to me.
> 

According to dtc docs [1],

   3.b) The Device Tree fragments must be compiled with the same option but they
   must also have a tag (/plugin/) that allows undefined references to nodes
   that are not present at compilation time to be recorded so that the runtime
   loader can fix them.

so per my understanding "plugin" directive only changes the meaning of
references (i.e. stuff with "&"), to generate fragments/fixups, which
are the only way libfdt combines overlays into the base dtb.

I suppose the old way of "manually" writing fragments (and thus writing
to / as raw nodes) was kept because phandle/path based updates were
added later to dtc and many overlays were still defining raw fragments...

"/" also allows one to write "raw" nodes into the overlay, which is
sometimes used by downstreams. (i.e. they put custom extensions to the
overlay format [2] or add metadata into / of the dtbo like "compatible"
values to reject incompatible overlays from applying. [3]) This is
actually why I started looking here in the first place as for woa el2
overlays I was asked to add compatible metadata as, apparently, NixOS
tooling requires it to validate the overlays [4].

[1] https://web.git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentation/dt-object-internal.txt#n120
[2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm/boot/dts/overlays/adafruit-st7735r-overlay.dts#L73
[3] https://github.com/radxa-pkg/radxa-overlays/blob/main/arch/arm64/boot/dts/rockchip/overlays/rk3588-i2c0-m1.dts#L5
[4] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso#L12

>> 
>> 	fragment@0 {
>> 		target-path = "/";
>> 
>> 		__overlay__ {
>> 			whatever-comes-next-after-baz;
>> 		};
>> 	};
>> };
>> 
>> $ dtc combine.dtb
>> /dts-v1/;
>> 
>> / {
>> 	whatever-comes-next-after-baz;
>> 	compatible = "fake,board";
>> 	fake,value = <0x2a>;
>> };
>> 
>> In the resulting dtb foo bar and baz are missing.
>> 
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>> Nikita Travkin (2):
>>       arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix broken overlay root
>>       arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Fix the overlay root
>> 
>>  arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso       | 2 +-
>>  arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
>> change-id: 20250226-qcom-nonroot-overlays-bfe21d33be8c
>> 
>> Best regards,
>> -- 
>> Nikita Travkin <nikita@trvn.ru>
>>

