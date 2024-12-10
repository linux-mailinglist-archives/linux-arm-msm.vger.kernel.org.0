Return-Path: <linux-arm-msm+bounces-41305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 664999EB0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E391165BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241F1A3BAD;
	Tue, 10 Dec 2024 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcHQwKEH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEB1A3A94
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733833427; cv=none; b=jbWxTpF8EBPMaqw1CPdaT44SQt/yvEhqLzsCurTvHSF1AfoOSiza+byN7rbqGUtWFg7hXA+++C6wHBFlrBRIfYaJ3XRKee1XZ9OSm/eM/eXT594Caje/kM1QKfX0Rj1/8pkImqTBbVhCVL/fCg7Kq8kBPwN47UaUEAj3qj1wwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733833427; c=relaxed/simple;
	bh=lUtYIb9FWysANuBVRjGqvIA7tKeEyU84yMrXWdg5+fY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZftZl6Jbfs1Z0CVAh0s1gUhkq1lJxhFrNnhtIWjUQS8AQjF6zNfodJYEXnGA6ppqmsUWNloNuVyNCF3cWGlkk2pmLMd419dTFmdz2SBmDRWen3SrLWgXaJIW4/1HyL0Hat/pdxlFxxats6Vz4OHUckEfoaNwcTvxajiKtbXZso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcHQwKEH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa66c1345caso182316966b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733833424; x=1734438224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXv1q2+I00SEA4qivPj7ki5hHn17ZgKv03WB0L5X0HI=;
        b=BcHQwKEHVqSPK0XUnBzCrM8R2LizwxAzY+Qcz0h8Wqi+CmKHPK17OqqEcTSfsHUU3y
         SjZe/AwFEVW+knc3JwCubVg1J2R3Y/VitEOcIU0atswcZTWzABzXeXvfv+yNMTQ9QhYd
         0ofhE7+SDbXkAoR6WkLe+iKDBcUOYzSNBU8LMY05xpgSZ+b/e2JM4BA8U6J4iw7mekNG
         mTucQyG4yH3Qa/PpmkWqYAIujNOe+dfTh4zqyNZyhVetbIPhmFg8lZ7/U8xPWWr9O8+6
         pjbhFliDmZQi7hKjmpOlYkUI0zw/5rjmMh5QPzYGwlHehxHvZiZTsO5aMyHb4rO+CPls
         pNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833424; x=1734438224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXv1q2+I00SEA4qivPj7ki5hHn17ZgKv03WB0L5X0HI=;
        b=Vca3DxlxGv9y/lWUzUe0kMf9eX3QarsuU6C70/FXmn6uig03Rayc4gWAKb3r8QEzji
         g9RuuMakaS7IwoTdxKZTamoP5kq5cOTATKztMJoM8Qdg5LBtv3Er5wv8kJ9pyBIX8jE2
         LTcL7a6Tf1fpMYQY5OsQcg5mtQ13m7mWQaumLfHaPW8WHmRKBdla30U2aHOSlX8tD+sS
         rG4Ss6+J58ckaIKPiI/3f/yNfvkStei34UrAuiYhk/CPyVl3VLr+5r9zSsLLWtrXh6RT
         i60+PaEDHY94yCgRi+vc07BPL0gEX9aROWRefG41yvyylQeVafmxOv1lmheHgvBsCAjn
         i4uA==
X-Forwarded-Encrypted: i=1; AJvYcCVQkONWqTnP2rfTxtVJR3pOn6+Ogoas61K0VZzHz54TaD18XnLQF1jqtt3pZCJUVdF2L2VQjqIZoKgVnxRu@vger.kernel.org
X-Gm-Message-State: AOJu0YztzrBUhhfUaGxDzFzzXgjRH3223gG7KGDR4miWbdwxq4hIMLQC
	j2hBp4VJ8H4BgdKEv073+XHHJU/SImTPuIf4ryAtZiT0QaVyClG3qmj9IAZQ8DTFO/Byj4xQhFQ
	StaQSVyh09cXRITzaNEGUJMhg1Jhu7bPR8muHbA==
X-Gm-Gg: ASbGnct6HIxN104zhzQwp2IHum8hv8TNgqxV/pTMn1KFU6mUiapze/BoStOmvaLOrgN
	C+v1Wn+cmcZNCle7W9S1yeKrSMlmP7oMTa4k=
X-Google-Smtp-Source: AGHT+IGPQzofPCSKwnJOzRNwnbqypQHGaVFPVRHAbVBETWyHajWU00pxqxU268Qgqllb0B6W2GZfn17ZSH3AScx5ITE=
X-Received: by 2002:a17:906:311b:b0:aa6:9217:fcd1 with SMTP id
 a640c23a62f3a-aa692180342mr561378166b.52.1733833423910; Tue, 10 Dec 2024
 04:23:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com> <20241209-qcom-video-iris-v7-14-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-14-05c6bdead47b@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 13:23:33 +0100
Message-ID: <CAEvtbuuObqiXMVeaxHu0LLsT3G4Nr-byMSR2drVQq+S8fN5uVQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/28] media: iris: implement iris v4l2_ctrl_ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

On Mon, 9 Dec 2024 at 13:57, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:

> +static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
> +       {
> +               .cap_id = PROFILE,
> +               .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +               .max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +               .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |

Would it make sense to have
V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH as the maximum as last
item here?
You have this sorting in the LEVEL list below and even here in the
profiles only CONSTRAINED_HIGH is out of order.
I realise this is technically not needed, but I had to go and look it
up in the v4l2 enum to check if CONSTRAINED_HIGH is really bigger than
HIGH and should be listed as .max.

> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +               .value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +               .hfi_id = HFI_PROP_PROFILE,
> +               .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +       },
> +       {
> +               .cap_id = LEVEL,
> +               .min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +               .max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +               .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +               .value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +               .hfi_id = HFI_PROP_LEVEL,
> +               .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +       },

regards
Stefan Schmidt

