Return-Path: <linux-arm-msm+bounces-10610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246008511E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 12:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A13F3B24273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5D038FB9;
	Mon, 12 Feb 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lsIdvCvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02038DE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736167; cv=none; b=LZRs0wGU7p3+Zw7dNJpkiKX8V2jLwY8Ka0inDW+0WwKD+axRNMQY4dlKcFCFZf/kxGMNyBr40rP6zBBKEE/uj5bp3IlkvVBY+TSu7n9sLbu+4Ljnl51IA48Geteh5RCVi3RvFYDxgmcETwZwoOSeFsvEfMKPuzB95e/RdIsV19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736167; c=relaxed/simple;
	bh=wpiYOgECu9977Z/vZ0/8JhrsCl1AS1MaGureHIXAWRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1O5H5hAIh+Ve3JYgnYNpZeIYIfSZ3Flc6Sbw5x0XDycmtuUTOcy0wbhqWT3hzhP9oANvINFgiakuPUk61q3f5vqLlr+0ZcHzf3oLDn5dqmnlboKRaAY6dlUA4bMOND7Pcxwon7Ab/TxKYzF9rz8Q7+SX/dw+NFpEu/XJ14krQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lsIdvCvC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3c309236c1so196505766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 03:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736163; x=1708340963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nu/BLc+G0j+dxhpvaWaQUUQvIeFe28F1yp/M3Hy+Ny0=;
        b=lsIdvCvCMlGENs8yv+R56ae02IruEtIBPREM5qg6sW11Xy84VSaddN/MLAIa+o0t5i
         mRql6g2ApMFEbxIPO0q7TlC+a7qjS4zCg9toURps3JFTlCDy5Shk/rJhoENvTFYFz6JA
         +FAD3EE6emuayO9UecLEu2QTUvKQMQDxz/fNitmTs2oIhWAHx1LIH/4HTnIvwIjnhTlt
         F0hd0/QYEf4b9xDNAFLjjgL66Ie5LMSROhw8Tt6UolIOYKrPsptaQWzw+9tj5oi4VCMc
         uh/BoZbJuX3vbnB7+o39Wc1l1eITCh9hMFVa2FghNlmtmibwRzG4cm+7P4LIFCPJVRx2
         xt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736163; x=1708340963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nu/BLc+G0j+dxhpvaWaQUUQvIeFe28F1yp/M3Hy+Ny0=;
        b=VPRA0fyqdynC5A23G7aRt3dALC4Mzf9FJSYUDD8Y7W+/CpDHH5TUCTobri66sr/zXN
         a+9K7lxWFUFHL2HNhoA9InXpgPQ7RP00+a+IU1+ub9HuksTtlLy/geE8wKFFzTYZwsQd
         pn/RU0ngnYhzN2Dh2l9XEO3u+EnwmfG5FcW4fv4QnVDW0B/SSFyOw16N8OxDYJW+I2N3
         /zwelZgCopixNIgeV9TtP0blmD75csziaYK4YsuOhK8Z7MHACNDZ69+bMgVtJpe9Y4cb
         XGGj6ONUj6odETvBRS2DJ9PR6mdRKfsxXlNb+UifWt6mELWzFCtklIpQdXCEBCzouHuS
         oBYg==
X-Forwarded-Encrypted: i=1; AJvYcCWREAjzky2dAEthS+bIvLRDyX/9pXAjvYIzQNXLfryaGdMXl2t4mJU2hB12uOalnUHeJ9hH0OO+O3DPYwo3/J1fWHLYI9nPgtZEwSfVHQ==
X-Gm-Message-State: AOJu0YxQGccLnAhiwn9/YXs+gAxIqmF4hXRowj+CmftdyI05Oph+bzzz
	vO1VY7mEmIfs9Zbgkd3H2WTZ5MR3y0y59ZOxdoJrifVWln+2lgQGjxnyCgOi+f4=
X-Google-Smtp-Source: AGHT+IFnJJFHF6/pTZJYI3tfmDrorHBTd5JDi/9xQyeZP8kiBLx5Geoz3LNm8mPfBiiEkqwyrbR8ew==
X-Received: by 2002:a17:906:e286:b0:a3c:875b:41bc with SMTP id gg6-20020a170906e28600b00a3c875b41bcmr1897496ejb.57.1707736162849;
        Mon, 12 Feb 2024 03:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC53xxVQo9GF+ToVmDJq6UmI2T8/DV+bRh1XW42HLnjQDgmRMecPYqi6TmmKbooCVfDDw5ZT6oJx8Pr1wGo03CmJGJpu2zXI0m4+vy+SplYi0+/NYuLET3BaVU6CSlb1cv2TxDKORmYV15ySD5MPGE9Q9MwCAiOM1d2v9CR5R/sjZoWT3tpca1aS9oAzfrGJ/DKGRUr3BCVtVc+oQzcSO+NubLlr05IdsJY8/B2iLXQVMK29YXaWRTWa4Z2vUT5H8tA1m9sLOufP51CITzcxMgS7Lm+QmKgcbrwK/vjEUISpA9Aj0UChQqhIrEpya4MUvSWw3d5zzMu3W8AX15GdUqSxMrQJ71ON7MmQHn0b0K8QkfK5Qjysakj4/xM4O0yPHpgTQeMaK7rLc3APTnqEdb7NBLHxCooaFP2c+Pj1KyrkQzGA4t9lmbznts8e3lW3ayDc/6Ou6yAhhCg86+CBH8BalZL4aPjw4+7aOnA/ERZbtL5hAThKsFDsVX1hgId8Av+7IElkbN
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906074b00b00a3a40b7ecdbsm99569ejb.69.2024.02.12.03.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:09:22 -0800 (PST)
Message-ID: <6d2d7286-ac88-493e-8079-9ca6dfa7cec7@linaro.org>
Date: Mon, 12 Feb 2024 12:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: qcom: msm8974: correct qfprom node size
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Eduardo Valentin <edubezval@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
References: <20240210-msm8974-qfprom-v3-1-26c424160334@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240210-msm8974-qfprom-v3-1-26c424160334@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2024 17:45, Luca Weiss wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> The qfprom actually is bigger than 0x1000, so adjust the reg.
> 
> Note that the non-ECC-corrected qfprom can be found at 0xfc4b8000
> (-0x4000). The current reg points to the ECC-corrected qfprom block
> which should have equivalent values at all offsets compared to the
> non-corrected version.
> 
> [luca@z3ntu.xyz: extract to standalone patch and adjust for review
> comments]
> 
> Fixes: c59ffb519357 ("arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes")
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

