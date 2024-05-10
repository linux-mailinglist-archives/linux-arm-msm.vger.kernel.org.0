Return-Path: <linux-arm-msm+bounces-19716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F29048C29D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9267A1F21212
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A227125779;
	Fri, 10 May 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZRV8ygJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221829CF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365667; cv=none; b=lsT/tiynlCp4KTgy7EkuyXYVJHacIES8Q8TZWerL7Jp8DMUShlSSpDPD3bn7itglsBO6JOj74BV0QgrITp/qsV1Gnw5Sg8I/g5lxShwRkMO+j+vM9bZMtjptGvKu/pwPH5JIbjGtwSrCEhE3fsBfj/4uAKWrtrzPVs6pQdus8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365667; c=relaxed/simple;
	bh=uLqe92/dQ4dMxvG6UINLCSdWA9vxn9F9HhspNog0qfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tp5mhoUXFzNpYLxNmmgXbqpJ+Az7nPLRQOgLMSP6zXWHk6eKNfB6vF9hCYxvuKYNxCaBFI1TtgMwWJwVQ8R5doN7UrPfjX5SJ6GNkCL+8MxeKsKAL+IUdY2iNJ0DI2xJYwIFGwzgQ3NtF9dO46yGVo4yS3V+ORamblHPLLXrAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZRV8ygJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2df848f9325so28498921fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365664; x=1715970464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5gysLK7eBXrdS+RL9/zVN/Yqx4/fP1l7kizHDddPSA=;
        b=VZRV8ygJzcWS1QwM5oX65XYyIca6fJ3O6IIIRltWw26KVUvQaHNj+dSXv9WSoyTnxp
         IjLQ7qW91QFuqZXt/zX87OI30HRJ1DYTojolgq0kM/SUUYUy5wyu4ZP6CaTBuQd6YeC4
         wZ9vKxjn+e+6IwzU2Mrwfr7mJ3I/ih4aou1IWLlL4VWDzFbDi9AodfOy/UYgDUgspJ88
         PjHHX114v1sA4Re2jKt+6M3FQhrmZCBfUVKig7GqAHEGzN1Z+D1UmnNrP2UT1s71H0ly
         Y2DGVC93tthBI/iCjdA7UQinTZxBkvZIBhQ4jLNg4DHX1XnpMrWxxanMSI4TxPlkFXfF
         xGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365664; x=1715970464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5gysLK7eBXrdS+RL9/zVN/Yqx4/fP1l7kizHDddPSA=;
        b=mQhpye5QHcpyr2i7jZXVDZ8mbS0C2IFz+p1yBK607LGhp8mDgIYjJ4yiuYDZ0uxhkG
         YcOlFrwnKIEAQ4neNR6UIYY9vniQnINW9cibBLZZIz3egCka79WzVyuGWb2BwV1xUkrZ
         z7fRuEuMrI7AgqEyruBTDBXTBA10y4r8K1m/rEe8INlfhlU1JFxBm2MJ3+47X0vYvaxF
         UnLv+pN88RusxCjP6WSdkiBkw0Igp/xlVmz4+w4YlC/uY7sQsxVgjG3NftxzMx3U5q2d
         h3w4Cb7sKL66CxTlt8SNO5y2wRmazMtofu90OPeuvNnXXcZYZI2qM6BQx/FcEX4CtdKc
         TpCA==
X-Forwarded-Encrypted: i=1; AJvYcCWVwNxU3Qq9Qj9fKGbs4lALyRzB+sTg1L9ja8svDaSeyPkeQnT53XEfNot+9P/4R/tpT13Dt4D+JiTBOKoScf/xAau0uoa50ExaLjlVOg==
X-Gm-Message-State: AOJu0YzmqSCW0zJ5Aqi38Q65w9RJT3+d3yRFRZVvCmr2jqg0/ySNYN41
	Qz6UsBB4pMyjNkbrDAV6llqUKMMrxHHPLdz9dDkGcoWgJ3FEivaWPIyLjFqcYN0=
X-Google-Smtp-Source: AGHT+IEMygHGPRkk63RA6oaXPAij4I7QO4Qy+Nr1+oXenXLN8w5lR7lfJFLWFrG4aC3QZc8TmW1q+Q==
X-Received: by 2002:a05:651c:c9:b0:2de:73b5:4280 with SMTP id 38308e7fff4ca-2e51fd2de83mr24891861fa.3.1715365664318;
        Fri, 10 May 2024 11:27:44 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce25d5sm72370325e9.14.2024.05.10.11.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:27:44 -0700 (PDT)
Message-ID: <a856b074-152f-439c-a054-090e296010c0@linaro.org>
Date: Fri, 10 May 2024 19:27:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: qcom: camss: Attach formats to CSID
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-4-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-4-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Following the example of VFE, move all formats of the decoder
> to camss-csid.c and attach them to the subdevices resources.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-4-1.c      | 132 +----
>   .../platform/qcom/camss/camss-csid-4-7.c      | 160 +-----
>   .../platform/qcom/camss/camss-csid-gen2.c     | 164 +-----
>   .../media/platform/qcom/camss/camss-csid.c    | 474 +++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csid.h    |  24 +-
>   drivers/media/platform/qcom/camss/camss.c     |  75 ++-
>   6 files changed, 538 insertions(+), 491 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
> index dd49a40e6a70..c95861420502 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


