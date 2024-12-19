Return-Path: <linux-arm-msm+bounces-42771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0C9F7712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 09:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDD116692F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A399217647;
	Thu, 19 Dec 2024 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOxiT3qZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9F1BD01D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596204; cv=none; b=GSPk4DEvUuGncjNbWyphmFMt3TkHXsgtx4lqK5we0fQEdRKHfQVT2oJHFQQ8XjI7aP7zmQWHCCGLNIIZPPzaqhIc/HHMeCmfWzlbICE0eZrBeNZy4GVXypRe/QXK8CZ6V7sQFtZaywbeAEOVerRdSVLCF/SRbssydeDKTYYU3e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596204; c=relaxed/simple;
	bh=+6RSFXCZrKB0507GEU0Lxqzo/UBl3GwLgaSsOqt0Ppw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0PGg8/gvQw/sw7uaS0Id9qz2NdBDB7QuNExno58isx/VqH/q8Cuoeb3Tc5RS+xqGlMzkbyZqlX3oZT5Vof+aK96K05PV+/hGTzGK2TVfK+SsTFQ4Gr7HXdeLMPDGvL56BTwSGWjH2gJM0w2f4htBAZYyjGqQRPdTKxoHO7tzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hOxiT3qZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso805155e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734596200; x=1735201000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yfCE2lBm3AGxDzeNkGrdgeE2MZ445obqvQgA9hms4ho=;
        b=hOxiT3qZyy4rcvIUmctJlhiRYVRM4Tukcjww7zFxZK6QSwG362xFOYn31jXiukkHzj
         ZA7+i6NQyuOGfBQTzpyqUPygqBShW1aHB5vkap9DEvkl2W7F+/NT3YFCuN/iOeTIYM6f
         Ktw2Bhn36SXYMucXrbl7wm4eAGgTd7nJMX+QWiF7TcArQ8cKW9OBqpRSAJ0vRJKc2OcC
         X+DqD42G0DliP3lK9S3sYTQPU/+qiwMEmBWbcYUZZMikKJVH6J2Zber1DkOgwloGuBCu
         5EaG7sH4sXYN9qFd8L94aLSAHVfE0fUFzwEbg+2JkxOQeM2TuL9DaRtfCVneJhub4wcA
         +o2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596200; x=1735201000;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfCE2lBm3AGxDzeNkGrdgeE2MZ445obqvQgA9hms4ho=;
        b=AEkPUTVJlqe+NOu4nkk8uVyGsZQkrOS+AoVuLH0j6otrJ6Gl89SfQ23CO3BycdFp66
         uM/TIiXeTrKSTHh/A6lfyx8jBsRFjN9isscr4CJBmyUpHifofjST1oz4nY+0yb3ePgrc
         4+/oCZLby5qq62B80qR/8DOXXN4foHHQBi2hmzaNev18wlogiLTNGVvjHXwmtKjbZFFT
         /smG+losOI08SBy2IKDgjey2dT+LjWXf7IUYH8P6ZHCglvH5CaV+TJoy8PW4T/z6DWps
         QKhFnzLQldxWAFmR7FkD73w5MkhvMbS0le55knEf2kKbJ4V4mU7H+oN++or1fFRmIYkk
         n6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVmrRBJ2FFFdX2dAYf18dL+LGo54NaeaWeZj7bChNAYWsjI+i6JWmeA+x4jm9NwNOAO/0GxW8C34zb0ZnWw@vger.kernel.org
X-Gm-Message-State: AOJu0YzPye5abgBEexIgRRJ48XVIZgmrtPl5GhqQe2V0s5QCHOT3GIO1
	+YWdmvEQjciazjK67iNs+sBxEanYSFMCudXyxGEJS++FU4jF/ghUUrByPnQC1jE=
X-Gm-Gg: ASbGncuMnmx1AKgHrUinkp5Q47OIOnwSG1c7eUfXFmpP+9jaNwzf5D8Tr8D6QRM8OIs
	DSdFl4GUsTtUYLirG5+NR9ouob7PeroKNPmxqHY/+FyWpz6Pn0mpeiKV5zk3Zgr65t383G6ROW7
	f5qY5jMB4xX2BNHF7IRwVWtBK8OeiwsjxKjrpKKVBCKX0kNfDYAzx6nynoGtO4W3ZJwGKbXl1ba
	sEJniCZiI2TafmOt52v1aPeegX5ySXAk+WmOAxcR++k8uxdSL59zngNmfaRiQOKk7Q5FIqtnBed
X-Google-Smtp-Source: AGHT+IGQ/hluryhzJy9pGLW52XrHS6g1bEUuWyR9c+ALG48g7EontSdRWWEVm7T37MkJ03ufIgv/Vg==
X-Received: by 2002:a5d:47a2:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-388e4d8e917mr1675008f8f.11.1734596200492;
        Thu, 19 Dec 2024 00:16:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828ba0sm940021f8f.14.2024.12.19.00.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:16:39 -0800 (PST)
Message-ID: <5d0b06b7-1fed-43cc-93e2-9a5f7cd14ffb@linaro.org>
Date: Thu, 19 Dec 2024 09:16:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_vnagar@quicinc.com, quic_dikshita@quicinc.com,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org>
 <283a54b2-6e00-4d3a-95a3-df4a06bc1292@quicinc.com>
 <0a265953-0c6a-4b8b-a972-a59ec4755474@linaro.org>
 <61c27010-c49f-48df-b6d3-029b15c71bd3@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <61c27010-c49f-48df-b6d3-029b15c71bd3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2024 03:45, Renjiang Han wrote:
> 
> On 12/18/2024 8:38 PM, Krzysztof Kozlowski wrote:
>>>> @@ -132,12 +132,4 @@ examples:
>>>>            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>>                     <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>>            reset-names = "bus", "core";
>>>> -
>>>> -        video-decoder {
>>>> -            compatible = "venus-decoder";
>>>> -        };
>>>> -
>>>> -        video-encoder {
>>>> -            compatible = "venus-encoder";
>>>> -        };
>>>>        };
>>> It is working fine on QCS615.
>>> Tested-by: Renjiang Han<quic_renjiang@quicinc.com>
>> How? How is it possible to test a binding on real hardware? To my
>> knowledge it is impossible, so I really would like to see explanation of
>> this tag.
>   I used this binding and modified the driver to verify the video
>   function, and the result was fine. Also, I used this binding to
>   verify the dtb, and there was no related error, so I added
>   Tested-by.

This is not a testing of binding. You tested driver. Don't add fake tags.

Best regards,
Krzysztof

