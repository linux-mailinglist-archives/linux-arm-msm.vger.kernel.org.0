Return-Path: <linux-arm-msm+bounces-28339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295894F6C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973041C20B90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABA81891D6;
	Mon, 12 Aug 2024 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L3X6mVdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F626184542
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487787; cv=none; b=BDYi1nL2Y8h9r6kieBmAD6NiSKqr36kCQncNIU9vYUWVKQYnfZcQ0MvkeEfvdliVz+2TZd3cY7mckasVt9azfm5WxAIeRwbVbrjHu7Huk+LqiCa4ddIMk2Qy1FhXS+TI6WZD22DAa9V6XJXnRKAal6xXmtdeb1ey4bxMLPEeLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487787; c=relaxed/simple;
	bh=XVEY3EOQ7EfM3BETXw06qP0pD8+sQ+yqKMA+bsLb1lY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wge95h9IXPNI+w1Mk9EWP5CjV2qveDopTgw0Y71dTDBNAFCidjuRmgl7XNUf7ZhzioNVlIPyo1Mvhgjsnf0+zB2boBsdlAACnC9acVkoFnaP326MnkO/svkYpBpDrMBOe5Qg23QdK6+2KxuFJpzOFvCUV3c64KFjdoLdRn4U6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L3X6mVdf; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a3574acafeso244184885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723487784; x=1724092584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVEY3EOQ7EfM3BETXw06qP0pD8+sQ+yqKMA+bsLb1lY=;
        b=L3X6mVdfA/P5O1lyzBKTcZlu9FeGgdHassW5cydz5DRgnebugUHsUHihGMdvOCFaK5
         KfkbtzAs2asNlv+7REaIoG6idjtHj6GqLxEs9fLOBB+AaltjQAZIONZAEnIOOQRjdITA
         ai8z/hMw2uQRANgtgf08N5LoFQpBOOb1PKzjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723487784; x=1724092584;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVEY3EOQ7EfM3BETXw06qP0pD8+sQ+yqKMA+bsLb1lY=;
        b=d9888JPo0ItHKs+OW89O4DW8Pt9GZDis+vSotM5hNAJEzOV0qkGmR6jxTeqOvxtILk
         MfQ2qceQ7az857Mm71YcqXp718gRJLleUPmXxbvMNBrQSM6tLkul9yxT5AfJB5IOWb1g
         gRgI5Rcg7rAI8dsxdd7XsfIzvZc+wm//Ixy7INrw4H4LSZib4zaEc9aZmwgA2C7K3KJa
         CH1s4nFMneeynO3XAsGhf00B1Ygla8GnZLZIYBkXIuoOxmsKGzFDvJZuG9bpxlEKA+Lj
         V3F0EaXZB+CkiQOxOyuJPx8hZBBk3C7QJYNMv7kdfwwVuF2FGpHJVdIr0foZXGXxYi9f
         4RwA==
X-Forwarded-Encrypted: i=1; AJvYcCUN2IQxh7BTJj5Bb2AqB73H7Z8zrOWWk0R0WLOC1FHjXs+HcszX4L/XlS0U2vePSmyjYmJsPS8QFV2thUSPy+oOs6lT9eQspyW74n2bQg==
X-Gm-Message-State: AOJu0YzobjHh2P9CLYpMHwIP1NV4NqFhX8kMzMUEyCKIWQcRdLbdYvbx
	VjBa8vVHAhjpxk3weSVZz+XCvy4HT1ZdcOZ/fQwaCyKg3oauD1ghzRBd6WXVnTJdR5huT+Yxixi
	KiuhXM/OTKEU1GqJ9OFqoLy1DM7KsmQcHdNav
X-Google-Smtp-Source: AGHT+IHmoofWaFYJnBjW3Mad9MwbSlnA+Lmn21+JRVXHiDX9eb3lBTF/fIYOBI/SdgNYe7IAkY5SEsY8XTjEOJNFGZk=
X-Received: by 2002:a05:620a:4010:b0:7a1:d73f:53d2 with SMTP id
 af79cd13be357-7a4e151bd49mr129101485a.20.1723487784514; Mon, 12 Aug 2024
 11:36:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 11:36:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 11:36:23 -0700
Message-ID: <CAE-0n523aJOogAidORYJNGUG4aW9Eq0wzoD3U72i8CFF=BqsaA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
	dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-08-08 16:52:27)
> sc7180 programs the ubwc settings as 0x1e as that would mean a
> highest bank bit of 14 which matches what the GPU sets as well.
>
> However, the highest_bank_bit field of the msm_mdss_data which is
> being used to program the SSPP's fetch configuration is programmed
> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>
> Fix the highest bank bit field used for the SSPP to match the mdss
> and gpu settings.
>
> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org> # Trogdor.Lazor

