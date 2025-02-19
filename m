Return-Path: <linux-arm-msm+bounces-48540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3217A3C617
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0058A1899814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF8C21423C;
	Wed, 19 Feb 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USYItg2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3DE286284
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985868; cv=none; b=ttCEnrHzbSDw1aMz3WhLRPs302kEtqlHz+57vcJk8tHMcintf5p4wKUMFaVRbueMQjz3OxiupaS6FKH9IrNfcbDMwmZyMBqaEVURyspvZA8WVj2+sreWcH+KvcQSYdp5Wi1CGOLmHn873PrYiVfYp+VcqvCqU1czkHmTbwB9FMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985868; c=relaxed/simple;
	bh=T4rhPGu2ce6iGJAzGw9LsW3+86E8MFAkFApyKPgUGY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO98sip3pzXXEa10LF3L9vbwmEzgBMfJBMHuErrqzss8sg0IQpZv837Oc+VTYii+CDHB+wDVkM3ZUQmJlcA0QT1E/LtV4gla0TMe1/dNYBNE+veV4JVEfGeloyjLzi8f9S7HVWHKldR5Rvph16hKbdGgDIOIKPobjzYjTdmFEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USYItg2a; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6fb95249855so18313877b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739985865; x=1740590665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
        b=USYItg2am6boBNLd50xfUs2toBOCLT5QK7hQ+Na9cSN2hijH2ZLVOrxyATQngnj2C+
         RFrijO+J5aOC+XS2UXnerjjtsIRLyiZf++e3SF85MzIRZr7mC9bIHI6Q3SfbKKFntiFm
         gwxm3c93yDBmm+YhwFxK3iVaZBHSYASG9A1ZwV/QJQUGxxvSDRaKs+zX3iImdeN6bnpZ
         WmGSPO4TZ2O6shy+H4uTm4Sry+jXb5I9LPtLZmpdI37RFCSxs1wKgE5W6xOMTVBxac7d
         GZ8ZQavutbVPy8NTpawwvbD9L7v3FNWwO+BVqufnHCnVCgGnzWpauk+dZrhn1oLx+5SP
         pGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739985865; x=1740590665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cr90zEajdAaEBjcRfisPPDqVdNWUpvTZCFRKVO9Uh4=;
        b=H2G1K0t8Bneqn5gSoeBKtYLm6nhRLGD209xrvY18CS8PFmMZ9zBPwZXzdDRhg1/Y2b
         +DVPCpb5KRYHfsOwr2kh3hqYV5319WFVVwy5IRib1xMf7NEl/hy10fGyJZsnRuVVJ0Lm
         U9H+fX8rRjx2A/hlpioE+gRrGT2nTKuxQEjre+UqY69GxaVOzRuze56p3w5Wh926uwkq
         o1ZhpfsBwtqKb1Zjbq0xmIMzyPjmXeskmFnyDkVwYkhHxHxvpSrMUZI2y75++Cv+Ar6e
         xUVSOHdLzW3F16aEtcKqDSaAb+P4HEJqksFiR209+z+5OvLZw1IQJJTRgZyExe6xmL2Y
         V0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFaVvNbrEkPyxKupIA8HIsUSpxDP7Bu3EKg9Bo3iWCQ5Z4sd5Ma4wHxOVQl/XtRt4Itv6BHoxPjsfWI2Ub@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNano7/+VNzsJPSSzrJgpxWTAyStQtVG1zAr6tdkGJ/X1yOku
	ics2Rnh4ez1Nh0EeSCP8oXcVApuLRR/WJ5XqKO9zTtVc0zBNd/6yWF5B5oTysCJv5qvKpVzJmLq
	gIEdUrlf3ms2kGFmKECnsK+yNrSETvFm97AS89Q==
X-Gm-Gg: ASbGncsE4Wzz+1hm7A4+G9tnaDP5ZYzOMq3tDphGLxy2DkJOJd5sMc9Uvk1wbRUtWv5
	fcevIS3fN0+YoLAhfY1IpYJV/AA7rUp8doweJF8qKHofldgxtCAF12/roMDdZxEanBen7EgyYRt
	ugPNY5lcoJLOM=
X-Google-Smtp-Source: AGHT+IHPYcZfjn7eucK8FvixqCR2I2msLnTZntlahztuzdBpXoxW57EO45la9a3FzKXUns8U3FOZ+w7YFPg8lisWjjs=
X-Received: by 2002:a05:690c:7445:b0:6ef:7dde:bdef with SMTP id
 00721157ae682-6fb58359ca6mr143804167b3.23.1739985865461; Wed, 19 Feb 2025
 09:24:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3> <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
In-Reply-To: <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Feb 2025 19:24:14 +0200
X-Gm-Features: AWEUYZmAr3QYLaFayeHeppxyHSH1mnwXmz4zOX0FGc46bc3FPvsfNyKPQb2_VV4
Message-ID: <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >> Implement new features and differences coming in v12.0 of DPU present on
> >> Qualcomm SM8750 SoC:
> >> 1. 10-bit color alpha.
> >> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>    layer mixers.
> >> 2. Several differences in LM registers (also changed offsets) for LM
> >>    crossbar hardware changes.
> >
> > I'd really prefer for this patch to be split into a logical chunks
> > rather than "everything for 12.x"
> everything 12.x is still logical chunk. I can split more, but without
> guidance what is here logical chunk, will be tricky.
>
> For example 10-bit color alpha looks like separate feature. But
> remaining PIPE/LAYER active - not sure.
>
> I can split them but I would not call such split necessarily logical.

I'd say, the following items are logical chunks:
- ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
- 10-bit alpha, border color,
- active_pipes
- blend stage in LM + set_active_lms

-- 
With best wishes
Dmitry

