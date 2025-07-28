Return-Path: <linux-arm-msm+bounces-66872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA7B13CED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BC6172483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAF952F88;
	Mon, 28 Jul 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZcDYfv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57126B0BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712157; cv=none; b=rXw3omIgV8lZs7gw2+4WNKmDwwOnXncdaykn80xTCR4vUMnWgb1X6hAej6xde/Z7mAVbrEqlttXSAA80eKNHaBF2AhYnsWUEMsM9uAINg7KIxOrU5fP3hIHc1rR1wTr0N8rFbv8gpUUTl8mxh1JsNphb7+ZDYWvG2IXaWk16fK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712157; c=relaxed/simple;
	bh=jBvO+LGBhqE/ZtUi1WtCmXwaYi2oY/wR656ALdWYXLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLqd+YjPEQ9dDU10vFhs76YCf2Pvv8B3EGPVvWWjs1ii0LehA64qDncbSFGBGK24cnKWxpXSBvhmn65fX58QNQA1RyS/+e1TMpxWFPGR2fL6H2060IR0qLztEoyKxE4eWIft722TL1ZUpvASF3Kkg64k7WpXphKV7SIPXiBFgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZcDYfv2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1065440466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712154; x=1754316954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=uZcDYfv27Ljxwu17Bw3FiP0sF5BjqFvDTNy6rm49vj6002/fsukH2qLjiRG4PzMJzG
         Pw6Et/OHsa7Q3GlpBgcC4lyW9iennXdB/C02pAoSKqGWI4ADTuy/pRe2+U1eBcXbJPER
         LVxOGO5sY5DU6O9QHXu+wVGaOsvKizgmppB8+kbi5QAcorsbHZT3Im+yYEPOXTWkOS12
         J+f60FGNTaagGpdLCnWUu3Dgg50Fz+9R5F2r4nPLKJKOR+xO3vyp94HEDoWOauojbQT4
         OThBp98FRd/DIBeVwaBaaFn76Gaw+tVAqhm8hfr1JhR0mBfyK/cb/29ZF9s6d8UOYxvg
         bGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712154; x=1754316954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=nTKP3vjkSUJ/wRB76Ph+qJLeM4H6G0LfDtsch2Ai1Ws2UHn21H6K//fiM9oouK68uL
         SJgXaJkN7kQ6o0psHjo3if4PtK6BR0G5pyLVjZB/cs4j5OZ2cXcSCOtiO3tFeS9ms6fE
         KYlVr4LxSO4MgVm3p0XFocuhQKOYAHG9XrkoAgqGwvL1CQGAP7mWPlHfxiVMwdMTGTKb
         Qhc9vJL7RXuz4syiRnPdVOjy4THDyDRxUKmNQsSmFSt4/aCnMnySXMxkl+JNJY3dS8TT
         dQ8NVgQW6T+Knt+5GUwvnyVkK3EAYanI0k5PgwQ1OJvywYfS70yvitfG4IShBRg1U0B/
         GwHA==
X-Forwarded-Encrypted: i=1; AJvYcCXyR64HppAAc28bFv+ocuIgkOylOtdSiZY/drjMhhGZUS2ePp/d5fAC79j5G2lIZq1ySi3czAvdIW81iv+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+uCu5NscAaB4UiexQ9DOxViHY9nhWvMzq1XvDeFrdRLFeoSY3
	h51DUpKcKQBj3qYGlpG2Q+O9Aj7QkUTn07rrCqwFg5Y6l6+Euofzxe56+Gx7TfT9fdE=
X-Gm-Gg: ASbGncvo/pqKg+7pKoXFhxc9gxemFNwqd7Z9udRptXvnsv6HLxKbFHPUk2MhIJwfGYi
	UphvvDrHgRzC3oMWHChK2R3p9vdqvgyTr17Onh6K3Rzp6FecZTkRbfrvN/dRifSJ7psh2YGrujR
	2km3KBAOw+kJE8EQw/EB4o5nywqP9Xs/8GhUFlqFl6Ml+hDszuVufGH7YImTwLz2k/usqIffRos
	hHWNP9ve+n2IDoykKDCDS7twRbVu3uvO/r9I4ZOg8LMQpFvfJlMyeyo94bKzzNS8ATg1pzPgsNm
	y9hj37+TuZtgpz3KRgcHJCNLDAuqH9kfIPxwK+lH+vhPJiSXx+SPXnh+GPAC46dw8EoOxE7i8Op
	tL7tSch+UGrsf7EIOebH1RjBHm1osuTyVUk3vpX5AWc3KkMhGnejnujswUZmLFYTmyMwVzqAkxw
	==
X-Google-Smtp-Source: AGHT+IEbup0WGzQKdd/SdReGqdXO/wPA2vfo/bvQOhQ0kc3j2Opi6K31loxxw0o1vQUzbFcAu0y+0A==
X-Received: by 2002:a17:907:7216:b0:af4:20f2:2dcb with SMTP id a640c23a62f3a-af4c242b969mr1664623966b.9.1753712153796;
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589c8ffsm419726066b.34.2025.07.28.07.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Message-ID: <48d78f51-c094-46b4-a9af-91a9d855e296@linaro.org>
Date: Mon, 28 Jul 2025 15:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: qcom: camss: Add support for CSIPHY QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:11, Vikram Sharma wrote:
> Add support for CSIPHY found on QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Give the commit log a bit of love here.

Please add more text.

---
bod

