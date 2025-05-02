Return-Path: <linux-arm-msm+bounces-56535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9EAA770E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F8C4E4FE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4F525DAE4;
	Fri,  2 May 2025 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MY5Cjbpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDDE25D1E7
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202642; cv=none; b=cV0bqDFwC2TawPyjnOZjFFjeAKXWIgd4u65+kj8tpglEny4ht/mJH9oVgqvaZIGUzNLP8MRgUFkIhQsSk8Jtz00lXYOW6s6ilW2h/S5fxJkCjIBhzzVnJtNcywjsfpTLpab4RVWfpbZfawIijANeLssVN3qKu9KmXbIfurK02OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202642; c=relaxed/simple;
	bh=p25TGFxmDkAyg2SKPUNGairhusjxzU72tOg6R+cw4r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPoxN4hQt6bOI2PV6ENKQIcr6Y455GPfqj4Af9l87WujhUD1RPq93i4UPIfpFSlTZmJ4X0HMkg50a7NK3JOKYnGRfUlZOyTd4XcIYaf/2LajrAFkIRd0HRe/Bmhmg8XfzF8e9JEkUAzb216r5SmCiaB4zFrLZtmm3fFe2mnAwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MY5Cjbpk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso14190195e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746202639; x=1746807439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wy6Q6Iq6c6FY4Y1FHTjfXlBCNM24Ps50LT7tN8wml2w=;
        b=MY5CjbpkYE20XvVamxnykBHChcyGYrRPt28syp8YaEB1WGNarX6TgshF8ylCGwHpNf
         G+yo4dRmI4iBZYd/kqv/o0xyA3W2lzAkpH1OvafhCkL/H67vxT/t2+SvuMEA++zKKOOP
         9FkHFyi8BI5iG5ZaxM3Rr5UptY/jhee0G5VP8jJrdZ0X8DyJ1uQMMlK1zh8s7izjqDLw
         FIexSHyhbnNy0ffPus4/Vgt2LSZDZbdGcJivG4cwYd8RDDZ4vGnFwGEatG0+nFYu/zCM
         6vYab/exDeO5/qGbRx+cXo8dfGb3dK4c2tqr3ypegpYvvYLCQOU7spy+Jzwbkh5r0+6F
         pHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202639; x=1746807439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy6Q6Iq6c6FY4Y1FHTjfXlBCNM24Ps50LT7tN8wml2w=;
        b=lXuvjq2BkXZTC9r+i2fOcK/QAB3cZ666ynh+eodXvTTVkJyinEkOmlJpTkoxHw4vci
         FKc6RMwWhDIprV4DOMkuNnzalmZuzYp4Uk8dMG1EEjRC45cl1LuhISDaqO/0q+0r4WsY
         EY8dPkFtjEeMLz4aUCqFEVnTywXscQPVh/i3u4ZefiY/wjm/6Zop9TIEAow3VqB7vRxC
         IdphiwHF7IW8OvKeYs69V2PIn6hGo0gFlE2gHFtDs+jCOzUE6KvgR+ttodtTtiHGM5dA
         vx3WND7yqYCnQalWv8sQpenibUgm98ZfqvG5xHuB9XfhLVxUxMwFB/Q1p/BiY/8MaWjK
         yTag==
X-Forwarded-Encrypted: i=1; AJvYcCU8mOGIprH/63CBQhNILpCTA8X8CHXLk9RDroks6uJq4YtRwIR3LvyQJI0QubQBMfiL8Iv+LdYVro+JEx2f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3XdgwXUW2vdnOi14pTXtFZreghCG8ybFiO1la/ulahxI+S1+
	SY7LAfK+iDjq5AytQ2vEoLmilVkjHTnLzPxL2L7F+lWfgqBKGprtzAZoxHJLxJM=
X-Gm-Gg: ASbGnctN+YZCBqRmGPY3ZvxmUqucSb5DWbOVyGcNNtkhbm8r5o32LIE8LBsf9WUhmOh
	XStd6aySn1AU045XPjdcjwZCX8BFb4NZhfNUfW8Y0P93JLaAC5QPQNHq8ZVV+neSbeSqLM3sXUg
	H+cBOie9uRSVQxtx4rRc7WZjvXgYYyMwT06zV32h+1ZXAQZpezEWqI965sKtx8mcEg2OF4eD161
	FeUZvzEbbhAn+Z6kqJt+3X2I+aVNGxLB1HphzwliHE5A372WJqLzW/JZiC7elfMPpc8pKF4tQ2o
	NBiNyFoQoxaYn2bmKYNDOFz03YN8Cm38BHoDXKpaRKS9SdvUQvCN+6CVtwjD+wzBvBpq8tEYFxi
	A7oy3GA==
X-Google-Smtp-Source: AGHT+IFylSPDAOE+pMGqEF4M3RqjKjSA7UkAh+IWcn4TG/z9ljqFUqXx01pVwkemRY/0SiLj6vSGMQ==
X-Received: by 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr62299585e9.9.1746202638742;
        Fri, 02 May 2025 09:17:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2922sm93761325e9.17.2025.05.02.09.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:17:18 -0700 (PDT)
Message-ID: <311dfba9-84f7-4e3e-8bb5-a4ba79f628d1@linaro.org>
Date: Fri, 2 May 2025 17:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] media: iris: Improve last flag handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-15-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-15-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Improve the handling of the V4L2_BUF_FLAG_LAST flag in the driver:
> - Ensure that the last flag is not sent multiple times.
> - Attach the last flag to the first capture buffer returned during
>    flush, triggered by a sequence change, addressing cases where the
>    firmware does not set the last flag.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
I'm sure this is logically correct, I just wonder if you could represent 
it as a inst->state instead of as a flag ?

Up to you to think about.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

