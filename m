Return-Path: <linux-arm-msm+bounces-5515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A148199A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 08:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D53284DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 07:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E871D52A;
	Wed, 20 Dec 2023 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvhJHkJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253881D530
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e7415df4d6so3855847b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 23:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703057869; x=1703662669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wEy7aKZB6aXhf/1YBwq1yRA/BeCIlX1y23vgvuPgWw=;
        b=MvhJHkJRIeAKqOOgWypXF708UzfH1UEx39lOtK8Reae7w4ca7T76EcXCOH3cdCMJEk
         txEgJCavscXcmsuLB0VbJGIu4NMJJGnxrefMCP202YgBYULmVfWAGI2J/QLNGUVGRfHV
         yUKLVj8ak1Tns7HWnqsoCuoF3MJ+pmMI8i4T2cN+1nR3mitpSi8VpLnK57FMzxJ2acOR
         TT3xSP5HFX1G0FNw/3Nhc46uo6WSpL02VIQU2Zyi+Xf5Y4QOd2ZBvgduKtPxiH1z0U+X
         IzWtvb5DENMCcTRmbkUguwmCwtZWUZvrYSJh39XVoeSrKb+3fKACN7AxZ2YkUor2uZeO
         ekYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703057869; x=1703662669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wEy7aKZB6aXhf/1YBwq1yRA/BeCIlX1y23vgvuPgWw=;
        b=epPClhs6SCuYx63jdrxAZAi10LYiyaUPdYAhyxbNpEIFmuT1Zy7mu7mSkBhwrB1lpC
         KM/ShiG88VhS9whxW38Yd+rStSfjXXQRCCVs3c69slo/ZoCILK0VOG0wiunfXWTBcUEL
         NYRNm6tv2kn0HIMAYAStDOFesY2lfbRoZN0BgKF9ihNpnye7FRBTIukE4QVUbywjXX64
         8UoUwP0ubzg9+gaU4BX2Wf6XRKSKLrTbhkp6mIQb3ui50ds3yIKy8p4QwwYfB0y5M1k1
         wjCyxe4N6SZMZtqh+1bQCJuhtVQpQ6Uj6PclWPZV/2+I8pjUHRaoWaQBsbOuxJbvz7d9
         R4pw==
X-Gm-Message-State: AOJu0Yz/480u11bmQ73/VSn4s8kDQ/8AU60Za6PSFLxL84MUBHQM9bjk
	BIlBU6xIthormaOcyc3WUkgeq8z9FcF8RmOxskGP2Q==
X-Google-Smtp-Source: AGHT+IGR7yLin4e6j26Ca0diNkMq+UpXkjGay37wddrKam/6iQT1PLWaB6BjjU606OEKywmSjK8vjFHclLMr6S1uNB8=
X-Received: by 2002:a81:4ed6:0:b0:5e4:e8e4:4aa6 with SMTP id
 c205-20020a814ed6000000b005e4e8e44aa6mr1494439ywb.44.1703057869130; Tue, 19
 Dec 2023 23:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <a033dfc5-dcf1-4969-ad4d-1836ff9ff0a3@linaro.org> <d0ea23ae-8fba-d229-b0f6-dc522f285233@quicinc.com>
In-Reply-To: <d0ea23ae-8fba-d229-b0f6-dc522f285233@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Dec 2023 09:37:38 +0200
Message-ID: <CAA8EJpouBOLJ_1Pz_YauuOX+97ud9RkLYRaui4GM6ZFJUKYJMw@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] Qualcomm video encoder and decoder driver
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mchehab@kernel.org, bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org, 
	quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 08:32, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
> Hi Dmitry,
>
> On 12/19/2023 12:08 AM, Dmitry Baryshkov wrote:
> > On 18/12/2023 13:31, Dikshita Agarwal wrote:
> >> This patch series introduces support for Qualcomm new video acceleration
> >> hardware architecture, used for video stream decoding/encoding. This driver
> >> is based on new communication protocol between video hardware and application
> >> processor.
> >
> > This doesn't answer one important point, you have been asked for v1. What is the
> > actual change point between Venus and Iris? What has been changed so much that
> > it demands a separate driver. This is the main question for the cover letter,
> > which has not been answered so far.
> >
> > From what I see from you bindings, the hardware is pretty close to what we see
> > in the latest venus generations. I asssme that there was a change in the vcodec
> > inteface to the firmware and other similar changes. Could you please point out,
> > which parts of Venus driver do no longer work or are not applicable for sm8550
>
> The motivation behind having a separate IRIS driver was discussed earlier in [1]
> In the same discussion, it was ellaborated on how the impact would be with
> change in the new firmware interface and other video layers in the driver. I can
> add this in cover letter in the next revision.

Ok. So the changes cover the HFI interface. Is that correct?

> We see some duplication of code and to handle the same, the series brings in a
> common code reusability between iris and venus. Aligning the common peices of
> venus and iris will be a work in progress, once we land the base driver for iris.

This is not how it usually works. Especially not with the patches you
have posted.

I have the following suggestion how this story can continue:
You can _start_ by reworking venus driver, separating the HFI /
firmware / etc interface to an internal interface in the driver. Then
implement Iris as a plug in for that interface. I might be mistaken
here, but I think this is the way how this can be beneficial for both
the video en/decoding on both old and new platforms.

Short rationale:
The venus driver has a history of supported platforms. There is
already some kind of buffer management in place. Both developers and
testers have spent their effort on finding issues there. Sending new
driver means that we have to spend the same amount of efforts on this.
Moreover, even from the porter point of view. You are creating new
bindings for the new hardware. Which do not follow the
venus-common.yaml. And they do not follow the defined bindings for the
recent venus platforms. Which means that as a developer I have to care
about two different ways to describe nearly the same hardware.

> Again qualcomm video team does not have a plan to support sm8550/x1e80100 on
> venus as the changes are too interleaved to absorb in venus driver. And there is
> significant interest in community to start validating video driver on sm8550 or
> x1e80100.
>
> [1] https://lore.kernel.org/lkml/8c97d866-1cab-0106-4ab3-3ca070945ef7@quicinc.com/
>
> Regards,
> Vikash



-- 
With best wishes
Dmitry

