Return-Path: <linux-arm-msm+bounces-110642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGw4NO2xHWphdAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E068622827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65BA23025AE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DA12BEC2A;
	Mon,  1 Jun 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="FIl21UGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722841C5F13;
	Mon,  1 Jun 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330644; cv=none; b=CyWv3R/ZbKxyvuB3UKQ18I+/hUyNTZLMxELJyoOoWkz1BRCjn9ta5ZnSz4SjckpkWXLUhcF+VyUNJnV8SdDVNaG4aJkMYqF5g7P0nhZ42tH8toEjEpcurF2P6/3zAH6FD7i+D6FdoYHG/k0O6seL0vJr/9gIPIj+vG/xmfSCcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330644; c=relaxed/simple;
	bh=NSzC+d+Gk5M3zAgd+2iZ/yeQu1Zow8kH+y7tVEpcYss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTul07f51RLPd/Sl2tGrCJmJb4xUo80fYGEPbtWih0daZ+Nisz5mj6FaiT23I7gbdPM3/9YBShSMiN56aWbtgmgQfSeIkoAq/66WbaSWGXfawJAE+DsYFW1XtKlLRSeFIcltIlGTR68cZDGVLhMpRPqvxRDiY6OufyMd3s3G2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=FIl21UGp; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4gTfHk6kcqzlfwHM;
	Mon,  1 Jun 2026 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1780330637; x=1782922638; bh=KeN81iQOg2Jxt1cTm4IGQs94
	3u0dqOw9zIJLn4Qwcqs=; b=FIl21UGpJLMhYiSXpJGm32+hcRVKUpYpAp/K14Ir
	fc5dTeKrvJW4nYhcj7ANL11CVgSWxKfztnRzTs0m8wt8MVi/d3IMUBqv3SWKvXhM
	lgw3JDdlFf+QM2h3lQ4FuZgridbyfvWRLtpbaS0kwtl930t4JKqZOqXZcdL677Mc
	XzSItd+5eGu7b9tOn8k8f+AmR58pz8mzSxZZNqN1qLKClveMK+CIU04ZldzFU1/Y
	f3ZW9iIOGPtCRh5q+ZGeKYt3e9Bef0dVaTY0aZAOh1v9fJBQ+LV/afklrUhnEAJs
	bYF70imhyiDGdR87EHaOdQDTdy8Ohzx5bUg+cmLXvhVWgA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AmBXbNPMOXUP; Mon,  1 Jun 2026 16:17:17 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gTfHb40Wnzlfl8L;
	Mon,  1 Jun 2026 16:17:15 +0000 (UTC)
Message-ID: <81e31b3a-a14a-413e-b6a7-0dae99b16bd2@acm.org>
Date: Mon, 1 Jun 2026 09:17:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] scsi: ufs: ufs-qcom: Enable SKIP DEVICE RESET
 Quirk
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, alim.akhtar@samsung.com,
 avri.altman@wdc.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
 <20260531235011.1052706-3-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260531235011.1052706-3-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[acm.org:+];
	TAGGED_FROM(0.00)[bounces-110642-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,acm.org:mid,acm.org:dkim]
X-Rspamd-Queue-Id: 6E068622827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/31/26 4:50 PM, Nitin Rawat wrote:
> -
> -	/* reset the connected UFS device during power down */
> -	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
> +	/*
> +	 * For some UFS vendors, skip asserting device reset here.
> +	 * These vendor parts keep drawing larger current after reset
> +	 * is asserted until it is deasserted, and the 10ms delay is
> +	 * not sufficient to prevent OCP (Over Current Protection)
> +	 * on the regulator. This is for the powerdown case, so
> +	 * the device reset can be asserted later as part of the
> +	 * platform shutdown sequence.
> +	 */
> +	if (ufs_qcom_is_link_off(hba) && host->device_reset &&
> +	    !(hba->quirks & UFSHCD_QUIRK_SKIP_DEVICE_RESET)) {
>   		ufs_qcom_device_reset_ctrl(hba, true);
>   		/*
>   		 * After sending the SSU command, asserting the rst_n
> @@ -1288,6 +1296,19 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
>   static void ufs_qcom_fixup_dev_quirks(struct ufs_hba *hba)
>   {
>   	ufshcd_fixup_dev_quirks(hba, ufs_qcom_dev_fixups);
> +
> +	/*
> +	 * Some UFS parts keep drawing larger current after reset is asserted
> +	 * until it is deasserted. The 10ms delay added after asserting HWRST
> +	 * (as done for other vendors) is not sufficient for these parts.
> +	 *
> +	 * Skip asserting device reset during UFS power down for these parts
> +	 * to prevent OCP (Over Current Protection) fault on the regulator.
> +	 * This is handled only in shutdown; the device reset will be asserted
> +	 * as part of the platform shutdown sequence.
> +	 */
> +	if (hba->dev_info.wmanufacturerid == UFS_VENDOR_MICRON)
> +		hba->quirks |= UFSHCD_QUIRK_SKIP_DEVICE_RESET;
>   }

Why has this fix been implemented in the ufs-qcom.c source file? Isn't
this an issue that affects all host controllers?

Thanks,

Bart.

