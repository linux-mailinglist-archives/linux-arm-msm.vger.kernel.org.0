Return-Path: <linux-arm-msm+bounces-27596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D815F94397E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818511F22B3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 23:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488E516D9C6;
	Wed, 31 Jul 2024 23:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OIMh45OR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA616D4E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722469653; cv=none; b=OBWc8c1p0EgX03EnL/OF+VC1RkwtAD9Ym3sUxUIQtAAwiJu4VV88y4jrJlO/Ax1KVpl2sbzNc8tRah2xhJua+QyS/k/LTxV4JS+GTYO7XCGon/WWJuB8bt3SezNf7t9ZuDlMYD0/NBLS451KeiPW12Pk6dZokyS/H1UDCLxUZWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722469653; c=relaxed/simple;
	bh=paENHMW/2+UYl3tt357TcNttcJM7CEFJjVvZ8PpjUYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/cODV7Lhcqq8HrFS3/rv7/1xyJeGB77KzsDhRu2ChyxJqBa61bQObgpetbNML57kKeX4cBONfnsSSOJEC1wjBxi5YxFoVySnaV0VL7DS30WXE5SQrw+BYe6925mg6iTnLd+Idawf3C1nRI7Rrohjj2d652t4jIrOpaTyr7uZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OIMh45OR; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-81f86fd93acso52174239f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722469649; x=1723074449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGN3NcBjvEDPuj/1+sYN2kLmAgP2z3leFVjhSD6EVrs=;
        b=OIMh45ORX8GyRK2WjAXf8wsJJc5DB4gnPXSN29wYCRq+u68rqAadGUgdH6nYx+pWs7
         +TXUUP6UUr3Ocfzna9VMKkochVrXSSdlMUUbqSGN4TkcYG+/ZsCZzISfelb+Lp7aLNl5
         OIhhDmiwhQZ9HOyu4XdB3laWH5JkmxdRgRxw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722469649; x=1723074449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGN3NcBjvEDPuj/1+sYN2kLmAgP2z3leFVjhSD6EVrs=;
        b=kn6v4klEuKcK/xbW9K6X2LXBxkYAYxpJoqwnPEgzVH2ktC5CmMNUWcIVCMkC/cZeF1
         D7E60N/X4pLPQdv88eSyD21IcF7yq5+agcHTmFYeFJ6pie76BJ1sl5B7X5dBgu6DlCF4
         xTiFlfO+bQl1dDbZFFjER1C3TC8ldAOx9AYWhlcA8s0jLqDahZ4e9U1vm/owRME+pC1B
         o2DMgrPUumq/4vQGnlF/0WT/1AEi+DteArjrQ3+L65mVd4IDXNfU1r7alKD/4c8J47Ym
         CPVE11kuErVgxBVFNY/0kubqbW7uPNn3574roLSVVWiumA3Fgvpuiw67n06tpyxR5Mqa
         QYdg==
X-Gm-Message-State: AOJu0YxyL+qzoSJb8aTVF8xb3yU1g6xYSvoPtsJjLp7MTx8OYW9YIG64
	Q/oq7sW1/rK/d17ACCRxT3u3JAdikX70wAqap3PvN74xwiMbbfzmou69f7OFnQLOU0JDfRzsLOE
	=
X-Google-Smtp-Source: AGHT+IFWFjVl6paNzFGSFtbjz/TNLr8tRZ4R+ZlU6qm6GkIpAbEXMZ0xVOMWxu9E8bjSpBdWFjJlNw==
X-Received: by 2002:a05:6602:24c8:b0:81f:8825:af8f with SMTP id ca18e2360f4ac-81fb9c67639mr484450039f.2.1722469649430;
        Wed, 31 Jul 2024 16:47:29 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c29fa36bbesm3433103173.17.2024.07.31.16.47.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:47:29 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39a16fab332so212755ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:47:29 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:44b:74aa:1838 with SMTP id
 d75a77b69052e-45181da7fe4mr1901cf.5.1722469178217; Wed, 31 Jul 2024 16:39:38
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com>
In-Reply-To: <20240729205726.7923-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Jul 2024 16:39:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
Message-ID: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to land this in drm-misc-fixes next week unless someone
objects. "fixes" instead of "next" for the same reasons discussed
previously [1] that the dts patch should probably be considered a fix
and there's a chance that the dts patch could land in an earlier
version of mainline than the bindings unless we consider the bindings
a fix.

[1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd-bac=
klight-v2-1-31b7f2f658a3@linaro.org

