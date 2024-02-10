Return-Path: <linux-arm-msm+bounces-10494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC248503B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BF61F24285
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8624214;
	Sat, 10 Feb 2024 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KCWr0ARK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9D2B9CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707557882; cv=none; b=eLceauBE0VjJ0WrEKU4wGrULMsXkymEXu0F8mgUT3a7Ja5PJviDRCKwCyNE3SaEsB/GLorlUec5OrAoBbtK4l0D8CdDnOGKSaIc1alU0GU6FaUtgReuwudtbmdveV4gSpGodpeY8Q+NpMpEuPgeomZD7RkYX55XtzI/tVjBhJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707557882; c=relaxed/simple;
	bh=n4JdiOrW/ojZs9rD4FCXY9+yjgY1gUrku4Gy58HAXfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Whe82LdNDqJ7xIqyvPapdAX8sRUsbDVGWPOvId2Y7tYwyq5N9UbBq8p6f+x1a2Q1L44zB2BwRBiR966TUL/MT7aU19OtJmnpNcq97sZdIAWy0mVoqBvm7xNDlSlqCM66fqj1Z3iizovRU4OZAL5upCECT8kvTPrB84r0z4RSBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCWr0ARK; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2036703276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707557879; x=1708162679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kyj3Aremed/KUNAD4OBb57Mrn+FOkbsCPQxNdDwPeyo=;
        b=KCWr0ARK5pEWaeAEVNNOLzG8R18egl7v6iI0PInzBMvVAaWojlCVVBVdfg0C8zTNui
         convdBtZckqMpobbGNO0l7KqMYAM0hX02FJOyD4/S5O0toy+tKZA5J81WMd2U2oo3RJK
         3Vw1V2hW7CzTQAKgsF9DYaD/iqaCX0Npx9VKOYvmjG+atBTfLpca5M9hWz2NWSzP6EA4
         FULbMddshEuyfZWcWD0e3LX1SwwD65loWY5qrsC2Tez2OtDZoyNMjDiHxkU7DDJJ8ASz
         ZMQGxRXR2FPBhsWdtqHnpKA0PN4PATmDaWinefG4hJaQyuTTVUGrA11wNX9HW3S5x82k
         FLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707557879; x=1708162679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyj3Aremed/KUNAD4OBb57Mrn+FOkbsCPQxNdDwPeyo=;
        b=Tqm67XNj21WtK6pyGhUeZ5uNL6RFgTE4MoVrQq98TNj8YkY1DOAr/WDj07d1V+iaUb
         aWFHuldfAAiTYDRB+jVGLYQcdSCQ0CnTeITfqr5GS8Obt+xzX99hKRkVhtPK7EBZQR+d
         I0dE5lwpSpNbuetWMwnf9paLOhMyMjEfhGS6wPbqyQfiN3Stz+rNuWcWw3wjJI+H8dRs
         qnSt3iW/lIY6zwz6p/4mdudSkdqs+hK90FIah5pmi89D5RUa7y3w0ZxWt8itrrVo1v6F
         LaU8mK6iPoJBx9KgAWFZZzsOBASGV9jIfhgwg6A4ZpJSx8BqGPgF6KAU8A3RYbKknN27
         mTGA==
X-Gm-Message-State: AOJu0YyUq9dT0rwln+pejTiXGhoJ3dhSHzUpwsUge80Sq9vpM7OLvt4H
	IkMNfCxfuqzIf+r3lopNHjI6XJ/BUTB0IvBMPhmGu0KhiQ4uX4njE4zk/CpUH4353NvRbiQlAcC
	nJ00fvSjgaQTS6BzqWgySmy3mTqFK5Z9U+AkXkQ==
X-Google-Smtp-Source: AGHT+IFzkw+SzWXsqTHkTtPzsujNkNWObNd/pIokqsm8EQCoFnl3SfEdRL3myAU8AAkxJJuSGr74rCS8KR2nL86w9Nk=
X-Received: by 2002:a25:3623:0:b0:dc6:6d0f:8329 with SMTP id
 d35-20020a253623000000b00dc66d0f8329mr1116788yba.20.1707557879528; Sat, 10
 Feb 2024 01:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-4-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-4-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:37:48 +0200
Message-ID: <CAA8EJpoDHLcCHPoDj0QF4CWsLtz=B7DDgkaF=s=aew_5JBPkeg@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] drm/msm/dpu: pass mode dimensions instead of fb
 size in CDM setup
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Modify the output width and height parameters of hw_cdm to utilize the
> physical encoder's data instead of obtaining the information from the
> framebuffer. CDM is to be set up to utilize the actual output data since
> at CDM setup, there is no difference between the two sources.
>
> Changes in v2:
>         - Move the modification of the dimensions for CDM setup to this
>           new patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry

