Return-Path: <linux-arm-msm+bounces-18934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9198B70DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F051F237A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4FD12C499;
	Tue, 30 Apr 2024 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="embfVNKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754C12C46B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714474245; cv=none; b=tdlRL6lKw7j3AHcb23uh3gLnbrG8+2XuaV5mS+Nz9YfJ4Zq0LT5aA5QFXRjZUiLeDvBg4xIRknTyPDve29lVsDoLf/BTe82JLvAhr2PJUr8O5OTNd7ktfT0XPPnjX0JlOVqKA6MqEwK3pT5aLXBLRNj3FWMqdwmDPKImQQRcETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714474245; c=relaxed/simple;
	bh=mRsxVvx9L5BRMyJ13finFLcew5fRH0ULvgWm1yQ7GYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/dnN2WZpQX0SAcMXYmfrjA4KSodU6nNZmlBlxgAZsmGOSAXjjfrdxP2V4GCkTA/7qdldHmmxHwIVG/n05L7+ds64W0yZbwM4ZqlcUAd3RZKRjfPEIG72swwrciVYUyHFAnuZOTP7BJrvHxHC29VIZ3G9zzkxq3TjXz4JDlKTFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=embfVNKs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so6720918a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714474241; x=1715079041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=heDKZ4eTBF6PRoXX5DIUciwgFRkTeI3rTInleG5oDYE=;
        b=embfVNKsSHEVZdDB1zSG914H7X4kxhjREckFq56lQhZ2wingEQaCdAS+aJTSDcxlpD
         A3YtuX2HdInv98q4ylp4jgfWGTSRzUjshUQZCLKEW8Q8h6D1VGvSiQkGukBTPfRAnEdh
         fOkYy8H8A+fBYFjwxGN+0gjGmhPv+Y4sN/QCIqNLELzNRAfK/o4hVH3l23/9QnqOi7g4
         x/gZal/qgrARq7PHBrJ1BvNkHN9GEFMv0248MVINo7tV68bfx3vTkHAeMcleQbKpGdoA
         JZ3BGMyueoY/liKPL8f9A3X1lWFUOfdql7TGmFbinmfB+sNPijLoFzXDHKygy7Tk4N4k
         xIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714474241; x=1715079041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heDKZ4eTBF6PRoXX5DIUciwgFRkTeI3rTInleG5oDYE=;
        b=NgHbS23uK9llmlfe//alN3iKtl/DwA6y2zu4/1krh38uSWQzK2CEnbRDlXsht0Emmw
         PaAX81hiemjFLuDUOdpRjxYC0bD5cgRamOp7Ocr0MF+pbyCmedLTuMou9atlH/MBdtHH
         A0yEHaXF76GW103QPKggR3Z+x54CtVbC8gKmoDuc0bC13y7XS0FZqTaidWOjf45BaEtd
         6n9cMWh5iYGJ/El19wDl4L+41CiYD5QdIlygNB51ce8vYl1Vdd2hi7x5jTRxnj7fCdWc
         3MCsbdb65kX4MuNUPralGRy1jfG49Iudzy7ueKbDfNOmL2/x2oeA9e2umImgFjphK2Q0
         xHfg==
X-Gm-Message-State: AOJu0YyJMUKHmrCzL+5X5UrtPgVwXe9LaLM/KcKWr0FTjXJuz6+p0qyd
	vS5GmUBvloa0/iH6KU1rG1A6xA6EIDvi/Ms8fwlsNzOVR/p/o1tsxghC3sWq4D0=
X-Google-Smtp-Source: AGHT+IH1XYonBidSUACstLU6jC7krFVAZzpuAMOU1LAElC67702TrtyyPBlsM0c3CMPFlJ3N3xZKlw==
X-Received: by 2002:a17:906:e255:b0:a58:7dab:28a2 with SMTP id gq21-20020a170906e25500b00a587dab28a2mr10103009ejb.48.1714474240667;
        Tue, 30 Apr 2024 03:50:40 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id y12-20020a170906470c00b00a59168ab380sm1057967ejq.140.2024.04.30.03.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:50:40 -0700 (PDT)
Message-ID: <296424cf-8b8b-4a0e-b531-6ca4f37cfa60@linaro.org>
Date: Tue, 30 Apr 2024 12:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 12:43 PM, Connor Abbott wrote:
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

