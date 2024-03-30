Return-Path: <linux-arm-msm+bounces-15816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDF892A6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 11:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 215DD1C21442
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 10:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B69028DD1;
	Sat, 30 Mar 2024 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ww2DFMvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F9224D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711794610; cv=none; b=WGXeGnhS0myLMpJQLkKZTgcKOcE8DyZCzz5fR1lHuoO1ft/+SjeuH5yaMEHQtMIRDK9DNt365hrcKg7FcJEpX4SPM2q5jH613eG8fgdDub8Yf0kcFMd+j/FfW4n+215HsiOJP/DJPDfnFCxMz8XJig4WG1XMHspM6vnczyscbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711794610; c=relaxed/simple;
	bh=u6zP6cXGnxg6757Ntsl9MsRtpmbcSP2fu7FRysZbGrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uS5eDDS0JTuccHR0pZvYry4OrZTpZSqMUM/w1U/M0TszYI20STSvCAVrXUl1GDZ96QV8HWILofbYIdYivpQNMsDRnMdPaNPOwqIYbP8YH5ecGGTVhyibYeH8TJP9ASIagNASBawy4X3G7Zfx+XVZ2Vb4moRi3cK/ASep2AhX23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ww2DFMvd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41551639550so7192015e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711794607; x=1712399407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSJldTCQNJxbL+WaCr8bJKBAg0AoAoVFnYQAYokgzOg=;
        b=ww2DFMvdIjnLQkliiTtTzBBHzd2rMUShWypLbcRNUaVXIpcVxEDKgsf6JE7wBBaUud
         oIudLEYB001DlgN5JITZnEcic6XhFpqhP0biO63It2ieLpxGcKVF0gvEtv5d4kTIR/Ai
         llmgXdAhNreMYR+OREo6xn3uMdgFKFZZywc28XQy9/XEi48I4DL/ef6b6b3kqx7gCKO6
         NUzVhky2clqYhNa+vB0PAb4wkcKQf2uKZMjL0oJSzi/yjDLqGTAf2z9FrylZrq/q7wwn
         aefPkze/Mqljn2vGrD8LiwnLf4/6xtYAOcnPoVvTYtaaEuB79Gtyi+EO+cKk11Gn9PBr
         rsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711794607; x=1712399407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSJldTCQNJxbL+WaCr8bJKBAg0AoAoVFnYQAYokgzOg=;
        b=OE58bJeo7vxgc61C0UrLg+UQHTAOz/fW0YCgRCqm4K6dE0qufgzDK6A5MrcLArJ/bz
         y2Et4pquaHAuB4gbZNsv3/flZG1YpSq+HZobVbKzuL4FPs0p98IXypyzruYJYZBu45jP
         MxON0R6+s42MsYiWYF/CFCrVvTSIr5uoPk2oV3ZKummimK+lYjS9XE+OU6bMA148YSD0
         Pra99T8QRdc/1Wg4as2uYEHqmRxSToRRxXPQcyQWzXjiLs8QZDIbnBru30XuX2VxPiwQ
         4GO5UlDgFgD+1Rt7s/O2w/6Dj5w447F2UjUxfzY4jld3PeQOPefQOVhYXSivb1yaK+S9
         hcpw==
X-Forwarded-Encrypted: i=1; AJvYcCV1yzixHRLz39vliBgCUKP/WtLEGxXKfPWPGYva18WYTxWlLt5cBdr/e5TJFiSuGJkOnHCNTMtc1II6IoMR98SNwnHY+8r9x+wOlKZKRA==
X-Gm-Message-State: AOJu0YwU/mjc5WPdw8CnHq0tnMAYfHrzOSbvmOnjkImf1rbDFZjQxdXN
	xzat5g5TNgvIG9zuwLRS1arzAdgDj/qWSGcvLJS22o24SgQLO1MEQ1WM7gsdj7Q=
X-Google-Smtp-Source: AGHT+IGz1BBzPLYo3+fE9igbOGY35m/voFMTW2VwdgyaiBhaq3jdPfW11LP3wr5+l6KE1YF3L+MA9A==
X-Received: by 2002:a05:600c:35d0:b0:415:48b3:e270 with SMTP id r16-20020a05600c35d000b0041548b3e270mr4036341wmq.9.1711794606695;
        Sat, 30 Mar 2024 03:30:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c4ecb00b004154f05f023sm4437073wmq.11.2024.03.30.03.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 03:30:06 -0700 (PDT)
Message-ID: <65ef293a-5ae2-4d1e-ac03-a6a6eab24ba8@linaro.org>
Date: Sat, 30 Mar 2024 11:30:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: interconnect: Add Qualcomm IPQ9574
 support
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 djakov@kernel.org, dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240328075936.223461-1-quic_varada@quicinc.com>
 <20240328075936.223461-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328075936.223461-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 08:59, Varadarajan Narayanan wrote:
> Add interconnect-cells to clock provider so that it can be
> used as icc provider.
> 
> Add master/slave ids for Qualcomm IPQ9574 Network-On-Chip
> interfaces. This will be used by the gcc-ipq9574 driver
> that will for providing interconnect services using the
> icc-clk framework.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Please remove my Reviewed tag.

It seems you do not use this binding header: neither in your DTS and nor
in the driver.

Consider the patch NAK-ed and send new version which removes unused header.

Please provide link to upstreamed DTS using this, so we can validate
your usage. Otherwise it looks just wrong and you try to upstream
something which will not pass dtbs checks on the first day, for example.

NAK

Best regards,
Krzysztof


