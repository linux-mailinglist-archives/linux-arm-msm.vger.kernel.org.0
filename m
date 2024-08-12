Return-Path: <linux-arm-msm+bounces-28340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD0694F6D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57B6828681D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505DE18C346;
	Mon, 12 Aug 2024 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ld2z0lQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FF218A6DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488028; cv=none; b=FqqXibSx8mpQ271fw0DyzkO6E7nn9QtySxx4xZs7+OLB/t2YOg3k4hjF3f4jA//txDg5lAtLA7o5cM9QEvtIaWIHidSVsRFVlQ8nNxlaT1kYyJTDIJCp3ABbOCmE6v/fwXAkMDcF/Xn6y20YCo/Lv7omz3UpLb/A1g59mc/O4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488028; c=relaxed/simple;
	bh=yR2eCKJ/RHBhyH8Cf47wO0mAudZSl9NhHhiDZQiRmtE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvD8Pk33TziwAtEEv4IxF6ghpajm/6VbTTzlkmQp6qzg2WdP3KIV+bETsnZ5YpQrEY9msfUc9gnXanJX8U8A97V/PN8kZ89YWSQw3/Ah6et+xEqgvikVnSGjliJFu7JfjgU+0rdz2xXiy4GBdADo4yDhxN5Ii3TNKBI0UWIraZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ld2z0lQ6; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a4df9dc885so45152785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723488025; x=1724092825; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
        b=ld2z0lQ63qds7cIT2dBGqOFuUufyq/2SHFPaFCg5ZRShnLyFJva7YyCWXfnLxzlX8Q
         bmniBo/uTSQUmf1LnJJXEXOB2XKeOyAz/WlYf9nq1tqAS3NyKugO0DAsFCl5k08y/zUX
         NnTAnmCzpEeQflSCQTgBPTb/9+0vrlVbFbyYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723488025; x=1724092825;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
        b=ecnxInUcAz8hjB+zZ7/SFbSsCm99wiNwBXs4RbFBRQjxVQ8zLf+I4kVgPYP2Lc/RhN
         BT3k3p8c2b0Fjmx6jPwydx6l7G9t3OxRsCNxMWJ5FaeYamAuzvrnlqZ0JNMVIfoBQKv5
         OHhK6nOVBNi1UPTi61ibhntIaaysGUK6i2ymMZgG3kYweakEeQ28tEDyfUBIivEf6BPr
         3iz5B3Wj4joDWlId9MNWjlkwzalsK85eKQZiA8P6z5lZGcjdmVNdOJpYYtUO4pNhs9bd
         N/HRCpbdO/WtdJpiMkPKBlmek1fO0zTN/WIZXOrh5ozHnoP2zlysQkqwQ5NUR8KXEFGw
         IN4g==
X-Forwarded-Encrypted: i=1; AJvYcCUIb74uf+JzeahPz4+TQ/C3xKtvftvWIFaed0wTN40QULoS7ZKO6JhGVLcD78lg0PPPvE2b4idv5YypqeEpozwC0EFexzkjKfwQr6aumw==
X-Gm-Message-State: AOJu0YzcmYHgYLVAo7okk9fz8imKncxJcICWtlFFg0LuJ4v6azQukmet
	aEcosT5/9bTsmLomGU5umStteqCv6uYoIPsty+4wGc0EpBhuJK9CuDTkUEsS9BQ8uW4M3EwtHOr
	k7zuum63+vsXwSUUDxKZX9OMOni4RatEdfrLZ
X-Google-Smtp-Source: AGHT+IHU7T7mETTa8o0eIAERX5Q/cpE4El91Q1zKhqhAZWti96HazCD976i3q3JmtZLa+HkARhuwHJyq8saSXRwQcCA=
X-Received: by 2002:a05:620a:40d2:b0:79c:1178:dc9d with SMTP id
 af79cd13be357-7a4e38410c4mr94180385a.24.1723488025574; Mon, 12 Aug 2024
 11:40:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 11:40:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 11:40:25 -0700
Message-ID: <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
	dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-08-08 16:52:27)
> sc7180 programs the ubwc settings as 0x1e as that would mean a
> highest bank bit of 14 which matches what the GPU sets as well.
>
> However, the highest_bank_bit field of the msm_mdss_data which is
> being used to program the SSPP's fetch configuration is programmed
> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>
> Fix the highest bank bit field used for the SSPP to match the mdss
> and gpu settings.
>
> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index d90b9471ba6f..faa88fd6eb4d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
>         .ubwc_enc_version = UBWC_2_0,
>         .ubwc_dec_version = UBWC_2_0,
>         .ubwc_static = 0x1e,
> -       .highest_bank_bit = 0x3,
> +       .highest_bank_bit = 0x1,

Usually when I see hex it's because there's a mask. This isn't a mask
though? Can it just be '1'?

