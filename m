Return-Path: <linux-arm-msm+bounces-40139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2729E2AE9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 19:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5381D1660D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C471C1FAC54;
	Tue,  3 Dec 2024 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exzalodJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEC1632EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250728; cv=none; b=J40KM2I5j4MxPrr1lLKJjJ1JRUPQBsrefVD8XND7+x3a0pPG/26Hy9na8qKkgBwARxOzYvSbX9yBS/X4vCGoyab1oc/i9lAQN3qZQdxMQbl+TnT8haXAgvxhgvcYDwjyRBQ8drOutKTQC7KiGixl+G1vMXm2j0jbjYlbHYk6krU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250728; c=relaxed/simple;
	bh=teJpmPTMJwM4XhRCt98E5exgGcMwwsgs/+69aF/6jTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQIdhrTNTbijP/z0Nmw7iVA9oDdeMbLFR76FOUwt5nsrf66MOBbNtXnz3ppgXHmq+QlI3Z4XHadWdWN6l667d0wDC9lqyO/YSLPwd97dOuEYIYw9DC7CBRBLuu1qfEPGK2ChBkvlvoG6pCAyc2BJHX+irhTMGq7uXNZpigSWFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exzalodJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2337980f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 10:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733250725; x=1733855525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MA0OIWYEx7lhE8KpQkBc+3xSlNCUl4o5/5suXDXfAEw=;
        b=exzalodJ3+4UvOvky5pv0KEAEC2BqruWTai0ibunjgHRPzg7OITLYowpyr/jAvQUdt
         9i/Qc/iB3GdPbXsXmXyepfPtoCQtsogpGiv2aIwkge3wUCTCNtL1v8ZfVg5uHntPCLl4
         n1cNtT2hT1ufMD4FvNUym+NQ8d0umRv/guiiHHdqumXxAtTJmpnLGft6+CCfoHLsLuon
         8gHabPQANiACfh3wMa7ohAikk8/7yM+J8GwXcEAK7uBR0B7PiG4gURXSyQdwVqXkueU1
         YKHMYZqOJuRdVdPz4w507PVnit0eXjBaQwiRutvfIRD36mq7sQC5BX9lQal/N5o7989V
         nINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250725; x=1733855525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA0OIWYEx7lhE8KpQkBc+3xSlNCUl4o5/5suXDXfAEw=;
        b=bb4bpGu0JOTWx+6e1bzgj4EnNeKNCAFz7+e/e9x1jQqvqsvN4wr4mWkwBO80K2TvXg
         U3TT6391Qc/i5yCDzb7Wsn/yttXEkUoue2bPiL5eTnRjOJH0t3JXMX4eSqru4jnKfHWk
         uU2jZgQECTGXpqU0gwJGkmPlP0Qm/37oCSF6IKsG0bT3hYVc3xtFGvGz15MuyEA0w+5m
         wGCZSRGlehniNkcHVWUO6zSxO+bGrRub7frt5cXQTIb4JLSun1yx3qdJNeoOKl6001kB
         0cfqsNUKL8eNPW0TRuCeSdcNg+oPdSfbKRC1Cx5QLwg/zWanR12TCYP2mMiO547FkuQB
         o4bg==
X-Forwarded-Encrypted: i=1; AJvYcCW/KjFTWNuMG1Is9yTJPIuw7Tuo3uvSqcxU9KlQktMFelMc7wGnIl3em6yGVciL6QGQC683JTLiKwR7ZSjW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwfhr4dZM5OBGUO9RQ32RliwZLSEnpkHp4eNCiilsuTeDID9pT
	0+YpYuF8XK5tccwgoKjEJVNcvf3KE7Ab0j8ebVrhdDhEWh4K9yzll+EzY+UkA5A=
X-Gm-Gg: ASbGncv/US/oWyQQx/6Op93A0q3g2EaCvyTbNSiH5arGT0A7CbYVQwkNWqK9RzuLso2
	Wgz9dRxD/QdamCOg0TJnwu6MwmkJk3TORpXwyTRagt3NsLcDfzKP250KxyAyKiSoQZYZjdyv8s4
	+pS8JQdfIzbJrVgTjwjLQHlDOKDj3PuQV/63Jfb2ABAluj39iuLWZm6TMiV8monB7HBcWwA/ljx
	vOK+bWpZ4x+2A5ZVEGlOVCP2+eGRkeLDK+2JgUQEI/ec41u8+mBN/UKslsqFg==
X-Google-Smtp-Source: AGHT+IHf+LjEeT/CgO0kZ2nnAkyl6mj5vAV7M9tzUOSZ6upVeF6Bbz1t4dAO1PkPUN1PMAflp/yrXQ==
X-Received: by 2002:a5d:6483:0:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-385fd378ddamr3163149f8f.0.1733250725408;
        Tue, 03 Dec 2024 10:32:05 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:41ad:5703:2486:8f59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ee2c7559sm7964163f8f.12.2024.12.03.10.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:32:05 -0800 (PST)
Date: Tue, 3 Dec 2024 19:32:01 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/9] crypto: qce - shrink code with devres clk helpers
Message-ID: <Z09OX3vnMC8bB6LG@linaro.org>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-4-c5901d2dd45c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-crypto-qce-refactor-v1-4-c5901d2dd45c@linaro.org>

On Tue, Dec 03, 2024 at 10:19:32AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use devm_clk_get_optional_enabled() to avoid having to enable the clocks
> separately as well as putting the clocks in error path and the remove()
> callback.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

FWIW: Ideally, the driver shouldn't keep on the clock all the time in
the first place, since this will prevent reaching deeper low power
states. So while this cleanup is nice, I think it will have to be
reverted again once someone fixes that.

If you're working on refactoring this rarely cared for driver, is there
any chance you could add some form of runtime PM while you're at it? :-)

Thanks,
Stephan

