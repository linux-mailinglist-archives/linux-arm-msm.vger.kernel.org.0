Return-Path: <linux-arm-msm+bounces-3734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AA0808B21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4647B1C209A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082A842ABE;
	Thu,  7 Dec 2023 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUmhWBrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B741847;
	Thu,  7 Dec 2023 14:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362E2C433C8;
	Thu,  7 Dec 2023 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960923;
	bh=Uhqwn4e8NYkWS0QZNCGhJ/sVj57HJ9Z86Fu38hB/5RM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TUmhWBrHpl4gV1UNoTpIh1wlYwXheV8g8XsWmzWdgZ+x5/2uIMzA0vtLkw5w2m0kd
	 y9C+SkdlgYy+Gewa4i0kAwCuQPMV/4dZImgV9rWnm+lgg3SY7PCCIyQ1qbeOm9RJ6M
	 kLr98MabDMhrlaZ5rT18K+20uDGx4YeDykTLGPAebhaSfi+v62dHl/Y0axU2uhD7Bs
	 +dLsc5RiOcIF2rdcdAXZVmMrwXML4VcA8tkyZ7bKFhkvlYTYX7zm55oAbXceR6tiR0
	 88LzhWUInMjv5KCgDZCQrC4soOdmmFKb0zqzrSS997hya41VvgW9OBW1PkNIHDHS2E
	 mL/Xx3kHfC30A==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for Oneplus 6/6T
References: <b71aa947-4644-e1a3-40e1-99d11d0ab8d7@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:55:20 +0200
In-Reply-To: <b71aa947-4644-e1a3-40e1-99d11d0ab8d7@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:10 +0200")
Message-ID: <87fs0enjtz.fsf@kernel.org>
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

> I would like to include the board file for the Oneplus 6/6T smartphone.
> This smartphone is manufactured by Oneplus and uses the Snapdragon
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
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Donepl=
us_sdm845
> =C2=A0=C2=A0=C2=A0 sha256sum:
> a46790bc201026e8f38a19f3acd749640b54b73d14e09287659a647b9cc3ee8e
> =C2=A0=C2=A0=C2=A0 md5sum: f744a3402e260d7fd330cbc964972a5c
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Doneplus_sdm845

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 24 in total

https://github.com/kvalo/ath10k-firmware/commit/328aea229a35920e3f54fc7b7ff=
0070a95ef421f

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

