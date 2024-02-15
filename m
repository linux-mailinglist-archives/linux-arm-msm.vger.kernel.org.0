Return-Path: <linux-arm-msm+bounces-11147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C6855D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6BC628DD36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241391C686;
	Thu, 15 Feb 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jiz7pwMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E091C2BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707987374; cv=none; b=CPM5TwbOSTkBJ9pfG5l3DMIgr/I2xl/AGAe4wG9UVvlBf2mz69WzWfHkT7XtwwFZbK121a0Fohqgk6ysmkv9S2e1wy9BIBz4n6R4DWubrhgJyCnDB44SBTT6myycQnjMRefsLsdgKTOOG221DzJOO+5nQModhkaTupvq4IaxWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707987374; c=relaxed/simple;
	bh=yxQbmZTo8wuNiSZlyLJM0ccLI+PzcqkStsD2kSw5uak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7MrkZIRwks0zns3CL4rrhkK6bjCfqymW9QWnHVCtrgR78qu3RIz3KUSTbxIMrlzjiRZcXjnjdfrDHJbqndH7dMLoTj6A5vPkv7hmV7oAlIJaY5311cZqwuIPDTf7w6beQA6lY8nOzPQLoyAijmCOiQlYt/0Axopm9lV//X0OHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jiz7pwMR; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso404317276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707987371; x=1708592171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs4SETNb1lvqVZ8gWpZC/Rt9HqyJWvbYB6LQacF0iGM=;
        b=Jiz7pwMRkgAhHz2KhORYiB6q4N6JEXvhNfNeRBcmr5NiOMiS/M40WNK2jZ6mjtu15a
         RqIrEXxQY88qNlF2x/n11ViTQctGsj1Hxno2d9KC+XJsVBG54meVchxQ6s1PUyJbFf/2
         1sAwMGQa6iv29VO07ONYIVA2yvzsqdORzHO8I2SQE3IHN3CYW3q57nwS0C7MBSUEvNdC
         OvwjPDbzfL07D8/RsKU+JJG/lJ0iViw+7z+gds4unoSLdP0tj7OrgATfwfBx9ngREVyh
         FSJ6aSMCpXNdP/a8F9+mpFaN19kPyxVyaV7hfpfyQiB/VEkdGoKKb6FFvXMFtchcn5lQ
         XGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707987371; x=1708592171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs4SETNb1lvqVZ8gWpZC/Rt9HqyJWvbYB6LQacF0iGM=;
        b=tYQ/VoLIXzXLI10BABLJGdLIio6ZcaSaFF9YIDvrWghi5LLr1PAek0qlxp3yVfZqeQ
         wT7pnw7xK+fuqebc9A2YiiYKPPOVqP/K2rJ6/sjebMXTgpjSWcw9/qOVclVOHQRHO8OO
         a4z8wLCRLG4y+P913MB2LDvhcWlMqkK+nMUxFkfCqAzdDt1jgnbsXj5r5/vRd4VFuzT1
         AxvZvAI4EOgslV0hcrZ/tnVOfCDkcU7ux7BcT1w0VvBL8iIwHDa2HCL1ICwynuQAFI1v
         rEyG1gJKKrZuGHfJP5l9099fEm0NLYwqUYMgUnOptRUNtDqo0+InAi++dyjXB68SGMQd
         w/mg==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ8eUByhADrJFz0f9ggWPYwI9Bfuw7B/gds2zLT5YsjeByhydNxLjhBpwsj1kIO6bLm/EuIHD1UurOiMw6t/OZrPhG/dNQvPqIWPmRQ==
X-Gm-Message-State: AOJu0YwJHtSNkfDuKQ/u9QuDeDOOiQOWKn1hqp6oSb6Q3iNIHFAYQZBL
	15O1P1sMZ+NLgRlt/rOvi7vwvpd4dAH72niO+Jsp4tLDKrNLyQL1aq6qfHLyn7LX6adsA1zIWPr
	SYHZqQoYvQL8uBIQV6afYZ/x7VAgKpur84smthA==
X-Google-Smtp-Source: AGHT+IHHRlxCdvGNha4XCXxq2zUtJjoqVlUr8oWoPF6SvyMgi8dq/k3AKGlE3v79seUFy5PqY7Z4u85rCS9NwbgpEd4=
X-Received: by 2002:a25:b124:0:b0:dbc:decf:e511 with SMTP id
 g36-20020a25b124000000b00dbcdecfe511mr927285ybj.6.1707987371322; Thu, 15 Feb
 2024 00:56:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com> <20240214180347.1399-3-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:56:01 +0200
Message-ID: <CAA8EJpoCYvz5Ucd9tKiz1DdAyv=k5y6LTxK=Srbfmc7615bFJQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/19] drm/msm/dpu: add division of drm_display_mode's
 hskew parameter
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Setting up the timing engine when the physical encoder has a split role
> neglects dividing the drm_display_mode's hskew parameter. Let's fix this
> since this must also be done in preparation for implementing YUV420 over
> DP.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

