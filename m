Return-Path: <linux-arm-msm+bounces-3049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B2801EEB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3AA0280F3E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ADC21A1D;
	Sat,  2 Dec 2023 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uPfywUtF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F8D11A
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:08:51 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f65040beso5512731fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701554929; x=1702159729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBnQbPIaKZ1FnI4i+KfUpDsqKQ/SRB/Q4CkBHEZWQ+s=;
        b=uPfywUtFhR8c5xi6/Qgy3ymOSXmuLeeo1+KUvlM8WrITbezBgmVJjSsSL1Kl27rmVD
         RsNIa7VJ0c5YnZ5Cb0era8/aWqAp1kAVuqMcqwizMcnphe39h3JaNNWgLfnOc2aOfif7
         6pjAx7rvbxf9znkLatLkmbKlhepZsCy9IwKUJXPhpykOvKUQBXttzugqApaQbKEnJl9k
         ULAn1wsNS4vzEoLUsMyRrc8l61lQGozs8zly++NBs9bqWR2qkV8a7O08BdHsaNG+CJyg
         6OeAST238gS2573L7tMj+FviEtVvETsqobLj3ax/WiOQ/RtY1sphjaccaYTdvKhyB5R8
         VWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701554929; x=1702159729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBnQbPIaKZ1FnI4i+KfUpDsqKQ/SRB/Q4CkBHEZWQ+s=;
        b=KUocfB1y2+tlEZyyzM58RQnpc9fdErL+zp540oHz6o3WgrqMxduok6dziaEOQUAxsq
         qbZTWZJgjCBO6Lp9uA3gd6oCBbN5b0487i44lTW9LYv0MkqvF3w8He1q9ZCaupkIj4mm
         zb9aftGbL4+YJ4Digba2leeKCquK4gtJBW7bsqZYg/CKr2j8IyGhPgc03t15vKHCqyeg
         oQWL69gy/0Xpc6g+F/7fnY1bcjt3fNNXsgNF5eyssNkPuxoMd2lTx7wP1nM0uvFe2YsC
         MO9WrM1hkqjmbq/RrD9Mkm1A1DI4j+mP4WFZXsvhgMKnvvREP37Ts5rYhOq6z3wXr6po
         884g==
X-Gm-Message-State: AOJu0YyLIT0ZcLtImZGPRU2BdRchIkiaPLwVGFwNqpOk7c3093NGS68t
	2ax/Kwvc/b1WF5L8iw/8mQVlZw==
X-Google-Smtp-Source: AGHT+IHtNMy5Yq1qJwCjIbPETZ9dRA+AvYabXqW3vd5GCgYQ+Z9Fd/TLncg8J3C2Wr4ROOmIVxmsBA==
X-Received: by 2002:a2e:b0ca:0:b0:2c9:f57f:fcf6 with SMTP id g10-20020a2eb0ca000000b002c9f57ffcf6mr410723ljl.37.1701554929583;
        Sat, 02 Dec 2023 14:08:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eba15000000b002c9eca858a0sm344305lja.137.2023.12.02.14.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 14:08:49 -0800 (PST)
Message-ID: <124cf6d1-16b8-45e1-997c-24f176f59e20@linaro.org>
Date: Sun, 3 Dec 2023 00:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Fix null-pointer dereference in
 zap_shader_load_mdt
Content-Language: en-GB
To: Kunwu Chan <chentao@kylinos.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, jordan@cosmicpenguin.net,
 konrad.dybcio@linaro.org
Cc: kunwu.chan@hotmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20231123033329.27477-1-chentao@kylinos.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2023 05:33, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


