Return-Path: <linux-arm-msm+bounces-39586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72539DE7BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3BD1630CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2370F19CCEC;
	Fri, 29 Nov 2024 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDTm5dn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7171A00ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732887464; cv=none; b=mjFFXh6SXO91DX+KjbhocmoqB5WGzGqxbfh6vIYirdNJaqiaLTnUXJQTufERJ1OGuajmySiLXsynfZXFivjSTdToFH5ARsYlQvaeTk9Y0/7p9WDX0Simgw1CoRG1LhzfDjqK0V1iWz0e0y2i5Ugx+mdjKYXxwA3u6qh1EemaHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732887464; c=relaxed/simple;
	bh=Q/b5bZKOnrnbzj1Sa34OqZxqSlQtXvdEoPTXurkSd+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhjgvLOIaSFuN3gQX5/MBGj5rOIkeomGnIRUXD3FiiQYHyZ1umpgvAiZE9Ubcg7r/CfA7sjKb0utVKTo4k3NEf6Dmped7BDUJAfT8mskoZ7H7hC2NY52s7PBHY0Qkq3SA5w29eVwWuiWPbjptni3dULzYWdNUf/RHKQX1BE8ZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDTm5dn4; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3970ac2dddso1508227276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732887461; x=1733492261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58OMzBUym1v3QZatsP+eIIFv2sSi0+p3zj755X8dJ8Q=;
        b=tDTm5dn4d+cmD8wUHJCieqPT6mR37pEHyw7ungwsJEfHDx/Ma3wY4e6wDeY6It9Jc9
         JNJLvZhECYIzmHMGzdSHsP2l2jLE0+f7ox9cw9RFr7UQYCwRMfl+9nhbpGKkcLqZ91ow
         YX9T//dmkhU7ypWh328Wi6G1Eo+d0DEmyqgAS1jMRSFNPAuv3B4Y3+qClpQY3R/fgku6
         M8boZJZQAVFc8BChTV3tJy9TVXEEjSuDYFJaWzdBkMJtktv89O1rvXF9TRRhIrFWBMVH
         H0HUprj2Rfwn05LCoFYFrM+Ng8e4d3zmi9oTOUHFw3yzIo0GXy1mZPScBw7syzEHmWii
         ag+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732887461; x=1733492261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58OMzBUym1v3QZatsP+eIIFv2sSi0+p3zj755X8dJ8Q=;
        b=P1TsQZdDTvkYbDhBVRhyMdaqF0LCixviSTwlWAmrm61KTt2NwHqFv7t5ns2xqo9cym
         yosdJeM80WC1A29zQFs2sXWOVCH6UEMSUN4tIrZ+3w72MeAacj4ZpexSnJb2AY0E0exD
         w5aPYWRwEMms+sGPV2e9QpPQYEakDhLvKVB6jFSTD2zkmCy7acXQJ64F2IASaGEGTNgs
         GtrYRqslxwdkXuDEaFSNJys1ZkiPbCeP7cm9dYn9B8MlnikqqbaJD006mZ5UPPHOvVoh
         5jRFtBYy2dRTcXon7qFLLacYB0G9xRal6OeMpsyhktBmR8uqvdgC712RrfHzem/w71m1
         EsiA==
X-Forwarded-Encrypted: i=1; AJvYcCXkErj/1twTeD3+SYn8zuzEGogvXJtm+xlXJjeSEceZkBiUpg7CpRQpsYhIlUWLwG0h3JvNOUUorea8KDG9@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6AZoYeUZuyDYgMNGxGvCE+97/N48x1WGP/v4nA3Xepa9P/Z3
	dU/aXKZkud9wIQdkNxS1ZTQDSgB2JdFbdTlYMAwkAtgRwNqS4nmjOtb07eFpNzezqSCd27tRlXG
	ozTtZgBUS3tHPAJ2zaUgYz+QcDucZDMgYu6kQlQ==
X-Gm-Gg: ASbGncvSWzkR56DhbNn7fDFTeK0RIIUZsjPBIBQXBYKmAHu/JyPzUB7pSNAbRlTkj89
	BkjZt9dyBv3T1FAPw22l1v1WmveDKzhM=
X-Google-Smtp-Source: AGHT+IFrkQj4k5kVrrQDIL9m2/Jvz3+WCa9PDtXeRIXqBRMzU6Wvt9L6VaM1TYObS+1ILE0ANh43T1BRSKVu2mYCPeA=
X-Received: by 2002:a05:6902:f84:b0:e38:b6be:1d58 with SMTP id
 3f1490d57ef6-e395b893aaemr14088801276.21.1732887461424; Fri, 29 Nov 2024
 05:37:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com> <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
 <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
In-Reply-To: <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:37:35 +0200
Message-ID: <CAA8EJprGLfa2H1VMAG7uYJOEUyf9aMbC9-V6Q_J-pDz4pGV1yQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 11:56, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>
>
>
> On 2024/11/27 21:46, Dmitry Baryshkov wrote:
> > On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> >> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> >
> > Please mention, why do you need it at all. I see that the UBWC swizzle
> > and HBB settings are different. Is this really the case? Is it because
> > of the different memory being used on those platforms?
> >
> Thanks, will modify the comment to add more information .QCS8300 UBWC
> setting is quite different with SA8775P,it use different memory,so their
> recommended configurations are not quite the same.this is really setting.

We had several cases where the platform should be using different HBB
if it uses different memory type. Is that the case here? If so, rather
than adding another compat entry please extend the msm_mdss to read
memory type and select HBB based on that. This will also fix several
TODO items in the driver.

As a side note, I see that your config has different ubwc_swizzle. If
that's actually different, then maybe you are right and there should
be a separate entry.

> >>
> >> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> >> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
> >>      .reg_bus_bw = 76800,
> >>   };
> >>
> >> +static const struct msm_mdss_data qcs8300_data = {
> >> +    .ubwc_enc_version = UBWC_4_0,
> >> +    .ubwc_dec_version = UBWC_4_0,
> >> +    .ubwc_swizzle = 6,
> >> +    .ubwc_static = 1,
> >> +    .highest_bank_bit = 3,
> >> +    .macrotile_mode = 1,
> >> +    .reg_bus_bw = 74000,
> >> +};
> >> +
> >>   static const struct msm_mdss_data sa8775p_data = {
> >>      .ubwc_enc_version = UBWC_4_0,
> >>      .ubwc_dec_version = UBWC_4_0,
> >> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >>      { .compatible = "qcom,mdss" },
> >>      { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
> >>      { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> >> +    { .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
> >>      { .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> >>      { .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
> >>      { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry

