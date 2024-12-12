Return-Path: <linux-arm-msm+bounces-41845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2B9EFCB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B7F162D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8078F19CC21;
	Thu, 12 Dec 2024 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QMm2vgcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1918A6B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734032652; cv=none; b=nH3bhmJsXb9wR+i7iUW8yI2l06MQC2cYZF0fF/9LCzkELcMXsKo3Ckb3HgbUs35C7pquLdjf+N7FiraR24bjI+Nyxwu3c+ZeiPaha4xk7BwvyE1bsOp/mCPHxjFtoQqHhj295HIXtAkcJ9Unfty9Gp4hi2XMgHjeH9RIZWpI/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734032652; c=relaxed/simple;
	bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDDetnAsrg08eC/dCuKkl9DJWZWn0qsEOsLfxxKtHBvW1eHy3xF8H5Dht/eof9WG9qA3zWgTts/RjHtcjq257qh886//ufrapRV+ADTfgKEf7vfBYstjqybb4NsMQ7K5h5E7baLatlYlOLr5uD5hPuyAfzWtNzLdjWrO5gGLrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QMm2vgcY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467a37a2a53so2098931cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734032649; x=1734637449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
        b=QMm2vgcY/cPb1BxJZxypGYygMZbPvr0pLbuZnAaib3ifuAOE1sxblhY+vcyKdzTrj6
         jyictjQz45hJsUoyi3QLRu8WQXsjDJn59B0YpE1jcKwH8ECb+fuHSK0imamo0MLuIdYd
         1pxC3KdxHFVt/CV29hJFa7bXLY1Czf4bNSlco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032649; x=1734637449;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
        b=fwtUohKs4s/EWsfFstg9QRrO8rkagTsU+w+7MOGO9NK85o8fKeFVjSvK36D9xp7mHa
         pJiP0ZmBDigaF7bwaJwlzfotxRFqfTIFbgt1nHaMjhDFMO3dnCQASgv64ob7FGdqbKVc
         ibS2OWQmAv6Rt7iOVV1JautBVRt2RDZ+Dv984WtG5uzN91Q43s2thFO+pDcGt8iV+jMz
         hXEs60D9SQo5RtzVKbhRMNi9tGyd5k0UGl/Y2EbhyivgCjtlP+He6cguUTC7JB0PuuAM
         mN0R5r7KWaTAt5cGv0ipzkJAJcWr665VI+w037ZfE1jJaFz6j6wrn055O/lbl4/uN8j3
         aTjg==
X-Gm-Message-State: AOJu0Yw0iFKqc7NUs7RkDKkDocFvfkLkPLWQb5MJDT7IPVHFIgHVJFNO
	nzpu806XlVMX65yRs1DwGTtegSEzZI7zFRhaHabq3nGHQKmEuE7DFqqPYPMkoXRUmrpRcRB+qVS
	jGvV0M+QP4lhP4mR5ZUWASZBklrTyYZ2+yuBu
X-Gm-Gg: ASbGnctWbqH06s3J+9X6/W+WORVV1Oej0AieVq2P/QhMctbUOpJwFXuK6jHU2kf00qY
	YVeT0pUPwB+oT/6Q5yZxyPEI32fOMbsIiPPhkEKi7eGczCAVJaIgH1olu+3Poaebxuw==
X-Google-Smtp-Source: AGHT+IHlXSEQ2wG5xyF2Aa1OBgLaNUi0yxcdOEzjtF/Id9mL9j+4TPLwCfOsk3qZGjqHtCyb1hPI6wo56A7bYwjCxyw=
X-Received: by 2002:ac8:7fc2:0:b0:467:81f0:6d63 with SMTP id
 d75a77b69052e-467a15c7a0bmr31511991cf.17.1734032648880; Thu, 12 Dec 2024
 11:44:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 14:44:08 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 14:44:08 -0500
Message-ID: <CAE-0n509akHPXM8t6QCTO1cydhJzv_Tu9xTtGze8=bY-rUN=oQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-12-11 11:50:26)
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

