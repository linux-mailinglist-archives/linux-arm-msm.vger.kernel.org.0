Return-Path: <linux-arm-msm+bounces-16910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9BB89DACB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9772290F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BF9823AF;
	Tue,  9 Apr 2024 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJAP+81x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633B12FB0F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712669980; cv=none; b=XVR0/MReH347RcalFHbOrWOzKUSUNmQMw7GM0OpHGo1Z7MkoxIBNhbQf4Tq18HZYyUjV/tsIY/5IU655K7/CS13iFNx2a/WD0+/uwlP77Cdai+j00RYL0udWq7+rret22gWsakGdTEu6fHmmD3P/MvWtYzKqS6RDQ3HN3k750gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712669980; c=relaxed/simple;
	bh=8MKpVT0aV59vFDSP+md7oWv0RBoK+Q+HPk8EuJ8ZxCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pu5hmJVDX3yv5rtQtgn28QyV26azlUrxeTC8Bx/SQ2jRbrBfUFQozhGs8Ug7mHPcnEmlVPWC70kybi/RYktu0royvcqcaFVPqXFbPdz/iAP+lc3LPiS32ZZgJcnKBuz+6Op2Islp4pazPlHZwO4Xm2yBFByj9cEC7V4EEdsaN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJAP+81x; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343f8fc5c69so2329628f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712669976; x=1713274776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRaA6yKrxsnf4LsBY/NreSjlTngA1xE3rkQfg5J98FY=;
        b=OJAP+81xeH48zqZ32JATgUG3bAd5Gn4Zcy/1E7Rvbd1YAgIzpl0mbTxAbhjQZ2eFEo
         mgKNoMf6I6Lhdn9HLC1aefH8IjbsDsvRsg58MTD9QWjhDybYdOu3v1B9NuiXZS8UNynQ
         ukxqnWVdF6dK76JKdw44f3HCytxgumqNXxdbjLCRv9btBmfG0AkxbdkL17e7AzZvFPAy
         qKARquIwzJosOEilwuOCcxAd+GcuQ6aQEwYHFnsGulJhAQRRMQ/bA7/YDDly00gneTja
         Z5XsKV9aQKpAdLIu3qsfh/mljdlwcAp11tf1PbA4BzV43g54e0IOieTx6tgb42iK0gLc
         LN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712669976; x=1713274776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRaA6yKrxsnf4LsBY/NreSjlTngA1xE3rkQfg5J98FY=;
        b=O5WuxjeuNtc6CbjPd863tHcSB2rBShL6AI3oP+gedAq73G7V5D2g4/Pa29pzNDSfRu
         W+HbpBApdNDfL3eGbojsurzMmXhnydHFwB6cHMRiTX9UTNZH2XjWDgvSsxeHXLWukEzH
         1Fpp/5VB1qqaOOUQ5OQrLLl/5aGVljS9jgXs7Y2jYfkRohVYf/hZlDl+Oi5K5UGyNdcA
         9KqYxSgmbHVtAlpA9SwH2vqaCdwBfCZxgZiFtOFMEM5xtPhZ69aRSYUAKhdFcRP/1KgR
         QFN/va95YF5zFgxSFTWSoCDpf3v+hNLvAE5v7wYPvlKnxfBaEwLlNb1mC3n8KB6cbAXe
         YCVg==
X-Forwarded-Encrypted: i=1; AJvYcCWK1pOvsD/rzIQQXs1tIbA/CRQx56CM38pbPr1YiEEmqZkWNgNE46j5mtauWNizx1hpwlMylqloZLC9ydTtapDwB0NqqYcF+wNyCsEYTg==
X-Gm-Message-State: AOJu0YzGQ7VacF80MI/5BKMp7O576Og70hRu3OgOHczK99RlXavuGQey
	HN0nk2+6/rjhABud0YRsYvM/ZsV0ei+yr1ale1W20efg5BUORzuA5tFmKH+K3BQ=
X-Google-Smtp-Source: AGHT+IFj6u2mGBD/yiH0etg9dnHJq4BC8mbVSdIdSFOoZINDWvWfz+aTlDNDkuvtFp1jSe8FxI090Q==
X-Received: by 2002:a5d:5283:0:b0:346:44:3910 with SMTP id c3-20020a5d5283000000b0034600443910mr2538303wrv.49.1712669975882;
        Tue, 09 Apr 2024 06:39:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id q1-20020adfb181000000b00341c3071c93sm11642724wra.73.2024.04.09.06.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 06:39:35 -0700 (PDT)
Message-ID: <18837b02-27af-4d0c-a772-bb7ce787a4c0@linaro.org>
Date: Tue, 9 Apr 2024 14:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add new VFE driver for SM8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-7-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-7-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> +#define VFE_IRQ_STATUS(n)		((vfe_is_lite(vfe) ? 0x101C : 0x44) + (n) * 4)

These defines do the right thing for the RDI however

1. Please use 'rdi' not 'n' as the parameter here and
2. Pass 'vfe' explicitly not implicitly

Right now you need a variable named 'vfe' in the scope of the macro but 
that ought to be an explicit parameter passed to the macro.

---
bod

