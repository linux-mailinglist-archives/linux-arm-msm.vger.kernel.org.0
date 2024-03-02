Return-Path: <linux-arm-msm+bounces-13139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6B86EE1E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 03:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49D301F23AE1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 02:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2420979CB;
	Sat,  2 Mar 2024 02:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRa9NqxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551797489
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Mar 2024 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709346161; cv=none; b=tfxmvSUYzVbVxAAmc5puwFbpsb8dnFZQ/Qq5Bvqzn0SEA7tsVC4/bflm/MhXPy0cz5d2oZKEt+AoTcwhxttglrX7TvtkwnKvFSjByfmsC/kjafMjQ+jqEtHtGbl8fmqOqGGqW10RNCB1drq64/P8Glb44MOdHtGO5wQtjdEws54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709346161; c=relaxed/simple;
	bh=+vcuOjMgyX3GXLrby3bKMf/a767VWPWJZQ2IjjlKxbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnDhutIyNf4RFkJHB3NxqTK+fyZ9zsvEcf9/tl+KwbCOHnMsJid0P8cD40k1ecfWfRY2QFoeDS02ZAbj1IyjrpwxpSl7c/0s1tsXcONOh3v3ZIVeHkAmJFjtzDSuROtN8HmsVyR0GEkxPo+YPXOjHnTY6VdVmJ8DQ8x/oXu1m04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRa9NqxB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so4382472a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 18:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709346157; x=1709950957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdTUSkVwl2tMINjrlSdiTdWGU31m8cJzam5nmke77Bg=;
        b=yRa9NqxBRS6Qybyj2MFdaf1f56dIpYPIpG6jAwOLfeo9RXzMW1gwrsaNsZXPyzBVOv
         e2QW3Hb9Ae18SK0KmQg7jZYGc3MIylC8x2XspCmQ5CTi8REGLpn5lYH3WnVRtj46CXQn
         USVDISU3LxxfQdGbHNr2G74Eh2bMW9BuWIKxTfZKPd08Hzp+L63shg+DYv/0Y3K0eEeT
         NnZDFzRUmCZ5W8dinqdqNJNPfJNRBTK8GlDwu3UMp6gXkXxNb5xa0hfGP7fHlJrr1iU0
         DpsBE1NpHyJ1GgMXJ/7NKPfstBEO9Fr7uwWFwLEj2897x04g9PzJ8KRAUhYaGX6bdveW
         jV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709346157; x=1709950957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdTUSkVwl2tMINjrlSdiTdWGU31m8cJzam5nmke77Bg=;
        b=a8RCLTuCLfrcoY+i3mghLWK40npYW63SwRMDM2F62OwadVsQKxkM+ji/waG8XHR9gl
         jrfQj6ELJk03D+7/pXxvoGHjjwJMhuGQOm3KlKMFr9CnLXKfLpiuobBN/4ujVY41q0ax
         xUo6+aSjN3CqXZLWoCvLB4MjEl4RokbmyOh42gqTlrnMWL2d2AOiLw+pUJn6ylDou3yu
         EXdMxCOylCgcmhbdUBhijn9C6O9mL0kYR75KRo15+LLAlmbpo65Yq9JVwoKuIBYqeio8
         GoObHR7KTsBdf7hHqkQwCGuNj3DKMQUqgZGqwdtCodhoO0rlfyQGHWoV6Fjr7SBPEKiC
         4SYA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8BBy/4RXJrRYevRbXKlUqbfv7lE/zXrm2Gsgh2lnj6e4enMXy1AkAoADRQRNoY3OsHR/zBqmU/aimzqEgA9DYsPmeriPTNZ0hsRDzQ==
X-Gm-Message-State: AOJu0YyveWMNxI/D0ijGMjHzrWYgWngHtO9EWH+ocFNI36xWqdFsNh11
	5+h5sYItD7heefgEsR83otPZs3lR1BYq5SLB5YB0gHvOMVW1JwN+EssvLK1w9ok=
X-Google-Smtp-Source: AGHT+IFeYLcTkjFHUMJRTsdqrsQ5qiDABIkQoO5ACOCWl8iqixjPyJ4gmXbZ53fgBi+gi9zJ2HGs2Q==
X-Received: by 2002:a17:906:5fc1:b0:a44:512e:9e42 with SMTP id k1-20020a1709065fc100b00a44512e9e42mr1886274ejv.2.1709346156636;
        Fri, 01 Mar 2024 18:22:36 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id bq5-20020a170906d0c500b00a43bf243342sm2242197ejb.24.2024.03.01.18.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 18:22:36 -0800 (PST)
Message-ID: <6f329b93-1bea-4222-bbf2-e08ae7329283@linaro.org>
Date: Sat, 2 Mar 2024 03:22:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/5] dt-bindings: arm: cpus: Add qcom,oryon compatible
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc: agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
 j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
 m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
 lpieralisi@kernel.org, quic_rjendra@quicinc.com, abel.vesa@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_tsoni@quicinc.com, neil.armstrong@linaro.org
References: <20231205062403.14848-1-quic_sibis@quicinc.com>
 <20231205062403.14848-2-quic_sibis@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231205062403.14848-2-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.12.2023 07:23, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Oryon is the custom ARM CPU core implementation used in Qualcomm's
> X1E80100 SoC, document it.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Chiming in on an old thread, please check with those in the know whether
these cores are Spectre-v3a/4-safe, and if so, add the MIDR to the
corresponding white/blacklists in arch/arm64/kernel/proton-pack.c

Also, please check for any erratas and supported-but-not-advertized-for-
-reasons features that may need to be implemented.
Doing this early will ensure we will all spend less % of our time
pulling out what remains of our hair when the platform suddenly
crashes for no reason!

Konrad


