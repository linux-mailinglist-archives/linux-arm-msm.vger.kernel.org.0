Return-Path: <linux-arm-msm+bounces-87578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D779CF61F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 01:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFD86300530A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 00:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DA67404E;
	Tue,  6 Jan 2026 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j74sl45r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF61F419A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 00:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660904; cv=none; b=Pzc8XiO/aNy5PYxuuwbFZyehsanJ0XEE+y1003NC2jnoEmHulgx9uULAUa3ythkRBgT9wStW6ntmPeRYqO4mPpGtC6pnD0tGFzaR4o57Zlgv0O44NhHr/U5T6ZErjanRjEEvyHzQpaNYWLhGs3LjYdgdkwOAkU/uowhAh+iXOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660904; c=relaxed/simple;
	bh=PQyafS4r9bueZ+5O2gfE7pkljY2Ij6CGy5ABtviIEw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3oRQRZoEPc3GVbmnqwVTVE426J/RlYXn89IemyStnBx06CGsW9fbPHMF7fV79JKeim0Hy/i3F5eEr7EKd27S9WzGx8eQFJRVb3UO5kjOcwdFWWqSxtkVzlaHm3OjloawDzPQRNjQP7tiiGVlhgRheBdqrkf8eyYK9XwZ6DjPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j74sl45r; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-598ed017e4cso22538e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767660901; x=1768265701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOVE9Djm+VI8eLyAhm3qz2g6Vm8wktIAJcPE+KPknjs=;
        b=j74sl45r0Hw2JP2GJu//oOg3L3F9Ca3Z1cFUTdplW3DFzO0dlvoG9g1wl2t1wHQgKe
         MHleSD8rf6mAJvMVWiZnfO4DoWyiT+Np0X46+F5zL4F9jZqVZg8r9TbeBSoYtqazXK9K
         2JREz0Ytgj9g/0ugUi9w6HpNODusYQ7oHuBCYCVUoQ83WMP2ev3JDS8gSENaFgna91uB
         fvDUrZMDF4ynoXV4x9BAXwjs7t0YeA4P4tdN0adyVlFf9iPzZU6wfX+tuRxU1oVYXQk5
         mBXTcyud/Ph0Ehotf30JRDtPeJu8LkqyVg8cX0XuCdMAs+bxkhQG60CdPktlLlb3X6sy
         z3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767660901; x=1768265701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOVE9Djm+VI8eLyAhm3qz2g6Vm8wktIAJcPE+KPknjs=;
        b=tVp2fO/SkgXtBV/qpuruUuTQ0/9mxdGvLvxdpIteHD7QsZaHWmh8zcwMcLYqatl8ho
         JKGUGnk1LSrKWiJDCLqSyGIshSU+grpWm/t0mswfglacjwhBvKyafV/l4Af6Rv5PVdl9
         T6OGFaZgmNgQdapX2Jr0RBhYvqcjITfc2O3vIovo0Dwz19E5S53KRpEA0wm6DYpEjqok
         oPQ/Y8VNj1x4Zo5CVpCFuoN7aKTEU8bS7t2skqr02gnCoQwzK0Xwyj9o10znRA42XddZ
         9uOu/iYXLkhPLS+bgS6JVl1U+lvdeU8qoe9x44IKaSuOTpb+PyexYnguy7LCrF1v1+q9
         7eyA==
X-Forwarded-Encrypted: i=1; AJvYcCUbRQiiqaN57+X2fa5yBfQ6AqjOStWiy1on4moZ+qFu4Cb8JYXNRgq0faEBniuMNW8GlRTVBnBDd1YCVAyl@vger.kernel.org
X-Gm-Message-State: AOJu0YxYOcnY8Orqy0iw0opdk8KlNa6a3ro7htR+8k/QiI+BG8/kWSap
	K6NMLD/qFrLVqQP87Aw+WFAaNvIptQwkqU+Ti27jza/YDpXAFCoNoaoBuTdAxQcbkFk=
X-Gm-Gg: AY/fxX5Fz80zGZh1PumYMb/TxCDBqy1hwyB9OEq3mXc31XE+8MIPQhese2xNGod0f9W
	+Mdq0POI6WZs0Vd/TBt9JW5OPc6FkR4pHk26mTzvgosaHVI+Hw9GfzZHA0+qwhfYGa9Y7BUGSkC
	9ANxaCipiBLEdpUOs0QKWxVcvl6ckPk+19+DXWEAo19nFwnkXMJsUm+skXzQ/jSJb5yfMwlapn0
	1342K0J+ywLR5qbBaVdl0VTkaUt944jHHAbgRtoUQSObOFBgG5fWc93uSy2Rf5DTfirWzD0/SNL
	fz9Gm3WYK9LjeyTY3nYHOthT2RjngvFpBa3+UZh47JG7a+b0FLyGAKusaGWGMWZXlsZ5S9SYUYe
	ondlrTSizXdHLlm36Lpnike8KjIeGRbEA7AFAIAz86be/qyie/RgYb5Gr5vMYkN5aijCk7spl6Z
	LDOyx2x2yGorONDgNv3Hxfst+CiEE8DC5VeB8lXYpZ5d+CmoeVRl2zj0+4Oidv+mhTgA==
X-Google-Smtp-Source: AGHT+IHC/duOmQ+zt3AcbVWsYdFh+VT+t8MI6iZRXfzwdOci9FOkfNN1NdasVjBEh3f1S9ijpf6tNg==
X-Received: by 2002:a05:6512:3d0f:b0:594:33db:2836 with SMTP id 2adb3069b0e04-59b65261885mr297993e87.6.1767660900684;
        Mon, 05 Jan 2026 16:55:00 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea50bsm180639e87.10.2026.01.05.16.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 16:54:59 -0800 (PST)
Message-ID: <718f3a1d-fd55-4a1f-a9c8-0778a3f8caac@linaro.org>
Date: Tue, 6 Jan 2026 02:54:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8650: Enable S5KJN1 image sensor
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
 <176745617446.2631416.7464905538168539576.b4-ty@kernel.org>
 <v2ju7tu2cuedk6rnpidjrgkj7viz3dznwrlsu73w3ayon4mnx7@yacrjyyizhro>
 <ppak5acapxe2ih4cy6gjfqfftagpukcbtezeetljuf3ocaen7q@gnxdalhu2ndv>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ppak5acapxe2ih4cy6gjfqfftagpukcbtezeetljuf3ocaen7q@gnxdalhu2ndv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn.

On 1/5/26 18:09, Bjorn Andersson wrote:
> On Mon, Jan 05, 2026 at 09:58:33AM -0600, Bjorn Andersson wrote:
>> On Sat, Jan 03, 2026 at 10:02:59AM -0600, Bjorn Andersson wrote:
>>>
>>> On Thu, 23 Oct 2025 05:59:10 +0300, Vladimir Zapolskiy wrote:
>>>> Enable Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC boards.
>>>>
>>>> The changeset is based and tested on v6.18-rc2 and it has two dependencies:
>>>> 1) added Qualcomm SM8650 CAMSS support:
>>>> - https://lore.kernel.org/linux-media/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org
>>>>
>>>> 2) a new Samsung S5KJN1 camera sensor driver:
>>>> - https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
>>>        commit: 0ddb0d63453f320806727604702b6f6636a645c3
>>> [2/3] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
>>>        commit: 328407ba89ae6656c143967ba65465c50150aaf8
>>> [3/3] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
>>>        commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2
>>>
>>
>> Not sure how I missed Konrad's requests for the additional adjustments.
>> @Vladimir, please send follow up patches to correct the content that was
>> merged into linux-next.
>>
> 
> Sorry, it seems rather that b4 produced a thank-you letter for both v1
> and v2, as I applied v2.
> 
> Please help me double check the content of the branch, I'll try to
> figure out how to use b4.

Everything on qcom-linux/arm64-for-6.20 seems to be in fine order, the v2 of dts
changes is properly applied, and nothing else is needed to be done here.

The sensor drivers found on SM8x50 boards are expected to be merged into v6.20:
*  https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel

-- 
Best wishes,
Vladimir

