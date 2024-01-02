Return-Path: <linux-arm-msm+bounces-6230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E77821ACD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 12:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BDC8B20C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 11:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48BADF58;
	Tue,  2 Jan 2024 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tz32HQYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDADF4F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e784ce9bb8so69174897b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704194393; x=1704799193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RoCKJmLNypuO4iV/d5JKlLOsOW1MONyGLn7Yes5k0vo=;
        b=tz32HQYQVbZ2HN3UzqvYXbOK0zZi2Z3DXTWybMhheUxmbYx1KStvWRQwLwFxROwxHQ
         vGhTcbpbckGF8UonS12mCk4GZ3RvUVcZ7ejavo906iJLrLyz5Ey6LqzCgh+j26M2oArT
         C7xdS0Y0B0KT/p/Rrdzn0nqJM84KOCC81qYX0jKAYqenKKgf6oUPXevzOzlKLf40R0Kb
         zp1RbnbRD5yjquSc3pIwtU6PnqXKBvWk8lQSA6ct3PDoIPKZp56T/p21j7cVXRukxWru
         NL+g/v/jNTY6zBw1QSgPG+2UiK2whREekej1W7+qvnkwZviag41NwT/ajOuZOWf9sXHR
         B/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704194393; x=1704799193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoCKJmLNypuO4iV/d5JKlLOsOW1MONyGLn7Yes5k0vo=;
        b=YPUI9asaF2bd1tXz3uzEzLyXET+1FgET5jjvR1Vd2jpgUZsnfBkJ61fGN2OO9DT93l
         k4TAZBOSty8oVO1IEZozN+bN/N3V0YzMUPws01PJAPNzZLXk/BYayw3EhQ0LrmX/abRj
         N/Bqi0rK5pI6Hg82eWGeEySosCvr0IQC7+kQ/ise13AQl0P4s5g1DdCzWUqKXlosCQ//
         upiUc9lYOicPqu9eS5tXbdOtQyD7eAa2MGL7aKa0B+MoipgBAu3XtUkGD9RQM4pk2Knf
         jlmFWJIypQMdgnthccraIqwYL+ucQCJDs1Lzr07KeW++HmRJx+K5yXQM7DbOUrKBFMsG
         n91A==
X-Gm-Message-State: AOJu0Ywb2kRNtooNtyUBH8tiEfkm7jTUTkYwGHLjAfdL0e6RIS4hByoH
	eCFGywoV+MwW4pdlZ+hFHfvn9Uwj5cLPaztqm7+ilImJ6Ir2BA==
X-Google-Smtp-Source: AGHT+IFrAuQNhlzlRQsyHyk5pUdcHgqhtVaR49+5kjXKeJirtWfRLQHeIOnR8NY/b/Nj/rCyLUP0Qobi4YuaFwRqXoI=
X-Received: by 2002:a81:5fc1:0:b0:5d3:66ad:f8f6 with SMTP id
 t184-20020a815fc1000000b005d366adf8f6mr11600270ywb.24.1704194393450; Tue, 02
 Jan 2024 03:19:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229121504.3479594-1-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20231229121504.3479594-1-himanshu.bhavani@siliconsignals.io>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Jan 2024 13:19:42 +0200
Message-ID: <CAA8EJpp7XOxk3xuUzzuF+omMaQXUeeL_gm7ipFEwv+bfHdONMA@mail.gmail.com>
Subject: Re: [PATCH] media: venus: use div64_u64() instead of do_div()
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mchehab@kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Dec 2023 at 14:16, Himanshu Bhavani
<himanshu.bhavani@siliconsignals.io> wrote:
>
> do_div() does a 64-by-32 division.
> When the divisor is u64, do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.
>
> fix do_div.cocci warning:
> do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 44b13696cf82..81853eb2993a 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -409,13 +409,13 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>         out->capability = V4L2_CAP_TIMEPERFRAME;
>
>         us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> -       do_div(us_per_frame, timeperframe->denominator);
> +       div64_u64(us_per_frame, timeperframe->denominator);

NAK! This is completely incorrect. do_div() is a macro and it changes
the first argument. div64_u64 is a function, which returns the result
instead of changing the first argument.

Please consider checking the code before sending a patch.

>
>         if (!us_per_frame)
>                 return -EINVAL;
>
>         fps = (u64)USEC_PER_SEC;
> -       do_div(fps, us_per_frame);
> +       div64_u64(fps, us_per_frame);
>
>         inst->timeperframe = *timeperframe;
>         inst->fps = fps;
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

