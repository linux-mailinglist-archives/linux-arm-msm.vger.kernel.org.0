Return-Path: <linux-arm-msm+bounces-20187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D398CBDA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E0C282A5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFAA7FBAE;
	Wed, 22 May 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfp3GvI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3522D047
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369587; cv=none; b=GtHevffzQKED6NS3/hZIJqmiIzfzV5lGIlOiJD3KcNHa00wEaNyuje6eXQ8SwyHcB4SQLghJUeJ9rq4C6rUqRC+xppjZXWkXfkmrxdUmIZQ56pYJU+PvLkGhalY60uEeRX1dHi/tz/zzIwWqzL0rbDht6KBbrkuhipVTtBRRSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369587; c=relaxed/simple;
	bh=VBsqYl7hUfneg7Pf4Un76AsJyXt20lSzdpAomEsu61M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpXdVhmrVPeQ2J0/xsweeQ2RWkVkW6QYDcR6bAwonBwAxW7VH+f/Ag1/kIN5H/xYFNyVJI7EwAYZ5iC4lwrU0PHR1sjt86KQCLGDG7FeIVZp1oxF5xsz/uKdhxyA+4ufuvZTNjKU/nngXiwfnzzhId+PKppvHtcImYnuyBRVaUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfp3GvI6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420160f8f52so5444965e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716369584; x=1716974384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M6NPTm1+e7s8OX0cZE3wNIuYcGvWCpp5F6olMkreWtA=;
        b=zfp3GvI6SoFpVjlh7XxARIPJ+hVZjcjvwJd6IEfWclZu2efMiRlndoHkmMwbQpCw0F
         xIC0/j60ATcs8Pr0XR4w0Q+iabYGUr019xNyknONniykLMeKbAPgH9hDk7mY/Y75XAaj
         /VRjJGfrmxlN9yf4g8Ip9t3rdA5mjEE45chNyIucLDwOaOiA7XPG4sQby8tRm1H49pKN
         k/dzuF0sY+iLUPlYocokSW1broz7zGH4UbF4RfLfdMZMoyHpYmfF6cBr7uz8n9QPP970
         M4YPWFV2bNRAAwgBYkMgknBYqGy6x1hxvIV+sstLrvF1dH7ahD79Pn+hFM32IHS5LTpV
         Xa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369584; x=1716974384;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6NPTm1+e7s8OX0cZE3wNIuYcGvWCpp5F6olMkreWtA=;
        b=Jtk2ZUOvP3DVkTd6KkmcKlGT7M4Vi+0iOYVAi+SoKlbhChU4pe8jD6Nw+A/WoKXJUE
         hPp8RD+FYQOmfLGKfkTJtNc1HiIgwIiqUzhE6EddE5TL4lHV1wqsUNT8W/KL4eU309iz
         RAWL/xVF9GhyPnM9tVLBPGz2EAPdIFKioPiXWYzVPaegUndrvgISeCyN24nczPRHcYfT
         V9eFzcXTcqN2y4uOdeYmXeuP1ZgcJxKg6ZwfM+Doo+nDsDJySPPD+ZhXzj6GeJTtrXGi
         nMJHN+j31foSKphSCECXjmA//QNgvf4IAm0k1J5D3GLYsZu8/Rlq4H7veiIfCyvz2pFA
         gBrQ==
X-Gm-Message-State: AOJu0YynD41Mc7i0KxvwJ0J1MWkPUVWtrNKGa+RauYU6Ds4Rhyy4uK84
	Tfe84sAEGTZUBRbY0+6+DkTmJTRgEjOKoZs/b9ethZ/TsmUMw+nlu29eLfpDhzY=
X-Google-Smtp-Source: AGHT+IFWcn1Za+rNzPPMjDFE8xFV1g40XFGrqFdisQd/XTmkiQF0mV+J4SB5f9ahYz2TN+e2ltQ3Dw==
X-Received: by 2002:a7b:c2b1:0:b0:41b:7d6f:1f24 with SMTP id 5b1f17b1804b1-420fd31d423mr10667475e9.21.1716369584246;
        Wed, 22 May 2024 02:19:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fa90e93absm521064565e9.9.2024.05.22.02.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:19:43 -0700 (PDT)
Message-ID: <1a623910-0fce-4835-a047-4086dafd3186@linaro.org>
Date: Wed, 22 May 2024 11:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rgottimu@quicinc.com
References: <20240522081508.1488592-1-quic_kshivnan@quicinc.com>
 <bc973b4f-fe8b-44e5-afbc-f3ce8a6fc873@linaro.org>
 <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2024 11:05, Shivnandan Kumar wrote:
> 
> 
> On 5/22/2024 1:58 PM, Krzysztof Kozlowski wrote:
>> On 22/05/2024 10:15, Shivnandan Kumar wrote:
>>> Update zone1_thres_count to 3 from 16 so that
>>> driver can reduce bus vote in 3 sample windows instead
>>> of waiting for 16 windows. This is in line with downstream
>>> implementation.
>>>
>>
>> This might make bwmon quite jittery. I don't think downstream is the
>> source of truth here. Please provide some measurements *on mainline tree*.
>>
> 
> Hi Krzysztof,
> 
> The 16-window (64 ms) waiting time is too long to reduce the bus vote.
> At higher FPS, there will be multiple frames in 64ms e.g. 4 frames at 
> 60FPS in 64ms. Hence, delay of 64ms in decision making will lead to 
> higher power regression. I’ve tested this change for 4K video playback 
> on mainline tree, and there’s a significant power-saving.

Please include it, with measurement below, in the commit msg.

> I propose to make it a tunable,so that user space can tune it
> based on runtime depending on fps.>
> USECASE                     zone1_thres_count=16     zone1_thres_count=3
> 4K video playback           236.15 mA	             203.15 mA
> 
> Thanks,
> Shivnandan
> 
>> Best regards,
>> Krzysztof
>>

Best regards,
Krzysztof


