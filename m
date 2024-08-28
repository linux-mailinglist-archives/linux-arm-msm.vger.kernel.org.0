Return-Path: <linux-arm-msm+bounces-29869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF4963324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2480B1C23DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8131AB521;
	Wed, 28 Aug 2024 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUj1qIpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DFA17C223
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878573; cv=none; b=pmXKXqmr3E0VFp3HbcToOLEEVl9gMWLROkYA4PWv7El7SdR00Ujy2t2HgkOxk9ugX8+lPKGrnf+Vok+4ASZ5OBfQkpCpEeCeM5D7goS1LAi6n0Lf7XpG7/8MG6GBAjAxaxyLguCSv1njVCJbacJzqKAiMu4LwyHM3ccY/7uqXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878573; c=relaxed/simple;
	bh=Hz6doQ+DgqCIDr4ttXGzjMO1f4gtYCHlVaOxuLtsBV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=re0qmqMDILOk+URIjOLoAlOVzOue7ZrLcfV8TgIRHZBcaozgo+xwbOWK5QDjXscRcMQQFhXGBuqtZSsYxNAkVqm5R3lU0lG3fF8Z0/CfDPyW/P3GuQLPK9KC2VyT0iha2bjjRTZD4hA5zKR67Sx2JjWAUx0ejAot0NAd7CWrNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUj1qIpJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso830135b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724878571; x=1725483371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
        b=KUj1qIpJCgVLAs7zSJ2FXICxS+6og0vg8zMycDjKqeVCiklUw6HbWpw/IMh9LXczi4
         7q+ajb1iL7ZNDPSmf/Am9WiztIn772pJ3UmqvE+84qEhivgkJavbplCBJiXiSpE5Vnc/
         Gqfds/IEgTVycvl/nwAgc10s2LCrlJrTlKB0nvasT4rVVC6j5+fxnWCEWaztrNh0FS0l
         XYiOGh4hqYcPElkZ8eJ78EeuJVdNi3WIeQYXqi3tp98ML/fcqO7XEYUAZQrLgOgxyirT
         gW5VRe1Tb1Xb6g3UJTzGgb7A0zqdAQfgzuOZGDqngXdHsbFq5ow+Uz4+PiLlQFlZdrLQ
         4dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878571; x=1725483371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
        b=wUm6+A/6IYaaSmf/X5YvpOKA/AgJtCIryIy4q57NVQKhi5RLGsDw1djYoLn5VRtMTq
         GNkHG4EkAxgsAPKaw68ysnXHjYJsrPOtopt9hBzHEdEwei6MJMCScWjnee+qFynbvgdK
         wvZEeTOZuI7GF5XA00mEw5A1TZJmvxneqPTTo23Pa1aRJrI9uzHw4N8pm/W4xadwjDQR
         Gn3CWIw3j0Z+OMLPKOsmXyRCaU/nwkxtBma3N6MlriuOAG4j9ElTjeEgPxkqUq+AaRNc
         ioKEjr/7uIjVJn7sgIuUFiDk94Q/qiDFgGo7Br8s5JMfbs/cLLeXbCW7XmbImoZBjbjY
         LNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBQIXeVLDm/E+72jgRXgWfzNuXiJQXpsJfN1eyC5Yz/hgyCYmTLWuixdQzCh7B/DD0vv1IuVpkEJIx5bJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxypcmLrezLH/tZ8Vq28jxaYjuLEcBlhINzmX+2yHWd5PS7K8rk
	g2pO4f3RdLgQdU/LrP2ni0rPIYT486agKjwXxEDHpVJrMQkG1xg1BFNGdwrQ1UB28HzZC7J3+0y
	80jxm9Ybw7stwoYa4VPHfNDIkzQnZstcVdmIxeHwNAJeedMTS
X-Google-Smtp-Source: AGHT+IEz2rPhLvv7n23E6bzDV4iFmPIxFnrezQOlNwUK6zlcWpRR3csAoLfs4O3Xg+lVb6jAr5o5pCLeaKqNmgyCv14=
X-Received: by 2002:a05:6a20:2594:b0:1c4:8694:6be8 with SMTP id
 adf61e73a8af0-1cce15f7ea3mr602404637.3.1724878570814; Wed, 28 Aug 2024
 13:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org> <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
In-Reply-To: <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 23:55:58 +0300
Message-ID: <CAA8EJpocScDmfSpSctOYiMiOLKpcWOP8x4qjGkdx0sieUsnvzA@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> > Move a call to dpu_plane_check_inline_rotation() to the
> > dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
> > are checked for both pipes. Also move rotation field from struct
> > dpu_plane_state to struct dpu_sw_pipe_cfg.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
> >   3 files changed, 31 insertions(+), 28 deletions(-)
> >
>
> Change LGTM and addresses one of the questions I had in the prev patch.
>
> One question though, till patch 11 which adds support for 2 different
> SSPPs for the plane this change is not necessary right? Because till
> that change we assign the same SSPP OR two rectangles of the same SSPP
> so we dont need a per pipe_cfg check till then because both the
> pipe_cfgs point to the same SSPP.
>
> What is your thought on squashing this with patch 11 because from a
> logical split PoV, this change is meaningful only after that.

I'd say patch 11 is complicated enough. I'll check if I can change the
order of patches 09 and 10 to make it more obvious.


-- 
With best wishes
Dmitry

