Return-Path: <linux-arm-msm+bounces-39101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E29D884A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 15:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C562CB42A60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A847D1B219A;
	Mon, 25 Nov 2024 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVNaiX5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DFE1B2183
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544303; cv=none; b=UKuKveWJBPFy7D1k6IJAg4F//eqUE82mW6kn6uJAapjFdyzF6SLmeNFA87sTGxQscqttXeV9/1UkSRSaOzyU3HeQHOal4JgM8YLr67TLwzuPjPU0OXrcPxrs2SA1yF4/StFx28ClYgVnmOXCK7d2BkHJ+L8BxYWqblFash2a8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544303; c=relaxed/simple;
	bh=8gTbO0LZfixjkq6uUtLon7DMBOv2a37UPXCjBZJ2iZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIXOM7hC2j4XNITMoBVfaWfpgq3NqCwIDX0IGgFouqyQPGb9GwBJsk4QEGLPvh6+43I0O3cRjMdN82D1AKXU5PgTe+6Db2zOpiMo4iqFJXjKcUNO2scU+rRn6+Fl1E/lH1GWfgCSLoQ/hIlJ43ik3MOb7gFWFZ6jIUc6dOZFpS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVNaiX5U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a2033562so3619645e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732544300; x=1733149100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=AVNaiX5UtMhyLsFr8D8SfQOlwaLmWvccxYpy2xAP2//Ahs267pSpeEbLlWDqrmpAgP
         5cdsgTZSxVkwPAKrheDdv0DLWLS+m1EWXPDPsV9yA2rQ8di3wepVhn3hxjsAe5r0OwPc
         Z4aw09Le5MRRNyqUW3MOiI9kuSuIkf8yOZSQEj9RqEiU2O/d6B2H3Cb8r1qFqd8tbeZ5
         V/s1LH7VNK1nrVBbm0voae0WxglKf1fYVT3C7GSvyulbcEQMxUD6fhhOnCea+Mi/UZfn
         +66Wb43ii2tTiSd8b8V2itoWbeYtB2JDJutXXUlTs7hnNZjal/g2t6ZPUULYUobIz5bh
         41Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544300; x=1733149100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=lMvEFtVKPCjYonMD4pIbJvpPlB6tdWG0wytj/Rbc2Lrr0nZa0O2LkmnrTZw3ukNyns
         FGjDgLQ+uIhIogJ9UjeLaHAXdGo5MdyG9DwJWFWlAEk/xSz6U76mwpNYCyWq3cPQjImb
         SncXSYlUzkeQ6nvKmlrwu9c8qZYIpsotbQzOx8VpGT+HF2AN94wEnEJqrl7Re6rn/rQa
         w2zzsEdO3KUiEVyY44Qc7/v8X0OrxMImXIQm0yGLbpT6tpUisxdrvhCrfrAt60Gko72W
         iFY0VNiytvKDzeC8NcLTzu6fx4SouQqAJCUTDYYYB8HkCYENhQSl4DKYbY4AscnRXuAo
         deog==
X-Forwarded-Encrypted: i=1; AJvYcCUmtiEW/HKpEgbAY9x0MgkASugcVZKvs/AzSzwfjfJ86K4+xTI8Tl5/V+4ibngRnKmMhirMSC6PDhXS3K/1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1vSbckOhhuIKp6hVLzGqetLNRhaKqr/9OLWtblfP7+yVkbBP
	SJgx9lXnelu7JXq4yHOSzIdCryA7y0gefEBXWQl20eM4IIwA830EG9234U1U0Gc=
X-Gm-Gg: ASbGncvP3q7+ARZ710/N0MLz3bMjh/5Uc3hrqalkt//j3EfoARMJDXRL4ZYlU55tl9E
	WNpQwTPADgn9WKxYFIZuWYOEqeiPVSnrUuj0qYSZ4zn3gYLK27WJZr7SMazpZI1huvubbtAYLMT
	6kpHAbs1M8W20YxkiK5FLJFBRmT9I03u/pfqySrQU2E5FRIK0srjs5wlMqSxbQC6+UWgIpuH76p
	rY0dxoWB7quNfriqpspOmW+YqzKwoPr+DH0aCaXd4KEmskT6xnmulonwzpZDdM=
X-Google-Smtp-Source: AGHT+IHqIIihdF3fumt0wugdqbgPyd4zHYslJ9WQYwGzPsEPSKNIXwv+JbkUTAaRMXwekVdAEkvLDQ==
X-Received: by 2002:a05:600c:548d:b0:433:c463:62dd with SMTP id 5b1f17b1804b1-433ce4e73camr111806745e9.27.1732544300035;
        Mon, 25 Nov 2024 06:18:20 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349fba472asm36556345e9.17.2024.11.25.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:18:19 -0800 (PST)
Message-ID: <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
Date: Mon, 25 Nov 2024 14:18:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Rob Herring <robh@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
 <20241115165031.GA3344225-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241115165031.GA3344225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2024 16:50, Rob Herring wrote:
>> +  reg:
>> +    maxItems: 15
>> +
>> +  reg-names:
> reg and reg-names go after 'compatible'. See the documented ordering.

Rob, the documented ordering pertains to the dtsi and examples not to 
the yaml right ?

---
bod

