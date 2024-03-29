Return-Path: <linux-arm-msm+bounces-15742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E00892369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 19:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DC81F22AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00FB2C692;
	Fri, 29 Mar 2024 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baXQHGmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0B2C197
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711737359; cv=none; b=AwPKppj0DeGLknn9a++mIKhCbdJxwdaLyuwDFtTeqvVekp7hOEN4Yy45SP4Pf/SYBCuBmo7V9WnrJjSESkq+4gr/nkU/6RBeZiHp71y4rL4aD5DHNZGeW+uL8gV+vPppnrI1Yf7nM4tYrkQXbA02bcDxvNS47rB57ew2VxQVgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711737359; c=relaxed/simple;
	bh=PUnyjfXXPF54h7ZF04sgHvTy7l4JjKQESDtGtP1iwdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVeH1UPfsyWD7J7lkWLE7n87Sj3aPh5ot4EeNPyLM82WucYfcB4ymQey6HpAAdfEK1sFXzjPVBz17+wWuwATI7DFy5ecFTR5whBBkHcwbo8j+Tyq57JAdkMGZye8OI9ylx7uqiWMbxttezvta1pHKhMlBMuGC67CNUnCiTXR3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baXQHGmu; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso2291803276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711737357; x=1712342157; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aHkx7Y32QoW56rz0JNMHjO97URPHnDH9wV5JpFER38E=;
        b=baXQHGmu8Rwgvp69XdbWZuF0wiL8DgcojkAy+cP+pRq5wbvypzYmzg4HG1nsrhWlDv
         2kY4HriwHn3fm1OjuHVX/RWVWot/irXjHFX1hnHpOO74KcUUBoI59m6zpqAy0xOR4HRh
         t0FdYvTIFVa1/jznovcF4TGJmXljHFhUoK5mhZkINu/DADF8Saelxpw/wZ92Jf7YQ7KK
         bsiusV/EteqhRYHPI2w6y0DHr5Ys1sDieoU5unM2jZR5MkzgaA7DfIzAnXU/oWRKnuN7
         cqgFHVsMhldhtKvlHPNhyMi3jaMXKyJO4nw4ugAVsNCcLUZHomxqZNYOTeEAtJ5XMG+L
         10ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711737357; x=1712342157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHkx7Y32QoW56rz0JNMHjO97URPHnDH9wV5JpFER38E=;
        b=pTybjl1pwHGGNZhcR1XgaTCSP1EIESNH3RLuUyf8ic5jlTrIYKS7adRwLI6VHtQFM+
         v9U1stwcNX7KttZ0R/p65uiCkbHEDLK5fURjsjtRjl+wdm7aR/7gOHcZmNEusQsX85vN
         nfCxLA1zneEpNLTo8Gve1SajMXU8FtHRsnXSY3eLuqKaZbcvBDW4Wh+JULBgASKKalnz
         8Uk28K/aClBcJMSnwMUwPxikIFpt6HTtbmHPDOZ1h2pDpuLzEJQ3ABdvyjE5FNJuYzgu
         vOerbDh3W25fVSwGPCjLJPZcBp94sKOWZLUnCZ1q7mjgzqiHkGTIfsTIuCCrJCzgs8xN
         8xuA==
X-Forwarded-Encrypted: i=1; AJvYcCVKb3KwRMQebD5aqg81zzhF+CQ15hbCmed/bXyp/7elHOMj++/Olb9jVvpSvtOxb1Zib1yK6cGk44W2PzaCGn6an5aH1PPkR2v7ieE6Gw==
X-Gm-Message-State: AOJu0Yxt+9PdgEP4v8nSceQ/Y3ORAjK6Arfal8zcJSEe81h6y6O9cI7N
	mW0XJnGMmezr31QAU/JwDWqEOcJho6ttz6izP9jeH4kCLtvnnlETHhXjBJw6aAR70+NE6VAb7mU
	WkR3PIrG/9lE7wLCegZzJCGTUSRTgCUAC72VoWQ==
X-Google-Smtp-Source: AGHT+IERevB97IF6pH84hlBH+caFIrkRJzR3o4Bk7fPLKGsiOONa8kVzkW96kXFtazpyF80yhz0+Wdm8wZl5aBtqr10=
X-Received: by 2002:a25:4903:0:b0:dc7:1d:5db4 with SMTP id w3-20020a254903000000b00dc7001d5db4mr2911776yba.34.1711737356997;
 Fri, 29 Mar 2024 11:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1711730896-16637-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1711730896-16637-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 20:35:45 +0200
Message-ID: <CAA8EJpppQSTm7fH5fUXef0gdc-+zeKfFGw6uF1j8FJqBMySFjQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: assign correct DP controller ID to
 x1e80100 interface table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org, 
	andersson@kernel.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 18:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At current x1e80100 interface table, interface #3 is wrongly
> connected to DP controller #0 and interface #4 wrongly connected
> to DP controller #2. Fix this problem by connect Interface #3 to
> DP controller #0 and interface #4 connect to DP controller #1.
> Also add interface #6, #7 and #8 connections to DP controller to
> complete x1e80100 interface table.
>
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Changelog?

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 34 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
>


-- 
With best wishes
Dmitry

