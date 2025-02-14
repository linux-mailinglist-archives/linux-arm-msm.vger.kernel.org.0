Return-Path: <linux-arm-msm+bounces-48050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83674A36189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5CE188C810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CEF266591;
	Fri, 14 Feb 2025 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wP+u+xHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279E4D8C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546552; cv=none; b=n667YqClg3FtirLi0FTXTNE3jhuXM0QcHwlI3N15Xast3Cl+TA+PfL+BFisSOeJqo+tE6GgSsOdz3nrYbvClK6mC6K6EzjoFnv3HMviTtctvVnFNJszEgZLTr6N8dhpBHTmIfOv6CqLlIVkOgHOGh4j9zW5sCbA70yIVOCjhdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546552; c=relaxed/simple;
	bh=qAZ+7NciQnpT5One0BQKVQ6jDdDNpz7ei39w2YEACvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0BcAF7QJVR5WTIdCIJSGmi05RM+qNMzj7jXJxFlBZHYEdSJjgxd0po1KD3yVlSLoXH8kFPt7dXf5oZkCjX37sRbRwgOa8Wiu0Bn8bLCOShaLVWA/ngzZwmrjLlq3fC7QvCNUPNkadY0wTrBJB7DhIU3kRbJXMR0QB70nPYvf50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wP+u+xHV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54509f46614so2261772e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546548; x=1740151348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
        b=wP+u+xHVZaiIXHzELGCWPAy87LoEGMClZXHM+BZUfUcjb6/w4F0CjhznOEu+zEdeNW
         sIdD9VOqyI+cqRPnIR5uP64fEI+gGZOvCTvldqTvZWJ0lCYJaGwoYU+/0kNRfmTah4Hp
         iaVzuXhGdUjjjcdjK69ufclY2WBHQ1VRd4dsRCF3gC3gxN2CEUdx3PjHr63bahc7+7uX
         2kZF/m/oLHSgmOAn7BNJvxbHZ+uog0CRSnjOiW/UvBfGl0eEfzasfvPrFOSiEmTzX72v
         BkMnXquQAe7ItqrwAMBEr2PbwNbISunD9d+hfRsYmlTyHPpKx7BlDlw6RE3KH5OTUqVZ
         Ui9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546548; x=1740151348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
        b=CtkOKlFM7pdgjaWZpaKCKgicjYpsIsroulQOIlAN9eOG06meIx0c6nT9NooKHZxK1m
         sZuvnwbkYyRk8Jncy+28SDDw/4Lnai6U84AwWvP2AmWoYQmKZ2oAAo4EQZBSu55zcXRr
         utTUMoQvxmtzoi6A79yW4z1n6PbZQkScyCjL7ar4NDva0fbb9T3k0On5+3VsChy0UO3a
         lKVxi567x/E3Y4tlqnQJUzNnhfhs8Rqd9dqeNhgtG7RabX1LFTe2h8CYUsUGcLizaWH3
         GDBbUgpmle+McK8OGKcYyBjdpnwDejhKnQGdtS8y5x7+M9Z2uAlIqvLwtObhQortxQ5I
         I1pA==
X-Forwarded-Encrypted: i=1; AJvYcCVMm2bpa2UuuVIPjcMl8DAChx87LkkJmtHyfwhf5B+KazzXZ3CLhsXOPTi23f1sMUJNhP2PjPa92oRx9GyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVzNnKID1YfiheAeMjEQ372Yp93x4DPO8Y2oa+8XuQt8odTUZ
	cTB5Qp/GqV4T9FJXCPDOh2d7Jzm3pbIVI69J3qpUN/qstVNOBC38h4lthUa4Tgs=
X-Gm-Gg: ASbGncsxeV4JRnK5rnfRy+gT26Hz+L4nu9NS5gj9R2zh6U0VmxLxJTaU2Pnx4rUGvqh
	kN+fw8Lwi/j/5xcYp+BjlqqTjkeQG6BBvjE65d/LNRNBb+n8iXJHClL2DW+N0F9M24HH3UxgKZR
	Q558VmnKz3/1Ow3UzPQjNmd03HordfIace4jWexgkrVwr2IRMKSGXmje5Om2ivRXFuFpQn/10Nq
	QnKbpAgCvEdyAPFNXaD14NlE+XdTiTWS4kyEIxqLsBdWIvohMSuu0+eu+oND1HkZg6B6p0ohtKQ
	oIwMmHEqEGlWQneA14hJhILAZpa7hY/X70ulrdKNayI0uLIFJDgCXlMMlKOiOQC37ssQmpo=
X-Google-Smtp-Source: AGHT+IHd6YyZaJ0gJzVV6IzMidNDXlHHAg8FDIw7tYf8COTL3g2DYgMEui7KrHFl59zy7pcT2QzHdg==
X-Received: by 2002:a05:6512:3c86:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-5452a7f908cmr1095665e87.16.1739546548279;
        Fri, 14 Feb 2025 07:22:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09aae0sm569393e87.64.2025.02.14.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:22:26 -0800 (PST)
Date: Fri, 14 Feb 2025 17:22:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Message-ID: <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>

On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
> dsi_clk_init(), which gets the clocks, is called only through platform
> driver probe and its failure is a failure of the probe.  Therefore
> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> value stored there won't be used/dereferenced afterwards.  What's more,
> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> doing this cleanup.  Dropping redundant code allows later to make this a
> bit simpler.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

