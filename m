Return-Path: <linux-arm-msm+bounces-3245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC61803290
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2FF1F21077
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA390241E4;
	Mon,  4 Dec 2023 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlgUHoGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32449C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 04:26:27 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db3a09e96daso2704393276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701692786; x=1702297586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
        b=vlgUHoGqnwXZdK6T8Z6RUseeI1b4WsYrEI1RMwtuyvmTMCBamhw/n5ZPTRyDdK7tl8
         Z1/7gzd1rY9RQVOHAzYkc+HF3MsAQo0eFVFrYaKtXdNtfNIHCGHO2lOr1BbCfkUghrq8
         wl1LELn6SSlbp1Gwzux7u8JrK86yAH+tNWvhqHV8WTjSK3l9Tz4lUbv5KQDCGxqoCNRT
         TawHEtdXdRUcyzRzluKwpR//57BgMfny/A/M4lmAxcu/lXGRp8b9MIIQDR3Y97sXwKAy
         Uct57Hdu/81z8SAw/jm7erNq6gkR35sF5kug6zYsrw2DFcZgwZX72ssLHsvAi8q5sgxd
         bSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701692786; x=1702297586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
        b=jjAkD+JkfBO+f+05+YVsyR2WdtSANhcnvaTXRHwMX+uCaviJKyNiSZqKxdMKM1tQ5+
         jPolcSKomPznFIY9838NFJROiHg9NJ+TRfKbEW9Ju1hoZlaC2xHJBkIbwXtipmOHTNpW
         ERkwe0kUxaHpzpEflw0dH6SbobcUkKHZPEg1tXp/akRcIXYeXRHqfb5aNm656KQVFNEk
         JtoA+qprdBGERUSYQ/dic9cXsqRgPKuOn+HcaLpXzleSdwgDVdv+W2e/g9JRFlm7pQN+
         I4qYfXogA04ycHsQ4TFWkjAVLHS99swHlse8cszkQgv2O/Dlx3PPSaPbhdzwzCZWLYIG
         jUxQ==
X-Gm-Message-State: AOJu0YwVI1tY+kkh1cSmmaAQRb8iSSTe/rn1BN+deULKrEjo5AFkBGUy
	q5u3gLnMtAC1/AAdEch0q5Z1pbXgFONpwKZIb6ULbQ==
X-Google-Smtp-Source: AGHT+IE+L1664SYHtY+cUpFkqq4X1I85OOyU1mq606IScbstXyiJjcP/Vfcc7mySBINjIKn/y2Cz19SvoVwqk/DjCeM=
X-Received: by 2002:a25:d85:0:b0:db5:4d4f:b3bb with SMTP id
 127-20020a250d85000000b00db54d4fb3bbmr1816647ybn.18.1701692786300; Mon, 04
 Dec 2023 04:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org> <2023120426-frosting-manliness-14bd@gregkh>
In-Reply-To: <2023120426-frosting-manliness-14bd@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:26:15 +0200
Message-ID: <CAA8EJpriJ-Y0Gb+PW7f5p4Sh_BXsDpeDckgnGZ+eKmWTQBegaA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM bridges
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 14:21, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Dec 03, 2023 at 02:43:27PM +0300, Dmitry Baryshkov wrote:
> > Greg, could you please ack the last patch to be merged through the
> > drm-misc tree? You have acked patch 3, but since that time I've added
> > patches 4-6.
>
> That is up to the typec maintainer to ack, not me!

Hmm, true. I didn't notice supporter vs maintainer.

Heikki, then we should bug you about that patch.

-- 
With best wishes
Dmitry

