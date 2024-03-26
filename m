Return-Path: <linux-arm-msm+bounces-15247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189988CB58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13BE32E94E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCA584D0A;
	Tue, 26 Mar 2024 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLRXkW16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E99200CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711475462; cv=none; b=dKO5F9g9ymHDis+8asy4eLyX+bhO0o7xV+aYA/I6Cf8wAl+uy0H+J1KSXx9fLcnHh8O0itagAv94JRHN9mAigy8ekwoE5+OBr8QKHz5vSFZDrr6ynr/1e/xe3dOACTJ6rlRZQVWyJkS7YWYHch1HjwJkNqn5+3Dk1BxDS0ZNf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711475462; c=relaxed/simple;
	bh=DS+ZVIzfQvfy1mAXlWWMX/Uf1EBmJvBo9ZR6tzEUzmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EP9/NUCd4Rr8mbRi9AkNi+ICPdayqy2rZwGiimu5m12mow+RJRLxM+E81IVH8f5D5Y9HV1KDG4A0iFjIUWDgIyIEBLqhOPPS80ZnG8Gky4WoEGUvDqTKf82cOwoGO0CAgAOss+9rIcYwGyTc2POdVWKqaBPBi3m/pWg9D35MyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLRXkW16; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60a046c5262so55377457b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711475460; x=1712080260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PQt9uE/ppvfkTcIqGMfIYXRibl7GWLCliTRuigVWPgI=;
        b=TLRXkW16NBLpqOjOFbMpxP6i0yXNfkCKMz9rlgSkfmThbsxGS4bQHcdmPGTTHgUNSt
         8UAaZyTIE6dQibKtu3cDk9ANkJxfPiHn5NYlQ8HdqbGzk2Divili8ViBkbrX+oqz35Mu
         IoMsLKwQK+yUNBpOMBHvuaofzjBi0Uz8jEV1rzxSU5zg6yao0ywZjBkVij3CsT9DrgUB
         XiMnIbO4Ju+k15VcudtdnIcA3PHMdgDCv/E73Rmsi9qXTG4ScUx9JeYISDjKx1ZpRJrp
         JGYF6huxr+kG2qlPeUud9/xzrUxIzhkN4lsyhUdSc0Hy15Hx9tpzOUB01fBkfvgwRQzM
         bAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475460; x=1712080260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQt9uE/ppvfkTcIqGMfIYXRibl7GWLCliTRuigVWPgI=;
        b=fRF/5rkfQTTJqx+9gB4rxg+ATwePiAKnhWG9bAbYwHubozEudt9OorvEzK9SkhFTfk
         cwoD53WZOeu8OP9XcKhzaakK+dLkxZP20R5C2uAaVipRcDbyWEl1qHefOKp0sJeqcybY
         23HnQ2CdGGCd98yWeiAnNCXEV4ZRDBZ/nHf9//hgtQacsGs+E4a57lSoLsTuR5FvH3On
         QOpu20T7TMexVoB1Xk8wtZZc9F+fIULyW6dNaai8ssifWluT80poc5DRoBLyTeVDn2de
         WD3y8T4qahIsQYdTj/8wuUr0aI4n3YBTPjPMA0iHScmq98rkPJ4+SWVJYnYC+P+J2Zvn
         wEBg==
X-Forwarded-Encrypted: i=1; AJvYcCUsAf2LFj3w0MGnURpgF4XmCLxYnd/aVmCgQ3AKOHQXOkGs1aSTA0lTFNcKFcoEpMMDefWbRSPy/LxblhhOmkyt584YqXK2M6THzAHSTw==
X-Gm-Message-State: AOJu0YwW9uFmD6w6T7OcTuwWJ9DqaY2B9dSQeNkcB/VD2TLYQpWaPrUA
	cPHDrXruG+hRTx42jfgal7PGVISP5/aHVL2OG/QfkCnqfAZ0LicNvFNWpKyPA1Yg0IFKtlw5xQV
	V/6i/xqxOD250jPCmFZYNKKZUYBgp5mgSVbapyQ==
X-Google-Smtp-Source: AGHT+IHgaKfWmnWc7zIsttUGrVkvAZrzsd0nsGPCX83cPi+b3E0jY3GMekdJomBN/FEgwvmEt+1EzeQQuU9eKhkIlew=
X-Received: by 2002:a5b:590:0:b0:dcc:7b05:4cbb with SMTP id
 l16-20020a5b0590000000b00dcc7b054cbbmr8591652ybp.31.1711475459884; Tue, 26
 Mar 2024 10:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com> <20240326-msm-dp-cleanup-v1-6-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-6-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:50:49 +0200
Message-ID: <CAA8EJpqce45f1Q+speRQo6NbtEtMq9BZWx36pbTAQGjjTyWCoA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/dp: Use function arguments for audio operations
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The dp_audio read and write operations uses members in struct dp_catalog
> for passing arguments and return values. This adds unnecessary
> complexity to the implementation, as it turns out after detangling the
> logic that no state is actually held in these variables.
>
> Clean this up by using function arguments and return values for passing
> the data.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   | 20 +++++--------------
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 39 +++++++++++++------------------------
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 18 +++++++++--------
>  3 files changed, 28 insertions(+), 49 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot for the cleanup!

--
With best wishes
Dmitry

