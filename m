Return-Path: <linux-arm-msm+bounces-15108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D188B280
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 22:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1C11C63749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 21:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD596E5E1;
	Mon, 25 Mar 2024 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWMDnrDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCC6CDA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711401406; cv=none; b=AnuaneiuJlUomUmuXKVRvyxGuhQ8tHUg0xXFi4Dz3ETgqKt7vbTXMFLkW53fiScnHgUzTo4xFPcSmKq+fqo9zC2Rrm9dewqRzabb5tVyUmFnNZqTTv/bD8kewZMIEOH3LgYhIZCJbryqPeXQhoj4PFSVVoXEdbdKcKdWqcEyf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711401406; c=relaxed/simple;
	bh=XnYxg44n9UmMwx+BfT1Lx7/A6qiY0HCS3q4AwEZrM1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlc+8M+iZ7VAt0wpdhgnfj4GVwU+1SvSS2gu6/l8Cw/wn7Ddx+5C+ass4FOxFRE9K0jkUrf8aWhITI6Z+qL5k9lu+aLJyIJZXDRjpQySHXwaHkkGosb/uUu5EwuY8T0rmCLHktC4cauL+e1UmwivFg9UZkN3qxmd9R3VsWIFofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWMDnrDf; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4435884276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711401402; x=1712006202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
        b=rWMDnrDf9gHNg2/QKWN0eeANEUs3l7Usx9Nv7FF0YV24qnJVsRVxiGxKGQM6fYfTmx
         EaJCK6hq+TpXrA7qQA9CCMbBpn8eKXZwusj1fOxyMZMGQRwiulq3A9zn77cGUFQ2ia1z
         Hvd+dnVRE0ctsG90OBRYwVQkT0DFORZkwyBjIZgz0+6pYzWbkF+yR4EzN1YRq3RZqHB3
         nsjn8UD/Ibw47p5qD2vOU2V8bvl8rPCuO8UIZTq1THlnoc9fZQOjR0jG+UR/Ux+Loyyc
         SeTwj5uBeHO+fJ60ONCBPJAaWREls86BlFrKHchUmgHqR9n+RvqB1spcN8XFkB68UH1V
         0keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711401402; x=1712006202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
        b=Rv0ED4G+omRd/XPB3FeIoZCyVn1fwEQq9eduouALKVGl5lxD3PaLiAew9yoamaqaOb
         u4mOPwgCjxGGqj6bG/y1mK5x9UShQBHlH+zdkupsxMnBhoQrxMwLXrqSY1g5tVVxURUW
         KicWdOXFLNlfZcF+bZlQ/qdDbCw1/AF5jGAEqQJk4qAo12Cl0/AGE6EvIpmnQ3gPOHVf
         TkDU1ArsWEAwxMSWNMkM9V9A8cA9Qpa2JOYFKy/yVbrkePDXXCvqrdEYzvDtdoqwZ3NQ
         YzYApUeCHr08tvBfZfbEuH/XJ6jqSUlQH74g5Jo/9Y//REvBMGgaWPrkk/qil9S/MOeH
         Uifg==
X-Forwarded-Encrypted: i=1; AJvYcCWJRuC7HcMvQNL7oDe9j2vzDVbq55aYV06GXKDM1NbwxnfuxvhTX+G63KJQaPWPwi+sRzG9lZo1IBTeixdVOp+CrUfe3xnbNMLoCt4OsQ==
X-Gm-Message-State: AOJu0YxeOO/vtFQa6HsAFJFubf1E4B2tO4Pu9al/bwqkqtJXYm/tH7wA
	/VXKbpsV9mTVzeMHabbXocjq0ZXd01xiDuuK5xm8Ux6NXcY7tB9HQLSrdvqtl3lb9vKIbCEuqHh
	XT26dWRsJOGjqszg3EjuID5m3tn8sIjovjC182g==
X-Google-Smtp-Source: AGHT+IGmfJuEEZK0xXYu1atPPd7gdTrXAHTMAqXWgAFibdrfnqzHArI0XM86kbZ4hMgAFB1mDKzR3VsuVkcuM2xu2sk=
X-Received: by 2002:a25:a1c5:0:b0:dcc:52dc:deb5 with SMTP id
 a63-20020a25a1c5000000b00dcc52dcdeb5mr5391964ybi.20.1711401402341; Mon, 25
 Mar 2024 14:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325210810.1340820-1-swboyd@chromium.org>
In-Reply-To: <20240325210810.1340820-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 23:16:31 +0200
Message-ID: <CAA8EJppFc7+ca1JA9cbtAEV3+Ln6BoTkzdqyq88_gfN+m9fiPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add newlines to some debug prints
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 23:08, Stephen Boyd <swboyd@chromium.org> wrote:
>
> These debug prints are missing newlines, leading to multiple messages
> being printed on one line and hard to read logs. Add newlines to have
> the debug prints on separate lines. The DBG macro used to add a newline,
> but I missed that while migrating to drm_dbg wrappers.
>
> Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
> Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry

