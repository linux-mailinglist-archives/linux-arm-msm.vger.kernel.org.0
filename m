Return-Path: <linux-arm-msm+bounces-14064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4887B5B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198C428370B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C518EA941;
	Thu, 14 Mar 2024 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTDdkorZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360577F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374691; cv=none; b=W5NhRTSQd9BAkoZC8Nf+jp93MD/JwE81/Dua90y13EJY6AkDCwK23tuMwcZQyDN9mv0X6w7VV7Rhzlb+hvhNpBMDklBcavtaAE5y/rxpIzxHZkiXiOg26XlQftU0G2CEDuiqu355inEcM+80eVMngd+YNKt7+EQAY+wRQpL8mf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374691; c=relaxed/simple;
	bh=8PaccJG0W3UuyP9ua1w7hdp+vhgKB3CTfJV4nNkkPIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpH61lSWh4sG2fVsetpcuwmlv93UVIcR3VZ3on+lK12w0x17b6U72mT6q0eBb+TisO965R3vmvbZwIDiSwH7uK7X81P5Dt05E7lmiFUIn4fch8Nzr6yOKnCB2IGqGPVADh2pcuLjQ8CCb71YIRBiYxZ8PoZVWRMXB9ue4MwrktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTDdkorZ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609f060cbafso5420437b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374689; x=1710979489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
        b=HTDdkorZ8jyNbeKhHRd7I5oLlONJZKtyBFNEjRHVhczzVrnZBRP6BzR7JqlKKvrrgA
         o/IXEgd6Y+ib2FwLVsGtID4IdFfzdsf17oTqsq7abQY1e0/ApwMzUsUXdLCyMJkZybWM
         jLbILLAm/gs60D9nNx5fDbmLi0oZILSdBXA/lSkewI5lZ0I7znhPHVS+FDG/lsDQ0C3z
         +va0rhiBAgNYvcfOWyTCURSAnBHissVzCkriSRHlCCiF0iqVIfAphftj0XoikjQ541s9
         xttihSE4k05s8G4grZir80pXXwihYdg/wjvRA3TRrnqrFmLYEbCj+yLIA/kTdAsFhUhz
         I0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374689; x=1710979489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
        b=TFmToXz2oZCIkt9S6f5IFRs3Vn11nZCxIZLF2jE0JH4E1HfNmMl444QQpLi/PaxRRa
         wXEBuRQKhbuDDokRodxUkdMU1egO354526GGBaSQHEUZepQx70tgXwu7wx6x+kngpzDR
         oB7Zb26TINrwwfv8BK2vtf4FMLBNNtHCFfdTJT4m9TgNU5Vxsg0uk41ti52LT1vugm15
         1Wgz41yL9MyxEEznV1oLCT41YzFJo6ltX/1OxTu3ptjq1ZYW+XWAyWtMPQ8DP+PVn/ij
         6ZTrucQ3eLKAJZy70SQrCSSHgA1kk1+Ym+jKt+SeDObOFO9wm71HANn7eIeLB7jEyTo7
         Qcdw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUQnlEhE6KnIo79HmeQQVplPHTfPiz/pihjLY3Pk+ZPX93KoW4FKZint/G34beoMhfFVNDY9HWGFMyrOYXwggoAXOVJ7e6Gw1BCBaSg==
X-Gm-Message-State: AOJu0YwxUgoEIfijXC3g15/YEjnGGfE/EzuNzq6RsCnMDqrKOrZz64SC
	bL0mJm5EkYbogf9zd7+zkV2wEwuir+7t2YwJEztESrWfJBTje5BA+Iekz5yFAM3NgomoNvCzZpO
	pRMzCguJMxF6SEhQkLyKEzIFwrEvBa3PtdO0Hcw==
X-Google-Smtp-Source: AGHT+IFgh160t5mc/VHtCKkq3crL5g/DfQmXNTqe7xSm5+kcqpj76uD36nWOSG4DWnAY5RxZbDwsXSC49FuQsA3G5EM=
X-Received: by 2002:a0d:d90e:0:b0:60c:753e:1e0 with SMTP id
 b14-20020a0dd90e000000b0060c753e01e0mr193025ywe.3.1710374689266; Wed, 13 Mar
 2024 17:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:04:37 +0200
Message-ID: <CAA8EJppoBY7Unq+LmPbQAvipU+HnJ0EmUkQdRBrp0=LezBAXvA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] drm/msm/dpu: support virtual wide planes
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 02:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
>
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
>
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
>
> [1] https://patchwork.freedesktop.org/series/99909/

Forgot to mention dependencies, https://patchwork.freedesktop.org/series/130086/


-- 
With best wishes
Dmitry

