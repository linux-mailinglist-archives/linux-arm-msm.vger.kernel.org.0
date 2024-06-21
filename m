Return-Path: <linux-arm-msm+bounces-23609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC99128ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6F11F29981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8AC5CDF0;
	Fri, 21 Jun 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkRVuqFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814347A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982375; cv=none; b=a2GWJWutDWOpXrq5WrGYA05UQzeD1ZgnEQOrZ4G4TuS703eCr2MaGzYiK9CmIfIzZx6Vur45WGLniQDAWsOYoelXpaLWDgfPWSUdf5bJcMyHUoVD5yejRJuzmZ5YUInaT5c55flV6c7vP4HHacLCQN320LqsqEyLCe4jAIFcJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982375; c=relaxed/simple;
	bh=KIq2vtY9qM91UnJhde07LqckDFTuSKg/5Ph8JpMdh2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7klyzkCdOLnbzrJSXzqSJLBclgl5Gt0CdTSqKB6QQH1mqu3mGfGMneGzdLUv16sRcJ1gMLWNDZe09YijZIuB1HkLd1A+oF0u67UNKyonFwhu/AXAL/Dg6nOtE80JlWB3Sa6DH3z2+E87mu7fxtGKnGUn7NHON2aDa/kYA8tKCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkRVuqFI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421820fc26dso19413375e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982371; x=1719587171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BP5DlVBjipSk1p4cQPpHRbKc5ISqz6jYjFtQC0DyCyc=;
        b=GkRVuqFIkp38NR84SU8L+PdAVHDGgRfMTe4ygIVViVbqJw/Gjzmmn+AOC+6Xbavn3N
         /6YOd7ZLa8dZ5rfv2qBdTlhIUaEIAy8ynC7++RLd9m9ymhbz8M+JjOIwGEUQfX1zVIAw
         xn15sab8VrdTuG8ycN455bU9MnTjda9ot/YVe0/KVS6Dv/0dCifR+drcKz+K/K/Ais8N
         k4XLtj0gGYVsoGZvvvXO/fFflcGQz/smKxFPgtXa7cIOj+HUK2XRohiTMgjq8Fuz99gT
         yfVdX4BFoBTodKe8N/ngMJfjUrnkHvtgWD2zk6pSQPqB/OF25g/T6auJeplgzpBsxFz4
         1RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982371; x=1719587171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP5DlVBjipSk1p4cQPpHRbKc5ISqz6jYjFtQC0DyCyc=;
        b=bopftrWc3ARy2Id5H8cGDv/e7XUW7rAMloBp+FCaQSf2PB/GAUZWXGzRU6v+gW/VV2
         PvKOO5s80J09mAM8woAMya02JtRfrlnh0imoaTZVYRBuFVCzATVxOzGI9UGbLTLZLZTu
         dWQzHyRKZxfQLetQijpFGGAvqLPfYATdaZy8Gvdq8kDqtdk0WxYyRKH3FVZN2GcO6BLZ
         clAoEKPtFiAJYGBWQt8QBP3WqvPXgG+/K9pIQklR9OvugQWw4Mguu9y7d78v5Bi0ud4W
         zpYdG6/ZQKzVe8wZP5Y7oeC4ISIySUP0ZulxHTueBnKAXjRcUgIyf9i0Kdc+RnNR1N9l
         9PCA==
X-Forwarded-Encrypted: i=1; AJvYcCU7zWYVQMVTXt+KurOOIHXTrJ06TRyabdyCyO3KJyqnBX+rflteM8FlpsjvUNVJKODLca/ibm/w2xnKt+nDSrZlAC1fuVQH61SI0piVjA==
X-Gm-Message-State: AOJu0YzUfoFPrz8jbPxJdVxr4ReLzfI+kHO1PXckVMxOL87I9yliQ6xV
	ZdGdaeLLyoKFKMNaf27jrF2xQhziZto2hK3ShwGfKzpKcgQAUok6CjbSjEEDBbi2C9WDC+pmjXW
	pxoG0KQ==
X-Google-Smtp-Source: AGHT+IHHBo2mNBPPzrQ61HU71s2NqdGBN/GsYGlKnm+7ZW7VdfZfbNbVUtky0Nd/hnsz+mF+OJOPHg==
X-Received: by 2002:a05:600c:63d6:b0:423:b672:9d64 with SMTP id 5b1f17b1804b1-4247517dde6mr63390095e9.18.1718982371436;
        Fri, 21 Jun 2024 08:06:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm68710035e9.27.2024.06.21.08.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:06:10 -0700 (PDT)
Message-ID: <ae88c6fa-a55c-42f9-bdf4-6850405e9ccd@linaro.org>
Date: Fri, 21 Jun 2024 16:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] media: qcom: camss: Decouple VFE from CSID
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-9-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-9-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Decouple the direct calls to VFE's vfe_get/put in the CSID subdev
> in order to prepare for the introduction of IFE subdev.
> 
> Also decouple CSID base address from VFE since on the Titan platform
> CSID register base address resides within VFE's base address.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


