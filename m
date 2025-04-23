Return-Path: <linux-arm-msm+bounces-55030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E9A97E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94587179230
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 05:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E021A265624;
	Wed, 23 Apr 2025 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfn0ie8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BBD266593
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386570; cv=none; b=uRhgRYh8dlXAJjqp+DJErwrQnMHMchNkTlqtX4Uc0a7XlV1xqN0gczx9q+qnuK7RT6tYNdT8Ewf20iMuRaeYaHVbKd7A4EwJdRoN43whtXmXFmS458JQNm72d3BrnOSxt/1NEozjJUMzJ6nhzQKnWe8zD2Spimmd22FmRf7tiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386570; c=relaxed/simple;
	bh=znd3Gx+1i6NPOJ5fHPpMjC5QdTJie7kovH5k6mPOKO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwBZT/mCcfpr9iSDGefjGunL+8SRl26orUfuhDNpb7jIcmwnBBJ+P52g8oLfOT1aBHb5ibhs32SCoHokMolgA1AhoKzfkpBxyjogRIPCz282+RxZmSZvIlslNlUHhYFQ5oH4BL4SI+K6mQzgD3NYE0CfM+gaDpUO9nUURJhh3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfn0ie8l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5048373b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 22:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745386568; x=1745991368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqXZmhQqMpQ55WXDkvwtb6bzPG8ypT7T0jmt2s5ZCM4=;
        b=yfn0ie8l1kYua/HCnXdMB4UPmI749NcR0wtsumJFxdtMr9ul2cJXyy2NrmAIvbZBqz
         KG6dYBb3ySWWeVEbv3kdV6gNwEl7ynbZ2uZ1VIU/HjliuFsaG3Ci/0gNu4JaRaASuzck
         WHSqgSShz3DWLxdMlaDw5q7LVbSN8Irg20jqFCyADjw3a/frVe3aL0vhvYHcuWL+iWiE
         9TWtX/URv0O784ADQO0wD21sFD+Q3VaL2dj9x5ZWpmK5WMVMfQ2MwL3gVzfOcdqnGOMf
         WlayqPWJc+GbFVX4ebBY5Xm8y9hq7D0U7O73gEH+LiZg2xr2TRemVM67QzhZpgrRjAQb
         HMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745386568; x=1745991368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqXZmhQqMpQ55WXDkvwtb6bzPG8ypT7T0jmt2s5ZCM4=;
        b=uN3C5sji3Y7zhkqMN5BBst6tVfATPGqFQPxkNvK/h2Sfy937O7q1lXa6WK/Tn3V1P4
         l6wFP2UkDou5RtBVpK5ECo3nNjA0UgT3f2Wlx/15zq6O/U/MvJ8xdSgMcKmAGlOZfm1E
         yBWgXHjHhzHepJBaYk9T5zJaveTa5eILtyLaNExEg18SqiOy/B4/hxeT9ywPhRSTRs+s
         w57nJDK3Va0UZ7iG+A0FK9ZMfr4vCnXcsW0RQdJxs5bLC85nGg5fqKP4xCLaX32yw5ID
         hJg4l4kqscxxY23r7rWc4Q/r9xnrgPv6AOg/rgSHPqI+U1jG/qkVI0zRx1hZplnHicj/
         tOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhqO6R4ApOgv+fQUhgANG6++v1EMWJ7DmRpllVA6+LNTv9wKzirSUZPB9ojK86sjlQXXVtLMgWm3IB3U0p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tHt89XIpU+eMmFg7v7tkqrNBt1RQRIBNQTBQYpR9PJnsoMPq
	/sBKYmTv4nJX4SishaIJkGprKdYRYsz4/RbMQEt/M2S1dXZOMIH2BAB2GH9V7Xk=
X-Gm-Gg: ASbGncsRWSn5sVtxAScVlvgIdCORrC1fhTdAHbYyB6osLzK1ALWAr6wn8aL+9XE8zlb
	rVEZq9kuJ46n1lJykVbCFsYWj6jF0Gqh6c24C6YfKa9nH0fCHKZp7uPWRfpSqpgCjAru2K4kGeO
	XuUl4I+khICSrly4HDSauFf6HqzCcmdCt3DTq02i08H9zznC9V+XgSNLhEXFd57kCmOaFFQHPBl
	dbozzj33XEwMSYRUZHvb4jXVCeVMQrmzdB3KJ2OU7sZcYxt44B106cDiwwz0H6q4yP/n6yOHv7s
	CAYDqQiyQj9n3XwbkWs6Wc9QaYakK2XNCr+QAfp84A==
X-Google-Smtp-Source: AGHT+IGH5CEH3qbiKs7N8VcrCjZGvYVDP7IFgmEG+4RsZjJN0YJwU+Ch1jF6olLdlhwBTsOOZVjUQg==
X-Received: by 2002:a05:6a00:3928:b0:736:755b:8317 with SMTP id d2e1a72fcca58-73dc15d32b0mr25849726b3a.21.1745386568035;
        Tue, 22 Apr 2025 22:36:08 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8be876sm9697501b3a.36.2025.04.22.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:36:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:06:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 1/9] opp: add new helper API dev_pm_opp_set_level()
Message-ID: <20250423053605.63njjtz3s3krdeqb@vireshk-i7>
References: <20250418151235.27787-1-quic_ptalari@quicinc.com>
 <20250418151235.27787-2-quic_ptalari@quicinc.com>
 <20250421074004.yttb42qq4p5xzi3o@vireshk-i7>
 <e6e1ee6d-a12f-4e18-b2d7-65d1ccca5308@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6e1ee6d-a12f-4e18-b2d7-65d1ccca5308@quicinc.com>

On 22-04-25, 22:37, Praveen Talari wrote:
> most of helper APIs in core.c and even i don't see any helper API in
> pm_opp.c.

This is more of a wrapper over the existing C routines which is being
added to reduce some boilerplate code from drivers. And so it makes
sense to add this as an inline helper. May be there are others which
can be moved too.

> as reference of APIs in core.c, i have used  -EINVAl instead of IS_ERR(opp).

That would likely be wrong, maybe we should fix those too.

-- 
viresh

