Return-Path: <linux-arm-msm+bounces-22577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92429906AAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 13:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C1B4285F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5A6142E70;
	Thu, 13 Jun 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4xBmUY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04E142E7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718276693; cv=none; b=lYmXHGccfyuR/iCbl/9/jsKf0tRvJVjZMzNveP9fOeWY2qglEiqHpHy0NTdTyUA71hk9IbYn4zNhK0/w80O4Amp/dazyU4Iq8VFW9Pwp/4k8xHp2A1MrQTQdCfqqQYEFnNytKB6E9uodJa/NusAUsdqQmM3G8M8tKGDfRdmY7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718276693; c=relaxed/simple;
	bh=tAcSgvKXqfnSUFX2CtxDigGjnUYTBy78IoinGdlH2fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dImnQ4PF3LivxERjGdIyN6iszZ/pI/Pv8VWinie1rERJEvjpL1il21uA8BlSOdhgo/AV5w2ozhUZkyTxziIM9JTPK+bWEQhmKQ899OnOny9vuFBfxfqkIwuX93rp+pwe55bvlaSPfL/jVIzxAkc/L8QyEvV4GKOfB8i049fWyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4xBmUY1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so786912a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718276690; x=1718881490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=w4xBmUY1ZJlIjBu16PzN8sZaXgkMZqijgAdXFvQWwFJBZ2towBcf+TEUgIUNrLAD4U
         1cvWhBKoj8wd7QY3XyPGjA+HmL2OUzXk2np8ayObVlZw8UKfOptdXsVmnIVxmi+kOOhv
         KEAPweB709bz/I/N6lVo8b6fiwDS+Xi+HYL3fqwXRTOPtjmJlndtIm+UoyFSjUzdRoAS
         HPs3nVNcc4hFM3K8qv9r62e5AqK35r7HquKA20Tqh8Ey97mRsMmgdvsyHWkRUly3AbRA
         WvMCd61dPGvXp6IttJsP2Tn+NMa5TKqSE5W6rJPVXBlo5VQmtMzd7sCZGfpwvHjxjIvi
         PWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276690; x=1718881490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=c8zZE7ujLsGHK+wU1VL1yAzPTJJFjDcVXUm37ST+idmblAfvOeAjn0UntwvznU0/22
         cNC70U5qpvkn5+vBPyvphb6jo7iyPifgdyzRxFCNCWp1mIUhpvtW1XeZVwFzARXpquyN
         e9K12F+P5SsCObMaMcHJMIYkb4K/RBVu0cCXz8ydspDa6ZfNMeFxoBacdoASXAi94Opp
         wrXkVk5jm0J+mbAl9uzHthILA5v/0KQHWCyoeeHpbTvMsKsHO/v0ztHZXcoLGRqgaS4O
         UDGXcsc8W9eBso3CqPinpaYtR1/rZ13oXwiTkzIVJSn6rJZMqxLdpG0y6r+8qfrRi10/
         1btA==
X-Forwarded-Encrypted: i=1; AJvYcCXAzwqt4Se9OoGDUKCgyzk35DA6i/XF4GiC1nbuiMISA5oghrMwgmb9gTY60xhN/VL8vAM3m6nxBI1nfIIpiq3coHdN6hEMuK6d+gGBFQ==
X-Gm-Message-State: AOJu0YyN2AB0WFt1S2rjx53dh9YlKJLryBED7iNTwOQOTy5edjGEOWqK
	9aUHchpSZ1IWsoFgjhVG2vo1rWmQDe+jhziWRrPzjAoO8lIlMus5pnRgrlLHR0g=
X-Google-Smtp-Source: AGHT+IFZMCZjqTdFJ+VphErIaK9g4laFVqVLl8sNw4G7xzHX0fkq7AQsk5RVkxZ0AbcMTIBCZQzPyg==
X-Received: by 2002:a50:d7d9:0:b0:57c:5f22:f9c1 with SMTP id 4fb4d7f45d1cf-57ca976a4e8mr3004561a12.21.1718276689646;
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da37csm768974a12.27.2024.06.13.04.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Message-ID: <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
Date: Thu, 13 Jun 2024 12:04:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
 <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
 <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 12:00, Krzysztof Kozlowski wrote:
> On 13/06/2024 12:49, Srinivas Kandagatla wrote:
>> LPASS Codec v2.5 has significant changes in the rx register strides.
>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>> after SM8450 have only Left working.
>>
>> This patch adjusts the registers to accomdate 2.5 changes. With this
>> fixed now L and R are functional on Headset playback.
> 
> I was just about to respond, are you sure this is suitable for sm8450? I
> looked now at registers and sm8450 (which should have codec v2.5) has
> old style register layout.
> 
from 2.5 the layout has changed, I have verified it on SM8450, with and 
without this patch, This fixes the issue one speaker issue.


--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I tested earlier version of patchset on SM8550 and X1E80100.
> Best regards,
> Krzysztof
> 

