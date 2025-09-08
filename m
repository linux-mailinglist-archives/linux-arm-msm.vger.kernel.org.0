Return-Path: <linux-arm-msm+bounces-72465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA2B48364
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 06:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A892817B468
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D872F2206A9;
	Mon,  8 Sep 2025 04:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3KEIGdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A0721FF23
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757307103; cv=none; b=MyhTUprQevr6kzSSSZa4HWw0G9gjig+VaNesQCnZmQNpGTbosEs/fPmceaUjsuGvhPuQuM64eUX0hyRqX6HfPIFsUQ8wNRC8KxAqj1O0ffzR3Kg6SJu5fEyOlwrNy0Vb+GlmghMGHmwRonRCgAdOZaxcdLJyqxk1ucgs5pEm0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757307103; c=relaxed/simple;
	bh=PiTMXDeB+RZXXFHBE8pp2cblxqqUufgT3jQ3N1Z0SZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCGXKCxGauKe/G/8U0YkPAkTJ+VftnIQju+NMz/nsW4EJeDbP+EAunPI8B9GxV5CQsOaR58jWTA2GG+BShWmm1wWhQntF+6nev9a0Le7HoaCkMuY60Wt+EffJL3GX7ET9I0mDUVZLCjC8ZF6KurlwAem2jBD+Zpj226OYioV5DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3KEIGdp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de287cc11so3544685e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 21:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757307100; x=1757911900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH42QsL0Brv8nCGOlCqNoHb4KURJ5994q00eblEx34A=;
        b=B3KEIGdpLfpaf+LLLjOGaI5Lub25lSQiE1twEu89X9FYq784/ODGT1kQwrpB+2p1yo
         GxcqovRrHBHmgYJ/byhfOqDwqe+1aDpBAxeasc8ZScp4I10GHJpE/2eKSHXTHwjbowzM
         XBSeHmd/y4KRt/bu+bLn/L5t4CK/i9XtnAoOns1EPkHHOTo0BXmU7R3tE/+PmM+fknCF
         yWcfauWP5LPDLLQh27cLLDEFXkU0c7559ZvduXPVQxsjrSnIVlFNF/u6fjUae5DUNnCE
         AsS6h7srseG+ElmdCfZL0ZHzD9OGHegAFQ2BA3hcGPa0Y+mws5/V0l70R0OKqMXvLWoM
         Hx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757307100; x=1757911900;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QH42QsL0Brv8nCGOlCqNoHb4KURJ5994q00eblEx34A=;
        b=GhHarwnTlEebBAxqGQ2oWOTQ+x5Rp4guJC3FOCwgcyTbvAuxwcs8anTlQCVr3yQjRL
         MktBtsrSj6DoByLAX2AQYEFODXqzbDn3EhBfqW+s0y1owK6oC9zoIRlSGhXgBWeej4mO
         CICfucRObANujbplLGsRIafw4Z2p4o65Ig0MhbxW6drlwVWY3+4Nq2BXpC80l/LzW29o
         7DghN+Mh1Dm0pY6QqQMd6LG4+zSyYXk0xOvllKIg8wSQx87XnyNPZWrtbutb3wfMqf1y
         Ks/C1Opv1Nl8rFFd6ybYJCMxnzeRiyEFzeadUCXqlSeE9y/H6bEI1cxswVBrUfnjC6D2
         ps7A==
X-Forwarded-Encrypted: i=1; AJvYcCVKxHYAHnnw0zZmiFFfc2Fsu1tOsMgq1cB4jQ7go3lAEWUYOrRrb4SiIYJlHMQYWGLi/LUEy7PslkGRLBtg@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcyNY6WOhpJvlnJMxPgxqwnvXGLKyneNgqym2Vz7Av/ca9p7u
	Yh5vlylD+4eyFx43igqCHFkj8EorX8QPq5UhhzfoDeFGbQhhRUjeMT0D1GWqFU0OhVw=
X-Gm-Gg: ASbGncuOZXOjdLs0ENjAYWMECFtS89ZchQPys4T+QuG4uU8iihc0tjTTnRJqcqn9xau
	i5BtIXx3KuUTWpYXGrsh8UZI2tOBPVQxLelswWac3Q7nQZooK65OPsD/2D9ei9WmAUfLZITF38j
	1ZbSptiqwDgkzFdJM4lDExdNni7BjPlpee7VP7HWiq2ttG/sJluWKz0jfRVfaQ5GcrB46mEKBjq
	eOqSLVuIBWlYpLe3yHXTV3B9wREvg3xVb6+xuPFjb4NKOph973iShH++lC5sYarNzpb4mS7IbIt
	s3kgA69i19ECdbhBZWLcZ25kY5mlq+PdZp0pDqVomRpXRSkUHNdyb5gB11RHdfqsMkGzOp7agzk
	4IhmR6ogloYtVuyK+wqA8LN5IMBLS4x7lGjM3/CtLxQFiuPDhdOwAl031QJow7vDDgO6l1zqdLB
	zvr2UoYJesoiZbb43AKis=
X-Google-Smtp-Source: AGHT+IHJUG3UxrigQCdKhJJdmiAwf+H3VfZ4m5MK0YKe4/GVGBasirbK5SoRbuR1aXJTIQEIhs4uiA==
X-Received: by 2002:a05:600c:c0c5:b0:45d:e531:99df with SMTP id 5b1f17b1804b1-45de64869d9mr12553795e9.3.1757307100364;
        Sun, 07 Sep 2025 21:51:40 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm271826825e9.21.2025.09.07.21.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 21:51:39 -0700 (PDT)
Message-ID: <e0e1827f-aa8b-4337-b26c-dc2ac43e0e2a@linaro.org>
Date: Mon, 8 Sep 2025 05:51:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add CAMSS support for MSM8939
To: git@apitzsch.eu, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/09/2025 23:04, André Apitzsch via B4 Relay wrote:
> (This series resumes [1].)

Thank you for following up on this.

Could you give a brief synopsis what changed between this series and the 
previous series ?

> [1] https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org/
Good series submission style would have something in the coverletter like.

"Here is my awesome series of patches which do X

v2:
- Fixed everything wise and benevolent kernel community asked for

v1:
- Enabled cool stuff
"

I recall we were pretty close to picking these patches up previously so 
thank you for re-upping your effort.

A brief bit of guidance on what if anything changed from your last 
submission is appreciated and good practice so that we can review and 
apply quicker.

---
bod

