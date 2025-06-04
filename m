Return-Path: <linux-arm-msm+bounces-60264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A0ACE748
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 01:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1113A97FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 23:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF88F25B1FF;
	Wed,  4 Jun 2025 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKSlsQB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E62749CE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 23:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749080959; cv=none; b=EkOGtEkwDQfVQbd3SfrJ0PoTIaOX4P4yU3jrKOZCvxrujQOCRB1Z4GaakphUnLaZqQ+JtKc9Yk9xf+iMXvzAo/mzOzTSrk1/AszlyaIITFyvRPUHKlGV5ijtLkCPSxwaN8/7At9bbTEDJRphVEuOH8CwiW7s/90pZQH+2BBzSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749080959; c=relaxed/simple;
	bh=ZESbz4ELnO8zQblI3om9NB+hAW28VwXYgt6cEiXrarg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkT4+P2piNJtoKxKcl3GfDjpgSj7QB5yucwTNgz2osbiEbwtQS/K8f++N5CTCnKSm66g0TC9/xkP79/jGOKbjJfO4WPPyt6YzIkyue34xcymkN6aJzdX5fEeSYKzEgRIRHjqb+oh4gulxe9MEymTIOaboevmeI92NmqIEFjLFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKSlsQB+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cf214200so2870615e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749080954; x=1749685754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgX1rI0BiX2paFRHt2ngtjy2dYKyJCurcIJGGVP0I=;
        b=eKSlsQB+axJ2wBrBCcutB3u/sEifgBhfgzUGAXXMdeQQEVtOpHlVvpd8O0jbeWn7nj
         oiPgcvs7+si4r3rftBX02Ijlfw6LrW4jkD1rHsgm+BoG/2Jbmu2CJOAezK0/MkzlDLTF
         ND2HOjbvFzq1krlSILyAn+ByDVinaD5ubP3s8qTludNEpGdVXQTMdpDsVYNZiJ4o+R/l
         oFT5QmQaG2ggRpjrY1xuc017x6gJ3sr3mxY1qfcRDjMVMrDgltopcruGloUWrPuSNuxm
         DcsFCV6IuMB+khXbT9ezTn3tk37dktAZMY5NCcqIcCSWsDz0TddBcQtkFeNYwxjPC3Fs
         P/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749080954; x=1749685754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgX1rI0BiX2paFRHt2ngtjy2dYKyJCurcIJGGVP0I=;
        b=n3PqbPWCzYmfGJrhimtiiCsnoYbNv9vKx5aLe1yrdj8aLEWMS1Pdb2Rvxy1uiFN2wK
         Iejz2//vz+qhDd3786LsUouXmeZdT/YYgzVlF+uwL/uqb5hH1HpFXcyDAzj3+JN/OfMZ
         mT2LTpqSgNTuRTR+2MyWu/TyE4VEmNjWh/ts5S9lLxt5x33XzFLwXurFYQctGsAzhvBa
         F1ffA5rbpn7EFf4ZlvFJySu4TGHeFPjlcd+wt1mrXEIx+4vMj92YIeL/GrrNIaP1OKlD
         1LJ2xWYmZY/Dr0jajKy+Ztr+UPrsxvOUg51SOSXaLwf7In+YZt59QsxOZgWP6FHa+GfC
         BXyg==
X-Forwarded-Encrypted: i=1; AJvYcCXgPFt/cFwgYa71SeQCz7xRtXXBt46A5nFZxqkg+H9m5cMuUhWcPlgggU0q6Boh/+uhvgXvDaIKWXXiE4VZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6I8ISQNx9izKzgMCT3Ez7pdEHojyDTvSxjqli7Mllf4/emBL
	15gHEqvmX/5RSPeYh8NfEXsZdWnBu7Vkje6QE3Ij12F/wZmN/kvYsXZEwN+P1RCvcXI=
X-Gm-Gg: ASbGncssr2QAs336b0/y5L/5QOXNG/w8wqMQf0PWwEVNQBkVu6DJ0dBvg8527xoYV5X
	/9BxDeLLzpxHprL5pgAVL6bZ9OfKiFePJsM8Z+VpUvV88Fxn36F9iLquvRkxmfLrv6aaTIjeCHA
	iom7WPe4w0Id4eTJGG5mMqKLD9A09B8uemMPnz+QtU92t5EVVVZ8UO5Vgj1oWG7ESHSveQ4EwA0
	uYJnC8uMOTKiuQfiyGHrSNT8iGstKhha+W1rTphmR3O9BUY51Gncx1XfabC/RkJvRSdyYI29eXU
	rByb9HBEHzS6NEkAhxKiVuBh9h1M9/DBq9WDmZ3rPxN85FfCYlXNPlIHOFwL6QlrNWRESJg5JT+
	3Y+MHeWXSmzKFvDbU
X-Google-Smtp-Source: AGHT+IF1mChU7rsrPqSp02CZnJuBIHPZRlYSiml5HbxrDzi778Xa2HmHel+wqN5T3oDjSRgQCq7PnA==
X-Received: by 2002:a05:600c:3b01:b0:450:cf2e:7c92 with SMTP id 5b1f17b1804b1-451f0b0e796mr46847795e9.16.1749080954166;
        Wed, 04 Jun 2025 16:49:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f9816cdasm5975275e9.13.2025.06.04.16.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 16:49:13 -0700 (PDT)
Message-ID: <bdcc3e48-ceee-45bf-bc4f-f0e63d44b333@linaro.org>
Date: Thu, 5 Jun 2025 00:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VkNsXqYDdmwW9dutwc76Dv8ks2pvgcUwpf1UREJXhbXDQRaobVZL8m0hLz6rsOG-v6CjyAW3vHbuKMiPc9kN_Q==@protonmail.internalid>
 <20250506180232.1299-7-quic_ptalari@quicinc.com>
 <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
 <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 18:11, Praveen Talari wrote:
>> Separate this stuff out.
>>
>> Your code should match the commit log. If you want to convert %u to 
>> %lu make a patch to do that, even if it seems trivial, it is better to 
>> make granular submissions.
> 
> It comes under newly added API. Do we still need to make separate patch?

Best practice is to split this stuff up.

If your commit log says "I'm moving code" then it should _only_ move 
code, don't sneak any other changes in, no matter how seemingly innocuous.

---
bod

