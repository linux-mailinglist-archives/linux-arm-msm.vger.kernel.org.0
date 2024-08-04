Return-Path: <linux-arm-msm+bounces-27870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC239470AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 23:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E50280CC7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 21:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B482313A3EC;
	Sun,  4 Aug 2024 21:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2E9yhaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D0137750
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722806820; cv=none; b=WCHpUR9Xt49ZUnaiKCTpk6Bvhayq3hJ7zHgtTLVj8Se7dyuU3z1amZkrlQ4k415Z9EXpBtDr+hvEkt56qMKeHZ3V80uB82IIYwoNLmXVFwJhWVBqayhsru2VBIaNM+BQNKGrHVJyhtpF7W2AN3KCAaqi7nvUqwP1SPSlAv1TnSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722806820; c=relaxed/simple;
	bh=ZARinnrZ8898vJ97LmefXiZ/D8Kujgb6eUAqVyijsuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XusIPtQFO9+tbYXEshj9vInylWbX+P6or5pgh6CaukjtLd/nkx9Nz260CNtHp1OInbiMObHxuLbjV9bZyi6Q4y2bAwX+1S4oFQzT80ghLsqS+quHui241CFGj2Es19x64rB87L8bbCX2FjIlee7bAzDMftP5bpMYSL1mToPGAHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2E9yhaX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef260c4467so19709641fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Aug 2024 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722806817; x=1723411617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoBXpPLc2r0a0UPJxEfi2oLrgzhk8wKgCqCsglbfDhQ=;
        b=j2E9yhaXCcHlWXRU+KDbKWQ8Qc3QpcKBR4q4E250pOsfCIlUXKJS7GIuQfOVhvsJvk
         XNkZcvyR44Lb5C6X4FGyPbycjNZDIa44zkRd3aXEWJQEjYX56DIAoZCGJFNa5SrzOfAv
         NDJFCniUYDLZ9PXl4pWgShh1WLr1MXsaqkIdkWwcRSE78DvaLRMihX1WBVZYr2Z2hzHd
         no9YutjdDAZ07ys74XJQBS/PU5YqRld21+kKSzqYMBt7yRrhZY9XSaUOisOuCndlMISh
         9fEv8nZCSryJjz1C9aEJunqywvR8QTKanFORxIUfozgtCHV10f7xoXs6HNllFIJujnu4
         qCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722806817; x=1723411617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoBXpPLc2r0a0UPJxEfi2oLrgzhk8wKgCqCsglbfDhQ=;
        b=Fs6PkruIHPPYfDYtpGkNm7lBFjKITqlVwTzInizDGyoO8SeV2w+vPul0+RV56TXS/J
         hm9y3h8VhRyptBIzsPQuCYSSR61DwKqAgp9Mi2ks5laoVtwdZw9xbNqJhA0xvePic6Z8
         ul14iEVA6V+W1bI1O8kDgV2jmH0BdpLViQ2GK4yJjrp1KiFQIpam1fm9dEM/Lsy2KLGB
         qLsWkoq6T6n55yQBdVGewJRGlfIICtAT5iyB/Zr2dF8HN1JuxsE0PrDZVSyb5h42xUzM
         RNsu8TjVv4y7wxm+/VH9mqdO8U5E6gFO2l+GPN9b4GRTdB914VKT1h2Jxhk4I7sXrFd8
         8yKw==
X-Forwarded-Encrypted: i=1; AJvYcCViaadtsONih6KwOSmfJFlJjWhh3c9mzLpEdxkAXXDZzZWkhys+Pr4D4UlG2L77ELlv+2GCt6227WefOY6E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywki6UpNuXGRkDlg6vWdyzSiepRy4PnKy4+A6lkP1azxNtoUSw4
	8PAA45jZBUhDkYSS7cLz+9DmrDbtxpTpGVJdbACS0Riayq8x7Rzvg236eCd7OyM=
X-Google-Smtp-Source: AGHT+IHAD9gnG+vrWMrfHWvKTKuTRgNKabB7Z6XbBoZLxcRN/KC+3/Pv5T08i9l2+eg3hX0oX5SEQQ==
X-Received: by 2002:a05:6512:3ca4:b0:52f:c285:323d with SMTP id 2adb3069b0e04-530bb3b52a9mr3404779e87.5.1722806816947;
        Sun, 04 Aug 2024 14:26:56 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10f7dsm904228e87.112.2024.08.04.14.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 14:26:56 -0700 (PDT)
Message-ID: <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
Date: Mon, 5 Aug 2024 00:26:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 8/1/24 11:16, Bryan O'Donoghue wrote:
> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>
>> Here.
> 
> What name would make more sense to you ?

according to the implementation the .init() call just fills some data in
memory, so I believe this could be handled at build time, if it's done
carefully enough...

--
Best wishes,
Vladimir

