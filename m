Return-Path: <linux-arm-msm+bounces-22932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011590BA94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6034F1C22F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5061990C0;
	Mon, 17 Jun 2024 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVdvByBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403D198E8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718651415; cv=none; b=sEWuMlE+/cXWZbI0iuswDVDpdUZIL/VHx8/ai4MB8v2RrdVK7ng6VLDDOWDvlhj3uumAdI+CbDeLENGw4poQb+ThbuV35Gbp/yixXQnMXTSsjULyJpgPOGgltqi9nnUKYUMKItfX0ZwQmaFtL92Fo/ICd32fmQwDeyECAqxsPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718651415; c=relaxed/simple;
	bh=wcl7+zOsJr1+gN0g0Rlxn/gVOmWy+fNU6sY89FCPmyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILuem2tbzSqQIvMSctcL16hNm+BTV834KbqHyYp1Z8uRYKtUgzNya1X4rOBDtrG1A0vn7xIzUQXkePbORM1rTx5cbKkmYIMZsFQ5VvQvQ/NtQpdejI+sTvIyRo812BxWVB0moKW14/2sk8+dAU6e9Gfi/l116/RiucNXTw0sxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVdvByBL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cc1528c83so552758e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718651411; x=1719256211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7UUqmYzt5Fad8Nwjz29EcFeQsVZigIrkSENxKW+D/U=;
        b=TVdvByBLvNQRg3Dk/A1GWyTEKv5kOwvsg6xlM7AM35QPMY3vNGhkpSG03Fv2uuC4XF
         HE+3vtjRByisXJ5/urcx98uKyfRKy0ZrezsuSOMyMsBzgCNVXKDpIX1vuVcYeG/hQb6B
         mGVhhbrgixvDFnbLVr5AcqfzT7taOSqMsBefhMy3fbOz/7oMYIUk6xgPrrqo8bdqTkEQ
         7jSORlLPPm/rriUimEkAB5r5oTIAB3G7zu2f9ItQ23Ohb0fkbengNwR5g+GmkFWkHNYw
         m1TBH4ayxmiaHSb9H3jrBvf+TXv71wtuwm9Zhvm+AnqAhNDT1MWE9j+3GOJAyVeillwS
         BTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718651411; x=1719256211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7UUqmYzt5Fad8Nwjz29EcFeQsVZigIrkSENxKW+D/U=;
        b=MnGXEMm9hzG43ogg4Fg6QrBir0H9tF8CnusQQsWsf/Em8iMAEj38tzcU2BfObQOH+F
         LmiXOpMYBAnSy1J/lrtrt32SfoyzCRwXM+CtZXOpT7Z8m0iTI3eHqVh25S+dIRiyo7za
         xsIAGspPji9ULweq1e0NLNrzDGICFP4wJyjq1dPGBmQf1ieY2MfDJ2j+Hzae4MOU7wsv
         8NPhHu3BxjbCjz+50Tf9QTzCTcwDsxAOtJlMZE9s97dZJxj5C392y3aG1sDUKWKmM0iZ
         whgefbGH2TmW+H5d03deQS+F7P2Free9D6SPNyi7yDG4KDD9u/hnRVOVle8/ICNXVT7A
         E57Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5PXw9xBNtHX4irImiUG9n+TjJ+NJVdKhmfT1ab9GAC+Bh5zHG0jDGl7ICnQGsW7CCeVGMXmbbx/pUw9Gj6YdHCUU59KzoBUMF12JMVw==
X-Gm-Message-State: AOJu0YzWKiqaYThZmUxwFjrpL0dKatSZQyHDm1pCQnTujtfHrXyL59rS
	XinSYyljKgrYRjGmAqqKD3mF295MNlXEjYrhP9RA0t7XpqJDgRpUnSNzOWP7DTQ=
X-Google-Smtp-Source: AGHT+IHz0efUjCHMuOtSGmYf5fBexuE5AlUAyxRPBDkh+DJ46L6ZAbXr0lp0Kpx9rY5b9wdeHBiOVQ==
X-Received: by 2002:a05:6512:3112:b0:52c:7f16:d439 with SMTP id 2adb3069b0e04-52ca6e6e286mr6166946e87.39.1718651410939;
        Mon, 17 Jun 2024 12:10:10 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59? ([2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287ae9asm1313968e87.211.2024.06.17.12.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:10:10 -0700 (PDT)
Message-ID: <bc4892b7-7c34-4fcb-b4c0-e383890162f8@linaro.org>
Date: Mon, 17 Jun 2024 21:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix
 hangs/lockups
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 00:24, Douglas Anderson wrote:
> The fact that the Qualcomm GENI hardware interface is based around
> "packets" is really awkward to fit into Linux's UART design.
> Specifically, in order to send bytes you need to start up a new
> "command" saying how many bytes you want to send and then you need to
> send all those bytes. Once you've committed to sending that number of
> bytes it's very awkward to change your mind and send fewer, especially
> if you want to do so without dropping bytes on the ground.

[...]

  
> +static void qcom_geni_serial_enable_cmd_done(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +
> +	/* If we're not in FIFO mode we don't use CMD_DONE. */
> +	if (port->dev_data->mode != GENI_SE_FIFO)
> +		return;
> +
> +	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_EN_SET);
> +}

IDK if this is worth of a separate function, instead of checking for the
FIFO in port_setup and writing it there, but generally this patch looks
good to me

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

