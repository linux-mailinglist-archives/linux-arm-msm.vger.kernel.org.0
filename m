Return-Path: <linux-arm-msm+bounces-38450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F79D38F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D016A1F24282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10691A254C;
	Wed, 20 Nov 2024 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKbelS8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694419E971
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100382; cv=none; b=TVH0pKyaO8/FOfPBH3+QCMyh1Y+xStR0L+pslqWwVQFe0yZzfdNElcdtovZ3Ml5KozRMl21epnH0sWF2/SMxk4C9+mJq+gy1FLjbFyx6U49KXBwcof6+E9V8uNTvifFuJ9ja/GJDarxdgGzw0T0RL8Ea8xUmeMOGJO7KfNUS3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100382; c=relaxed/simple;
	bh=s/kvTl19rR5DsnmlefDl+CRwTtfwHFjodTvao+XCqzA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hC/KTv/btQPWTPI61PvXp7AgzLlCjTO5Bs9tBmpu4zJcegib1vtnVnRVW9QOqJZe+fAX/Oklf83NaDtFUdCKxHNdJrh6Vgp5IawsIQtmBCdIQ1T8tvVzKXNJzXXQ9oHgNtPCVcxcODvKG7dMm+zxcgQYuT/NXRG4DeC9hUuS1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKbelS8u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso45459435e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732100379; x=1732705179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+EUc9G4gGqGvBL32/yaGkbWCnE82GDfoN5oyWU2+KY=;
        b=IKbelS8urV4bwh8iu4rdn1Jr57CR/DRxpb8tsFM2vtjitZAYvenGyshpcg1MRI1OpY
         HwchCBAXZHsDIDBcd4jdRfgewX/r833NuE1UcyAU2yXh7e3fAnVKAeapzt1CwfUqawT7
         VbnePwtL7loi5EKrSezXEQ30s7cm/mGEic4p+9HtU8gIIwclklQFlgOs21dcXy8jb6kf
         OQ1sgmyddo2UsRikbLE6879fGeeqN3N396h28wl749I4M9Tc114ZUOEWb0X5JsWsDY61
         q/uh+n5Ob6dyfhd6pNn2kFw3ov0AjjmTAncW9XWPO/voNIiYI5lv7rnHFU2Ry2G3hPBC
         6jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100379; x=1732705179;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s+EUc9G4gGqGvBL32/yaGkbWCnE82GDfoN5oyWU2+KY=;
        b=olkOf9HmnXFjzblZdw2S0E1B3OjiijNYsFgF5sFz/sarP01vnpXa6ea6Kwf6qR/cii
         kGILwSOgImWJ4SKYPutwD5Bc9xIkaEzZ7cdCu/ibOazehsB5coa5ohOTxaZ1UQyb0m8C
         n0lmhlAVtciPOUsxUkXVf8WybY5F+IcWraPta84YWh1T7g2OnaFh5/IXujurCcu9O9Kp
         2SDzoV3g4ZYtqjMfsT7zsjZAviDCwSfn3ObSNM949S0WBoWVBgjagzw+5P7gI7hG4OtP
         EoI1Nwdyap6ACoHPOnF7oO00Ov0Odo7K1PUF4ClYYq3FHVdqq8kcRoF75FtySrjQklEz
         mcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvVM4kE8//+f8gFCEub0GBU1Mz+y2pR9JtEKfIMbaLrbxjSwetGbr84V6uD0m9qYJGdDItECE9qwNa2AJj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fQDucNOb19a7H0AYMR+4AO/TDG66WJImnGwwhAkt6EMVcIGm
	ioFLK4C9tXWnmyH7P926LqHJ3D0cL2g9dCqWMgClzphiHa6QpBeiIL1oFf7R32k=
X-Google-Smtp-Source: AGHT+IHD94rvf6wRbl/8lG9psg2EINOtRNAAW7qBifQGKTNbF61eHpbvnMAQUjv8yd1nEUmp5RJ6Hw==
X-Received: by 2002:a05:600c:5490:b0:431:3c67:fb86 with SMTP id 5b1f17b1804b1-4334f02c7b9mr17460715e9.33.1732100378476;
        Wed, 20 Nov 2024 02:59:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776? ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825494b974sm1712973f8f.108.2024.11.20.02.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 02:59:38 -0800 (PST)
Message-ID: <a837df85-2505-4250-a81e-3683b74d618a@linaro.org>
Date: Wed, 20 Nov 2024 11:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/4] Bluetooth: hci_qca: add qcom,product-variant
 properties
To: Cheng Jiang <quic_chejiang@quicinc.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_mohamull@quicinc.com
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-5-quic_chejiang@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241120095428.1122935-5-quic_chejiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 10:54, Cheng Jiang wrote:
> Since different products use the same SoC chip, features cannot
> be included in a single patch. Use the qcom,product-variant to
> load the appropriate firmware.
> 
> The qcom,product-variant provides product line information, which
> the driver uses to load firmware from different directories.
> 
> If it's not defined in dts, the default firmware will be loaded.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>   drivers/bluetooth/btqca.c   | 142 +++++++++++++++++++++++++++++-------
>   drivers/bluetooth/btqca.h   |  11 ++-
>   drivers/bluetooth/hci_qca.c |  73 +++++++++---------
>   3 files changed, 164 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dfbbac92242a..0845e5a60412 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -700,8 +700,79 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
>   	return 0;
>   }
>   
> -static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
> -		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
> +
> +const char *qca_get_soc_name(enum qca_btsoc_type soc_type)
> +{
> +	const char *soc_name = "";
> +
> +	switch (soc_type) {
> +	case QCA_QCA2066:
> +		soc_name = "QCA2066";
> +		break;
> +
> +	case QCA_QCA6698:
> +		soc_name = "QCA6698";
> +		break;
> +
> +	case QCA_WCN3988:
> +	case QCA_WCN3990:
> +	case QCA_WCN3991:
> +	case QCA_WCN3998:
> +		soc_name = "WCN399x";
> +		break;
> +
> +	case QCA_WCN6750:
> +		soc_name = "WCN6750";
> +		break;
> +
> +	case QCA_WCN6855:
> +		soc_name = "WCN6855";
> +		break;
> +
> +	case QCA_WCN7850:
> +		soc_name = "WCN7850";
> +		break;
> +
> +	default:
> +		soc_name = "ROME/QCA6390";
> +	}
> +
> +	return soc_name;
> +}
> +EXPORT_SYMBOL_GPL(qca_get_soc_name);
> +
> +static void qca_get_firmware_path(enum qca_btsoc_type soc_type, char *fw_path,
> +		size_t max_size, enum qca_product_type product_type)
> +{
> +	const char *fw_dir = NULL;
> +
> +	switch (product_type) {
> +	case QCA_MCC:
> +		fw_dir = "qca";
> +		break;
> +	case QCA_CE:
> +		fw_dir = "qca/ce";
> +		break;
> +	case QCA_IOT:
> +		fw_dir = "qca/iot";
> +		break;
> +	case QCA_AUTO:
> +		fw_dir = "qca/auto";
> +		break;
> +	default:
> +		fw_dir = "qca";
> +		break;
> +	}
> +
> +	if (product_type == QCA_IOT)
> +		snprintf(fw_path, max_size, "%s/%s", fw_dir, qca_get_soc_name(soc_type));
> +	else
> +		snprintf(fw_path, max_size, "%s", fw_dir);
> +}
> +
> +static void qca_generate_hsp_nvm_name(enum qca_btsoc_type soc_type, char *fwname,
> +		size_t max_size, const char *fw_path, struct qca_btsoc_version ver, u8 rom_ver,
> +		u16 bid)
>   {
>   	const char *variant;
>   
> @@ -712,33 +783,36 @@ static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
>   		variant = "";
>   
>   	if (bid == 0x0)
> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
> +		snprintf(fwname, max_size, "%s/hpnv%02x%s.bin", fw_path, rom_ver, variant);
>   	else
> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
> +		snprintf(fwname, max_size, "%s/hpnv%02x%s.%x", fw_path, rom_ver, variant, bid);
>   }
>   
> -static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
> +static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg, const char *fw_path,
>   					    const char *stem, u8 rom_ver, u16 bid)
>   {
>   	if (bid == 0x0)
> -		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
> +		snprintf(cfg->fwname, sizeof(cfg->fwname),
> +			 "%s/%snv%02x.bin", fw_path, stem, rom_ver);
>   	else if (bid & 0xff00)
>   		snprintf(cfg->fwname, sizeof(cfg->fwname),
> -			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
> +			 "%s/%snv%02x.b%x", fw_path, stem, rom_ver, bid);
>   	else
>   		snprintf(cfg->fwname, sizeof(cfg->fwname),
> -			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
> +			 "%s/%snv%02x.b%02x", fw_path, stem, rom_ver, bid);
>   }
>   
>   int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> -		   const char *firmware_name)
> +		   const char *firmware_name, uint32_t product_variant)
>   {
>   	struct qca_fw_config config = {};
>   	int err;
>   	u8 rom_ver = 0;
>   	u32 soc_ver;
>   	u16 boardid = 0;
> +	enum qca_product_type product_type;
> +	char fw_path[64] = {0};
>   
>   	bt_dev_dbg(hdev, "QCA setup on UART");
>   
> @@ -759,6 +833,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	if (soc_type == QCA_WCN6750)
>   		qca_send_patch_config_cmd(hdev);
>   
> +	/* Get the f/w path based on product variant */
> +	product_type = (product_variant >> 16) & 0xff;
> +	qca_get_firmware_path(soc_type, fw_path, sizeof(fw_path), product_type);
> +
>   	/* Download rampatch file */
>   	config.type = TLV_TYPE_PATCH;
>   	switch (soc_type) {
> @@ -766,19 +844,23 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	case QCA_WCN3991:
>   	case QCA_WCN3998:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/crbtfw%02x.tlv", rom_ver);
> +			 "%s/crbtfw%02x.tlv", fw_path, rom_ver);

Changing firmware path will break existing platforms, please don't, or add fallbacks.

>   		break;
>   	case QCA_WCN3988:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/apbtfw%02x.tlv", rom_ver);
> +			 "%s/apbtfw%02x.tlv", fw_path, rom_ver);
>   		break;
>   	case QCA_QCA2066:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
>   		break;
>   	case QCA_QCA6390:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/htbtfw%02x.tlv", rom_ver);
> +			 "%s/htbtfw%02x.tlv", fw_path, rom_ver);
> +		break;
> +	case QCA_QCA6698:
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
>   		break;
>   	case QCA_WCN6750:
>   		/* Choose mbn file by default.If mbn file is not found
> @@ -786,19 +868,19 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		 */
>   		config.type = ELF_TYPE_PATCH;
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/msbtfw%02x.mbn", rom_ver);
> +			 "%s/msbtfw%02x.mbn", fw_path, rom_ver);
>   		break;
>   	case QCA_WCN6855:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
>   		break;
>   	case QCA_WCN7850:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/hmtbtfw%02x.tlv", rom_ver);
> +			 "%s/hmtbtfw%02x.tlv", fw_path, rom_ver);
>   		break;
>   	default:
>   		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/rampatch_%08x.bin", soc_ver);
> +			 "%s/rampatch_%08x.bin", fw_path, soc_ver);
>   	}
>   
>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> @@ -810,7 +892,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	/* Give the controller some time to get ready to receive the NVM */
>   	msleep(10);
>   
> -	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
> +	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850 ||
> +		soc_type == QCA_QCA6698)
>   		qca_read_fw_board_id(hdev, &boardid);
>   
>   	/* Download NVM configuration */
> @@ -825,39 +908,40 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		case QCA_WCN3998:
>   			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID) {
>   				snprintf(config.fwname, sizeof(config.fwname),
> -					 "qca/crnv%02xu.bin", rom_ver);
> +					 "%s/crnv%02xu.bin", fw_path, rom_ver);
>   			} else {
>   				snprintf(config.fwname, sizeof(config.fwname),
> -					 "qca/crnv%02x.bin", rom_ver);
> +					 "%s/crnv%02x.bin", fw_path, rom_ver);
>   			}
>   			break;
>   		case QCA_WCN3988:
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/apnv%02x.bin", rom_ver);
> +				 "%s/apnv%02x.bin", fw_path, rom_ver);
>   			break;
>   		case QCA_QCA2066:
> -			qca_generate_hsp_nvm_name(config.fwname,
> -				sizeof(config.fwname), ver, rom_ver, boardid);
> +		case QCA_QCA6698:
> +			qca_generate_hsp_nvm_name(soc_type, config.fwname,
> +				sizeof(config.fwname), fw_path, ver, rom_ver, boardid);
>   			break;
>   		case QCA_QCA6390:
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/htnv%02x.bin", rom_ver);
> +				 "%s/htnv%02x.bin", fw_path, rom_ver);
>   			break;
>   		case QCA_WCN6750:
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/msnv%02x.bin", rom_ver);
> +				 "%s/msnv%02x.bin", fw_path, rom_ver);
>   			break;
>   		case QCA_WCN6855:
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/hpnv%02x.bin", rom_ver);
> +				 "%s/hpnv%02x.bin", fw_path, rom_ver);
>   			break;
>   		case QCA_WCN7850:
> -			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
> +			qca_get_nvm_name_generic(&config, "hmt", fw_path, rom_ver, boardid);
>   			break;
>   
>   		default:
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/nvm_%08x.bin", soc_ver);
> +				 "%s/nvm_%08x.bin", fw_path, soc_ver);
>   		}
>   	}
>   
> @@ -871,6 +955,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	case QCA_WCN3991:
>   	case QCA_QCA2066:
>   	case QCA_QCA6390:
> +	case QCA_QCA6698:
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> @@ -909,6 +994,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		/* get fw build info */
>   		err = qca_read_fw_build_info(hdev);
>   		if (err < 0)
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index bb5207d7a8c7..baa3f979d017 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -151,21 +151,30 @@ enum qca_btsoc_type {
>   	QCA_WCN3991,
>   	QCA_QCA2066,
>   	QCA_QCA6390,
> +	QCA_QCA6698,
>   	QCA_WCN6750,
>   	QCA_WCN6855,
>   	QCA_WCN7850,
>   };
>   
> +enum qca_product_type {
> +	QCA_MCC = 0,
> +	QCA_CE,
> +	QCA_IOT,
> +	QCA_AUTO,
> +};
> +
>   #if IS_ENABLED(CONFIG_BT_QCA)
>   
>   int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>   int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> -		   const char *firmware_name);
> +		   const char *firmware_name, uint32_t product_variant);
>   int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
>   			 enum qca_btsoc_type);
>   int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>   int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
> +const char *qca_get_soc_name(enum qca_btsoc_type soc_type);
>   #else
>   
>   static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 37129e6cb0eb..69fec890eb8c 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -227,6 +227,7 @@ struct qca_serdev {
>   	struct qca_power *bt_power;
>   	u32 init_speed;
>   	u32 oper_speed;
> +	u32 product_variant;
>   	bool bdaddr_property_broken;
>   	const char *firmware_name;
>   };
> @@ -1361,6 +1362,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		usleep_range(1000, 10000);
>   		break;
>   
> @@ -1447,6 +1449,7 @@ static int qca_check_speeds(struct hci_uart *hu)
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
>   		    !qca_get_speed(hu, QCA_OPER_SPEED))
>   			return -EINVAL;
> @@ -1489,6 +1492,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>   		case QCA_WCN6750:
>   		case QCA_WCN6855:
>   		case QCA_WCN7850:
> +		case QCA_QCA6698:
>   			hci_uart_set_flow_control(hu, true);
>   			break;
>   
> @@ -1523,6 +1527,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>   		case QCA_WCN6750:
>   		case QCA_WCN6855:
>   		case QCA_WCN7850:
> +		case QCA_QCA6698:
>   			hci_uart_set_flow_control(hu, false);
>   			break;
>   
> @@ -1803,6 +1808,7 @@ static int qca_power_on(struct hci_dev *hdev)
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
>   	case QCA_QCA6390:
> +	case QCA_QCA6698:
>   		ret = qca_regulator_init(hu);
>   		break;
>   
> @@ -1858,7 +1864,6 @@ static int qca_setup(struct hci_uart *hu)
>   	int ret;
>   	struct qca_btsoc_version ver;
>   	struct qca_serdev *qcadev;
> -	const char *soc_name;
>   
>   	ret = qca_check_speeds(hu);
>   	if (ret)
> @@ -1873,34 +1878,7 @@ static int qca_setup(struct hci_uart *hu)
>   	 */
>   	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>   
> -	switch (soc_type) {
> -	case QCA_QCA2066:
> -		soc_name = "qca2066";
> -		break;
> -
> -	case QCA_WCN3988:
> -	case QCA_WCN3990:
> -	case QCA_WCN3991:
> -	case QCA_WCN3998:
> -		soc_name = "wcn399x";
> -		break;
> -
> -	case QCA_WCN6750:
> -		soc_name = "wcn6750";
> -		break;
> -
> -	case QCA_WCN6855:
> -		soc_name = "wcn6855";
> -		break;
> -
> -	case QCA_WCN7850:
> -		soc_name = "wcn7850";
> -		break;
> -
> -	default:
> -		soc_name = "ROME/QCA6390";
> -	}
> -	bt_dev_info(hdev, "setting up %s", soc_name);
> +	bt_dev_info(hdev, "setting up %s", qca_get_soc_name(soc_type));

Move this into a new function in a separate patch

>   
>   	qca->memdump_state = QCA_MEMDUMP_IDLE;
>   
> @@ -1919,6 +1897,7 @@ static int qca_setup(struct hci_uart *hu)
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		qcadev = serdev_device_get_drvdata(hu->serdev);
>   		if (qcadev->bdaddr_property_broken)
>   			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
> @@ -1952,6 +1931,7 @@ static int qca_setup(struct hci_uart *hu)
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		break;
>   
>   	default:
> @@ -1963,7 +1943,7 @@ static int qca_setup(struct hci_uart *hu)
>   
>   	/* Setup patch / NVM configurations */
>   	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
> -			firmware_name);
> +			firmware_name, qcadev->product_variant);

Add product variant support separately from adding QCA6698

>   	if (!ret) {
>   		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>   		qca_debugfs_init(hdev);
> @@ -2089,6 +2069,20 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
>   	.num_vregs = 0,
>   };
>   
> +static const struct qca_device_data qca_soc_data_qca6698 __maybe_unused = {
> +	.soc_type = QCA_QCA6698,
> +	.vregs = (struct qca_vreg []) {
> +		{ "vddio", 5000 },
> +		{ "vddbtcxmx", 126000 },
> +		{ "vddrfacmn", 12500 },
> +		{ "vddrfa0p8", 102000 },
> +		{ "vddrfa1p7", 302000 },
> +		{ "vddrfa1p2", 257000 },
> +	},
> +	.num_vregs = 6,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> +};
> +
>   static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
>   	.soc_type = QCA_WCN6750,
>   	.vregs = (struct qca_vreg []) {
> @@ -2165,7 +2159,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>   		pwrseq_power_off(power->pwrseq);
>   		set_bit(QCA_BT_OFF, &qca->flags);
>   		return;
> -        }
> +	}

This is cleanup

>   
>   	switch (soc_type) {
>   	case QCA_WCN3988:
> @@ -2179,6 +2173,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>   
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
> +	case QCA_QCA6698:
>   		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>   		msleep(100);
>   		qca_regulator_disable(qcadev);
> @@ -2313,6 +2308,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   					 &qcadev->firmware_name);
>   	device_property_read_u32(&serdev->dev, "max-speed",
>   				 &qcadev->oper_speed);
> +	device_property_read_u32(&serdev->dev, "qcom,product-variant",
> +				 &qcadev->product_variant);
> +
> +	if (qcadev->product_variant != 0)
> +		BT_INFO("QC Product Variant: 0x%08x", qcadev->product_variant);
> +
>   	if (!qcadev->oper_speed)
>   		BT_DBG("UART will pick default operating speed");
>   
> @@ -2333,6 +2334,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
>   	case QCA_QCA6390:
> +	case QCA_QCA6698:
>   		qcadev->bt_power = devm_kzalloc(&serdev->dev,
>   						sizeof(struct qca_power),
>   						GFP_KERNEL);
> @@ -2346,6 +2348,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   	switch (qcadev->btsoc_type) {
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		if (!device_property_present(&serdev->dev, "enable-gpios")) {
>   			/*
>   			 * Backward compatibility with old DT sources. If the
> @@ -2380,7 +2383,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   					       GPIOD_OUT_LOW);
>   		if (IS_ERR(qcadev->bt_en) &&
>   		    (data->soc_type == QCA_WCN6750 ||
> -		     data->soc_type == QCA_WCN6855)) {
> +		     data->soc_type == QCA_WCN6855 ||
> +		     data->soc_type == QCA_QCA6698)) {
>   			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
>   			return PTR_ERR(qcadev->bt_en);
>   		}
> @@ -2393,7 +2397,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>   		if (IS_ERR(qcadev->sw_ctrl) &&
>   		    (data->soc_type == QCA_WCN6750 ||
>   		     data->soc_type == QCA_WCN6855 ||
> -		     data->soc_type == QCA_WCN7850)) {
> +		     data->soc_type == QCA_WCN7850 ||
> +		     data->soc_type == QCA_QCA6698)) {
>   			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
>   			return PTR_ERR(qcadev->sw_ctrl);
>   		}
> @@ -2475,6 +2480,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>   	case QCA_WCN6750:
>   	case QCA_WCN6855:
>   	case QCA_WCN7850:
> +	case QCA_QCA6698:
>   		if (power->vregs_on)
>   			qca_power_shutdown(&qcadev->serdev_hu);
>   		break;
> @@ -2669,6 +2675,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>   	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
>   	{ .compatible = "qcom,qca6174-bt" },
>   	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
> +	{ .compatible = "qcom,qca6698-bt", .data = &qca_soc_data_qca6698},
>   	{ .compatible = "qcom,qca9377-bt" },
>   	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
>   	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},

This patch is too long anf has multiple different changes merged together,
please split into multiple small pieces that can be reviewed easier,

Thanks,
Neil

