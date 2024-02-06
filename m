Return-Path: <linux-arm-msm+bounces-9909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF484AEF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 08:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1409E1C22175
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 07:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE0D128823;
	Tue,  6 Feb 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQhlF9rb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7F128817
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707204471; cv=none; b=jLH1oniwksa0/DdbBjhHam4/aI5NWR26p9baKqWk6xfj9aEDlKOz5MqeBOAkSoy/atRi9m4Q9bv1Lhf/8vMt3NxdYbe2Ni6yclZ8Oqsgwcr9dPYp9qLzNRrABIC4ZgkyWSHTWtidsMvTJVHV0vK7I6ZaF9J3v460gR4a3G7rgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707204471; c=relaxed/simple;
	bh=Ss7J0Z4qBBv7P0Lq6wAPMJCCSx/flMtJa2Y0ZIXvQHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYIEQy92pjrPpPoe8xuL2wLEZ1mNqFtlC1jcueHRp80nB1iusk3C4nvjjNkD+93I5FZbbQDQydQzw42iUACRsnlw4pSC3dj2/Gduchf63c+jIEdIJ3fHsl7bv+NzV8jT/Y3DlpvfFiuB5IUNH0JCXb04x35pqC4JUyzDQF4qvm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQhlF9rb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60406f4e1d0so46322337b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 23:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707204468; x=1707809268; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
        b=xQhlF9rb6Gi5cHsX4CTSoAIg3n8x4vJOkdnlYBWtuRsF1CPNSR3whD4HCzY6cI/Esg
         w1Mc4Y1BrfsT+7V5AS168KmLdfmZ7HOTuruZ1E241T1n2tB/T6I663viDro4pcgltETJ
         6sDuOZRb7V5q7pHrvyRynoaqaDjjU1DOWdqsrycrkjZ097T4tT1VLIM5zuKakbvl+r/h
         yryWnj9VBVcdN2eBjT0889lKhYWHUnlcU6GPSlPUfTI+i4BJOkVTwPiGV8QumAkcaFLS
         pV1vJ52DGVcoP4gZPwgwUXVjt9Er2q6OVSrj8rDZZMlt/yYDZnVeffFIPDjlB0QtOVSj
         ik/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707204468; x=1707809268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
        b=Q/tA2tq20zKB8d7QK7tWpGkl6ThtekSqQRCIvxMxNraFaCSwbU4E/b8I37QeDExdPP
         bZU6rPjkHl4Ph1bhe9cUEyGryVZcMCuFLsAQeRn9j0xp7kYU4peFKpcY2Pz+kuYfs+4u
         44f9oxw7uQ6it3+khmJR4FCE3v/KcSBJ4+bZEBpV4UwIuQvq+U6xTyDEaygBrNE94fBQ
         9RL/3HTwNOHyspxGE0qtED7aq9rx6kjCzM21HL7Lp1t52NwPZgWK1WIVN2d/s0zO8v37
         uyMlLo9p1mytDovaw+zNwbA6/nn+W4lypwOelbOnOC8QE3xkD3XuEac2y451lQNEnpzU
         5efg==
X-Gm-Message-State: AOJu0YwiILAbtbooHqOViq07jNfNcc0ZhdwdMlo+AstpaK6S61icqVpN
	QPeRs0LUnFtY9dlVyQ5CF2ZlAeseYGdCFpLhXZ8kamZR1EjyQiLJm0gMFEUYzcLOXF+WiBGIALN
	gf9y4ldvQVt2/eSgAR8rpAZ5qTJDRw1GnVE7rFA==
X-Google-Smtp-Source: AGHT+IH5aZFBCbzPwOkfK/V7Pv0OlQXEJvQKSmrj7XFq6d9dhv5vj1J+OWKWV2kMYRxJQhWB7mB5XJ9vuezs7xZplJc=
X-Received: by 2002:a81:f90f:0:b0:604:ea3:6525 with SMTP id
 x15-20020a81f90f000000b006040ea36525mr737126ywm.0.1707204468304; Mon, 05 Feb
 2024 23:27:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121194221.13513-1-a39.skl@gmail.com> <20240121194221.13513-4-a39.skl@gmail.com>
 <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
In-Reply-To: <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 09:27:37 +0200
Message-ID: <CAA8EJpo=mpEvSs_wSwZeAPvLErjkSkcMqkWHch0LC4KnuLp_eA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 10:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/01/2024 20:41, Adam Skladowski wrote:
> > During conversion 28nm-hpm-fam-b compat got lost, add it.
>
> Please add Fixes tag and put this commit as first in your patchset or
> even as separate one.

Fixes: f7d46c5efee2 ("dt-bindings: display/msm: split qcom, mdss bindings")

Krzysztof, if that was the only issue, could you please ack this
patch, I can then merge it


-- 
With best wishes
Dmitry

