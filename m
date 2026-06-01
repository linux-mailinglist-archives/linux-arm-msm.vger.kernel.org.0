Return-Path: <linux-arm-msm+bounces-110525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +InBNG5CHWosXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:27:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5861B74E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AF34301186B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E864B38AC9E;
	Mon,  1 Jun 2026 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBLo5To1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A65388378
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302434; cv=none; b=qWH4+4fFbCiuBXo7cUB3hp4y2hMW5CNMMhvyNRKmTa9TkohCXq/+zrwNP/fO54L44VsJPU18MdlrSz1URhowg3cUOqgSB9HsPv+5b13/7OizAjjd+zE9NdNOYct7jOG9BJXV40NsGe2kWuN+QUfNHrinJ9vTGET194pYpYWi5+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302434; c=relaxed/simple;
	bh=0q68r0E1KnB0zssg5dYWCHBRDm4MpMSPDhu1xD7sDbY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSVwzf+EE1pObrKVZHspkCsfb16ANCJNr3sk3r48RQkQ7YTXgfdpbO4IbaRG4mJI4ibn9whYYFHgSBP12GMbO/WE8znlVWBkeuHLWnrWdP0A8mqzG7GSIfch8tL56MiXOL4KNdD8WYytEwr9pGXWpgXGcBKhmmmq0gn583C0Doo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBLo5To1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9864B1F008A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780302432;
	bh=RneoQhYi8BLHUPpYWF1pftFkHsz0xH/XhjXjOgaqIag=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nBLo5To1bl2scb02Xe2fZ67sBMliI7ZMv5OzeCA1mKiYHpouU3I6nQjJskNFVptDy
	 vJHAbbrMhs4ozDnFSYg7qTZLXJYPnMc4N+yFDOGcljlGRekF5xFW342SzBK5ldfvZg
	 gNnY2vFTbx92dCTaaYaa6AxsovgrvSbPJaIZP3ljCCiAuyIMWSAN9uNCp73tfmQ/Tb
	 yHPt+m4QsQxuwJlB/ACOx0TAx21VKzqCpowvAzzj2bJNezB8VVe2WrtYNrqnDMId7A
	 mVYG2jAnuchiRytjomYYIw2o8PwjuX1qQi8JnSABL2o9nV/zXID+varfhrljSR84yI
	 v6lIzpAC66AqA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so1655080e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:27:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89hx6ctldrcaYz/KL/lTK0Ad4RGW+iUnpexUdi0grjw89Xh8upAHVbXhamWIMHITGyJwImA1f+YdD0Nbyi@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFqDPsjf2hjA9fvOr/fxOOPqjueOAFXzjDBjqJi9IUNMbWgu9
	HPASz+U6JV6ymMZZmfZqVEaMbiTSb1nAT0qeY2v4EwiVsbtvv8+5RC5HCzmAoGasrACMpd1ORzX
	YdfS90gxqKgXSs3KZ51G0dQyLSQK0KtQKEV8OJkK7QQ==
X-Received: by 2002:a05:6512:1242:b0:5a7:468f:1b82 with SMTP id
 2adb3069b0e04-5aa6079a242mr2462531e87.1.1780302431177; Mon, 01 Jun 2026
 01:27:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 04:27:09 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 04:27:09 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 04:27:09 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeUhtNiMQLeMwvF_v+WOaiVgF+jsTM1HPZd_XdkGk3txA@mail.gmail.com>
X-Gm-Features: AVHnY4I9OgymOnzml0k-x7RwOZRW_uImqqUAiSeLfavcH1HVUx-gcyCfdkjXmLA
Message-ID: <CAMRc=MeUhtNiMQLeMwvF_v+WOaiVgF+jsTM1HPZd_XdkGk3txA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: qca: add QCC2072 support
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com, 
	dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110525-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76C5861B74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 19:58:22 +0200, Yepuri Siddu
<yepuri.siddu@oss.qualcomm.com> said:
> QCC2072 is a BT/WiFi combo SoC that uses different firmware
> filenames and requires no external voltage regulators, so add
> it as a new SoC type.
>
> The chip supports the wideband speech and valid LE states
> capabilities. Its firmware is named using the "orn" prefix and
> follows the standard rom-version-based scheme:
>     - qca/ornbtfw<ver>.tlv
>     - qca/ornnv<ver>.bin
>
> These firmware files are already present in the linux-firmware
> repository.
>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   |  9 +++++++++
>  drivers/bluetooth/btqca.h   |  1 +
>  drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dda76365726f..0ef7546e7c7a 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -843,6 +843,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/hmtbtfw%02x.tlv", rom_ver);
>  			break;
> +		case QCA_QCC2072:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornbtfw%02x.tlv", rom_ver);
> +			break;
>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/rampatch_%08x.bin", soc_ver);
> @@ -937,6 +941,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>  				 "hmtnv", soc_type, ver, rom_ver, boardid);
>  			break;
> +		case QCA_QCC2072:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornnv%02x.bin", rom_ver);
> +			break;
>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/nvm_%08x.bin", soc_ver);
> @@ -999,6 +1007,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCC2072:
>  		/* get fw build info */
>  		err = qca_read_fw_build_info(hdev);
>  		if (err < 0)
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 8f3c1b1c77b3..a175ac31e7b2 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -158,6 +158,7 @@ enum qca_btsoc_type {
>  	QCA_WCN6750,
>  	QCA_WCN6855,
>  	QCA_WCN7850,
> +	QCA_QCC2072,
>  };
>
>  #if IS_ENABLED(CONFIG_BT_QCA)
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index ed280399bf47..fc67ba0e4984 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1372,6 +1372,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
>
>  	/* Give the controller time to process the request */
>  	switch (qca_soc_type(hu)) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -1459,6 +1460,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
>  static int qca_check_speeds(struct hci_uart *hu)
>  {
>  	switch (qca_soc_type(hu)) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -1510,6 +1512,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		case QCA_WCN6750:
>  		case QCA_WCN6855:
>  		case QCA_WCN7850:
> +		case QCA_QCC2072:
>  			hci_uart_set_flow_control(hu, true);
>  			break;
>
> @@ -1545,6 +1548,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		case QCA_WCN6750:
>  		case QCA_WCN6855:
>  		case QCA_WCN7850:
> +		case QCA_QCC2072:
>  			hci_uart_set_flow_control(hu, false);
>  			break;
>
> @@ -1861,6 +1865,7 @@ static int qca_power_on(struct hci_dev *hdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCC2072:
>  		ret = qca_regulator_init(hu);
>  		break;
>
> @@ -1957,6 +1962,10 @@ static int qca_setup(struct hci_uart *hu)
>  		soc_name = "wcn7850";
>  		break;
>
> +	case QCA_QCC2072:
> +		soc_name = "qcc2072";
> +		break;
> +
>  	default:
>  		soc_name = "ROME/QCA6390";
>  	}
> @@ -1980,6 +1989,7 @@ static int qca_setup(struct hci_uart *hu)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCC2072:
>  		if (qcadev->bdaddr_property_broken)
>  			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
>
> @@ -2013,6 +2023,7 @@ static int qca_setup(struct hci_uart *hu)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCC2072:
>  		break;
>
>  	default:
> @@ -2166,6 +2177,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
>  	.num_vregs = 4,
>  };
>
> +static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
> +	.soc_type = QCA_QCC2072,
> +	.num_vregs = 0,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> +};
> +
>  static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
>  	.soc_type = QCA_WCN6750,
>  	.vregs = (struct qca_vreg []) {
> @@ -2268,6 +2285,7 @@ static void qca_power_off(struct hci_uart *hu)
>
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
> +	case QCA_QCC2072:
>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>  		msleep(100);
>  		qca_regulator_disable(qcadev);
> @@ -2414,6 +2432,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		qcadev->btsoc_type = QCA_ROME;
>
>  	switch (qcadev->btsoc_type) {
> +	case QCA_QCC2072:
>  	case QCA_QCA6390:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
> @@ -2434,6 +2453,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	}
>
>  	switch (qcadev->btsoc_type) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -2484,6 +2504,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		if (!qcadev->bt_en &&
>  		    (data->soc_type == QCA_WCN6750 ||
>  		     data->soc_type == QCA_WCN6855 ||
> +		     data->soc_type == QCA_QCC2072 ||

Looking at the bindings: this chip cannot have an enable GPIO, so it probably
should have its own if branch that unconditionally sets power_ctrl_enabled to
false?

>  		     data->soc_type == QCA_WCN7850))
>  			power_ctrl_enabled = false;
>
> @@ -2492,6 +2513,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		if (IS_ERR(qcadev->sw_ctrl) &&
>  		    (data->soc_type == QCA_WCN6750 ||
>  		     data->soc_type == QCA_WCN6855 ||
> +		     data->soc_type == QCA_QCC2072 ||

Same here.

Bart

>  		     data->soc_type == QCA_WCN7850)) {
>  			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
>  			return PTR_ERR(qcadev->sw_ctrl);
> @@ -2570,6 +2592,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  	struct qca_power *power = qcadev->bt_power;
>
>  	switch (qcadev->btsoc_type) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -2779,6 +2802,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>  	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
>  	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
>  	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
> +	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
> --
> 2.34.1
>
>

