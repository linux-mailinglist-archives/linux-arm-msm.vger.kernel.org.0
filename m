Return-Path: <linux-arm-msm+bounces-55758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC5A9D278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 159E67B4BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9050722068E;
	Fri, 25 Apr 2025 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9ntPESG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101B21E082
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610893; cv=none; b=oT7KEot4GSAd2w2dC4psIorFKI4hXRQkcxBaBppyg2rdV94L/a1iWPa6bqmgggRQ2ADWkNwnYQ9VOvBtwaNkAEa3zNA6ab9Ow3bgWixU7c9bnPMUHgRTZ5GJSXoURyauB3504V0Ha6E5sXVGJaooQdnntyVjG5hfzemX+OHhVeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610893; c=relaxed/simple;
	bh=UQBhajw/JeL4r5v3Rs1yPTsRAOgc9Sros05Xpe1hjEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB2fN+/J2rt3/Psjfomby2w4CgQrnpcRaqbjTWGTB2o/niGEV7VccTY6w65yboleFhgKvE5P1ebmAlBWA5seQkiUkyvXOLwi6EBSgApwEovJ//yoa/9dBykZXkZb8OPIS+kFwCf3RlWtGtm9EyNfQ/VjPcwIJHyPwki76EHn5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9ntPESG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso1750265e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610890; x=1746215690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iZKFrHcJZYCujaNEaq92E0EBbUbzkFvCWqG/Nj+BFbY=;
        b=X9ntPESGh9ca3poctWd5OfWOAmXK2+EYTwtlxYwMbF0GIP627+07AEBw2dOUf1bqI8
         jkGf+FF7KHq7h1Qp5dmkMg228cbxzr3xEHQCoG5R8vDdUPOvkNIRTrgVPb3DvKA77Y4D
         mnncaurRatZs6kpJKf9WeWO/E7T77lE5eUUdu78gBBmF6FP/nEpoahUCjb+91C/JQCfX
         u3OMmussNEyhz6Me/J6kugQNfQebiLfGxfwOvkkQ524RXwBPpOP9fv/6/cVESwab1ncJ
         clcv0GwWPD9d1e8/fqLBLA/xrPjW44vCxUVlvY4ycMzDuxefxwMkXx8E9T+XqCtvzLlc
         OmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610890; x=1746215690;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZKFrHcJZYCujaNEaq92E0EBbUbzkFvCWqG/Nj+BFbY=;
        b=vbFRLNlCFr67oCI1N9ESx6R+dThvvco7psa/7U38a76bO76pBn6PNoHIEQd+4jAthL
         Knw/Qh5cG6gH0jD+tyCJwaF34T1PYUcRsYMh/sUhP5tNvR/rnCq7gmPY4pIpvHRJajXJ
         ouCDIXePR64AU9dVXFuAFsvtkE2m4HSqkFOXdxTgToxTJ8RF95jbdqeQEI7UAPu3M4Mi
         VmigYmynwo2gcttW4xBagHdbCHc4K1FxAtulsJp8EZ8xkg8OOZnQHJDUilvrdmnL1lVh
         N24JJlNz+mFuwF9KE8SKnwozE5mARjK8b+7pk8l0/i/ClDhKpPyH2iVRVIHO25AG7cM0
         WCgA==
X-Forwarded-Encrypted: i=1; AJvYcCUkH3SU5g5HKjbwMFc3P2SwyAsvTIJMNxO4T1L5Ai68tPL8My4BKdhMy7Ean62sClnESmdtuKusTbxpSdw7@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1cUQY71ZxNhs50FO4Zk7Fn/xk8ju4RPDT/adwFiniuUKmZv8
	w0u74319FUiiIzFvaG+jzgp6q7Vj33CyMZbjawV2sXRQHxBaKgQROeV7ENhWpO8=
X-Gm-Gg: ASbGncslz2qt/uLZ52vOPR/ZAp5ccwRp3BUSbMw6tvM3Jkd3pdnaQiCvMA/3zKdXFHC
	SDHuTDDpqPQ4uZDzfJj1Fqlh+E6jXDGCtRP1ILP0NeeQq5pUDJfw9WVivKQ29U3hblRkUeA/uj6
	6Moa49oAoqtJ26xM4gLixvSF+qe986Q6SGE+FiwbLwntq6mzxNt2+iM0jDC+44yDKXLTKmIGQGD
	Wz9d+XJz51T3gZ5RdR8Dug9ytBWFBqObsgqT6q1iTUX0FeLcDZ2bd0IoxaITO6Gh5A4wcIFslDl
	CduRokLAMKgbFvsUfJrANDaroiqNhLOzMr57s1Of2fhC/A1ppKptN0X+UrU=
X-Google-Smtp-Source: AGHT+IHwTzyAUXv62+tiLEY59G5UWbHcmL+HqGpSUG6e3gApg3OCpfZYoz7ZdQxCg5phwwl3AXVPtw==
X-Received: by 2002:a05:600c:4ecc:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-440a65dededmr12565205e9.3.1745610889764;
        Fri, 25 Apr 2025 12:54:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e06d8sm68733805e9.39.2025.04.25.12.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:54:49 -0700 (PDT)
Message-ID: <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
Date: Fri, 25 Apr 2025 21:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan@quicinc.com>,
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 21:34, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
>> DTS is ready and I consider it ready for review, but still RFC because:
>> 1. Display has unresolved issues which might result in change in
>>    bindings (clock parents),
>> 2. I did not test it since some time on my board...
>> 3. Just want to share it fast to unblock any dependent work.
>>
>> DTS build dependencies - as in b4 deps, so:
>> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
>> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
>> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
>>
>> Bindings:
>> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
>> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
>>
>> Patchset based on next-20250424.
> 
> If the DisplayPort works on this platform, I'd kindly ask to send
> separate DP+DPU only series (both driver and arm64/dts). It would make
> it much easier (at least for me) to land the series, while you and
> Qualcomm engineers are working on the DSI issues.
DP has also issues - link training failures, although it feels as
different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
rate and I have a working display (just don't know how to actually solve
this).

Best regards,
Krzysztof

