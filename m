Return-Path: <linux-arm-msm+bounces-26513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54931934558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 02:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06BF1F22192
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 00:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556A57E8;
	Thu, 18 Jul 2024 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LtMXJxcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CE197
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262086; cv=none; b=iqCFYd2rt12uQ5IkvCtYDqL18h+woqoBiSRlI9tBitWOSWddjczu61UCCtfoYNGP+JnavgiRuvsNpRzUqRUCgtv0OF7Fh7z0VJLI4PqAhst0Iy/Yz1pbd4eZ/wjkXKzD+tOa2HqaNYRjWpwPVc1S4AYziRo0uvaBeGCqEZXjKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262086; c=relaxed/simple;
	bh=qfZaM8VI9ijVSJOyXMtAz+GFmiwxmMVRmm55/KX47Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2NAEUfkQMnwy0doqc5TPHGj8RpjJ1yJeYOpCFr+Ftu46G8CKOG37nW6QX3Pg/+ggVD3rneXIDuM8mRLMsJEYfiy4kaPu/AR9Sf8J+pEehDaECuX4wBRrznmDZcIOUn/80Y3qHB2MAO7F3spwaeVCnkQ3+xefAT0nBPIStdOYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LtMXJxcc; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-79efbc9328bso11630085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 17:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721262083; x=1721866883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfZaM8VI9ijVSJOyXMtAz+GFmiwxmMVRmm55/KX47Cw=;
        b=LtMXJxcc25yrkZIgZpW+ipqiiRZi/2Ea/Oib849wb9aABnXW8yQPyMyomJ4ax4rH5W
         xzhGaFsuhjLWbpPYpefrhucw9ZIRaXsVXBuJbYOxbE3crY0q6n3JQawvT9qtbL2YvTSm
         DqjMs7a0jSNIDMnujpbypWZ0+oVy/Aq8Iq8rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721262083; x=1721866883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfZaM8VI9ijVSJOyXMtAz+GFmiwxmMVRmm55/KX47Cw=;
        b=uTcb+YLJLUtG9B+RSZ5aLGLfjKnu54+Jxs8C0ywHJWIiicXdbw83WdB5l/ZvUlddbq
         fniX1y23N6eLhxvupq3SPJfEF8XVZDiyHDDBUzcyQT/gwvB1D4uTvyfL9+Cdm+/Q+NE4
         CQ6b53VUWtNSmk3xO5dQvouWdeuGqifjZQoGJaHp8kZcDPwX73Tpm8OH0bfcOB2nteK3
         BtlmzO2u2Az7tHeTXJUoWjfcaOULfUUGA/JRgKaIsZkq6mtQKGzeumgki13Q7xZTQhD9
         Az71eKZs+3I6t+KLKY49CUqw8Bu8fLYHMzezs285vsQHG4B2PTkA2ElrCcUc4bTLsgdP
         SpZA==
X-Forwarded-Encrypted: i=1; AJvYcCXUtuFWeiYEe/+qRaNJz6BH9J86Gv0WvrxDLNa55hmweLeHDzOHMcMQoWfhYURhZmBBLH0LJ+7RN/MsUMFoR0A9HwXECTPmczgSNsWkjg==
X-Gm-Message-State: AOJu0YyGyA0gBF7E6DOMNu04/C2MgG6oOOqEOl29DTQYN3U4uXev8Uhh
	YFA8N53MKW1mvtLrCNS6WgTFSDpJUsM6Gts0F6X9Vo9Wrki/czD3PxaskvysBOPYF4Lees5gPBZ
	o5A==
X-Google-Smtp-Source: AGHT+IG8pgLX+bwdJ4K+YAsGRP9ZA5ijb+9Vp+kwtuHZETjglRiF+tyk6qkoDF/HacRTKWqbClPYlg==
X-Received: by 2002:ac8:5811:0:b0:447:c0e9:1aa1 with SMTP id d75a77b69052e-44f86651e11mr41093481cf.47.1721262083655;
        Wed, 17 Jul 2024 17:21:23 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b845675sm53152811cf.93.2024.07.17.17.21.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 17:21:23 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44a8b140a1bso145421cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 17:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqWurGnsNU8Ej6Z+neLyGkClVjk42FLncjZfp52L+NVLzi2g3vJDAlE70PErOLlzkx2np+gGBNwpIJm7GhH9R0paDYIjC0+UETQt4gSA==
X-Received: by 2002:a05:622a:a70c:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44f92572a39mr538891cf.29.1721262082740; Wed, 17 Jul 2024
 17:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org> <20240715-scorn-canning-a7f23b9e2039@spud>
In-Reply-To: <20240715-scorn-canning-a7f23b9e2039@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jul 2024 17:21:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
Message-ID: <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Conor Dooley <conor@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor (and/or) Krzysztof and Rob,

On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> > control over the DP AUX channel. While it works almost correctly with t=
he
> > generic "edp-panel" compatible, the backlight needs special handling to
> > work correctly. It is similar to the existing ATNA33XC20 panel, just wi=
th
> > a larger resolution and size.
> >
> > Add a new "samsung,atna45af01" compatible to describe this panel in the=
 DT.
> > Use the existing "samsung,atna33xc20" as fallback compatible since exis=
ting
> > drivers should work as-is, given that resolution and size are discovera=
ble
> > through the eDP link.
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Can you comment on whether you would consider this bindings a "Fix"
since it's a dependency for later patches in this series (which are
"Fix"es) to pass dtbs_check? See:

https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org

-Doug

