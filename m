Return-Path: <linux-arm-msm+bounces-80934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5FC454A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2E018894DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CB0261B9A;
	Mon, 10 Nov 2025 08:01:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370379CD;
	Mon, 10 Nov 2025 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761700; cv=none; b=bey3A7uiJe4d+5c++6PPZ0BXXvDA9jU9MJ3/hEg5XGZrs95SMK+SawfOYqFj1jU+kdUDXXK9YG6OSPje1RhRWEAL1chzNSdKkvQTb+aePVLh7Rp1ciSFBz3gT35aYNXLyiy83wjGdrNfupz88VKkhK30McQOJdIfAhwxCXPM4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761700; c=relaxed/simple;
	bh=JwjdNc5Od1/yX9H/LlUz8bXR7/nAIi8de1f95CaCqDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxA8oYp4Y7dwL58rMxvKLYIfyMuvILFC3On15MU91LNNmZA0VHPExmq1ebet87VFFrNBBjggZFQ+4XeY/oaNLdSNRwMfIVCSjIX0FnjUYtMqpi/pCJc1Cmz29rw1vEtSUlAA1Q5Au4MYyMtwKTTRAXbB3H2PTO2dhh17jSLAy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.215] (p57bd98ba.dip0.t-ipconnect.de [87.189.152.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E5EF8600D068A;
	Mon, 10 Nov 2025 09:01:24 +0100 (CET)
Message-ID: <5dc5f0f7-3dfa-403a-821d-b4fdb800d1e8@molgen.mpg.de>
Date: Mon, 10 Nov 2025 09:01:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] Bluetooth: btusb: add default nvm file
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
 quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
References: <20251110034134.1016537-1-quic_shuaz@quicinc.com>
 <20251110034134.1016537-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251110034134.1016537-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Shuai,


Thank you for the patch.

Am 10.11.25 um 04:41 schrieb Shuai Zhang:
> If no NVM file matches the board_id, load the default NVM file.

Maybe also add the comment, that the NVM file is always compatible(?) 
and just might not give the best performance.

Also, please add a comment about passing board_id now. (Is that 
necessary or just an optimization?)

> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>   drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dcbff7641..020dbb0ab 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>   }
>   
>   static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> -					const struct qca_version *ver)
> +					const struct qca_version *ver,
> +					u16 board_id)
>   {
>   	u32 rom_version = le32_to_cpu(ver->rom_version);
>   	const char *variant, *fw_subdir;
>   	int len;
> -	u16 board_id;
>   
>   	fw_subdir = qca_get_fw_subdirectory(ver);
> -	board_id = qca_extract_board_id(ver);
>   
>   	switch (le32_to_cpu(ver->ram_version)) {
>   	case WCN6855_2_0_RAM_VERSION_GF:
> @@ -3517,14 +3516,14 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
>   
>   static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>   				    struct qca_version *ver,
> -				    const struct qca_device_info *info)
> +				    const struct qca_device_info *info,
> +				    u16 board_id)
>   {
>   	const struct firmware *fw;
>   	char fwname[80];
>   	int err;
>   
> -	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
> -
> +	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id);
>   	err = request_firmware(&fw, fwname, &hdev->dev);
>   	if (err) {
>   		bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
> @@ -3606,10 +3605,19 @@ static int btusb_setup_qca(struct hci_dev *hdev)
>   	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
>   
>   	if (!(status & QCA_SYSCFG_UPDATED)) {
> -		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
> -		if (err < 0)
> -			return err;
> +		u16 board_id = qca_extract_board_id(&ver);
>   
> +		err = btusb_setup_qca_load_nvm(hdev, &ver, info, board_id);
> +		if (err < 0) {
> +			//if the board id is not 0, try to load the defalut nvm file

Did `checkpatch.pl` not complain about the missing space, and 
misspelling of *default*?

> +			if (err == -ENOENT && board_id != 0) {
> +				err = btusb_setup_qca_load_nvm(hdev, &ver, info, 0);
> +				if (err < 0)
> +					return err;
> +			} else {
> +				return err;
> +			}
> +		}
>   		/* WCN6855 2.1 and later will reset to apply firmware downloaded here, so
>   		 * wait ~100ms for reset Done then go ahead, otherwise, it maybe
>   		 * cause potential enable failure.

Please try to catch the style errors before submitting patches.


Kind regards,

Paul

