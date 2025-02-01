Return-Path: <linux-arm-msm+bounces-46633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F830A2485C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 11:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FE51887A4E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 10:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A731553B7;
	Sat,  1 Feb 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhqJfzpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004CC1369AA
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407085; cv=none; b=lmEcQeUMRtm8NnlUHm1w9Oea9cnie5uJH5MaxscA1Lj6+I4DxTPh1RQj1ebdTxwQeQr+uZvJ1wqo3xLMPW2RlFW4KMTx/aHd6OrvRpK8kXp9Rlz+7xGroF2nwds52O8SfZ+guMB5pwRlq8yFhsXrPQN00aWMzgnCaK23NS8Tl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407085; c=relaxed/simple;
	bh=migs4nuGhw2xK6z+2KDjzRYlQ7PWaRtOe4pSEl9UuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMxWUtB0Hmac3xtlqwWc8eqwsRVq9HiDf2uTVt9vfFNq+aN2T3hsAQK9v7aYmyYMnfOohd1R9j+OLVQ9XNjMtnyoA8WJjbLpHIPnmpDrKkiRDiM0q5oCkIJOTnl4y2aiy1V641mlk1z1AuPPpGE0W/5dIEpSpWs8JI6NPfecwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhqJfzpD; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54298ec925bso3227472e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 02:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738407081; x=1739011881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eG7oXAFW4LQ6SvRbOZQ4aHfwSPiaY1Og2nqTKC+EPIU=;
        b=QhqJfzpD+Jd3S6X7ORVcNvEQJ46uH5aWUmjnMVs/X8UZGhEmIDz+oHJNH5mNEZUocd
         xLKaL8aWfm48plBnGKNdzw9UTtVeqxUI5U1fz8yXbts7bh6aqs58ULe0My6uTJNDxndi
         Hgl5vajAqgo9jdItBd5Hlv2gUuCEbtUZkdKwBP/zOwvHXv0CBMr/SgTdeN99FEAKwleH
         O5JJYdK1UK45g9Sw2wE73rMX9z6+kUOZcwiNmDJMqnOstotuGO4/+pPywEfbVI4NFbzV
         tdPXax3DKb+xafM8sRdmgqcuPkRb9tpqWf5qEDRx4U3hpPbOMeTdjPtCTxhLqDxk6dbu
         mftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407081; x=1739011881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG7oXAFW4LQ6SvRbOZQ4aHfwSPiaY1Og2nqTKC+EPIU=;
        b=cuQnMDCw7wq+uI91kVAjnRaae3jlU/Q5RdDkzBU6PT9DZss3WAUWAiEos4yzj24UiD
         JbLC5AcDJvbdio2KxYUVXLjLE6ZSPisO7XX0XFKHpOdjeQI/JP24/VQawfwMErZVxUwt
         yXQBEJQiSYgFYQvo95IAjc3tLhpSt/oZWQM3x3McF9Z6dDg+pUpTy3yb3YC6hJjEO+/g
         DnrKn5X9aFk0yNXco1fgEsbBBFFV6oIEXSO6k4azkV5j/7t0kmLvqpKolDUDSx86wRkC
         jqQ0QDQKfZL0E+va94kp80W5y/lK3ES6bOcBXHjgWOAbxuzHpicCA1omseEvVwY6tt2e
         9+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXiqRO0IBeUSc/oK53CBvjPL9OSz303i2YGCgqYxq3W6EPktYIdkqWbCQy+6p7ubVLUKgezImFe8Jkn8nJH@vger.kernel.org
X-Gm-Message-State: AOJu0YxEScxStEm9Hut1NlWueaaDEgHkzpub0JH5dsvfCY7nC9L3GCm8
	dxBmHPQieodnsPnATAeI8v5pcWxgINM8X+1LrKoRmuKJOCgbAMNxSZrQ0kWS+B4=
X-Gm-Gg: ASbGncstHJ0xu70rkQZ0c4PlyKsHZUrpO/yjNHW/uCYbJJ7K+D+M43BMDmmoRBVl5C0
	rjnPEaUuty/wESP1eAvaU+Qr6oXYHwNgjq30camMpOolpYxcmLvHNYotT7XNKweC4HB7+8U8PfB
	OscVJncHG01ms0Jb1wMDcy6wkbalulDoOb8soEiI1KCa4ntscjgDLXdeTo28Y/T9qOoVimqcOGL
	Ly7zb78ED4Y98Qz4MOxT338fAj2cjQLPlBPM+XZbprYbEqF7FrkZigih6HiM9/zoUHFExcBFK+k
	MYuZDQzr04PnpCZtmkPsJBBl9098CXiK0eFeRealIHYBGgvPyV50WCDNmc7gyClFiwIDPC8=
X-Google-Smtp-Source: AGHT+IHJ9Jsfraup8/voZFuR8bxlr06SQrF4VHVDcUUAfmkcF+odhumDGda7cm47OWiopau+2nD9aw==
X-Received: by 2002:a05:6512:33c9:b0:542:29b6:9c27 with SMTP id 2adb3069b0e04-543e4c3fd62mr4836646e87.51.1738407081004;
        Sat, 01 Feb 2025 02:51:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3069991sm8041131fa.11.2025.02.01.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 02:51:19 -0800 (PST)
Date: Sat, 1 Feb 2025 12:51:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] Bluetooth: qca: add WCN3950 support
Message-ID: <zyteorkanz7maln5srrw4qmv2kuogmuidy4fxiazsnwwatqpkh@wkaeci4euxc6>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-2-ae896c4923d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201-rb1-bt-v1-2-ae896c4923d8@linaro.org>

On Sat, Feb 01, 2025 at 11:18:13AM +0200, Dmitry Baryshkov wrote:
> WCN3950 is another example of the WCN39xx BT/WiFI family of chips. It
> requires different firmware files and has different current
> requirements, so add it as a separate SoC type.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/bluetooth/btqca.c   |  9 +++++++++
>  drivers/bluetooth/btqca.h   |  1 +
>  drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index cdf09d9a9ad27c080f27c5fe8d61d76085e1fd2c..4d259d8447774ac7adfcc44d7cfb5bf41774289c 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -821,6 +821,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/crbtfw%02x.tlv", rom_ver);
>  			break;
> +		case QCA_WCN3950:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/cmbtfw%02x.tlv", rom_ver);
> +			break;
>  		case QCA_WCN3988:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/apbtfw%02x.tlv", rom_ver);
> @@ -891,6 +895,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  					 "qca/crnv%02x.bin", rom_ver);
>  			}
>  			break;
> +		case QCA_WCN3950:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/cmnv%02x.bin", rom_ver);

WCN3950 1.3 might need to use additional NVM variants. I'll send the
updated patchset tomorrow. The RB1 board uses version 1.2 of the chip.

> +			break;
>  		case QCA_WCN3988:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/apnv%02x.bin", rom_ver);
> @@ -948,6 +956,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	 * VsMsftOpCode.
>  	 */
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 9d28c88002257bae31249457b98a5df1df26efe4..10ba8ebfe80fa43827e5c05f9ad643ecb2cea872 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -145,6 +145,7 @@ enum qca_btsoc_type {
>  	QCA_INVALID = -1,
>  	QCA_AR3002,
>  	QCA_ROME,
> +	QCA_WCN3950,
>  	QCA_WCN3988,
>  	QCA_WCN3990,
>  	QCA_WCN3998,
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 0ac2168f1dc4f8ae2f7a3b2912e7f5b5b8115cac..b39889ce0e8ff9d97f72eb8e70cb9c6825984c82 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -623,6 +623,7 @@ static int qca_open(struct hci_uart *hu)
>  		qcadev = serdev_device_get_drvdata(hu->serdev);
>  
>  		switch (qcadev->btsoc_type) {
> +		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
>  		case QCA_WCN3991:
> @@ -1366,6 +1367,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
>  
>  	/* Give the controller time to process the request */
>  	switch (qca_soc_type(hu)) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1452,6 +1454,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
>  static int qca_check_speeds(struct hci_uart *hu)
>  {
>  	switch (qca_soc_type(hu)) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1494,6 +1497,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		 * changing the baudrate of chip and host.
>  		 */
>  		switch (soc_type) {
> +		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
>  		case QCA_WCN3991:
> @@ -1528,6 +1532,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  
>  error:
>  		switch (soc_type) {
> +		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
>  		case QCA_WCN3991:
> @@ -1746,6 +1751,7 @@ static int qca_regulator_init(struct hci_uart *hu)
>  	}
>  
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1776,6 +1782,7 @@ static int qca_regulator_init(struct hci_uart *hu)
>  	qca_set_speed(hu, QCA_INIT_SPEED);
>  
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1807,6 +1814,7 @@ static int qca_power_on(struct hci_dev *hdev)
>  		return 0;
>  
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1891,6 +1899,7 @@ static int qca_setup(struct hci_uart *hu)
>  		soc_name = "qca2066";
>  		break;
>  
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1925,6 +1934,7 @@ static int qca_setup(struct hci_uart *hu)
>  	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -1958,6 +1968,7 @@ static int qca_setup(struct hci_uart *hu)
>  	}
>  
>  	switch (soc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -2046,6 +2057,17 @@ static const struct hci_uart_proto qca_proto = {
>  	.dequeue	= qca_dequeue,
>  };
>  
> +static const struct qca_device_data qca_soc_data_wcn3950 __maybe_unused = {
> +	.soc_type = QCA_WCN3950,
> +	.vregs = (struct qca_vreg []) {
> +		{ "vddio", 15000  },
> +		{ "vddxo", 60000  },
> +		{ "vddrf", 155000 },
> +		{ "vddch0", 585000 },
> +	},
> +	.num_vregs = 4,
> +};
> +
>  static const struct qca_device_data qca_soc_data_wcn3988 __maybe_unused = {
>  	.soc_type = QCA_WCN3988,
>  	.vregs = (struct qca_vreg []) {
> @@ -2338,6 +2360,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		qcadev->btsoc_type = QCA_ROME;
>  
>  	switch (qcadev->btsoc_type) {
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -2374,6 +2397,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			break;
>  		}
>  		fallthrough;
> +	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
>  	case QCA_WCN3991:
> @@ -2683,6 +2707,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>  	{ .compatible = "qcom,qca6174-bt" },
>  	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
>  	{ .compatible = "qcom,qca9377-bt" },
> +	{ .compatible = "qcom,wcn3950-bt", .data = &qca_soc_data_wcn3950},
>  	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
>  	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

