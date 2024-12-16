Return-Path: <linux-arm-msm+bounces-42370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D029F38EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 563C01690DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C41E207676;
	Mon, 16 Dec 2024 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hOkYr5T/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E620765F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373716; cv=none; b=D9UwW2HRN+Kfl4Z2XkwCd5K1BytQJlU3zBHn0va+E3Uz+X6JZbbF0TacvgnLTCEOBxTeqrCHL51CcwlVKMoXSozDRamMTH/gI9vOUZf2ShBEEgHt7lKvvjUxoEFhi0kBlohMEitoA73imdTxGrNeVH7Z/pln79IlC5rzdXyKpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373716; c=relaxed/simple;
	bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Z+rW+GOxgZdfxg33VVMAh7PMCaJfWNCAtiiYS7tZLyc2m7dbuZKrHJ+nsve5B08w+iPcuJVdPH47gVTc2Qjoh6x4nNiSDVHTkRoe3Pa7aKQTPzXgpP9uHAfSFUHUpxYeHWvfA4mgm2+PwQgBetoKiwPf0wVPwf4d3wBnJmA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hOkYr5T/; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f27bbe8fc3so23588497b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734373713; x=1734978513; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
        b=hOkYr5T/AwsYx+QG22p1BOaCMSMKSojYwi7DngX1GaPhzd1xAK3x1mpUiVCSfv3bCL
         0nfFLLGkDu9qQV2Hnn/tX6Hp26E96r6OqlIykQw9r4TTvvPJ94HAnw6PjMQgKo3pnpFW
         4M6qw3QgkrXu5XL0Jvb2tSdU8Hq1II0hZfJU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373713; x=1734978513;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
        b=mh7Fd6aQ//ipqIrdZZnDzTbgicNNnCDYKbsX/A3tlWScySnkoJwSa7TBJ/WfkDhVVK
         4uqkYsHA76AQ7A6pONC1aynIwsnsr7Rt2Xj3B2qSy6pAoV08e7VinKZT8p4iFl+ed81j
         75NhUDrJXZubyLlAW0ltgfnZ6Uj7z/r0/2ON5/w/u9Iag8ag8jMh5o/uJnq2eJ2wj/Av
         rXF1Duap+hjTCrMwSYlnJigShnSfDsOWd0+joj5+Nv+xKfHmfZBYPft/KJVFVhnRbL4w
         WQ21M/uyJVaYWe5rXE53NPCETPQoVNt8OgLmTgUqion8Rp+dH64XDn6Dcf9JBA+N+Kj0
         Yyig==
X-Forwarded-Encrypted: i=1; AJvYcCUH2KW/CMaTxiI2fxB9Fgz0WoTemnVCu1SwWXX1wyaZcDKHkajxroMiwuqaThHCGVUxarPD4KHAYnSk8WTB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfk1z0SmRATaKQctA4ej1WzZzEKhIJ7m289OduPWI2w7isJ4D7
	Nz/DC/u7VRdk/zqsIs2zp4BNX+MGmkuBQlbKCzpxCIL9hugfO5mW8D7utmgsZW2nLS/rCtNySo4
	yAu7eVuKl3SUpj3GTth0MAjTkeW7vllkN9vtf
X-Gm-Gg: ASbGnctaLyQHSN+A2utV9WcNpKd1h5l+hK/HEXkQkNwPmZJuXRwfIhhxFTSfOsI4Sey
	H+leUa7dMJ/NOvXcyq8F4vKYTKxGZffczweLzgBsh5vvJCkR42/DW+i/d9HLnzQWbOQ==
X-Google-Smtp-Source: AGHT+IE4CdB36DYH9vipsU7nBQzIha3QX2anHYVsV1wQT8Ge+vTgkTSbipalEX/mJfncpySK3J6yzUz+Iw2WBcHVy54=
X-Received: by 2002:a05:690c:6408:b0:6ef:6d61:c249 with SMTP id
 00721157ae682-6f2bb3a54c2mr8410207b3.39.1734373713619; Mon, 16 Dec 2024
 10:28:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:28:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org> <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:28:32 -0800
Message-ID: <CAE-0n52uH4q5=QbU7V1jvRmvccAWTF1bOSXZ32j2NxKEKQVhMQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-15 14:44:07)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

