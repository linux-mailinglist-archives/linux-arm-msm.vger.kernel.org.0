Return-Path: <linux-arm-msm+bounces-9862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71284A2D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848381F27C27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D46948782;
	Mon,  5 Feb 2024 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KSWzHKh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123541F176
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159373; cv=none; b=CHo30T7ph9M/pGx4RibERD0+GpOqtOqaYqt1wPEcvUtVtVe/PbJKU/FC6k7P6/TFASq/Y7c0v+dgJx02efvTpw+xwGQp5xofaTQ31NBskeVHeNSBb4QyE8+YDNBnJaxR8+3v8SEkACtbjsCsgEQ8krbXddbRK61KZv9kIvXPGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159373; c=relaxed/simple;
	bh=bzT5qI0/N/5/dC92OnguBaRNvQJRdU3/Ts0xpiY9+mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4wxujrO3RBwOH4BteNnoLffTeaFMEhx1Vp7ni+5ohXM0L4kc2A9KOUBUfYFRtXY4cQmUJkM7J4yexgL4AqhO+kMQ9fyT7aSioa+mCo96GsXaBTlj2KRrnYuvh3lntKB7yM0e6JhLPq5US4AeRWE5P7u77csbH6syj1Pz4qjeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KSWzHKh3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6040fe8ba39so51773177b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707159368; x=1707764168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G808gfmzZ9j432kXszfFxMM7lLJBObo6nQSQeq1OGNo=;
        b=KSWzHKh3aqfSaI4DCQDG2EG6ONC1PGYkP7sBHZrCQL2hlaCIALf9JQTyR7I8B6hoMW
         4jz1EQLIayD9n5SRDmEUOOC/Vi2uvivsSrplX5pD+l+yzKISlWmCWMnBTY/wp/NOwczq
         fHHiS81k/racTd18syZvQCLLZKz6bNsWN+5S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707159368; x=1707764168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G808gfmzZ9j432kXszfFxMM7lLJBObo6nQSQeq1OGNo=;
        b=jyJ/ssKssYvbdTRAxpCpUdueW3j9zzgNjTES4e/vBoS/iHZlvZ0/NLrTMcvUQcf9W4
         SRv3+o+tF8F96frR9Ls8uvvSQfyPf+FUXaro0T7k1P0/X8IJ+Py0kNG+5VciO5moU1TG
         MjGJXkt7WW66tVvjf7QiJMOKZoH8tQrcAWYUBSaqo+Yc6avwdSblB1c5TBDRYwov2YCk
         8Ys8j+5Ivufnkq/xO33OgfQlCgAGk6vJfA3wy+A7kqopHJdedGE5DC0B0OtaSXYTVq+K
         Z8TAiNCtWoXRzB1SjEmsYvaLhjMOEQ7d/aRHs+TuORJCrRJUTPjpH1QBgkpV/emzK2J6
         Q0yA==
X-Gm-Message-State: AOJu0YxZVHcBce1ekEnJacKCoWClMCXeEYfzxA3T7uN9tRw+DJ4JmoPz
	Xj4OScHo/WsNlix2ROCMditvg+YbSukEqD3lI/SFRDIQyeXakwaldnTipSd3DoF9Zcymzjh7xwD
	t+H0a
X-Google-Smtp-Source: AGHT+IGU6BNS2371EdkJqj76qqMk1PoV8egLiH3C4EtIAcUBi3t931XimxJjQECrUnyAMLD69Ipykw==
X-Received: by 2002:a81:ac46:0:b0:5e9:5538:d930 with SMTP id z6-20020a81ac46000000b005e95538d930mr472642ywj.47.1707159368661;
        Mon, 05 Feb 2024 10:56:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUFAaaeM90hk5jSAZgbP3IRxhj2i48ycidOcjd9soYxvCn3tCzx9m+WDB+j1edyld0mzWYzdg9XTHVCOCMGnWork0L70vw+f+t7LuMkTw==
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id u187-20020a8179c4000000b00600392410ffsm79414ywc.73.2024.02.05.10.56.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 10:56:07 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40f00adacfeso10975e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:56:07 -0800 (PST)
X-Received: by 2002:a05:600c:5185:b0:40f:dd8f:152c with SMTP id
 fa5-20020a05600c518500b0040fdd8f152cmr31004wmb.4.1707159366499; Mon, 05 Feb
 2024 10:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Feb 2024 10:55:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WyUzDXhr_g4C_5MiDioBt=9D0fkL2cQStP+EFmkydbsg@mail.gmail.com>
Message-ID: <CAD=FV=WyUzDXhr_g4C_5MiDioBt=9D0fkL2cQStP+EFmkydbsg@mail.gmail.com>
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

Pushed to drm-misc-next:

2592a36d9569 dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
@codeaurora address

-Doug

