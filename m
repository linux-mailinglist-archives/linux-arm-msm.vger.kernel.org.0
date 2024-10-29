Return-Path: <linux-arm-msm+bounces-36313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE959B4BCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 15:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17CA6B234E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D5205AC8;
	Tue, 29 Oct 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWfQ0lW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5EBA2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730211187; cv=none; b=pl93h2pKp4zE7qxFfPeiuWtoTbeHYHMoEJcH93ozvfaG+Y10QfsQALPuXULLfSVHMqf2wnEGCmkTl8ZluofxluAYZuQmASqU77r8q2v6eGvD7p2x6lk6MChTWveZODqz4oPIfiQrZYhRdkLNklXmXgDxwdFapsKiSF/cCLGEnvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730211187; c=relaxed/simple;
	bh=Bqihna99fenpFeOmgXH1QJLNkTsFulIXzRcXJmFgxos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=nE4xIbl00+M/vHkdRLMKVpALKO16C7yc5wv1w34vC+s/9JGSbih30zynWIk+YmlCs+6zxgh/WbbVAVXw8MIqrLhMXByojvavOrpLxJrfBA/NECmAtBN/I4SB+D3638Fccjuugardb7PJjfswg9hmRrv8E2DgyxBRe+VBYRqpkKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWfQ0lW0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso843603166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730211184; x=1730815984; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff17/3yUZQSNdylITuQ91MuR8nLBz/dN5pqDQlSIlPE=;
        b=RWfQ0lW0+1gDxC6UNlEN2NQhxixGmdAYBz32xFA+kWG3DssQtRjTky+TYlSLpn9O+T
         2uf/cy6Z7cJqbvdOL5QsJ6KFqiThpWymuX4L4BPmwMt/Qqn2Tp4ek9O0Dm+1qK83YAZV
         Tl6hEMdWmiTVlpxUPp3dp/W9Uz6uR/s3vO7SzmD81pHdJwwJKznLFCijCqiLAIoEJfET
         9e8yNeOh5bxtVW30L4UnF7J5wwd0GmeTn1x3cVYMHxRIsDj+USMiqFjsx6NR24+DT48a
         PL6Ff2lCJEJ7ScykAeWEg3FWPBj+37yk5PDeL1EEIjV0hPixfZE1CqikQ4uW/JWqFbC0
         v9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211184; x=1730815984;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ff17/3yUZQSNdylITuQ91MuR8nLBz/dN5pqDQlSIlPE=;
        b=nIMAq0tEYv71g0wT+7YNv3ynIh+4SMO1NuulOuB4Z0XoJIBrCz6WIeK4X4xE9T6vwb
         VwsmiSQfD0VTM98heKmtAKZecAVQA1EVEOez4gKuiTGOXSe9OWkD5FHHGZ1HVQAu63No
         p0XSP04dQ/qP4ypDLfiUhfkU7pdvg7uGbdP4W0KQgoNlGWO+dmooWHOu40TuPGhZDTlT
         idASwioJhwr84KUHcO0hZdAK+PfCiBWwJd6/WYX2FsxsfRoq4QCwswP3+aqnjNoAoRkx
         VmPzl1uEdkbNOYREU2xO/pHMhAbZJCa4qQliEjeCTiWVJhlHWdL5y6V2G+Sz0aZqG5YE
         LTrA==
X-Forwarded-Encrypted: i=1; AJvYcCUYlptP2TT7yXU7u5GSU88q5jPr2Xuk2b8CfNZmSlt8m3KCACTGQcCgp0FCkAfRWREU8ujeRlBvj/ObJUHx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo8bEvqn0AGv/MhNKqbuLc+WD/Kyns8/hL3F/hmykow5uVqYjm
	UFl8bhJniern9KR9BrXGjXAjuoUYktyBTcHxqwQllAoUbkSuOQwtM+h5AR4mEL2S4Pos/hhKxtr
	9
X-Google-Smtp-Source: AGHT+IFp/WK21dDbVJv3OVZoj1vA8YpGFKUAfmyaWH4t+eUHl/1agrkKE59MZJrisSFo/P+AC+wmRA==
X-Received: by 2002:a17:907:3f23:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a9de5c9f5f9mr1123207066b.4.1730211183798;
        Tue, 29 Oct 2024 07:13:03 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099ddb9sm485330266b.173.2024.10.29.07.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 07:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 14:13:02 +0000
Message-Id: <D58COCB1S75S.3U1AVEA75STEU@linaro.org>
Subject: Re: [PATCH] um: Remove double zero check
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Shaojie Dong" <quic_shaojied@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241029-b4_branch-v1-1-edeabe23b355@quicinc.com>
In-Reply-To: <20241029-b4_branch-v1-1-edeabe23b355@quicinc.com>

On Tue Oct 29, 2024 at 12:29 PM GMT, Shaojie Dong wrote:
> free_pages() performs a parameter null check inside
> therefore remove double zero check here.
>
> Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>
> ---
>  arch/um/kernel/skas/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

It doesn't seem that linux-msm is the right destination for this change.
You can use scripts/get_maintainer.pl script to figure out where to send
a patch.

HTH.

Best regards,
Alexey


