Return-Path: <linux-arm-msm+bounces-12427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D174861F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 22:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53DD4288C46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17214CACA;
	Fri, 23 Feb 2024 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELENp+78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0EC14CAAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723555; cv=none; b=Q3qACQSED2JP6KMuaVZiDXtJ4KYW1oToCpBgluDTEK888rYyNck6PtSNGEuDaAj2xm8Hq+NWa66ZQ362JcozcgcjsI+wAK44Z5KAL9d9rjtIkkdef3aGvN0EoL5esfQJ8xbmrXZR6yX4IZ7W/rtA8mwc4T69tLucbg+aXFlQnx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723555; c=relaxed/simple;
	bh=4cA1/7ZXpf5BlHwUi0lNyjpQUE3zAxpKWBHtvQi8OlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/H3wCybBhsnMcmGyZNA0VJcE1twtV9whR7+PSR9GN+kdl81SK4JNoqFRDRKpkHAK0wbgPB2zB+AqSBaPcUmSdId8y2bYRTCXLP4+ScsmxJIoyqKx8eHOTunKvJeKZP9O1Kp6DMD0qI0/CYN5aHKwLguOSy+57TucFDU5C4eJo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELENp+78; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so123712866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723551; x=1709328351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wlj48Yvl8C9dN9Pq1qofmgeAOpd3I691adplAiIEy4=;
        b=ELENp+78LyXqkSCMVyt1Bk4iJSrBFeQu2PKzKidqSEmKeeOKdP5BRliaF/Hil0sNBs
         vJYB7IE6TiEz6w0UH+IxJNnixPl5qcRNcRZsdeFcypCJyyqtVAjGwxVa1gCi+6nznvqr
         eNevdXw4rRjkpMXYg0vDNEJx8aUmLwwR4hpy1a+pOsBqV0D681aolW4cgeiGHGnKbnYc
         rOFy90EDaFzx5uAwYfdwskdLs3X02lt4V/3/KpILvosWolhKeWq0FSe2Y9LImdFGWnLf
         Kpnx//3vpsOvVK81kEfQ+ycYR79YS4ngKxWFUW6DzH9UBoNL47a/USAXvMbewKoY+38t
         vtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723551; x=1709328351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wlj48Yvl8C9dN9Pq1qofmgeAOpd3I691adplAiIEy4=;
        b=LB/Nd7gtYn+XToB0e64tYwYrayg/YICMwAuX4VxQF97n6SXNl2gj6ARlyOk2hMCSLJ
         RGkhlnMbNaJVtaTkOJBvSf4hkbG3MMZFJWOu76sKJ3TI4N7ksXFERQA7+MPYcUIQjyNO
         iSZrcFvQTMkjP0y+QtSAngtN0PNML/+vyM0oOtJYBFZ0kUjUU9LuriChavDiYdlZwm5l
         5hsiPAHoHPQukGExDPyenuEZUx7Wajl3H8VlWL4hqDmY6JEKjtWc/6Ov0isgY8kdCYIR
         Qsqp7BuNh9+pouJef3GOjm90ggH+d17GwpzD04Olv+Xb+lRpgizQydftx1B+acd0pGqr
         lwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRTA4LEGa8Wqpd3K01RaCpDQE956rQUYZ7xuKqdCNUQAcexxDAnYBpOiJK/UhvLZy6eRiRrNKWcNVHFx/aWhenq5YQHXafqIQKhhACLQ==
X-Gm-Message-State: AOJu0Yx1yy4xkhPKC/Vxr/yiz4eAHNnhN0HDuMQqJUoMYbpkk6R+xQxn
	XkDiAO/V5CQZ1Wbv6vvFP15g5IJfwCH/GRNvk5n1p4pXJPA8P+qLuOqnrQSUP1M=
X-Google-Smtp-Source: AGHT+IHKVTM7xXWNpYqWZ7+73i3AF+KQWLGdN/IjN5953PddUx2WHDaYAeSPLM5k6t+nXaLcMbSqjw==
X-Received: by 2002:a17:906:1c08:b0:a3d:6f47:6bf7 with SMTP id k8-20020a1709061c0800b00a3d6f476bf7mr679677ejg.12.1708723551204;
        Fri, 23 Feb 2024 13:25:51 -0800 (PST)
Received: from [192.168.179.2] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id pv14-20020a170907208e00b00a3f45b80559sm2738150ejb.139.2024.02.23.13.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 13:25:50 -0800 (PST)
Message-ID: <718fda77-fa28-497a-bc2a-be93c3fa0b68@linaro.org>
Date: Fri, 23 Feb 2024 22:25:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] arm64: dts: qcom: sc8280xp-x13s: limit pcie4
 link speed
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240223152124.20042-1-johan+linaro@kernel.org>
 <20240223152124.20042-8-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240223152124.20042-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 16:21, Johan Hovold wrote:
> Limit the WiFi PCIe link speed to Gen2 speed (500 MB/s), which is the
> speed that the boot firmware has brought up the link at (and that
> Windows uses).
> 
> This is specifically needed to avoid a large amount of link errors when
> restarting the link during boot (but which are currently not reported).
> 
> This also appears to fix intermittent failures to download the ath11k
> firmware during boot which can be seen when there is a longer delay
> between restarting the link and loading the WiFi driver (e.g. when using
> full disk encryption).
> 
> Fixes: 123b30a75623 ("arm64: dts: qcom: sc8280xp-x13s: enable WiFi controller")
> Cc: stable@vger.kernel.org      # 6.2
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

