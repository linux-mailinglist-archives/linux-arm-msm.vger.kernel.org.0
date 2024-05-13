Return-Path: <linux-arm-msm+bounces-19806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEA8C465D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 19:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1242899BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 17:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22FA22331;
	Mon, 13 May 2024 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J98GTKTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E62C69D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715622201; cv=none; b=bwHROq+XuNiBvTwc+AH4CmwPDAIrERX3Iw8Ns7Snv0pZthoZPIWVoEhANXaS9aBtoWLAoUAie77uKDB/XzGp9QJWzMWWmCAT++qj6+S8eKTKqVQj9Dt8c+7rhSH6bUs7zv/SQGr3So4g3L7vfhVGsf2IOABZj+yzTI/wkZ0qzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715622201; c=relaxed/simple;
	bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfYc1MsV0pomms70K05KAVBJhdTSIaERJ5V7Sy6nPFnGL0af+nkJbmyvoMo6E8F75eSfp1vCaIOCccOa0D1Gsq39rpDD828nbx3o1R+TUNANg84vC8mhm7p977+7FzLSDmrk3y/62CeQK1nq2iaqydi15bTtpXzNIoAWl/saC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J98GTKTw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so971609466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715622198; x=1716226998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
        b=J98GTKTw3D0z+xU+CR0UUBU22I88kwuahpsOh4pPHBwWv3JURsu2HOPNfYFy4ZZtrd
         lC5SteOWQUt1FKTWrrdT4U92QnltFp7dd70V5klAerhRgqi7AfCCvvtK51vXZQfwuSQC
         Hc1b+CrNHtskuouFlp9CV9RQdOSLlrbXF/A+z7HlA6yY93R5Wd9B3ks8Tw+G+2Lklv4b
         1U13sUshsYRhDVlzVIUMOIF34ADSR3IfqiGWnvQmfyqJoAkHM9gxdGXzs08s+fgXkEvP
         QC5kBEMTyI0C2EJgKJTEwYt9x7sVJPgtJxB/V+RKlUrN7XhX3Mf8aQXm9TjGoKFcsi4s
         2Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622198; x=1716226998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
        b=ggdeLpqOZ6hnubPbhhE2gE60xKg0M/hPkXRyy7PWD1CSrxsItXpQ3Yn5EVuq5k/cLW
         PKlJNTnLayspoZ8QXaIB8YGDMm4p3SMnNgPYjyVKZqGKkyYKsJLvPE7CV3Imbr1YXco0
         5TwuXlYHa49lMaYFctaNayNmC+SuZA9F8Mc2h53C/yL19JdTWZuq5nrDjhuWPWOt0mg2
         PqOiXhTqdO1O7JCUgmsGijG+h4mRkd7PyujIgF21+sC45yeOCBM9TmIkyAaUVrvmyX+s
         R0qwDjROd0bFJPDk1vh70p3VouJOA7519oPsdx5xRZg2bBoMlcW1x7RUOKg/0oJ7dDBN
         nZSg==
X-Forwarded-Encrypted: i=1; AJvYcCXoRnk9Xwka/BQqxJHZnub5Nw8b63+8QG1Wo7K+yT0Bs1uxORPbB5tDstlkZF2TLPo30T5vX1nuQI4dLluATIm8TuD/0BeO8urNm8Zl5Q==
X-Gm-Message-State: AOJu0YxjjyG/wq7a/uxcpGkSBKY9o6/xsKK+GNWYOk7ueyqesnQBz0nb
	O3M4sVVn73U7bDi80ZEjJ3gpPgZHTS+5CR2JCela8FU+/GHoZnY63D57M+S6Szg=
X-Google-Smtp-Source: AGHT+IELKDh/+p7rTu+QYWM0Kfw5Umh5ct8MWUA/OEgaNq1Sq3Gqglnpa7+36cmcM3bbU55BfNcgHA==
X-Received: by 2002:a50:bb0f:0:b0:56f:e7b9:e67d with SMTP id 4fb4d7f45d1cf-5734d5cec3bmr11655801a12.12.1715622198507;
        Mon, 13 May 2024 10:43:18 -0700 (PDT)
Received: from [10.1.3.28] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2b8f7fsm6393355a12.66.2024.05.13.10.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 10:43:18 -0700 (PDT)
Message-ID: <12bfcd12-28ef-4fa9-9a46-f370bdb4cce8@linaro.org>
Date: Mon, 13 May 2024 18:43:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: Move format related functions
Content-Language: en-US
To: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-6-quic_grosikop@quicinc.com>
 <c6797921-2c2b-4dc1-866e-011d10c9d3c2@linaro.org>
 <d53fec3e-e46c-4185-abcd-e621818057a5@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d53fec3e-e46c-4185-abcd-e621818057a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2024 17:52, Gjorgji Rosikopulos (Consultant) wrote:
>> 0 as an error condition indicator is not very common, at least it shall be
>> documented in the comment.
> The original function was vfe_find_code. This change moves all format
> related functions across the sub-device files to camss-format
> I believe that 0 is default format

For this series changing the result code is extraneous, agree.

We can debate such a change in a standalone patch on its own merits.

---
bod


