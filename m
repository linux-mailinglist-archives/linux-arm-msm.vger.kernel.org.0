Return-Path: <linux-arm-msm+bounces-41577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2E9ED990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929CA164AA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDED1F0E59;
	Wed, 11 Dec 2024 22:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P2Sol11E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5871DB956
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955781; cv=none; b=Lh7g5dfUXPXLr+JqucDVEAfF4D3pL9txW2B1tvhYw5V5c0kRmkT4pwKHSVfpxUqkQzIYBCQCka9liq3hG5Z25xqORBWnx8B8YTAox+s460C0dxTbK+01OvvyGicGmkM0OFa1ls4MRak17GTexysKPLh10Jk1siNi5YXXGnlsFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955781; c=relaxed/simple;
	bh=MJDBBPfSDpJWtJb9BzIGgtoPQLKoUXO+S1ieKhazaPs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqWTQAPCryf26wBE2LvK1N/mZhudMpCwTqqJLl4fPX6Bwvuec4atyM6C9uXGtnq0VWZ9RDk/sf2oNOZsFpYHrau+jU+E1A1+Y+01CSueIdz5H5TRxjgp5Pf7Y1z57SUki8mxqjWG0GO5N2bVS4e+Tlwf/XUYQLPkmPOVVQpyCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P2Sol11E; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8f544d227so31884486d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733955778; x=1734560578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJDBBPfSDpJWtJb9BzIGgtoPQLKoUXO+S1ieKhazaPs=;
        b=P2Sol11EiF+BRUH5l630TlPhZpoR9HSMW80yPpBQawS/wbma2PheYJoOxH8VWGJhws
         8CBK9FGtQGoOcq+d9duGrNfOG5zWaQPiJAyS6wWFS72wEIt0Jncvjz1aHszqY+c10qY/
         Jw7QLYQXcxhmRze9ypwUoQ34C2DV5T693TFrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733955778; x=1734560578;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJDBBPfSDpJWtJb9BzIGgtoPQLKoUXO+S1ieKhazaPs=;
        b=YJmxQL5tGcaKrI7xDh7FmSOHWat181qkQiIK6C/vaP/tcA3PYrb8Vek811bVnpTCKk
         ecoHq+4FaiFiz09IbMLF6aNoToGcMS2/xBqG9iZ+pmu+q/08sSWDzAdj+AtiNFSAVrNd
         fjW8at6KDDYkBt9HywrSSaSazAQBkOsXJocR3cBfDViY3haMhRs9rZeNWgGcPvCwBZYs
         itERNjNpGOmSh25cXWOxhsLVGAUggMnhGu/hqZ32aX3h5awq2Qy/2n/NWgBOjQycajIc
         iLiIMjNx2grBgvT77IlN+ZKjkBGXmY0fFN8QIppl1b1vC7GykGEDsNUmfMJEzqamTU94
         gbWA==
X-Forwarded-Encrypted: i=1; AJvYcCXUy58ODwGBX6AeiRxJfSDxseLBc50vr5+pRhGdaRRbdYpiir3sIv8XDEJZOQBt336so1W+AwSmdVJldfAk@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7qqYJflEeCX5moY+W+FNepLhIbVbZ22AFZQGAzesrcY58uMb
	eaR4cm7AVhbOl4ryNnZRPK6wBMjjwDFgz73gH8ddvQkQkIG1zFr5ReLYAG03Vq/bv16v2V3roF7
	5990nr8+otXgwfJQ0feA7j/H9g0IPkvCHrL8Z
X-Gm-Gg: ASbGncsWMrJz5I3yHhVER0fmH1Jv+SaroOH8OzmJVdkKCwnV9IdK9b8G8sCPAkUSOLc
	1UcP/XNEePFHN0P80t4WFk/SUYEVi17pihqI7u5+YR5xt56Xi5UMBa46uECJ+AWQ=
X-Google-Smtp-Source: AGHT+IGzWdM0tmUIo9hkCU9nyE01NRmj3O1QuD2Ba95w/TbRxxu4YMhY0/0gBbnPplq8JU4pMlDSW05l9pl+kUE9bGI=
X-Received: by 2002:ad4:5ccb:0:b0:6d8:8a60:ef2c with SMTP id
 6a1803df08f44-6dae38e69a4mr17111236d6.2.1733955778063; Wed, 11 Dec 2024
 14:22:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:22:57 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-7-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-7-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:22:57 -0800
Message-ID: <CAE-0n50_NvLiWmfNnQJJKLn=BYA82vmPgy+6Vdpe8x+u6fwn1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] drm/msm/dp: move/inline ctrl register functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:37)
> Move CTRL-related functions to dp_ctrl.c, inlining one line wrappers
> during this process. The enable/disable functions have been split to the
> enable/disable or enter/exit pairs. The IRQ and HPD related functions
> are left in dp_catalog.c, pending later cleanup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

