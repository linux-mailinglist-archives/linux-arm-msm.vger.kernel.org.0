Return-Path: <linux-arm-msm+bounces-15646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D190890F71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 01:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5550C28BFF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 00:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B316B3C099;
	Fri, 29 Mar 2024 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ANq6cHAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D73BB55
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711671850; cv=none; b=QGSY9827zZ2s7VnMYS5AZolynBHN4iXzr40KRRFs2+B1tarAD8uUkwpOycJADng2uv0WFbJac23VFeiH1ahfvcqc5R1l7xxfnOmRfWjrUYkSCm67aUrurawvbh3pHJv9EMtHbWKFSgT/xOz1WgvdZ3w+XDpTx8biStuhChYDnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711671850; c=relaxed/simple;
	bh=Kktgyk1Ne8683zhhNl+w7gx+1BUZgoefIm93sHMKkzw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAWoGVVBPx+rbJDCTaDL1FmLqjHsuJnrPLSUW2LCBWV5u6WDewojRduE8NApWFRQdVel4Y3cdyZvpsOSG89PXUg7Geq3Y74lJ0rKHr0GhfWHvpyKCbM5tn/klT79PJBSnLQ4OIHy6cU8Ugzj2H2VaxJD0YNzVgRxr5igx1etwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ANq6cHAS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-515c3eeea5dso1544495e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 17:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711671847; x=1712276647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKKadjbl+IjaVrgNtNEvMRJkka5H/Sf6yJutNvR12Xw=;
        b=ANq6cHASvm/NJdTch6gipbsN5Pt4ushCkcOyPoaGEcJ05ojjA5gyI+n8ts8ATJ47kA
         N+2JUQ2AtLNxW22E6vXq5WstYRoIXuSEvRFQZr4TkyhSTWziXboRXTALWmbuQaSzRMg2
         xS703ZXE8HesOeTeuHsFE6cm5Mt52YpZCq2Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711671847; x=1712276647;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKKadjbl+IjaVrgNtNEvMRJkka5H/Sf6yJutNvR12Xw=;
        b=CLNaFt/vg6ib8QKkBY2nHVK/4A91ljl39CqfR9IQjeoxadnVlbNZMAFlUZ1v7a2jP0
         OrXd6W+x0mCDWruOWKPNEqUxaXR3RWJu8DRSCauH8LWbbIyUgqKXlY2mSKWlmDtPrp+4
         R+V0l6+nT9HgEFEzcrH23yooZx71pvcjxzgV6foMJXOAZp91yrA7wA0wbr3zzWt5N3il
         ZoMr8VG+IS+StA3MJ5U/Ilqnwphdh6xcyfhBHqcHo0K8hAeJ0fo6rMb6x4kTUopsbVAg
         4lcUPWUu6oM5+NVmtuc19bwiTA0sw84oH0V8kzH8tO8lY8fLkqgPaBOlXZDHo+Vt0Quf
         DIww==
X-Forwarded-Encrypted: i=1; AJvYcCVs5orhVCmsXrwqfGXMVR/fXaqsEsnQEQBI1c4LbZGgRHpDi7XtRn2V82ZPDXBJXVK86b1sqPk4TJ53klHF4Xs//Y02plRWgAPQ4IKbSQ==
X-Gm-Message-State: AOJu0YyR+RAkIRn0ID1v0L0DCmcdc90gaZA2FoKVD3EP0eg0IEwZclTm
	bnbvyEp5BRA4hlyu1WhL1pqkxTK//X+K6yUidzRlEUXeUU+NelugYJoCIHfLcajXBxiFafIen+i
	q2Muh1pOzKzguw9FW/Bg9tZCzj5WWcfXI7bXo
X-Google-Smtp-Source: AGHT+IF7eR7SuZccKDbAejbaIA8l1qTeJc8Wrv2nofENrr5u/5niJzZ5bWpbyfr44eBl9K4WwSe8VpOjvVq6kooxSmU=
X-Received: by 2002:ac2:465e:0:b0:515:d100:1650 with SMTP id
 s30-20020ac2465e000000b00515d1001650mr177609lfo.57.1711671846981; Thu, 28 Mar
 2024 17:24:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Mar 2024 19:24:06 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Mar 2024 19:24:06 -0500
Message-ID: <CAE-0n53qdRk0LRFambwRB=xiV4ak3Odoqhs4rOJg3x77c4MrTQ@mail.gmail.com>
Subject: Re: [PATCH v1] phy/qcom-qmp-combo: propagate correct return value at phy_power_on()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, abel.vesa@linaro.org, agross@kernel.org, 
	airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
	dianders@chromium.org, dmitry.baryshkov@linaro.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	vkoul@kernel.org
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Kuogee Hsieh (2024-03-28 14:07:15)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 36632fa..884973a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2754,6 +2754,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
>         void __iomem *tx = qmp->dp_tx;
>         void __iomem *tx2 = qmp->dp_tx2;
> +       int ret = 0;

Please don't initialize locals that are unused before being assigned
unconditionally.

>
>         mutex_lock(&qmp->phy_mutex);
>
> @@ -2766,11 +2767,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>         cfg->configure_dp_tx(qmp);
>
>         /* Configure link rate, swing, etc. */
> -       cfg->configure_dp_phy(qmp);
> +       ret = cfg->configure_dp_phy(qmp);
>
>         mutex_unlock(&qmp->phy_mutex);
>
> -       return 0;
> +       return ret;
>  }

