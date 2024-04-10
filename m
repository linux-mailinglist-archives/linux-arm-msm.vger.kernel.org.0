Return-Path: <linux-arm-msm+bounces-17125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F938A011E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 22:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA691F213AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5282E3FE;
	Wed, 10 Apr 2024 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohEPbzQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F011181B94
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712780228; cv=none; b=hPLD1axRFMq7g/0/dHljXFD3KUXlF4V43+z8ITZnxE4b8RXIuzKBzCjBg84WZn/q87cpiZXSMYWCvy44pOU5ioYhivL+OHuRlhrUku4kuZyDs/RRXNxcgA/uaUG7MxQhkN29GR5ervgKwYwtCWXdmjruK4dZnR9oK8idFcHUAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712780228; c=relaxed/simple;
	bh=gFvOYvOa7gcpr9X8lIEqDjG3gMHfcMvsHVt0P9ARong=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSIQ2DoqN/L78z+ka28lbpV2nq0TTQEaPDAdJyEduDP+HAHxyjhVG0wnapCfLdrkF8HKJF34G6otv3pjp6kgxqsrtj0jnXjz0wtynCuVpMMXHtHLO1/HzSpZexEzHoh0kexz2NqJBxVbJaoZVTXG+LqM0rzV5Ff4O5mTVknXuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohEPbzQt; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so6558662276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712780225; x=1713385025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wpl2t5Lc6cJesRDWuT7gFpPkrIAxWIcY6OKcyPvyMSg=;
        b=ohEPbzQtsgNUMQhgNSW1frgI0dG9bCUNiKTWtIRilcrRs88mwwK07KZlqyAfljH0tz
         /+YkszB/cUgpC06tEl/sC70FzoAmPQVnLRvXnq9XnslHqruzrO2SnO74LL+FAFX0GqNK
         I50gZLSmdNRi/Wj0AfRK8y5eGp7lha72CY+adni6bRBAe89TB0rB4T5VohrQQhNP7AGc
         RS5ivAXF66SNOpcpUUKf0PcFXrdQHQ6M/ck7LbDI/3P3BNLju6nULqJ3xt2zQ/qsQML4
         x4N5bXJ3lTrQEI9DkfUts993gapsQJsuktg/BSaX64MLEbrnKPRLo/JLmi172o50JA/d
         fiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712780225; x=1713385025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpl2t5Lc6cJesRDWuT7gFpPkrIAxWIcY6OKcyPvyMSg=;
        b=vKAVFffzJrYrtho0jBo0jZwtVnYVrDMri+kkkwvo3wG1s8iajmVuWqkEkmYyLD9hg0
         c2yir/TgQvdwSSeED8NZcTwrTbpP5mZEZa6wRL1zcicJnqyKXpbXVA6xcWvmh2bis4uC
         DF0+HLyIT1UuRMGkXkVDdhUTHiwos+SBe4+BYT2DyTDBP6ybViEwqohSwD1uzpeRG9kV
         Rm/agE+hblk7pEziAzTg0wZ7IOAYafKcwZKTKhllvbjum0aHhxCdGBaY1o7Jic/+V0Hc
         m6IUqeVa/txnkQKw2p4pX3Kc/iKVwvN7Ri+38HDZy7/sX5j/lH5AzqJIoCYYgUby6GXz
         1kcg==
X-Forwarded-Encrypted: i=1; AJvYcCVf9DTcB+4A3VUv/TFhcHO64QTJSHacgyqE3ptOfjyNiGWvyfUqtkC1nSKi9MvXyvbi5FAz7YlcXL3KMu6Z4RmTpCxzAiTT15yzTSu+ig==
X-Gm-Message-State: AOJu0Yz3dRVIAO4F2zfKFC8W+d22fomnY1aEmO20FrdOEOybCaT1PHqc
	GwVkH0EGe01Gl2LWWlQ4RTOZaHOvtDRtDJ6UOPsTAolfTDGAMU6/Qtz9ZfG5s/4qsTRFbQN15LT
	WaKR9JnCGqWKh8bV2Hm83Ks4fj6TPGwo1gVWNQg==
X-Google-Smtp-Source: AGHT+IGTqWvCcFmYbqYwcD8nzhhjYarPwwHUryzKAMP0hx7oyV+Ds53KdnlEjDiNmbxewoDT4W6r4oBzplgf7Si93h4=
X-Received: by 2002:a25:9283:0:b0:dc6:6307:d188 with SMTP id
 y3-20020a259283000000b00dc66307d188mr3572884ybl.25.1712780225450; Wed, 10 Apr
 2024 13:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org> <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
In-Reply-To: <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 23:16:54 +0300
Message-ID: <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from mdp_common.xml.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Instead of having DPU-specific defines, switch to the definitions from
> > the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > MDP format tables.
> >
>
> Adding MDP_***__ usages in DPU driver is quite confusing.
>
> Can we align to a common naming scheme such as DISP_***?

No, it's not something display-generic. It is specific to MDP
platforms. In the end DPU is a continuation of the MDP lineup, isn't
it?

-- 
With best wishes
Dmitry

