Return-Path: <linux-arm-msm+bounces-55844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA9A9E4B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 23:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA3C17811C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 21:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F014D1EB5DA;
	Sun, 27 Apr 2025 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzxNj1Po"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA51D5142
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745790754; cv=none; b=EoOXPtKvyq7j1rqeBl/GLRtVtGUrEeCOCs4e0oKgS/95Xvim6j3tUTbXaiFS6vB+g+THL6rSbnct3MFUpqgAKqh8CcqAZm2XMB/FjLUMFHh+df42P/bKrrtlumXUiJCQXt0KyMVIUmlqZX2xqYCUmZyxFJ/9dU4WQB9/3sIDsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745790754; c=relaxed/simple;
	bh=NLCEKxqfnuKPb5qhY6v1wHEJ3q7ORDM42IQIZbtYrhM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rcx69+o4IHYFBGSofAmqZ97U4CMKbhnooxID/yldMzesWiDET7RfCGMpTUSF0buM8s4ywK8z4/ytpP66qA3SIJuEpB6TQNdJ7ym/emSo1XaShXNR+ESZEJ7RvMB2tmh/1CB+8UNA+FAWUIX4qpf/FejkLj020OIZU2KZRv/M64E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzxNj1Po; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so26610005e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745790751; x=1746395551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=TzxNj1Pojr7RTolJ10dsd6eT9YAdZyQxrutENJJtTaFcL6dnXfl2VfA4flUmLn9Y6O
         IA2VCJesCJZ0o+FNl+wc9PuCLi34SD9SM9htndynSGPDlZ1Y3HT/euRXNKqpBpRBtb2T
         vwvRk/PjAin6KorHfoc7H/nqoCt8FNBe4kkusgjQzSXLTftuBp5i+Ovj9oJwkKGKExl/
         GZ7B8CSBSSKzmf/0iRmqlodqsmBl2yjn+kpE98m5NsQr/93xFj2je091lhtW7kPQJAHO
         V1gpn5Udyuij0schJhvNotXZCFyUcr2MLZHg5T+upNOtdCd1MnrkQebwgFNRKF2RH/tC
         TEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745790751; x=1746395551;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=QoOtFCmQUEuNum+aqYmVu+C5Tp4tEnGuESOBKxA6nH8foz25ibKGV6YHHKst18uK73
         DzXbsseTu/5PPFfMT4VwtVQzOHXMcIs1s6JoBBs9wEZ/2aFktqsEWqiV9FPO+Alle+8G
         Y/vYydkXnUn71uaiEPFnPc0XFlmQFXz8PGuf6yljbuSrB5lHNyMJ/GJEolT3ZkuB38Z8
         eMF30Do7FXSlJsABX4DO/FmZZYM12GKm9oNaoaRkj14pkJPZtaPMwo0AeZ6jBJeLQBpd
         MRjYxjjeo+hux8QeDqPMQ46MJLq2WyaEyis+wEkT6YPaFfboK3AmfECs+4T7qUaACJ7j
         IlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJpoIXWmISi8BvQst5EW0aISGCJchkvvbSgD06JBnj46tH0cyIV0N3z3lqdwLJXZtfSzjMsYYu7yD5VDKk@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1cs34O4MCtoYuVCs2tOTHF1mfuxFDI49uZSKUoiKBuLYbFV9
	8UVSv1/PSnDl658wADD1NovjKmAacb7SNfRy6n2xF+l7JQmqxWwbAjLDdgG7mPI=
X-Gm-Gg: ASbGncsQkvZYETjjXk7XDy8Q+McOPIc6bWv4qWGYSnK3GPxLc5ZsscqyD/qMNSIyj73
	8zsbxQs+IBERa9NFDiHakM5gxTS4b/Vo/0+4rf29/wHlQGVRADjxdfYNkf9xSg22QMMZ0eTjsax
	ppnELm5etElhIHso7JCPXsDHEp+EC792mGLOOOOY4xPEPYEEmpqOWw21TAcT/WRkxsDRfNCGo3G
	XzWnan0+xXmjgpKYQ8d1d4xGLcPrzlEE7GmpSPyB+8zFfblAtW1xzcpAVtkZ3Aot1+a27oOQXKl
	B/3pH7Zf5CRdflid86yzBDDWFrHjc98TG5C6CJb+sSKd1W7EFa9JH800L6nLWtDhJ/b9SH6oQw7
	FTMYMTYC1QUaO3azv
X-Google-Smtp-Source: AGHT+IF9NtTwXVCry4ECIh7ifDI7xSXFecW32O3JGgQylC/n1HXWQ9lefOctYA70jHd9LbL7GdOPxg==
X-Received: by 2002:a05:600c:1d8d:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-440ab848458mr54631495e9.23.1745790751367;
        Sun, 27 Apr 2025 14:52:31 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a1544sm138759515e9.11.2025.04.27.14.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 14:52:30 -0700 (PDT)
Message-ID: <fcf5eb3c-a2c4-41ec-8c6b-d8aee5a9f906@linaro.org>
Date: Sun, 27 Apr 2025 22:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
 <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
 <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Language: en-US
In-Reply-To: <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2025 13:20, Bryan O'Donoghue wrote:
> On 24/04/2025 11:28, Vikash Garodia wrote:
>>
>> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>>> Add the IRIS video-codec node on QCS8300.
>>>
>>> Nit: you can not "add support for the video node". You can either add
>>> video node or add support for video en/decoding.
>> Makes sense. Will wait for any other comments, before resending.
>>
>> Regards,
>> Vikash
>>>
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++ 
>>>> ++++++++++++
>>>>   1 file changed, 71 insertions(+)
>>>>
>>>
> 
> Unless you get another comment, there's no need to resend.
> 
> I can fix the commit log for you on the way in.
> 
> ---
> bod

Oops this is isn't one I can fix for you - dtsi.

---
bod

