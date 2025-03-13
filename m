Return-Path: <linux-arm-msm+bounces-51259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392EA5EF31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 758BE17DDCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806762641DD;
	Thu, 13 Mar 2025 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZY9Cn0Gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0C263C8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857038; cv=none; b=M/keeFRbS5I00m/Q1xNKD/0aywjuhwcjzgb2QHAjfUewj8FpxsuXJKz66jHT6qjHE6kTQb4ZJMh6WIh1j/rZ1iflISsMHfvlBB+PCEURS2GdJif/yBvqCrmGyprZGjyH42NPDUhwPe0ssvrvwfDJ7biMFcd1VL9OjA1HG5TFiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857038; c=relaxed/simple;
	bh=nZv1gY6ezIhNopCsWK2xFniDLo8vetE0Mgdzt4JQTEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1TUUfMASwwPXYskglwz/6UbcZg0TirqTXJBJ4b48jx1dJoqmxh4dQDPM9cECCM6hmSd+VBJji+h5tDDA+4xMSGniTCrm82HMSmW09BOAfh5Y3lZKJl0iaOOj42whEmHnrRgYjWxEoqhOnb3vYFb/ALiQKE13PJ58lWeUJPMf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZY9Cn0Gg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so94061466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741857034; x=1742461834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOcPeBvKiZjYkNIOUDpasD383L3JOlEk8FFNMJq4prM=;
        b=ZY9Cn0GgXV0/XgNWanrUm/ARhc/cabcihUDxNLeTRB6i3hAedYxDOXA70A3I7hG9B6
         SFJ2bEn8YJWOvmsNsxAKW8Ao9HhTOJqTwSQ/kVwrNr2/Xv93v37w/Ll5OdBuwWTSCJ7Q
         Qv+Pe6j6XdduD6KgQiQwo/9UIcrR//W3+E6Yk80QmziyjPp6vcg20LGPrGOV+dKzsMDj
         71iz0t5S2fCN7MPlT3l/JQcPL0K0yvgkx17c7udH3Fbj5L9CUimKmPRUh2eniVHbZ5D2
         ZDRwZQaJX6ggP0qVL/hUYMfoMFbApFqM0BrnTHnk8h2gTau5cBYwT1zTXwdI401XatQI
         noGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857034; x=1742461834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOcPeBvKiZjYkNIOUDpasD383L3JOlEk8FFNMJq4prM=;
        b=fCvzJVeA0KPw1Aze2GpWzgVoevBrsLqmErLKa3NoEjC7qsq89UrSdkiQyScSqCXvvM
         TmGVpbLs9rq2nwoKl/25vErndtqwLE2vbhelb6IqYvIeSQinAmYO/+K1Kix7NDlywbqm
         hk8BwTzGhiTeqdfylgqIe/upEwR58Vp2n7DkF1/r92RSTXXllIUxWSCEB/qKQiMflh8m
         KsJ3b+ls9UEWhuPRMrwnaVTlGJ4ohFM/vvA3DeJ4wDqX/9ETU8/cIt/YbqGO/XXAn2w5
         hVGq99ta+MgJmN3fXBt4vwJdGeVArWlDdGyjONVkr/R0FX7LXkAXK8ScVpf5yIxG63jR
         CRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4ciTB9RPL1ckBKK4pHuVtuh8eS7HJR6XigCbyjLZwqVvznqLo4sZqO3IxKKoiyUQqojWy58aGqE2QgMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ZLggjffh10FrKA8Y4+4fVZ9lATp2WqphERETwLI8PZc5RC6p
	I8fgItwZtY30TXeo1lMZj1ZsQmTT47FzAKeRfPy8JHqD7iv2W3XLeRq8OYBzorg=
X-Gm-Gg: ASbGncu+4UD/KMwGKX6eSkSHttaTE5vghUVtNQtpSGbcaSYiFD5khZgCEmkhUqugx0R
	XaMliHUX0DLAY5VOSSmS6Sue1TZBJrL/XwcEayWAINDgMCAIkenY55CjsSxfTxHWvX1UzbQNZXD
	eRxmnjkPGLZFQONubItkQdfBxzTeyzA1x8R/PgmLaHlMeCiQzz5F2NgxsQ0sm6s72IVPz/gONfj
	y/PVe0hXgfUe8Job1moTZPHMEapXl9LnZ56gjjHohchI0MeU0K/xP+T85XCqBSu0GEjUHSGfh9X
	5YyW12CdhgyZUx/OI8D3AgYPmOmZ7/a+/r7KfyvZXbx7su+XjLDW1P0/WeMsoXb/KcHu2w7RWgz
	tqIJgiVmKwfdxCZmCCY8AhwstFsDxp/QGqZoxCjmgLUXxic3pa6Xe63lRBjVC8XeWX/1WadV9aD
	Cy0lMq5LiQzg4Epd23lPT+K8tEhi52Prs=
X-Google-Smtp-Source: AGHT+IEtFUT/HyU1XkKnojP30ZgkyrJ7wulvcnYb4MSah+etAKV8hZac0ohkCGy+frqkdqETlqR81g==
X-Received: by 2002:a17:907:831a:b0:abf:645a:df9a with SMTP id a640c23a62f3a-ac2525ad616mr783408666b.10.1741857034541;
        Thu, 13 Mar 2025 02:10:34 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9d13bsm55663566b.167.2025.03.13.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:10:34 -0700 (PDT)
Message-ID: <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Date: Thu, 13 Mar 2025 09:10:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Taniya Das <quic_tdas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2025 04:39, Taniya Das wrote:
> power-domains = <&rpmhpd SM8550_MMCX>,
> 		<&rpmhpd SM8550_MXC>;
> 
> Once the above change is incorporated, please add
> 
> Reviewed-by: Taniya Das<quic_tdas@quicinc.com>

Why does the ordering matter ?

It shouldn't, right ?

