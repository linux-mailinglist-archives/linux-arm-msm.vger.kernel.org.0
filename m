Return-Path: <linux-arm-msm+bounces-19923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BF8C718B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 08:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8DC1F234CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 06:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C78F286A8;
	Thu, 16 May 2024 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i81RDg9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525E25765
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2024 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715839340; cv=none; b=cQJuv2kMKJ+rTmtM4lOjoODycsf9IPENS1vdj1n6P1ejV8uw6Qjz65CqxolgID0Dj8iit4yBLznOxYEEKoL3Sd42JKGIqAQg52cev4fNmPhlkY77PR7bcUcr0JBsB+BhYgSrxtbEzEyW8rPIJBkQKPGu6o8Sn3JemTblijsGbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715839340; c=relaxed/simple;
	bh=fMxF2StVs/M/aaHNKTnKzRqFLg6CcU30ETa1Rv+cqko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmNj7bwSbr23Zehg7V+g/u3J1sVkppHUefB7VgrCUdXX+MSVdq3Sn1u1P+uMxS3s3QYICfjRDpjRgPoxx7E1veOjm0Oda7n0469mWHsOc59zocq8ZXUlUNRoJY8EgheZAUuB8yysqaYnl74dIKcQ1CDB6G/7t1b0pNjzUUO7/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i81RDg9O; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6114c9b4d83so69531047b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715839336; x=1716444136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fMxF2StVs/M/aaHNKTnKzRqFLg6CcU30ETa1Rv+cqko=;
        b=i81RDg9OTTrg7eIrBpaSUCZiDOcu38wt8Zv1o+2K+ZMatMToc6xffHXt18uJxr6qMJ
         p1QXhloacffi41FpwHKM4DVn369p9/+c9F/6UsIClNGFL03EFcsGDYi3EmhVHqJwZVTf
         IXXtH5h/39DQ3JYECUmwYl/iEUokAb7S4B0JwpyqbJTCQsmNyfw9iNQWQEpdntJO04eI
         pzF5O0EADRR7x0byW7tx+I49uzPjepNcNuQSkAv3h+9sFE1tqSEXdPoD3KW1q2srkEsa
         YjxVMX+2C6msc5bTvo6LM/ewIKDc/q9JzMWsZ4mNzY0q7zMvHF7xoFzCLxiATNZuwiF9
         tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715839336; x=1716444136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMxF2StVs/M/aaHNKTnKzRqFLg6CcU30ETa1Rv+cqko=;
        b=rMkP1W7kxjo3uCVXamT+DF9UU+YQeuyFw2dTC/j5yWmKQDK4MrWjJt39zOeO5UvyLM
         ZyhVZxxrQcvdhuvUF8f+HrEhJeDBFOBL7DbM45EqnS8X66Osp5xJmvlRdk3g7oggSfty
         K/GUCbSgqihIhh+36axd9+/76CT7iW7E3mjrbbFfPDEWQHeaiGJKAPu9W007BiW9XYEb
         dY6S0RrrgOmje6sYV77Ea/6V3WAz6D6Ng14kmMmwsJtjEUn0MGYAt7twVHrqT6lcsQhZ
         k/PDZMH0fXm4vqqVVZk9h4iyugQPjSwjQNvQ2M/b9lygZxuZIbunBccgagXbJb3f1uUm
         TKcA==
X-Forwarded-Encrypted: i=1; AJvYcCV8tdBRjCjPgyvKbZq+5ZRrTM5gFBJoRwQmmpNKFDEcbgDEX4+Pv9IPLI6qChIaRQJej8OdTaH8jVg5dO6qCnPQz4LP3uBhU3ms//Ld8g==
X-Gm-Message-State: AOJu0YyPiW/5o3uzgeXZz/3z4xGoSlBmdysLLn2SD45shg/N4caP95MP
	YYezh08TUtnc0g6QUdtcY/iBoMcdKQxgIzdDKi9gh9C+mtAxxuLPhq5VLcTJRtWM5epVKQ9wQtF
	Aa/DNauBtHx0NAQ3WNHPzrVyaKTgndBLspCOwHQ==
X-Google-Smtp-Source: AGHT+IHQRhJ5WdipOlFEPTE2IXtjwpxOJIa3F6UInY4NKv3hR6EY4LO3bbTRgZIjq/P9G1VVfPyvex/Mx0Vhj/yz1NA=
X-Received: by 2002:a25:f505:0:b0:de6:d0a:ee3d with SMTP id
 3f1490d57ef6-dee4f1b7a13mr16047733276.30.1715839336505; Wed, 15 May 2024
 23:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515105446.3944629-1-sumit.garg@linaro.org>
 <20240515105446.3944629-2-sumit.garg@linaro.org> <131345e4-7920-428c-85c8-0fc4f56ca84e@linaro.org>
In-Reply-To: <131345e4-7920-428c-85c8-0fc4f56ca84e@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 16 May 2024 11:32:05 +0530
Message-ID: <CAFA6WYO1r5VydNo3VkdQY4yrC9ppL3-ou15i=GOgaQtVvSw0bQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, stephan@gerhold.net, 
	caleb.connolly@linaro.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@linaro.org, laetitia.mariottini@se.com, 
	pascal.eberhard@se.com, abdou.saker@se.com, jimmy.lalande@se.com, 
	benjamin.missey@non.se.com, daniel.thompson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 15 May 2024 at 20:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/05/2024 12:54, Sumit Garg wrote:
> > Add vendor prefix for Schneider Electric (https://www.se.com/).
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
>
> Please do not resend regular patches during merge window. Nothing can
> happen now, no one will pick it up, so probably you will need another
> resend later. This just creates really unnecessary traffic on the
> mailing lists.

You are right. I suppose the reason for my hurry is not to miss the
next v6.11 release cycle as the v6.10 release cycle has already passed
for this patchset to be picked up. It has nearly been 6 weeks since
the original v5 patch-set [1] was posted and not being picked up even
after it has gone through extensive review. I am really failing to
understand the missing pieces or any unaddressed feedback to get this
accepted.

However, as you have suggested I will resend again after the merge
window closes.

[1] https://lore.kernel.org/lkml/20240403043416.3800259-1-sumit.garg@linaro.org/

-Sumit

