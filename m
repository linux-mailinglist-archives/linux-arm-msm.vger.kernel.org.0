Return-Path: <linux-arm-msm+bounces-54727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F196A93606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 12:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1BBA7A9413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 10:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858C2741C4;
	Fri, 18 Apr 2025 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFWIAJvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935626FDBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972144; cv=none; b=bBeN1sSmuJ7Bc2R7EqhvG6Py6Km6eGKE3ldIf7P6nthNs+A6hLZYBSbhfb70zRKCjP29Xb69I/ve+lvpTZ6x1qWCwqwd//l1oaT5MKYvur2NWmKatUY+dU03dyqieN/0CUcbnW7NJmt21+ciXh5OcU5Glh23ZfbLwDCquyPKD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972144; c=relaxed/simple;
	bh=PXjUbokpUcI7LlH+tMOmZc96wIGbaznXSlWcnx3/Za4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrMxBIRrzsuCNPGcEpUtfiVfGSnRUuFonRcH+13El27oFcLRfeVsqAKQpNRS+29rc1WggdKpgst4/EBoIlMMEWw29gnEoB8GhtXWhJSKnskImEYe2v0PsK9DMBaO9v/7BKu6O/3bDpJftcw30fdRRD5Xd0RQCF8nNCi+YD3ZSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFWIAJvE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso16273025e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972139; x=1745576939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=BFWIAJvEgNkWTZJrQwsOWWqaSmPJBcRta2Ei8DZ2Anq+hBHFa79MXDdug6IIdxOeJ6
         RVfbOfMRXvGxkHbvZ7LwOV7hupUsvf0ouOq62agRNUlMac1jPWJqDm/R52qy2N0nTBGi
         fwczznx3yIQFYJBtMbl1ztcxQvez0HTntx1EueCe2P9Uk+0olXQWi9tLhjrteQh47qit
         O5rD/yXhvObBnJ6xUZ0bNSCcTtAZMfHwOpHGafd+ME0rPcyAfCfRDR2i/TGSVTnqUV+f
         KN2cBES9xDKsAFd7JqK4nycou3yPuI8L8Ut5HnCpZs4QLF8z23j3aZksKZJD+4YhH/6n
         L/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972139; x=1745576939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=VLpOMuhVd9uLXURUvSE4Sgiw2U8GCBnucxoogXhfZh3SikvVZalDnE+DXbO1dVbWrP
         I2KiATvIN7nDKmIY2/uIFvpJHIarjKKgu+aaDusq+LvqXQ2eDxftMPXyulkihmH7h7xw
         nIeHx82Xos1DAfe07+T2Fn5lrslJDtpVmVvR/0N8qirCVF5OeTrc/lypbpfilBKfDTu+
         LZZZO6uIG6Efc3fVZ8vhWxNNFRaFkPxKer1KBTGxvRW3PAhhZE88kSfYaHFd1cZWINSM
         7pzWOu96sG9LBrXbOOb2GvJx31uDrhn1Q4d0A6dxbIL+bCczGqXRah8rPjECmkuBByVF
         wv1A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Lo0zHqj5/Ls+5lqUDsf9txgydLRUctn+sQfJBQ4uIw82qRqu+S1hOJFiBbtMBvUpdqMI5oHeyAUKi0ZG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+syDtnD1h1W9niwu1ZTEkttl0CoadWw1FIclRVK8RyZMHwO9
	FZFQN/2pf6IfUSEJmBRntaLZoajqUV7BHmvTDtVWETJL4HPT/X95r46yFzgpUJY=
X-Gm-Gg: ASbGnctySNJHjbcwoDqR4Hhk6c0icETDgXGVcJogkvNzbZiQVvD6B+SS1JKiq4KvH5Q
	tya+bExXoqkWib+TKXQ2q6m5DXGcyfnl+NCYyq/JHSvk73hMIYufEEDJj4norP2e9OPtMd31/sc
	JR1kcsmBOeb62E6P/uTmW9ypXuQQ5QgP6PJzCypyvEnFb3qtbhis1sb+ofJ+sPo7oxhGTKjjskA
	7ki5wo/Ygw7o63dI1l+A53m+hFr/ce5D8VNkIgEmQnPvFmpeWkXX8qzkeRh9+jX7B8YoYiE5/fV
	7ZeL8rBCzHFhmolLtR7lgAfhLI4M++hDTbeUvVwNPJCN3DrQSVWVTQMlWOOatbAyg4nO+dr4gJB
	LVVblZA==
X-Google-Smtp-Source: AGHT+IHJxlKM+V9zjxNju1detD9GdxRElBAn2xumwvGV5gII8CVWfwTLrPeirgJsQNjdQc0gV17/RQ==
X-Received: by 2002:a05:600c:8508:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-4406ab93c98mr22161755e9.9.1744972139340;
        Fri, 18 Apr 2025 03:28:59 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa421c79sm2337770f8f.1.2025.04.18.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:28:58 -0700 (PDT)
Message-ID: <ed3f537a-ac1f-44c8-952d-42a5d83c3a69@linaro.org>
Date: Fri, 18 Apr 2025 11:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs8300-ride: enable video
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 07:28, Vikash Garodia wrote:
> Enable video nodes on the qcs8300-ride board.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index b5c9f89b34356bbf8387643e8702a2a5f50b332f..87114a349fedd80296abaf3d2f5f284b5adbbdfe 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -285,6 +285,10 @@ queue3 {
>   	};
>   };
>   
> +&iris {
> +	status = "okay";
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

