Return-Path: <linux-arm-msm+bounces-17102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8789FF44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D73284ED5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E49617F373;
	Wed, 10 Apr 2024 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnfKzdLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20517BB20
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771870; cv=none; b=if5Nd+n6WhT1Fi9Bv6BMfi+wd+Ke37Wi4upr30Cs0WyYobELktYJr2pRW9IfGOS+ImLYFq0DRSQrU/TEEjnDX0/d60s60VZ7TCeeH2X2aBkE3KjD1h0cB1NlOx1R6HADVsM7CCk0VAEGWPYJnQyp95sm/SDK3dVf7Chv6YC7IjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771870; c=relaxed/simple;
	bh=KSSlk8bsMALzU4aLOuDQa//L0banKdQVAiOoA5qSe4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hlWAdup4UyQ+AockfIFocSxu9QKfSktxPykoqkMMcHZTlhRnFDLU3xesQVWxPbggGtUBDipC7ENSueJKR69fG9OWTrmj2IycbJc6bSnikPmui4LNQm4I8vT/Ii6Lca+jFab/PPk4W2lF+7yu6Uxn820s4ueAYCB1S1TPkDvIw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnfKzdLO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so7548611e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771866; x=1713376666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VriGxSmeAMrd0HbAi17rP97R4YzqX84RVPW8DEU7SU=;
        b=ZnfKzdLO/4IMEV7kbHAfKh+shAIF8ik3U6tXW67i05NSKi7M3bUYX8rRFTiXyp6Cu7
         0qzdsvqZ9Ctrq/qyOlrVIW+rYJH7+5e1rodVxsJtjJo4/GfDpJKlBtPp3bEwRkoGN4/z
         RyZIVhsMuyefSQ0WmUCDtNVUF3VnwNF2FfJJlH+BnBA22f67HW8k5MUadV8u3S4m/2I1
         2v63R6eQsqWp5TvKC+9PHpohjb3ntEyV4Q9XRhBMpQ3WIJTm6uKDBleGXBVrtN2QnPCp
         ko2i33Ywibxalei5L/NuQvJzaWGJdIjQDjL9wE/YFzvG9gtGOOQgT/VXJFY/35eqKBPX
         KomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771866; x=1713376666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VriGxSmeAMrd0HbAi17rP97R4YzqX84RVPW8DEU7SU=;
        b=mUYpcUvZihwvBHWfCoy22B2FDODw8C850kmyoN+lE1yGWqNU1ZuzsAQw9srIHoSVOY
         eXM+p8zEkQ3IDHftwmTF3qju9Gwcl0HGvtiTaMDqu85nj0Gm54o27tK+bBdTdDBK7ai/
         5QEsAYc8yiz1TMk6KgZIkHrky1Y4dJHSmP/ZafnKuodPDi4yY/UVtlBl+mCzohRl00ZZ
         dBmMHcLCkjQSI4Q9SblnHAOg2f/6Z4fbcQ32+apnQcV864wpZf1eIM1rNvPKEtEURSOe
         8juj/tXwfraUUuXMwkT+CHo9f9LmfaX/yOWMa20L/tgN8SQ+vYArDbalMQPVED7HDMnW
         KRYg==
X-Forwarded-Encrypted: i=1; AJvYcCV+2c2zAHtpv0az5S21q+Nnz1iShgPv9AF0Ng9RmtZUFRyRt78k6avF67wFsLRmre1jpfPQ89v2OgliPXabp/7Q7jHg3OmL7T+oLrVNHg==
X-Gm-Message-State: AOJu0YxAvFCSLUR1oXc7VkfjVDBiEc87y4H61uwXdjpd8Nlth4GgiTqV
	N+sdBK5yYYciDYdSDpTlJT/3jAaReb400FpOqPNzmqznejir7J3WruG/njLIgJo=
X-Google-Smtp-Source: AGHT+IEMn+7QOBZoSPpCqOFaNsmBHfuxXi2Pq5xTIAsOtgQ9XvtVpkTgTWFxslo2PrKeDv5iStEd/g==
X-Received: by 2002:ac2:4198:0:b0:515:d1b9:3066 with SMTP id z24-20020ac24198000000b00515d1b93066mr2133456lfh.46.1712771866030;
        Wed, 10 Apr 2024 10:57:46 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y18-20020a196412000000b00516ce0257a8sm1915241lfb.105.2024.04.10.10.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:57:45 -0700 (PDT)
Message-ID: <16bba953-d6f9-4701-8b95-56b3231c5f6d@linaro.org>
Date: Wed, 10 Apr 2024 19:57:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410155356.224098-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410155356.224098-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 17:53, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

