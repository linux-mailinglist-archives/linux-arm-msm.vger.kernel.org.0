Return-Path: <linux-arm-msm+bounces-10543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFF85060E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 20:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B833B1C2342E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DAF1D696;
	Sat, 10 Feb 2024 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Md2XEQjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B185F54D
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707592293; cv=none; b=MRuevg8M4c6LJd3/iXWFy+8Z3oVBmR4F/DwPkfmMaz2lm2sBh+sw3DoBE5x4iBtQncH0GD9mzbdkHoqGkM+LmVuqDtGyErE9tK8tW4uzCzxwgI6RI20R0Ay6tb9o4bfVQMhl2uD/nQaVeOQfVnXIlMGpttrmq4hm79+Bz72iVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707592293; c=relaxed/simple;
	bh=x1GVwGorkcxO3IafmVnsCPl7EfeQZAKgg116i67uWXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShhISHQ/zK86hQaAcFHNMJEyXC2SgCynQbW6K/TfaZHirFc0hcMqvpHowW02xeyeU0VNJ7YQaUmhrxvI0xZvjg+wtv3zjaWXNR5QjimsScODaWZEaCCqhUPD3w3KrLk4Tg+iwfxIdLoVxg2//Y/8AIauZVUXGaQXPpfwOIFmC8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Md2XEQjR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26fa294e56so269066566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707592290; x=1708197090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEw2EnFXzQVU2p0mkCDlT1t0pyChlA/M+u/ewTeLVg8=;
        b=Md2XEQjRapgSam1RkndwtnhBIv3IzIxZbgnC0YMxB+jcEEFtTgf5TE0OMNTSI2JuJo
         racZVqE0L8xlygRZp24y7jq//YWoPoBPRaYJ+f5z5IxexF80XGsw221ofW335/mn03gU
         cXuzf4/pFgkZ+0MpKmW4Srtm/0VJgk6HEG+TQQEK+nthppjoEsczu+0xpoOvV7fea6I7
         VE795PiSP6a2tO/v+Cz9OvDcLlM8LEycyvnJW/phATcQhSIweORRYivp7ZiR/XCTTUnt
         NbkcRLzWO/pTRYo4WS7eHXUasK9bjnUsAukIMYE5BPa9z+9FRl+vcYAzThqt62a9Gqk2
         tOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707592290; x=1708197090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEw2EnFXzQVU2p0mkCDlT1t0pyChlA/M+u/ewTeLVg8=;
        b=w6HP9G0ZYhAXsmNNZ8ZPqMIJponzgoxA7MKfCtvgKnW2sfwbB8+b6PGsP7K4qGRSUo
         PGCJHVzTKN49JhgPr+6J1qHd4FBKRHdOoeL+Ba7SeSG05VS/hjv/yQTzxhzGdo3v1HuT
         o8DVf8Yw1epNPlFufyxC1sd6KXgpswKJP30KdWVdYhdqyGkRudWFOucO/TVE5YiKwKfc
         MBOqPq8wYjHqO1+vTSxAw1IZYqL3Yuek1UxdsOx2PPQ5nV1ty76QgbV7DnCZ1FIwPfnE
         khw7nWxRju5H8MOee+ekCUBeZaoZse5LK4+uKtpmN+YipImfpNXHiBAWRN4wT/LUSHRg
         uBZg==
X-Gm-Message-State: AOJu0Yxk+hoCNf8S9epc2XEBhWD2psVdblFMIjS4a3MgIOzXP1Xav0hL
	VCVOxUUDZ/MehVIduiyQGFJjoUiNFXJI2zxY+E3ilARaClCkz/bEwe3OUzqOFq4=
X-Google-Smtp-Source: AGHT+IFQ1p9zAgzQOUSwl5Ea/XO5538HhUhx2MIaN+c3CTo0bUpLvWYiCGb3EOZeubpmv7KdMb4Lpw==
X-Received: by 2002:a17:906:552:b0:a38:a174:1316 with SMTP id k18-20020a170906055200b00a38a1741316mr1910684eja.72.1707592289981;
        Sat, 10 Feb 2024 11:11:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiJrRAZbBqUDXJFWpkO0i+fsugtySrXkHVf/nkA66ymTNKN+pAUOFFjIqOwqSQrW4Oo/XrD4oJrk57DYMRjQC+gnbAQEvqZjIIveR9HzZw0qPE8I3EPPVIa2TT+7Di84fhT15I3NWIyknWFqblVVNW213nWW9x4j/KrKlhmx4QHbsMa+cYuiSnJB5MzR49nEC89AC1sIdBOROAko1SAoyG8tJdKkbW3njeLWpbPKKlAGYVsO0oesYed7a16kvV7/FPvplr8xO9Y+ud97ZONsUCfPNRnRcjpcfYiUi4QiDiKennm/kYxlyVZrPue9azFrCtZyn9pa9OsDe+oiu6TUf2nplRKErDDzCFzIKTUWCQJ6vl0vYg95nNyX3Sqb42puIfs6Kw6V6VQPFbf/wd11a54EwCpMGlM6dLQvxx
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id sf5-20020a1709078a8500b00a3bf0ab3f2bsm1789963ejc.21.2024.02.10.11.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 11:11:29 -0800 (PST)
Message-ID: <9e1d7e08-ed17-4876-91df-f05529184e58@linaro.org>
Date: Sat, 10 Feb 2024 20:11:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: msm8226: Sort and clean up nodes
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>
References: <20240210-msm8226-cpu-v2-0-5d9cb4c35204@z3ntu.xyz>
 <20240210-msm8226-cpu-v2-2-5d9cb4c35204@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8226-cpu-v2-2-5d9cb4c35204@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/10/24 17:28, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Quite a few nodes haven't been sorted correctly by reg, so let's do this
> now so that future nodes can be added at the correct place.
> 
> Also at the same time, move the status property last.
> 
> No functional change intended.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> [luca: add more text to commit message]
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Due to the nature of this change, it's hard to thoroughly review,
but nothing screams nuclear breakage, so:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

