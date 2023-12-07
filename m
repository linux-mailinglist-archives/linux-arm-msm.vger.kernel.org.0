Return-Path: <linux-arm-msm+bounces-3735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBAC808B29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A3BD283402
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37FB405F1;
	Thu,  7 Dec 2023 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxlo4tLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3569125C5;
	Thu,  7 Dec 2023 14:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DA9C433C8;
	Thu,  7 Dec 2023 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960975;
	bh=xvaxDcD2mtxGeB3/2hAJCw3+15Dnjab0Oo7DQtO8neQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Fxlo4tLXQB1/6Vd1prnwXiFJjkmMjgUjke7ZNmeE+e0vJOgchFSzJu2pTEG7zUTOk
	 4qV93lNUP/EBY9bFhIghtbasdqYAHYb3m5Rg4ZJJtOiuZ/HivWVJJ9TZu/OJfAvJ5X
	 JtTiqdFEzWnR3b5e7/npcoJo7SlK1fLuujBYL2Khf20tH8lpsx0xJKzdRpLdWVMur2
	 KsZozzmVbRuJndjd88uc0f0iMLE7v3+7o5IEC2na7yMrSwwXOFfCJGU4OPFn+z42fm
	 3b+FhZwkmSA4/u0gtSYhkaMBbrHRcrZzlr8kP2eqwrlHSGwqI1GUGKSpv//BRmOesg
	 joXFqkP55D0hw==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for SHIFTPHONES SHIFT6mq
References: <55665952-c6ce-d097-d4b7-4cacd324eb06@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:56:12 +0200
In-Reply-To: <55665952-c6ce-d097-d4b7-4cacd324eb06@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:14 +0200")
Message-ID: <87bkb2njsj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dylan Van Assche <me@dylanvanassche.be> writes:

> I would like to include the board file for the SHIFTPHONES SHIFT6mq
> smartphone.
> This smartphone is manufactured by SHIFTPHONES and uses the Snapdragon
> SDM845 SoC.
> At postmarketOS, we run the mainline kernel on this phone so shipping
> this board file
> from upstream would be a great addition. Below, the questions from the wi=
ki:
>
> * description for what hardware this is:
>
> Smartphone with a SDM845 chip and a WCN3990 Bluetooth/WiFi chip.
> The WCN3990 chip is connected to 2 QM488xx radios, one is used
> for 2.4Ghz and the other one for 5Ghz radio.
>
> * origin of the board file (did you create it yourself or where you
> =C2=A0 downloaded)
>
> Extracted from the stock firmware.
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
> - WCN3990 hw1.0
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dshift=
_axolotl
> =C2=A0=C2=A0=C2=A0 sha256sum:
> 082f65dad7b2ee938911d60a0f4f9ef8df18417ce69e9f42c9e947e961d18f30
> =C2=A0=C2=A0=C2=A0 md5sum: 5dce0c544a7a8036ebd4beaeba3d244b
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dshift_axolotl

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 25 in total

https://github.com/kvalo/ath10k-firmware/commit/6b7eabe275dc87037f5aa782571=
91944a6809d63

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

