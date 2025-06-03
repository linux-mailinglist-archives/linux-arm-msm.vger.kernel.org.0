Return-Path: <linux-arm-msm+bounces-60152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03696ACC91B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E288E7A4DCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CF423A9AA;
	Tue,  3 Jun 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JuWtqqmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4329A239E9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960923; cv=none; b=K2Pkfujmf1azmTp7JUtiQ4TXa1aHRrAKFBZyG64gUfEsW5RL4NzE89w0UHhXzhue3L0F5r9jROKkjA1w7cHeKJ2YFFcjOO2++FZ5Duf6nxxfkxhm0spKarWH9J3JnLZ+b4Xium07nUawIIsbxc63raDUJSEdDe1ZVEpIFwV0lJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960923; c=relaxed/simple;
	bh=BHoROxq4Yg70EhGIUKjQurV0ymRZkbKIPnWlHTUtRds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMkM55+wzR/4x3lRoaCfynLFeA9DTkqWq/8lYfaEA37zzOQUqCQcGpHdozdcroRAcrXWSl14DKdxj9W4ZeYb35mlMSldsaJpYYyAb+f4Y6gH/ME89M7AK0vu+lKt2B29JRHkDSLDPTGUFekQQsivvNDL4MNYcNUvPrHFHGOiX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JuWtqqmc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a374f727dbso4964620f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748960918; x=1749565718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVoevd4lyUI3zPOEpq/RIzyFhX2NtvaxczLaES3uue8=;
        b=JuWtqqmcW7cs/mhXv5O115HtovW8asw97hwTSQw9d9XqBDzUrRVEWGisSLkHnVVYmI
         CUzsDzFZj0FfNU2CBWftGl3eQhSbCBp6slJia9l+RcRM82Ta04EAGMOJANfBcdUN6s3p
         5yNiVDC+zEsNSXi7Iax54ef+CplDKEttjYunsjVE9kJsz9jLQ4zz1tR944hvjcEif/Dz
         7yiaauwTIrjmDUZhNYYHxeswAmra3sn8GnCsKFIS+q6pMcCmnBT9NGFzjN4ryG2fIkYB
         /VY5oyOl4JENgGVqXEEMEYK1LedohwkxjJD1f7LbAAnx/vQV7iyWCVX1vT9Q+xQEi9Fv
         RvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960918; x=1749565718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVoevd4lyUI3zPOEpq/RIzyFhX2NtvaxczLaES3uue8=;
        b=UBev2RUNyaM+ddhY/sKwtGa6Z58O8H0OuIgtpNEsZNQKWYPKmOkHys/0SRtdZsANq+
         O86fKtGmlpg8ZxXGHEoHCc/AxjWiyr39IpYna5+phUsaTKv0f974a5h6F3OpkeCZIyjx
         12UH3Pb55629Z4+f+N5lhNDsqR+BDbj04BI/u1J9syDo5a+x5kAQcvaiAEhPPal9PIhc
         CpSQfFziMVI1gCbbgdEWE7Oj7+q6r5990XS4Ob/2FgWkk0BCm6WHeTXGDbUkGf8Zn/yI
         NH15Su2dRHU845rVdBBvG/19U5cKh+wj4DnF5LsQDRIgG3/VCFwPc0WcwLfHCVYuRirJ
         rhbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvCYBTrPadrnY0gTfKkS+hxP5H4hjEBovESunWTRzPfNvKgQl0HfnyDCJVo+o/Lp8f3qg8p9QUtsSfQMGj@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUV8/V46RO1EdEdS1hh2mTILyRwJ8f4R0/pVepE+tB6ZpqtlE
	7+ZMuIgv03qmjxjlvhEpEesOgl01gEgLiYRyMO9tAD2IlYygdCM/dmulqzOkolcssg6E62Pq+L1
	4fH5K7PM=
X-Gm-Gg: ASbGncv8kWQBD6y/q/pVhULz+8CMPiXFMQk+TqXu6WseHGmHPlSsPga0Njta8rsZy4F
	GpLwmwpiSq28+78RUsQL+1uNfmtLkglxY8/56Yq9HPE1LSu9xRv6NkU55pvmOkwNxzDYUdHPtSq
	FrFF1KoQoH2V99uDwfGL9fiSCwHD/kQTzTaX+zj8IzC6II/XJtN3GywGFwLO/yzOV8vG9Sd49pM
	I7sKJMZJvw+srD1kBMn5mkHtNE64wXEjcHv5VHcYnu4Y1hk4024W5eYpNQ9RtOmKxhNIwdiNDNK
	IUfSESXCEoZrDHntljqi/GKkdq1mLHHWTldjhnN1V3MMMQkmIOe+mZ5ChOGAFAVhQCY73cLqvdQ
	PFTeM4EaNMuUjtG9nNUmBO60SByQ=
X-Google-Smtp-Source: AGHT+IHZurIKIq1+E6HJ23X1xCR/CPwysvL7IX6Z+9+U73oLFe1k7nAiy+c7nnudAfdU7L/qlrvwEA==
X-Received: by 2002:a05:6000:2306:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a4f89ac91cmr13017254f8f.25.1748960918481;
        Tue, 03 Jun 2025 07:28:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c4f2sm18232873f8f.22.2025.06.03.07.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:28:38 -0700 (PDT)
Message-ID: <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
Date: Tue, 3 Jun 2025 15:28:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] serial: qcom-geni: move resource control logic to
 separate functions
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-6-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> Supports use in PM system/runtime frameworks, helping to
> distinguish new resource control mechanisms and facilitate
> future modifications within the new API.
> 
> The code that handles the actual enable or disable of resources
> like clock and ICC paths to a separate function
> (geni_serial_resources_on() and geni_serial_resources_off()) which
> enhances code readability.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v3 -> v4
> - added version log after ---
> 
> v1 -> v2
> - returned 0 instead of ret variable
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 54 +++++++++++++++++++++------
>   1 file changed, 42 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6ad759146f71..2cd2085473f3 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1588,6 +1588,42 @@ static struct uart_driver qcom_geni_uart_driver = {
>   	.nr =  GENI_UART_PORTS,
>   };
> 
> +static int geni_serial_resources_off(struct uart_port *uport)

It seems like an extremely nit-picky thing to say BUT

geni_serial_resources_on();
geni_serial_resources_off();

since that is the order you use in the code below.

> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	int ret;
> +
> +	dev_pm_opp_set_rate(uport->dev, 0);
> +	ret = geni_se_resources_off(&port->se);
> +	if (ret)
> +		return ret;
> +
> +	geni_icc_disable(&port->se);
> +
> +	return 0;
> +}
> +
> +static int geni_serial_resources_on(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	int ret;
> +
> +	ret = geni_icc_enable(&port->se);
> +	if (ret)
> +		return ret;
You're adding additional logical checks here, which seem reasonable but 
are not stated in your commit log.

Please make clear in the commit log that additional, minor function 
return checks are added as you do your functional decomposition.

> +
> +	ret = geni_se_resources_on(&port->se);
> +	if (ret) {
> +		geni_icc_disable(&port->se);
> +		return ret;
> +	}
> +
> +	if (port->clk_rate)
> +		dev_pm_opp_set_rate(uport->dev, port->clk_rate);
> +
> +	return 0;
> +}
> +
>   static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>   {
>   	int ret;
> @@ -1628,23 +1664,17 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>   static void qcom_geni_serial_pm(struct uart_port *uport,
>   		unsigned int new_state, unsigned int old_state)
>   {
> -	struct qcom_geni_serial_port *port = to_dev_port(uport);
> 
>   	/* If we've never been called, treat it as off */
>   	if (old_state == UART_PM_STATE_UNDEFINED)
>   		old_state = UART_PM_STATE_OFF;
> 
> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
> -		geni_icc_enable(&port->se);
> -		if (port->clk_rate)
> -			dev_pm_opp_set_rate(uport->dev, port->clk_rate);
> -		geni_se_resources_on(&port->se);
> -	} else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON) {
> -		geni_se_resources_off(&port->se);
> -		dev_pm_opp_set_rate(uport->dev, 0);
> -		geni_icc_disable(&port->se);
> -	}
> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> +		geni_serial_resources_on(uport);
> +	else if (new_state == UART_PM_STATE_OFF &&
> +			old_state == UART_PM_STATE_ON)
> +		geni_serial_resources_off(uport);
> +
>   }
> 
>   static const struct uart_ops qcom_geni_console_pops = {
> --
> 2.17.1
> 
> 
Assuming you address my points.




