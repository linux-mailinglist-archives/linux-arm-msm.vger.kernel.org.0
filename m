Return-Path: <linux-arm-msm+bounces-87074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6ADCEB8E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA3AF3009ECA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B82313545;
	Wed, 31 Dec 2025 08:39:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C66D3126C7;
	Wed, 31 Dec 2025 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170374; cv=none; b=SQSDjWZw4+ab1R1tP/FULVPY5DH/CgeO304YjPY9+KuHoWk7iIqLoRnNXEaYuHBqv94gz1d7CbPHlsKE3aR7XhiqOnTdPUGzrVfFVnjurP9R/LIQP6RCRkS3cbegPPhNzOsuphICtrRQN5K+3Feb0P62hEb2Bf9bd0ddmbqbulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170374; c=relaxed/simple;
	bh=iG6gfnqKEPymtzl1T+z8HwS2t+ON1MJCR6ox7Y7y4LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O06nffqL01JBqqUHFnoCJnlcYw1tOLG3GN38XUXxMFjysaNcsdsLwNDxCGbiurjLHjXkbs57j4lYqliAtJJOzqH4TdlFWlZb5YQjJwgFTL8AhhbmPG0e7scizjfbf44RKGkDu/AKXYNB6B6CH+7Pz5+NViyCMxLcr6m3XAwhHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [10.110.1.152] (unknown [124.195.223.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6D3DB61B48475;
	Wed, 31 Dec 2025 09:38:53 +0100 (CET)
Message-ID: <fee7fcb8-06dc-4b94-943c-b261d2c71976@molgen.mpg.de>
Date: Wed, 31 Dec 2025 14:38:24 +0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] Bluetooth: btqca: move WCN7850 workaround to the
 caller
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
 <20251231075817.2611848-2-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251231075817.2611848-2-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Shuai,


Thank you for the patch.

Am 31.12.25 um 13:58 schrieb Shuai Zhang:
> To code uniformity, move WCN7850 workaround to the caller.

Please elaborate, and detail what WCN7850 workaround.

> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/btqca.c | 41 +++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..b4c0a018d 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -581,28 +581,11 @@ static int qca_download_firmware(struct hci_dev *hdev,
>   
>   	ret = request_firmware(&fw, config->fwname, &hdev->dev);
>   	if (ret) {
> -		/* For WCN6750, if mbn file is not present then check for
> -		 * tlv file.
> -		 */
> -		if (soc_type == QCA_WCN6750 && config->type == ELF_TYPE_PATCH) {

The `config->type == ELF_TYPE_PATCH` wasn’t moved, and it’s not visible 
from the diff, why. Please explain in the commit message.

> -			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> -				   config->fwname, ret);
> -			config->type = TLV_TYPE_PATCH;
> -			snprintf(config->fwname, sizeof(config->fwname),
> -				 "qca/msbtfw%02x.tlv", rom_ver);
> -			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
> -			ret = request_firmware(&fw, config->fwname, &hdev->dev);
> -			if (ret) {
> -				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> -					   config->fwname, ret);
> -				return ret;
> -			}
> -		}
>   		/* If the board-specific file is missing, try loading the default
>   		 * one, unless that was attempted already.
>   		 */
> -		else if (config->type == TLV_TYPE_NVM &&
> -			 qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
> +		if (config->type == TLV_TYPE_NVM &&
> +		    qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
>   			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>   			ret = request_firmware(&fw, config->fwname, &hdev->dev);
>   			if (ret) {
> @@ -862,8 +845,24 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   
>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>   	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> -		return err;
> +		/* For WCN6750, if mbn file is not present then check for
> +		 * tlv file.
> +		 */
> +		if (soc_type == QCA_WCN6750) {
> +			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			config.type = TLV_TYPE_PATCH;
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/msbtfw%02x.tlv", rom_ver);
> +			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +		}
> +
> +		if (err) {
> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			return err;
> +		}
>   	}
>   
>   	/* Give the controller some time to get ready to receive the NVM */


Kind regards,

Paul

