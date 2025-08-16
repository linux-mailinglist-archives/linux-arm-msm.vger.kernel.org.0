Return-Path: <linux-arm-msm+bounces-69429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FAFB28CF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62558173FEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFDC293C44;
	Sat, 16 Aug 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fm1nCaGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AA2652AF
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340814; cv=none; b=X5fvj1TA9EsI9ED6quJL8agk1rfH343Tnxbiw/KSLo1WK/KKRHmcvAE1mjHF5VXCiOosqvoI0yepjFL+POSxruPiHaK4kFbIjl1NPz1BaSqq0iUYFYKZ8p6CfH54DDMAz5SAzmd6OAapexS6+kRgXwX4go0o5Z07a3XKlYpX4EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340814; c=relaxed/simple;
	bh=xDCesgs8bOhRL6/nEJLkgt+FdBHD+t772CYVE3HpMUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drQjuU5hP1VTF1IJt5BpN3OlRJowLusiMIekeQuelc7tFJPJyHcHFh6L+3IrAWXgWKeNDJB9UNzZwme65Q/weyeAn5b1+fY5K/rHn2nABTX2YL019h3EEDpIJwZDtzialVnGp9AgAiM/s0nrqqRmkYXz4F1MUQRG+dSQsHv85nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fm1nCaGu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e411c820so1404686f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340811; x=1755945611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNCJA6QUUK+uVCAqEH7BdfhhLl78MFNK1pDau4L8ozU=;
        b=fm1nCaGuljRPEG4A/ROUxdOCeYefn3O3kYdgZicfzRY3e5jgmMPZmEWHjFp6utUO/2
         ecGrRvMfOm6kJ48GRv2dlV6MdiD1X9JZriUEyqpt2nY9UiAnnWxWDc3OdynDs3CKV0yE
         9C8DZ6Ur65P1YNBFdQfLdrM652X7kkttt+3x5MCML7dkBao6t+o5hFi7TnNhtAQdhNV6
         RHjNTc50V1GNO+PLORvxjy/6waGTz+d12jRGyfUXUdg+uhaBOfhWDphCc+3TMLfqIBD2
         zfAfujPf3AgykBX7T8hYDp6aJOSfU2RU5Fmr9ybJX9mNKo+blQQ7MJtG2dIF3qWJxs5Q
         xYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340811; x=1755945611;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNCJA6QUUK+uVCAqEH7BdfhhLl78MFNK1pDau4L8ozU=;
        b=ee2nNIRCQHjZWof1WwEJJkPtHygumYWxB1j1/G0kjcScxgufWUlhTonSyKTb2Ng7oS
         3petQh3Bv4rWdt+fEhUCUXtUjLG0Ja7bg4FmIr9uA3LknjHdC0lK1d/IT9/uHPK+81H6
         8a8EmS6tZOHNVZBQe2mDt6LVlHrFO1AA4T+FRFj6u2HOIcDHKSrywuv4kaGmZdB4yLQh
         QbRmZSySoTNZrdZ6siHUEGnG9TMHRG+M1kxRaund6vAQp42psCu8MsfxpooGzJy40g5M
         91gmV5ib07lTyQyOuJ0E1y5S8/aixIlkBWrdDVScvDocUaK6reG/xsN0ijYZVIDM7jl6
         QKBw==
X-Forwarded-Encrypted: i=1; AJvYcCXtwxbjGwTBm/VrR9jBzT9IiGmEpjpqQRDOMCHWPHntd+f1tbBLL4ANmiBlTWxCVTH+1m7XvHETw70ckR1v@vger.kernel.org
X-Gm-Message-State: AOJu0YxNq8g/tPcZSTgJ/g8PJ4o1TRS/1ILtYphzzKKiyRDYzMJbTuVp
	s0IHN0GHQbwj2WoFaLf1WOiI8X9nbyjlYicrlaKBOF4qRHSSnuhydqlx/Al3LRPM5wk=
X-Gm-Gg: ASbGncsGHOXf4i8ZC8fgDH+73ioGunaBNhb3zpno0y0TymNDC7xuZC77LElyLqJBevv
	1sypFGF3Cu7Du0lG5GwQI62BSE/2IH8CKrCBYayQOial3nlYx5Ivv70D9SzPumSu9EV2PWVOqxY
	OhqIuyUnLIOODFNnEWJCRp9cwCzpsRuZQCsfqYgoaVWl48tb/LcOQP/ogOlePUprvR182TxjZea
	eU5p41LrSRz7A9AXa3R4Dx9IvLp4nlRSNu0LW07K3DEqsxAaJTY6xIPchBVIbyghhZx/1leaKFH
	v9R8p/tX+t8ksSYtAaDSLSwHOq9Q/IByvPU+Lp7mU33ui0YWpoOxmudIDEGaVsSxTusdjC1DHqY
	QToMn1XlWVRRKbN8pNtMNfMhIUR7ez5GDptmZNxmFg7F2saWOG+8r+IQ/ADjVsLD4
X-Google-Smtp-Source: AGHT+IH9y5g9eDW3ZyR31wyNx8tU7SHMvCmkDzRQOX9w5fpIXbwluXssS0cmo4xuR8VXa39wuXAquA==
X-Received: by 2002:a05:6000:2005:b0:3b9:1056:dfad with SMTP id ffacd0b85a97d-3bb66567b2bmr3798630f8f.3.1755340811496;
        Sat, 16 Aug 2025 03:40:11 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c748a9esm90820815e9.19.2025.08.16.03.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:40:10 -0700 (PDT)
Message-ID: <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
Date: Sat, 16 Aug 2025 11:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] media: iris: Fix port streaming handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> +	if (!ret)

I think you should have a consistent error pattern

if (ret)
	goto error;

Once amended

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

