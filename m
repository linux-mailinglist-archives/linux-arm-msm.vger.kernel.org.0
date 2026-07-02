Return-Path: <linux-arm-msm+bounces-116046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Q4uG9hzRmqKVQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:21:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189F6F8D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:21:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aDmlilRd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 186BB304B7F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2882947DF9E;
	Thu,  2 Jul 2026 14:21:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2E44BC91;
	Thu,  2 Jul 2026 14:21:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002068; cv=none; b=bNGaQG0ehu/KTcKyC7H3YDDa2dkVzpwKRSUcx6psbxxXM994MrM3OmGD9efmS6ev+2sfEBdAB7aFmgMqfgkSbV2/KVHEPjO0FZrTVLOE/2ZT16NXx0coGqhujqsviNFiEuo9UnyC1uBVNYKYDy+nQhl35r2rUVl2mSpkelQCN1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002068; c=relaxed/simple;
	bh=ZSvNhTvUjy47N2InS3xAFiokaoCBQ/g+EMZgoRUuUSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ca8y/wH2P3n7ZM+ES+4gNlMNS47BLz95gvAj8sMdPtuJHSQmwgDH+RbqG2dMItpAwsrMs0nWvrWQZX4j7fvkHLvpCDlskbyhTh9CAbkyMCwkbad6LIQhUw3CSYsELE931GuLHxGHE1sAIidTUEedEOnjUjC1Hu/7BzNH+rXrPeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDmlilRd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A085C1F000E9;
	Thu,  2 Jul 2026 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783002066;
	bh=df6LfzLONmMQAUaiwMvWWDldSQQnzM7+5gHi3uIJi8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDmlilRdBvtkl8PWXVLFRuYsbzS1UOvQEQ/wM9u0F6kvxd7/RyqEZcr/ZVRgrL6ij
	 6LNMN1ATeHuDRnCMgrJJ0eFL7unwRL8znS44Guv1bMOIbVCrdXxn2Ctldygu7Js71c
	 AacDjq8BvHG0tE697b/ylATk5lWgeKJh921JW3msfcRff47iGa1Qu+lxnGkMTULXds
	 ZQgYPOn+9I774wiiodLg+bLKmjubjXKIOXNRf18Te146BkVkCgCtwuCeUYBVadRZAK
	 RbdWwPukOUjTTZcSNisG+z4Vb0J5IBjOHmi0ONPDPiyf/t99xsInyEv88Yc2gPwxB6
	 mX+xbLcX9p5bw==
Date: Thu, 2 Jul 2026 16:20:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <asftjtxfgabkq4og7yl2ukffywbhi6n6gyrsy3ukrymbkbil4a@iyjit6xojjvl>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116046-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iyjit6xojjvl:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1189F6F8D1E

On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> sequencer rather than a dedicated BT enable GPIO.
> 
> When the serdev controller has an OF graph (indicating it is connected
> to an M.2 connector), acquire the 'uart' pwrseq target from the
> connector's power sequencer and use it to control BT power instead of
> the bt-enable GPIO.
> 
> Also allocate bt_power unconditionally for all SOC types since the
> pwrseq path is independent of the SOC type switch.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e87ae76fa00eda308e81dea25 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power->pwrseq)
> +			pwrseq_power_on(qcadev->bt_power->pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
>  		break;
>  	}
>  
> -	if (power && power->pwrseq) {
> +	if (power->pwrseq) {
>  		pwrseq_power_off(power->pwrseq);
>  		set_bit(QCA_BT_OFF, &qca->flags);
>  		return;
> @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
>  	return 0;
>  }
>  
> +/*
> + * Acquire the M.2 connector power sequencer.
> + *
> + * An OF graph link on the serdev controller is only present when the BT
> + * device is attached through an M.2 Key E connector. In that case the UART
> + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
> + * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
> + *
> + * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
> + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
> + */
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +	struct device *dev;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
> +
> +	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> +	if (IS_ERR(qcadev->bt_power->pwrseq))
> +		return PTR_ERR(qcadev->bt_power->pwrseq);
> +
> +	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> +	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
> +
> +	return 0;
> +}
> +
>  static int qca_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct qca_serdev *qcadev;
> @@ -2417,25 +2449,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	else
>  		qcadev->btsoc_type = QCA_ROME;
>  
> -	switch (qcadev->btsoc_type) {
> -	case QCA_QCA6390:
> -	case QCA_WCN3950:
> -	case QCA_WCN3988:
> -	case QCA_WCN3990:
> -	case QCA_WCN3991:
> -	case QCA_WCN3998:
> -	case QCA_WCN6750:
> -	case QCA_WCN6855:
> -	case QCA_WCN7850:
> -		qcadev->bt_power = devm_kzalloc(&serdev->dev,
> -						sizeof(struct qca_power),
> -						GFP_KERNEL);
> -		if (!qcadev->bt_power)
> -			return -ENOMEM;
> -		break;
> -	default:
> -		break;
> -	}
> +	qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
> +	if (!qcadev->bt_power)
> +		return -ENOMEM;
> +
> +	err = qca_serdev_get_m2_pwrseq(qcadev, &bt_en_available);
> +	if (err)
> +		return err;
>  
>  	switch (qcadev->btsoc_type) {
>  	case QCA_WCN3950:
> @@ -2446,24 +2466,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> -		/*
> -		 * OF graph link is only present for BT devices attached through
> -		 * the M.2 Key E connector.
> -		 */
> -		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
> -			struct device *dev;
> -
> -			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
> -								   "uart");
> -			if (IS_ERR(qcadev->bt_power->pwrseq))
> -				return PTR_ERR(qcadev->bt_power->pwrseq);
> -
> -			dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> -			if (!device_property_present(dev, "w-disable2-gpios"))
> -				bt_en_available = false;
> -
> +		/* M.2 connector modules are powered by the pwrseq acquired above. */
> +		if (qcadev->bt_power->pwrseq)
>  			break;
> -		}
>  
>  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
>  			/*
> @@ -2545,7 +2550,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			return PTR_ERR(qcadev->bt_en);
>  		}
>  
> -		if (!qcadev->bt_en)
> +		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
>  			bt_en_available = false;
>  
>  		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

