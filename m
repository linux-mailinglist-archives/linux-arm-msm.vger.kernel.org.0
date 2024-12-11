Return-Path: <linux-arm-msm+bounces-41581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3309ED9BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A39B1617B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386271A83FA;
	Wed, 11 Dec 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N7wxCJg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17AB195
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956320; cv=none; b=Sumakeq6ZazrIw7xEyuzd2AJRGFkhCLdI5aiFJcSFHV4UmU8ZU1xrnQcqT2TmHOSoW94/8B34G/N4h/PXG/m+4qm/kZaczNHJ3bRAlc20yyDuZEk3t3EjDcFg2PC/bu3fkhT4j9+W4pOK1cUpx+0+5LEvmSozFltHmXczDnp2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956320; c=relaxed/simple;
	bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pS8kkLacsGUatyrwah/JF4zK5EYnbX5YICD798KFxkfblW6fxlDW/2Y8EylFi6SbR0867lnI61JEV05nnq+xTCu3jgeDmEXyxBc+djzQugWrsvRKVahguQsSeiM1Xt8LDaGc7XJZUKf8rqUhR/FUlawnLnFnmolOK9hei/b5xAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N7wxCJg9; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4676f1a43dfso11414331cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733956317; x=1734561117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
        b=N7wxCJg9A3sKkUOw68tbcdKVX+7OYPjOyxZj8DsBs20SA2HBFwFh3+ZXKmw9vNBfLa
         sWGyGzbIidavutlAOM++iTZLCPUW7Fd1mqzRylt1ulVq4JqqEgjOwskZKeE4UgmtRLtE
         Hd2+vVE7UIvQbtuTmZ8butYrRq6IcobIU/YF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733956317; x=1734561117;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
        b=ne7rsbX+1lsu8d50g2eTnXaUT2TyEPBSYlebk2GcN27TkbkhV7lZeon6JRrlMBbWkB
         LdgHHwiYjaSV5cpw4dEGnyxe8isDYF+JOl5UFCZXrRXfap4FIUyGLx9bJmSX1bIX6ai/
         8anRFnlahOicNVZCLR+45P8Sf9TPmkTPfIBG3YJzQ1Y+1tnJ0ere06+499DEYUGqNTK8
         mLGrs3PBZfVs8UQ5bEwYooYUwz6pvipyUpsjWKJdnK1BOODZSCIX1aJ65L/1zTaaNwV9
         Tv6S/cMMOmWIeN4lRnfg4h62VWXGs9BrfOmxshnKpZ9GtNLh+B6mzgXzIERlvLblxLci
         WWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlpJmLuu4R354WrIgUI9FQ9gOoetjrbDM0MgzsbY8XXhjM3ohgaw1mSU69wgoBb5C1uBrg6KY1Heuf04bO@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMyTTIR83rrvAMQH8bRt04SV4KcdoPpLHFWLcd4Bp/EwS7Wbj
	t31p4rOQ+Up2cGiyUSR5d6owvNtVUKZGYIj90GZEcFcBVRtlcwdTieLRBm+LxD4JzKxQCLtPrz5
	8z8CS1bRE3FIIuU6EFXUXdYTKQv7jb9CyxCsF
X-Gm-Gg: ASbGnctipxq/UMYEwedKuaFhnfpwgZ6ZRj/J/fh9KR3GqgCAjKo86T/Kfv1v6FbcE0C
	DWCVUVipvPhViorC5ZfJ0mlFOn+Nr8Khji9AWhM3Oilw7/Tc18Gnlou0ArglJ/ug=
X-Google-Smtp-Source: AGHT+IH0phbrtePElXJxDxj9HI12gSYY0Q06etMElvaeqdDYhA8EkdDjpS2cR8ruv8dvm22YKh6KLSLREA129gVkVUA=
X-Received: by 2002:ac8:7d95:0:b0:466:93b9:8356 with SMTP id
 d75a77b69052e-467968a1451mr15126531cf.22.1733956317709; Wed, 11 Dec 2024
 14:31:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:31:57 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:31:57 -0800
Message-ID: <CAE-0n50T1yJEhx+NbcoNbEZ6Q8Bx7asOHHx=bOY_uKNaQ-y8xQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:40)
> Drop obsolete functions to access audio packet headers. The dp_audio.c
> now writes them using msm_dp_write_link() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

