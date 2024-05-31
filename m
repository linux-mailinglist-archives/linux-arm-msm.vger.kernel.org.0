Return-Path: <linux-arm-msm+bounces-21320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3928D66AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EFDF1C22A42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4EE8061D;
	Fri, 31 May 2024 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3G1jFCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F637144
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172479; cv=none; b=pkda9TNbM9ju4NSQiGB4vySM1LQFpiovz+sDsJiUnebIKeSnA6BIIDSKyJo5S7x4VDh/f4IURrAjbJPBB4btyBsKP9f/BMC3g0sLcLC3Ji+EFCkJtU+73AorTlZrR6eaexTgaFw9htKbSaYkgz8TsxuFO+b5q/h89zLe5N+QXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172479; c=relaxed/simple;
	bh=nvY8T8Ok0QulhK6MiIwjO6JnMW3LaS4gATuYYnuUhy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjuSGVHsedce0BfgAQ6IHXu12Tz7oHt2Fp/7drlLk5kN26VO8Ea4zlU7VOMM9cJPSzRWa+CN0Ny+KfKSK32Uuaxd2JZBr0ID/AoifpfboboXJOc7+/m/burvACTLGdtG3vxUsCaymlpvNrkQKfkaHjpkQal8ruzI2p7mcqtVwrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3G1jFCH; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-794f61f7423so70036785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717172477; x=1717777277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXueITpdXmllfrhOnciz2l6HSxbQMeuCE6GtcEy6a8=;
        b=a3G1jFCHy1Ghhw6/DTUruHZJv13CKYdwDR6RGLDvZPdrsB/O1JKklDGGvOPmXTfkHo
         Ip9Vd08iHkY4XiUC4ShUqPJoCja4vfJ2TK0lJ2hgsofy4BUxkWa0uZHF3zDeY1x/t0Ab
         D+bPL3xYzn8406NTmelVDDOv5XjLDNYs7yJ2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717172477; x=1717777277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXueITpdXmllfrhOnciz2l6HSxbQMeuCE6GtcEy6a8=;
        b=hqmnVzzxdlIOt3cE8vyG3Xs0C2rnezHbp7nM7mpgpsf4m9z8HPmUL92QKX7IsZ4BFZ
         n2vSO+VEPt8XM6OdvXlCbaxVh1KnvmM31lOxUox7OffmkeKAhoDhL/YMEuACmxXQwxYM
         xSO+CjQM+UlpJMgNdBqio+vGm6zAf0QQwNZPJrNXR9je3tYJbpu0SzPTiiH3E+IHcuxf
         O13HdRiA+3+pe8Bohqd88a+kE7i8reSrvPmoVN4nBTl9Tjfd/bdNLYVW8v+uZl5+RxCW
         Y8wqfP80K15rf5c8SOFp3fos5dcEsi+sPaT2H83DqWq8VoekRQTYrn1HubX3VGFXyZqr
         wauA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ljVyBu6+AR5MVf7JGnIOI4SAwV+QiCrNxQX0TQCdoMF1ddjjnSSHeUTQSd8Q4HCePOrdncxU1dEZmZw0sqjpbka/v/UhfQivlt5CiQ==
X-Gm-Message-State: AOJu0YyTe+j8F8zJcFHE0ut0+fkauCWiUTqi3UMJMC7849PCHQ4XQvhl
	e5EYJs2CICOZGz09MX0ZPBUcYrYthtyS03i1DAiulp2kZ6gNeX633tOdhXYzp8lJ8jSxHYngc+W
	cLUQn
X-Google-Smtp-Source: AGHT+IFJflgLPEwQ9zrtBjyoDkFE2hnGL/zqt/X4BXkFDW6KhXWpe4aoRKFy6cWBeCa8gguWtZ8DrQ==
X-Received: by 2002:a05:620a:21c4:b0:794:f22e:c171 with SMTP id af79cd13be357-794f5c73de5mr238876585a.31.1717172476641;
        Fri, 31 May 2024 09:21:16 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f3017cafsm68775685a.65.2024.05.31.09.21.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 09:21:16 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43f87dd6866so435701cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWy9MP/eMRLwqqDFPKy0oWHdtPjMSaC73X+X/8PnveVtnygSYSwUlaUL223FSoh+vbwV0yt6qVk2V7MiVaUiJb346AZLW+yO/qC8Hlc+Q==
X-Received: by 2002:a05:622a:4a14:b0:43f:b19e:d3ba with SMTP id
 d75a77b69052e-43ff2c5399bmr3052241cf.8.1717172475232; Fri, 31 May 2024
 09:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org> <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
In-Reply-To: <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 09:20:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
Message-ID: <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2024 at 9:18=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> > There are two ways to describe an eDP panel in device tree. The
> > recommended way is to add a device on the AUX bus, ideally using the
> > edp-panel compatible. The legacy way is to define a top-level platform
> > device for the panel.
> >
> > Document that adding support for eDP panels in a legacy way is strongly
> > discouraged (if not forbidden at all).
> >
> > While we are at it, also drop legacy compatible strings and bindings fo=
r
> > five panels. These compatible strings were never used by a DT file
> > present in Linux kernel and most likely were never used with the
> > upstream Linux kernel.
> >
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> >
> > - lg,lp097qx1-spa1
> > - samsung,lsn122dl01-c01
> > - sharp,ld-d5116z01b
>
> Ok to drop the sharp one I added.  It should be able to be handled by
> the (newish) edp-panel, but I think the TI bridge driver needs some work
> for the specific platform (no I2C connection) to verify.

Is the platform supported upstream? If so, which platform is it? Is
the TI bridge chip the ti-sn65dsi86? If so, I'm confused how you could
use that bridge chip without an i2c connection, but perhaps I'm
misunderstanding. :-P

Thanks!

-Doug

