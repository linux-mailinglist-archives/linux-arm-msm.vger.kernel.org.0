Return-Path: <linux-arm-msm+bounces-46107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD03A1BBE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 19:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045E23A5A73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 18:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBBF1D88D3;
	Fri, 24 Jan 2025 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0Vdgial"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5081DB122
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737742075; cv=none; b=n8EWoCVO1cB6AGGSrXVj+RPQgWWwNDuKWhwyiQ0O82OgVdwQB2e0jLquZAVSANCisEJSVqB09okWsfZnQhJ/2MVtHRMgGqyF9mGn018Zu/VUqDmXvYdN+KiqrX4hK5sNMeW9V/MRRYJ00iZKYXWDiehJbdmVa80Oq/3lt2dXULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737742075; c=relaxed/simple;
	bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i23ZwE9LAfcYLeqaMmXce/Lr2ClOhqkYfwfLoxb1sI6zR/ljHdonryvEXqM5FnsRHqGHnLJmKBqv+0aYu0rpqQqAo7vDtf8bUB3v5UjfFWedN/z6vRJ00QtQsEF3Zc312BzIZMDEaF0uh/NTyZ48xDTIrSyifT4vzLiKGXP9QM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0Vdgial; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53c9035003so4094031276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737742073; x=1738346873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
        b=r0VdgialavhCHfjeybWNYiiGf7H/80Gh1GgYLm2bz++4VAzQ750XnOt4TyFd3vDs5A
         lKpqUP5tl32NU9hZwTaQGnvd2d1H/C0GWsnK+hOsbc9mUop3RnHDeRXLUxZorK8W7RN4
         5ftjkPdFHn0D8VIP62vJ2qhSg0LmilLirtHWqx6iFju2hLpy0B/Dw2h9L7pLIlJ+ybR6
         VZwgGimYPCHnvAkQK7uUGt46hNlMevhaprYK7Yo//4eCE2qzonuir0YHNGJdwIP+IJX5
         MKVu03BmCNc8RvBQPWgU5fcKqXqUcyAnS86hAp7mFwD/m+Gi7EaeWylAfiYcLp9/CBg2
         ETSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737742073; x=1738346873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
        b=vn/MuUDx6TIhDezFJ6QA+Oh3K/GpKfQEcI9BKxzTXziA+NNrnP9hTbXrEFxfGdnEHr
         J8xeuwpej58Nb0q0g3hqmQ0HkUvJSDZ3KQYvWiXgedwGNs5zht23owMNjtnCn2QRFoTO
         fYtcgXFDzJYpGZJ3qduzx0nHPIlFfRUP9uYPg58lM38hyZhfapI468P/6LxNwlaPQgMU
         0vrbL8C0S4E+W/ODCT1brotnjtw1UPRle4F6xbusK+3JGSZNZGZXnCPkZ5DjBkIO2bVm
         HQKsUPPed4T9ZQ/glxca2uGDEYP9EMG/st6AwrN8zXm6kWJjF2nyQQnTGdbjspkbNT7L
         MeWw==
X-Forwarded-Encrypted: i=1; AJvYcCU+GAYZBnTasCalUNlaQJQcM7vjw+SAjp8JlHAFpANPjXkrwjqF3c6qhOgJCz77TfTthotR6vrK4sMSWXK+@vger.kernel.org
X-Gm-Message-State: AOJu0YxQoQ3sFZt97bswR/kGb+Gnc3bna/SrN2yam4Q0Q4//649hA1AH
	CPqV0g65/QubhZhuQb+X5zaizvN+7XjiQ2Ob8Vrn5UO5yRB5lP0ZS8JMsHW+UqkzKLZttIiYR6c
	NkVcyqoEbb/ojd7pXi8IriJ0hIKxq8C7JieA3fA==
X-Gm-Gg: ASbGncuuZz7EfX0M7F6KfMCmKdul/Agd351Ga0442W/A7Hc9/P8+zlvsyYJj1zWojiY
	dw7/u47jdhc9EvF42+gRRMMilA1/pFntD6hMuGJzchUuukat+w0TJBDVaoddWLiEpc1E=
X-Google-Smtp-Source: AGHT+IEvQawWvbODqKpeWmhbnVvP67aPuBS2qojQLo5WrCMABiRRxMrK1zubuPh/r6/xhtarnZgUkKZJY0JBR3HK9zI=
X-Received: by 2002:a05:690c:74c7:b0:6ea:5da9:34cc with SMTP id
 00721157ae682-6f6eb64e5c2mr240082137b3.7.1737742072993; Fri, 24 Jan 2025
 10:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
In-Reply-To: <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 Jan 2025 10:07:42 -0800
X-Gm-Features: AWEUYZljn2d60ZQAEgu4wX7E2q0L-hbvtZG9qjDwTq_2iWq5aX5k6JqtUqYgnO8
Message-ID: <CABymUCP2dWK44j8n2ncVGLvLPoOKzgKK1NitRN-y8izpvUs__Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=882=
3=E6=97=A5=E5=91=A8=E5=9B=9B 15:32=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 1/17/2025 8:00 AM, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
>
> Hi Jun,
>
> Please add me to the CC list of all future patchsets/revisions.
>
> Thanks,
>
> Jessica Zhang

Sure.

Regards,
Jun

