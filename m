Return-Path: <linux-arm-msm+bounces-7614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D056F83299E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 13:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 580B6B22543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 12:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8000851020;
	Fri, 19 Jan 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+9ePfNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0774A4EB5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705668116; cv=none; b=CNnUVXy0WVpAaYffuub0dgESzjkss3YDdoo1X2QEliu+9UUR2pgpfDCcg7PzJH8ENDhDAOlZkT9xMyODQicVpDVD4m4NqXZrnMVFO/nNWEmoeDY/I+guiqHhSkLnxB1eGk7uVrBnfYrj3tXLR+Hm88khTp25kMSr8BKVj6q0oxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705668116; c=relaxed/simple;
	bh=2cb5Al6biJuuZyVOrVmyIzVVgdjZLf1RVBZLRdAK/Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rr0LGniz5gNoqR4aQD8f68M9+asgRqKSYtQPZ6wtH5+43u7TWCq48bI7IfQLeermnX3c0ZaBfgNihN/UN/E2y/kWdJUPNwXNkJsE2h5ElnwJx9hPGb+zUY15IfCxCiof5RNe9oIG63nKloPcm3vG8HtRhQsENMsW5v2BWUVbFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+9ePfNv; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff821b9acfso7087447b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705668114; x=1706272914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=23vuA1+7BgcGfSlqZ4nH0qFr70mqNSgh0bqFZoyYKpg=;
        b=t+9ePfNvhYNx+/khQCkZFXtSyaj07YyMRs3M82d2NLreYcHORg+GSVl1gglcBWI3Qg
         hBrtPfqOf+Uq7pnx6Gp6gTDBMdlynUfC91pqFwVXhNJ/nKtVMJzbLh8WOJk9dILc2vp9
         Y5V8LRSpFMBYuCZP3otygBUq+LyE/iTHJBADqPOkTrdH0UaCO3DQAyvg2MKs3LFvbARj
         foxbv6Ym+jBpABfIHCk6ydxv678vg8wsR8lUWkYgZuGarMZtXFUcDsOJ2qAp9fXfrOE4
         vnpnQOGHLSbsgMu1mhy7vcYjfaoBpULeedxFhWZT7cGvLG9ustKBHp2Hq9bomkkDE4cI
         /4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705668114; x=1706272914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23vuA1+7BgcGfSlqZ4nH0qFr70mqNSgh0bqFZoyYKpg=;
        b=iLHmIv/BKjk7338iDQ/jsYVEGnPRqYTkCzxNTcFTbz2U7gO7pjwto53b1v2B/Cmftp
         C5/T4CP3nnZRAm50Ylx8qFtU2GCim8FrvOLOVj1kjrORTFrc7fYN8X8uH+bHDav8/uxS
         SbcjrYM8z41Dicv7IyR9eqHMq2dvtafqWymPjur7axdOI7kpY0sGO92WXulOxuUanq9j
         iDwZdtieMd2xhbL9fZg3CvDkmGf+r1jL74/0Qo8ptKgrGupHJkl56XkekcL74lFOKQZU
         LxASN0G0l79bOjG5CjNvD3THQb8nubV+ks0D92f3swM1ad05ASilwnmB+z3gDYT9hXvh
         Ufrw==
X-Gm-Message-State: AOJu0Yxmlz6JPjyC0X5QWnZ9GhswanMZ2i5WaaNjRscxlefh4QexXC9z
	fsxXttyCG/qD3POVUYVfPmkHFGaDe9c+gtnxhMKj+8HTyinkQeKCQw9jHmUpJZ+YUMqIxBjtKoN
	CJT94W1PauWSU/eX0pD3yzeUsR6adN9IqXAd/kKE5yvTghxmnOPX2YQ==
X-Google-Smtp-Source: AGHT+IGXaB/Qo5C8K/AVwVpt0k+i3/3nYM44JB7FzXsWZairbE64gJOEa8s/VJ7iEick4vjqREgSJWa6nU4h2xbXln0=
X-Received: by 2002:a0d:df17:0:b0:5ff:7cca:a434 with SMTP id
 i23-20020a0ddf17000000b005ff7ccaa434mr2084545ywe.51.1705668113943; Fri, 19
 Jan 2024 04:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705526010-597-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1705526010-597-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 14:41:43 +0200
Message-ID: <CAA8EJpqm5KW_UOkvV1JhX+LEh_e8bo549NNQ1AgAXMZ=ZPVCOA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: return correct Colorimetry for
 DP_TEST_DYNAMIC_RANGE_CEA case
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 23:13, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field.
> dp_link_get_colorimetry_config() returns wrong colorimetry value
> in the DP_TEST_DYNAMIC_RANGE_CEA case in the current implementation.
> Hence fix this problem by having dp_link_get_colorimetry_config()
> return defined CEA RGB colorimetry value in the case of
> DP_TEST_DYNAMIC_RANGE_CEA.
>
> Changes in V2:
> -- drop retrieving colorimetry from colorspace
> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
>
> Changes in V3:
> -- move defined MISCr0a Colorimetry vale to dp_reg.h
> -- rewording commit title
> -- rewording commit text to more precise describe this patch
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 12 +++++++-----
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  3 +++
>  2 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

