Return-Path: <linux-arm-msm+bounces-22934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A890BB73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73E761C22897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E92E188CAB;
	Mon, 17 Jun 2024 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chfZ60Dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920C187542
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718654086; cv=none; b=p2k9NnRS/aY4tNOKKB3AFTiN79ZIaCs1EhoL/y7GTitTkFHi+KbHySIdCtJReKd622zlf5p2qOzIex5U/vFci3q3amnypuI2grDuBTKgSQsEuQt1wNNBbU7CIkTiuX/dmZS1EM9eN+jcmBlpYS/JavorlOj/hmUrWelZiaqzzGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718654086; c=relaxed/simple;
	bh=Ki+PTbc1GxfDrvhVqHJ57W/XR1v1M3XS3dBT4kzMlkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1EB4ovXzt/4oLEQqlRBdCWeb8x9De5dZPdvi1KiwHUMuWzcHlNhEEidHkUdlG6OIFR12zjCTdB4MqmOdWoykiXE0v68Xafysi8DgPnk3SQeY6CvieFZGvEHtE4YhraKyqLOJZzKf4xIWvKoZN0j6bY0ERSenZ7m5j88GVWMfy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chfZ60Dz; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e72224c395so48440621fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718654083; x=1719258883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D48MDGlr810xqpuSk4MZZtp4IG/NVS2nfRA2oR5Rofk=;
        b=chfZ60DzE6l/kGOpAr0wAopbA9UTdLa+Scu5MkoUz2z9dUMRlO4g96KOLfddrF4Mog
         g6YiB4lDm6dpLW8p7UmCfXMW4uCuHgjMtnlnzu0RASkPhQH/hY87K+bukLc26fnimKLE
         VqPz9j1vZwXYzhBXzx3MkVJ6mDvuEDWptbkpeSNdCTNUaIfvLydPvJI/bPi0ucC9bDjP
         EjlsXLn73qdggXcdf7QYN8HKgndjjkDWuyT05FnEWENOWSXjWOwVMQ4+ASuDLDqPsZN7
         HAWZzoiX7uAqOpoOnIoCytzohez96CIAz0pSrYQQsxP4N3aZuVDF8CEKJJ8mtQi07OiF
         Eiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654083; x=1719258883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D48MDGlr810xqpuSk4MZZtp4IG/NVS2nfRA2oR5Rofk=;
        b=Rly4QDr1T+Inns6WwcuHg/K5UsFtf0EkX1U8SunGotTJktf36FcnCHmvMydx+hKt/t
         IE+8xmE5ebaSM2KC3cRWK4869+Swl2yNJR/kKfEjx7+LhsPjl6PQ4gQ3rEvamoaYXXvb
         3Fjv6yMcRSHS0toBelh80wheI6ZavAl9xhqjXFSHeHzWqRLfDz81cgig6MvR8CH6ZkeF
         XRDlm3aiQMsRTbMtxZy+WSMt9Fx8kUecR+LKze6H9tDi9caE2BatYLMHYekWsnVywc2R
         4zDDeQMvhEpNCVEyD0HPTTcR3IK/jKS/o60ZHPCIbh1q9Ca++2y0fQ41NJBwSr13bRsK
         Bqgw==
X-Forwarded-Encrypted: i=1; AJvYcCXBC5VADmhCAO6ooRf0oGnezlBuBpiUmifwkBMrAoat6EI3nSARXdELpp65Anlucc0h4ggsdjviGxPR8mD15KLFUW/meiVCdmEBlXgb5w==
X-Gm-Message-State: AOJu0YxswsEVEu7+C8fCGUMKOuTFpQaF8QO8zHOXwhHHB+VPEyFHwNLc
	eFm3ZmHkqwFMynEo9iDk+8rk2kFQf+JqOSp/Ehb+nG/HhUxo4h7h6WXxJHyh0geNAM85z/TadNr
	O
X-Google-Smtp-Source: AGHT+IHlIabr4uY5f6ymwX+qGJ4PmeSSEGNGNnK+82sLd5GTqP8sxe4S2CCHMad+L/kqLlQE0QMBcQ==
X-Received: by 2002:a2e:9913:0:b0:2ec:35b5:81ce with SMTP id 38308e7fff4ca-2ec35b584c3mr782941fa.32.1718654082758;
        Mon, 17 Jun 2024 12:54:42 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:5ff5:5bcf:651f:66f5? ([2a00:f41:cb2:a9df:5ff5:5bcf:651f:66f5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c8a2a1sm14790851fa.114.2024.06.17.12.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:54:42 -0700 (PDT)
Message-ID: <b7b04cb8-03cb-4175-8575-b56004e65775@linaro.org>
Date: Mon, 17 Jun 2024 21:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix
 hangs/lockups
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>,
 Tony Lindgren <tony@atomide.com>,
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
 <bc4892b7-7c34-4fcb-b4c0-e383890162f8@linaro.org>
 <CAD=FV=UuChPf0DH7aYq8r2XLCr7D+mbm4QSfthf-9ezvFeNUbg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAD=FV=UuChPf0DH7aYq8r2XLCr7D+mbm4QSfthf-9ezvFeNUbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/17/24 21:37, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 17, 2024 at 12:10 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 6/11/24 00:24, Douglas Anderson wrote:
>>> The fact that the Qualcomm GENI hardware interface is based around
>>> "packets" is really awkward to fit into Linux's UART design.
>>> Specifically, in order to send bytes you need to start up a new
>>> "command" saying how many bytes you want to send and then you need to
>>> send all those bytes. Once you've committed to sending that number of
>>> bytes it's very awkward to change your mind and send fewer, especially
>>> if you want to do so without dropping bytes on the ground.
>>
>> [...]
>>
>>
>>> +static void qcom_geni_serial_enable_cmd_done(struct uart_port *uport)
>>> +{
>>> +     struct qcom_geni_serial_port *port = to_dev_port(uport);
>>> +
>>> +     /* If we're not in FIFO mode we don't use CMD_DONE. */
>>> +     if (port->dev_data->mode != GENI_SE_FIFO)
>>> +             return;
>>> +
>>> +     writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_EN_SET);
>>> +}
>>
>> IDK if this is worth of a separate function, instead of checking for the
>> FIFO in port_setup and writing it there, but generally this patch looks
>> good to me
> 
> Sure. Somehow it felt weird to me to put it straight in there, but I
> could go either way. Do you think I should spin the series just for
> this, or just make this change if I happen to need to spin the series
> for something else?

The latter.

Konrad

