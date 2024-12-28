Return-Path: <linux-arm-msm+bounces-43559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6D9FDC5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 23:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38A963A186B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 22:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F7B1917E4;
	Sat, 28 Dec 2024 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tp4cuecK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082B198822
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735423913; cv=none; b=U/95uskaybJwR97q0r1pxP9bTm9SE8Xh6wCfppS1XFEwHUUO43w9i2NsSnXEkWaztvU2GH0lEyXt8+p61MuJ7RA/qGsoMI7p60ifeMV7WN/yqfr5ArqoD7iSVYW0RwRvRF8Izz5TuxToT9r0bGXg83BogfxsdWS2GfA2l76EtiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735423913; c=relaxed/simple;
	bh=dsumvKcsY6ZUPbUCkKvNLbAtCIW/62UblHiMJ6YMLwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+ysdl4EvLBXXSx+lPyX0p/N37wbhAIgq57rqUmvbz7dF+5mSXF4LBgCwWe4TnFcyWIRD4a54Nv1w5jtTp8KBHM84yigrc7xP2z7x8bam4hJbltJDjU5ryNACvvXfR9i33OcgXlpwoSTpuddt/BD1D6PVGm8ZY6Ngutt4HtNi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tp4cuecK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6b7f3c6edso115117566b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 14:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735423909; x=1736028709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=tp4cuecKrJnjh2Qyk0nfZD1MC1nPAyh8mg2WHybfGLV00SYumT0DcBWwSaWCtxGoZO
         0/oesgas941nXYRTBgAWCsEAeTd7XjHa2TE9DOk39ZFKGCfi/h9ku4ptwWrFG6AQ+gS3
         NraG9qB27/Ka5LHaxGT1pq7sCu1+xj3GvqUObbz5nNzAjHOwjRxDcrSJYCLPgajw9xyD
         iG9smbtlYGWr/40R3hpog8Ps8plF/krxyXuDDLMR8N0iCxWGDQ2SvKffNtpGPLxcup0a
         4iQn7T4UqcFMObyRdAkWTnnQJLb1azQ8hJZ83Qc/cYDjzsKgpv8PhoxhFxIfYppFpDCX
         oVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735423909; x=1736028709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=H86FQpK8T/9DvsVmtupMeEyjbZvmCFsL9x2M6p/V2SVDFM7V0JI4qB4yZY/ISdDyYB
         c6H56BDYMCFozAJMfVj1FAgTGvnHbopa6HJYz8auo9RNCMgt8NkcbcimpN4OXXh/oV37
         78NaM1f0Tl/mxCcxzjg1ehxsfaVyZCyDgxq+8MaZbfdRwB3QAGlY7XzXwX9wIEy8OHSl
         Us0WypYBJVF0AB+XKoBbv2wDEAYkMZbDH2IGahLx3ImEwYjlfzBAStjC/PqCeysvEN8f
         4gOIGklZ7+oCvW9oUlzMtmNJWjSdiyu9VxjiVEgWsh2RVD8zm9r/zpPWpO+mj9pNA7/r
         s3iw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMjeHzbNm+J99X+8rka6zMi6A4dVh5Be6GTtB1Kz+x1rJi4aSV68qAt1rD6wLDhLz2SPKDOgev2MxsRyP@vger.kernel.org
X-Gm-Message-State: AOJu0YwJOI1FZOmjOVAqtmxhTyq1W0odgLDD+4BUyRg1CDIXdG/m8mmO
	FZzhwxrj+caByXhPm+nlx2cXtuA/ZrMWwKL/qGrGSUgMhqSCxyElpiI4zZEvWvs=
X-Gm-Gg: ASbGnctD1CPG33JxYQ0hDd2yVJu7BCMhQG+W3jwUi2hoqU+pQzYXr/KzlAgYcjFKJn9
	O+WDGK/G2Et6EbW0VxMdOv7SLpBG8CP+eGd2/SEXNkenDb5oGsS1MBmanBNDylTRr/XrBLG9sDJ
	xbJobII4vcFdC3GJVA6qPhIp9fKh1Ze3QHAtumLhR8naheUtF4Cj7jM1Em/MAQ3lNHa9b5su0Tb
	UAfYJV+mvUcTcQPxfYr9y2V1OVuLkwDktxsKq73li/fERGsbKC39AJJHXTfB6Nex8H6oOC1uIhZ
	Vax0SR0WB5Mv1CF+KHSj
X-Google-Smtp-Source: AGHT+IHGgsGw0OIyu/rgchiAV643jX8oLg9LUPYWje5ei4l+vnrFmsOwbdTEMbxpvbrkHNX5puRFmA==
X-Received: by 2002:a17:906:7951:b0:aa5:a36c:88f0 with SMTP id a640c23a62f3a-aac3378e312mr895034866b.12.1735423909344;
        Sat, 28 Dec 2024 14:11:49 -0800 (PST)
Received: from [192.168.178.85] (i5E866BC4.versanet.de. [94.134.107.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01608fsm1290606266b.150.2024.12.28.14.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 14:11:48 -0800 (PST)
Message-ID: <a8a8b1d7-e895-498e-835d-8ec9eeb5068e@linaro.org>
Date: Sun, 29 Dec 2024 00:11:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Content-Language: ru-RU
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241227223230.462395-1-andi.shyti@kernel.org>
 <20241227223230.462395-3-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241227223230.462395-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/24 00:32, Andi Shyti wrote:
> Avoid repeating the error handling pattern:
> 
>          geni_se_resources_off(&gi2c->se);
>          clk_disable_unprepare(gi2c->core_clk);
>          return;
> 
> Introduce a single 'goto' exit label for cleanup in case of
> errors. While there are currently two distinct exit points, there
> is no overlap in their handling, allowing both branches to
> coexist cleanly.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

