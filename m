Return-Path: <linux-arm-msm+bounces-12123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04885EF2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 03:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19CB51F218EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 02:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F71119A;
	Thu, 22 Feb 2024 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2CXJcCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F2C10A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 02:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708569406; cv=none; b=ToDBmsgqFk/JOJcClLEBlbbICKC641u8z/tZ9ELbK3TWVmNKrLWYtqbh97uqMy73vzRMWbRJRjBZgpx5OsXJMaaf6dBYx+uYfoGvOSujG3vRqpY4fkNIs5cSH5/KvU7098L1qfw1cKOH4BY24pJtMhwzyJOJ8r2Axq5vPLMxpoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708569406; c=relaxed/simple;
	bh=jrDvZP75nlca6goQDDYHAPFDkBIYbQJ+9fJB+VWeiPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taxi0U4xPu0XVHR2AW9v/+4wDWxUEm6lpFAO9LLjwrkTpuszw5LIE7mhiIKT8YVECD6wsqN6IcXV9HjHUKuXbIWh8jaxODZqSVRMV5wzXOX93QyCXD9doYTqGnWejXCPbxhZcME3zOU987aNAI/ObVhWt/9xAQVIhbbcumLUI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2CXJcCj; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6084e809788so3365747b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 18:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708569403; x=1709174203; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
        b=s2CXJcCjC6W+x6uP5vZ2mtK4X/BG6KdsfNTQVXfm6MK2dlbB8d9MWs/1FYQGnKRVQk
         fq0HEADHFoZDRiP5S6Aq1UI/uP4Pv+IX7449FmyWkxuaJAB2Mcjhl8truYAilcI7rAhM
         TS9/EJ01VrZDY02uay94O572mielraPXjEkHCNwmCA7+5v54vQagTrqixLcCsn3Drkn/
         Lbd6WbdqcA2M9yeh0G2hog9H+lnk76etaMNBcDHdjtB6pK2RHHHy4QEaY6MIZ8M3qB6O
         ub0aL79cRAblEmyjwU/B3zpeODViUh5gU7nzaQZ6nYIoE6w93MbqVknJZOFIjXypmQK4
         ATaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708569403; x=1709174203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
        b=sNH6TlbczbVLlPtANSySAMGeM7WheCYPlOubKOKJImm2DXGenEha210vrhWZ7c/EcX
         w7sC1kML8eQpBbanvJ5vdPUadeEsh/SHI83a1C0Ihcr6hzQzuW65Efz3K4twfw0gilGn
         I/aFCEiQjVredzybaV1VOv5zm2htf+sj/oB2PpSXfh3cCW6R9ssVgVr8CBVIEEa65evq
         w4WACJ+v83cpY4lg6Uo9SWeEu1LLsIQgoZAKZZUZlG9vPrN3LhTdIDRKya1MPn7X/sWF
         z2uHj/MMu3YUotpF06fWI3/RSgQNXVzAMawseGEW6k6yykm22QUQlS1qNK5SfycvuXJM
         8Djw==
X-Forwarded-Encrypted: i=1; AJvYcCUUJs0FfQ15jeFqwpLbtZ08BhXIhgVcr4t1YD8VPLdecRQ5uuTYdTqz4tMEdHrAZmsDNN3EzZTEgj1mqwxJlG5GmIdTR3IqbIMuTr56wQ==
X-Gm-Message-State: AOJu0YzZOGvSrxhnWX3uNQXprmmYHp3kWgGlRkIW/6dYU+l9cbTcmoA5
	cY1kxMPQvw7Mw4o8vsybPjYnPEzLOC3mHzuAQRgmv1wGU17486CzRyWdMpANXv1DkXo0Q95LaIb
	mrbWIbeTM4RbUi4VyeeMQ/h2CFWely7K5c73OsA==
X-Google-Smtp-Source: AGHT+IF6DtJIMjCodEyUY/qWcBvG/l4B5U7/74mJYMS7Q6XDQkr9ZX6fbumrpxwW4rEDcCk4U6VVw8CKa+BUHQDEgd4=
X-Received: by 2002:a81:844c:0:b0:608:93a7:3d8d with SMTP id
 u73-20020a81844c000000b0060893a73d8dmr611679ywf.25.1708569403647; Wed, 21 Feb
 2024 18:36:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org> <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
In-Reply-To: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 04:36:32 +0200
Message-ID: <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Helen Koike <helen.koike@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> >
> > - msm_submit@invalid-duplicate-bo-submit,Fail
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do you have a gitlab pipeline link I can check?

Before uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109455

After uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109501

-- 
With best wishes
Dmitry

