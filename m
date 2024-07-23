Return-Path: <linux-arm-msm+bounces-26897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC993A021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E7F1C22141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29936152179;
	Tue, 23 Jul 2024 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBN1Q6Mv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2A1509AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734989; cv=none; b=q6Roe+4o2gY8HmELZL21b6iS+wzZzsLXAxFkjs44ezarbVqk/xpgLEUpA9/I+KpgV/ffYPettqe9d/SAhdr/fo7ZowdokJOO7ThSNv0e8ZAJmuLLx1eoTgxtAFxgFHeAIOXS82EXA44jG+cWGETJgbUzpflfuqEA2YfNRzInMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734989; c=relaxed/simple;
	bh=EQ/2R7CnVW/41ExqLPRynM0nz+7yZlIbAonf2Xv02oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ors5rs+0D20NO+oOupsck4B37Y5b4sRTPx6QbwQ8E/SyZ8kOHPn31HE4ImLfIENO8j+rUtZPugcVYoRFMmIjKmNb8uHmu7GW0Vz94nTC4b9w3ffmKmnA46+vOfPWsNLavBaXRSna52ue3lHuYahVKbYY6ayQasy6qGWtI9pgbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBN1Q6Mv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efbb55d24so4363470e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734986; x=1722339786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qNV4SPVYDOJceI4uC3ZSm5CO3Vjxa/pP9tGu0hDGYdY=;
        b=oBN1Q6MvExdMGNdjZZZLRnTzq5qkuMEXT5zn3eMPLWoPdJ6AmmWQeCmflUg6g6tHzz
         eCmr3Wgqc8kx0lN85vgyxhEPc9YUUgiOt7ZQ9ZqhUCkepho0cb80XMIITmlh/JwwPg4v
         90IbXlnBen1H4c5o47wh2Db8A4nGewcI38di7E3070L5fMLYCSmCsP8cudDcmSIGE0uN
         +NFW3EDpGoWU1lVCZUeAf81yFiJyCyravY6LTx72xidwdd6L6iCi1J00DUenf2s+2aWA
         4ro+L7OXsfngQ+/PY+LQa3q9boSVT5y+waT1wyHud+ppYrBcTbz96qhyXTSoYN3OxgJD
         FRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734986; x=1722339786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNV4SPVYDOJceI4uC3ZSm5CO3Vjxa/pP9tGu0hDGYdY=;
        b=IX/dYzUz+mQI7aK02iH3AauMCbpv0MzIO8u/Gp1vpBVqpkOXIA859QVN0Gh3U7wuO1
         3RQj/ph5m2X8b1daKqCFMx6oGjj+spUbR4Ra8cjnSW5IC+6TbZ0JVGyy2ThUuIpFspjY
         f3MrKPxsulg5J1lIz3KBC381fBGZrG7P5Gnbl86zTjt3x6aBVTJoAL1cRenuICfen6oH
         EXc7b4RetnWktO/Wfu3dxbCM45Dxhzl8B7IPZcXKYgPiAuJ10/uge9IdxD1Zjyji4jVl
         34ZvSuTL9FZqBds1UsytB5J/Bt8ly1mJNdFa1Wh6kUHCzzwe/f/X4aBfivbF5XE0OU4s
         KIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq4eaeeTpJH1/W8JUUgQrPAKrWqMPzME/73Y/Is3DfIV7tKx/EhvDHpmGDbd2xJqKmWyEaoyfpA0pUj2UFxdYS2X2k2EF15U8y9Ev2/Q==
X-Gm-Message-State: AOJu0YwjDhF4p2X/SBgJ9KBesVpixZovWKLKC5xFESfPKVJ0QAr+xC9O
	ZP+M6VC/1PU4+kEqpEsq6LmguTk/xBmmId3zbKgqVNamEnAzFZI6IacA6YhGEM0=
X-Google-Smtp-Source: AGHT+IEs86rn39NavrG9rTs1cLDHFEyL54PTpu6BMueyoszMj29d5ZTv9gviYSc6SBIrVyLamlVaHw==
X-Received: by 2002:a05:6512:1585:b0:52e:7df0:9a78 with SMTP id 2adb3069b0e04-52efb7498d0mr8442174e87.32.1721734985348;
        Tue, 23 Jul 2024 04:43:05 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c91caabsm541615166b.143.2024.07.23.04.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 04:43:04 -0700 (PDT)
Message-ID: <080a6fc8-72f6-4922-9237-31d5f80928de@linaro.org>
Date: Tue, 23 Jul 2024 13:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8998-lenovo-miix-630: add
 WiFi calibration variant
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
 <20240723-miix630-support-v2-5-7d98f6047a17@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723-miix630-support-v2-5-7d98f6047a17@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 1:28 PM, Dmitry Baryshkov wrote:
> As most other board Miix uses board-id = 0xff, so define calibration
> variant to distinguish it from other devices with the same chip_id.
> 
> qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
> 
> Cc: Kalle Valo <kvalo@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

