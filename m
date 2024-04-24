Return-Path: <linux-arm-msm+bounces-18501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCE8B1461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 22:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF340B2CA0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 20:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5072B142903;
	Wed, 24 Apr 2024 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbenPKLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558113DDAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989702; cv=none; b=PAo0lZqZ4FTd7nB3cI9UVEPY7tDknpbdDGwtMkWLTSsXyE8k0XtL9pTGsyZ2/C7SBnSPeXLMy87aTvFMWlJy870R6MzX0HD83EQ0fjRELPzWqSRIdrwz7ujm2mBikxSSC9aEekwbrdySu1XVzqD1Cc9Ew9Pokqiwzy7oT/RmCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989702; c=relaxed/simple;
	bh=5juKDdGEYxNl2ENPjsF/4a/Y2iZb9ON1oaGj0sw8O/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ayk+QxFboWsKeQ65rNOkRWEDGtfKgMwnDLOeWtrMzalAib+MDhe+SXuIuSTrE2GtO5FbK9RWpVRHjWzD0KIgOGxu2fEzl7OPM2umlEcB8iqKyWk9RwPSv1a6wFe3dxjVGJEOhA+CdzNlZdqiIHQm5rv1sINWmiJv1SFV9z/S/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbenPKLW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5176f217b7bso432180e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989698; x=1714594498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=MbenPKLWtF0nn+uFB1Alyfq3Yx0wO9CTHaO+PrTgOAam7ai/Ezt0UZVNHQvWk9Psa0
         OOoCT44LoxsOBtKSkxcB5qsx5FQSF/BhxzRgDbcpxu6srCRb4m6QVEQJ3zfSzZuEB9O9
         E0+GgzvYyiY8UWkMSS9qLCvBsGjswoXNSpk2Mk8D7WCejjp7nANAwfaP/yx+WtuG8/EQ
         GlgUNiXjR/xaPTYRUKd96axAKYNti74m/OBTCAdngC/9OjC2X9eg8HiFR/rPJpXMg8k2
         KVb/PmeNMC7bV5AjejunlMRQc10M5UKco+8dS0aDP33k5kFN3sNiYdD5KVxGaBf7T6U9
         21cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989698; x=1714594498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=s5RquPOs21JpkE8dMEqy8qXEP1+I4vqmQrKPhr+6KExdO2S7PE+ykWmwiu72BthQrE
         h36Btn6Aopf/VhEGINmXkwAK2VRlwwdfjJbKpQM+Mwcax37O8NX1niRml0xp7QrcbzbO
         V96CysTTW2eBLN2zp/NPSINp2mdOFUDj/FoHicNVAgWRLkm89gPaX5hunQcXMx1jbha9
         TjyP/kiu05fV1+7WgQzwintL7hHvYNTMSIPittuvaekZIt75+vr5kTubrz+NkUK1PVQc
         TwaU/Q+gxXdOSi6E8bQB2XKYXexVo1WkjgC1Uj0KvnxnIGSbbINksTjXaJ9xW1AL53rJ
         abMQ==
X-Gm-Message-State: AOJu0YzHz22MmmGF2+KJg9gLNTaaxkdIqjPadnTw+sSuvmlw32H8vfNS
	uvMUzYKc7x/GILuZ7xWSJbZhrm4qqZgvmhEN1/KrpH9lq9lOEJ8hhZxCzz4BAgY=
X-Google-Smtp-Source: AGHT+IFWfKmpt/zCTTNaAgChkLXIuQcnFtLqUQiBwozFZAE0yy2EsRl8Jcw+q9SGpBpbDe5si7kEpQ==
X-Received: by 2002:a05:6512:2209:b0:51c:249:56cf with SMTP id h9-20020a056512220900b0051c024956cfmr2416526lfu.13.1713989698079;
        Wed, 24 Apr 2024 13:14:58 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d42-20020a0565123d2a00b0051aef948b0asm1554274lfv.201.2024.04.24.13.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:14:57 -0700 (PDT)
Message-ID: <b4aca81d-5fec-4780-96bb-874816b77ba2@linaro.org>
Date: Wed, 24 Apr 2024 22:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: msm8976: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-6-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-6-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:23, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

