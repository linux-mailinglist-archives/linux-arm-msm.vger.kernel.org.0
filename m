Return-Path: <linux-arm-msm+bounces-35721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7D9AECC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B39F1C21ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFB31F81B9;
	Thu, 24 Oct 2024 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0QQH0BT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBEF33EA;
	Thu, 24 Oct 2024 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789083; cv=none; b=Ssn69rpXoZBr81q8lGMCsZLpFmvk3ibetdPtbEiydEYVucqCFR/wYTSFGnIjIDeH7GAlycrBxoefgS2SKEj2vkZQ2A1snaLGgBKVK6+Ju/xe2mRg12EoL+Yr2pUoY0xX9k6ntVmWo0D6zJHV0kwTxOSmej1IuwlU4Nw6jmbNZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789083; c=relaxed/simple;
	bh=DaEuleUKg1ggoXcUynAvXgSXpQQ8Z/UHEb44wuZFahY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXAn+SLAJqKrJSciVSq936dvfP9OIYUXZm7aaqJh3ESAmii96xVEqpy85ZuuMEe0yVAUGcZirL3BixyO0jA30zXpiCyXTaT7CGxjL/+IuXZNVVIJaIJrrjatvp5yJAJrrohTk2voUWv+moXg13+DiyLbuSvyI7NVwtIB3U2l2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0QQH0BT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso126419366b.3;
        Thu, 24 Oct 2024 09:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789080; x=1730393880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS6kb44+YFufBjAI7+GWT4M7aiXaMyvLXXIQhL4ssOA=;
        b=g0QQH0BTpU8jp0QSJLDS6O2WFjJdFBaQmatiSZd1Lvl/g/PqoqZoJoXhnHpa3cjFy3
         A/1gABWVxO5bmO7VYEPvcrmWKFg+ao4xSav1RuRkLzE61O+qWqx4lTvvubIT4KLqZG+I
         jONtFwwaUbUa1w1u8xFbM0P5XGxlQb9Q0p9+NUuWarYDywadlfeZRKJ6GRgCnEiRaLR5
         7ata9NMMjFPDzj+f0eiku57Tow8sQvGXvR0bPcIkZNDaARQjVzSKTDB7spOuTOJhUznN
         F+uPwCTkGHpQyq2/lvJ/DCaUR4jr1P/B5Moo1t61H4HQkrk5ZHU5NQ4YeBNSHRqjAMgb
         dhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789080; x=1730393880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS6kb44+YFufBjAI7+GWT4M7aiXaMyvLXXIQhL4ssOA=;
        b=FRbSeMze4O+1lqzd4qmdVhkrcJLnOL5Kpe1eyiCGk3R3E+BkqpDGniUAperNeNIzKE
         Lrvj5AU441mrvwqp0qwgaYy8YdF5jrMVW/zukGmvFgfCdBdkB/qs2fkU+JieBnwKtYKP
         IfwAB1Fe1hSUsy4mucmdLSoMvLhhLyx6QziegIUVzuBCml9VXqjzuWOjesUymJjNBg9m
         n/y3KJbcLSJ40VTW9JAjQhj0oX1AVDgQsuMc1xE6zT4h/K/6+CrbSIy3If33Y4Y3Bb3K
         PUn85p5fmU6Br64IT17bC/wflnjZP+NykVk08KraKXtnVY1OH3Hiv5VawAYDMmPgPtYH
         NIMg==
X-Forwarded-Encrypted: i=1; AJvYcCUoPzVo49Qq3s9BjZh+r5kbTOz4Zp812H4REcWIJmZ+1BQU1jPf9p0S5EYWLYGRn0l7znsTGZnF7Tajadf5AA==@vger.kernel.org, AJvYcCVPlnPg3qGXp3d4hw+V6+PQHqfh/P+u0DncZItX5mJNU1IZwsn1EXGaU3Adgmpz/8xYC5xRsENyX2wiXklZ@vger.kernel.org, AJvYcCVrUKofNTdxjIO8mKdYjS9e6rWVYci7u5hkaJI5mH9qlTpo7c+PsJQ/4Q7+jeICrX6yNJbUOMh/QrAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4oTAUeQSBZ9ThkuAhcVcujecP8enlrkKZxXbaOMj4wBkUUXJ+
	sjpwyswwheE92SgLxsvo4M544y/H8Y05lYSiEhgTiGM7WE3eBhK9
X-Google-Smtp-Source: AGHT+IH7Whe+tpjmH0wVJXGfceK0wDizLpYJXI6lPAfaYHYHDJ36KwatApGnzK61RXVT8zNhXvk86Q==
X-Received: by 2002:a17:907:7215:b0:a9a:1792:f1a with SMTP id a640c23a62f3a-a9abf845e69mr752634666b.7.1729789079632;
        Thu, 24 Oct 2024 09:57:59 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e33sm643395266b.120.2024.10.24.09.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:57:58 -0700 (PDT)
Message-ID: <2a1342b8-ed7d-4554-8edc-d0ef99a9b223@gmail.com>
Date: Thu, 24 Oct 2024 18:57:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: fix PCIe5 interconnect
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak
 <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241024131101.13587-1-johan+linaro@kernel.org>
 <20241024131101.13587-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20241024131101.13587-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.10.2024 3:11 PM, Johan Hovold wrote:
> The fifth PCIe controller is connected to the PCIe North ANoC.
> 
> Fix the corresponding interconnect property so that the OS manages the
> right path.
> 
> Fixes: 62ab23e15508 ("arm64: dts: qcom: x1e80100: add PCIe5 nodes")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

