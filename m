Return-Path: <linux-arm-msm+bounces-23172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE690E1F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 05:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08971C21CC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 03:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC7251C4A;
	Wed, 19 Jun 2024 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHtuOXix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D150275
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718767630; cv=none; b=rdmsRdFXwED6w3FtvYK4I4Kce37HgUJtsY/g5hGKaYY0QZ+Q6rKOzqv0E3h6mvqQ6btexywbeZOjdnl9vYmsMDw9wVRLZBFKaUMpaNBpqP3a3tvzNA8IrUT2atHAl7uj8O71aZ/olcKszpa15bM5otlqfB6zDcGHbvA8TN2GUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718767630; c=relaxed/simple;
	bh=n3TIseCr3AARqu8QJM4wHcIAe05cswl2EMC17GWa96Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGeobpX9mWr5zko8MR2r9XUrZ+7ytx6Vw7I0nlEmophz1IyJK3Ml1iEDkL6XxtI7G5uSCDS2xsrQY2L6xpwh9mLV6YWb751xd3Pf1VzRuneBac0jH8raVXqbHYppjnNjz6BIbxYPcNeZXeixm7rtRGWo2HAQMAG/Kqa5e2JC5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHtuOXix; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627ebbefd85so66188437b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718767628; x=1719372428; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dfrBK+ORKFv40UvbjMXJU0JxToJEbOmqk2ygnUzNWA=;
        b=UHtuOXixrJK4ZegrJbQb/hNnfdUH7OOUDt7ONwMqF82B0O0MeMrAIWeaMh8ZxXd/EC
         DLgzLw/zEomvswDsCJO6fP1wCLtO7ERmImS1i20OgLtRNq4akBrQBKRNh24QoBW6AboJ
         Azg5eXdamf8bevzxvPDh5BdfXTByO2SUcoyLGlkJaHe3v7s5otj2OUVJqJuHRtePtyXg
         YST7n44SbuE52MynJnh1IGLd2CJiYOfx4Fi1RAVs5zNQ1wIz7250Q4OCYebfHPamvEt/
         F6sosJGvyvxWGpxDbfubpvNxzIrfYuJfHc9i90yX9Rb1iBDlUUeMJ/yTqBfE39PKyatR
         GtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718767628; x=1719372428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dfrBK+ORKFv40UvbjMXJU0JxToJEbOmqk2ygnUzNWA=;
        b=umwRayrVqoou+AKq8k3Apadv+h6Ln46gxYTS7Vo2zMthx/vOex8eh5sRe4D77/32Tm
         rfUT31fkHx69bxK40Z4o3QeSGHpnFyp5acgeNq7UoFXaXtS8GQc74/PIC4a6ZTMuSz/s
         6MkqRY3plEWpJWQRwfntXGKra7NCozxJmopcwpkBjFuprpZnnVhxB+vYdAuzWcNZu1Dy
         VekUPVU+8vZ5Pe21dQkKIy1o1X2RJ3RIXnNFvELp993LKWflOOk1Hv67aeXaiaWNW3Pk
         f6eBA8BJEYN/ioBWAXhq2qV32D8slvhqZVxG5X8eBcQyfNj897S+CbeKMaEHPbt+masw
         Yn0A==
X-Forwarded-Encrypted: i=1; AJvYcCV0o4uLSW5P8cNLTzKsx5hCI6EnLhMPDCDCgOe1iUDxds3pxeQUb8bragMa5vXbIvM67cjMdl2a0x8uQ7XeZf1lA+ZF9IdU3Bdsot9njw==
X-Gm-Message-State: AOJu0YyRs1wUK76vxfm6KMfDG8ta4fDv+X7lwsFneJhK7oNZ1LuiKu9z
	2W6degUHr/pgMa7FUY92Z3pTKjCw2tLRoSbaK4PcCpvlKuZ4HMwvQuYCqs7cdcY2gQJYFZ+cFWA
	de0L1IbdRS6aBg4jr/grINtW5Vf0kq2C//cp33g==
X-Google-Smtp-Source: AGHT+IGZv3mlZlyXqzu6CBGJhkJXhV9REwNTqZrZkdS6fZsHZVc+LmTu4SZ5pHj7J8TceMemNz9OzjXDLAdW2y1/qZ0=
X-Received: by 2002:a0d:d483:0:b0:61b:28a:e567 with SMTP id
 00721157ae682-63a8d44b79fmr14657867b3.5.1718767628046; Tue, 18 Jun 2024
 20:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com> <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
In-Reply-To: <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Jun 2024 06:26:57 +0300
Message-ID: <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop _dpu_crtc_check_and_setup_lm_bounds
 from atomic_begin
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
> > On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> >> The dpu_crtc_atomic_check() already calls the function
> >> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
> >> again from dpu_crtc_atomic_begin().
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
>
> This change is causing a small regression on sc7280 chromebook.
>
> I have tested and concluded that this is causing the chrome boot
> animation to disappear.
>
> I have tested a couple of times and without this change it works fine.
>
> If this change was meant as an optimization, can we drop this one and
> investigate later why this is causing one? I have not spent time
> investigating why it happened. Rest of the series works well and I dont
> see any dependency as such. Let me know if that works for you. Otherwise
> I will have to spend a little more time on this patch and why chrome
> compositor does not like this for the animation screen.

Oh, my. Thank you for the test!
I think I know what's happening. The cstate->num_mixers gets set only
in dpu_encoder_virt_atomic_mode_set(). So during
dpu_crtc_atomic_check() we don't have cstate->num_mixers is stale (and
if it is 0, the check is skipped).

I guess I'll have to move cstate->mixers[] and cstate->num_mixers
assignment to the dpu_encoder_virt_atomic_check(). And maybe we should
start thinking about my old idea of moving resource allocation to the
CRTC code.

-- 
With best wishes
Dmitry

