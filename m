Return-Path: <linux-arm-msm+bounces-46612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2CA240F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD56D162BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADF11E9B02;
	Fri, 31 Jan 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qlj9WnMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998EF2563
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341824; cv=none; b=htpX1TPVIIJUzO2NGojoXl19zmHTwWKHcQoetJIn5c+9vaqvxLCl3RR51yeYoZ2qtkz4/H/R1nFO7KikJhpbZOyCoRe/BkOLYMOSltQnAfar+YT/CB3mfYyHkUX00QIhmQZnnfyqBA7LDytndnhmqBtB+PninDj0Jlru+KTtvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341824; c=relaxed/simple;
	bh=fPfqv55n+maJhM4Z/lJsyd7pxciSwHhdgo2Eu7dcPLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKE12JM4XBS9Se4d7T87MUtQpCgxMyzSNsGB3ac8qULjFA/Xy9V0RKE3AnFuGiT1mQGVqGXA7Dqul3jCQgB4I3Mf7zY0UVRTn7azRxFOT8jalJYhl/Al1QIWSYdr2IHvM4/M/inN/Zo0NGn6d3qSO9Wpqbq7afhlax6Fl9agkD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qlj9WnMs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so21995035e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341821; x=1738946621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=Qlj9WnMsEFAlqv9x6qwONDArwWY70REiknszE1HBkJ8F1PP88xr7egMfBKOe1s+czf
         TayB1T8NigVjq8audoSMK/BPhivej3jPCT/PuSM7TV9XlptJ3+0jFfF9U6LkSC7qdP21
         RNNYSFtmiTbCwEO1YEdk3ml+uAbtg3BUgM304/13KfnXF/9IkHMGVQwaGJewkv5FdSto
         CQ57ZnBzx15FKiI6JQ93c0SzVchMZvnZSQ2MqdqyVXnFgQoKi5fM78h7tUgGppgPvyuU
         xGUILjsndDYFVnSbS5ZGoz5E05YyomwP7V9UKtV+3bI+5AqWX5QGzEQjQ/nPEj1II9FU
         uZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341821; x=1738946621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=CkuAk4i+tZhzLu6c1ZS8bbUkRpEusrVIbRLNAGAK7i7fs9+/W/p5aAZrOlKLLWgZAr
         TFXOBtcn6cXR+DlyjtvT4kPBp3fwVpWymCkC1qXu3flTgqgbb18kPk1BtsG7VXA/0yRP
         EAbczF8EM4/zuXhjFxL9NQgjEpBcPJJCPxE2B5ICmvo7Z1U3YMdVgGlCGPuUJWHJvcpM
         Yj1hMgfQBU0DWM897ViaCg6Ae50j2L0Vhc1Z3Y/qQq0dg5pIfQA4nan6HUWYginrWM0N
         EA9habvdKTqpil+fzHy9G5JeLtCrrP8eK3LOOwbJ70X2309BSCjXRhCUm061Y15dtIVc
         YTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU88hop/1fRKrWQ/rwOIMOvX8/oAoaZENOmtIlJ5NpSokNLepC9ZrX6/tg90EohuIsZH+JgdCv5H1sc0ZY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxkE4TcurtABsg4F+U99KUZsteX/duKp6xLkj7fB8fUhgxVW361
	AKTKobea+L7xKMNxg32P3IIS0Nz2Wc62Ydx1DrI5x+/Z93NdXWVWoGZBOBE2i0Y=
X-Gm-Gg: ASbGncsBvdvIRKS/wbIXM5nkDpbm8hKEymZgRMh+BzZEK84CAjfH2yoso5bRzPA5oni
	H+VE3ZDBluLjPpYww33bzWQoMyJz3is/bcc5JxfQgRZGJgV1SXS5o4kCv271LXvEKhAu+PY+MMR
	bDAjtB6r5pslbZJN9yQhcTNlQYYw315XurarQhufPdD5QczfZjCF7qxZ7lyRgcPdPn/L4p62fKp
	rj1SFB69h6u5RXrdMbapW4ER0PpySl0SQJGsfaP9f/AK8bADzDT3U+GbdrJBgEgnBXvCCtHf4Lg
	vpNUs25BqoWdDmVfPhNmN1ObPA==
X-Google-Smtp-Source: AGHT+IFTTPVO+a34Yzx36UVXc0Rk4aOZPFhQnFzSj9GM9HcFqkLze7zFulEsR/ai1dusk+GIBTsVkw==
X-Received: by 2002:a05:600c:46cb:b0:438:a20b:6a2a with SMTP id 5b1f17b1804b1-438dc3c8676mr119292945e9.14.1738341820745;
        Fri, 31 Jan 2025 08:43:40 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27130sm95257635e9.16.2025.01.31.08.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:43:35 -0800 (PST)
Message-ID: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Date: Fri, 31 Jan 2025 16:43:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/01/2025 7:25 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
[...]
>   	/*
>   	 * If we still have access to the event_data via handle,
> @@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (!csdev)
>   		return;
>   
> -	path = etm_event_cpu_path(event_data, cpu);
> -	if (!path)
> +	cs_path = etm_event_cpu_path(event_data, cpu);
> +	if (!cs_path)

I don't think renaming 'path' to 'cs_path' is worth the churn. It's in a 
lot of places in this change, but I think path is already good enough.

>   		return;
>   
> -	sink = coresight_get_sink(path);
> +	sink = coresight_get_sink(cs_path->path);

coresight_get_sink() is always called with cs_path->path, so we might as 
well make it take a whole path struct. The same with any of the other 
functions that operate on path like coresight_get_source().


