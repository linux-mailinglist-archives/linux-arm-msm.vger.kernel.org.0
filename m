Return-Path: <linux-arm-msm+bounces-41565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A229ED83D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88812825EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319ED1DC9AB;
	Wed, 11 Dec 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GHayRsOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29941C3022
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951684; cv=none; b=rzUkgnBM0GUqh4CgOIba2MneFRvdze15UgnDMNZxSxEMky//4/jvgQGWbKUyRKExtk1euu8pTmKEGJk6geL/ZoV/x+RlYQZPZEnlLKpLal8h/zArsUPd8VzEzU/B5wzUeE34+Q6kNk8grPQL8mMxgzALA0Cha8gdlm5NgNvfJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951684; c=relaxed/simple;
	bh=pQxLX0OpRdmEKLujU7po1ZyE+Iuv7dvTeQ5pTjG0L2s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFoeFtYKwQSq7b89K86WVz86SmUnNubucuPqlYxPPMw8I5cUqI2jiU8pnCnr2/V329+Z6uYXcrjiL/MKVWpxgoYGOoDaIWvER9HW51EwkTw4P1Rmdy8uDbvPP6NPR4oepUed1l+0E2aB4fGlyK9YsmRWqRzO4xRyBGv4dT7RFqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GHayRsOZ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso5782997276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733951681; x=1734556481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
        b=GHayRsOZLwwS0Fv39Tz+Iq0puNCt/lLqmHxaV8CstxgKlAN7/z+IbBTNanMfgzeYhA
         IlRwbhYqfwHZq1Dhllh8hDEKxcilGpIkwg0EpYEa/e+vd99bO6gW3f3vawRB2sxyS2DR
         ORGg0xZ/+OGlpXneALwlOFJylERyACw6djoSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951681; x=1734556481;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
        b=MLCY7vY0AVnI3VfpBJoMbl/7TWhlUDLlz7AQSCg1cW+2oVO/P1yE+RHhx+oAGQRC34
         c+X4pbDdFb45t5P6jPMpi32vm6ULZoRot2ub4HnVPBQs0wk702G+c80MzD2yHJBEnMai
         0dEgZV12/FF0+iQk1oDEsJQKBjP/Fj60CBt71eCz6B2MEPkfGUq+KUn1TPGzorv5M9e4
         URBzFvU3nBEA6VCyYxzvmNW1WQ1M6rglTX1DhWcdV+8B87pEKSLSC4OFe6sprSAN/79y
         rdlOwI0j1UdXy9kPrbgCKUGxO5g23PonbuPpBnwC7q6aPXP7D9aEcKJHZemnQr7SlMgv
         boqg==
X-Forwarded-Encrypted: i=1; AJvYcCW+3678AkdRsvtiD7N7m5UtIOkT04zuGY8YdbQzBRlFLhlGkEqV6O0Nk0ACtahptQ9OW8X3DWQrEZb19nvk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3NQqDDdv83SbQWGHPbRMLfQgOjGsgvYsrTqHsvX1D5WeaASq
	8OSOyZtZ/79C9zitLrU+WfWbwwptvNJ5cHmPOLDFNqKm9AD0ViRMULEmhbwQIKI5vBdQJnxKmkQ
	UyQin/SBLu/jjW6rvgRp3BnkM+4wUF02/48XZ
X-Gm-Gg: ASbGncsYHoSVaxaxBsTwzjcLvy2LEGZvXcgO7dwKpgjR3WR6RYKoQ/S/O4BrBfWng5L
	4bP641CWE1/iSdZ2SE7DEGQ1VX4AVhlpmkt1/CqbD5PSvTPdNe0c7fmjNay0LYVY=
X-Google-Smtp-Source: AGHT+IGVGcprZk95xhhOtOKM+7JPgPvLrPlsxoiz5xiivClwV1s7VtMi2gtLbOTTJ+cbuh16Xk9oGKjJ+Ksx04T7VN4=
X-Received: by 2002:a05:6902:1447:b0:e3a:5820:febb with SMTP id
 3f1490d57ef6-e3da1df70c1mr852810276.32.1733951681689; Wed, 11 Dec 2024
 13:14:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:14:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:14:41 -0800
Message-ID: <CAE-0n52+nKDyzUPzg_uFsLXRh4XQW+TngD6PyuvetTKXthi_tg@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] drm/msm/dp: move/inline AUX register functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:36)
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index bc8d46abfc619d669dce339477d58fb0c464a3ea..46e8a2e13ac1d1249fbad9b50a6d64c52d51cf38 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -45,6 +46,73 @@ struct msm_dp_aux_private {
>         struct drm_dp_aux msm_dp_aux;
>  };
>
> +static int msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)

Can you make this return void as well?

> +{
> +       struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
> +
> +       msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
> +
> +       return 0;
> +}

