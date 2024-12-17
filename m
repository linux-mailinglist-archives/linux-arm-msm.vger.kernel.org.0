Return-Path: <linux-arm-msm+bounces-42495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EAE9F47B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9718D188437F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 09:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A1E1DDA36;
	Tue, 17 Dec 2024 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRpd96Xp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C91D2B11
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428297; cv=none; b=GOwXkf9W2Gnf2KKwDE8D2Rt/HStDLy6lixVpLHgCrI1rdIDjeHoEsHfSN+uJJKtcVMP3qk5OfgWcFrCq4oaOhXvjmNUAjZW0JsfJpLouKz82U0l71ZiCFJSBCHAUT7briGCk4ZPLX70j9qP202ag1iDmlaJIDN7yOv+6xL5Hit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428297; c=relaxed/simple;
	bh=kb3kP9tneB+GVEHe2feWWDmh0vqws9+suKVVH1/v88Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I98QaoFo7uC3GBQKMLqC4WNsokLKAPHiud921bse851+xdNa4ulunajeFHaqlOt+134HqSGCE/Bd2SyelZ+pbAR0yfmNQn5tRmuywoNPAoBEXwk0pgz7oqrpDJLgdYVniTVH4CFYvmJY0WD9MNJylcZvOqgzK1V01t0xXCy9uEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRpd96Xp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso34906475e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 01:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428294; x=1735033094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq5sZ+Fiv/wP7Onp2aVQfa+BtrbtLGAGU7hb6Q0naGI=;
        b=JRpd96XpZnF7KpYTnIWvBqeJK7CX8ZAvpdzi4dhvtffl8WsAcKYtKBsxn0RCPz5L8F
         UmIbquasaXa/5RM4t4rDU1rft2PKLl6t1Uiks4P+Xs5Kth8AxuqJzgxTkDqNzAesCcZw
         gh6fnXDyKA9APPiEEsTrJJpN6ZZUXG4TpP93P+h2e+JDHo70RRqZBoSI3kQlda2X8xk0
         akPYh4Bc3O9fh93gbIJ3Ki3YaOV34cZe38F6NDEKK6GvjJl1NNPJJIJwLfEBxoUp2UTe
         QnghlFKF9uMhj28fg76ijjWEn2zpie6uEByIKXnOVZfktla8GlchsgSzArCjBHzh1L9h
         /eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428294; x=1735033094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tq5sZ+Fiv/wP7Onp2aVQfa+BtrbtLGAGU7hb6Q0naGI=;
        b=TocgvrZzZQBuYX4VzAjQdC4wfHJYIRctGLgSW686a4CW+a6cqIGme/KDH6x/BB7Gpt
         FZf9w2c7t1gNBT4/BQdBjOktfDdZlNcdDBgwa1fn5PguL2RnM/YryX/lHahVR3TAqxjV
         5nsVk59xazefmUXd6uni6s4vsikdfZkeInPG+8qb/rvCqwJK4G9E3vQTHTOSsm/bnTsK
         kkcf2IcIbEEpVo7fJX53qHWFDsPSpzWFuQ6laEp1V58dHXuT+/OeEVEtkD8dHjodaKp0
         uDkFngyVC2h2qQlJFgp1lzss8PdSWau1fehNF3UKJ+lMgl9uR7apxyPfYjTnyNkCx1nA
         F+vg==
X-Forwarded-Encrypted: i=1; AJvYcCXfD0i4/VaE4p7yoCBxSePk+rodvd4aTNNNM82Gpqz0bDCa1xL1nTN3Ar1wd04bcFkPbJK/mg9llHSjgita@vger.kernel.org
X-Gm-Message-State: AOJu0YyBVRL0FvGtVOsB1MkwOpWG5JK7TmMNJGU5XYtjsctndfcHFOY7
	xJW1j1DeFIEES10BF0ZtxGMk517I7qCGp7LGcEol/7W8g6VjdpIueYTgJ2+m7CA=
X-Gm-Gg: ASbGnctvBupvaO/g2apz2cwduWEPxSfdq9f45F8Cv9n+c/nsxUVEAJANg6lyFcA9Iq7
	yCMIQG18KoV04H3KaFWMHwOZwDwWvlkOpNGwCwcd9DbJX+Rvg7TC+uJShUIauT1lMqebj/LzGO/
	rnjvuFmwo+NrmQvRr+yqhk+pCVuz6oxVTNqF2+dlaVhyiSx/bF6ilbGyUSet2sPDQGqFXDenxO8
	x8ulWNuQPKiGhGaCldWNFKUBUZ/uvdF8PftHoKHUlv7YADUZKxLK3C2LKBp5kG1REAF8w==
X-Google-Smtp-Source: AGHT+IGf3odSobzW67Hr2M4E4Qy568hruQO6sy10F4fQguns3CYgMLLwqVah+AMfzIWxgAU66q+a0Q==
X-Received: by 2002:a05:600c:214a:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-4362aa947admr142363025e9.23.1734428294427;
        Tue, 17 Dec 2024 01:38:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362b656fsm112454035e9.34.2024.12.17.01.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:38:14 -0800 (PST)
Message-ID: <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
Date: Tue, 17 Dec 2024 09:38:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2024 09:17, Renjiang Han wrote:
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};

I gave you feedback on this in v4.

Could you please provide some commentary on why you're persisting with 
this ?

- Driver configuration should not live in dts
- A patchset exists to mitigate this
- If you don't want to use that series, what do you propose
   to resolve this ?

Please don't just ignore feedback, either act on it or add to your 
commit log _why_ you didn't act on it.

---
bod

