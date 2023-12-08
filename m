Return-Path: <linux-arm-msm+bounces-3925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944B80A1E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B5528187D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC6112B9F;
	Fri,  8 Dec 2023 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI9UmczH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9097B122
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:11:56 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-db7d198e791so1997584276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702033916; x=1702638716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5sTiUJetif/fgYO2zq3XsvRjD/RlEkJTpjxX1dPW9o=;
        b=FI9UmczH+EOkyJ9SmpY8NjmlO9WMp4nc5kX0QGlmMgSgsvJ5zz9EqRYQJP7R7ycegJ
         O0mowC1pIBhhSD6995KWu0XC06qlwPvyxtObE8xfBl/AqhXvksEaI235BuHc48+DPF9o
         C7p9O5duCemIcyXLGVQQLh7EW0NhYf8uFdywN7OvSRXbyxKuGdFywp3gUxd9QZ3DKNml
         jBmqH64mVATFI6By2Y86ox0w0mg38HCR30jwqCOpAfNjhhRdJnyxE7Ivgek1r0ACNwbV
         YiIpOptEEvxEE/irX52WPsQxZm94HCv9qoAYYwCm1UV2vQpO2rF0AwpVWCznMzc5tPdV
         YrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702033916; x=1702638716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5sTiUJetif/fgYO2zq3XsvRjD/RlEkJTpjxX1dPW9o=;
        b=KbVchifGwuqwr6hfrAfmYQbmEBrWf4dFb7CMK7sgp4s8uvkIVwdhNB8Ez6JL+d7MY9
         HRNcjJZ1oPreBWcJ5nnsJjEXqswcRLbkoiQ9IsXVCmPVg8RWD/BxPMkUinAilcMeLnk/
         gP2ob178ig2j/PlKafgqEyGEqVkvaxt0hznlvmsZajP3rRUK4ZK48z0kuy8NFEJF8EHj
         6AiRnq/rYIflYu73SU6cDnGol1FpXshr2OGSm6kUdRkWmQKNYaDuMxXqf5XN/pt5MwM4
         V0r9qmZ/qZ3Xwqmr60JKJ+18JxXncWDrWjSqU6KQwf8Jry+0jSXQ9/mA8Dk8WSgL1Wka
         4geg==
X-Gm-Message-State: AOJu0YwGRjRFLYEYrfn5KPR02mOLK6n/ygO2ey8hcBMG8Lu8yBJZ286G
	rp4xn6n9wCELs4BKxSjMNZP7dhboER9Q9uDUKwDSfrV4Dqkn07zt1Tc=
X-Google-Smtp-Source: AGHT+IGadWRb7RLKWnHwQIGRXCckpkVS7uf7R7LgUD+cmDd+xOtJ0ovssIG5r2vaLiyKiudQIHYP9pqYEOJNDQwjEx0=
X-Received: by 2002:a81:ae01:0:b0:5d0:aa04:7b71 with SMTP id
 m1-20020a81ae01000000b005d0aa047b71mr3251777ywh.24.1702033915757; Fri, 08 Dec
 2023 03:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:11:44 +0200
Message-ID: <CAA8EJpqaZc7xB8Jb8uweKZHgLRb8SBtEN_rUCxWAK_u7hW8H-A@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] drm/msm/dpu: fix writeback programming for YUV cases
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For YUV cases, setting the required format bits was missed
> out in the register programming. Lets fix it now in preparation
> of adding YUV formats support for writeback.
>
> changes in v2:
>     - dropped the fixes tag as its not a fix but adding
>       new functionality
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

