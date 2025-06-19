Return-Path: <linux-arm-msm+bounces-61836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FEAE0E23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 21:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573CE1BC4855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 19:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F250D2459C8;
	Thu, 19 Jun 2025 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EA3XkhQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E53242D9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362231; cv=none; b=uXRyGjYG0ID/a+aK9IwIJqoP29seZtMf8LizyQ/Qbi1bmeHuVQNZRJ60SyR5KilDTVOpMMfuE4+yr4Ug7H1J1rkRgbD0hMeFz5wRJQsCOp5NbklLPCag/5L+tf5FZfr1idgG0+qKKFJGbifYHcNgk6i2X8mPn9VN75cGrx/J1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362231; c=relaxed/simple;
	bh=yDEbu7+KEppseRvMkdEiO0Gls82wPynGcYQ2oizwVTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxZbXo0hhbjlK8p4sBiN//gVT+Nfyv8Wv3yVkLdwPSRYyEtYYcUjV+RViBtVKaKyxElwBjnvJ4lAx+ytOrcAEHpIc9X3VrpP/O+la5j+M8G2jO60TVkXBinXximHziB9mlz6XBMJr73K5xsTmBzVEj6UDoe8OETQwFGtEyZSZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EA3XkhQS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450dd065828so8401455e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750362228; x=1750967028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hy+M3MYJ3Ebzf/cWNhjwsSRZ1HHszVPNpmoBuK91md4=;
        b=EA3XkhQShm5QOlJrvcPhaGqYpTte8mVjKWzHtAM7heVMiqLnn1gQEkaAhxGAUg8BKM
         k51TLJGME70IBQqcebcbS8VWFMvQthlQpc6YHxrXeL4zlcsb7U2Y4k1hLG6dF10Y8TAg
         K7IQA18NeUZQ0U8zrIfQ1NgYjctiq/9JMKeASZZOfAB8v2wLfKgPauXq09p6KhfU3UtF
         DJJIcIzsFTnYaN/DVCGTvtAr+xuH22Yu+Bu62s9dDsL0R7kmXuX/ggTnKAVqyq0z7zo7
         VyGt58nPxvXNwt5YHlBpxqQLdnT/iCGm86z3WteZHYhT48PJgoMyrSVqzKPzOb8x4kJw
         mcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750362228; x=1750967028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy+M3MYJ3Ebzf/cWNhjwsSRZ1HHszVPNpmoBuK91md4=;
        b=iZVc7AXmVqjm+J/OcJHeyYkXiZCTeZq54BGNTJJUj6YFG+e0mvuRA5wV/VByOA0T1o
         nrZHTzf3wA6GtcE1woBkU4dp41FeH7mwgk6jbQRDvbdI+mfOJNCl6DWzJSV9EJE5EEVI
         HarQu77leBv3PVfJ+SAiCFba8BOZ7aGfXxhVtisbiF9t2aMi8vms8Ii/HEmAzoXUbK/2
         KquFvAtfco87QNVTWqCqgZBoV+CEj840QjjRC+fVX/WYVDvjOEbdtIwIDolYwVxqr9u3
         PF6xjS66SPRGn59bpKRJCMTfLPesVtITCYeDFMLCgBLgJyWgIWiscYwNc/pvevfJWb62
         zbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfZkyC8SvrNDJQnHnLBDydx+0EF1wk6IeZXxseILwc4a+DnyKDdl9EzQzIqpzXZBuYRNLnH+03bAU2josW@vger.kernel.org
X-Gm-Message-State: AOJu0YysQNhlxX/4Ny04LCk0QriIVzK038ExPy5YC4sY54rYjxKzigMC
	O5sNX4WbJCAxgZIT+DfekW/G0vEjRittvTCxzHa+1i1y00KloVh4kJz2jAOUQAwfbdg=
X-Gm-Gg: ASbGncvVzUSJ0yTt5pbeg/5T33IXFub1VngrDARNH6dkH/CpYXgZpRkZKhQjprjtX+c
	qLyfjHh1VdsV0r/vNd96S5qHfnbC+rb+jZJT2UGvf9lVTESs0LDPW7nd5EmtE0xtoYE5rBJRUUT
	I9rzyDO/1DD150wYJF7cAGyjALnOg+Yot2pv0sFiEA3e/tKaRikDoGe0chSuvY46+miL5XUl2Th
	HQX65cMqwifiwFjj+WQIq2enXuLVvxwGUrciPAFg7iSeGvNfq6U7m/7UZGk7gBGlA3ahJg2u6s8
	iQNvDFMMnVrttqvspMFuW8Jb6p60gvL8S4XJMBxzyy0Ra1xnzojF4DIA1KcoD2QrMN/PP9xyyfy
	Z5OrEK3BQL21yBoU30bwisD6nHCDXjqCg0pvypQ==
X-Google-Smtp-Source: AGHT+IEJqMT3RaOTaO3Ou2VXZG5oilq/ABPQu3IFKnDHY2NkDCpck/QpOvFVGuHA2IM7O/SjWVxtww==
X-Received: by 2002:a05:6000:461e:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a6d12e6431mr212173f8f.46.1750362228349;
        Thu, 19 Jun 2025 12:43:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm214537f8f.27.2025.06.19.12.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 12:43:47 -0700 (PDT)
Message-ID: <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
Date: Thu, 19 Jun 2025 20:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org> <aFQg6x+FxXDY4P5m@trex>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aFQg6x+FxXDY4P5m@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:38, Jorge Ramirez wrote:
>> WARNING: Argument '_1' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_2' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_3' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_4' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> 
> about the warnings there is nothing that can be done - those parameters
> as per the comments are necessarily ignored - that is the way the macro
> is supposed to work.
> 
> can we not live with them? otherwise I cant do it in a nice way.

For preference I'd like to avoid adding warnings.

Let's just stick with your first version instead.

---
bod

