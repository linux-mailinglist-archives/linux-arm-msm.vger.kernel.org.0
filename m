Return-Path: <linux-arm-msm+bounces-14843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FB886D86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0763A283CF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F47354730;
	Fri, 22 Mar 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZ1/pBbz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A7E55C08
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114306; cv=none; b=AVjryc/mGrybKZEAVDiHeTC08kFfM+lLA22W+c44N4QJVSEqGOsF0qxN6ta3Nfv1M15QdNtHF2qGuU3yiV+PGgUGLcvC0J/IBhMPC4L2a3MlViy2w8ffQieQD6dbQiNyqW1yi/2DDhWO14hMT/4R+8N5thQfW8PrmKC7HDIu51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114306; c=relaxed/simple;
	bh=Vq7R7pvWoT7nU/n+bLHDA3nkQF/8c8rorqIvMyTQsFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qX2JXiOjibZHpB1FeJzSEeYaJq8CMno4hNN70MhkKWV5EFb+2fpU8G77tTbBYS8AZHUv3js8ufm1NLb3l6PNDzXtm90xIySkma/mfZnYwXeREeWh1Ey0jMsXW2wdS6exLvJPMxs9OHz8VeOCmD1j5AKNl4RkWQFGp8UKXeeSSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZ1/pBbz; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2056430276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711114304; x=1711719104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RYiJWD0Ul0Tt3aXboOB5LN8lg6CYH26yRurRIi/6JpA=;
        b=PZ1/pBbz4Eqclgk8ogjWcfuNy5PDorsU/IuBL5jrlqpDrkIDDF/XJh2eo4AEOz5aNp
         uITPKWvLe5DVkwSO5IG2km67A+9hvIcelHoIqoAL1f8S/jMixWqCFQXesBKXXbLxhLtc
         xvXLRJFAzAAxBkmKWXHOD6DBadT+H1XJf8rtzJqqzXiPrvM/xkGXgVRLinufgDRmkoUF
         2XmGf+A7a9W9F2jU32Rb6dmUzoEGk14vWt0hvhq2osyhlpWBVVpLANHwzFlas4kfDRFC
         dxy8aQ7oIY7F4y4yWEqvpDi6f26GLDfXM3KJt94SyDLgESFfcf7NBaf3RIU7MTF0c1W/
         zWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711114304; x=1711719104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYiJWD0Ul0Tt3aXboOB5LN8lg6CYH26yRurRIi/6JpA=;
        b=CmrTiFWDVbLq/vCGprhov4niBWY12Mbk3XbJOw2k/PZs7h2ceL/PJYb+8D8ZtVGeIP
         VttE1iHMp4I0TLLxXY9wGGlWhQkboOjtwcW59lDFISt1JitPdQcRHxKz6cttp3FQOlM/
         hjL1xOeAHODDnk3QtjLcXgczpmhv4KUDTCJnJA7jcjgzk8Q4EyZh+9CSCHrrSfm2FoQv
         9L7yj5C2cYEHgBbbth5bnlrkWuxKDiCyf+XBqZ3wQohWJ/iRgaxx57rlzCCWV1Rguma+
         7OX/G2km6ckHRBqb0yGNThiqRsB8utFsC/ECOcSIabj8FlubPslmEN1YP3mk0K5pWCAX
         sHiA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrxjbcW5JMaJgunMk8lNtq6RdovG5zZhMq+3z1/ogHFw3gsg9hWhl9tMaFw5Ryx6jTxaLT5qAv7yg6FCtMgbwdktlw+IrqpTB6TuPpA==
X-Gm-Message-State: AOJu0Yzjtw3oVw5AnNjB6qltUEhtccNlczQ95F3zTWXDNDOlsZ/A04ma
	9s6tJSsJbHOKxdHZiwX7BuZlbtM1o/3b4Bf84gf7haQ7DsCbJ29HCl0Flb+FkBNJr32PZOriHGr
	rvOUf3ivnbX/f+PsRwiBklm6xpz71xuKCOTwoWg==
X-Google-Smtp-Source: AGHT+IHSXoHBI+Zx3QkDSlxZKvtx9N74kcEcV/jBAp/cCjwxO+4WHNHkjLOfHtiJnTJ2hbqDQdUPCSB4SW25TLNmrDU=
X-Received: by 2002:a25:83cd:0:b0:dc6:ff32:aae2 with SMTP id
 v13-20020a2583cd000000b00dc6ff32aae2mr1825871ybm.63.1711114303943; Fri, 22
 Mar 2024 06:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-2-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-2-af14c29af665@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:31:32 +0200
Message-ID: <CAA8EJppwhaZhee63hxvfbEc3RLT3rvHr6j35G3u6qU+HFzb_aQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dp: Add support for the X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set based on the presence of the panel node in DT.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

-
With best wishes
Dmitry

