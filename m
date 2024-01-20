Return-Path: <linux-arm-msm+bounces-7649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487D8331C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 01:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FAD81C21211
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 00:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B96D393;
	Sat, 20 Jan 2024 00:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMHtx0rT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64819B
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jan 2024 00:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705709939; cv=none; b=l8grEm9SAdGlmKWsGJJYmjNVSNFhtWMtCLXM9hpwMEhComEj8fWtVAbsfUFypa5+GnJe4m8dWVebPvDMn+faTq+7jrW2BSUJMAzNQhnvlLj+8FcWSulzSi6HZCHHJfyOJBGfl+1ndEHRS1P5z84dur3X/mV9UzAtBX75s6NfMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705709939; c=relaxed/simple;
	bh=LyeAI+qQE2IergPUXlijX21oItp+LcgeBLbUX2TWJPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKK0gr9XhpFMACK+p8ZKk7eOGbIeHPgIjONWPATdObwbAR7lG1Rv2vpeMZmyL93QdjzOkMUid/uTTvGCtYeAJofU3oeb4XQhKcHEV8o/vZ04LPvknkljDe1Tml/lYpISI9DGq1FjDv8Gd6vIzq97ubwR+1k4OoP+kXC5wrJZloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMHtx0rT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso435826266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 16:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705709935; x=1706314735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHiaewmvGd192j7oLMrBdx9eLq1Ov4nHjJJFxgFP//4=;
        b=RMHtx0rTNC3j0/9U9ENM2WuUK94aWGZZ1T/NGreniGwKHfmBq8DvZOgm/fyRD8YO4T
         OuaTLNveFykEfDF76eyKl0n1cOq5eriJZH+flQJKHSHer9Bt+6XdiwdYMYLzGH9uRVx8
         nsor+OfZffsbzk5a3WNABRBlBrkVvGIvAn3BrAuehzOWSAnwf165qFWjvTkpeUTmfVnt
         +pYRjwfQjrHqsHSjZie+ha6ebVBcOQZ7dHKZKzG2xQXtInb4UH4ckzIgM2xbMemmfXxe
         WOtw4PTGr0VsafPY9HNRPeCGkKXq8ESKBU5wKoiQCPzGffKHj5C+Zby5BkKUaYguLggk
         UM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705709935; x=1706314735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHiaewmvGd192j7oLMrBdx9eLq1Ov4nHjJJFxgFP//4=;
        b=VBPbPmOmDEUM9FNs2OvXlNT6W3wZa8vMoHnf+tXQmJLEHhhj3VQbzNbOBYe8yt7Znr
         UQ8ZodYp4gzoDn4Z/ZUkaJOFxWYNrLxl3SRqzU6fXW9+R7JkfPEeDiiYf9uNLdYbOGZy
         n+Dqzqm/ebRQh2nLcUfblFy1btUGFWXlI2dQF7Rww+dehAd3ySBrGRoOasCefB4AxXdA
         JKRUxB3bSPquIRs+kUceX6lpANtp896DFxnU4X0CeFb9jreg3I/umi0x2Vghz+28XLva
         5otzKkjuNzX1dAwS4oTkIx2CwR01iMQTCek8uMsm+skVT833C7P6BAZIDEpXanaUV8li
         E5Bg==
X-Gm-Message-State: AOJu0Ywqpv56nOK3FA0VxgnJ0+k3uuA8t0Kt3oTf5DWIEaKxGwXkkhIj
	9Gp8LPVsrhBiUqdTQAjYpCn18JurMv5HjhE1IonRC/FT2aFFWbsiFvB4D9eyYgk=
X-Google-Smtp-Source: AGHT+IE1M4vSretViXdLCVXDimwICLgLB6Qcy+gkth45GqmA9ZnkpDntz/gnxxeNf5+PLdRXCxQtlg==
X-Received: by 2002:a17:906:7ac6:b0:a2d:9b73:d81d with SMTP id k6-20020a1709067ac600b00a2d9b73d81dmr642512ejo.48.1705709934782;
        Fri, 19 Jan 2024 16:18:54 -0800 (PST)
Received: from [192.168.1.116] (abyl34.neoplus.adsl.tpnet.pl. [83.9.31.34])
        by smtp.gmail.com with ESMTPSA id q8-20020a170906360800b00a2bd52d2a84sm10809442ejb.200.2024.01.19.16.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 16:18:54 -0800 (PST)
Message-ID: <f25d6930-f5a7-4190-a5ee-b1edb0421290@linaro.org>
Date: Sat, 20 Jan 2024 01:18:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Enhance check for VREG in-flight
 request
To: Maulik Shah <quic_mkshah@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_eberman@quicinc.com, quic_collinsd@quicinc.com, quic_lsrao@quicinc.com
References: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/19/24 09:26, Maulik Shah wrote:
> Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte aligned
> addresses associated with it. These control voltage, enable state, mode,
> and in legacy targets, voltage headroom. The current in-flight request
> checking logic looks for exact address matches. Requests for different
> addresses of the same RPMh resource as thus not detected as in-flight.
> 
> Enhance the in-flight request check for VREG requests by ignoring the
> address offset. This ensures that only one request is allowed to be
> in-flight for a given VREG resource. This is needed to avoid scenarios
> where request commands are carried out by RPMh hardware out-of-order
> leading to LDO regulator over-current protection triggering.
> 
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

As others have pointed out, a fixes: would be in order.

If you're going to resend, please name the enum but no biggie

Konrad

