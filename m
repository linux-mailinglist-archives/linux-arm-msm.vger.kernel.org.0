Return-Path: <linux-arm-msm+bounces-55773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555FA9D392
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92CD01898D94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB6C2236E9;
	Fri, 25 Apr 2025 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2amKR2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAC6189B80
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614471; cv=none; b=TNDUdunDOZYIa1JvLTJwFBcZR9DTviDBNGw7+jUQlgLTFNIutG+mXd03ym0UJde7YGcaBPeada5Xhx+uf17J41zKhjvTkw4QtJVl85MFXsQ5D+fxGWYz4kvCA5hrDURWQwC9jsMIPtGsXNR/CzDD1yd24DaenSmPk31boAaYshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614471; c=relaxed/simple;
	bh=y3QBxpLU4EegLlWms8FmmishWO2g4sGgxJbSZbHeDM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjJynFq//MTIwv9HIOYNOXFSvL0wBmp4CmtCCVi993w12uHVb710BTkWAhw5cAELYqL4wogJdbEswIdCalG6Fy8EVxU5DcDVgVLIzHfmFC10zhdhVD2f8COXItUzkSeW92T09wIdeJEojgCHEXnDAtziw9BIqv+vbKgA23/WhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2amKR2/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so2416513f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745614468; x=1746219268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=M2amKR2/F6tGJtpCFjAacP/xaUCa+t2COOY1AgwNL/nGUd58vxX+eRU6lCLGakqssF
         9szup/CHN7Fj4vCh2V4dZeg5iiJLs3SxzDTrrxIS+GRYIAjsK3UCydRkvSEXNeIWEBeR
         4tTmw1JVm9NC45hg6vqbgbZNBAL2h3HhWmN+WgTQSy/a85hU7i0V/HPnwYJEPBjZYO9O
         qM+oWpVslVJiMugLazGgBL9x0qRgXvJVR6ewPWSGj8eWXafk+F89U3PKOznmHZWklM+3
         +zRuwDRYGS3YNeFz/o4ndd25WePCKNoUIaV7KwEie5ICrLHcy6XmyLBHXfbg6LlYLmtx
         yrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614468; x=1746219268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=t2BQF5gFlg/St+UaGo1l3BC81q4f8LPxiW+w6xos4CiiMgl0nAYWypVBF6rkrYNO1p
         1p7bDiSRNfzWej+wjHveGVkrT1/wfr71UXpfDr1wi/oUiMWEoKIV/SxQCSWhVZINzI0C
         +Pa6ftXLmQJ2hbJvXVdNKStyTOVzdQE+AgH+Wg8S/uSuQMLRZCgQO6Q0DQMOgZpHx2mJ
         yVFz1P+JYyFeYC+wyu5Rb9qEZreXdxaAxU0at1+vlyCWPWOsOz9Qat/6I3AUb1UCVhm0
         k1xANB+lT1RbZBfaTkU6wUksaXVCQ3Vm7b5aBLVp9eiWHrLnxRCDSZ3xu1qrGNv6QLfL
         RGbw==
X-Forwarded-Encrypted: i=1; AJvYcCXbT1u8h54+Kn6+hmLqPxFYkVLKQ6mk7bShZ4XmPmYRMOOuWcPnB27pmXLQYxLqTV+sn3gF1dZqx+bmYjvS@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkHGLYXCrkIBtxIZ5+LbZc81UfWCJKtl/XLKq+aR3SBu3D5Mu
	fO1cpoMJUeP+YXO/1vR4dtVrC2wv0YE8k36YJKmw0fOYt69k3YBLVwL/b3ZqLX8=
X-Gm-Gg: ASbGncv2XxBJ8vdKB+2APqk92QRi44jwp43MtPu+YTILv02lxfdj+QeBheHX6qxd6Ui
	HRHQaQ2Nu0tBbD14g3eMBBZAj1yiaT94C3G0HJiA5zcWVYs9A+fRbYkpB6febriEJkacmElKWCp
	nHnmR6tFvTYxPTSBOIYzMpVSWflgy39vxE82s7wQAIyJp7yIrqDMtrwdMlPWOyHcLoLbGt+t/jt
	7VKfR9vq5t8kerQMnfshi9EUh5VAsvB7ofXrgEl+ZV9qB2/d6Hh+5/gwH56GrVxHGD9hKTfmtKI
	6/iNbVX6+cZqA11tvRexlmFJSSHnAc32PsyyWb8toB4xHEf7y9O9qmpxlFByLzYrg2P2nf2ja11
	QgXDgRFo1AmLkqjYL
X-Google-Smtp-Source: AGHT+IFu4YvGwElh13buW6VpxKA/vVcb7uSB1tVZ6DbnzGwHpLhmj5iIZ9UFBDGGBhtShow69ZiPXA==
X-Received: by 2002:a05:6000:18a2:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a07ab89b29mr499207f8f.48.1745614468026;
        Fri, 25 Apr 2025 13:54:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d86f7sm67390805e9.32.2025.04.25.13.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:54:27 -0700 (PDT)
Message-ID: <a3c4c98a-45f6-4900-972d-379096e8244f@linaro.org>
Date: Fri, 25 Apr 2025 21:54:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
 vladimir.zapolskiy@linaro.org, krzk@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
 <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 18:27, Dmitry Baryshkov wrote:
>>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>>   	/* CSIPHY0 */
>>   	{
>> -		.regulators = { "vdd-csiphy-0p8-supply",
>> -				"vdd-csiphy-1p2-supply" },
>> +		.regulators = { "vdd-csiphy0-0p8",
>> +				"vdd-csiphy0-1p2" },
> This is an ABI break. Please mention in the cover message why we are
> allowing it.

Not an ABI break as we have no upstream consumer of this just yet.

I'll V3 this to make clear though.

---
bod

