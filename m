Return-Path: <linux-arm-msm+bounces-3733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A78808B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F73BB20A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1F742A9D;
	Thu,  7 Dec 2023 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W38QkOno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA033A8C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 14:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6238C433C8;
	Thu,  7 Dec 2023 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960865;
	bh=CxIdohRv9UZtivNiBrUGey9rAm5WPxTs1mLv0AuDN84=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W38QkOnokdVaXUS5nlqLGGHPRKM4SN0BOzdHmFFLBGcYEVn9k6hdxZVxrNwsETd0K
	 Gv82ueV5YcCRRz5S2j2Z5lZ4CJcKxprOQX8TcyH84T1WcSigSvv/PKIm8f50wvdovh
	 5ssM7EaLBUEqglYbKbWJ9FIapwEUmQjzeYCI8u49mtTehTdwncwYwRM0dwn7cxO4vm
	 VA1Mw5qY5JwgTQhPCymR6m5lTSsG3c5Kr0oJOJyQ3WNKxPv8PsIzEyakyAYD6L//9K
	 4hIz58+Q1iFCTDEf4wJWuxgk6fiMt5oq0/t6MtsElvIIPpr2vr5GrSS+3un3vK3JGK
	 KYGe7kDfbhm5w==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm
 Robotics RB2 platform
References: <CAA8EJprLZVdxfWGZhQGHN_CejD8GsRZE8i1-MFa7froWTvs5ew@mail.gmail.com>
Date: Thu, 07 Dec 2023 16:54:22 +0200
In-Reply-To: <CAA8EJprLZVdxfWGZhQGHN_CejD8GsRZE8i1-MFa7froWTvs5ew@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 25 Aug 2023 00:52:10 +0300")
Message-ID: <87jzpqnjvl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> We'd like to ask for inclusion of the board file for the Qualcomm
> Robotics RB2 platform. It is
> an IOT platform manufactured by Thundercomm, using the Snapdragon QRB4210 SoC.
>
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an QRB4210-based platform (QRB4210)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference:
>
> ath10k_snoc c800000.wifi: qmi chip_id 0x150 chip_family 0x4002
> board_id 0xff soc_id 0x40670000
> ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp
> 2023-01-06 01:50 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
> ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
> 0x00000000 sub 0000:0000
> ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc c800000.wifi: firmware ver  api 5 features
> wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file
> max-sta 32 raw 0 hwcrypto 1
>
> * origin of the board file
>   - It comes from the firmware package provided by Thundercomm for
> redistribution.
>
> * ids to be used with the board file
>
> bus=snoc,qmi-board-id=ff,qmi-chip-id=150,variant=Thundercomm_RB2
>
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of existing boards we are adding the
> calibration variant.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> 5003239259d8cb68097a941dde86dcc7
> bus=snoc,qmi-board-id=ff,qmi-chip-id=150,variant=Thundercomm_RB2.bin
>
> $ sha256sum *
> 0eeffb43040b216b0f3210b8db69e4558844dd9df52caf9c25f56a79401f442c
> bus=snoc,qmi-board-id=ff,qmi-chip-id=150,variant=Thundercomm_RB2.bin

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=150,variant=Thundercomm_RB2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 23 in total

https://github.com/kvalo/ath10k-firmware/commit/7435e1eeeeea4b065634071d21ba691597f345bb



-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

