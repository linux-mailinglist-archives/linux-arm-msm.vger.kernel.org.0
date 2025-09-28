Return-Path: <linux-arm-msm+bounces-75397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0EBA6817
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 07:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E98E1899FE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 05:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5A296BC4;
	Sun, 28 Sep 2025 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhqbWGta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490228C864
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759035717; cv=none; b=TKCg/TsTVGQPQaN/TPriiXpBPT2y0cTYnwE2t35GYkgycYNTqOpJQYxDF2NRj1FkwqVYY62gVqrmt+m2UiJX/jcvOtuYNEFy9GdviEnioA9RRnvZVUPPMk2IiesAf+FLf2F/m3+LmEMCN5LrJtT4lPpPasEJKQYQ5rDBH8dDB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759035717; c=relaxed/simple;
	bh=2KAdNtvOHAv0iPsSzF6JnRSyf3a/6LV1XFGg4SXH3dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVT/AHK5bF73KLUqWly03mOOKt8bIpuNnNCqx93v8/yss/ymx6OeL/f7ZKmSg1ZCzLHk6GthgAVu8J0bepOldhF/nKww5FGyprazIIaFk3377GsIZL1lLpETovSjmWMYPQ0koepR2LmbYVEVGzlKPCZtO2/rLeSKEJW0OAngTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhqbWGta; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b57bf560703so2604923a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 22:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759035715; x=1759640515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0U89y2eMhj2iLIuruto3nVeAxA529zvX5Wm2O/HQL8Y=;
        b=ZhqbWGtaxUckOZSo4F4tbV5mdHQNP93rvyc5CDtQc828TQYK1P/Fu6cwRu2T6IgQHj
         1HRdfX7ogs82Z3WcwJeu64ibnmZb55Ls6GmwoIxNdQd9v1UmLxWCeCI+F4f81Fcm5XIQ
         RB2T74MK8Junbjh4pJQ0tXhAFAGsEQ6U5FzGxiVVtS2wZ51i0lhVWEKNpd2g6IAuzyTu
         EF7mUtmjeE8FbLpL+3OLTc3/Bzon/GuG+GViechN1RvOVvX7rhnAQGOEePa1KWez07CT
         60itKa29/s6bevw60s3zK3n+a0+c4xc0xe9QP8YGbRdQDZtxgrM+tMrvpeFI6vKwt+BP
         sDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759035715; x=1759640515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U89y2eMhj2iLIuruto3nVeAxA529zvX5Wm2O/HQL8Y=;
        b=JHtnNp/az2j2PAJVJ3kTEycuHCu0APe57aIQ6LWwjycBgzWaKkGl90Ff5aFw+5rGcn
         AyP9LLB8FNc5n4KZdnLmZKOQ9IV1Dfx/oCChiKuxOIqwuJpmcYs6U4UOC6fcEaRrfUSq
         wu2ye2gXDmzLbWfVgt6mZiCYfzwuSG2BJco+fjWZYIdCKaWP9F9SPB8ZuFBxehKwyTFs
         jHUPehpQ/kIT75hENaN1RNlx/780nwZz2wLIxrb2+skNQy4fKuYRxOjxkLdv1szOy8t9
         Ypj5WGIKEBE6Kzenv4EhJCruiq7iuwkQL2IR170aA1+Cuzv7bsY4WKEdT6TRQg0dzXcR
         +DiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9pwaaMUXTByTIAkRUtv8hdQORpIRNRIiGaHdVamyc0QE7cM+fbH1+wVR81HxoM14LN6IcUaoj2GH8Wgy5@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9OBzz+Dq4C8D7MiS2yDPAI86MhBS+on1BX5D6d4EA5IQjkf+
	yl0AxU6NNFSo4CCndIIDLiAciZRlm0Q/7fIG6baEaLQge4VafhAoBWJh
X-Gm-Gg: ASbGncvhQYNI/GpYFaUEN9lD4UbAuCvXF2mmPwuB42e8x6e8aI6AUoKAcgTmH6q1tmQ
	h7zz/9jz5cLFmXzWpQ/tcmizzikXRnC3BIXClLk3iwOponTewIoQFqrrCWBFdLX88FvdfPaHQ3W
	ReLk88yEVzCRdAdzZEjZvviSXStOhD+v2tmc2LzWCC/qmxnnCKjCI4hDo4Eb562g7ukTj8b9bA5
	/o+0/4qkEwocJLYCkFCGe+hJKCMnAqBCLKNLqeG/GVa6AcSiXJ3UpWXuZXU/V8UY2zeKQu7dHbz
	fL15TwkRWeKTC7+JRQ75ErjtbnoIyqxGJ2imtwwbCrDtKyvqI+ltYQ3nsTy0dfIWyxsX/bxDGsf
	aGHAtxLIk4yvhtYKSpCUsMRJXcR9FTF8YH1TGgtCIYu1G20mtvrKNcyD9G+KfAD5z4XtxkJiPGw
	U2RkHYZYsG
X-Google-Smtp-Source: AGHT+IF4gSMaafr65leHEt79++HLMxBmNFlxKbU0qyU/KcJdtn6/e0eUVQSCjElsKiida6VyLQveJA==
X-Received: by 2002:a17:902:d2c1:b0:269:96db:94f with SMTP id d9443c01a7336-27ed4ac8880mr159569835ad.49.1759035715125;
        Sat, 27 Sep 2025 22:01:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:22dc:7b49:8c5d:38f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43ecsm96573425ad.24.2025.09.27.22.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 22:01:54 -0700 (PDT)
Date: Sat, 27 Sep 2025 22:01:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: input: Add Awinic AW86927
Message-ID: <rudd5cgaft43bjllspx3cb7wmcqe35cirtwfuf4b3kcntpxjad@4un73z7omcwc>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-1-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-aw86927-v3-1-1fc6265b42de@fairphone.com>

On Thu, Sep 25, 2025 at 12:07:28PM +0200, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86927 haptic chip which can be found in
> smartphones.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Applied, thank you.

-- 
Dmitry

