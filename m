Return-Path: <linux-arm-msm+bounces-69540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15054B2A0F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05E6D173CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7A31AF2A;
	Mon, 18 Aug 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruHDkvsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65532765EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518230; cv=none; b=iqb7aeF3CUYx5yr2ynG+hMRAxDdImuZMvElYsKQRh+djXmv95LrU3yeuLis2CmqDNJp3ihzFSO/LD9bRlimweJqKV520OaY+RnKmIxhk4GQXCY7CMSxIs9urSteHp9FkvDhYRHYTQ5LicNhDXiSnA0/NgUfVw3ie81Q/6334Oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518230; c=relaxed/simple;
	bh=d7klSJgcVJxKzgWS5Ztl/bfKJb1MY3zmqkRFuasnQno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVy/+Fr/Q2Kscoub6HnDE3d+gS9u0bjROulae0aHnAt746+HDC7OIkNRDQChk7V6eIAqUbsbEjPEmVWrpYjbTjvdPiAVOrU6dsMiw+DxfYyhUiWhCY42jBAJOaQO4ImUT6QEOiRMWRMCYLHTqvTN6Qvk9m9alu2W8mi5dQNMVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruHDkvsM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb79fb221so52913866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755518227; x=1756123027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=39WZqPqR/1R6iPJORmBOWelC6kAqE67ZSJBuraK6tpY=;
        b=ruHDkvsMx1wp9cpq5MeaKCyOWdF15RcWvdgon34j1fTaKtQ8CNDoi6ByEXem/TJ8Ae
         Irr8sDQ7UGQimJg8cxiR3zBVF2o3KktvWor41LAj9bI5pAWe9gbPBRKMrtd7mu3H/DPD
         ard/g8vrABiVXms2oLdYSs2Tm/R5B3v8/ueCSk58aGaezka6uBnmRxzFuOa6fChg05rv
         qdPqKf1tRFyP5V/2YBH8MqL0G9M1xbXxmKZz3LEucqrP4k99xlA8GRy2dr9e9pj6wf/v
         dVTz3x7Qgg7ZjDXY/yhOE2dNC2Fzg2et26mH+F0sGYGT0Fucais1BJJD/88fxcIxq6+m
         34Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518227; x=1756123027;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39WZqPqR/1R6iPJORmBOWelC6kAqE67ZSJBuraK6tpY=;
        b=qEU40yX8PUOC5P2Zp/f4xaADzZAIjN5HjOTPmRB4xqT1vACvQCX3pbfI66AH8fORnn
         ST0x7ETVmEC/Z9uaXtBW9xmVOD+SfPiLITRhVCk6BmsABzKfryUBij7UnCHrgYxTQIo5
         s9NiuMZoanL6tl9brRp3oL4X54K8xl5WlD7Ykqrx56HJ5xbQvH852QI2MWmNLGkMZix/
         18W7dtTq6vgisB6wcttHZqR8usfOJK/6aO0spo69XiET/bLVLvBdB8ziedpBORwYxo6L
         6tyJ1qY7wqE8vhNrubRVSS92KPffXlptkKaJAU6qfsJpZakqMUMMPe9P6UBWU6kqomfW
         RKRw==
X-Forwarded-Encrypted: i=1; AJvYcCXKVT0WyZ5+XVOnjytK/SrWuz7JL393HMog6mF4EhVXBZ8zr76qfVELZaXnFvdwVBf2B6dsbW5UYUTNpj3x@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtdoi/xJ9LJKxaX3zH7ZHHrLpPK4ave+f/rfu7HYoUDqm/0ve
	LAlXpLwseVrkZVhEsMOguqP3t2/lzTGNPUvh4qudl9xhcbEsVtzZqqjLeAbQFcytCoU=
X-Gm-Gg: ASbGnctGYWFYHZKFdMOIeUATu2leifq0QBdHjH1D7AGcOQKLPu6rJGMtn2eY5UZ5Tsq
	ljExLDKQ2a+0FJTNwzns6slvZuY08trHM1OPd06smqxyHo2ECnytELkygVuwgqHZdfjgyvXYED8
	W7/HGw5Dj5qZiLLZ1accY8EsBxBOEBrOcD3wTTNPnYsM2+HP0d/rq22LBPbrZz/Nf2giVOVuAgm
	bm/7mRsR3yK9RlJSlafrKfr3oxNre+/YyIRAnS/XwohHLftMhkQ/5OGeSTQdqQDCeA880i7eARb
	tpI36VsEf6VGfvFL4mlWhQ7FPDLh26Y7BkNkDktiLJR5X428xo0dzb3fB75PAEmTfQH2HAmNfQm
	K26vpGVIx7vBMQ04bRwwa8g+UxzYXOzhKhZn54Uvecu4=
X-Google-Smtp-Source: AGHT+IEejkix8VzrIrmaKComZ4B/jQEUWjX/m34wQQizpIs2LiByMrfk2zkRxNKTBAfYmPx+IOePjw==
X-Received: by 2002:a17:907:94c7:b0:adb:2f16:7ba1 with SMTP id a640c23a62f3a-afcdc20e1b7mr535947666b.6.1755518227273;
        Mon, 18 Aug 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cfesm776899566b.46.2025.08.18.04.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:57:06 -0700 (PDT)
Message-ID: <36997dea-19a8-4242-aadd-ad52e0a63cce@linaro.org>
Date: Mon, 18 Aug 2025 13:57:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: qcom: audioreach: add support for static
 calibration
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-4-srinivas.kandagatla@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250818112810.1207033-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> This change adds support for static calibration data via ASoC topology
> file. This static calibration data could include binary blob of data
> that is required by specific module and is not part of topology tokens.
> 
> Reason for adding this support is to allow loading module specific data
> that can not be part of the tplg tokens, example, Echo and Noise cancelling
> module needs a blob of calibration data to function correctly.
> 
> This support is also one of the building block for adding speaker
> protection support.
> 
> Tested this with Single Mic ECNS(Echo and Noise Cancellation).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

