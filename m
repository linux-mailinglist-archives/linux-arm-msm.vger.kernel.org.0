Return-Path: <linux-arm-msm+bounces-7196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E982CCFC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 15:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5916B22C7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFEE2134E;
	Sat, 13 Jan 2024 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2IcHvDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825221119
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbf22acd993so4318853276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705155476; x=1705760276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpapplPXSwA8dgQHySDipjmJ1OdA0p6AH2z0SETgUb4=;
        b=b2IcHvDJJzLLU4CcPrJ5/9unWwV8yv3sTaZXpRByg56/dqrAQYkr5oNKC/uXj22UoQ
         qcYkq2LDkKQMhf4oHhB47ftA3qBJ7oF1L/J3+th1XyrHEUwO/6hAMmXu86h3nDKAgGpw
         xEaJ60nrwgi6A/skaFdwLR+x5rXvMF85v/CrdH2/8qet0bCb9vhP0WcfjCDVH9/FNuQ/
         FOVsL+hCWkHttmKZQ0p/LyB9UThhsp726HJ5jYIfxrIY/RFoRvdim7W3KzHuuhP9fXeO
         ejotUFvG7FFvOjgsHlAu9h17MI3kiEKwUXYaG+7Mdud/9E1gZzmuHwQalpY1MxbYIpjU
         /gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705155476; x=1705760276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpapplPXSwA8dgQHySDipjmJ1OdA0p6AH2z0SETgUb4=;
        b=DjaE8L2C4HIuyFBZlgUkPgEpsUBSGQ2w7vI3dqWm1v3rZ7+38SyPZ2KDFtBat7wiTv
         Cd1YQ7ONUww0RoJ+OjW3UHNL+nxueO3vjT7SysH3YOJseDJF/pQZ1WyTZ5TfZ6uiHmk7
         72M/G5U1TmzTr8RObEiXDvcZ0BIG6fBhR/SNpQhgAFFj4MP2einO6ITNwXZ+1euPRFr8
         +lczooIBGkNAeqnw0iiaokJrXlfB2EpzOFpnSiTR23gL3LALrtpMyuYL4YSjBQKPpElt
         mcxr6vReoKNSV/Mvzgjp61MhCVumkgahFnG1NXz/Axn1iNml7gCCz5eKslqtrggR2yAK
         TBVg==
X-Gm-Message-State: AOJu0Yy/V/60bEQW3Qe0WEj/JEICd4b+RCA32e1PSihVnR5wNpzoBavh
	22iZJbnfaG9wU8ei8gQ5YBlzeXq9Pd+aYqb+Tc38oWsJCiyMew==
X-Google-Smtp-Source: AGHT+IEhkGFyRk54+YFnuRK35imOYfuCVpxnEEr5O+Sul0jCRTBmNNZc4z+pQ+B9yz0VzbYYSr8h7Ze0o7qfS0Cs7VI=
X-Received: by 2002:a25:acc2:0:b0:dbe:ac83:6c99 with SMTP id
 x2-20020a25acc2000000b00dbeac836c99mr1573535ybd.124.1705155476011; Sat, 13
 Jan 2024 06:17:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-10-de7dfd459353@linaro.org> <ed511811-b110-4fa3-b7b2-b2ec512d4061@linaro.org>
In-Reply-To: <ed511811-b110-4fa3-b7b2-b2ec512d4061@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 16:17:45 +0200
Message-ID: <CAA8EJpqR1u_bW=UZoWYhrU2WbOexJSY7ZXaegVp2P8=aqXqROQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] phy: qcom: qmp-usbc: add support for the Type-C handling
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jan 2024 at 12:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> > The USB-C PHYs on the msm8998, QCM2290 and SM6115 platforms use special
> > register to control which lanes of the Type-C port are used for the
> > SuperSpeed USB connection. Mimic the qmp-combo driver and handle this
> > register.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +#if IS_ENABLED(CONFIG_TYPEC)
>
> I understand some people may want their USB to work without TC compiled
> in, but it looks funky to have a "USB-C PHY" with optional USB-C support..
>
> Should we just depend on it in kconfig?

Well, we didn't for combo PHY. Also both PHYs support working with
just micro-/mini-USB OTG.
I'll wait for Vinod's feedback here.


-- 
With best wishes
Dmitry

