Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F7218716A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731664AbgCPRqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:46:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42869 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731715AbgCPRqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:46:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id h8so10151849pgs.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 10:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x8k/jVDU37gpRStc/a1cMXTfOGWyxVmD3DNhdHEzGuc=;
        b=SNnJxl2FEZewe1WY+S9vsiJVO/RvMY9rzFdwaiZRq6bKfSdG0MrbZomIRd57NTMGql
         grAJtsFcNQZL6qmZDeMWM+yYS93OQFB+r8a1yyLj/VxjxiNsopnrxT++XUTp7aQYGdQB
         81T38+qSDWHadjss5lqF/M96/i76BpNjBsJNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x8k/jVDU37gpRStc/a1cMXTfOGWyxVmD3DNhdHEzGuc=;
        b=ed1YSf4ypK60RWILIpvZyQKN4eyxfdfg//Y1Js7AgbuKckV4piGmHIzqNk/KVzGKSR
         sjLeTBXVed3YcKucIgQqmBYx8l4LKhXN3+HMvX9OJQIJMDOGwFE6PNPqxrBBXLIqkGPr
         E8wNdwhN0R+MaokJzTfu/gQrRiw9wHnkppd5X6gqlqu4dTYZh+0344r17HaP6rrgKcxe
         pore0afoeyeqv2OryHlPjYTq/KyUh7mUAufOKZYCTSYxIyKENZoVup9rbld2cVKEwhHP
         ZgEc8Azga9Yq9MxOpocA450GodB5L6SZDxW6Sfg9gz40/fU6Akd9EeKMSUV1bvxPdsNK
         DIwQ==
X-Gm-Message-State: ANhLgQ1bbFOejHxC+M4jaanlrvGgCSeHL1+i7ywCf4QfVy6tYxxrHJqW
        ujLkyUe4v10wLyU4sfmQ/UWniw==
X-Google-Smtp-Source: ADFU+vtljDaaENS/fxZFNy91odlW5ccQs77guzTCnMx9s1r6JqlQeTyMhwB/uC72V0pG3rBE4+aFeg==
X-Received: by 2002:a62:25c3:: with SMTP id l186mr783098pfl.52.1584380777006;
        Mon, 16 Mar 2020 10:46:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u12sm478026pfm.165.2020.03.16.10.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 10:46:16 -0700 (PDT)
Date:   Mon, 16 Mar 2020 10:46:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_qca: Add support for Qualcomm
 Bluetooth SoC QCA6390
Message-ID: <20200316174615.GP144492@google.com>
References: <20200314094328.3331-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200314094328.3331-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 14, 2020 at 05:43:27PM +0800, Rocky Liao wrote:
> This patch adds support for QCA6390, including the devicetree and acpi
> compatible hwid matching, and patch/nvm downloading.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 44 +++++++++++++++++++++++++++++++----
>  drivers/bluetooth/btqca.h   |  8 +++++++
>  drivers/bluetooth/hci_qca.c | 46 +++++++++++++++++++++++++++++++------
>  3 files changed, 86 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index a16845c0751d..ca126e499c58 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -14,6 +14,9 @@
>  
>  #define VERSION "0.1"
>  
> +#define QCA_IS_3991_6390(soc_type)    \
> +	(soc_type == QCA_WCN3991 || soc_type == QCA_QCA6390)

This macro style is 3991 or 6390 is pretty ugly, IMO it's worse than the
problem it intends to solve.

I would either just spell out what the macro does, or if that becomes to
cumbersome (especially when more types are added) have a macro that checks
a bitmask like:

qca_soc_type_matches(soc_type, QCA_WCN3991 | QCA6390)

For this the SoC types read from FW would have to be mapped to a bit for
each SoC type, which could be done during initialization.

Another alternative could be to have a set of flags that indicate if a SoC
has certain characteristics (e.g. enhanced logging needs to be enabled),
these flags could be set during initialization.

> +
>  int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  			 enum qca_btsoc_type soc_type)
>  {
> @@ -32,7 +35,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  	 * VSE event. WCN3991 sends version command response as a payload to
>  	 * command complete event.
>  	 */
> -	if (soc_type == QCA_WCN3991) {
> +	if (QCA_IS_3991_6390(soc_type)) {
>  		event_type = 0;
>  		rlen += 1;
>  		rtype = EDL_PATCH_VER_REQ_CMD;
> @@ -69,7 +72,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  		goto out;
>  	}
>  
> -	if (soc_type == QCA_WCN3991)
> +	if (QCA_IS_3991_6390(soc_type))
>  		memmove(&edl->data, &edl->data[1], sizeof(*ver));
>  
>  	ver = (struct qca_btsoc_version *)(edl->data);
> @@ -138,6 +141,29 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>  }
>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>  
> +int qca_send_enhancelog_enable_cmd(struct hci_dev *hdev)
> +{
> +	struct sk_buff *skb;
> +	int err;
> +	const u8 param[2] = {0x14, 0x01};
> +
> +	bt_dev_dbg(hdev, "QCA enhanced log enable cmd");
> +
> +	skb = __hci_cmd_sync_ev(hdev, QCA_ENHANCED_LOG_ENABLE_CMD, 2,
> +				param, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
> +
> +	if (IS_ERR(skb)) {
> +		err = PTR_ERR(skb);
> +		bt_dev_err(hdev, "Enhanced log enable cmd failed (%d)", err);
> +		return err;
> +	}
> +
> +	kfree_skb(skb);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qca_send_enhancelog_enable_cmd);
> +
>  static void qca_tlv_check_data(struct qca_fw_config *config,
>  		const struct firmware *fw, enum qca_btsoc_type soc_type)
>  {
> @@ -217,7 +243,7 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
>  				tlv_nvm->data[0] |= 0x80;
>  
>  				/* UART Baud Rate */
> -				if (soc_type == QCA_WCN3991)
> +				if (QCA_IS_3991_6390(soc_type))
>  					tlv_nvm->data[1] = nvm_baud_rate;
>  				else
>  					tlv_nvm->data[2] = nvm_baud_rate;
> @@ -268,7 +294,7 @@ static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
>  	 * VSE event. WCN3991 sends version command response as a payload to
>  	 * command complete event.
>  	 */
> -	if (soc_type == QCA_WCN3991) {
> +	if (QCA_IS_3991_6390(soc_type)) {
>  		event_type = 0;
>  		rlen = sizeof(*edl);
>  		rtype = EDL_PATCH_TLV_REQ_CMD;
> @@ -301,7 +327,7 @@ static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
>  		err = -EIO;
>  	}
>  
> -	if (soc_type == QCA_WCN3991)
> +	if (QCA_IS_3991_6390(soc_type))
>  		goto out;
>  
>  	tlv_resp = (struct tlv_seg_resp *)(edl->data);
> @@ -442,6 +468,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			    (soc_ver & 0x0000000f);
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/crbtfw%02x.tlv", rom_ver);
> +	} else if (soc_type == QCA_QCA6390) {
> +		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
> +			    (soc_ver & 0x0000000f);
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/htbtfw%02x.tlv", rom_ver);
>  	} else {
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/rampatch_%08x.bin", soc_ver);
> @@ -464,6 +495,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	else if (qca_is_wcn399x(soc_type))
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/crnv%02x.bin", rom_ver);
> +	else if (soc_type == QCA_QCA6390)
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/htnv%02x.bin", rom_ver);
>  	else
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/nvm_%08x.bin", soc_ver);
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index e16a4d650597..bc703817c3d7 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -14,6 +14,7 @@
>  #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
>  #define MAX_SIZE_PER_TLV_SEGMENT	(243)
>  #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
> +#define QCA_ENHANCED_LOG_ENABLE_CMD     (0xFC17)
>  
>  #define EDL_CMD_REQ_RES_EVT		(0x00)
>  #define EDL_PATCH_VER_RES_EVT		(0x19)
> @@ -127,6 +128,7 @@ enum qca_btsoc_type {
>  	QCA_WCN3990,
>  	QCA_WCN3991,
>  	QCA_WCN3998,
> +	QCA_QCA6390,

QCA_QCAxxxx seems a bit redundant, why not call it QCA_6390 or QCA6390?
I also wouldn't be opposed to scrap the QCA_ prefixes from the WCN399x
types, this is the QCA Bluetooth driver, so it's pretty evident that
these are Qualcomm chips.
