Return-Path: <linux-arm-msm+bounces-9623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E89847A89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 21:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65E72893A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 20:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7401803A;
	Fri,  2 Feb 2024 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c3mPZqsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B590482E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706906217; cv=none; b=M77s6zHo6202L27uwKQWPZPZPmMDGb60wWzgH2fZK4RleDPFjYjq+o6ti5SfuOG42Kyl9ujkFf9mQdjcEavrqgt+VZ7S3a90rYEzBzK1tCKCoJVTqQ+TXfhztYVDC7NKhne3Wxq6QyTEAwDI0YT8a5u5ZNL+k+19xv6Z/LK6nKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706906217; c=relaxed/simple;
	bh=53lrrcAwsOReEPvUCjLVaJtxk7JP82CHsTgE15pO0as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrPmxKWdRA5ifhPP++37jgs7MdmuOAB44/meGHzoBkvWE0mowKL6RQB0lcmK2PAcByrOULoL0Me22cdP8K3AxKMcjOF6Sq70BuK/de3mqeM1lxL7XPhx0ydXWSWgZYFNnhdLDasG0xlWQ6+Fk3ynRFK6bvb++wWK/ApYNL4eZ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c3mPZqsE; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a26fa294e56so356341066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 12:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706906214; x=1707511014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h1IIKH0viGaA3orHuy1hmOvR0Hle+LrWHOWH3Kx7Iw=;
        b=c3mPZqsEvLZpi++OSXhluSDHGx2HPgp+q4AdBi7WvC3BCjTBPrD9J9A0D49AxdO+xp
         UdV1UCrl+ygwu3ivBcJskZfQsqSUCUv8z+6KLjA7yc7ORWhwcV+UBLQ+/JFFwyyDTKHO
         Z7Z1oZRB3gYg3xNCgO9fXAojQ28cS4JY0SfuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906214; x=1707511014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h1IIKH0viGaA3orHuy1hmOvR0Hle+LrWHOWH3Kx7Iw=;
        b=P8PItUNaIzHiDCgW1o4gQoMXBk3kLumNfDxtXnHGWAVKq9+cYMpGzqtxAjQLAyizMN
         /TAJLv971EHjkpuybT2Tnzuig/eJ1AlMraoT3nktn2V4ZhRDz6FJkReKkcgEwC4DqC7j
         SS5/rfjttbH9GTv5Int8Brwe1sGo5UM7u+NLLmYC0pMk4FP3jw/c5vHX1s84ai3xJ6Zj
         5l4QrQrA5WYqTi99QMWSQ09P8JVsjLBPJ6smfaJ6Cn94qcB+d+IradKWP+KrzUaPQpni
         MVBlaqN4YtyKMx/Br4UDyngimYNiM2SfDRaJDrcWNQdeEBlBMEBSvsj0xTMejV0OiNkB
         J1NA==
X-Gm-Message-State: AOJu0YwbKCKQMeKv/cHWhcmykrZ7YvQSj1A9TNOthSiYeba6qZcAnRSo
	yw+r2ykJZIrVauI3rzy78GxcdxXFw8G4Rx5ADW6p1EOTQobrt6YfxdvWW3pxmBeRmYAVI/x6vmV
	jPc2I
X-Google-Smtp-Source: AGHT+IEGwtCKzQcEi67Dm3eXxB1h8m64sVD+6s0QhEPLgCCHmqyA4/30pZSjmQm60WPO9E4ig3bUNw==
X-Received: by 2002:a17:906:f114:b0:a36:c8aa:203 with SMTP id gv20-20020a170906f11400b00a36c8aa0203mr4039383ejb.61.1706906213943;
        Fri, 02 Feb 2024 12:36:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXBbebRM1GqpkavJIzv8pWXE3huh/khYOHW8UJk8sNjy3q/TnG+czRKU+ndLzRfZgBq2+GZ/J9nIaVKWPugYl9+UYJ+J854NXhCq6/ECQ==
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090627cb00b00a367a82c0e6sm1226121ejc.156.2024.02.02.12.36.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 12:36:53 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f63fd3dd8so2422a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 12:36:53 -0800 (PST)
X-Received: by 2002:a50:8d15:0:b0:55f:a1af:bade with SMTP id
 s21-20020a508d15000000b0055fa1afbademr6757eds.4.1706905905770; Fri, 02 Feb
 2024 12:31:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Feb 2024 12:31:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkNKFiRKyadVnAMmtcDH=PVv6vk2CvMbME9FZ5UHNxuw@mail.gmail.com>
Message-ID: <CAD=FV=WkNKFiRKyadVnAMmtcDH=PVv6vk2CvMbME9FZ5UHNxuw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
 @codeaurora address
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	quic_bjorande@quicinc.com, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 2, 2024 at 12:25=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> The servers for the @codeaurora domain are long retired and any messages
> sent there bounce.  Sandeep Panda's email address is no longer valid and
> should be repleaced.  However Sandeep has left the company and has not
> been active sice, therefore it looks like this binding is orphaned.
>
> Doug is listed as the reviewer for this file in MAINTAINERS and has
> volunteered to be listed within the file as the binding maintainer.
> Therefore replace Sandeep with Doug to make the documentation current.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 6ec6d287bff4..c93878b6d718 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SN65DSI86 DSI to eDP bridge chip
>
>  maintainers:
> -  - Sandeep Panda <spanda@codeaurora.org>
> +  - Douglas Anderson <dianders@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless there are comments, I'll let this stew over the weekend and
then land it through drm-misc next week.

-Doug

