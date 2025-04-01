Return-Path: <linux-arm-msm+bounces-52952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888FA7783A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A42A16B3EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1451F09AC;
	Tue,  1 Apr 2025 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9iFLF69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A381F098F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501404; cv=none; b=Haeg7hw5p04TDXd5HpfLz9EQxv9oyvDLC4iQbOWZtxfGG6ZciCu6OpIuknbQ6pjchSApXEnRsvVsZkDzo2+ZKUA5FaInBvoz8K6xMHBq2sr4TMFRs69FmAuAANbeGsJqeby3PGpF0STRlnRjZhhM0or3JkvlqdyufxAfN/wjVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501404; c=relaxed/simple;
	bh=NjCaM6NPE+96VH652cAxZooTkjH4DOBiqaZ8Cqsk0U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uwp7223RnhfIQBXQ2C0E+vduNVIeGRnhZpDPJ0fFM3g5zqDHnzoDvSa6awPqQXy8JeTWlBeOuWjS0vqZo6A9IUkurtUpA50MUo+iBLdLXxSLXPMCarg8RkLxYqdagItkwAFApsz5RwEV4mDGxp/ltEB+gm+28f1zX4LzqIO7Jzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9iFLF69; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2295d78b45cso12989665ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501401; x=1744106201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=t9iFLF69cofGDXvp7z0LaZkykKW7esNExBN/KG1h+brUINyuB4lNGJHJBdWWQU8Kdo
         wQk1FfPrDvrJHVe9P2fA0jU5KLXCvP1WZflDU4Tphs6+dLTgt1qkrx1M/E2ftj6UkqJf
         cGblhz7hEOxbYBaU4F9Vdb4TUdIPY6XHOkIsOINy2hVsVTa3JceDGbc3lYPhyNjXw7X4
         s7sdJSkO/ig3TTAE13nArSq7hUxldDhkGbxTvg4354hw6e3z/c4LIYcZJ42+jqZC4LNa
         Jr/0oWzPMP9DZnGG42atPooaKHubp2iEyIYCeVdLaEdwNBkDeCp1SqvGRbLgBW0ZkTgJ
         FVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501401; x=1744106201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=Fq2BOq2tNHaRE10mMu9hRKb1k4LgcPE+1cTNhhubhrsEztdQfeNsaHDjOZ9Cq4Jicj
         3sc36f9ckTz/V0MybTgf4SCCdMlsCtTsonprE4Ge2J1itQXAt4puJspVI+YBQaF93B9d
         A0ATYbd8aJyaVSTPP0nuFEsCjagy38UyDGN4z2bpNCwlG1BFBHwuWr0iF3iD2B+Qw4y8
         KFAh8/MioYG2QpFgLxKqJWavTD0KhTZgMHlUnf8qxWBF1HkkntzaFnE9nw5zyqLH0jSF
         315B0BW4uqd1zg4VbeNrp9Bj3vkCYuSZWKjjjdixLlMWoUd1cvJmej4RRRqhbKK2rZMu
         wyrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX2CfjM0VyEy9qNzPeFUGXEBXsbHOgdv2y17hN/6VTXC0IPaG+tVR3zqMVvUJRC+HvSi5ehaxbsHgajJVt@vger.kernel.org
X-Gm-Message-State: AOJu0YxgGuX8rW8D2sguxz7nia1VYSOzIR2GaLXSufLqUp8lQIllumPI
	2Pi3KffHr9+yJIBdr9vGRGe/MoZUsYVv6hSoQPb8CIPappOLfWofJBAe28vpgL0qMfP5Z+AswSN
	p8+EbyTlsJyYDNVrlueUqyvnh1pxZvsZgqRCVJg==
X-Gm-Gg: ASbGncvy2bRQzwYIwOWq34fY/fhsFh0G6hvqcKplRYr8ikRpYaYPTUB2GPf8BdCkrDK
	FLtHG83UHl2v58Se2kHeZrjG7p8cyjjmZniGlo2bBsJUQIbkSKIfoGF0S5ybAx8xt9l0Brk9jI0
	/F+DhmOma65+aCABUjjyz0RcRifd4m4ixAWTmYSg==
X-Google-Smtp-Source: AGHT+IHEMnnnmcPGt6SPwgUcHIAgu4byClDUyMF2Ro6APnhVIeAiXBrYYkjDBhhJ0hxiN2KwSVdg1cBseMLltQ3nC1A=
X-Received: by 2002:a05:6a00:b49:b0:737:e73:f64b with SMTP id
 d2e1a72fcca58-73980339eb8mr15251487b3a.1.1743501401272; Tue, 01 Apr 2025
 02:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com> <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
In-Reply-To: <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 10:56:30 +0100
X-Gm-Features: AQ5f1Jou6RuMhYg-mjMPT8QE1MQ92d3liRY4RQMc92_C5x1ac1ut41GmRyDV0w0
Message-ID: <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/1/25 07:12, Jie Gan wrote:
> > The trace_id in coresight_path may contain an error number which means a
> > negative integer, but the current type of the trace_id is u8. Change the
> > type to int to fix it.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>
> LGTM
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>
> > ---
> >  include/linux/coresight.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index d79a242b271d..c2bf10c43e7c 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >   */
> >  struct coresight_path {
> >       struct list_head        path_list;
> > -     u8                      trace_id;
> > +     int                     trace_id;
> >  };
> >
> >  enum cs_mode {

There are many places in the Coresight drivers that assign a u8
traceid from the path trace ID.

e.g.
In coresight-etm4x-core.c : etm4_enable_perf()

drvdata->trcid = path->trace_id;

drvdata->trcid is defined as a u8  - the reason being trace IDs are
128 bits wide with some reserved values.

Will this not just trigger the same issue if path->trace_id is changed
to an int? Even if not it is inconsistent handling of the trace ID
values.

Trace ID errors should be handled by returning an invalid trace ID
value - were the trace ID value will fail the macro
IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
error return in a function.

Regards

Mike



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

