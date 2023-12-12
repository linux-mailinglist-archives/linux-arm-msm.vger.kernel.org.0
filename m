Return-Path: <linux-arm-msm+bounces-4383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4180E8C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 11:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD11DB20A8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D3C59536;
	Tue, 12 Dec 2023 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+lTMwWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9103A95
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 02:11:30 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d7346442d4so53323807b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702375890; x=1702980690; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TrALaesQgyuM5VBjLsZWxJBv/FBiGl6WWHZcz62LCsQ=;
        b=V+lTMwWdi+KCoS6VNABd5d0AjDjc+FHcqoAoW73OHZCNfVWG+YgkXkUSGJ3iBej9fb
         W5fhcnLF9NJ7AvVCP9LHitkTMudo//LBHjXm13W0ESIDCAZw4MxtNRMjaPHPG6Odc+oh
         bZgAlKu0Lrc7BcHgsAU1tbhCpII2LiaMeI8ESgPJkxuLkqH7k0kdjTVTil6kspl2fCoV
         kcMHya9OAxx6Juam+uQCufMMZowefiYF0kP0AQfIVKxcxb0xeVRejgLtIiQn6lw1FF3M
         iICVpE+PHrdCI2K7yqQNITUx7qVcRfp14hSJqu95ySqXz+Ezh9z793p6ysQwDHoKu0bc
         Rf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375890; x=1702980690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrALaesQgyuM5VBjLsZWxJBv/FBiGl6WWHZcz62LCsQ=;
        b=sqqJ1oXzQDcv1EIWi0od5MYH+T50zG/9cWgMrpLY0JGgXjhEyaUx13ICk7VSFawbg6
         qySx9LiyLCad0MStRYikxS9yOdmhXGeiocRv0qYZjiDFZ/88icGNpWCl6dDy3raGdIlV
         IephBTZ23+RyMnVKvetYttMTWS0PVJnqv/XCz/uqUX+Ck+XtEH5OlohxWJMSDqRq8zzs
         auxSerA00gwy/+L5IhODoYDAO8LW7sdDq9Lk7z06OVPH6tc+hX3b+aNmaJGV02OQLUxT
         EptCI43pkpZ1bku+OGfP+ZEqJCdVjAZk4AifpTP4u7Ajp5fW25IHkMGtoSo+3ZafSYqr
         XOYg==
X-Gm-Message-State: AOJu0YxKhx+6SC6PsSy89XCvJwvm9LONl326+sIbBqIo5VUpR/baEObf
	Wv+CPvgbV/xUDTx0NNfyCVM7OQi5WpPDCdmF9jTveQ==
X-Google-Smtp-Source: AGHT+IH4kRlISgKjiU5BqBf5v8muUL1cRp5jUmprgddz13Vqnjj9lFJY/CpDvj3Ul+mqmEg09KelU7DuIhO0LQXv9y0=
X-Received: by 2002:a25:787:0:b0:dbc:be12:f04f with SMTP id
 129-20020a250787000000b00dbcbe12f04fmr150338ybh.42.1702375889844; Tue, 12 Dec
 2023 02:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-2-dmitry.baryshkov@linaro.org> <b23c3d03-8b0f-43b9-90d1-8d5c3a9622cc@kernel.org>
In-Reply-To: <b23c3d03-8b0f-43b9-90d1-8d5c3a9622cc@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 12:11:18 +0200
Message-ID: <CAA8EJppntst7FNnobURw--tdDzkrZWZhCDKRsELKNZ8RxpHyiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: display: msm: dp: declare compatible
 string for sm8150
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/12/2023 16:44, Dmitry Baryshkov wrote:
> > Add compatible string for the DisplayPort controller found on the
> > Qualcomm SM8150 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> DT list...

Yes...

-- 
With best wishes
Dmitry

