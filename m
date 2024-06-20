Return-Path: <linux-arm-msm+bounces-23358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817A91057F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E691F21132
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778A01AD491;
	Thu, 20 Jun 2024 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWxDCUz+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0721AD9D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888940; cv=none; b=OUDeeENnr928T0aWvMYIfY7HVictr5ZNEdbjH6YMC3Gs6wRB5whsvmQbsagZBjT7hhGs0zzTk7N42fIRpp1kakZkO4sCQzSzzYgYEg2I0K9ngJQR5ybqlC44Kqe5gw9LAlkcOuPKs+jjlr7qkmZV+7f1TecxFJFrbWC4t2HaJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888940; c=relaxed/simple;
	bh=sfXjvBqDDHSw5TrUOBI7FG/4AwGxPc0AOMg3/nRC494=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XszI8rQJ4kQ8+qxbLcwyiySUn0Y7/Z9wWwmiN5fmH3+jw2rJ1j1xQDp1orLeR6aww3XaxvQP24Upmf6Hu2Rq0KBNB/pr/Fd2FGWPhTHZ5LyJR+tMrlvpXEjPrsV7KYwu0j2z0Z9f2/zDGQObxxpvK7Yv6j6rgGnn3wjJi496bxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWxDCUz+; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5baeab9fd60so340621eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718888938; x=1719493738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
        b=EWxDCUz+bsbKksQE1lSF4rTjhraX7FpfkuG9RFlS29iMgOvt7kJmsy45SSHz2EEfMc
         k9l68Jjs1gwCeNNo/HREIRSOy5xP5h98w/zFTZkReD1VET4pkJPsBQrL7dRRNOcxYkG8
         O1BrBQ0ZfwZqc98WwjlQur2XRJ6B/SU/fNwPQAGuklBxbz7lqEWYYr5psVA81ojWYky8
         jWq/PJEGSp9Gr1oGnpAkMPt4HpvsdcgKbyOFmgbUCNH8MhUrw6SSI9bQxdJCPeEKBT1K
         FrRgkMcKGIH8aIZsSygasfeE3p14RssawIwcYBcOdMKwJkaJXjeGWE1bXkj/FMWdbSxs
         NVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888938; x=1719493738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
        b=NyQMQ5QdXTVRXUh7TilOmKL/m8DLEsH76NtfMrMtEQkgbq141u4hRKRMKQSF8zgurj
         EKC26tuA/HxZrih560LGTbJWRJ4VIrM5GZ9ECx1JNg6o5We6k2Pj+xcn2WxGSJYjlZ54
         M9+PUS9YiZtO5RlY8we3SfRJXgM4WFUwqsHiSpnxLTU6Nzu1qooV+87+cftFvbW+dPRa
         VYIydYYG/tksAbCXBND0yvyAkuzya4y3k7wQnc72OtEKyIZMfVHCBXX8/Wgal7cmDTsJ
         crL44qqDC2hdi0P7N07q0t2RX1P2rrKHPnECIqTZkZzxuK2Me4pHpwtNMx4l+/RV6rVH
         1V8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk07nnzfRyghy0XEq/QJ8CKXBkQNo1GRdkRdrYPJFjKbRPsvN0kSpN6Lg5QOrO0ivJuDCeUwSuhUJncd397TNfkKjUIDtYXzwS733ABg==
X-Gm-Message-State: AOJu0YyioPuPf95ubcQZwqjG3NmuriO/Nm5pndfISVSNakAUcMbYc3Iv
	9RRBYoIKnuQtdfpYG8Rl+ai/jmVyT4w9FpKc8CGH2X5oKz8PrV7NPIqDuRrIySHcFHEYkNsz/OQ
	jEC4Hy+QeR60/r6PuVAoZZJsd1V6+PDOb+WG+/w==
X-Google-Smtp-Source: AGHT+IF/yD+0GZN6cAxps+FA6XiCIOAiMvgRzsPW3OFiThohVo42Hf9KaLzzZhArPsljy8CiIl3TpYiqk9Wxxenp9Vg=
X-Received: by 2002:a05:6358:8096:b0:199:432b:821b with SMTP id
 e5c5f4694b2df-1a1fd49a301mr606688455d.17.1718888935830; Thu, 20 Jun 2024
 06:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 16:08:44 +0300
Message-ID: <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
> the ops are assigned causing discrepancy between its callers where the
> checks are performed and the API itself which does not.
>
> Two approaches can be taken: either drop the checks even in the caller
> OR add the checks even in dpu_encoder_helper_phys_cleanup().
>
> Adopt the latter approach as ctl ops are assigned revision based so may not
> be always assigned.

NAK, these calls are always assigned. Please make sure that they are
documented as required and drop offending checks.

>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 708657598cce..7f7e6d4e974b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>         if (ctl->ops.reset_intf_cfg)
>                 ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>
> -       ctl->ops.trigger_flush(ctl);
> -       ctl->ops.trigger_start(ctl);
> -       ctl->ops.clear_pending_flush(ctl);
> +       if (ctl->ops.trigger_flush)
> +               ctl->ops.trigger_flush(ctl);
> +       if (ctl->ops.trigger_start)
> +               ctl->ops.trigger_start(ctl);
> +       if (ctl->ops.clear_pending_flush)
> +               ctl->ops.clear_pending_flush(ctl);
>  }
>
>  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> --
> 2.44.0
>


-- 
With best wishes
Dmitry

