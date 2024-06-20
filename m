Return-Path: <linux-arm-msm+bounces-23365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28291910637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9436CB26DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367AD1AE083;
	Thu, 20 Jun 2024 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHA3wccx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C76240875
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890235; cv=none; b=r80wSrP1XFysyW/s+l9sO2EdJA9diV9wtgzDfwH4+NyOzYTuLDsY6ymGj6qk51nlvyhjjgfxC2/a8K0Pdt9zoeNny3Mnn45VsgCNbbqw+G1G6DcozQopa/cQtLJBFR44O6GQYWSiXJ88QQcN/gpOZX3py7ZTkP4tiB9j5b/jZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890235; c=relaxed/simple;
	bh=bgb2HNbsU7xCvcmd5GisOLt4wxUOZFUb75guVXNpvv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L49tL3R83qOUqecsE84MOPrb2TIHUS/wYP/9ILJx1T0Tx2r3OAr7qxUqwlrroJ9Eh/V1PxsI58MslkLBVntWxJsKAXkYoGFAR3Ud8P6LdthqFIm0km247l+BDIVYG6c5s6LewjFkx0LD/y9hs3O3Tb5TxvKu7ft11efXuIlgc/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHA3wccx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso899011a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718890232; x=1719495032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHvJQin6Q3jHQD7Wl1Lq/QhgeiiSPqPm9y3EqCSFk/E=;
        b=qHA3wccxjGEGqGNYkPEpJmYo8v4hrWu6/5XvDfZmbMf6l4O8glbaYfbHA/0jgoUJqN
         nQa+UiKW8mNhgO5W+kXVmAavtF70iEOsat5d2Ne/jnnNzGR8IbjBtCUG62zI/0w06Mt+
         wF3vxferY8mwvNOhle7kRrXpUgdb5CPcVQ7Cgun3TvjZ2MiZh5/ScUFBOKZcvEghMHFg
         uz3A+AXmIIVhtuxzZ/xssUObNGv3X4EGxESyp+RNqnW0xm9VWbfHRK+aPk4vkJZGkv/k
         /qcGRBiuqrgugPUkCJWD9rqZQmP3fggD+1P1h96hgWLjMX8HWIR+9MV5WZG4AtpE2qdO
         1MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718890232; x=1719495032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHvJQin6Q3jHQD7Wl1Lq/QhgeiiSPqPm9y3EqCSFk/E=;
        b=ZwUPlH7F46EXT5s0iymlsTTa5K4A+qBFuZXr0oSZXqF9M9uI8awxwPM9oXjefeIXSS
         oRW4Xv18F7K9TUtgnoczIBUA19J41SsMHvNRfMsybEsGLBwovohTOVGHoFhfYyGVoUuN
         bH3BQAAmC8LtAtBRe3xewbYePBlY5kuCuP5mQH0M+J4H3g+9BDgblekRh8itmzLbwrC4
         t0wpWL/2AfNDW8lFnIJNUIADjPdcS8+A7HR+tNZNb25d+gZ9YDR+ypaXEaPUvZK7ZeIV
         WmXLbxCD92dJRw0kcJIEfabChUJCRSeytwsz5QUV8WlDwu3H4R9h/3yrboKxhLUuNSCv
         xyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt+8Q+sf/escObQL3jU9lLUu67LDrV7cg6Th94AOIwIg8jR8eSV7vHY4VKsY8fooZ9KAnJsb+KK0uCpLIMPFMg8gcTydcEhLkOOXwV0w==
X-Gm-Message-State: AOJu0YxJp/QhwZL95BOwdCDEMPwyCtl6cx3gCv1xSgB0VkB9Cgp2slGa
	61YvmO1xcqRp2vhbJwGbV0Fkw4F2JN0ASsHb0bTEbrWK6Beqn5GAaR3xJRxr66Y=
X-Google-Smtp-Source: AGHT+IFGFcmCPi4nho/Su3fm3qTR6RrmYXvxY4E+2sjrrVjoQT1B4gVLkpAjhkrojVi3q1Hn8pAOhA==
X-Received: by 2002:a17:907:97d5:b0:a6f:4b5b:4ba7 with SMTP id a640c23a62f3a-a6fab7d128emr322165566b.67.1718890231487;
        Thu, 20 Jun 2024 06:30:31 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::ebdd? ([2a02:8109:aa0d:be00::ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db6b32sm768359966b.59.2024.06.20.06.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 06:30:31 -0700 (PDT)
Message-ID: <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org>
Date: Thu, 20 Jun 2024 15:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set
 role-switch-default-mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
 <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2024 15:15, Dmitry Baryshkov wrote:
> On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>>
>> Give a hint to the OS which role we prefer. Host mode generally makes
>> the most sense.
> 
> Why?

I guess this is subjective, but on these boards the more common usecase 
is host mode (before we had role switching we forced them to host mode...).
> 
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Would it make sense to set this for all the RB and HDK boards?

The rb1/2 are the only boards which lack multiple USB controllers. For 
others it's fine to leave the default (peripheral mode).
> 

-- 
// Caleb (they/them)

