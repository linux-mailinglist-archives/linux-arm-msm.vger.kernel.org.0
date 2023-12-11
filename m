Return-Path: <linux-arm-msm+bounces-4188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4B80C51F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA5AB2100F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAAE219E4;
	Mon, 11 Dec 2023 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQ/fGjd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9086FB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:46:43 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d279bcce64so40150097b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702288003; x=1702892803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ceCUCLPLXDWP9zuR7v88iAKVRPzXXELnTgB4Os6l22g=;
        b=AQ/fGjd9sDjd3HVML4PO5m6XqonbJweLzw3M2pSZgDtwdJGIMlIKdjnpKiHadXN/Ze
         MB1jhiEiA/r5bXluEb3Pc5NuIYcQnJj4VCUNCri5C+R5GbfEFFOx/rYzuCME9QTpfiT0
         9UIwoenQFC623BAwPFjEJTaStvlR/jOHibEsirAESWTOTqD2rI08GyysBFSC+FI5UQe3
         OyQ+QCcC5q2nXgnFIwRZJQxvofhyNvMU8bjiKmpER12xrwxQJYiyMU6NnUCoWlLJC55M
         X8L9yuQQwID0nzpuLK2z4DKqiB41GlY18k9sx2KancFcA4QLHwIYsXkounQeJQ47V/6N
         jEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288003; x=1702892803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceCUCLPLXDWP9zuR7v88iAKVRPzXXELnTgB4Os6l22g=;
        b=XWFNjNrbe7Z50En8BjpuMfL8VpBk320tjSmNCZnXRSkZlh9D/xMIwz9bnYZMQXPHlz
         +8TKMbFRrdDjwa4iqe3ZbplEiiEnKvJ7GaeUaS4nFvJEpfGrrTHuZPQQ6FT/4is+s9wG
         fES3hUPMQc6aKuN7Gq7FmkZEvFkjZodp+UdCD2iErL6oHjtyBwwge5mVwKvl2lDf3gym
         DLWzNrz+34udQ7IhKJWyL4TruWeuU9wRnJdo426q0vIM/BzwA9bXTJldJGxPV4TZ32cl
         hG76F2VzCLv3hatvwFSE1tQGXvxGw249pr8Ir9UhBylqU5X/WRyLMDcDbfOzHpnzWDuL
         7jXQ==
X-Gm-Message-State: AOJu0Yw3FXOhcX3PIeWL4S9IfKOMPlPEYH9sjDqR01TSO1TEik7ubtEw
	kpdJv2QurS6LiORbOJOUCcvgkhCnect1i6fUJS0OlQ==
X-Google-Smtp-Source: AGHT+IFOa8DSXLPHUigw9G0yCtlmvsBIW84hlWI/2hqEX9J672xst4rq91Q4Tzd92Qk+L8dSWiirXnvbHK1KGoEHH7M=
X-Received: by 2002:a81:d550:0:b0:5d4:20bc:403 with SMTP id
 l16-20020a81d550000000b005d420bc0403mr3018887ywj.2.1702288002808; Mon, 11 Dec
 2023 01:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-10-dmitry.baryshkov@linaro.org> <7d459b20-80f5-4d9a-88b0-9e5769d1d9be@linaro.org>
In-Reply-To: <7d459b20-80f5-4d9a-88b0-9e5769d1d9be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:46:31 +0200
Message-ID: <CAA8EJpqpdvV6-Yxf7njg2srqEyiWJiF3fUGFi1XYBAPvUN3SOg@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and
 USB-C altmode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Enable the USB-C related functionality for the USB-C port on this board.
> > This includes OTG, PowerDelivery and DP AltMode. Also enable the
> > DisplayPort itself.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> > +&pm8150b_typec {
> > +     status = "okay";
> > +
> > +     vdd-pdphy-supply = <&vreg_l2a_3p1>;
> > +
> > +     connector {
> > +             compatible = "usb-c-connector";
> > +
> > +             power-role = "source";
> > +             data-role = "dual";
> > +             self-powered;
> > +
> > +             source-pdos = <PDO_FIXED(5000, 3000,
> > +                                      PDO_FIXED_DUAL_ROLE |
> > +                                      PDO_FIXED_USB_COMM |
> > +                                      PDO_FIXED_DATA_SWAP)>;
> > +
> > +             altmodes {
> > +                     displayport {
> > +                             svid = <0xff01>;
> /bits/ 16?

Ugh, yes.

-- 
With best wishes
Dmitry

