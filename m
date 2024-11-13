Return-Path: <linux-arm-msm+bounces-37845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27F9C7A29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 18:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15CAAB2B3E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3B01E00A0;
	Wed, 13 Nov 2024 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETD9WU0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32520143C4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516342; cv=none; b=bPobMYCm84upBudszgPOWjUFoiPjYPhp8rBjUhZoIn7qB/0+6forHHYfLpCI/2tKGeGTbl2pIyY24hF5icfu3IaytVIx7LMJsPnwnoX2iqUjMfTo4C+rxqXd1dxOnjO427jx0CJVP+29CLPo5XMle02i4YPPZZkENMlP8gj+TLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516342; c=relaxed/simple;
	bh=QTPjno+2Co8ClCqdkv3+r5AS/3KRpmu8xbiZeVLi6lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sc8j2yfMbM9FySXaPrw1M8Kbsmuge2kdBcNKV3/Kypt8+yJvnqcQDX9v85TJ5Rhu1ODtiISAj/Hy2XWWXJzXHXAvGJDCStzx0N0kpz8GSbzTnVNmzAnJl7TS8QuuMRGD2d8KUVYzVmu4U0grG+7Yc0VNrS/nORLOM1nUSo1UFYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETD9WU0o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43163667f0eso61301485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 08:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731516339; x=1732121139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1op2LOAlj+eAirTUXFxolzNN0nAw5qrpfB/86rSjz4=;
        b=ETD9WU0oroDs0hR+otuzxRWi4Ojl4kUEduwIN7I5Ueyq51m4xwohN5jpsE/DrQqbg3
         pjSxSjp2rlVS0nRlFlDbS5FnqfbNpwpCWr0MG8zEBipWLK9N9A9vo6qli6ge4qNK/LXG
         P8KYCFo5pbbwzKF6tuyXZ67Y1wOnr9HnN8yqx95FsK6rvujNCOBvZxoeSSbtWgnlpiN7
         XPKwHUvZ+b1i48sC6vO1cICxuF5SwZ+62gn0hAOyHlYJuBFA+egEG71yUJJfD20GRV3t
         HG/TKUI/0JZVz3ES9vHtwqvNDRCvp7wyIfq/VGPcC8f7cfUSPQ9Ut75DF4scN2+cg1mk
         LqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516339; x=1732121139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1op2LOAlj+eAirTUXFxolzNN0nAw5qrpfB/86rSjz4=;
        b=qjgBJGvv7gPGsayGMoq6u705Z7dz/1RzwEsHcxBkN2nfJgbwhrh0zWvlxLW49HMVTy
         9LzgrICuMoi8MzCyflIW70dfDtGJoRnZmNM7Yp74x8if4RxaBQiy2YISEeAc7lo4d0oA
         4bMstIHM3OW7+6tgL58llPRkR8pFATk2SggAgzdXyA7s2aqiqEGGycR/53JW3T5pYywA
         jlWh9IxpCAL6HQ6igG7DiihwO7xvLulIO6UCuiaQW9YgOqe1NUl+SlB6WWl8Y9jT66po
         75IONqvjQFFnnPk6COd/7PwfJeVroq9sjYyGI/yPE8kCj6vxhopRp5m0USmeUxbrXGoi
         gjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBw4sbDyJh1fOm1y3ZH0JTPYb/ksi6Dl40I/sQ1Y93qZryITIvCTyDEE48OcPmJgDjMG2rycjamUZFWGwg@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/H2uP6tXgmDcKg0bNMv/KAIB8+hbpkwjNwaGVmDodSF88eEl
	4ycs/MalSHFlVcV6IbnbqPGymhZQnVDX+90MEqrJzg7WMe4169oB6ZX1i12bRYg=
X-Google-Smtp-Source: AGHT+IHqqp0aFwxKahmkIFeK1sHiHkIAg+CVabKxaL5zjVLCGxDgxZwCgkjrpVMDOnlIOoeDiEBSiQ==
X-Received: by 2002:a05:600c:5107:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-432b7503dc6mr185962055e9.8.1731516339363;
        Wed, 13 Nov 2024 08:45:39 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f82cdsm31026715e9.14.2024.11.13.08.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 08:45:38 -0800 (PST)
Message-ID: <dd5a8b15-8560-497a-b969-d293c63b8bd9@linaro.org>
Date: Wed, 13 Nov 2024 16:45:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add venus node for the qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-3-e67947f957af@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-3-e67947f957af@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 11:47, Renjiang Han wrote:
> Add venus node into devicetree for the qcs615 video.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

