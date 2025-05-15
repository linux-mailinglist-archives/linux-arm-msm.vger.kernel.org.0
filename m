Return-Path: <linux-arm-msm+bounces-58029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5031AB7DFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C1E3B07C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 06:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF34296731;
	Thu, 15 May 2025 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbusLSGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE10296718
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290547; cv=none; b=g4pnohda9S59L4bmdaLsGfMQ3JjuRqeZ9fBLLEtl8OexcfIeQay4gkVHtLBcSH2dbj769ARZMsYAxkVZeZz3QEw6KD/HzzVLEkivxIszMh8Xyv/4ahEViJH/5U+No8AiX7Ur99d2pUD9j7VdZEYHdcrfK2MfwtpO80YlIH6MKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290547; c=relaxed/simple;
	bh=00AV94dG2ZcGMrm+oEM6uxQ3vNHzQbtkKeRhT356qXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnGFXfxI67OIb0IS2jHP4mnDqHD1ZEJtmC8rPSmk7cPKmKDu6ASvDsVNAEb0CGzBjpbjBhPVtKEq+dzd0tdhszXyOFNx6mNc1IptRvVQJAF8SdUn10J4mCQJ29eHEU42dBGfNcFJZIW+Q1qmuee4DcULseh/2Gyvn9TPm2gJ/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbusLSGK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3815415e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747290543; x=1747895343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=JbusLSGKsCJhbI46bt8xCP5o7FF3etKpBEJlb4xxNF8MhAUXuyfFzFMUTNZQh30ZyN
         2DSWcQJhbBqvk8nvh0m9mBD6MEG7nUKmyPozBJIB1wOCA/QXbjfT1iOfkZX1s+fCUjeS
         O4dHLiuXsfgqXncQb2StGCGtvJI7hTFam345LmmS+XkjLwitHI/T9YwTMXVbew3e+N+V
         8tDhKPKt7fxBphMcJceSD+6Newz6UwdkvbbH9ge8smtsayXyBcELyF14OlVoBdNxqO1r
         4iB+rSTcGiWnVFiGF9EYMcpCDN8Xkv/uKXSrU32tUp7Rnaeb+ncpAe+7wpf0q7lRS41Q
         8pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747290543; x=1747895343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=UlCbLYXC9KSjImXY/+5BTuzDyrdlLbJx0PD16Nz3wqWHFoQl3dFR5DV8f6nEE7bh/8
         OHm50Y+7p5jXEFuAd2rWfhLsRl0kZqu3cym2mVV+MfKAFVihLbGbuQrNH+f6ZuYDMxmm
         FE+6AZ9F//Z0NbiQ9Wkjg/nyjt5MthBCAcTT1S5oKpdJAcLWXfv0sFEcBD/v/TtBFQ+J
         uqiSw/lw8I4ymcMO+QfHfndiokvH63NcfYnALns4uslWudMGZR4wDvQZcBKzagBAyQ8H
         O5PWR+85iRgRGpHbJZP1Pg5SCRCIM+2iw2lysWmESokrpPCLRMOaRpmFYbdyOcJR/GV2
         1Y4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRQUTwMVWi5ZbIp3lqkHohOOs3MRdeLy9MxsAhKl2YDCh0rC95K4fQfSKl1UeTAy2AbNaabLCVYDmGWMag@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvGqSoo64laN5cnptbdBl5VjLfxBbkMCtYAzaf1t2yHAYqeB0
	3I9EfKJpMMCa1gq2dXcXcfS73HNglg3MyIVLXAbDR0bDtjrrx5ntN+/i6f2m5No=
X-Gm-Gg: ASbGncuMt1e8ONBTpUMkPa0+7HIvtNVoLNUweeGD6eMVmOfpw/HnEtZAVt43LrMhBW8
	iZ07VOugdJ+GIVt7R+yRC1fmBt/kunFWawN2dMQFsb6JVqRf1ZHAfEEsSTucYNi0a6UiQw+W43F
	IBnCqYLMsLG2gOYrQXRjMWwvlQlN0qX8coPuJ+I/BThsGMPkPmhwVTNvij323tk3R1dRnnEslLr
	K9GLPWHqtqhE3NPjL3XZhOIaNQFQTvA347qIZpXxz7f11yh0aVDabV/NIcXjxiVPH1Qhws/wxNq
	Oluvq1ZtGJBad5HqGJy4jbb8MPYmQm5boPomnmUlRfmMG5z7zXED+dpUVN15I47e3I5hi2WJDS/
	1m0y0xkIRO94i
X-Google-Smtp-Source: AGHT+IHPjN36nPIAFheoxSJeMD7QVqgCVlEcC9j4OaPSYI+l7JvLUZZ3UyCX1An8LX7/LhBBB/f7Gg==
X-Received: by 2002:a05:600c:6814:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442f84c7cafmr20169815e9.3.1747290535806;
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm58204595e9.22.2025.05.14.23.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Message-ID: <e6f8bf0b-4a17-494d-96c8-7384f9426ff7@linaro.org>
Date: Thu, 15 May 2025 07:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 20:08, Jagadeesh Kona wrote:
> Add support for runtime power management in qcom_cc_really_probe() to
> commonize it across all the clock controllers. The runtime power management
> is not required for all clock controllers, hence handle the rpm based on
> use_rpm flag in clock controller descriptor.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

