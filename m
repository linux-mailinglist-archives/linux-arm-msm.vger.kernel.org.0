Return-Path: <linux-arm-msm+bounces-88913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55042D1CBD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 531B230AB17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF32376BD5;
	Wed, 14 Jan 2026 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRGJjSnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FA374195
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768373629; cv=none; b=Bi5fW2BbVYlnGMSAMK8982lZis1AgtNWN4bYC3qrJtR5YLRd5p5rJO5ljdLzJ7e6r2uZPgd7xwNn8G8BkpwdgFRx2Qti/fHM1qrmj1ZFRxwkBz5eUyYBPk/PHLDt+E3MKmOsSRVK9G03uOEmVbc0F2OJHe/Q/E0u60S+5GqFfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768373629; c=relaxed/simple;
	bh=wDjPr147o530hTp6AyG0aKzFnBjfrT6c3amHxS7WXs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRpqbxyPZJLFvDQp7IgOZXE5WV9dL2lD0QcZg987fx9/OzMvY4eLcA/0HqsKjeZIsyXyHFl+EGZ/ai7tnhHD7NZpurrdnb9LmiLGpl2xGlz4H03JujlyXfojdHtNC2chG2zNcqMgI7EyAiUxSzBKR2wLABegSDqabjJGH/BeLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRGJjSnL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c213f7690so5555166a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 22:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768373619; x=1768978419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qd+X65nK6RfRAsO3cC//JEtjHJbo+v1uWTT4QcX9DGI=;
        b=fRGJjSnLeIGuOjNH6R4dIGCGs+Q+xe4RhCtaQubMc13lldvw9Ysj3xFViyBuI2WuE7
         Iae8yZ5Yr3SJ0wJP6lNq8OckJliS9XNAX2W8kOMo0hNsUJ6mVUqt1eU0kpsZFTobJto+
         xACYMKo/BZlOjwqRNKQSh3JtFywT3dkRMtTX7r9mwdftwmya30pjQ+V90X6FdoQB6O7W
         sHb0lEKQLB0WoDbxI+I/vV8a7qxfBacGY01fCH/YNiRm9nXd32+neCPqKjsHqev6hEaB
         xdFTHFb69ctDse2kc5ylTEUznvBOobW5LDDvMSaokjU18bLpdnctwWx4MLFoGAPEUvNW
         nb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768373619; x=1768978419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd+X65nK6RfRAsO3cC//JEtjHJbo+v1uWTT4QcX9DGI=;
        b=C4oYGERr6t6ToYoW8zYypThgaCm+9hLkSNQbdotMR18bzso98C3Ca8kSY+YbKYkNmq
         j2X/nMsdkEYu6fpL6c7SQ9UiAGSUCvo3eiqxWJNZ8E420/HBlA1DZXkBB4c5Mkg7I3V+
         wN1yPPAYGpHKuFKDpsmWH3q9pSd8QJ3C3yC1DIKX+AOAyybureHUdmL69vmloCQd66C9
         A99hsPzox4cuY14BBKJIDMOXOppdo7WRuvQYtJB7B5JDjz54MDBqlCwSjNWpO8VnDfs7
         HYMYS2JAbQnw4WkNOz+w8ZFv5GsCCgHgc5EleTj8c8Z5sELB/mBP4Y8TpjJRCg+znFop
         xm3w==
X-Forwarded-Encrypted: i=1; AJvYcCUXK+yj2EBz0ZAvrckv4HkgFXaa3ABetQ8B3nTFVw2sRwIlowykJUxZL1KpfOfKE7lGC1CBgO+rrWIRvhXf@vger.kernel.org
X-Gm-Message-State: AOJu0YytfSGAnP6LBPc4QcNPpz8JAazn940r7bEeCsGXGZXpPabkhVHf
	0Rkmy1L2acd/Sa58mKu6II8iW2reGvHZEKFRZcrNW21B2XCVkSCsefzM
X-Gm-Gg: AY/fxX6vy9IlsqShxMhBGHIbTTvqQofVSXj010Qw5vPokm9MohGm1YFAeyuGXqmztW0
	8vt0AtMcefdEq+toVWbfByS2o+YGC/XBzQjenJI+a3D0Du+PIwOFSfOmVdAyDQVXaKlQxhtU5/c
	dN/itAv20PuoP71hxFmDE+t0EElkSqIMIzm2yDF8QMT65f3U9UvyoBMKl20IjrsMVjSPBVsKmzl
	fVaFtkmolfu0OVCf90zJufyR1R+r79e8OvExO0tw04aaWjMqKe61oXdNGUu/wn2nE7pRawTv8Oi
	iPCzcsbk+dTCIbboow6yAWkRvP9uWvTHTLGK30B9owNY50MjlyidUY4JyBWoIdFjfk/fsDmMO04
	9QpgrAlETbYk0ghpp8/xEKzjlWIYG9+Mk1V2cVExhmYzpmC3YalCexMPpA3+DcCgUpG6XZSzBgX
	L1hOb5S+MfcI4dHT2Ca3a2SU9OWtjkZTbIqQ==
X-Received: by 2002:a17:90b:1c02:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-3510911a179mr1754182a91.19.1768373618586;
        Tue, 13 Jan 2026 22:53:38 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm980556a91.13.2026.01.13.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 22:53:38 -0800 (PST)
Message-ID: <2117527d-c95e-4043-a5f3-7e4550e8fe2b@gmail.com>
Date: Wed, 14 Jan 2026 12:23:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-2-tessolveupstream@gmail.com>
 <2e533b51-399a-47e8-bc3e-ab61797d6762@kernel.org>
 <f6ff2086-19f2-46cc-ac89-d8ef3847b9f0@gmail.com>
 <d23e3693-0cf8-4b31-a3e4-e562621911d5@kernel.org>
 <dce7702f-e845-4940-8679-a8d80563988a@gmail.com>
 <d9267c08-4470-481c-b56b-390627e9e61e@kernel.org>
 <49ce6fee-36dd-4e0d-b2e2-b516b16a8b25@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <49ce6fee-36dd-4e0d-b2e2-b516b16a8b25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07-01-2026 16:47, Konrad Dybcio wrote:
> JFYI Sudarshan, there is a neat oneliner to do this:
> 
> git rebase --onto linux-next/master $(git describe --abbrev=0)
> 
> where linux-next/master is the target commit/branch to rebase onto, and the
> second argument is the pointer to the start of the chunk you want to rebase

Sure, got it. Thanks for sharing the tip!


