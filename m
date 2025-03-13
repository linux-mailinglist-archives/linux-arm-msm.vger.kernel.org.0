Return-Path: <linux-arm-msm+bounces-51261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4405A5EF81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E12417166E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB5D2C80;
	Thu, 13 Mar 2025 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJ4gVJSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1B2641D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857930; cv=none; b=QZo81zQZxMIcKeoFixVO1wzQg+gC3a85GQ5HBpKLpQQHMJe3jFLdYo1F6zSgdxGMWVQlrBajtOwHC6lvTAEjL6Q2I4W/WzvWdDUqQXbY0mpQdwdd1oqimGdR3YebmfiYuvbMBWIKuP/jr+WF6+S5fllrHL8oy2rlkiBm8lgU2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857930; c=relaxed/simple;
	bh=rcivCuuKb5DJC2dWp1UTKWOv6WJHpyf26Dq5c+yW+e8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fG2Xx8Q0xeGxJBzkmOd9sMWzlCBIC0M3gcrsk8ssK0FP7//gUJJyc0MjgfZl25tk4Hvo3z0hbNiLBHpzCOqfgxrKtG14IlCxIZOt/wrqAQcu1DfY+WXRme19noVsXo8cbT/kcta7xxPVTiDeX4mv3OTBNOIKYlbIdC9/SbC4UYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJ4gVJSi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso116506266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741857926; x=1742462726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6BKWe13AnVlYTglbR/JxIsdaPBVgChyq3A6mVc/FBI=;
        b=oJ4gVJSimuN2kZWyzbfd1f9+Tchq0Wg7v+XxRjq5VUjBV+rMXWosJ1nsxKo8RrzZW6
         C1lr633Tp5DZHBvO56+67xXSOdm+w9BXrQ9cGPlYqWnW6+2Q4Qn/Mff94YwNjyQH8dS1
         M+LGQUDn9YZIvpq8JDUFlb5FWxd9JSXYgvR0lNeD3pgY+Hkm5yOYtyr/ZGREQYmp2T3C
         YQA0w1DoqU0/1GLnjnAlHOwUvayCBXX/lSMdq2IBCSdFt+Fk4plpv8xeS6msIoSsE/MW
         vRZuPfco8eZBw96Qw1aPHHpUqMNdyd94yfK3BPXhdB/9fGDZgCu5VcZygtfgwXnKHRB3
         ZBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857926; x=1742462726;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6BKWe13AnVlYTglbR/JxIsdaPBVgChyq3A6mVc/FBI=;
        b=h0V2kiTeY4kNEtzTZ+/TTXvdcylMrMAolvbVp0onFvhmTP1Jh5jKZJ/68CJp8Mue/Y
         xvTIC1tb5ZpeNGLTrs5kCjddxwOvO9waBuAnNpABi//JrEiBMbmedaEOk+T+cdTapvzs
         a9rhy/Vcu+GVt83Y0OTcZd7iFtjnANHhzTdG84PtyjL/wp6XlWWjPfq3bFbXglcqp9oR
         Rr57tFhbznhCYgTheSgrVQJur2Ru5dZyrW16SD2/53lmwKSTW+dR4x7Z6yCh/aRYl4tm
         PBJvvT7LbF6PZIuZ/1mdpq7I0+IrQu8qq1TYMcuOOM1XQ8+uM8w3nnCHXWqbd5uu28b2
         VZgw==
X-Forwarded-Encrypted: i=1; AJvYcCVe2pt4reTlX5t+dUDgsNQOeHzuRyYQY8fyy0AccDhTHGkOow5Nq6ZbbTgHwpFs2sPr37DF5xZPpfVgTtpD@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1Ms3jeozmVi/tPyrqLUdBOQJ2yqeaLA5QgZKiqohbQAW7bD8
	ZUO9WRADUOCusJLmfiLPqXiypwS+qKwqWCEDue59hM2PTAx8o0xlbuLffWddnfk=
X-Gm-Gg: ASbGncscZ3HaJvRVR6yNx1ETWeu+tQRbO0YhnOaZmegp/17seKrEoqT0kF/HaMeBVo1
	N9LH+3H0DeQ4o6UQOmc1r7QiXHi31Y1psjBhUyWBAqBvOQ4wkIkYdBV9hX913YHnE+OfDjMSRGH
	PC2rbPwoELzSmTIn/FRCnZenOtO+qLwnpDtujencqcobRtni4knviwfwzIXlxXUWQ6wJ1YHJU5c
	cxbMyeHUbYtdVjAex7QT2gnv5pPgXxhDvL+H/rxBlo6wGH4ep630JnTrvconrsD4ObWjkz0kJTU
	fI1jRyOKH6ItTK4tNPRBNbOhH24FF2aDiXvcQQHJAS8y/JZMIoxFJc27LzH3g1Bkz/2pNCeIv1v
	C4z3mOr6cgM8FV25ZbRgfCL/0sLWMqTq2rc8heu2Xw+Z6hRdwO23n5i+SJbmK1BjtG4e919n2bG
	5eCf/mkeYH/X+o2qY21ewsTH7Jfo7tUgQ=
X-Google-Smtp-Source: AGHT+IH5zmAOIRX14h+u56weR60bWxrn363VpmkSSc4ZYAXcq/6Kyfk3T7hCGoj152xsnptr/NS2Ng==
X-Received: by 2002:a17:906:9587:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac27ec8cc78mr1760185266b.17.1741857926012;
        Thu, 13 Mar 2025 02:25:26 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a4856csm57215666b.156.2025.03.13.02.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:25:25 -0700 (PDT)
Message-ID: <b1be6e61-c620-4df0-810f-036c3c28561d@linaro.org>
Date: Thu, 13 Mar 2025 09:25:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
 <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Content-Language: en-US
In-Reply-To: <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/03/2025 09:10, Bryan O'Donoghue wrote:
> On 13/03/2025 04:39, Taniya Das wrote:
>> power-domains = <&rpmhpd SM8550_MMCX>,
>>         <&rpmhpd SM8550_MXC>;
>>
>> Once the above change is incorporated, please add
>>
>> Reviewed-by: Taniya Das<quic_tdas@quicinc.com>
> 
> Why does the ordering matter ?
> 
> It shouldn't, right ?

Being clear.

I just want to check that you aren't implying a dependency between the 
two domains, its just alphanumeric sorting you mean here, right ?

---
bod

