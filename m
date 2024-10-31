Return-Path: <linux-arm-msm+bounces-36550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D929B79C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 12:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAAB01C21023
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 11:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD5E19AA41;
	Thu, 31 Oct 2024 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuhWtM4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8C178370
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374523; cv=none; b=GuI24QDwIFGLecmOcTqdsBkOA3mGaoZiWIU4j3QGnjjAeOsqFi5C/gHj67wjxlBp46lkZBSv82COt/UdZvvwkymk5M/yLxMySUXbLmT1BhVigVgWBX3SSTAtgmmVMVWlQPX0cQ9nNBEw3zx23G2Itskbhy7LdVxZ4uzd+cwhOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374523; c=relaxed/simple;
	bh=iQpKNxvIb05MpQm+y9atDzZmLOvTbkp1qlvo2yvur2A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=I6gSHQEa4DKSKrTBGGnr5yXiDvrdV422RDJBIye1c4L4mDF/vwElIM4QZ7O3T+e94i0ghMcINqDY6qbCN1rJ1CAG3WfDvDwaw6xhPz/HnRmZdE6PJtsmJwbFVx1VcrKkxhF2Jp0eu66lsiSD2t1Nmb0xhjU9wW7SAhp1avVJ99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuhWtM4M; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so547905e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730374520; x=1730979320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oRUOTicU+bHDCCOkusRo0Ym1My1gU89AdDAdqUCKaU=;
        b=RuhWtM4MQ+6JT+gGq3QMhqlW1cciglvcSaXqceckw/JU+rdv0EV4F/KD2gt+ID/hfS
         i7gWLnWZofvKcdUeyZ3O9xbAjXG6wmFL35cL53B/jodtzAyDSPGsjPb8fmETf07wP7MB
         YOvioj8roppfUBvtuLCt2lsP2e80nGxyNuEGcFwXzjMaNDNvFHGGQ50nbi5cX+EmbEVC
         LgrPRPJqPIxAWrkzbmZL32uYpDVIupG/LkbkwzhJvuGcKXYcRx2yJEMETxqGxQLcKWe5
         RENQYWjvo+xW5yodJP+/kcQxLgU3HPVHNy8P86Ew9BRNoPxkR2wtiQs9bwuVQr3nNblZ
         mMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374520; x=1730979320;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oRUOTicU+bHDCCOkusRo0Ym1My1gU89AdDAdqUCKaU=;
        b=GzsKpZIIFycW9XeYYUPLBM28AnvHQ0a/09+uSDyxs6YskYi5EsumCXc3Yqeulzp3je
         nzNtbW+TkD76GBCiXmlu9yjgHc+Zs1yDxaI0YWsTCI+rbOM7rb7o3cCOomgRLVL/ynV5
         IgFC1mW/oYtPVnY4mf24zgRiA+HfU+9jwGsW3WRmgQukWprr/E8CkifJzjhqr+npa77A
         QVSLPU3zu+6UvInxqTXzOXjWPxwyWAcb3cTuZY1C1wBkUg83gj3kI+Evgq9XxdgZ3tb0
         1P0oU48wdvHUZevAgwPno8si1Y8DnOlCGiAoFlu1ov5DMCAzi2uDKzDc0FWvXMqM8asg
         uCiw==
X-Forwarded-Encrypted: i=1; AJvYcCXR35PrWpa8VnhiPJDThPwQNhjMVuh7/QsJ7ZxUoUqHyDN1ydd/NF4PSKon1slyYNb7pntPVuRkjhlkaamx@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIuRabxhgMjfULXKxTTGiWgJFThKzBP/WRWEpUhK7qcC6rzp2
	IJCs4zsZHXobtxCdQnm/HlcVDoqCswoanrdFOsBhBqFxni3XnlqzM0pzy6PQvvFldUY9h4qf6pu
	M
X-Google-Smtp-Source: AGHT+IE5oeYC3TyYTIVtGeqMzi9DBlOsLAWU0F4mADy0vxIex1yr/ftV9jZNdZ9z35z0wVUuKtmR+Q==
X-Received: by 2002:a5d:6c6d:0:b0:37d:47f6:6fda with SMTP id ffacd0b85a97d-3806117dde8mr6744778f8f.7.1730374519947;
        Thu, 31 Oct 2024 04:35:19 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce59csm167540e87.149.2024.10.31.04.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 04:35:19 -0700 (PDT)
Message-ID: <2131e750-f5e9-43e8-816f-924516336fce@linaro.org>
Date: Thu, 31 Oct 2024 13:35:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: loic.poulain@linaro.org, rfoss@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
 <rql2u5k3esavdmpdzgo4l4up4ir7yjpdzc3qlmsvjvqalqzvjc@xspprcohlout>
 <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>
In-Reply-To: <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/31/24 13:13, Vladimir Zapolskiy wrote:
> Hi Andi,
> 
> On 10/31/24 12:44, Andi Shyti wrote:
>> Hi Jiapeng,
>>
>> On Tue, Oct 29, 2024 at 10:09:31AM +0800, Jiapeng Chong wrote:
>>> Variable ret is not effectively used, so delete it.
>>>
>>> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
>>>
>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
>>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>
>> thanks for your patch! Applied to i2c/i2c-host
>>
>> Thanks,
>> Andi
>>
> 
> FWIW I've noticed that my Reviewed-by tag was added to the accepted change,
> while it was the conditional one... Actually I don't know how to be aware
> of such nuances, if only b4 tool is used, likely there is no way for it.
> 
> Hopefully I'm not too picky with it.

If it still matters, this one apparently unnoticed candidate would
have been a better choice:

https://lore.kernel.org/linux-i2c/20241031095339.76535-1-jiapeng.chong@linux.alibaba.com

--
Best wishes,
Vladimir


