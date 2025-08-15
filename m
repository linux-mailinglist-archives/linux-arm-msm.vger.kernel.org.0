Return-Path: <linux-arm-msm+bounces-69356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D71B27FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A9EE188CAB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 12:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9422FFDC7;
	Fri, 15 Aug 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GybUxoni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E32FF16A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755259960; cv=none; b=H0j5XdKbBRqAr7j4M16UJicth3sYciEwjIsPEOmMbbh804LuLz4UFXPaT2kY1kFna1MKLTuuQz6ApVVdCe1OtO/ExzsFgiuUR7aAarWVi8SuhwLdw8Jh5paosAj+vahfQJfJet4WLKqPDKcgWrBtbWa5xTwUJT7NnXMfMbGP+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755259960; c=relaxed/simple;
	bh=i+iR6E/PZw2zvYS+1CSb3nvFYNeJhf1t0/Iolj8tVBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rG57THboIrUqFKmhpPySoJUBBOygrvC0G2ZLD3VlwUTqXUylBECclIpMneRqc4z5AJsBa0GEYgwXkfkShwW+SMbahS/VoU2WO5bOylsh8EM33QL7VXt7LRZMufLdUeMe4fDIyAX4j+3NQfVSjZncza3aMCWLWzFRZClJhEMRfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GybUxoni; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9d41d2a5cso1563477f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755259957; x=1755864757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ilh/SLkuCJQN9VcNatiV3+rgy9qynKADomWo9vAL5U=;
        b=GybUxoniXi3G1h5L6Te7EoAKJ8Jdw7g+Uf0w4n8MTy/xPN1DhQVREEZwSyt0VtapRE
         qsDGKwXumwtRMkwEaYHc4wBMnHkqruycCRksuHyTNO/mhG3UU6u4peKHL5BLeQMxcSAT
         rj6MCjOv70RMm/t+8e9LNpYINk3f1zUI2iIYUZP6HbIyPu5LndUP+lQRx1qCt59qhChk
         YwymPxOOJfZry8YE0CB1yUK6nFa3yP/+PmsAXwGIS2UfOn2q6NcRjR6x88H4UxKONvNc
         PfV3rRXZoa3ItwVyYP+yfSXLITeVE/d8yjSBq+9qBNdPQ6hCsUvY4Sylv/Sb6Aq3QL3+
         2phA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755259957; x=1755864757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ilh/SLkuCJQN9VcNatiV3+rgy9qynKADomWo9vAL5U=;
        b=WDA0pJAxt/G5cCjbZM8ukE0T4/7qFjfl3uy9bnmi5a5wiZZIsMPH2X9oAzyWA6MPfG
         8vWiqI267zKQoNDjtdwdv00vXqa7B6iis2n7Q5ZrR0PLyZYL+r3WspyynLZO63BsnVtn
         nd3L90aTi7NEeZd/w54ZL431tW8ffZTVm9qlZMoWIiQFep6Q7wfBSjCG9z4l0Fjv2BoJ
         Pq/gfGtEt36f98KIjxD+QuV6CiuwSXaXq/2RCZBUbCvrVnUI59rYautdlym32v1pKk4s
         //mNbZL7NEJ1g0NB2Sldw3NuVH8lJHTG/wlB0xSCA+VsYL7Rq+6IBG2BcZaitLCuB6Bi
         3/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWWeAaCLI/s4YS3M/cskNbR+RfRCu17QZCeNXWpWZSO/AMpTXoDd7rRIZoCn4FKjWHd+ggTHSk23fNV762F@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJalsWTuCtquK1B3MOwpml1gEYGl5R/cljDB+xGJc+6MFjzGn
	obiXeMhfoxLLM5g7XnvdPb8BlZukfOn7I4mlp/BZ2zcdt0sPyHStHPUsNYgNh31I9rE=
X-Gm-Gg: ASbGnct+8M72+45KuUADbCAZmHwuct15Y+wU/w1RXvrvGdvO2JpLdi4JzNTC2+iTWhR
	fDUMrI4gctKqp8eJctBbGX+cmFxVklqmlQryN0zjxRaqV6uHSSyfjBBTW4LiNFB6+qcYE0IGWBV
	oAuUgJuFiXBuBITo4CzhM4Cfoeo+NiW+OKI1peCxjRLX3EYwPxQqLiMNmvS0EF93zgf5t36HDIh
	QjLNFpHDSSWMBFhzEzp7TiSwnM3DiMNWCIgaGeKxuRece9R3t6PA+xnDoEjnQqIizWTOtMPQRZM
	0aNL1fvwHl1cfpejOiBte6Qhebo3gooxliITN54qnL4fG4PzLV0EEO3VR4pC/1Sr4F6qnoxVtf2
	BprBGsrCB/E1WOmNk2UsETQZLgvG9U3IGraGeH7Nhcp2NPM5jlLem2atSkC05zA4=
X-Google-Smtp-Source: AGHT+IGvp69pAPLytTZe7iuFR7JcPjlyWCX1GBiJgy4L0feBQoh8l6iIIeoFPH1e79guh8V80eaUNQ==
X-Received: by 2002:a05:6000:2306:b0:3b7:9b3f:1e1d with SMTP id ffacd0b85a97d-3bb68a179c8mr1159936f8f.33.1755259957519;
        Fri, 15 Aug 2025 05:12:37 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1cc22739sm59518835e9.27.2025.08.15.05.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 05:12:36 -0700 (PDT)
Message-ID: <168788f0-4377-4b32-9730-23b2c4eca2a0@linaro.org>
Date: Fri, 15 Aug 2025 13:12:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
 <6d43915b-756f-4ab3-accf-e0a5422db479@linaro.org>
 <d4c0736b-5c17-4bce-86cf-6c0c48645667@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d4c0736b-5c17-4bce-86cf-6c0c48645667@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 09:52, Wenmeng Liu wrote:
>>
>> Which clock is it we are setting here i.e. do we really need to care 
>> about the rate at all ?
> 
> TPG generally uses the clocks from CSIPHY/CSID/AON. If we can ensure 
> that the clocks required by TPG are enabled in CSID/VFE, then there's no 
> need to configure them in the TPG node.
> 
> On Lemans (SA8775P), there's a special case where TPG requires the 
> CAMNOC_AXI to be set to 400 MHz to function properly, while the sensor 
> does not.

No that's fine.

The TPG should list the clocks _it_ depends on without assuming CSID or 
VFE is running at all.

---
bod

