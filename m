Return-Path: <linux-arm-msm+bounces-52661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E7FA7359B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734F417BCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2A918A92D;
	Thu, 27 Mar 2025 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb0Urkyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8F18C33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089318; cv=none; b=Q2LsGsmCkV+qaqQXIHLuqTy6pP2M7U2EbuXp9kXTXWXtwaItpoa1kCf95shAtGENkzSZbVKgKyq+waXcWYQ2UdDGcDCkPS4YjFj5nf2L7ouXMwLk9XQdbhDxsjbgFNqpB0WsRPwUwazoEeeKFRJCdh1Hk2u/PXI7NbyesVC6Kps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089318; c=relaxed/simple;
	bh=1/Xh1YTj3T8SDNh7s5nflXDE32vsD7ydzcDzfXrzX/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kr9luBVfxFuMzYQKj8kqNxOxstyyfrMiAylMn6kX3BNA6xAcnmECVuwxRSuB0/X+awwko4S+weKAHoi+xOYIEXECUrloRLkEdzEc9NEpwNilLn4BrO38QdKeufaNFOrKZ56VzNi4EBbVS5PID8UXLcl7VAnzBJDf/pG6FHj94l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb0Urkyr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912c09be7dso680523f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089315; x=1743694115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=sb0Urkyrcr2wBewLD7s+rGL3gBBfpOjilCMkQG+PGENV4qpH2iSTIZKkp6BGxIQKuS
         GhG7JORwl1NZHTe2QTWc2CT8NVAODcIj4v1FKUYWjgmTI+FeXiBlfnSV5HlKEEA8I3VF
         PoHJWy3qPxnneigS66CwpfMemvlVg/kc4giMH0wzVG0NRPonqycLq2uUsgseFpIjZRGz
         0eMgriHzuUWhGMBkMVYvQ0jA62ZdQVpuqrigrIBa/EU8S1ToAgcO+m5Dv5Kj29uQ+VYV
         BUpz/w7MeLZYYfP+m9mVuQvSn72g2UrQIagXr0bRgwDSA6J+hdvyC0k10WCSmKTXuYCG
         EUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089315; x=1743694115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=moyWYIXbbjNZiY6MERE/rd/C/fofxhf0ssyVtIDqDZJW3XlzXBivmFZ6vA+zsGSe+8
         0xw6lauoaqJnjtoC4d8QLi205Z8HJyySRo6E6+tOmHoGqcqYh4HQnQhBRZnPQa2X1nO9
         s7vS1eSDMc7RD3c+sGNdGfv752/Bfaaq3RDOhOr+kaItJmd4MUOAzC1sRxvylBBzClG9
         2STgwNiov/Am+YeAWc3KHinl3OFlxDZeZlMe2YMeFL8PKyQ6IzVonu7PjVVlWaTy1phV
         /V8/hAQq5jx5sGagBw7r8bl0DPHSWlICoccl2d4B/I4U6cK2siwxvfoYwCXzQTlyQqfS
         KBoA==
X-Forwarded-Encrypted: i=1; AJvYcCW8XGlDaAsvMQXB5MGnCX9mMZoJ1EI+ZufuBSQb2A6qTQfcLRfGnY3DNRjjiaizjT6IbuKaeds3DaxBcvSH@vger.kernel.org
X-Gm-Message-State: AOJu0YxY268U564CS/s9DiiBssz0h31coGw20MSTPbfH1uvfhmTyIxBZ
	rmLbwXXkT/+255RYPKOoJqo46hQF0W254SXABu2NpY6RG06h7VI/cceaZAiqfiE=
X-Gm-Gg: ASbGncuRxbq8P2wKsLN/iFQnWxIOj/kpZlOOiuRrPVQpKNHQ2ZscHXrzLv4Cd9KtVpF
	syPv9TQwJpI4NKEaAa4tDlIHcTh3+O0VPutADi9cG8mp5kLWQdOT2IYglH+yG3uIkTSTrjTBYUM
	WsrDyj5vNwTPDqcb2VeA3wEAtkg0H2R3C1IUeavRYAZOnFAExfz1moESZX4n20wYbcu14i39SoX
	SSTUs099REcQayIm9O6twWlF2MZ1NHXV6nMBZz7cQ6/TyIbYjV4SH7VZiZCimD6dop1/iPaD3cM
	q1IF6jJKKxmkAc9/Gqk2FKKs9wSBMbMbCqHylysSQUt9VDHQA1cMS+iIscpXQCQvmSiib+BmIUN
	WLlpduZ3p2Q==
X-Google-Smtp-Source: AGHT+IFNIkqkO/Sz8Zoq2RlgMDHLZQ4+HD+omJCdCjySdmnror3V45qCoIHUI3fPbTVEMJl1bOlNow==
X-Received: by 2002:a5d:64a9:0:b0:390:db07:87ea with SMTP id ffacd0b85a97d-39ad17704c4mr3242572f8f.34.1743089315216;
        Thu, 27 Mar 2025 08:28:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac67970a2sm10007035f8f.16.2025.03.27.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:28:34 -0700 (PDT)
Message-ID: <c58b129c-1c83-44f3-bd52-13cc24e50cbb@linaro.org>
Date: Thu, 27 Mar 2025 15:28:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> -      A phandle to an OPP node describing required MMCX performance point.
> +      Phandles to OPP nodes that describe required performance point on power domains

I believe we are dropping "Phandle to" generally as this is a redundant 
statement.

You should also pluralise performance-points.

.. required performance-points on power-domains

Other than that

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

