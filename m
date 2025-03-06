Return-Path: <linux-arm-msm+bounces-50572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D497DA557E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 21:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 228F77AB7DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 20:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED18620767A;
	Thu,  6 Mar 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APHTg84B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DEE206F2C;
	Thu,  6 Mar 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741294385; cv=none; b=ZxpStSxfeAkcy1fK3219ACfkJmiajYdHRl5b/M0ZvyPDXU0dwMuqChiX9jVwB2UV9L7hX+XqaAq8IZufD3ajEJ9AL0Qw7vH2nOTRtO3yqnHDDpEjft8xXZIYH1f14E94f+L3oVVdnw0IfHtU/AmZahKtot/XrwH2EQRAcPxm1DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741294385; c=relaxed/simple;
	bh=8EIWBk4tJ9DcjCef0B68zkL4TVv6vr+br//UXXBebTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liu1w5kWT1SJwFQplTAi5ACz+5dvTIIlDbwOK/1zS4+lTblFDtx02rAZBEw6V1vkRNnYSq7DIeS7ViseskotZ05o2cJ1+qyWvBuhyPGDG+1FWymvCCQIYcvii0Q3tgZkjPhMbleETxlL33l4zysyu6sigRf5g+T1vbZSyte2Yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APHTg84B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AECC4CEEA;
	Thu,  6 Mar 2025 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741294385;
	bh=8EIWBk4tJ9DcjCef0B68zkL4TVv6vr+br//UXXBebTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=APHTg84BNm+76XY0dyuzNBRx0u2sI1vm9wZIimm8V+cO2XEMAFRCfxCu+rEO2L3Qm
	 mvpTBYdCn5GL1Q15EXkthJHdqWucSw4lV8/Alyz95gHWUuhBP5PPYOM8Rxmd3zTluV
	 iQQmQVYMnDpNwNd34gUe4crgyVg2eDmkaLN0kzuD4knRY2Tk0sufBhQ/WWdawKz+5G
	 siXCIETkPU2Niu9CxAUhI52Vjzm6GB8d4XmAWALexEOg9vBVIrOEBsmEkfc6m8yTpU
	 WQVsx3rHzd84XzYN+6FTkOkzKFdCyyXDl0bcABZClPvuCxsEnyIH3UlwGTQFkqPxdd
	 3AyN8e1offIsw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf5f4e82caso223353866b.1;
        Thu, 06 Mar 2025 12:53:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqgQN3Ftml2CbmA/+YQzlZn5VCkrRXkJMPbGJZ7YTRF3GYvv/d5OUNzCBN9G1CLtrkqIfOvo7qxCzX@vger.kernel.org, AJvYcCWgLY8TocmDzxfzZh0nlfUyRVrSYbEJAoYWA6zER37k88hxZR/2mq+9C4llxyiZ5T43YsG6CpLklvB8Q6qJGVpAFe4=@vger.kernel.org, AJvYcCWgjeurzHOvlYodARvwUIzqjRyM0GAGwKJprYEe6062ZUvAw6ezZBnWsXBP1UGZJZbvNkrbrcYZ9HRpbLysjQ==@vger.kernel.org, AJvYcCX430SHTxLZLjgO4xOmFdufqAjrRTIOScklSjfPZca7/lt21OakRs7jlARvAluxcV3leRwYyP5iIdpJkJlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OgGEyHrjQCM+CWc2Tufn5sRF1UpxDh5Q4eRgb5hxWKrhlyR4
	msZZ0B0EVnaskQZ8jPtQVLxca24Ttdr2UY0xePjO6e19MedfZ2Fnsyp343UgDMB8ZDb2qrw3YwR
	gN5zi8+BX3mOAekqbKIMa+Iv0Hg==
X-Google-Smtp-Source: AGHT+IH5psFXwVKCyxrdJBjvpX6e1H0zocq3/4I54Esgc8tc7oSOEtw6YqwbDn8nqXPQKSRVO+jSPulH7nXNnGe2JD4=
X-Received: by 2002:a17:907:710f:b0:abf:70af:f33a with SMTP id
 a640c23a62f3a-ac252a88a07mr42095366b.21.1741294384101; Thu, 06 Mar 2025
 12:53:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
 <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com> <ab483a68-40a8-4b44-ad73-d8a34bd32c69@kernel.org>
In-Reply-To: <ab483a68-40a8-4b44-ad73-d8a34bd32c69@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 14:52:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+95KW-JwA_OZsqQ9htirBUtBE9reJpa5fzeZ8iwYBeOQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpdgrHGl-0Gb__H6h9xuDppF_MhNrX5FMmy6vVAVzcGGn2TGfrvWYVxLpM
Message-ID: <CAL_Jsq+95KW-JwA_OZsqQ9htirBUtBE9reJpa5fzeZ8iwYBeOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom:
 Enforce child props
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 7:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/03/2025 14:39, Rob Herring wrote:
> > Why do we need this? Any child node should have a schema which needs
> > to include mc-peripheral-props.yaml if any properties from it can be
> > used.
>
> From correctness point of view, you are right, we don't need it. However:
>
> 1. Convention was so far to have in every controller. I think this also
> is easier to understand whenever one reads the bindings - clear
> documentation what children on this bus should look like.
>
> 2. To clearly document from where samsung,srom-timing comes in the
> required block:

I could be wrong, but I want to say that's pretty much an exception.
They are usually optional (other than reg). Though I guess we want to
enforce 'reg'...

> https://web.git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/D=
ocumentation/devicetree/bindings/memory-controllers/exynos-srom.yaml?h=3Ddt=
/next#n50
> Otherwise for me it is a bit confusing to require a property which is
> nowhere here defined.

It's a bit weird that non-exynos properties are allowed too, though
that's always the case for these properties.

I'll apply these.

Rob

