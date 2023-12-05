Return-Path: <linux-arm-msm+bounces-3454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727C80545B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 13:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030EA28184F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC435C8F4;
	Tue,  5 Dec 2023 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZNsJQVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EF5C900
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 12:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD64C433C7;
	Tue,  5 Dec 2023 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701779840;
	bh=iGTjPkwj63UI3pgczFyX1KRc4/zzeEEsLeEmlVyP4vM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nZNsJQVTzRQPB6YS5aI2h4NZgbhUAde9Lz7SRTpGNj0eKfBINYB7c63WugNkQ5Rgn
	 keLNusDZqDK6D+qoB9GoyhT/5TdqXW1U4FI8PPd67P6UW6j2dvGfeTS+iLwek3stXa
	 KJIi4hxw4XvwnUCbsS8a3GlFcnf9OJDTf8NskjI1oTd3uD/UmZaQ0Vyn9F9lRabr4T
	 H11C4nvBu9ul9vt26jP9QlEyySRbwJNOGNZIaGv1uUbQsLeCpYZoB4BIZc6c4Mm5dk
	 DClNJ4i9Mrk+vWoVR8+RJf1h65YwWKbKDttwUqm6S1CIW0uj2xB36tTAnGzA6jeDA9
	 lTL+in7hkKiEA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of
 sync
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
	<87leaaqg7a.fsf@kernel.org>
	<CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
	<878r6aq71z.fsf@kernel.org>
	<CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
Date: Tue, 05 Dec 2023 14:37:17 +0200
In-Reply-To: <CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 4 Dec 2023 18:49:00 +0200")
Message-ID: <87r0k0q0zm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Mon, 4 Dec 2023 at 18:14, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
>> >
>> >>
>> >> Hi Dmitry,
>> >>
>> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> >>
>> >> > I wanted to ask your opinion regarding one of the issues we stumbled
>> >> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
>> >> > snoc (WCN3990) WiFi "card". We noticed the following messages being
>> >> > spawned on the console, which I traced it to the
>> >> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
>> >> >
>> >> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>> >> >
>> >> > As a reminder, on this platform the wlan firmware and firmware-N.bin
>> >> > files come separately.
>> >> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
>> >> > tqftpserv request (which is served from the board-specific folder
>> >> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
>> >> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
>> >> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
>> >> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
>> >> >
>> >> > I'm looking for suggestions on how to make ath10k driver load
>> >> > firmware-N.bin file which corresponds to the board-specific
>> >> > wlanmdsp.mbn.
>> >>
>> >> We have had similar discussions in the past but it didn't go very far.
>> >> It would be so nice if you could finally fix this :) At one point we
>> >> even had a discussion that we might need something similar for ath11k
>> >> but it didn't go anywhere.
>> >>
>> >> > In particular I'd like to hear your opinion on the following proposal:
>> >> >
>> >> > Add the  optional property to the board DT, that specifies:
>> >> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
>> >> > will be used as an override for the firmware directory. So, while the
>> >> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
>> >> > look for the firmware-N files in the specified directory.
>> >>
>> >> Back in the day I was thinking something like below, please let me know
>> >> what you think.
>> >>
>> >> So the normal firmware path for WCN3990 is:
>> >>
>> >> ath10k/WCN3990/hw1.0/
>> >>
>> >> My idea was that if we could extend it for different "platforms" (not
>> >> sure what's the proper term for this) by having platform specific
>> >> directories:
>> >>
>> >> ath10k/WCN3990/hw1.0-platform/
>> >>
>> >> (Replace "platform" with a unique name for the platform, for example
>> >> "acme-kv7" for a product from Acme with model name kv7.)
>> >>
>> >> Then DT could inform ath10k about this "platform" string and ath10k
>> >> would then download boath firmware-N.bin and board-2.bin from the
>> >> platform specific directory.
>> >>
>> >> And even cleaner if we could have the *.mbn firmware files in the same
>> >> directory, even if ath10k doesn't access them directly.
>> >
>> > We can, and a symlink from qcom/SoC/.../dir to that subdir.
>> >
>> > So, for example, for Pixel-3, using your schema we will have:
>> >
>> > ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
>> > ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
>> > ath10k/WCN3990/hw1.0-blueline/board-2.bin
>> >
>> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
>> > ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
>> >
>> > This sounds mostly fine to me. My only suggestions is to change it as following:
>> >
>> > ath10k/WCN3990/hw1.0/board-2.bin
>> >
>> > ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>> > ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
>> > ath10k/WCN3990/hw1.0/blueline/board-2.bin
>> >
>> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
>> > ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>>
>> Is there a specific reason why you propose adding a new subdirectory?
>> Personally I find it confusing that hw1.0 directory contains the
>> firmware files and then there's a subdirectory which also contains
>> similar firmware files.
>
> My main idea was to allow fallback at least for board-2.bin. I don't
> think we should have 10 instances of the file (or load it from the
> platform-specific location).

A very good point, I didn't think of board files. I agree, we should
avoid having several board-2.bin files. But I don't see how a
subdirectory would solve that? What if we have symlinks for board-2.bin
file:

ath10k/WCN3990/hw1.0-blueline/board-2.bin -> ath10k/WCN3990/hw1.0/board-2.bin

That way we can have just one board-2.bin file to maintain. And I
suspect this would be easier to implement in ath10k driver.

In my previous mail I forgot to mention about backwards compatibility
which is important. So we need to be careful that older kernels continue
to work.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

