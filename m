Return-Path: <linux-arm-msm+bounces-85429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BE7CC5E35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 04:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E49BF300888C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 03:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D35D27B34F;
	Wed, 17 Dec 2025 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlyrhOjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE7256D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941653; cv=none; b=kaeQTKHUjm8JWSGW6nSSBf8g6XWWfBPpVHvbIZZdYhwLgWcXAqOtjAslf0vfdZG0j6ON5BcyHXYDlC7xHg2QBFdyK65JNnRGKzKR0PqztHk32rqZt5Jjw6W0RdHlbG25mlOzaDAIfW1N/uO9oWaJaP3/h86V6VpaJglV/QjsAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941653; c=relaxed/simple;
	bh=11SzZGEklYXvWWCXktsoGz8Ujricuu3/IviZe0raxmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEg0EhuKQsbOq7XMWqUXwLYOqi8bf8D5sTBiRd+yi/1KC4SkW4a5mzMI+VUxDeYkjhCQIPGra9+drUM7DQMFeNpcUaUzzUP2lF1Vgh6/AyFE+V1sMiiaRzLGxtpGbaaaFzwY7JVKsmzuUaQp0cgZjNgpuC8aEsSDejYpnI6KVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlyrhOjI; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8bc53dae8c2so333363585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 19:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765941651; x=1766546451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdPq35EZwyBF6PB3EjhFF/RUlsGDMSd3+ptll7BKMJo=;
        b=vlyrhOjIA8mMPnTVFIdzzZwNWV3q7xEJ1Mp8yYnRC9PXTRuvkfWOQll17jOtcSU89f
         mJ1kAIntFZubtMtlPsrsB0yryf29oJwoCSQciCuUF/MYE4XpVqYKYCGdZ0fWQdjgdUJc
         r7iua4OHNVO8hrSmm5893DSD2fLlkUpJAY1IXLvNwvubaMffqtFF7PQY3f8ER8Ig82oZ
         sgLwDoKl0XP+vZAwQeu+Bo4wybgczBsQxfrwowPzb1WQzm4baJ/B74Rrg8Ko5UvuHzYM
         8sqTDK/x1UOnANwKk5y4JtRO9PVsjH9V7N4RNAHoZ+516AeosSTOC0bVodTRgwVeigSR
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765941651; x=1766546451;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdPq35EZwyBF6PB3EjhFF/RUlsGDMSd3+ptll7BKMJo=;
        b=aJ+3NKBBSI7+gL4Vqx7smAk7J59h+Nt0MC2OlT0wRlx/vJ5jAG7S7VYe2MuqazkAYX
         qcA4NDpZxQHYxs2PL+LdI2PXIoee3ZMMHHrZztmmkZquvRj0/Rkouxn8WY5Wt6/RCnVg
         +WGA7aJ9fvLv+TJeD5I7shC6mCrYD1cyldvljxQlHgzKi+yV/9K+UIM+CQj2hYenNfqr
         YfNMExjFG2hwNefGUJpR9pvR4rAMDiOjRn7hS+SgL7HMNNy1/CXL85Sh42NsxdCcvy3U
         uQWxQn9w4ZTKKB0AHlwEmTpncfslVg/62ot7GAo8E9eVnTQDMJnXoiXQQJz06B1AY4ew
         RQGQ==
X-Gm-Message-State: AOJu0Yx767RLhOkrppCQ6bjLnwF2a1DEvdDKkSVBl0gJzBYVLgJ815Di
	dBrXlOHuRpxmRFsAn6MhtZ0kmmKDSO2ho9nmpNaxPlvCM6ReSTaaw91P3IZ8WHBQYTQ=
X-Gm-Gg: AY/fxX7EJ6oAnnLc4WB/S5lEaIyRnQkWORS5G99py9NF9N8ev9tRXTWkSTBbpTj4vNz
	B0f80h1WJE7BdSEUyA1aupmU2YO00B98Mi028PbkJi+Yc8fD5bdfQG3tnb+34hDhbMef/0i+1/Z
	r2j3gioodWmCBw+FP16MbBSIqsg1DtbTeM07sTD16xvpk3qyVyNV4hiQT0sT+14KEgdnJJbnP9d
	72TcAkkiuKMIK+oPKGwah05WZASj8SmhkF2XgmMMXOv/yWJpexI514NWTVZX1lhiy7J9UhybcTA
	h6avsZ8O5qWdLE/b/Un7TVCQ2W6tGHC8sVPUe0hpC9d9CyT7M+XyN0zPY5WfADGPb/P+mgM+Tlq
	rOG3IEsKDc48F3apF7B4mqdyfjh57IKJaYORT7W9NC+euu64fz6d+5XNBREkrS2zNPqeyoRxs7e
	vKUSZIEot47tslZCXK4wNAhHD15uO20U9f1U/UHsMqYzU6woAYJZe8
X-Google-Smtp-Source: AGHT+IFaGnoSZCS0t3YmUC++ILPu25bvfOSLGRvm0PzeBOimFe4SOFuPXflo7ePtL0X0orV37jQbPg==
X-Received: by 2002:a05:620a:1917:b0:84a:71fc:a16a with SMTP id af79cd13be357-8bb3a0bdfe0mr2215601085a.37.1765941650716;
        Tue, 16 Dec 2025 19:20:50 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993c659d3sm88437006d6.24.2025.12.16.19.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 19:20:50 -0800 (PST)
Message-ID: <01034cce-3657-4765-a42f-6b082fb2de1d@linaro.org>
Date: Wed, 17 Dec 2025 03:20:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vladimir Zapolskiy <vz@mleia.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2025 12:49, Vladimir Zapolskiy wrote:
> 
> If the ICP register block is added now, then it will practically exclude
> an option to run hardware demosaic on Kaanapali.

Why ?

---
bod

