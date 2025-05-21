Return-Path: <linux-arm-msm+bounces-58829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFEABEB81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C720F172E65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 05:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E781230BEC;
	Wed, 21 May 2025 05:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVI4FQgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DA1E51FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806768; cv=none; b=FC4dWGNNOFh1CqoFsoEz8H+ztOOi2geGYDpvQleDCJQjt6qvFoUPSlXm7UP555qll7CA1ZFJ7vvN+c+ns0oIxbQO68PBYkc+gwbVgc/F9XPvEvMUEVqayYb30hqW06yJLqWK17inU2m/1kAhGDHYhz/B/yb17eyxlLH38XybBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806768; c=relaxed/simple;
	bh=XK36jMGVzHFAZgmjJ27ea0/5+ipW+lWL7+7Z1Xg4B7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM04eh+oIpHzfKJ4cMiKm0ZDbirHpWr1K4fYlgZhK1pN2dGCwvoM5uFeMqpZFKB1Ppla9WpCsg+I4KXSAw1nMfR9C3AhSEC3P57pevrbljVUyMLw+rAgyYaj5kifWQNKw66URTojQzX9/bFQozBM1eqIj0wD59FwJ1Ur2QdoS9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVI4FQgY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551eb5d8815so476450e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747806765; x=1748411565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+6EfRxcF6nuSTzFfX95UFC3FA7d4vYOazasa3XUuf4=;
        b=vVI4FQgYbHGS07oqkP+suv1E+Ur4SKl4SO1CHd2ajs0atL4HTpw7WSMFidMKTAnX6u
         1ynFH3xt/CAsBca2Y2JcI8uk1LKt3wZIZ8I1NiZQFSyVgUSo2q4K2r6HquaPurhxRwY8
         oQ1RU+ap6BXe0HOckvQkXkXaMvRHGD9CwF5JjatPBcePdGVVMWZ/Sz3bd9HoMa4FWEY0
         TEdLFq7rptGj+u4j+79cwNvVgXsLlSryvGs0rat5vgtQZPHmUtKGva7XcmJnlcLzpmXs
         JcfZaRtWTpmAG5yu/5fKGqXnpurp7QKinfMv3/WPEDQE8ZXypxVP1fwrzC8AaWIn0aAQ
         qAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806765; x=1748411565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+6EfRxcF6nuSTzFfX95UFC3FA7d4vYOazasa3XUuf4=;
        b=qaWysD1VUSx89HUfTbYXNy/vMeq67QYHAl0dS+MTWLsS8Y+D1I+JUGnU5WxEhRAT/h
         gUK8zOfUn+whyzIpNxGnPjPcFgUkYWasSazb6O9T//p1SPSAhSXQKeO/Mo+WjnIrTUI8
         fBulhVRfUgTplkBmYwChdyFNn/UKo+1Pi1lJ59EqGVmi+LOvbCul1QheXE2TRolw5L5Q
         Bb96w+FF3RT4ueLQRelYRE1LnpiJU4iJbM5GpEpSB3KLgAKlK1mKet864BlguebaR2ts
         MB+w1EOcPQkCIfVxJWYbL91AxSwbjH8dqGuD8yoyI0vEYSd14yJaJVBSGnbj09u0VjDx
         xoqg==
X-Gm-Message-State: AOJu0YytU+bfMFZSrP7aaH/SFs5jmU+tkwXShEcMbPVsArkOULknFRZ7
	MKQsbJQLsYdmrOXD1QEagTNRD5LuNTcw3VeLOz+Y2XdC28WoGehN7J3FzJYLSNMQuos=
X-Gm-Gg: ASbGncuCYKX61oM1jS0FIlHeglxHxFU+4M2g2SjU6LnJoxcaSVPk4f17s2a2ISDCq/j
	EwLAVvppWk3WCwQbX1ppex8JQfVvvslw6i9QtfaopIQ1pHSBZfZUaynvK1MdcdlfzpVWKa09ny3
	L1xmgkp0Bup0LpffjoE4JpFw0mEG9siuPDqiXVbb+o1hQZ46B/cWzO5qQdD0p/rlsonKlrIREeE
	PTH8cchrS18vTMDGo1+NhgqqBbtnw5xeKcei357Smx1RUOIimOlT2PMCrJdjWPGAips0QGKVC+p
	XlZERn0Y3Ha28SzU/puhnF84kWYl1XUjKiTOJiUvqkrBEiT6FDuIaJslqhzWDxXltb8cR85oPdP
	RP4EFS6vLGSYo+NBeLeKI7jGwafk8lQ==
X-Google-Smtp-Source: AGHT+IFfkKSuF3lu5EAykJJmWP101sRAftrK7GAUTkyq+we+sis+bJZidTWqi/zTuN0t5a5RTdKujA==
X-Received: by 2002:a05:6512:1382:b0:54f:bdfe:ece1 with SMTP id 2adb3069b0e04-550e7248054mr2031565e87.16.1747806764709;
        Tue, 20 May 2025 22:52:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55206407368sm246913e87.212.2025.05.20.22.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:52:44 -0700 (PDT)
Message-ID: <76052af9-96c2-46d6-85c6-65998c389554@linaro.org>
Date: Wed, 21 May 2025 08:52:43 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org, todor.too@gmail.com,
 rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 5/21/25 04:32, Wenmeng Liu wrote:
> 
> 
> On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
>> Hello Wenmeng,
>>
>> On 5/20/25 11:56, Wenmeng Liu wrote:
>>> This change enables camera driver for QCS615 ADP AIR board.
>>
>> what is the rationale of enabling CAMSS on the board without giving any
>> description of any sensors connected to the SoC?
>>
> 
> Hi Vladimir,
> 
> We can perform validation through the CSID TPG(Test Pattern Generator),
> so I enabled CAMSS.
> 

Since this is just a test of CAMSS without any sensors/CSIPHY, then

1. camss-csiphy-3ph-1-0.c changes from the series have never been tested
    and added as dead code, it shall be removed from the series,
2. adding voltage regulators to the board dts is void and shall be removed.

Not to substitute but in addition to the above it's still doubtful, if just
a hardware/driver test configuration deserves to be added into the dts.

--
Best wishes,
Vladimir

