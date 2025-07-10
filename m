Return-Path: <linux-arm-msm+bounces-64321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DAEAFFDA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE84F1C279B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1D42900AD;
	Thu, 10 Jul 2025 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KF7aiPDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188022330F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138927; cv=none; b=bibx5On7eu3jRlGXfnfciPBrTzja+e1xWmje5rGJeId50IDeb0blOnYn9+5XVF0gT43niievtoP7WvZ/m2HOAMmrKoiwhgH1Pw1q9bSvY89tmCmlRecc9wAbOJGQcXo8qSPLoJINkgrdakQBkDot7UdooNvwOKt1LPyx/Z6pKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138927; c=relaxed/simple;
	bh=iiLjM+aUgsYzHC/WPwWLV5opBtyLVc4FDeCI5k5C/gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlVyma8fxiKgl8Qg1IpEg1SaUYl/sYKXRWlZeJiF/I/tNcuh2yXxbPXomcFVp7eyP+EYGSYfBdfLN2NKs28ogLxbl7GBrTYSKD2b/6E0Zf1AgFnKPFGOWH9Z5q4425KLLdE3lYbqQwMgjVV09N93fN9m7RS04HSNfWlpD0eBZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KF7aiPDf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso4903795e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752138924; x=1752743724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6q/9SW9W8dxQjuQZq+qCAODMrqQtpqZyWtMbjNSA18=;
        b=KF7aiPDfpqpR3fe7cobvW5bhi7ALwgm5qkdHnV6P3P36cmPxo2zhBN/82RsXy+UtTB
         TmgGry5fYF00eygna8l/Hs+UrJt/zb+jcr/CTc3w4eTZgvnpM1oei+Kf2MuJGQN2Sr+D
         xpash2zB+Ddv4OfQd01+M6n0Ioah/mklYNc54VE/UXcvL3wN8EwC2UblHFzQC/AqUM9g
         nfQ19T4ORPx52x4ndx4jYzFa7mOPxh+O8dJ+GTdRVDRW+cBlGu/tnjOjJPgFRHcYyMhB
         p03VgBIy+fruZGWBZnoxeZNGsUvuc+FAQi4h5NFvQTW/yRQvJAkFPAK/jBWcx/iBiYTd
         oYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138924; x=1752743724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6q/9SW9W8dxQjuQZq+qCAODMrqQtpqZyWtMbjNSA18=;
        b=M3I7rHANumScKwxyTe06LV1bV9Z/Jau3RJPXJtYrnEA+f9zyDbISRuPZ+rGEuX3HTs
         S8h8AkddjEe0oyM+bklzVFyQVeZduOdH5BmWR0zLbW6XTM8UW7CllXyz11tlTY4KqVrq
         95IyG5M9G1WWFKfXKz8rSvSmBQ5uOBFMM3vRzKdm5aSFPSGfy2au/Zglo4USStEPCnJA
         IkKsyciWMZevvJ7SyMipn883t6DJNn+qxkrEX1Q/tS2mrAi1WEzMKO4WkSwodkK5QQXx
         CPZWXwKjGatTMmZl2yJreuECHmp530JS4Hw5e6s58TkBi3Cu/BHNUW++gF2h5KSpR2UJ
         j0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcgpbZhDfGpWeTdln2vXhUYwiD1sGd/IHgpjJQEWi1OQmgwPGR9FzPf8ks6kyAJ8ENwfdoZ4xh9xwn6JN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gRs89jhN1MrYSiXs3sa50TvQ2R833Xuk7N6A3+0VH4+P00zn
	Mbmzawtz3NeMYsocVn6SQVAKHpgjF5Uly2GmLPi2INdAlV+IW4mN/ChkB5H5L2lSHS8=
X-Gm-Gg: ASbGncvhqzS5T3bs4Zrl8shFrSelDyebK2Cyug7o4EkHCIDiTIeuPtGgxR/XqGzmJb5
	Dv9JdZ6RJnjgz99GFdLoFJZB/yUxkvGHoeYfc5SdpHdtA9JCwqH2H50vRrdfJcqmhpKhDHPNWRl
	CQDPjpWmH0eUWki/GrTqzYNPW1pktFGOv3Cyw+K4KtpB+5yYv5NSOPjdLLyzFJf7WIwFUrHH+CX
	K+jwe8u2tDV3XHzLK7iDjUxNI57KXyvfeDlFj5SSINDzEqYDb6Thmu1fCd0pS3wXhi+uSYgDDCQ
	jZ/PIBRcu0gdPCLeFgU87jR9q52OJMCDHfgtBw8Ylq4v/Dy/06ubD91jI/tsYluScbH0+65kRk/
	zmiO9Tym/RqCaHJogdlLkJ9y56DY=
X-Google-Smtp-Source: AGHT+IFiUkvfNJiRLRUs8fa6XAAhAZRAnt+u186odn28Di4bfezkL7HU3hExac8w06CkJd8HzwOdhA==
X-Received: by 2002:a05:600c:8717:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-454db7e87c2mr31122345e9.3.1752138924220;
        Thu, 10 Jul 2025 02:15:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd4b32d8sm13751625e9.17.2025.07.10.02.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 02:15:23 -0700 (PDT)
Message-ID: <c3803de2-56f3-4346-9490-67cd63abb287@linaro.org>
Date: Thu, 10 Jul 2025 10:15:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
 mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-7-jorge.ramirez@oss.qualcomm.com>
 <8f30092c-0e17-6f4d-f3f1-769508d2f58e@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8f30092c-0e17-6f4d-f3f1-769508d2f58e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2025 09:57, Dikshita Agarwal wrote:
>> +			iommus = <&apps_smmu 0x860 0x0>,
>> +				 <&apps_smmu 0x880 0x0>,
>> +				 <&apps_smmu 0x861 0x04>,
>> +				 <&apps_smmu 0x863 0x0>,
>> +				 <&apps_smmu 0x804 0xe0>;
> What’s the rationale behind having five entries here?
> could you share the use-cases that justify this configuration?

Already getting in trouble with non-pixel/secure # of iommus.

Why not specify the maximum expected number hardware supports, 
specifically so we don't end up buried under incomplete schema again ?

---
bod

