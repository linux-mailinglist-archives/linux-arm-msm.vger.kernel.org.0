Return-Path: <linux-arm-msm+bounces-27158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B093EA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 02:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DE81C20A17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 00:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1085B1C27;
	Mon, 29 Jul 2024 00:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zzc9FjTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67312801
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 00:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722213475; cv=none; b=rymNz7IvGoc/9VvFt6fyzA2EFOGi/JOE37IzdVt73M4YBI3PHYWJcy+6Zfly7iTFqcvgdtqej3JGvD9ZQs0pvcW05d/qv1RQ2ljUfBR1VA+Ad7jxLBvu5y2uajzbmcjrBY6aLPUWLuoox49nvFVKLcPpN2I3GAqrg3mVxduZft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722213475; c=relaxed/simple;
	bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1p/CPcfZfCaCLnd/DBQPi5OWc5uJoUjKLb+yxfaluC2JU+/bv3x0Liu/xXxM5783QOf7kJyhlUZ4hcwa7FTK3jqJWVBts+xICmUdk12NnJ4ivIxele3YlSOZsnxE1hJMFEwe1+oClq3ERUOnZmUQAI4LcxxB0227nnTH0+oeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zzc9FjTp; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-825eaedff30so485437241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722213472; x=1722818272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
        b=Zzc9FjTpsYqbo7ponCSgwvz8Ju/1dnhB49OXH1L9BqBzqnWH3yvQKgjWZ7lgDUcdDB
         UmeXoKMl1wS1/QLkxXn2vxvAM4rv5Pr1WFFyob6tdneFtqiNSx2XUFAJwU5TFf2kng+5
         dIZyLYUs6gsO1DoGlOU1dgKAlfwO2mNJkiRdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722213472; x=1722818272;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
        b=qGKt51XyY8QrxhaXFtxtjpmFUZltYqywVirPAWRzWZawb2otb9gwGlCmbWJyjCI84U
         iXDZPj3EaP0PBJDmerdr3CTerQYACgHNoxoPCRKBFFXurCJ5Y1BYgftKAtvqVDIALkUu
         VPucXwYw/Sfnlqk6+XaUWiyCsgldnNuKuyJ9TrubcWhtvdQ1I8tZwDJfY8k1BhwQpFlt
         CE90lDEm8bWN7qB7gY+rwJfQPmB5tNQVzkeZXO5Wh1VH8dfcdrstiaHITF3O0/9mGhiP
         YXPbRkXVKLJ/qpNTvnbSe1u0Lost4VrourkirEhhWWJn3xjMTM7jcjYBYpnK5DYMkecM
         4rMw==
X-Forwarded-Encrypted: i=1; AJvYcCXVY/uKQF7tlWMZmqLBr1BDbjq1TkBv7L34lCjrkejBRtiYFk3ECJE/eTvCk680lMKqwxxpQ6dZwTUurtbF7yVoI5r5gBUzAIJOp1MT1g==
X-Gm-Message-State: AOJu0Ywf4fUCho0leo4TQwhL6aF+HF2p7GmbRNcR9iFp4cBIvn/vpeas
	Zm9/DHhCfkfwCf3BHIGVBD/BglWXsB4Sjcxif2p/PfhX6sB/O+rr3hZ1HfuRUJO89LGd+7SxNIz
	6yl/+CZYCvsyvJP/tdlqSqTHBojLS+lZglpyW
X-Google-Smtp-Source: AGHT+IHnc0qYQ/QNoYPa3JLfKJgzufSGeqO7zfkvsDu+SwHrgNq6HfC27UO1CGigP8NDR74vS4JR3C3+McMA5IKTJV0=
X-Received: by 2002:a05:6102:3e90:b0:493:e66a:793f with SMTP id
 ada2fe7eead31-493fa4594bemr3339662137.23.1722213472288; Sun, 28 Jul 2024
 17:37:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Jul 2024 17:37:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
References: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 28 Jul 2024 17:37:51 -0700
Message-ID: <CAE-0n52kAq4=Cbdjg8JFVJ9a9ww-cLkUwcJ4BNBP9McXeaSxeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset the link phy params before link training
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-07-25 15:04:50)
> Before re-starting link training reset the link phy params namely
> the pre-emphasis and voltage swing levels otherwise the next
> link training begins at the previously cached levels which can result
> in link training failures.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

