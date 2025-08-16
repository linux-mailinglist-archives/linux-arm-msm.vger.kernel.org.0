Return-Path: <linux-arm-msm+bounces-69433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3826B28D4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 13:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFED11C227DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 11:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03832C0F61;
	Sat, 16 Aug 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EkbeJ0PM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E747E2BCF5D
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755342687; cv=none; b=K+4fQoV41puRCYZmn3rx2mnptbEwGzoJvLFErYFGX0rOAuN9tRsM0BkuFMS7dsN0sJahOSvKrD4uJy0D+Tg+/2hoDRoYfQNeeAuuKRzjyjWfSqK1bkrILwKdtEvIczczSMGDB7vq4uOkft4LbXf5+bvMMoONtS+BMGPFBXtjPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755342687; c=relaxed/simple;
	bh=kphephni6vOOZzLCgn3EF3jWXwJKAfO6HZj2Q7ikOgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=im18Oas0sB3UeOjQjZmjOh4hNOQFqI5vHMu7b9794cN7ryK3ycO6+cfvRyfZll+eTGaAF7W1k3OK5jhaIgtqKuetUZkMnPEq79r3mq8fYvXkh8Istj70IXlUKF6pHjTHg0Yn4BgTVtHvrH5SofDtnJBXQpAaAdy/OviflyNNZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EkbeJ0PM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso19853945e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755342684; x=1755947484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQazlP96X9YxyYshwV9Dryvffgq8FmvCYkiqJVEGjsk=;
        b=EkbeJ0PMaYi20TnmxQHMfcRy2Akbe68QAt5VsyZPeM5JQv6LEwSF1v9fF617DrkNpQ
         J4uYXEtWTIfT2QXKlnMdHRhCUbPBh93PtDUd/F2FaZVa3NxGyvI0BT/7wOp4cA9w/QJy
         KeCV+SmyBmiSjO0Fe5FrobeDaz5aHDmXJl9j7wfyS+P1E2B9+SFzt9AgTXGlKC6VhXnd
         LUBgI9eC9Z6ndSCkI0Kv5fu25G2PGHITy20QbNpoL/DsJVDxzjwb19BDhmSwT55MMT0S
         CZLduZ368fduE3wWJqanGbnUoj/tMyWattu0clNbxmsVD8MA1lWwowhURLFz0M/zyE0s
         fOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755342684; x=1755947484;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQazlP96X9YxyYshwV9Dryvffgq8FmvCYkiqJVEGjsk=;
        b=ds1Ta5LnxblVpVfrYfK+V58J2TF/Utx2ZNwc7Sj1fLdV/dqmiqtKbnqKh0S8XmMOE7
         oUaNzkoOqyztLh1hAB8pGLpy24pgaC7FPWIhvWNuqeAK/WvTlfC60zWJLZyemI2Rd3kn
         f+sMytI0uSYViqpC+3vTaC/PzyFFDEiAFetx1EyFXSEZ/2Twv1VX/zMbLNtu5RGLj3Fo
         8xu+OJ7lE5YxFYNe0LaPnq5z1FG9KaxCAR7WGMEMCNqFGl6RPqQdw5OmaGTYk+gUx9+z
         LeqCZ8nHRQRiXsA1lvviCWGfSKcVnyc3P3b4zS7O3BqGqmBBufTEZfsbMjjsnzxEdgPd
         jRQA==
X-Forwarded-Encrypted: i=1; AJvYcCVBjeorOOe8tPYe963+j1T9T6ixiQLwvwpnBT8mRgBAhGx3NHSwTJX71MXKMbRD1IZSuMhR72j3psPRGFlM@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOwOGmqq2T42Gx5TfczJUmkZWh4YGXdqjE/AVI82Ffp10+qK/
	7xZk6wzyzgj//InEBYghOEqbMdEzPLfFTYS7rCFsHsAgRCFNXG8z0s1mh9Kik7jb/9k=
X-Gm-Gg: ASbGncuixTlF4mDVd9p4v6xHdhVJvFZ9jJ/n1dT6m2SlY07MUMPBZJng1f5oJW0XX6w
	mOd5a00vj8nPo2PcRthsM1V/K2gCzpqrD5FNE4pccrpmzIUxy8kObiz+2jzWUPQfVRc9jdoTFc1
	JPUzPC+f/qCxzg+M1l/mOPGV/4oOZXKhLzEr7AcWgYJwtkdWnN1DDhFt4nQXZgMGMdhJDYEZPWI
	i3uUB5QcttpL+vH+PvTVCQKrsyzrGOQuMtCvLfDPa5iIs47Tw5OWpC3sLCGdvg+G16GVbF/Ox/Y
	hJ3i3xiq3K2W7fcMDbpTu6OiJs7vDtA7rcRL8jkEGUkv/tTmhyMTtgx+smGwJ5gS+XUGyU8moKO
	IFsEjH/fLd3NspdurcPu33swxNHqAdDTXi9PDfMBBK+BZ0EjfKybK9EQFsjlKRu/O
X-Google-Smtp-Source: AGHT+IEqPRQvhRUORubCFHFse2xqjo6Cecu2vUGu6t9epbRVpIiCj2OrcF8hOuF7dPmxJ4PLI+Vr/Q==
X-Received: by 2002:a05:600c:4755:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-45a2674e40amr20615875e9.15.1755342684226;
        Sat, 16 Aug 2025 04:11:24 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a27ec6b71sm13584695e9.10.2025.08.16.04.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:11:23 -0700 (PDT)
Message-ID: <41ecbe62-5176-4d57-b181-7edc6ae972a6@linaro.org>
Date: Sat, 16 Aug 2025 12:11:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/24] media: iris: Send dummy buffer address for all
 codecs during drain
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-9-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-9-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> Firmware can handle a dummy address for buffers with the EOS flag. To
> ensure consistent behavior across all codecs, update the drain
> command to always send a dummy buffer address.
> 
> This makes the drain handling uniform and avoids any codec specific
> assumptions.
> 
> Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5f1748ab80f88393215fc2d82c5c6b4af1266090..5097680ee14ebba3a126213c0584161627ca47d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -402,8 +402,7 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
>   	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
>   	ip_pkt.shdr.session_id = inst->session_id;
>   	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
> -	if (inst->codec == V4L2_PIX_FMT_VP9)
> -		ip_pkt.packet_buffer = 0xdeadb000;
> +	ip_pkt.packet_buffer = 0xdeadb000;
>   
>   	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

