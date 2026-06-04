Return-Path: <linux-arm-msm+bounces-111112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id okCmOhEJIWoy+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:11:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F077563CEBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Wfj5/olb";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DA133020C05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A971C7012;
	Thu,  4 Jun 2026 05:09:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CD3BD228
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549758; cv=none; b=l7ngO4odjJqQL1H5XD+U/b2UTeTxKm1AHHLOCKOdBGwqnktNFqotdiFB3H3BIUFC6X5bvsGyGa6RfGvcmvF63pqSaxqZn/oCXoihWf/icXXxHHt57tuHz8P9kQeo3EfnIppuJuzJt6B8Bq9KDM9bK5egzrUHeXAo04c/d6sUWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549758; c=relaxed/simple;
	bh=Av1frBjcGBjlzFynU2Hy7rkXSpmEfO68DCNBSYURblM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzDx8MU3fBWP3yly/ql/k0srFHGxKL58QR+/i9HihOUJNzss/1WGaQNgKWQzXIaQl/tyYH/l8tX5sy6veG+ysdqiRvzCD+680Cn6ueNOYhKGwcHb6kTQkeJweIvFin/KEqKLcONi31+KQFTmKLHoOc/Ia7gSsKT1BoCTlKhJoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wfj5/olb; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36e0a13e801so60863a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780549755; x=1781154555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+vy0QPkbgBGQCp+nbHU8oM3LzLFEBCDA4xt5ygdBfo=;
        b=Wfj5/olb/9nGiV8QqwNuMpzRQsqb18H9713Cs0ytRcaX6COoKQox8ltM0esz5CKpq4
         NF25W7Ro5GRSmIa9C6KVDg8W0FZZ+tOKHvf0Zkz5xsglkahxjTJAWqy4zh29M5b3Wtif
         7StVzLcsrk9eg9/p/oduv0LrOtwVsR5vtiHQpDEoTahE06rjAbTocQQaK1a23kkvo35D
         Mw3viVXOmuZ7zuIqGKeBMKHAzgKuWoDcfkWyRAFxqmEM9lH33TJbgcBl1iBBa4fgP8vR
         z57bYXJMxNceX8iMrvqV97EWdlhwRumfKDSa1KoXOEnbE/9rN62yV5I489uZd28iYkRR
         jbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780549755; x=1781154555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+vy0QPkbgBGQCp+nbHU8oM3LzLFEBCDA4xt5ygdBfo=;
        b=gYU41QyxK586lTfQS0agHggzClLj4wEes2Z51y02akymSWRsu4/AoRxpkvhhg4Zb1w
         hJ1bj38hgz5jnZ2ygctNJRYnmeUlHZgxdBaD73LHvrske2VmVmQPypOflkOKIsqamC7n
         o+z4a/mn1RCV4sNssMABvDj725k5syG1rKtwkNYaAfKYEwOmfXodOh8gvKZk5I+BA+9M
         gFUBnuSBjuJyXjfdtfiiLhUwiEAEzCNvdFtUxWtvxsWDJuvjao0xhCX5gDQGRpbyY4bL
         mVKnWEAuM3ndW/EnSeB3hmxka0WWdHADqGxfb3Qbd/L7PnRkdkFxEiVEcZocnPSe+h2a
         t8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9YTWRkFpOK4vxfgx9uTL1PRM/zb7DL68sFwwsoBHrjRURXtIgqusDB616zrENtRkw8UNXYTzc7kPb8IE7g@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHZZgUicNPo3a1Sudmg6VUd8z5KEb5NX9k70OQBVIdHx5n09V
	O5+rnzLCsWZ1a0NrqZPhROKA7byH1YZDWMRjs/vYrOI0cbg/2IOTeUp0
X-Gm-Gg: Acq92OE7k2ES8lsEPtg/q5cc+HLqND3OCt9MJ858QrAoG6vcEHgDdMvyQ0WJH6BTbWF
	10DZf5b2K6pJQlgLXUpU7Sroqg1gpLylf3LIi2jDlGxHgNsR6zNY/y+tSIzo4RfQALSN1n48INY
	YID0xfN0EmVmj/574H5TQRLz6R65BX6mTSAd5nbUgOfah38xEuVjKDB2zQY6xtdP5Gr7Ytv7owk
	xQ78sUkcXJsdoP3unVNQ20P1FobEO9LdLC78dGSaFejRpE/+qzktO6ixfwqAJdkTMO9nYC/FQXR
	nLjlJMDEXtLzB4jgACSbtyz9SfZb3C6jQd151QnrbWyf54KuZcB9/fEYduTTo2/Vq6/20v/XSJo
	4D63T4kpfzstX2cmLWYorPCnnxyT94JlWsxthpzInsenDtQAFazRe1TSKfdIGkm+748TfT8c9v8
	IxU6uPs/Br5z7rPz4s3AOj5Ie3DVBSiUcgCzaRGkQOPoMb
X-Received: by 2002:a17:90b:4b85:b0:366:2b56:3ec2 with SMTP id 98e67ed59e1d1-36fbd7cbd0emr692507a91.1.1780549755227;
        Wed, 03 Jun 2026 22:09:15 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.166.161])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-36f68bf99dcsm1595578a91.0.2026.06.03.22.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 22:09:14 -0700 (PDT)
Message-ID: <f5fe7d26-4467-4015-be65-f01d7acda213@gmail.com>
Date: Thu, 4 Jun 2026 12:09:09 +0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL
 and RW151 support
To: zwq2226404116@163.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 Wanquan Zhong <wanquan.zhong@fibocom.com>
References: <20260603070608.309114-1-zwq2226404116@163.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260603070608.309114-1-zwq2226404116@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zwq2226404116@163.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER(0.00)[larsm17@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,lunn.ch,davemloft.net,fibocom.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F077563CEBD

On 2026-06-03 14:06, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
> 
> Add MHI PCIe device configuration for Rolling Wireless modules:
> 
> - RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW0
> - RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes
> 
> Register PCI_DEVICE_SUB entries for vendor 0x2099, device 0x1300/1301 on
> QCOM 0x011a (sdx35) and 0x0309 (sdx75) respectively.
> 
> Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
> WWAN_PORT_ADB port via the wwan subsystem.
> 
> Tested-on: Rolling RW135R-GL / RW151 hardware (MHI probe, MBIM, DIAG, ADB)
> 
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 100 +++++++++++++++++++++++++++++
>   drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
>   2 files changed, 101 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0884a384b77f..ad166de2d0f3 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -902,6 +902,94 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
>   	.sideband_wake = true,
>   };
>   
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 8000,
> +	.num_channels = ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +	.ch_cfg = mhi_rolling_rw135r_channels,
> +	.num_events = ARRAY_SIZE(mhi_rolling_rw135r_events),
> +	.event_cfg = mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
> +	.edl = "qcom/sdx35m/prog_firehose_ddr.elf",
> +	.name = "rolling-rw135r",
> +	.config = &modem_rolling_rw135r_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_rolling_rw151_channels),
> +	.ch_cfg = mhi_rolling_rw151_channels,
> +	.num_events = ARRAY_SIZE(mhi_rolling_rw151_events),
> +	.event_cfg = mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
> +	.edl = "qcom/sdx75m/prog_firehose_lite.elf",
> +	.name = "rolling-rw151",
> +	.config = &modem_rolling_rw151_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
>   /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>   static const struct pci_device_id mhi_pci_id_table[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -909,6 +997,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>   	/* Telit FN920C04 (sdx35) */
>   	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
>   		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
> +	/* Rolling RW135R-GL (sdx35) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
> +	/* Rolling RW135R-GL (sdx35) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>   		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>   	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> @@ -941,6 +1035,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>   	/* Telit FE990B40 (sdx72) */
>   	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>   		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
> +	/* Rolling RW151 (sdx75) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1300),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
> +	/* Rolling RW151 (sdx75) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1301),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>   		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
>   	/* QDU100, x100-DU */
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index fa73861db6ad..c0bba94d5c3f 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -264,6 +264,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
>   	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
>   	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
>   	{ .chan = "NMEA", .driver_data = WWAN_PORT_NMEA },
> +	{ .chan = "ADB", .driver_data = WWAN_PORT_ADB },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> 
> --
> 2.43.0
> 
> 
Hi,
does both the sdx35 and the sdx75 device really have the same Rolling 
PCI Vid:Pid (2099:1300 and 2099:1301)?

thanks
Lars



