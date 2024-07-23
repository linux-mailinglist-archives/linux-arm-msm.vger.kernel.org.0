Return-Path: <linux-arm-msm+bounces-26869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6096939E51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9731F23002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F32314C5BD;
	Tue, 23 Jul 2024 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W//7WzN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2BB14C59A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728610; cv=none; b=sy/uHbljhJlVloFGA9IR46xKxdFgKyG3+EBZ+GlOIS8wSWI+b7bDzjuTjRn09YuZlqgmQTFcjUh6rdJmY31ETgit3q1/nnekNA//bf1Mz4twjbnr9sAAGZtFUauOdDBriFaV/GvSIXprf624GK7gTnqe1YnFZIFYMCnA9rutxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728610; c=relaxed/simple;
	bh=IGzLJ/cCMteo/EZCwnnZOuSwU+ln9rcjHMLrHfnLqmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIrX9U+UX9f57upRk36ipi+OusxxFNIu+VUHKDD25BWKaPzzjkdgSH4qEfYhQ+MHrnaeubMaUqQHODXRrqdkmOXGg+HWNCOLGc1va505oA04ZzMC1PwRlDLOxrog9CbXXc1tGnpBvbj/lvhUTJicxbfdFFZQbHMCll2qCwcwa8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W//7WzN8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf989so3961149a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721728607; x=1722333407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DwQZ6rkqaXK42cUn4tfuoBvmbqHZq9bJ0IAvWzU9q/o=;
        b=W//7WzN8TzUqlp/hd1lXJrDcECyWFwZZWvRrDiAl4aMUBrvogqgOvL8ANU747Hb4mH
         makdvlbP9hHXnOvnH6UejhgSmSE7Ne7rCUgZEeWfq2SRpVpEk8fhOiMxqyMkuxSWmHAm
         CQa6vlj+aCNutbQua/B68oJquhQ0XbaoSV8CCOfcnKWJyczQS4mn9OnPNtm5Rn7sO6Qm
         QXhwMdCXQwLpUUW71chVekWbIKUb144yKhLwK2/gHURIiXVbhG+i9C0ufyWJKaWgn1nW
         68qgEEdncY48dR15t+pal0T7q0bscBhjYT2CC2DW7wiF/T01HCi/pN3sjZBgr3xdoIwf
         C3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728607; x=1722333407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwQZ6rkqaXK42cUn4tfuoBvmbqHZq9bJ0IAvWzU9q/o=;
        b=quWRlqNmPHh6+nWHTaRKxBPyagMYXGM+KwdD5OsvwfjkAS01uh1aZH/uXC+lpNmWLb
         e3dfwInaP03XxDsUP/Tx148EJvbtpHf+MVQrza6Gs4wQjzka2Mf83g+vrQOJEigQ67x0
         ovLBM1YKt8r7itI/vx3O31KdbfBmo00it3gr6w7UYmzeVcaBWyOH2H+LgQDl0DcRib6S
         ZUFnMPaoEdrXzb+ZZ/5bjI1+zB7K/N9RSvPMETE0eUTV3Wte2xfQ+x9hL/DAjNboiJwL
         9csS6bmFqOa7hffHeAP0UGNxl0b6W6UMTxVFCFVM8kZGI8Gs5uuHOTYoLMTCQy7+0hEE
         3XsQ==
X-Gm-Message-State: AOJu0YwcU8xd7iugzYWPZZ1K8FNayXzbvmTDr8cRC0jt6hfxr1ny/esO
	F2uri0RSnoZ8YR9T/uMCFRdbzliwYE5Cv4lEiNl5WTWeIdbSv8kZLqf9gFDLOis=
X-Google-Smtp-Source: AGHT+IFYd5Dohe2cteD7Pwi8FdGcXB7HiMTaFApR/yDRBF4jc+wklVC+ktnl+JDRfExtkN6t6iSM4w==
X-Received: by 2002:a05:6402:350e:b0:5a3:8c9:3c1d with SMTP id 4fb4d7f45d1cf-5a479875a8fmr6404915a12.14.1721728606806;
        Tue, 23 Jul 2024 02:56:46 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f86d1sm7204794a12.73.2024.07.23.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 02:56:46 -0700 (PDT)
Message-ID: <913ed537-d619-44d3-8d71-610c695fc01c@linaro.org>
Date: Tue, 23 Jul 2024 11:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: Update configuration data for x1e80100
To: Rajendra Nayak <quic_rjendra@quicinc.com>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240723081542.1522249-1-quic_rjendra@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723081542.1522249-1-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:15 AM, Rajendra Nayak wrote:
> Update the configuration table for x1e80100 with the latest recommendations
> from the SCT table.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---

Boots and doesn't explode

Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

