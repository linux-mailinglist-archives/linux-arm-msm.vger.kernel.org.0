Return-Path: <linux-arm-msm+bounces-41340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD19EB62F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B22280C0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49F11BBBFE;
	Tue, 10 Dec 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ta+vKn2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22BA1AAA1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847850; cv=none; b=uyjVaO0hiCpzxRtC8ZSrgFCmD3pO6zLFgG63L50ioCo3XWgmF24VnFjuo7p3+QvBx2MJDeAKHcjZPvffmaawtTaI5ok8jaGVmemWNhomhod/tcMMvIviFVP8YfQRP9tNA5jirBjFyLWuRyXaLXW/ffmOLmgx+RQzEFYd1itvF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847850; c=relaxed/simple;
	bh=lqZ6jfWQv518JCCW7cIDrKpuYmAnQVHmRlFDMQF5Ifg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8hSyZkZ/dQkVF+KQtkhfLHkdRf4M6zDGU2YYmP8YBMd6vP9sTegp+xEpMF1E9Jfyl7ObqnTXTGpXmfzeEDJxNfY395ybdTQBQzXAuWTBIcO+v+5uAdk7+a4RijfLEPWFe2jmk9Rl9kEwxmm6TIhuRayc3VunMLLqVXS22zQSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ta+vKn2r; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6a618981eso145139566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733847847; x=1734452647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Zl6mnBjiQBNeF1Q3VMTAkh1KaygVJextd08NrJPLQ=;
        b=Ta+vKn2r6vus4DWqB4e7Mp2tp0yqU5NWY5BVE9UuqdXHqRjo193jP7ZZVYRL3wYqQa
         KACoAFyF6kE3oERfdu8r3Re3yb2CzH1IjWeLAuYzay7bypjBE6Ax4hV7nI5hCOkK0cn2
         TAdzpdqZtQwflhVCn4WlDPXNgzOstm8lYyEjb/S+4DHUFOQqWb0Uc9Ial65LSsUhHbfp
         +x2gkiNGziimVWfjhqnt3WVxGSwBOyyj/i0UmEGUhT0LC/a9jnD6Xr3pb3DC1DUf7xAW
         i0sy2kNugbSn7ufck5Ei4FpZjB7kgN91MN1fAtvviXVe/5pq3WWF0WbIZJSTqJ5SxDkA
         TjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847847; x=1734452647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1Zl6mnBjiQBNeF1Q3VMTAkh1KaygVJextd08NrJPLQ=;
        b=Q8TViPGr4XAscNoCErMChcWztPRV1yGA1F9kAtVRrJRA5hnzx3tFPww+bzwvU7IFEP
         Msp8GfXFYryt2SzHtXXJ+0lgpOT3tq8w8QXJALkppoEEQCU7oQZ3QFX6+GMZU0B8JY5E
         Pq+jn0QsqJzQ+TTvBeHrCTdcK8GOsQ5B6uwnUNw8CEK7J0bRRaaipSGv0VpdcCqcBzt2
         n9VaVEYwI/h7LT7O8belHkT2xVjVtJv4izpGF30WivXLuGxJIlqtRdQUi+725Dwvjl7l
         JUuXUYlXMfbudGht+Q2gQGmI6lbVDbGOjC4bd93254ZbpcPoN4Swspk94kD+tFBVWN+n
         Y85w==
X-Forwarded-Encrypted: i=1; AJvYcCVDAfVbtdC9dV7/gwjfwoMqZPiVZ1kBSspqZfKlm+W4/uoWk/FptCx8mvmhxBQ+1PVKyEaOjyA++fMo9SKv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16jKUxAsiy6Z+RZOcqQam//5fycGCdIjy+X5sRwzqONKAR8DM
	w3r53IXeMkLuyHAH8B53ekicLVyfYM8/OvxhVfdZ5l5ACnMRptcCjDosICdTu7/4xygRq205XGX
	L9AVw2h+G2J+eunX4AIflkU/HoyEsC8fl4ypYAw==
X-Gm-Gg: ASbGncvw9ims3KYV9OJs2IGfJoXNTQgGOB+iHzZl7Eznn4cBUpbnXTolLmDyG+3S46T
	8eAB3y6URSVAc+UfGHFyWoJKjx+02XrgXPYQ=
X-Google-Smtp-Source: AGHT+IEDe+ZlasDaSk7kkMNC2p4PajKO8n+r9pHmoj0mnmgFy9RuiKu/RGzpGKCUoMbkgvfshlUA8vwl2fXnyVlspYY=
X-Received: by 2002:a17:907:6ea0:b0:aa6:7285:469b with SMTP id
 a640c23a62f3a-aa69cd5c6cdmr593652366b.18.1733847847098; Tue, 10 Dec 2024
 08:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com> <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 17:23:56 +0100
Message-ID: <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of SM8250 SoC
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hello Dikshita,

On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Initialize the platform data and enable video driver probe of SM8250
> SoC. Add a kernel param to select between venus and iris drivers for
> platforms supported by both drivers, for ex: SM8250.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

[...]

> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  {
>         switch (id) {
> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> +               return DEBLOCK;
>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>                 return PROFILE;
>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>                 return 0;
>
>         switch (cap_id) {
> +       case DEBLOCK:
> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>         case PROFILE:

The handling for DEBLOCK does not seem to be part of the SM8250
enablement. Or did I miss something?
It seems they should be part of a different patch that makes use of
the DEBLOCK cap.

regards
Stefan Schmidt

