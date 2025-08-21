Return-Path: <linux-arm-msm+bounces-70074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E3B2F085
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012CC5A4345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85882E9ED3;
	Thu, 21 Aug 2025 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVm3ZGwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057A242D76
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763422; cv=none; b=THnrIhhx/b39sYFH7scAHHdVAXhQBMgCF4WIw7ut7cxBsAL/raQG1pzIQBenR9zH3X1QI42GqLrpQsYAHD+6YKItHPfUC2S66ZMqU15gQcZNSsZsIzpzwDxg/sE4g5OVPAvPZKsO1Om+g6kbJmjyqhSfzccuWJPcvE1qhxSreiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763422; c=relaxed/simple;
	bh=C/eiv5q+ImrialkjcooHtCZD+FBwZF7ossUvqO8kMwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGgjLppmz0goN4Z4ynWiDO4yXYP8IQ9BovfOLZUC7ZYHdKsD5spoRp0taEn/ypidVCpVW29AxS/lkpkA/hiQTUNqRX5AP4rHyx3b1a2kcutfJ/xN8B46l8+cOqDapjalYMRAGvZ1rVbdHFop1ZlEoCq8jAXWKxbB6YyDpr+uJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVm3ZGwf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso4743145e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763418; x=1756368218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPIf2eULCAMXs3+uk1dB1VPHgpKeONu4TT2vxqp0Ehw=;
        b=oVm3ZGwfH2EAw/ZOApEKvUD5EBU/NfD9oPCdilVtU6QRlyvQ8g03tTZhbqlWUPjde0
         WVFrfcRN+2fskFysG9SsjbXupb5zfzc4dleW5g5o9ZLZ9Bt48fqEhIAHhfpmHjv3RL+E
         cxxyI37fFQkXIRB+wrGNXhcACTIEiAEvLa+rbkLwtyjZX95RY72L8vqKNypNkA/+jPYC
         +9CtwcAPo3etREKHKtQHDnNFdykUGiK7SkP5+90I0rMPPqj7zms8SLgtY7K+Hab3tCo8
         eusa0CsxAHmQee6LhvR7/N2Wu01DUP6Vs4DqHGBjnlMeSBDOiz1ioIcuXHmrIcgmZYKq
         ppVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763418; x=1756368218;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPIf2eULCAMXs3+uk1dB1VPHgpKeONu4TT2vxqp0Ehw=;
        b=MdXNjMQK6l5aZ9aSLmV34DJUKMrMse6PfwUlqo4/F3W9BBKTtzewMfdC9BBVZUItpl
         HIVThhf9Y+Dy87WUPoRSjFzgOZM/6+ZejdF5Bm055lad4QuLFp0jwkj4jLfYggRrnVrp
         nEN/SmD2nZvVXSl41BPOlwOZFOcAcrx+kFbJsHs/vRXFuExZICax2MHLtkoZvLkhtdk6
         LouM5rsnhas6sCNimCchhH8PZAIg0dcZyaI4cQnUU3uQzdcyhDMXn0IKBGkCoSVY73p6
         gB6I/g2WeuMXmwpHRCk4eHLeOOnCgf8FzrKXAHgrdYhnffvKIoHcYX07288FoU4XLdOw
         gO+w==
X-Forwarded-Encrypted: i=1; AJvYcCXpoxoHvczkRAXa1HCxs0LuaeQqfyVSvxB7x/PRjlrCHzodW1RQBkVqylXYA09PNV0yTENsvpr19SAKv0UY@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBjwaDXbMAvO1Q0whbMX7gZRChnI+BYbMVsWkenvs8QTyE+0/
	3DoIrJAzEvM4zJFC7gBMMBpmb7T1uEwci3+OHO4+p0Hwn7KRa/rHpppQgKK7dR9XKVg=
X-Gm-Gg: ASbGncv+QTwNzVOlOanYl+SLC0vTcyhfpX7XervNYTbuD6Oj3ynmWMgYXWq8LKCH0ir
	pIKExcgKIcbyg8rgHkLqG/J0z3IZxXiwtfVjGUBCWOcxNp6biE2gYgIuOmO0q2YyLbcZMc9giA/
	nNDFyq+CbUS5ootVYzWN8F93x+qjHwyjYCAjmN9FOSQ2urtqjc2uZvcmjv5nfDidKdocVpkSrYl
	B/cp88/m5MhXAfBS7G9kN4DYdTUe+U/WQudjGu+tMtRgBpyBHza6F4tLv/+nKHLDPFZXR3VscSa
	EacbXNAooPaUzvr3wZRHebCdSDvA9DvgWOLzx7upDeIty7uRu4+8YeP6uAgBUmx7bHJcnRpMPhM
	0qOfteWCo3HDEtrxrKg9vYJ+NWPkyj6MOoi7Qd9P+AVZnJL5vlH2jsrmtj2otTFLzd6Zcgt/YtQ
	==
X-Google-Smtp-Source: AGHT+IEHomoTcPzi3SYTo69eEu7KMiWuzYDZb7aLDP3qy0VA1T5c3IbeWt2cpIvR/iXXdxI0Ai4RWg==
X-Received: by 2002:a05:600c:3b85:b0:456:1204:e7e6 with SMTP id 5b1f17b1804b1-45b4d7e8238mr11688465e9.11.1755763418103;
        Thu, 21 Aug 2025 01:03:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1a12sm10376095f8f.34.2025.08.21.01.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:03:37 -0700 (PDT)
Message-ID: <95ffeb62-0a48-4d64-b6c5-e6b4ee932e5a@linaro.org>
Date: Thu, 21 Aug 2025 09:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/26] media: iris: Report unreleased PERSIST buffers
 on session close
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-2-80ab0ba58b3d@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250820-iris-video-encoder-v3-2-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 10:07, Dikshita Agarwal wrote:
> Add error reporting for unreleased PERSIST internal buffers in
> iris_check_num_queued_internal_buffers(). This ensures all buffer types
> are checked and logged if not freed during session close, helping to
> detect memory leaks and improve driver robustness. No change to buffer
> lifecycle or allocation logic.
> 
> Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f..5fe7699c611583463231a60058d6960b6749edf5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -246,6 +246,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
>   			dev_err(inst->core->dev, "%d buffer of type %d not released",
>   				count, internal_buf_type[i]);
>   	}
> +
> +	buffers = &inst->buffers[BUF_PERSIST];
> +
> +	count = 0;
> +	list_for_each_entry_safe(buf, next, &buffers->list, list)
> +		count++;
> +	if (count)
> +		dev_err(inst->core->dev, "%d buffer of type BUF_PERSIST not released", count);
>   }
>   
>   int iris_close(struct file *filp)
> 

I don't think this change warrants a Fixes tag.

Other than that it seems reasonable.



