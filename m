Return-Path: <linux-arm-msm+bounces-83118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445DC825C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 20:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE848344D43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 19:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7DD32C33F;
	Mon, 24 Nov 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zifCp9YG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ABE298CC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014138; cv=none; b=uNOYSjbWJ5O322NyYLb60yhZ/DXrM1bbsfgHj5Z5Ske+TBm7RHzpYfYeNGeTPh0C0pYEZPUG97U/nuwIc+ZjoF22Mi69c7EBqJ3P0Kuqx8GvW4obSoY0C6igQnjvO9w8U2tG6Ku7q69kPxHQM8/Eu1zOF3V9TX6C2WIaB/9yB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014138; c=relaxed/simple;
	bh=Hww4r/clZbGwOPAL0R+gAV+VwwNhMj6VFNQ6qTSfDKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHiO7JlW7FJeDkNyq3GE0gBCldDqAIt8SMsoBDxCxaOgRK+4djKbQ6pDrYEHPjhIV7Ueg/qqkk5EuzcxTCb1d4RZnBpwp0SsUgdmxzZqkwsAOdXB+J/lwv/ey6aMM8XWdIm613hF3UVfl9iqKDY4JyOYnbejC/9gMMgBbJUgN5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zifCp9YG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595867f09fcso604602e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764014134; x=1764618934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1kHi++ZNMidWcUYlTrVTx3q+FjuKsJa/tn2+fCONh8=;
        b=zifCp9YG+BS80r4bf3qKBCvCnvXAentPqVx9hprMDprC0Gecg8zIMUZB+IvLaBg21N
         q5fUa9UutNgQNICRbYPxcZGiuQzc24MIIOFYQbhC3mWDCBapMft2m8weIDKOLJttEm0c
         3QrvwAghChU1CrTbnSBhiOS9QUeEcWF9nBhIxAEVWqjC0PgjABNsjbl9QeFHW6SXxqwz
         yW0QuIPFYCJQ2cjzWKHMnNCGggocSJqIJNSe5UVqphftDH+KKUvUOJ/7zspv9ul5XKLy
         39HCOD8jp6zQIg86duuuXkCh+O8Vt3vA3rDPuW2FBFCew8t4WLIfgmaPwzJyFFaZ043D
         E5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014134; x=1764618934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1kHi++ZNMidWcUYlTrVTx3q+FjuKsJa/tn2+fCONh8=;
        b=FL+Cpm7razp9W/of4hEFPgpXvqQybM1luFxw1NJ9rJojLZig55Jw32g2NVoNJFe3f2
         zVxdWEGlfiCFb7GgSifdwZug+b+R2MY6yoz26yv5dJckBhDScc0DGWl0/8ACzkoLgkvp
         OuwrTOwKpmW66i2+7juwnMLRb82p7JrGMVYJsGPGVgzld05RbejRGT+mCG/VYoiw6Bkb
         zhijIYRqyfz5g4uILp3lBSiCfCdVP8CV4Ko+WQbSDHOSw4hx0qmKM9jPpfvNbhOeFD27
         wxcjlq5nYunYyKZ4BiJYbcl4+Z1XFZMpqMQncEUpBD6FqaML46mzbMLVAJgZehjXjSxL
         s2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWiwTOY+lHT5KY5lUqFgxCVUDaKBDOaBN5cUHgnxH/7jeBpwRyTCc4ZFgJJ3tJQwUVBAezp0hLbWnoOCpkr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnq/ULCmXAmhWX3mQTmHIpCMDnJrqXQ5IeBgLLl1n6KguXWCsJ
	7JLyf0ENC6alNy70R3jLALD8uUBMKWgch16la8rsy5sbrIPcAHYO1pzTsusee5eFGa4=
X-Gm-Gg: ASbGncsoDj8LboKZKtPJKA0jYLh9KwTxAvM2jka2yPl8jNMCSdPN4vRw2ywZTGEeM6D
	VSn0DhD5zFdhxUdNF8tJU/GPKZxjxcoAY3cgFvGA8EwGH9bTJngeyQ0esE4blzTVztKX25ukoX8
	1WCWLevPiS7t6mSaccdnLOrClXMy5UqLaxG/URH+pQDp+FX3UtDoy/uFxN6FOjNjkIozSH0miYa
	4rpvYHAka1MPapPCB1kHOGsKpm+rUjKHA29Qdqp9zSRCTEcmqr3VH+hth0UzgFkLwZB7LOzwepE
	EnfhWDcH0Y/Oum2HmmAhrrj6uoQUouQ+x9UCv0/hdQ5bELUbdrijGG9tfcr3836Q/TZ8vzsF3CJ
	g/ROH00o368fiqf+OAVkE0TDOlcy8ytZj9DGfuMUSBl7EWbPwXhklNbmuS5In1+GA8RmOUZUS/5
	67fjlLEwLM7VzB5cgVMBM1sKS0H12k0EkcNRXA/pEe7iqmhXZjFNc4KyXfWHBNLh6Fvw==
X-Google-Smtp-Source: AGHT+IGftA4Sbl7SbaEW6aFFPJ2zH/lY6elgcX7aSCiKVohOvTSQTJmNIh0kVXSACBJSpj5m6pkvWQ==
X-Received: by 2002:a05:651c:3251:b0:37a:5ae5:a1d2 with SMTP id 38308e7fff4ca-37cd9254795mr18408431fa.5.1764014134295;
        Mon, 24 Nov 2025 11:55:34 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b64091sm29578181fa.22.2025.11.24.11.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 11:55:33 -0800 (PST)
Message-ID: <4d347c15-a2fa-4b86-a5c3-c47ecbc804bf@linaro.org>
Date: Mon, 24 Nov 2025 21:54:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Unrestrict ID_AA64MMFR1_EL1 bit
 assignments
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20251124162955.3616314-1-vladimir.zapolskiy@linaro.org>
 <86ikezqq46.wl-maz@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <86ikezqq46.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc.

On 11/24/25 19:47, Marc Zyngier wrote:
> On Mon, 24 Nov 2025 16:29:55 +0000,
> Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> wrote:
>>
>> It appears that 4 out of 8 Qualcomm SM8450 SoC cores do not generate
>> an SError interrupt due to an External abort on a speculative read,
>> and it is reported as a failed sanity check on boot:
>>
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU4: 0x00000010212122
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU5: 0x0000001021212
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU6: 0x00000010212122
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU7: 0x00000010212122
>>
>> Due to the failed sanity check the kernel is marked as tainted in runtime:
>>
>>      Tainted: [S]=CPU_OUT_OF_SPEC
>>
>> Unrestrict the ID_AA64MMFR1_EL1 SpecSEI bits, since apparently it's
>> a supported option at least on this heterogeneous SoC.
> 
> Supporting asymmetric configurations has always been on the basis of
> having the same feature set. Just because some SoCs ignore this
> requirement doesn't make it acceptable.
> 
> Tainting the kernel is the right thing to do IMO, because that's an
> unexpected difference.
> 
> Additionally, making things non-strict may open a gaping hole in the
> virtualisation support. All you would need to do is boot on the CPUs
> that do not have SpecSEI, and bring up the CPUs that do have SpecSEI
> late, *after* you have started a VM. That VM will have been told that
> it cannot get a speculative SError, and yet will be able to run on
> CPUs that do.
> 

Thank you for the detailed explanation, perhaps the unveiled problem
on Qualcomm SM8450 SoC could not be nicely resolved in the software,
and I'm convinced that leaving the kernel in the tained state is the
best option, at least I can not imagine any better workaround.

-- 
Best wishes,
Vladimir

