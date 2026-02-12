Return-Path: <linux-arm-msm+bounces-92708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MdJ6KoTjjWmb8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:28:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E355B12E3E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F94D304C044
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ECA1C2324;
	Thu, 12 Feb 2026 14:28:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28492F4F1;
	Thu, 12 Feb 2026 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906497; cv=none; b=U+xcRiimEtoKVAi2ZKo1DW5OFslH2RyyBR1KeD2n3o+y1+blnkE/ayqHfJWXORR/ibG2rda6sFKAX9BFs24hrPbDTva87Ijic01wAOGAuwIm1Hu6Oo4aommLwd6plxgjVwgIJTMYJpxDxjP/Hydxv30LUqkQfGAf7D1GE11JGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906497; c=relaxed/simple;
	bh=DBzb1VKpeRr7cqPOZvVVYrVads/CoOTYrQJR1icj7iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUfwJOTQQ426pHFgJioLb9J6cR9/eXP0IxOMl5qMOOwBZJ9msmu7KZNrIBWXfSeN2e8mTojHjZNuLBIGTcCNLIvdm99I7KgwweoFxF4YDYePGdNf8K9+VeIUkseFQPklo8SKVmVIEgjs/pqZaykot8XDHfvwBGhIHJ9aXZkfzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B437C4C4430E00;
	Thu, 12 Feb 2026 15:27:31 +0100 (CET)
Message-ID: <c4a9a3ee-0fa3-449a-bb5d-ac1e3b8eba2c@molgen.mpg.de>
Date: Thu, 12 Feb 2026 15:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Fix confusing shutdown() and
 power_off() naming
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[mpg.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E355B12E3E3
X-Rspamd-Action: no action

Dear Hans,


Thank you for the patch.

Am 12.02.26 um 15:17 schrieb Hans de Goede:
> The function called qca_power_off() is actually the hci_dev shutdown
> handler, rename it to qca_hci_shutdown() to make this clear.
> 
> While the qca_power_shutdown() function is actually the counter-part
> of qca_power_on() rename it to qca_power_off() to make this clear.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/bluetooth/hci_qca.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4d562596ebf9..fa7ab4272771 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -235,8 +235,7 @@ struct qca_serdev {
>   
>   static int qca_regulator_enable(struct qca_serdev *qcadev);
>   static void qca_regulator_disable(struct qca_serdev *qcadev);
> -static void qca_power_shutdown(struct hci_uart *hu);
> -static int qca_power_off(struct hci_dev *hdev);
> +static void qca_power_off(struct hci_uart *hu);
>   static void qca_controller_memdump(struct work_struct *work);
>   static void qca_dmp_hdr(struct hci_dev *hdev, struct sk_buff *skb);
>   
> @@ -2015,7 +2014,7 @@ static int qca_setup(struct hci_uart *hu)
>   out:
>   	if (ret && retries < MAX_INIT_RETRIES) {
>   		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
> -		qca_power_shutdown(hu);
> +		qca_power_off(hu);
>   		if (hu->serdev) {
>   			serdev_device_close(hu->serdev);
>   			ret = serdev_device_open(hu->serdev);
> @@ -2171,7 +2170,7 @@ static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
>   	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
>   };
>   
> -static void qca_power_shutdown(struct hci_uart *hu)
> +static void qca_power_off(struct hci_uart *hu)
>   {
>   	struct qca_serdev *qcadev;
>   	struct qca_data *qca = hu->priv;
> @@ -2232,7 +2231,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>   	set_bit(QCA_BT_OFF, &qca->flags);
>   }
>   
> -static int qca_power_off(struct hci_dev *hdev)
> +static int qca_hci_shutdown(struct hci_dev *hdev)
>   {
>   	struct hci_uart *hu = hci_get_drvdata(hdev);
>   	struct qca_data *qca = hu->priv;
> @@ -2251,7 +2250,7 @@ static int qca_power_off(struct hci_dev *hdev)
>   		usleep_range(8000, 10000);
>   	}
>   
> -	qca_power_shutdown(hu);
> +	qca_power_off(hu);
>   	return 0;
>   }
>   
> @@ -2498,7 +2497,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   
>   	if (power_ctrl_enabled) {
>   		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
> -		hdev->shutdown = qca_power_off;
> +		hdev->shutdown = qca_hci_shutdown;
>   	}
>   
>   	if (data) {
> @@ -2530,7 +2529,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
>   		if (power->vregs_on)
> -			qca_power_shutdown(&qcadev->serdev_hu);
> +			qca_power_off(&qcadev->serdev_hu);
>   		break;
>   	default:
>   		break;

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

