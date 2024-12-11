Return-Path: <linux-arm-msm+bounces-41588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D59EDA6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F1D282E40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260D81F2383;
	Wed, 11 Dec 2024 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U+EA6ZcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5A1F2C25
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733957634; cv=none; b=c2I9ZIBU9zJnT2643856XqDkFAcN8MUnkfdGID2NehmvtQv9ya/VLAd6KBWMROhzl3QlvEv470X/Sd9SYt8+iEFm1XmPM/tLn41ShG1AyTusNsdyUOSp/JSxBE1pgRndqKXD6EE4I8zn7s0i6aNfNxXl3aifystZwpZDTb+xt9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733957634; c=relaxed/simple;
	bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apmqrBEnM75e0WbptcVG20oQJoBg3SBM2QJfvKenqliFpiRdZ2Nt7CC3aVonXhfxzT8o3cOH3PiF5fi08s9zktIMp7Z+yAZtn8YXxCY13HXkm/1rmqdbYdQn4ivautXS8BIRGeg8LfTrz7VJXiiEDR2Qi8tSXFErR9FSa+azToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U+EA6ZcJ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d842280932so98675496d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733957630; x=1734562430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
        b=U+EA6ZcJcegLMz/W/bRSHMX7M8MFIrPs4Fe9V1VxvN0/LYPo6V+YP4PuNUN7ViRjUG
         HyPwYUJVBKHbxUOXcrDPI9LFcmuix+1hf4D2lTzgt8vUgTzGEExR5jdOTXfUxyXTzKxK
         RHllCm0db1iMLvqX/OzIb6Be8KrXE0a4e31Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733957630; x=1734562430;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
        b=GDLlCRRIL+oFcLTNqg7L85hXQi4UjcwWSBOfRmOsKRIj02f69Zso250EcxlbdOUxlI
         BSvYljTQ+IvD8ondn4ftiN+VYsYzzwdbuijtU825gkq0Le1YdHAZxb7N0yhm+0uZ5PK/
         cse2HFbAOv+gOG9XBRGw/Sdrs4J+32uhbVajZ3SNskx86vP8sQlcW3clEXYaUdA/dxV0
         BiZ+EpIXZGWPnWe6sm/FY/W6gmhQ0WOFcRBcWRBeId5MV2Ul+ntlqbmKC+AWkuCoxCq9
         f4+zBFPAaEkiSnGOVyoLU5seEj2jTn5jYuxI4MC+fVGf/cXoZru79HMUgaNKm75K7X3E
         5Mcg==
X-Forwarded-Encrypted: i=1; AJvYcCVMNqT4CM9k15AwcDUrA7E1Qw365lZqDb+sBQ6i+nFSA+zQV9t/Iw7mX0HWeeZSy8zQi1nVoJ5uYx5xFJBP@vger.kernel.org
X-Gm-Message-State: AOJu0YzS897hrfYs+sm2AaxT5PM5MVUPs22gb8dK+re4joXvQ7bJctb+
	csE2189dXjlF+M+dlCgJtsP1NGzwDx0dw9acAyIIDBftWSzEp3xySIX/UKI3IIOMF6+kK6Hfhbf
	0xqGzV+AMtKNb2iNN5yxEVVgOZZFm0Gtyj2EOpX3EYAUR13I=
X-Gm-Gg: ASbGnct58se2s7rxb+GfE/QvbtIX9f62fIqrmMLewTlAXOo/zB+IN13tiM4jCQXoa5Q
	JSJNYLI9/2HCnIXz5v+4xMyJIho31X6OA2PV5+apM+v1iA7sNbm5LpGloN9LetgY=
X-Google-Smtp-Source: AGHT+IHPYfu5RWwg4QjV5Ft9MAhO7VJZB9xFWbSMLRysOqfixDFuOnt9+09RHZcOWbxPXE1q+wf1OmiIJ0aIfFFsbn0=
X-Received: by 2002:a05:6214:1d0e:b0:6d8:aa45:a8a2 with SMTP id
 6a1803df08f44-6dae38f441emr17981836d6.11.1733957630566; Wed, 11 Dec 2024
 14:53:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:53:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:53:50 -0800
Message-ID: <CAE-0n52NEHh6XnsWsg4XG0nS8cVpC-HW8snBLD86PO3-AV3jfg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:43)
> All other submodules pass arguments directly. Drop struct
> msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> all data to msm_dp_panel_get() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

