Return-Path: <linux-arm-msm+bounces-3736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6A808B2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A8D2834CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9524437C;
	Thu,  7 Dec 2023 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOFdanfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F50125C5;
	Thu,  7 Dec 2023 14:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BC2C433C8;
	Thu,  7 Dec 2023 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701961035;
	bh=rTtlsCFWDKnwMZqpHuScxag2sRjsNC4CcU7JsWRzNu8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oOFdanfmCzaeLly9lYQnKgl7XbmVJgHTKA39+tTEAFzBoFJ81xOdLYBV3uqtSPJVE
	 Dl0GHeEuvhADJmnCHwz0cdMjdfjPcXFtEFOZPSb1XcRwqxFV1GjSlyynYMJtB5bQzm
	 4QZ4+67A75BaLfU1dqIrXTzKz4CHf9ZjSCmtup3XwjXYClFFYtEELJuVG2Q6J8fVLX
	 IVw9u5kR83ODJeVSelyytqyVlfJqrFnYYO8xSRw2ygfmaXKfXY4irFELAkKtWyB0sO
	 ifm0v6XG3IFgR0yZVueqLXf861kLj8OSgiJsx+90zzQHiVdPBxrPiukTofaccRSqnK
	 JYlxFvYL5qSlA==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for Xiaomi POCOPHONE F1
References: <b4989ba4-5d14-0683-d3a9-cf0e983fa921@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:57:12 +0200
In-Reply-To: <b4989ba4-5d14-0683-d3a9-cf0e983fa921@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:17 +0200")
Message-ID: <877clqnjqv.fsf@kernel.org>
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

> I would like to include the board file for the Xiaomi POCOPHONE F1
> smartphone.
> This smartphone is manufactured by Xiaomi and uses the Snapdragon
> SDM845 SoC.
> At postmarketOS, we run the mainline kernel on this phone so shipping
> this board file
> from upstream would be a great addition. A variant property was needed
> to avoid colliding
> with other SDM8845-based smartphones since they all share the same
> qmi-board-id and qmi-chip-id values.
>
> Below, the questions from the wiki:
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
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dxiaom=
i_beryllium
> =C2=A0=C2=A0=C2=A0 sha256sum:
> 470a670fa15fd1f5625246556c83cb3aa811b0e954813da518e241e3a48bf4a2
> =C2=A0=C2=A0=C2=A0 md5sum: 0655a0b7865c13172c43422c035d02a2
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dxiaomi_beryllium

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 26 in total

https://github.com/kvalo/ath10k-firmware/commit/a041131869db6eadcf0d4533e5b=
340a81d055a3b

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

