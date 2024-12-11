Return-Path: <linux-arm-msm+bounces-41574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EA9ED91C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5F216211C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9071DDC29;
	Wed, 11 Dec 2024 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0972Ano"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141F1A2872
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954155; cv=none; b=PDk4UAkT81xp/+WFJn9R0Jr+tcm2cPMXrIRTR6aUEgnFcG+qzjDUG6bgUnGJvxI9uAsmd61SWc0nhOG1AB4qH7QR7dL6+cTWdFhlqg7lGVEeOqFMMlD2IPe3Kivs9v07BfJiatmjIFrW0I5YjcYOROIwPj/lS6k3HLeshP9aNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954155; c=relaxed/simple;
	bh=JjNDGyhZRcofBHcBLf7je5rl2TBTgB1GQVEGlYse7mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODIL3epRQkf85rGQtLFeOtZM8+VW6aZ4T7/Dy+e4CnaAkBUVYTb67M2urHxw7hcLSoxeOzpNl3hAseOY1QyzGCuhyfIrNF6WuzxnLJ2W+Gof7zIb28pXYz2O0251eSQTgZrTzW/+HSxKybUabH240y5CN3yaekfdqzakwmu72Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0972Ano; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385deda28b3so5349331f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733954152; x=1734558952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEL/ngtdEw8neicpLCHejnO5DowOyBjzk0ap1ZcfbTY=;
        b=y0972Anov0HOMt71WrAg4DFLKd8ucDNo8Fiu8pwjrX44xf8BCxJeFmbzU7BMy+Pvjl
         Y/c85nYA/K4YIZZwyD3ieyS1uuXb8Ux3oVgo5HyS/KHvll/RpkPbalOzCA3jEV5pB59p
         jDj0J/MkOjyUns87p9ca2tdmUCgH9zJ90rjzjXYzaiujU416PCCZAxWWufaveRLk6RAW
         Xi/yN0Manfv3+wH5dVqgIOqD575CLYoKSdkOl+haC5zy8MTQr05i30R1uL8MnYsH2eI1
         iGaev0x/emdQgEdF7cddeLewgoWaApTHG4B+QoSLdyvqD8TOarmxl1Ji6q7JOSlIckbq
         BRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954152; x=1734558952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEL/ngtdEw8neicpLCHejnO5DowOyBjzk0ap1ZcfbTY=;
        b=g/xvvDwKJmN16HY9BRAwsVADjiuJXdRKOd1oMOEXAHQSbfxV5id9f9mepKToqeVzrd
         VoqRCCpnzRdNJBy21KD5RiANPmM5LZeFfk++2OoBd8MxXX9whs8MOn5Tr1Ovyme9SqB9
         w23IcEO5bMtMBbBPTznb+cs60y038k5iKoF3Ja6XC5roFnWJMR+qfU8ax3NzCxwGUKN9
         5c0IwOcB8vFRk92Hv4UeUwMkeViac+M53UhxISdnIZNFNBNiCixx15puNS3SqcExOcia
         8smsUpiI7VYGoyq5//gceAaMQaRBr98ZXMdCp9IaL6L5OU81QBIjqC0AQzNh72w1gPuk
         WiuA==
X-Forwarded-Encrypted: i=1; AJvYcCWv/7e3qWSj3E7cVUaJZPhbb+mCR2yfjvxw08UQHpNnhin5bfiY/jpxR3q1mnPt+HRrOyWZntr78u/oqacW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtv0s4AFolVM+u3YB3OSjoqzp1Z4FVIy6F9SZ8F6HHel+NF9ZI
	MoqSModWj5MLVd6G9rXAoBY3zrABkJA/VZbp8uo82kR/hFGJHehobFK2WxK6gVg=
X-Gm-Gg: ASbGncs+tOm8xKqDc8h/Xy8PdK8+vr96WUSWdms+YOxGPC9jmi4iceI9rA+RWsKsWw7
	kn+eUL3t+5ll6RYHT8/lp/ITnAk+iUigLwZrbic6RhX84/T4CwcQnWotk1wVlbiIfolTtx5rzHB
	zK4rx2VuY0egWyVn4RIRsqBYO0WbZj/1p6Nr9Mw6sG3gAqIFF63KutpHT2mDtR7EGE8ZHXS32Nc
	ORn4Xwz7kh3rcwjJAlpUucd8TI5z6YRsR9vpsh3oRISWYTu6HGRSe9LJyrflCEOoFM=
X-Google-Smtp-Source: AGHT+IGuZnMKThgf4eD8YAuWutLkKfQCQWNUHlMDV+U1hMo6NUpM8D0pvxDc/5kFCuDbLvPC0Vi7Uw==
X-Received: by 2002:a05:6000:4911:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38787524a7amr999734f8f.0.1733954152175;
        Wed, 11 Dec 2024 13:55:52 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a5005sm2192808f8f.41.2024.12.11.13.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 13:55:51 -0800 (PST)
Message-ID: <86015568-a283-42f5-a8c0-6bfdf078bc91@linaro.org>
Date: Wed, 11 Dec 2024 21:55:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: qcom: camss: csid: Add v4l2 ctrl if TPG mode
 isn't disabled
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> There is no CSID TPG in some modern HW, so the v4l2 ctrl in CSID driver
> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG HW is existing or not, and only register v4l2 ctrl for CSID
>   only when TPG HW is existing.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
"media: qcom: camss: csid: Add v4l2 ctrl if TPG mode isn't disabled"

The double negation is confusing

->

"media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is 
available"

---
bod

