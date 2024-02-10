Return-Path: <linux-arm-msm+bounces-10508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B1850435
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 12:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85F351C20928
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A154B3D54D;
	Sat, 10 Feb 2024 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7pwxNXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1393D549
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564692; cv=none; b=t+gxy6q5SXStZ6hmvYP/9+bgbaIZmt2DVpzKSF79TlWS+cyu316VjRtbpnhm2diqzqeVha9HJ/82cDKIQk/rqMnWx6wqnzP8iK4VIfra90b9GVAdi+XCXTMWwz2coJv8uAXft4xtTR0+ur3GGYTlQ8Gs3N6PUov+KOdODeFJeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564692; c=relaxed/simple;
	bh=Q8ZjEU5gQhILPe1JtVmsWq/b3MzzjRMT4VPJSlfaKfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vhqn2B4ZOvFEgjBfcdZXZ3GPW7JGZqQ8Zgd7Nh8jH2zp7BBFxM+3cxgM7JOC94ag/ik6ui9x4zJXqS4H9mJ1ftRwchstxUZ7b9gA8M3SpQhXIkrbAbtZpTfD/wDPslgRKGJb5/axavodUzjQq0+scM2n8liHLIO5H0vv0p18GqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7pwxNXU; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bff204fad4so832902b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707564690; x=1708169490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
        b=h7pwxNXUlZ0asNs9RLSJprDH4l6vdjW/92BiG7z+zNHChXoxIVBwcAKZcbeadxdizN
         w+2jPl2So8mKx5PFCpPVS3TsA0PMh/UoJ0jWp4sB/58af2co7J9OwgJz69Tm58uMBJhD
         lqlF4vKZ2Jwt4FTTZKq8DJQMiWuezYw2BcTNVgxgWzjdimAQ6FaI1lcHZl4ykoazbDTG
         vMbNPCSb79/UaJqSlDG7H01z+bZqQnTegoyKzYYY5qZU6SnZ2X8xIlpusYS8krPkipwk
         HAChwPAXZhoRvwi4CS1uSFnM4aXntdmJ2XrBZGLV5SGhSVFZPPEH8pgJeG1wxuW737Hv
         OZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707564690; x=1708169490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
        b=dZ95QC1xtBt/+CQH6RJFeEHPn46bEbmZFfg9XEkKg5U3Z9/qxJLvon8+J2nOhmdeNZ
         KDpdUl8tk0oK46opCwfBVxdQFAgzi44c/tPExE9VPKeRq+nGz/eXOh154/valpBlgiXx
         JqSh8jrH5gTXNE8bsz7JcB0uwSx47rlhjTANI9loT83YqxSZivg+nob++yHwCcHtyIPq
         kYZ3H2s/0XNAdKSX0iTyTa4jM8nuW4vHghDDzmvSoQCFT2a0uUhdId6oJ/+dFE0v+UZq
         I5NOtfsy9BfvJoXhfpqk+aB+tqu62/0B/RY2M+dmfGFKVHcclQmE3iEJcXBiHN8INbmR
         tj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4ApcaP4XEqgxlaUAaPhFLWIpr7B7rV+FdHhInOjDUn4ib81cYRbIeONgAEOrpykOT8rB5bUyXSxJohgHMZNJ+23DPMhdf4qvN20U/Bw==
X-Gm-Message-State: AOJu0YyQmZivdmsHAPAvu5Xqyt8Rc5n+sPaJTjD3vsNkYebN8Gi/vq4J
	K3Qb8cNIhgvD9oMK481bOXTOMN/PoPFkv9XbP1zzeqMxEuVOpU4mQqr+jhCY3hymp6RMo9GNBgl
	YbC+WfJtTf65uAcGhFR8vdPDyvOqyKoBKyWbtcg==
X-Google-Smtp-Source: AGHT+IEwbU4Urd+epmxc0Oq7zQyb2ah5l24AnSJhfOyIVqyt2jvHOugDdn5MyWEy7q3O4vfsPa7YZCHwU1rvF2/qAyg=
X-Received: by 2002:a05:6358:199e:b0:178:8cc8:4c7b with SMTP id
 v30-20020a056358199e00b001788cc84c7bmr3127825rwn.24.1707564689944; Sat, 10
 Feb 2024 03:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-19-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-19-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:31:18 +0200
Message-ID: <CAA8EJppnT2Rfi8R0yiSwD8TJCw9JS4Q4sVrgUjYg36qMTr85EQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] drm/msm/dpu: reserve CDM blocks for DP if mode
 is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
> reservation only works for writeback and DP if the format is YUV420. But
> this can be easily extented to other YUV formats for DP.
>
> Changes in v2:
>         - Minor code simplification
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

