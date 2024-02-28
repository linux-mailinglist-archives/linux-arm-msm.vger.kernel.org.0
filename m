Return-Path: <linux-arm-msm+bounces-12923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4286BAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 23:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F061F27171
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 22:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53E3224C9;
	Wed, 28 Feb 2024 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RUTlwA0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1A1361D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 22:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709159561; cv=none; b=mvKZdhTHtTq8aWQAW4OW8T/IgwTne1SGxtVdlWpq1Gwl0pAwVMYrhhdR6A17ykFn6OE2rLlEdodrBlOoylvvjQjTh7KstH7JeQ6/DSqKsso9IU3LDfrHNKKxk1TJMgIovgC4q8QqxEWVpw0LHtZ8cOsz4BaW9i7gSNyNTRmKw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709159561; c=relaxed/simple;
	bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLdAorv7XWJ/VoPNEAgO/QWaOEeIntLg2S0eaP+AUrk3zrPP2MP/tw0jgqGolVuiunklsArNUF40Q5Ag+gxjkwjQgXgLYarOWcLx5RB1Zwc3yRV/0jSemO1+PScjYzimnkBAZGH52ehagqi/aNXWBR5zQ5lRhHe31PT6sUAcerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RUTlwA0I; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513235b5975so224597e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 14:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709159558; x=1709764358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
        b=RUTlwA0IfW78KD00US+ORH6BXLt7WBfSfAZD1XMlHm4BUkiLdcmATDYJy9WH+dwmYY
         0RXUSVZ4HlWqbUUGCtpMTY3uuCqRLHV3qvdy88nbtqVilSl5pCT/X73T+MxyRUypc0cC
         KuYzfEdbII0SOft4FjrtTmyV6sGVsqtmmA+u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709159558; x=1709764358;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
        b=h51+TZGC95IWq/V4A/pS+Ue7gWgzYWOvyRduzZjf4cmv+XtuJgEdGC8TX3D3qEYTDz
         3xsTrxxob3Tc+wg0W2CiAk8b+vN8bHOh1VaQNgOjJcOIcPdWq4jbhcmOe2Ujz49H6zRy
         IddEE5e6gmKxz7xA06asFYoDU90r+Wvh3crCS2NjfLGvdUrB4S5efe6gydik2rB3KXg7
         U6oXk7ba56kcev9muhx4r6diOz1OM7wbw606UGCgGKrI+GGX27Gt5aMEoAAnMzLiUmj2
         mWHelS35lWWALAFLUO7ZWUQZ59RrpAn16N91k1snlaWTpO9MLYEDcU1yfbincEAaWnzE
         XvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXddW16Eo8bcgiyfFEAMkdL6L8Mxq9POFA6Eo0gTG6fmUVofytzcauX+nfrqMxbCeSdZSxQ+liDaGECyMxUQD5Oj1iASfoT83o3g9kwAQ==
X-Gm-Message-State: AOJu0YzD5RojuTPj+sgn1PASeqk8j2tUWNGcA7+C37UZGpEjD9o9hAvD
	e7OXqlRMaAnmCB7aEKtNRrrJSmZc+OglMsnuZoqPhio0G9SdbKWh5dzINQSJKDkaDpWhCXu2wOX
	83oj4e8b+PF3EIWJBGGjFciPMy744A0tdn1tO
X-Google-Smtp-Source: AGHT+IF8m5eUpgTa0zbHHmuuse1uPPlb5cH3BKyK6w6U3t5iw9hTZuDz5U5AYc4RAvuOLPpkAFPsDX9RoXeg8idDs9k=
X-Received: by 2002:ac2:544f:0:b0:512:b3ef:350f with SMTP id
 d15-20020ac2544f000000b00512b3ef350fmr151977lfn.49.1709159558498; Wed, 28 Feb
 2024 14:32:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Feb 2024 14:32:37 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
References: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 28 Feb 2024 14:32:37 -0800
Message-ID: <CAE-0n522_pS0ructcKgbNY6gNpfn=s+83ha94N7A16adq0OoRg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
	Sean Paul <sean@poorly.run>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-02-26 14:34:45)
> The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
> doesn't care about the return value. Potentially this can lead to
> unclocked access if for some reason resuming of the DP controller fails.
>
> Change the function to use pm_runtime_resume_and_get() and return an
> error if resume fails.
>
> Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

