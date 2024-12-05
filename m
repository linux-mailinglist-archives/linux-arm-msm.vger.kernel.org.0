Return-Path: <linux-arm-msm+bounces-40500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C249E54CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1D516AC06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA34217717;
	Thu,  5 Dec 2024 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FCyE4sJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749A6217660
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400047; cv=none; b=bwuHSnJ7CB/hAY2KAZM6xvVok3gOGCHAyeSM/Zt2qf9z4OS0x5PSk6a9XbmDTITxtoubaGQpLCyJwQfWDPNSYZ4euOBvWZ0dy5JFdDgGrsx4Ll50zysu7ZNDOW3KDC0WnN4RpjIEMaXJKF+nbuHtySQ2bvgFrzynAnyo1O8/FQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400047; c=relaxed/simple;
	bh=jy5l1IRkBdan3YFDFpWKY5RXf6f8n9rw8iF2OYMlFTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOwPDPtKU5I9MXkgzUA2IKrx3c4r3iDGbpVHEkxLia+axOefitMLnBu68go9KdGSs4p6jkE5Gs8o+ImXjzvljYx8vO47Ezba0/5FTjsScfOLz7YAugVqsg7g/MGSwoB0i9idSDPvclSimWqkwRvcGsQE8vY2Y+ZElEufozhnVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FCyE4sJF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53de84e4005so1033311e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733400042; x=1734004842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6suNLAdL6iq6mhldu8rnJx9YHc+2BLsoEolOU1ixOc=;
        b=FCyE4sJFf8K6ELnDdfNHX4X2HiBv1huFKjcAE+6mmYfGAYonLqddj3/l5C242PGNP0
         Vyj+pOFUjW5LJlCgdF06M7gzG4ONiUw9HSTHoTNLBaJ+IdKtaCsixbOZVxDDpK0jtNvv
         VGRcypgRyoAhfqYJfZuviMKvijq8x97cAJ8DsxBGwL2PWb7XJWj6d9rxQQUgYWI0p0Zt
         1Lw6gRbaKZEQyMdRIeCwl+wozA0AL+Fyg/DR/dOt2W2+YsGhnUV0oBeY3hKqCfl6GcVx
         5Pa9qu1AkwhhuRlo96YdChVCsx52q+igeDqm8/LK8o0pozvDp0GSyWWjgFZGz6xv/+0g
         KCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400042; x=1734004842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6suNLAdL6iq6mhldu8rnJx9YHc+2BLsoEolOU1ixOc=;
        b=tl41PHvvpCSU3il0Zm3hnrl9iFpymM1BNSiSTNK23GWHiNU7ZwxPjarZU+YZQU8lxe
         XEIJJUdC1sp7onlrG+n+srx6i9cYwfgBm5YdrlEOfmCVnfLBCC7U+ONen7PwO+LHj1Nu
         uD1EHLrT9nZhmctt1UoyluheX3cJH8fwgJ2t46syfjTGYCi/QiMbGn5WcuoVJ2slvSOe
         uUapSjdKr2aLXYCOOkZVng/e71APEfms6qOQhN/dsvb+USS0g3YuyNYQfUUqGgisMDl/
         I85TuQ3RdFGjrDcDSPh1IbqoRm5sTrZKjjtw9r2T1AygzVMEPuNSin63YnKbEJ555M4J
         7IoA==
X-Forwarded-Encrypted: i=1; AJvYcCVPfOmzpPhIdW8KPJv/kgbNI3fC3/2blMGb6txH8niyzXq8WC9o3f5jAkBwQrRJ7VWvtHwmC4fhtmQqaFwL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iBST1WzqfRPJIfG+kSkaP575LAv8IsTvPpKtZvFZgtNr2LAw
	Fm9CRSzEs7pAu22MfEe3znNrhqR4Vzio2yZR7edth0L8Il8s3zpC4vizDSZ9mg0=
X-Gm-Gg: ASbGnctUeLQGHgbnSOOLHxSl6OEcoxysECtJZkODA1L4/xA8uvwvMx1pNYzHzsMOQhw
	5rohIBoaDTWHt1WTerQ0XkWOp1e9bsp0xSj58WwAp1I3yW9xdrQ8Ivf5HQAWmGBjwaF0wA2jlgo
	BPNlbvPQqmgCx+KpNaNX/Z6/KUZlxcjTNbHdsVaWGhJ289Vd08D+JJgiFbSaA/PguzLvxfSn20u
	8zIPeGhuCGG8h1YHXCeyPMG294Bc+Lh+v/vUM21tB8sxx1XLkBlA5XXMH94HuPncyQxJ0keS8qn
	l5gPGuvPDXWtqpjgGUD/IpVpMInU7w==
X-Google-Smtp-Source: AGHT+IH/jMWnHzHDtVHudJFI//O37YyqyI3jX/kVCBVp/uMI+flmxz6qJJl5fiLYeUGJIvg9QO2hAQ==
X-Received: by 2002:a05:6512:1324:b0:53e:21c7:dcd0 with SMTP id 2adb3069b0e04-53e21c7dd44mr1221662e87.17.1733400042445;
        Thu, 05 Dec 2024 04:00:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba710sm219360e87.140.2024.12.05.04.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:00:41 -0800 (PST)
Date: Thu, 5 Dec 2024 14:00:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load
 specific nvm and rampatch
Message-ID: <w7r4itwyrh3jva3rx3kmsm4kqtawqkgkneqrlin4hpjkqb3deo@2qmjd3ijzqn3>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-3-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205102213.1281865-3-quic_chejiang@quicinc.com>

On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
> The firmware-name property has been expanded to specify the names of NVM
> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
> chip. Although it shares the same IP core as the WCN6855, the QCA6698
> has different RF components and RAM sizes, necessitating new firmware
> files. This change allows for the configuration of NVM and rampatch in
> DT.
> 
> Different connectivity boards may be attached to the same platform. For
> example, QCA6698-based boards can support either a two-antenna or
> three-antenna solution, both of which work on the sa8775p-ride platform.
> Due to differences in connectivity boards and variations in RF
> performance from different foundries, different NVM configurations are
> used based on the board ID.

Two separate commits, one for NVM, another one for RAM patch.

> 
> Therefore, in the firmware-name property, if the NVM file has an
> extension, the NVM file will be used. Otherwise, the system will first
> try the .bNN (board ID) file, and if that fails, it will fall back to
> the .bin file.
> 
> Possible configurations:
> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21.bin";
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
>  drivers/bluetooth/btqca.h   |   5 +-
>  drivers/bluetooth/hci_qca.c |  21 ++++-
>  3 files changed, 134 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dfbbac922..e8b89b8cc 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>  }
>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>  
> +static int qca_get_alt_nvm_path(char *path, size_t max_size)

int is usually for errors, the code suggests bool return type.

> +{
> +	char fwname[64];
> +	const char *suffix;
> +
> +	suffix = strrchr(path, '.');
> +
> +	if (!suffix)
> +		return 0;
> +
> +	strscpy(fwname, path, strlen(path));

64 bytes ought to be enough for anybody, correct?

> +	fwname[suffix - path] = 0;

with path = "qcom/sc7180/Oh.My.Device/name" this is broken.

> +
> +	snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
> +
> +	/* If nvm file is already the default one, return false to
> +	 * skip the retry.
> +	 */
> +	if (strcmp(fwname, path) == 0)
> +		return 0;
> +
> +	snprintf(path, max_size, "%s", fwname);
> +	return 1;
> +}
> +
>  static int qca_tlv_check_data(struct hci_dev *hdev,
>  			       struct qca_fw_config *config,
>  			       u8 *fw_data, size_t fw_size,
> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
>  					   config->fwname, ret);
>  				return ret;
>  			}
> +		}
> +		/* For nvm, if desired nvm file is not present and it's not the
> +		 * default nvm file(ends with .bin), try to load the default nvm.
> +		 */
> +		else if (config->type == TLV_TYPE_NVM &&
> +			 qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {

Please, don't rewrite the config. The file may be not present now, but
it will reappear later (e.g. when rootfs gets mounted).

> +			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
> +			ret = request_firmware(&fw, config->fwname, &hdev->dev);
> +			if (ret) {
> +				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +					   config->fwname, ret);
> +				return ret;
> +			}
>  		} else {
>  			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>  				   config->fwname, ret);
> @@ -730,15 +768,38 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>  			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>  }
>  
> +static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
> +		const char *firmware_name, struct qca_btsoc_version ver,
> +		enum qca_btsoc_type soc_type, u16 bid)
> +{
> +	const char *variant;
> +
> +	/* Set the variant to empty by default */
> +	variant = "";
> +	/* hsp gf chip */
> +	if (soc_type == QCA_WCN6855) {
> +		if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
> +			variant = "g";

Didn't you get the 'set but unused' here?

> +	}
> +
> +	if (bid == 0x0)

0x0 or 0xff?

> +		snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
> +	else if (bid & 0xff00)
> +		snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);

Doesn't ".b%02x" work in this case too?

> +	else
> +		snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
> +}
> +
>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> -		   const char *firmware_name)
> +		   const char *firmware_name, const char *rampatch_name)
>  {
>  	struct qca_fw_config config = {};
>  	int err;
>  	u8 rom_ver = 0;
>  	u32 soc_ver;
>  	u16 boardid = 0;
> +	const char *suffix;
>  
>  	bt_dev_dbg(hdev, "QCA setup on UART");
>  
> @@ -761,44 +822,48 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  
>  	/* Download rampatch file */
>  	config.type = TLV_TYPE_PATCH;
> -	switch (soc_type) {
> -	case QCA_WCN3990:
> -	case QCA_WCN3991:
> -	case QCA_WCN3998:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/crbtfw%02x.tlv", rom_ver);
> -		break;
> -	case QCA_WCN3988:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/apbtfw%02x.tlv", rom_ver);
> -		break;
> -	case QCA_QCA2066:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> -		break;
> -	case QCA_QCA6390:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/htbtfw%02x.tlv", rom_ver);
> -		break;
> -	case QCA_WCN6750:
> -		/* Choose mbn file by default.If mbn file is not found
> -		 * then choose tlv file
> -		 */
> -		config.type = ELF_TYPE_PATCH;
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/msbtfw%02x.mbn", rom_ver);
> -		break;
> -	case QCA_WCN6855:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> -		break;
> -	case QCA_WCN7850:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hmtbtfw%02x.tlv", rom_ver);
> -		break;
> -	default:
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/rampatch_%08x.bin", soc_ver);
> +	if (rampatch_name) {
> +		snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
> +	} else {
> +		switch (soc_type) {
> +		case QCA_WCN3990:
> +		case QCA_WCN3991:
> +		case QCA_WCN3998:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/crbtfw%02x.tlv", rom_ver);
> +			break;
> +		case QCA_WCN3988:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/apbtfw%02x.tlv", rom_ver);
> +			break;
> +		case QCA_QCA2066:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/hpbtfw%02x.tlv", rom_ver);
> +			break;
> +		case QCA_QCA6390:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/htbtfw%02x.tlv", rom_ver);
> +			break;
> +		case QCA_WCN6750:
> +			/* Choose mbn file by default.If mbn file is not found
> +			 * then choose tlv file
> +			 */
> +			config.type = ELF_TYPE_PATCH;
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/msbtfw%02x.mbn", rom_ver);
> +			break;
> +		case QCA_WCN6855:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/hpbtfw%02x.tlv", rom_ver);
> +			break;
> +		case QCA_WCN7850:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/hmtbtfw%02x.tlv", rom_ver);
> +			break;
> +		default:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/rampatch_%08x.bin", soc_ver);
> +		}
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> @@ -816,8 +881,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	/* Download NVM configuration */
>  	config.type = TLV_TYPE_NVM;
>  	if (firmware_name) {
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/%s", firmware_name);
> +		/* The firmware name has suffix, use it directly */
> +		suffix = strrchr(firmware_name, '.');
> +		if (suffix && *(suffix + 1) != '\0' && *(suffix + 1) != '.') {
> +			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
> +		} else {
> +			qca_read_fw_board_id(hdev, &boardid);
> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +				 firmware_name, ver, soc_type, boardid);
> +		}
>  	} else {
>  		switch (soc_type) {
>  		case QCA_WCN3990:
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index bb5207d7a..9d28c8800 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -161,7 +161,7 @@ enum qca_btsoc_type {
>  int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> -		   const char *firmware_name);
> +		   const char *firmware_name, const char *rampatch_name);
>  int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
>  			 enum qca_btsoc_type);
>  int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> @@ -176,7 +176,8 @@ static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdad
>  static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  				 enum qca_btsoc_type soc_type,
>  				 struct qca_btsoc_version ver,
> -				 const char *firmware_name)
> +				 const char *firmware_name,
> +				 const char *rampatch_name)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 37129e6cb..c566d0bf2 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -229,6 +229,7 @@ struct qca_serdev {
>  	u32 oper_speed;
>  	bool bdaddr_property_broken;
>  	const char *firmware_name;
> +	const char *rampatch_name;
>  };
>  
>  static int qca_regulator_enable(struct qca_serdev *qcadev);
> @@ -264,6 +265,17 @@ static const char *qca_get_firmware_name(struct hci_uart *hu)
>  	}
>  }
>  
> +static const char *qca_get_rampatch_name(struct hci_uart *hu)
> +{
> +	if (hu->serdev) {
> +		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
> +
> +		return qsd->rampatch_name;
> +	} else {
> +		return NULL;
> +	}
> +}
> +
>  static void __serial_clock_on(struct tty_struct *tty)
>  {
>  	/* TODO: Some chipset requires to enable UART clock on client
> @@ -1855,6 +1867,7 @@ static int qca_setup(struct hci_uart *hu)
>  	unsigned int retries = 0;
>  	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>  	const char *firmware_name = qca_get_firmware_name(hu);
> +	const char *rampatch_name = qca_get_rampatch_name(hu);
>  	int ret;
>  	struct qca_btsoc_version ver;
>  	struct qca_serdev *qcadev;
> @@ -1963,7 +1976,7 @@ static int qca_setup(struct hci_uart *hu)
>  
>  	/* Setup patch / NVM configurations */
>  	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
> -			firmware_name);
> +			firmware_name, rampatch_name);
>  	if (!ret) {
>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>  		qca_debugfs_init(hdev);
> @@ -2309,8 +2322,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	qcadev->serdev_hu.serdev = serdev;
>  	data = device_get_match_data(&serdev->dev);
>  	serdev_device_set_drvdata(serdev, qcadev);
> -	device_property_read_string(&serdev->dev, "firmware-name",
> -					 &qcadev->firmware_name);
> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
> +					 0, &qcadev->firmware_name);
> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
> +					 1, &qcadev->rampatch_name);
>  	device_property_read_u32(&serdev->dev, "max-speed",
>  				 &qcadev->oper_speed);
>  	if (!qcadev->oper_speed)
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

