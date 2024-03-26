Return-Path: <linux-arm-msm+bounces-15306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE588D056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 22:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D98F2E6F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A2E13D538;
	Tue, 26 Mar 2024 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qa1qfIcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A6F3A8D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711489979; cv=none; b=hF+aG2Msd32si9dJV24w67rN9j0nqEFTgNssHraHAElyhVFPUdpvuV1o05Kt2ieWihrSoGf4dJHOIJXPU1fhQ+/d3xQjF8+is/sQ14EqVYtRxznaGtJkuN3MO1Kogu8blv89IPTWO8OS6ANuYMft275LDyZX6UvngN9iZbdqx6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711489979; c=relaxed/simple;
	bh=Gd1KTyIORpHu4vSk6I3cEpHpWoYXH312uryFOO6D0Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDhqxB8n9nbcWXjkLlrp5eYLXTiPU51bNKUdZWpJtGVmDv0WCyorA6oxFG8yTDtBRic2q3jim9FcvG0Aaj6NmKTUVQqSeWcUx8TH/oo+zMBF8Zv2VB5DcceUOSr0b3/yBJsIPdXk+RcT/PtHPiKtwz3fbOsBa8CrhBNR+J4zltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qa1qfIcC; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61130dd21c1so39239837b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711489976; x=1712094776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
        b=qa1qfIcCb2xRJpEXEHvzJzWJQKdSC4a8psSfD1MsJfKFO7rZAM8+S9RXfMx8DAeT2C
         o/OlQcXTmBwqs0SPKy/SoyQqeyOzGhEiOpA0LzHsGIn8nRsjL9+w7JL9LDNajCsZ4udw
         hTH5hPab/frxPigvRBbV11PwB56d+EeFr3ogwLrzaYUapLO5J46IQqAMAKKuzyHWSpZX
         ms1Z6KQz2R1Javtc/O5ddSyyVc68SdwW+l6P+gI6X/dfvyb6YTMfntj04QsEk/CNGl0f
         qtJSKRbonw4Cdegb0T9wOes2UJy/cepdc0Wq1+PTo5WK6NM4tZa97pQWx/ve5aIbDs17
         3mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711489976; x=1712094776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
        b=tYW7NHHl/0S0KPW0KXOhR3D0s9N8R++3+EppXBH0Mf5PCvp386dEGz5878LC2tfc0+
         BRcu4vNLLFDBRVfpPFDaNiv4RdaOYhjRvOSotmk3dQchBC4Dlx23R5oENNBt9LAWT0Ls
         rhyHQIrUSl1nk2uxtGChSYqZWn8ELRgjj2e0pZ1MgHx/snSl2ywIV+Vwp1EW2fBQ2Fz3
         Wt3ZSB2tJy6wJ3QE13pLAn832pzM6ovJavRtCJLyk7OqOcedXi6QKV1gIvt9oPVtz55L
         XCZVqPeRR8V3pJHxd6mHoJLYDYkfccX8gcbCAaolTxZ2QCzNmt5YvMIm7z6QIKhkyVWV
         WtNw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGM8IWTdTYUXWv4dkGN0EcwnlwGPY+56OgkA4+XSzfwXNFuqBKY5fFNrnVogql3XSzy4+givtp+y5/Fwhq9GExnsrRyZMZb1bvMz68g==
X-Gm-Message-State: AOJu0YwWEoxML5UJi30tg00d9UGDSEAhyM5XefoAraTDvoeTYtyHQq31
	y0zLLavzYZzXhAn8NilI0eZ2BVH64t0KuJ1+TS/RefZDDrzNuc+xZmEImIcEWanXQ2vQl55UAEt
	MwSI6thayKKlpuMMSFoXMH9pTDd+4JCGORwlkGw==
X-Google-Smtp-Source: AGHT+IHwmwht+jbFfFX/AO7g6m6kcu9g5ldVuD/vPH3YDlyYIZOkuMHWGLBTx0aLMf5TKE4lY0jQzKUPbM8GlApUefw=
X-Received: by 2002:a25:10c1:0:b0:dcd:3d6:68ad with SMTP id
 184-20020a2510c1000000b00dcd03d668admr981590ybq.0.1711489976441; Tue, 26 Mar
 2024 14:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org> <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
In-Reply-To: <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 23:52:45 +0200
Message-ID: <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> > In order to stop patching the mdp5 headers, import definitions for the
> > writeback blocks. This part is extracted from the old Rob's patch.
> >
> > Co-developed-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
>
> This is unused today right?
>
> Is it just being migrated now in advance as all the mesa mdp5 headers
> are moving to kernel?
>

Exactly. I had three options: pick up this patch, implement applying
'fixup' patches or drop corresponding doffests from the mdp5.xml. I've
chosen the first option.


--
With best wishes
Dmitry

