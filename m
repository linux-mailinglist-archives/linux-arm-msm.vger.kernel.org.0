Return-Path: <linux-arm-msm+bounces-55226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D146BA99AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33B51B80EC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8791F9413;
	Wed, 23 Apr 2025 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9eszGJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243785931
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444212; cv=none; b=VrlvS3g2p3okunpV91fBlK5g8bMxKTXFm+mZoSEkBkFnwvphQqb3lA1u1XRwuhU/Tp54Dj9+hwrDsLGGSixfdnGpe6a06zuM7vevIhRkpsWWvnJ7BSA+Z5WfA1tqgG4DyUrJEmInfGAc/a7WA75LQSc4z/VOE2unWYqXXxCfCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444212; c=relaxed/simple;
	bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8JyduLFM/Qi+Hw+JbycXmQLz/apKMyGBraCexct996EFWJBT9HJ6hPP8XhHHAMJI3f2Q0IbfYqDj2QolT4D1Ny2kC7cji0aL5Er91SjaUDsRNG/VTnjyRRevJFekcbWpRvcaXahBnrQC7/2APWc7BALYH/k1xbbSt+4VFORIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9eszGJ1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so246695f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745444208; x=1746049008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=P9eszGJ1vxDzwFgcnqRyNPl4UJaD5snD8B1AbGdJWsgcJootZkpKFXM1n6Cg/nwCew
         ol7bFG+ziEZe46xK1m515LtX1mKcpuZt0m39GmgO1yKBCwgHoE64F73veMI1I8s7pyYs
         nXrRIyS2XCJiheGBRSxJ4ZE+SBFS/hgnj6v02S7FAdSoFKkOTBrG/OxslvkBf2XvOV4q
         LGbVW5boPt9Q7ANvjbtJl43gk9CKN+1jK578htQQiyWQV74EjSJsu2aPdehrDRwhiwY+
         lK758+WoJLcG4qzQfdrkW+9JV7l9Y1AMSOqsiW26oPZeLEERwor/HgHbhykoOUWjp+bo
         bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444208; x=1746049008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=w76OI+IgDpfqwFTVRAIu7saEh8Dnwsli4/z1ZkDo1cV9xIu5WhLUbqCuk+Vx269zAe
         042yblkMrxBwzDa34cyGv20fSgcHPdiHEvgTTBIiQ0+gjeEwrvqDn5cUpOzo62IGmpkO
         hMtoUnepy4KuBKTJKqoWPfvbgNDLo2CFJ7fexX7P5G0s7rmACCGxjzP210i9K6kbaxWK
         +69Gjh1Z/bdFWOjGUm1IBpCHt820BfCOy35De1iNWZdn4bJiVi/BH3FBycX/PGB/g2Bs
         y43mwmqGg8xE+VXZ5R6mxDW6yJLEo1MOE/mFExSx0lrKRVXqwi8lhGaAFafRaTQ3PMYq
         RkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO3QcHfVn747iIWNW+N/5GBLlKMnViGUTANNogFYBUyM3hOLsT8VkuXHa93UJl6eH8ZfOITX9LYe1/Nkjr@vger.kernel.org
X-Gm-Message-State: AOJu0YyuyWLrK5x4H+q5oGTxZh6DuHsFZhIBjBwZd+A5Zih+m1LgoXEc
	tSS6qoNdb+9xwg/rzmp8LDYJrGtH2QKv1lk02/akHhEcYXbFiaUXAuXvtd2nNk4=
X-Gm-Gg: ASbGnctx7XAyTMdYEEDjB+rB8/SvyQcAe1N/lCRiUz5IMsxZlUzmD6PlKhlAn7g8/2j
	DoqByx2r8fbGx7WZpdA4wETAoyqUIzd//7j3wfDEUsl2tnc6zwoDG1oxNvvtRG3gmLKuFd8FlTH
	043lidQ+kiKisKB2R+3u+TdLXqa8EXMvvWVc3r5N8RKCRHKNPX6rWaSceNgax82IPlC+akMQpZR
	1KdO4wsjV6DGrcvLF1Vh7Vr4CbpxfwmJUTUd+2x7jrxIJqCnFSAAcTvmAnM1RoVu6X099A88KOn
	CuyBjtCsnTKqc531To6wAf+E3r8eGDZ1pza4p/8uVn4+S347PFHqtjWKTP7c++ceQgLnQwpe6sE
	+oBZk4g==
X-Google-Smtp-Source: AGHT+IHX4800B8+8wispo4NFuzLS1LI13Oo5p3SlOPOoJI9EwHInwHF0S8Z/t4cJbeWZDuERNzlMOA==
X-Received: by 2002:a5d:47a9:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a06cf4b95amr43032f8f.8.1745444208469;
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm5473f8f.47.2025.04.23.14.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Message-ID: <0e1030b2-0bf1-4fb7-8588-4019d7dfeedf@linaro.org>
Date: Wed, 23 Apr 2025 22:36:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: iris: add qcs8300 platform data
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Add platform data for QCS8300, which has different capabilities compared
> to SM8550. Introduce a QCS8300 header that defines these capabilities
> and fix the order of compat strings.

I'll drop the "and fix the order of compat strings" no need to resend.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

