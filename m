Return-Path: <linux-arm-msm+bounces-24721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64191CCE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60E32821BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D92B4205D;
	Sat, 29 Jun 2024 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndtnis4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24227F476
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666259; cv=none; b=HyDwz3yJ3vJGvuM3G2CeQTlw32OQxYWaFGwl8mTMzbLQSdbtmYjD6xRngI2NBkLRXrvbPZ/KBS7SzhmD7DRae9YoZ4DQ/PkYQS0MZKxNGq3+OnfKTJ3VDjX0ayUBXKx2IPt3Pa6woO30s+vRhGqWK1/vRPZC3qVZ8aGy9NHyYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666259; c=relaxed/simple;
	bh=5PAYIRjgVBBS3zFOwULbXF/1Vu42rQ834I7ZMdp37dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fABnf/XHEXb1/D3Ahr3ykczW7VKtLUP0qKTyZSi9Q/YzftY/S83sSU8S5L0begeeimetJ55coDhUseiqxyES+7JtpNWluwjuD8ekc5R9IeiXFCfWaMVOQX/FtSfRglqnazEoczBd5EtjMRCEohl+LdoppaL4LDdhkChYgrD/Wz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndtnis4L; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso18076641fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666256; x=1720271056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+hMhKjEObUAKJ1IKbGtbahJo7olJ5ZuXPb3nVMpK2Tg=;
        b=ndtnis4LwkBPAEsN3XzLl4rh/7lai9YoFCALcToydhquuw0rpFhmRFaqjJRGposWoa
         +uPxHFYqesFImY+VzUOquNdH7kxdMVSl3HBWk+q6eXUfSBlvAEiAn2NBKbxLqHsFs4N0
         nZNXjDXQ97y4P1VeDfjDP4mYCPA1/UNGrZZsMaLrDpdg5QUnViqvOdt7f2mVMHasv3oD
         BRA2AA4Z9r4GRYVVUmNPqHpU1Rug+KktxAfb1fEKJQAfkKb/QKY8lWYEASHrBVY1H9qc
         DdfGn+UJtxyhNfhFwqYuPH9NVHSW2xLp/o25W/P/Kd2Mb+FDVDlZwikq4aaOxAGN831F
         fYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666256; x=1720271056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hMhKjEObUAKJ1IKbGtbahJo7olJ5ZuXPb3nVMpK2Tg=;
        b=Efs7ONsxdSRxjgzgX3bS8NByZFKbchXN/0gEewg1UlEHKR8e5wtmJDd2Gr6S538E5a
         aOscY8MlmtMrpqpUMSEyl101FVJ2cFiIs9cd7df0IDkPAk8Is1QBj/xohSbPPPnUoVWz
         t5agq5mhdFekU5kim659xdz610fy0qoPq3EMSQeCXn5CbrIA4nUDZmsZRGZSuuOgnA+g
         hWbJgKkolrr4qb296g5PftFd0o8qhaeRE9HVr/FkCx9iGIo1aEZFXcAjpAoHWmp4F+JQ
         UtKsHix8ml4b7piTeIgSqPB0IBveCU/wrVbnT/j5AtPz0vUqG89gqgwaUvwGRcQ1KSr2
         lIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUZo9qDPAFGAUI5dW5cvMj0SS0ejUz3dwb/1NLPkQiogtvgTD9ID3AXzDUmQH2GTh6PTdQqFqbZw/CRXdJ3IPcxdMuPMVWAUVNEWT7Q/A==
X-Gm-Message-State: AOJu0Yx0aHdiY2dywbwxi+ePHHsCmzOyuQR8KcbT9ZBbzqlF+bg6ylYO
	T8gClsk2vG63whEE0ohwZXSA/QdfX1VlHqGIL+10GlObh4IANC44C8qj5Fprblk=
X-Google-Smtp-Source: AGHT+IHNHcSAqFqF6iqsWHaRbUrhjZsQihjxBU+bVzLCiepT/usiIw4TrW8Nv4s6wMvI/8OQ8U8C7w==
X-Received: by 2002:a2e:9e15:0:b0:2ee:5a38:751a with SMTP id 38308e7fff4ca-2ee5e3759d8mr7006711fa.28.1719666255790;
        Sat, 29 Jun 2024 06:04:15 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861381640dsm2243695a12.50.2024.06.29.06.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:04:15 -0700 (PDT)
Message-ID: <472a7d55-df0a-486a-845c-f24a4196c29b@linaro.org>
Date: Sat, 29 Jun 2024 15:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
 <20240629015111.264564-3-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240629015111.264564-3-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.06.2024 3:49 AM, Akhil P Oommen wrote:
> Add support in drm/msm driver for the Adreno X185 gpu found in
> Snapdragon X1 Elite chipset.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

