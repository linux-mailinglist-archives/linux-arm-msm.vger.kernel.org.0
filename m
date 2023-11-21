Return-Path: <linux-arm-msm+bounces-1341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1757F2B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 105F4B21A06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676EB482EB;
	Tue, 21 Nov 2023 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRhYC6aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB28A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:06:16 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5cb8a6e2dc0so6120967b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700564775; x=1701169575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qAu9KNb55Wcsj1U43w2gm+QY+xIrGUFw9sDuy2hVAqQ=;
        b=mRhYC6aqbxkYdk4dOfqcLDwDebKKZi+TFKwLgMfTkvkJddRPVw6a8hjEO/aU8ukzsD
         yxSUUMJV27161l7r3PHyQfs+K/3QgxX0yJtCKigRg9Cbm2jgh0Pz/DF9VrYofDzXUI31
         YNM0v1RAR40cwA3W/zd0xsokjvEiOJsSI3wY0doQMgvk2mnnJjOv2LPbGl43cnK1GicM
         2dhujC5b+RUM7s3AD+s9qVokdwBfPc+bDT+Aj6ynSaoVKE+23eMbiwU6r+ZworzimalP
         T0N1mYjMZOO9dcmzyc5Rb9Qunv9up7eaFoaIjkHB0+sL94Gd8fC6URSl+VD8bvBZAwtP
         8FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564775; x=1701169575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAu9KNb55Wcsj1U43w2gm+QY+xIrGUFw9sDuy2hVAqQ=;
        b=aDaQeBLscT7zmvYVwtlhhIpADhzYZrJsphNjJbrN+WizhVc0YIlUaI3KWONZuMRz0y
         TuUo3jJcjeoVwsGKIo9RjPhParVHfEmeCnBmbIrO0lYCvo9t4DONfNMeqDmvFzudV/xN
         qu0O382D5yyNcwgB2jmIJ5ySCdYPNtLZW5SMjSx0G0ja0s9sTCLLcz8to0jIk/tB0ftZ
         N7V1B7gJWUyo95CgiX+Ft+Y985dyK3cXYeJ1qd1OJIYBOdB3xpwIu4ltfHefOWH78YgO
         zh+1OwKaDttyG+dCGt9CnPmO11q1jdMi8n5RukGrytHqaM/nrm8Cn6eJZ+ryJ7EF5s+n
         f+nQ==
X-Gm-Message-State: AOJu0YwKNnS4j2/sbeqGKktAqj+RiITQ2C94K8/UdZTaomp5rL5dv9F1
	pJPCDgXWHTUZDMVCNcfzlyfwgIPteAtLOORWCo07eg==
X-Google-Smtp-Source: AGHT+IFXmK6c+goSlc6gqDw81wwgNpcvs80rWrjqvbbbomRseLWccYA6j1JiQT06FrnHqj4stB6xqOa2n/1zntHjuNI=
X-Received: by 2002:a0d:d3c6:0:b0:5c4:3896:7763 with SMTP id
 v189-20020a0dd3c6000000b005c438967763mr10518180ywd.44.1700564775367; Tue, 21
 Nov 2023 03:06:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org> <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
In-Reply-To: <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Nov 2023 13:06:04 +0200
Message-ID: <CAA8EJprC_9MXyzBETaHO=HcKU+vREvdJewXafqk8+R6bL3vDtw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Nov 2023 at 12:46, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> > Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> > same functionality for the DRM bridge chain termination.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > +     bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> > +     if (IS_ERR(bridge_dev))
> > +             return PTR_ERR(bridge_dev);
> > +
>
> What is the effect if we never attach any bridged devices ?
>
> We make an aux device that just hangs around and eventually get cleaned
> up on release ? That's the way I read this code anyway.

Yes. That's the point, to untangle the USB code and the DRM bridge.

> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


-- 
With best wishes
Dmitry

