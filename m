Return-Path: <linux-arm-msm+bounces-81044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0BC47609
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22D14349D66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F015314D21;
	Mon, 10 Nov 2025 14:57:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92CA314B76;
	Mon, 10 Nov 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786647; cv=none; b=UYEbqnWdx7NnNoQQ2fGJ/ANutsSdBuVtiyM+ftZBcivu6EkTfkgCjJNihkXJJWJNwKbL+gyDSWzLj7qzInAZxMBd2if/udgu4nJPm/qnmdkQFEQYhClncOl8Akh0VYAlc/HNjmRLf3Jbr05Xz8/yMmYyO5Av0nwswJe1XqxDqyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786647; c=relaxed/simple;
	bh=ytkZLxUvZNz1oafWKGBnM5poTq2DgkQpU0drTR4RYJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzMIoXRT41im5zssPk/sKPPzfr0HsRRw+Stixisk+MTdP/Ug6mnFh3Ws6l0MMW/u8QaY85e5K037fN/DE5KL5BHK42J3mCi/oyN9cYs/tdIYmMZc4s7banEL70wKXSWf8Rorw29krUD1ro0fwT7RFTFoWo68670wfJ7gl/hTzlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C523461CC3FED;
	Mon, 10 Nov 2025 15:57:08 +0100 (CET)
Message-ID: <8c5da0af-0c41-433e-894c-a7bb69a2e85a@molgen.mpg.de>
Date: Mon, 10 Nov 2025 15:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] Bluetooth: btusb: add default nvm file
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
 quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
References: <20251110132225.2413017-1-quic_shuaz@quicinc.com>
 <20251110132225.2413017-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251110132225.2413017-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Shuai,


Am 10.11.25 um 14:22 schrieb Shuai Zhang:
> If no NVM file matches the board_id, load the default NVM file to ensure
> basic Bluetooth functionality. The default NVM file may differ in
> functionality and performance because specific NVM files enable certain
> vendor commands based on chip capabilities. This fallback improves
> compatibility when a dedicated NVM file is not available.
> 
> Also, pass board_id explicitly to select the correct NVM file. This is
> required for proper NVM file determination.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>   drivers/bluetooth/btusb.c | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dcbff7641..09e81320c 100644
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
> @@ -3606,10 +3605,21 @@ static int btusb_setup_qca(struct hci_dev *hdev)
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
> +			/* If the board-specific NVM file is not found, set board_id to 0
> +			 * and load the default NVM file to ensure basic functionality.
> +			 */
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

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

