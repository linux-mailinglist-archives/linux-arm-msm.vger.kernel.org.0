Return-Path: <linux-arm-msm+bounces-3731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A2808B14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940B11F212FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F7A42A9D;
	Thu,  7 Dec 2023 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkJvStpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984141C88
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 14:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3766C433C7;
	Thu,  7 Dec 2023 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960781;
	bh=LXSs+8RJL1znQ6oY9ZxWI0HONEsynqIj/M/NtbC+bsQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AkJvStpkNbiCVcZG57zBkoP+C9BhLHF6WoB/YA22wpO11n9v0FeQOfAj89VAls3o0
	 oskhmfy1CubkTHkESeQF6u/GHinYDfE8JwlqLqVyx9aWYOgmTUGlX9/o461nh84qK4
	 y/9s+1y6NbhUw6dhXIqN0pQ4rNMdcj/ARrA2bC4D8jtwfXzc/vmJZK9md7Z3LDS+kZ
	 98Po47udv7sJLCkemxKHq2d95864AUf84mO2fv2TgEKEWVBoZ1EC4cITh7sHFr2z0a
	 UvKr3iSf+KmR6+m9LtuhQFhVYFgtI1rrdWy8hOiv2HGgsA27KhAPQ2PtIAqj6fAgRi
	 q7Giw7P1mtGcw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm
 Robotics RB1 platform
References: <CAA8EJpoMoLTLz9UOFt4gwHcnyLVzBoUhAeRSs_Tkz=d3zzq_HA@mail.gmail.com>
Date: Thu, 07 Dec 2023 16:52:58 +0200
In-Reply-To: <CAA8EJpoMoLTLz9UOFt4gwHcnyLVzBoUhAeRSs_Tkz=d3zzq_HA@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 25 Aug 2023 00:50:03 +0300")
Message-ID: <87o7f2njxx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hello Kalle,
>
> We'd like to ask for inclusion of the board file for the Qualcomm
> Robotics RB1 platform. It is
> an IOT platform manufactured by Thundercomm, using the Snapdragon QRB2210 SoC.
>
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an QRB2210-based platform (QRB2210)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference:
>
> ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007
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
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1
>
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of existing boards we are adding the
> calibration variant.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> 5003239259d8cb68097a941dde86dcc7
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1.bin
>
> $ sha256sum *
> 0eeffb43040b216b0f3210b8db69e4558844dd9df52caf9c25f56a79401f442c
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1.bin

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 22 in total

https://github.com/kvalo/ath10k-firmware/commit/7d5e852d125d4ca3feba6a3fff9d04a0e488e584

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

