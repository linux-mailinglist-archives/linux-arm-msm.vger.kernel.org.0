Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B8E26C6C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 20:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgIPSCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 14:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgIPSCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 14:02:33 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB6EC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 11:02:31 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so4442312pfd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oKK+R4vB+7dRT25SkGFNImJ3MtLBDRDqIznhx0nRzAs=;
        b=RAv+ZcfpNEyAbGataYWi56XvH+C0d2XlA3emc1lqWb35HAVu5yFwWC1CUAL88Z3rz8
         O113BD6SSZ7xE1R6gCYR+5Uiv8Wz4wRppiA+tTQym8I/NnqdG+l6StU2B0twqgdGYvAS
         wUJLqUDnBrTeDpBjWcEAif4I6ydTNJmouwBy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oKK+R4vB+7dRT25SkGFNImJ3MtLBDRDqIznhx0nRzAs=;
        b=sZMzOjYZuKtnplAa0VNxkkAjxmwUMkPG7u0O/RGtuAFBpsaTVrn/yASRYM//UcfzgI
         H7ch3fOp3Z9HPmxku+Buk3IU6xIKd0UfYs1QrnMmzTF3T+yB4XcE8xKk3i4ji37krvmp
         4avN8YyMiB/ScyzRiicFnIb0rVNOqHYH4G/QPYZJUDd7gEc+OKMcx1MLyfAAHLkjWIED
         HLpRHVAYI/PAmGTSr8lNgInWMdw4ZMvdFEROZpC6pykDxjlqd0oTpp8jt7R3Cvmq9q3A
         CD4PPh95BXUd87TAbU3166xcz0clgtQ6ysr+xZA8I5lVE9FBMlX230e7t4Dy503scB9Y
         ZAHg==
X-Gm-Message-State: AOAM532KGGDt1q1aBjFrxSQlOYvQfKs9IDPQSLAc+3Xsl6iE4RPmMRjT
        wTxkFzr6mgbHf6FsaVTmAR2xRw==
X-Google-Smtp-Source: ABdhPJyByD4aTCPLAJcpe/mnCOM1dCgtz7cfGxhzyAuNU3s+nJ2bpn6PbSwbInUI7LZr3ekI7PjsjQ==
X-Received: by 2002:a62:3044:0:b029:142:2501:398b with SMTP id w65-20020a6230440000b02901422501398bmr7496943pfw.80.1600279350855;
        Wed, 16 Sep 2020 11:02:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id z1sm17315402pfz.70.2020.09.16.11.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 11:02:30 -0700 (PDT)
Date:   Wed, 16 Sep 2020 11:02:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1] Bluetooth: Use NVM files based on SoC ID for WCN3991
Message-ID: <20200916180229.GA3560556@google.com>
References: <1600184605-31611-1-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1600184605-31611-1-git-send-email-gubbaven@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

I agree with Marcel that the version magic is confusing ...

On Tue, Sep 15, 2020 at 09:13:25PM +0530, Venkata Lakshmi Narayana Gubba wrote:
> This change will allow to use different NVM file based
> on WCN3991 BT SoC ID.Need to use different NVM file based on
> fab location for WCN3991 BT SoC.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 41 +++++++++++++++++++++++++----------------
>  drivers/bluetooth/btqca.h   | 13 ++++++++-----
>  drivers/bluetooth/hci_qca.c | 11 +++++------
>  3 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index ce9dcff..a7e72f1 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -14,12 +14,11 @@
>  
>  #define VERSION "0.1"
>  
> -int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> +int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
>  			 enum qca_btsoc_type soc_type)
>  {
>  	struct sk_buff *skb;
>  	struct edl_event_hdr *edl;
> -	struct qca_btsoc_version *ver;
>  	char cmd;
>  	int err = 0;
>  	u8 event_type = HCI_EV_VENDOR;
> @@ -70,9 +69,9 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  	}
>  
>  	if (soc_type >= QCA_WCN3991)
> -		memmove(&edl->data, &edl->data[1], sizeof(*ver));
> -
> -	ver = (struct qca_btsoc_version *)(edl->data);
> +		memcpy(ver, &edl->data[1], sizeof(*ver));
> +	else
> +		memcpy(ver, &edl->data, sizeof(*ver));
>  
>  	bt_dev_info(hdev, "QCA Product ID   :0x%08x",
>  		    le32_to_cpu(ver->product_id));
> @@ -83,13 +82,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  	bt_dev_info(hdev, "QCA Patch Version:0x%08x",
>  		    le16_to_cpu(ver->patch_ver));
>  
> -	/* QCA chipset version can be decided by patch and SoC
> -	 * version, combination with upper 2 bytes from SoC
> -	 * and lower 2 bytes from patch will be used.
> -	 */
> -	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
> -		       (le16_to_cpu(ver->rom_ver) & 0x0000ffff);
> -	if (*soc_version == 0)
> +	if (le32_to_cpu(ver->soc_id) == 0 || le16_to_cpu(ver->rom_ver) == 0)
>  		err = -EILSEQ;
>  
>  out:
> @@ -446,15 +439,25 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
>  EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
>  
>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> -		   enum qca_btsoc_type soc_type, u32 soc_ver,
> +		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>  		   const char *firmware_name)
>  {
>  	struct qca_fw_config config;
>  	int err;
>  	u8 rom_ver = 0;
> +	u32 soc_ver;
>  
>  	bt_dev_dbg(hdev, "QCA setup on UART");
>  
> +	/* QCA chipset version can be decided by patch and SoC
> +	 * version, combination with upper 2 bytes from SoC
> +	 * and lower 2 bytes from patch will be used.
> +	 */
> +	soc_ver = (le32_to_cpu(ver.soc_id) << 16) |
> +		       (le16_to_cpu(ver.rom_ver) & 0x0000ffff);
> +

Can we at least do the leN_to_cpu conversions in qca_read_soc_version()
as previously to make this less clunky?

And/or define a macro to extract 'soc_ver' to unclunkify this further.

> +	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
> +
>  	config.user_baud_rate = baudrate;
>  
>  	/* Download rampatch file */
> @@ -491,9 +494,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	if (firmware_name)
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/%s", firmware_name);
> -	else if (qca_is_wcn399x(soc_type))
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/crnv%02x.bin", rom_ver);
> +	else if (qca_is_wcn399x(soc_type)) {
> +		if (ver.soc_id == QCA_WCN3991_SOC_ID) {
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/crnv%02xu.bin", rom_ver);
> +		} else {
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/crnv%02x.bin", rom_ver);
> +		}
> +	}
>  	else if (soc_type == QCA_QCA6390)
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/htnv%02x.bin", rom_ver);
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index d81b74c..d01a9f5 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -34,6 +34,8 @@
>  #define QCA_HCI_CC_OPCODE		0xFC00
>  #define QCA_HCI_CC_SUCCESS		0x00
>  
> +#define QCA_WCN3991_SOC_ID		(0x40014320)

The QCA_ prefix seems a bit verbose, given that this is a QCA driver and
WCN3991 uniquely identifies the chip. Having the prefix just needlessly
clutters conditions, I suggest to just call it SOC_ID_WCN3991.
