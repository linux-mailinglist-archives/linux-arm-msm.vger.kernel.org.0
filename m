Return-Path: <linux-arm-msm+bounces-10601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9285118A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6131C235C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 10:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64A93B199;
	Mon, 12 Feb 2024 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeJvlqHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AB3B197
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707735038; cv=none; b=fMmuxGVxF/Kfuv+8mirH1qVsFemr3KfwYiqtBJBvthX25SixGkiSrt+9SipymtLIv6NYIZeqjcjEn9k0PVsG6eM+t7XqWLv+jwRNAv073pjkz8udguFR51/3zj/JsInzt5GU10bmwyy4OgzTkBfmgHdNF4nIc/hneO5czNSs/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707735038; c=relaxed/simple;
	bh=/JfNkMLEUFeAXA4zui2UzxgAKCKLuG/aaPTopx3AX9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onYUZGUfQtjtHspZECKq2aF0wra2TPhPXtbJG+F5SMQUvBO17tKPMTHLhuYcbyTQYu99FXGSshavOMrBo5ijjxGURdMyzg5aoCciTPOCK144JPTMgMltsRTujpkEdl/rEfanV2FV3W1WndDQkPb9WiA+PVF/S11/htqlZ0cVEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeJvlqHG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5601eb97b29so5476483a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 02:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707735035; x=1708339835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nI1IQSjoB4+sIHwqUrZskhB7cgBRYGWDkX4TD9TeOT0=;
        b=BeJvlqHG5qjIiHgYtcxx+0pIsqFy0mrvGi2tFVPI/qI1d/SGNHxxs71V12d4PN0YGS
         zntAY7V4iNx/20vtNjFYB5oZt90IXn/bqQ5T760nEanMUzyGqM/CjN9l1s/KEggATpmZ
         amCeV85KoN6Gmp52ZcZ79qynySzXMz9ozituQ49Rfpf0DqiyeI0oN3iePSBA/Iac2ew4
         pQTJN4wXlc4og23p9aeOl69DSftjEwfU9oOSWcTRghm99St1fOT6hVY5L4AZQfKxPGnr
         VigPG3jNgPFl9vI6zzAnvX8i+0+IpIJ0Jc4gOBwwHGXlrUH3HEO7xulnnh2clArzkr8O
         swww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707735035; x=1708339835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nI1IQSjoB4+sIHwqUrZskhB7cgBRYGWDkX4TD9TeOT0=;
        b=CwtliYlfdZWyf/Fn1XaY83CyvBJd1ghaPFTn4zPAwOa2dKeoryhzMqxA8sfK1QV3Xl
         71qs5AvEplAmaf/o9JZjWaHSNHg+Od2wqewGtW/waymtL/ME0P7n0H1VDf2DsSRU8M+B
         ntGiqO2wuCrfQrztpyuBVTu3+uK7F4OXAPT2pNl3p1x3Ux3SK+kpuSXl/sQrGq38lQDk
         Z+hcHn/ks7Rk3YUY/VR+5c9fc+jdJqmRxF1rWdxXyjTxvvwvrMgebHH5CYeRR/JOaMNP
         3QZ0jI25GLb2xitmwCb8ag7RuAks+IDFLAhqzk29MU54NQyg+a1D/t4cO184Dyh22TqK
         SsRA==
X-Gm-Message-State: AOJu0YzZ/PCcJ6hnOovaokt1Eg4qwM+557HM9t+j/lCqfiK4g1X+wFAT
	QkW7RGAe11krCoke6vGmzOmvxyKoXnz3pZ+MDa0sz1fP0NelrzITgTzZctjMYfI=
X-Google-Smtp-Source: AGHT+IG8Ns3VgDpWP6SEZGOlnqLNC9bHGde/ANv5eAyahiILq7zIGkl7yp13s5hItFsGe58sTmC1cg==
X-Received: by 2002:a05:6402:2285:b0:561:a278:db1d with SMTP id cw5-20020a056402228500b00561a278db1dmr2651499edb.6.1707735034978;
        Mon, 12 Feb 2024 02:50:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSZT4lmA63e4uAtggpdcSOndWCzHHYKHFUiAM7WX3/fsCYWhkb5bFWjROjA298pRMu/JOFj45q9EQrlKPg4vCwBGhZ38W5YEqjAoAZXqETH7VK72Xe2ZmUNzsUv4WWssOYpAW1eV7ZlkpAvuQzgnGXX3fXnFwnM+iNDWSTD04IhU2p1YbtagFvl2D/ad2P2vLNPhys/pxFr9PGXlqtAyoSNjq5hkS3CNRovV7jPB36DOJR7ySn6ACG29krwfVPODAXXlxpsDDJurI9PZwzrzEt3drr/OI8GCcXr7xaFq8oMK3YejdghWXUJK4HrF995QF3zgYiBMpMWMN/4U0U67zy52v7B5XdYV5KMifBV63x1jPpKO19JT0GQop+3JbON7OgQBRm9tt0PJ2VSQ1hdKqAYBR827PPDNgHWwiMQhQUO4CVgYkJ1jZdomdj6N3sCPU74ly8FSVq1X/awSHOKoLkQaZdDCpU7jjMn/VTUXkKuncsTYTJsQNvwrspXAuuBcRpyOGHR54s38YGq90GnR/wpbo0tGfsH3zbRwZrLLjUmJU3lkbtXtdV36yhWrAU3NT+gOoSNfKzL8gdfbWkMoIMfJTeWjib7UXkdLvqjJ7X3zvd4Z3e0ARBFI717SX81iWk1SaASv53LuZdei+hGENGnvT+GL+iwVW8hVw8Ikva/2cxhyj7ZtjYns+8nPrhtfPXIpyiffPvfbNhRg+dPf6L9buuKYjfhpuoZWDV14ZzV4DHWNrKl1fbAAmNI6I1uk0z3ZoQqHEUZZ72ZIhv7SRlO8ypL5pkdwx3pc19GstlHViD8iZRG83yovI/
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id ev13-20020a056402540d00b00560e72d22b8sm2660498edb.2.2024.02.12.02.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:50:34 -0800 (PST)
Message-ID: <8c1c8528-76c3-4f6e-8208-4dd5e45dd39e@linaro.org>
Date: Mon, 12 Feb 2024 11:50:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: enable GPU
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 11:37, Neil Armstrong wrote:
> Add path of the GPU firmware for the SM8650-QRD board
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

