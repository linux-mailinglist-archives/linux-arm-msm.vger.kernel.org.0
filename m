Return-Path: <linux-arm-msm+bounces-55172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF0A99482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 18:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF88A1BA5586
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35633279792;
	Wed, 23 Apr 2025 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6NZmtv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E7F510
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424632; cv=none; b=KI7CB09Q0wcP2t0POXRK+DOpazSrluxQHmkhyNXVGWuIh5RlZUJq6b97UuqzuXt1N0CYYDcUIuW1wvTY2kHMCKhq5/EkzoXMtpF2M9Yv5sD5aAdTRj0011xZKr9cNtvJ48zkRoEFs3W7d1VbhSK2nZ13HiBr2v4ziuEJdu+qP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424632; c=relaxed/simple;
	bh=KETMSnGNR3tbXWXQzryJPlirlcO9wJFz4VEed4/1puM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srpW5X7qc/Tsjg5cARoqt2jBJqCuCmk1wxobgq2Nkfp86bnLFchbHyh7f/g1Wnv4GdL7Wh2T+ziNHlJlww3quzvStDNyF/Dr934tToIUm5DxMvC4oZBKjZFueoA0mu8BGi7SZHFQxP/nWcSvmh5wLOgHwDTbuvRd8O0QW/UhU60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6NZmtv4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so7802f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745424628; x=1746029428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9dNm4Mv59VA3ad8rZ62QdUhGrrNxr3iS8eu+GOGB7c=;
        b=l6NZmtv4Z96kEhnOG1OPxcMMAUzPbZjSM/YmIsJ+I8cEqWJQjaOyOH/QGnzGvrIORe
         7RocmwZrpfS2IgokCqw78noiCiYG1UEQgyXxbrvMHZIRuGBQpteREPFFlSmhLLX4WymY
         i80b78GD2F9xKSwYMr1PyY9mV3GJ7BTKfAj189ZThZMj4NhGxYc88LiE4Xnmvixnr0+x
         ooeNNx3Ss4S7oFcZ6RYm0QTpBxG3aQuST5bEQlj0sxUvF0oE6QUiZjVz8b0Yot7M9GHi
         RGQ3dl4rb6fmqUVkSg2/+w/VPM7llPrYqd7j6EQt9lcMCZrntLDgBImE87FQ9PkA+djy
         PNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424628; x=1746029428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9dNm4Mv59VA3ad8rZ62QdUhGrrNxr3iS8eu+GOGB7c=;
        b=qCvurXoevzvTX1X1jGWSEyl2DgJib2Ff//D9O1v7GHNGlWnLXn3WCRvcGIGdk+xWsJ
         iNCb7DVuS8uBcWeuB5ib9Dwuelk4q49kMEeF5G0GnUek6vvsI6cr9AGh84Av1GdkZViW
         jLfDalKps5q3GxVPYynWaohG7IKt5JoqLbB9cmq4EpnFxrqAXj9NrLlT0iYD6NzG+hoy
         Awu2qztkzKlUTR/UFqXuUJiFTGYvGfIZ/52pwsGEfjHHkWu9tc0TPya/w+atCzwooh86
         U06ctDO0amISSxoH2ZSjUSseEUVO0xk+YK3Nx3aTbikPCAeQO7IIMcv3gd9pPnKjHT8M
         3k0A==
X-Gm-Message-State: AOJu0YzX2SrhyNRIVSVYE0aHuVK8b3fg0Te1I0T8TP4utKvdlQYLowFE
	MM1Wh8z32abEKBu3E9Vc0ZRvnpDUKIOXys3CL5BXm0EaHScT7BMYDlUNeBXKLPs=
X-Gm-Gg: ASbGncudKsmcNPa0nuw1RR+ZG9GhJNdV/DtwE9WDR7v3YH6rhB1/dyGx0hWYACUgXDD
	ik+ce6yNCEztco9vJFEO5e3NuFgVxeohKsvwceYxTj+/2XN9JOQK/k/jVueWohtK7z6WiXLc9Kz
	ddGbkVygGlfnegRf1dTuPSTmk9bh4nc2nXntAitXUgxsI5vwBGsm0fEWHzJ29xvNcnAIAzLJSuM
	YTCgS9NVIZ5/MiorfPV+kjk3YCA1HNW11GJ46dt1wpJDQQl9WQnidP+6J8MqcEvP8+NS/tOJyF2
	tSi5jK8Lh1uoyLw3d6d2Whgxivb7TK2sNWcsh+A8jX2ai+SFAbPYizOdA10e7/rE6YfQ6xavmoT
	m/DGkwS6WefSBKQ6F
X-Google-Smtp-Source: AGHT+IEiNUqHKXP0FOA/VJGdZhBM+aHyxLj38PvjBnyr6i5o89vS0cwgedHvIQlvdRJOfYD1dX9Rsg==
X-Received: by 2002:a05:6000:2901:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39efba398b5mr15909160f8f.8.1745424627758;
        Wed, 23 Apr 2025 09:10:27 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa3a1685sm19222189f8f.0.2025.04.23.09.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:10:27 -0700 (PDT)
Message-ID: <dd95bb52-291f-4551-93f7-a1f272baee7c@linaro.org>
Date: Wed, 23 Apr 2025 17:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 08:20, Loic Poulain wrote:
> Add node for the QCM2290 camera subsystem.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

