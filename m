Return-Path: <linux-arm-msm+bounces-34429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23699E9CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F5B1F231BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62030207A3F;
	Tue, 15 Oct 2024 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEj+LFmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3420CCEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995227; cv=none; b=VG/gjbeWCJWW/mgHo4RyxFY9tc/eCDfgbjGjHZFTfZuILGZ5SpTKDrwNEhYy7gs8Q6St7JTNrzP9b8QrftKPkyZ8IaDkKnl4mtWAVfxoyiyLDe/n//q7JnOQn0zojF2h2YsPuFo4+eHaLZs9LY4T0+vx6MMWcxyHz8LJ3isj9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995227; c=relaxed/simple;
	bh=IJlYtQFeLG0i9bPxCxcljLBDzVvz3Kvv8tvwApj9vmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOh36iGJFitqp1oFfWC8Hzd6eX8J1HMKKRO7L6wvNAmqLl3m36z/CxLxejMMuYxDSuoC7SpGibPTNGOyeyYWEQ9odWLFZFQkUj7RGT+9f2Jjp8hmhh6OttlH+CQe/nVzjn4OB6Nrt7Dy6jmEukGEhe8kIsK/Ptweuuw7iKsFhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEj+LFmd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e4d16c2fso44570517b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728995223; x=1729600023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks6Ykml+AXF/SLAnbRT+RNH2STdD8HOXdreQb6f0egQ=;
        b=xEj+LFmdYVHPzl3DWJcKIhao6TMusleO/pV7XcxKxG1Dy95RWHZrrq+KWDTPQWOMNz
         1pKSwBXnuziqxns6Z18jZZ7yP3uWn8eUCg4L/2Om43l70dNbLoNZgOU7Enqh7n9NslXf
         Z45xAZsIMK+b1tbWOhN5Ks8iwUThF4Bs7VqnKYrLhYXuWsrfPAuZxnRqdU/3b/GSLZlW
         U50kZ2JkdUm0NuJUSt2X8/e2UzDWF2AV2QOHOXLKU69IZFDz0cpqZyCcd/siisdP1Rur
         VY1UsoztlP5lrrPT6pB4m1A3tXEwEylGqakexw2zg6FN2W3gbWwdKka+XIz3ZoNsniGX
         3nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995223; x=1729600023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks6Ykml+AXF/SLAnbRT+RNH2STdD8HOXdreQb6f0egQ=;
        b=goTfZQgekO9XkuzGXrX/e7c3nf9/1Rjd407IyilvNkOGtyN821QbtZ5LfY19/wegUV
         aIAVetnzsIcPIIEj9ubvllzCj3tCNlnruzcYyPWrCRlc3ht6Lp/ANbbRpGTJCeCcztGo
         Wd8z4us8N3PD0ctF+pjRflSeklHm0zmO0fzHiRfLU62Sr+yyuhir1qIMz8PLnoFFTdL/
         jrWi7LH4RiRgl5yS7RbcXdJVIpVEbP7lboyVMyTtTts5C8Yw1AEjAuUYQUaRpU4o4F7M
         wKNVTNJKdE4KXbEYa6rXx1UrHMgdhUS23juuY4Vpu9x8rdkfXllz0o8VLDJ9PPwWDvb8
         5LQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZDRqb5HGc6c1tlEnOLtTPWbc68mZmAn1LLpPzC4DLTMXE0TH2j6N0Vwlb5MFkN6zEkAdNrdZ6CzPwpuOq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVH0tF84ZnL8kLZF0+u6kJwJG86L46LI7jhjtLsHVTzfD3Ywzt
	aYKRi3U41cughMVp/XNdlM5LrSNA2mifvEWd76jyh6oBXreEFueFEM8Zm1MMgf3rYYFRWVpdm5m
	OKcVdIqfax/VoJWJktID+5NphHTSGkcOYdjwp2g==
X-Google-Smtp-Source: AGHT+IF9cEyFlB4rJ2xvEcXHUWgmUWBXAAmvE4lzHc02ikckmMbCT8jufBaw4HpfIgnp6G5dxrvwmFVSxwc5Xo0DWgQ=
X-Received: by 2002:a05:690c:d96:b0:6e2:b263:1051 with SMTP id
 00721157ae682-6e3640f5282mr82517567b3.7.1728995223277; Tue, 15 Oct 2024
 05:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
 <Zw0j9UeJmC1MZ3Xt@localhost.localdomain> <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
 <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
In-Reply-To: <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Oct 2024 15:26:58 +0300
Message-ID: <CAA8EJpq6Q80fcUZfP-DRmo8LHLHrwnkFd5FQ4Mrs0hiwPUyuSw@mail.gmail.com>
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of SM8250 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 12:22, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 10/14/2024 7:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 10:00:21PM +0800, Jianhua Lu wrote:
> >> On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
> >>> Initialize the platform data and enable video driver
> >>> probe of SM8250 SoC.
> >>>
> >>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>> ---
> >> [..]
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> index 86ef2e5c488e..a2aadd48926f 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
> >>>             .compatible = "qcom,sm8550-iris",
> >>>             .data = &sm8550_data,
> >>>     },
> >>> +   {
> >>> +           .compatible = "qcom,sm8250-venus",
> >>> +           .data = &sm8250_data,
> >>> +   },
> >>>     { },
> >>>  };
> >>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> >>
> >> qcom-venus driver has already supported sm8250 soc, I think you should add
> >> an extra patch to drop sm8250 releated code from qcom-venus driver if you
> >> tend to add support for sm8250 in qcom-iris driver.
> >
> > Iris driver did not feature parity with the venus driver, so it is
> > expected that two drivers will exist side by side for some time.
> > Nevertheless ideally we should have a way to specify which driver should
> > be used for sm8250 (and other platforms being migrated).
> >
> Agree, we should have a way to specify this. Any suggestions to achieve
> this are welcomed.

See how this is handled for the drm/msm/mdp5 vs dpu drivers.

-- 
With best wishes
Dmitry

