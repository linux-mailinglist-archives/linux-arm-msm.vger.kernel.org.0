Return-Path: <linux-arm-msm+bounces-25879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7492D78E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678752836DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C477195997;
	Wed, 10 Jul 2024 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ns55L1qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C934545
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632961; cv=none; b=enW1PBzRJpPZ/B+4NkvBhs1zU7k+q7Uyu4+bzrywiI86F56j4zMMzZ7TmqI4hbSk/+p1t/K1Sw5A2gB8HaJXoXlqSbyRPL4nNoxje+TMSP7Tf6mAC6YXJmJsv6XwWRR3Uy0RhSWcG8XWkQEWrpX/2wrYW3rNdsriHSw2aUEDzXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632961; c=relaxed/simple;
	bh=JvlYBD4fzcDp97Xg4Q6bsG021KVmSIAGfMUuM50hu78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmqrlS+VN+wsRxU8Ol6dqyv2A3vUzWU0IfM2fFAazoTOKjAZC6Xq4exl4HVmaBLY4zs4uzSQl7xUFjBYVHMHGFaXuCw2tKKMDfGfTueDzYqgunW3S8knuPycGACRd6gkzynNAiRAY/VOFTR8ZLlPQSj7o3p32BHfEFYvhpUFGpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ns55L1qd; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-444fdb6c1cfso43829171cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720632957; x=1721237757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crXHuoCnWWxv6iDdm0t07OpWrmAQmRLaORcG897D/1M=;
        b=Ns55L1qdxo1urDPkdcV5682xpUzjBo80TGKSBg2k/kPV7HhvJyV1BOfrk+EN+BefpL
         5dJboteuktcs0sgq/4KWD05zcoux57bqCzApEOz018z4e+UVXtvP+s8/JrOyddB1t1Q1
         74/RU1SsZKXs8dWPKjKC4FnkAyY3u0UnG+Uqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720632957; x=1721237757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crXHuoCnWWxv6iDdm0t07OpWrmAQmRLaORcG897D/1M=;
        b=PieDwhA8j41Fq/EXinrjjcjJC4RFGXkDjtNPfsSg0iI5kjDL2pzaas9QhncomtKb5w
         ky/vmxtZmMQF37rPtSs7XRLcE64TTw7Qn0KIpM92hb6g5/uoNS2y8WQWfYFNsiIqc9Mt
         qV9WMl93ta18+UT+32wmmkhgFwxOlQE8X6FKy8zVrBxnEc468Ms246N8CVQCx4RZ0Rpl
         e+0lUOl0nyTUHm2wzyR6Z8AnE5Gz4UU0ntWZeNM9qolNAq+BSInwEgRZV1xDhq4RnnNv
         9ZPzC7Jmcq5WUbuwmK2i3KPtsj9DihY411SFyUMXGN5fgFkdSx39gq9qDbZcuy7n8vS6
         aJUw==
X-Forwarded-Encrypted: i=1; AJvYcCWlj+FRVSqdrINB5P1WNB9jJaZcIPDElKb4VJN1ghMVZAvqHMVBRQcVf4uHe0m0j7yVrRjik5gyOdeUDF3EwJYmT7rBVEDhWarb7l523A==
X-Gm-Message-State: AOJu0YytV/lKcReSyIFv1aSYPcP9YC1kC5UQYgOxI9KDvo/aVwfNwIen
	+giPLWYL5CY8yf+umxcpxroSw9boCKAjlMeFvu626AtbhoRPuYqcv/ZPyaiSh/KoKm71cFgHiOn
	zag==
X-Google-Smtp-Source: AGHT+IFBkK9BmHoDnnhKILwNZqAXishOP8i1ec74AILNLL+irAsu5HubsweiG6jFBZETHE1GVQTVBQ==
X-Received: by 2002:ac8:5dcb:0:b0:447:ed6d:db70 with SMTP id d75a77b69052e-447fa9270cdmr64964651cf.35.1720632956948;
        Wed, 10 Jul 2024 10:35:56 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9bd2c27sm22323811cf.76.2024.07.10.10.35.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 10:35:53 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-447f8aa87bfso29981cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkiAu7kJINV5ZEWfc5FtnhzXct4/4HInePq3MNgg1RDyhtY9StbA351wWM+uiLRKXuS6NZ82hqwVbQQpedAMDaz1+yCYbCOqxcnQPMAQ==
X-Received: by 2002:a05:622a:7604:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44b191f6ac5mr3688571cf.9.1720632951079; Wed, 10 Jul 2024
 10:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org> <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X5rJUNq_QUBf7WMrof+9rh9Jhb5zoqK=Y6jqUUi2Nt3g@mail.gmail.com>
Message-ID: <CAD=FV=X5rJUNq_QUBf7WMrof+9rh9Jhb5zoqK=Y6jqUUi2Nt3g@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel: samsung-atna33xc20: Add compatible for ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel needs exactly the same non-standard power
> sequence as the Samsung ATNA33XC20 panel for backlight to work properly.
> Add the new "samsung,atna45af01" compatible to the driver to make it hand=
le
> these panels as well.
>
> While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
> compatible, the original submission of the compatible in commit
> 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
> and resolution hardcoded. These would not work for ATNA45AF01.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/g=
pu/drm/panel/panel-samsung-atna33xc20.c
> index 9a482a744b8c..fd56fd02df87 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -333,6 +333,7 @@ static void atana33xc20_remove(struct dp_aux_ep_devic=
e *aux_ep)
>
>  static const struct of_device_id atana33xc20_dt_match[] =3D {
>         { .compatible =3D "samsung,atna33xc20", },
> +       { .compatible =3D "samsung,atna45af01", },

As per my response to patch #1, you don't need this change at all if
you just add a fallback compatible. Later if there is anything special
we need to do for this panel we can match against it, but right now
there is no need.


-Doug

