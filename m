Return-Path: <linux-arm-msm+bounces-31794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA849790B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 14:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3392C283AC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 12:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF350176242;
	Sat, 14 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/LXDgmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4AD13D251
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2024 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726315501; cv=none; b=DClPwdMBDwVOJxezFSxhC3e5HqFcAyi6mt5iqAnnbdFYtSZQX/1Dl1TkhYgXv0p4KcNCu7FIp/0ZU6Uhwo2ueRMWqHgOu+1bbKYSxbDWSGzyF2Z9u96obYRNbFRrZpvkuaPhm7DyHfAenv6IctkmqVAFI8HvbjH0k48ULWq4xPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726315501; c=relaxed/simple;
	bh=hLDbBiO0lIXw7qQZoLddPPxgRLyxCa9AMIv188JWSqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMBzDp7b9uNHbDlF38vkgyb3QE9a+Yu2ZUe1a3L2gZWppDoLnddSEet/daRO9qgEnKjGSAZ+G2yoImRuzKJVg71YXBU/x+kQrwUz9dUstqkRpvMD0jQ0QLMMK1yzkiAhrYq3CECrUaxibz9YjjcLNjFVMpYZU2krPgDObxh0cCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/LXDgmM; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1d4368ad91so2865261276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2024 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726315499; x=1726920299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/BwEPPxE9nFO1CcsZ05pg5b/eN2UhsgUftUMF1y+k0=;
        b=w/LXDgmM6S1e7UKwN1Pwl/+ipX6WhawuVtH2vTWfpbmolOLPVaG83hQjklqndueKO8
         2BZGIaGUS3lNvkp7exLZVx7E9AqkLjspbdq9QuzyGOHPXOBgjvFLnLCnRpglnJvKM0Mj
         kC9P32XvI7U4DniGzkxYvOwpYBmyCSTrYFGMF2z1KsnFQVGODaKKj6NQaZi3bSOi5czb
         ByLTycCdzHdYPY1NBcLbIYuWusQiDq2lOzU7eYEvo/dphjJdUSIMy8mF42YshpHyms7o
         yZ/LlMMIkBicSh6FipWAVo+6asF+3UUhH5q2YEthwoVJtYN3qfpF0V0fi3Blxls1NPTu
         jWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726315499; x=1726920299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/BwEPPxE9nFO1CcsZ05pg5b/eN2UhsgUftUMF1y+k0=;
        b=NZl/OSH0ilgpWNxOguXlqEFxf5oDzcpLohNuO9qp7VAtz2R8NHAdbqoX2Lx5ruH9DG
         TrNmPrPISTRAGCdqh0JhZUjsPVAz3Y3Ad5ruljQy+6yIhz0OfHNKDhs7pfaiIf8TtbSC
         saiwWtWZm+nGjAug8L4joGOx4EZ6CCJGF3zGjqrLHA7rNU2ASTq4ne431g1vuTHG1jxC
         FfyvImFy0GI5PgI9mEfroFEn6PaMAhM85GAoGjdgK94S3vKRnxq0GgB2eiRt8bUX/SOF
         is9vizXk3CGmBAP6rE0b4tVQlFhJJ73hfq0dYvxU8CuvxHqR1Gz/qF/bmPSfXLT+W/B2
         ttWw==
X-Forwarded-Encrypted: i=1; AJvYcCXvpsn8apPY28GRE6UjW6tRZeiYLqYgKqAgShAtTgqjepym3PyLOGMjnWI6xTErXrHU4ucXvdI24lnxvLbP@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMJ74KJUaAxPRYUytRURSb91B7nFYy5iuSj/TjYezBfuo2ufS
	aFSWxK9VLq9Boezwq2cnyhAyR97tfBHVtZ+b31nEuT3PC1aH3HsRaPLD/eqBeLGoLwMZ0s1ibtX
	wzJXHwo2563rIHoJJ67mbLhb0OKTrdQ77ERt+og==
X-Google-Smtp-Source: AGHT+IFr6ztHkdXR12yHJt9BqfgF+oj8X/upMI/MFEq0hVIM1jdcxlJa5xJkzkTkMIDH+Ri6BPcsmXHfSOGUlyxg2dU=
X-Received: by 2002:a05:690c:660c:b0:6d0:f91e:2ffa with SMTP id
 00721157ae682-6dbb7015a8cmr71152697b3.3.1726315498811; Sat, 14 Sep 2024
 05:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com> <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
In-Reply-To: <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Sep 2024 15:04:48 +0300
Message-ID: <CAA8EJpquBih8jO_Tv8RFLVYN0c+N7KC45VztGSJHV87x22tdcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org, kishon@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Sept 2024 at 14:29, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> On 13.09.2024 12:37 PM, Soutrik Mukhopadhyay wrote:
> > In order to support different HW versions, introduce aux_cfg array
> > to move v4 specific aux configuration settings.
> >
> > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > ---
> > v2: Fixed review comments from Bjorn and Dmitry
> >       - Made aux_cfg array as const.
> >
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index da2b32fb5b45..bcd5aced9e06 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -90,6 +90,7 @@ struct phy_ver_ops {
> >
> >  struct qcom_edp_phy_cfg {
> >       bool is_edp;
> > +     const u8 *aux_cfg;
> >       const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> >       const struct phy_ver_ops *ver_ops;
> >  };
> > @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> >       .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
> >  };
> >
> > +static const u8 edp_phy_aux_cfg_v4[10] = {
> > +     0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> > +};
>
> How about we only abstract the values that differ? It would seem like more
> platforms reuse about half of these magic bytes

I think it's easier to review and compare the whole sequence rather
than numbers here and then numbers there.


-- 
With best wishes
Dmitry

