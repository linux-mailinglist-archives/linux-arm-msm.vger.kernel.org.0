Return-Path: <linux-arm-msm+bounces-88421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5FD102EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 01:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F2423006AAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 00:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E49158538;
	Mon, 12 Jan 2026 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFdlI0x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996326F2F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768178080; cv=none; b=Qb16sbsN2ICxI0modYtr5hhSQxYF7/Jc5PXFfcpp0wbqN/re3tQL+9rBz4fZLP8d0Hp4QuNmjnao+0qnkkHqoDJjiUf/iXEFnmUEnHjg4x/5ZN9CMHS7wY2qvs1letlXvV2V8VGwduHi3Y1X2koaaPwlP5OmN1s1XmZMOL0uZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768178080; c=relaxed/simple;
	bh=+FgYkDoXLXwDLS89Z2WCD3x1bFk4ycg4ykdZSedctBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR7KOmXpWpmsolSQeTzzl4ARMHTEDMlB3SeOEWEYclbKK8ogdetGnpcvKel8r9dcdWq1VGdNxPiVt+rE4YN8JR3ZjATLthZm03qmqaLiAyj9xaNvLnixWYsZWVCAPV4Lvo3+vdOMr5i/hnF2eCoVyDznOzlbw1LxRc5kFI1ALGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFdlI0x8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso46946335e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 16:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768178077; x=1768782877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFVEfSikl3v/pz3ynBdmhJW4X8roL1IZM3tSP69lPp0=;
        b=mFdlI0x8r0Wvwf9bqXA0jaETcVXpL+9MpKN8k9T0d4CNmGZ6tQtHZxuG0qqHGxzFdi
         Q6I5p/s/WiAf/JRn27b5DOrRTewsIfxqK2dHk9WIXkWzVzMmsaajr58Fk3adTGM6l0Fe
         waY+r8ucyNwySx9DP/Q43oe/4iaAXy4TZp+0xBi5j2PJW2b6Su4bUSbp1g2eT5RQuwiT
         K15GMADGuUKrQ5+qeIbT6EHmbvOJtdRydNIOD2YooYMUifZhJU5ZGM+0iDNdKKH9Cs8N
         3DlaiPnwoXS/gEkOU+Cs2vHHDHaoJUAnoOlHECTf3sxRol0kSHURFFVgpN9uviXBxZez
         ehUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768178077; x=1768782877;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFVEfSikl3v/pz3ynBdmhJW4X8roL1IZM3tSP69lPp0=;
        b=R90kEueBzHYBDGQMtIhc0iyJNOKqPKRozjewaMGx3klS8upPw1NBRYtJAcoQTdwPyV
         AIbrrMYSYLVzL9bemqPtSU6vmBojoxj3oxNEUvfvYiDlDPeYLpNyk5vtArdiLvS8E+Kq
         fGClxFSZvCmDYR/asWCE0o9/N0PiUjfl256+Y98Zc5PUTTcijuPFSyNC9VW5gT4XV9FW
         ovb2G0bCZ1J/gTuq10loI+KI8cYeE8FxH8TvRKPKQiVh9tES+bWekPHqjUS//K6W3FP+
         KfDfkOXV0JWyN6dg/AyJcPHRNz5S5G4fx2Aiy3B0gQ3iJ2ThbgYPX6Ymn8Plll876l4L
         Rw2A==
X-Forwarded-Encrypted: i=1; AJvYcCWVhNsDpcZQPwYAbqYJQKxT6yW4k7CiUifl3m0s/NKt7G/p2DE+RUiKPWi29Vzgn7ICWCOviwVhXiRgzqIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxazbmcjCgJfrN2ZKqbnV1W3D+lY6+jAfT1w4gEWnPZnceC6q1O
	z5iCJkoNSN3dzZgFH2B89p6JlX83B2YdrpXt6cSoiak/dJiSYQYKlOQn23CEI5K4n4U=
X-Gm-Gg: AY/fxX4VNz2nsvdYBGbwI+neDTgxT4G4T78Y+oyI59gutZ4uas1r82Q58nPlxaAXDLf
	I045BtuJDZkXJqh+jqFHCVtNG9MQmJDReegfOT0eq/2pp3iIhukiOT4noTN91eAuwQZIf1IwzN6
	6M1BVRpesBiXA9eaICDArdHavNGQ7PLIDJfLOwdCl8iYPZ1AE1J2U2txv3M6M1RH4w8FnqD7gL4
	9sLLNRegwnavssWlqHBzkREOE4quBoFuam5QfXYzSYcBzhwL618rvq+UBLPx0CTMCVEcDKm7t36
	KO3VxwpoWfsHMoIsfO+LpyCKFleUfzG9Ps5bkp8EFYyl4FuLknkx1/unk+DDxHoRAfmYyi6RfT7
	Ai81fLmUejwJm1RD4GkB+sGgGQyFBbLLdPWsFPpC2JZQTjHhk4RkR/SQVkQRGLNZrVeAb5lwOJ5
	LzyqgFn7MYzvDO4wu52shJv4zW+KKqvE5TKpvDUpOd8/w4Wtcsgl52
X-Google-Smtp-Source: AGHT+IFFzw5ft4LZJe6ydEq5zg5HsTSxL9hjWAIenS++3nN0gcfVNBWLGgF42nlgVI5P7EBGrxlA6Q==
X-Received: by 2002:a05:600c:4747:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d84b18a7dmr225507215e9.16.1768178076499;
        Sun, 11 Jan 2026 16:34:36 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm341711595e9.13.2026.01.11.16.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 16:34:36 -0800 (PST)
Message-ID: <63205098-76fd-4a85-b7c7-c0ddfd974693@linaro.org>
Date: Mon, 12 Jan 2026 00:34:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-2-df8469a8343a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251222-sm6150-camss-v2-2-df8469a8343a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/12/2025 08:28, Wenmeng Liu wrote:
> +static const struct camss_subdev_resources csiphy_res_sm6150[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy0", "csiphy0_timer" },

Not compatible with your own patch...

https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

Dropping, please rebase, on your own code ..

---
bod

