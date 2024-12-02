Return-Path: <linux-arm-msm+bounces-39926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704F9E0BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B83CFB23C74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57C1714BF;
	Mon,  2 Dec 2024 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M3pa37eC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7017084F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155992; cv=none; b=Zf9UmSNRPe3arn0Jk6bXl2KLjnx/Sgo3qvu7+Tp1+5VuwT0LaA3RLBWfWUNQKTcxR6KH36fp4iWf9B/YcFlDyJx3px7Xs22Gt/aWWguJCYITMfPqTPqaQ26M/pq7du2UDArplRrEXsVE4Hi1Y/iAE2JYXXFJ2kXXoKsvjpnpgHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155992; c=relaxed/simple;
	bh=7jZTOSAwZM687/4IxljIJ+4sBELVFnFczjjMTXnd6MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDgFkCzLBTXRagX72twJEEeas4qUT39ph+LqrRmZkyEH6OX7Cq+rG6KaK9WDQaxGg9IuH2dIQuGCCuHdZ8XJjo894fpiIwtwtHLJsZlV4uzq57Gq9BC78lNVaYtAtIRGS+TG/rxbUxXgjvrFG8iZQUM0eUrJ76I2Avx3FvtLWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M3pa37eC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so64626011fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 08:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733155988; x=1733760788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZViN9u7WEeef4ck6iMwRDaJEybzCZmgvmXDAyqUy/E=;
        b=M3pa37eChsRxzdqPDbXz+ccFuJBmsw4jO6y0fJMztT88u4rH1g1AVTQuVYfmrF+fN2
         MVKxBesmdKJEwbwL7WbFL68ubQA6dl4z3Fw2vFFCbexgonndpKoGqfWf75S+ki0xYJHo
         6Z6gatHLkczI5hXyG4yIY6EEreJbMH0fTRapQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155988; x=1733760788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZViN9u7WEeef4ck6iMwRDaJEybzCZmgvmXDAyqUy/E=;
        b=w4GJNRkFKS3KiXyiK5u4npaaNItiJRSU/fbgOePb4XguxWbN133EnMN09Kaf2q4ADx
         8HVEZZEtob7DgSyVkmsiTSiS6NgubppnTYG7V3ZupC6IkppF4WJUo4UB0fgRZx8+hghx
         Rmlc3K3gqXkyCSYWLiyaKsrZMQgO1J3x+Uu9G1GDCeFv5vAh/p/ZMJLnLSorZLdeD2Yl
         losCK+D+l0WZW3TGbekvNTRb2CUCrPfw3d3VTv7WW3+VIA/YEEXwyF+XbMZr5nQFXTWu
         OmNgyt5wOoF9bTJCE35e8/E0tgAG/VQt6f62ZmSCecC+Cf5RnUR3N9zPb5pJKk1WIehK
         VV3g==
X-Forwarded-Encrypted: i=1; AJvYcCXDaX72Ibe+ld0Z4LHnnl711f+VWC3e5O1lr7mdiwJym6xBvOBZouX8RYzcaWupleWiXPmODlvq71/HWbyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQ+prPLmRV03IluFGXWfe2VOuWQ00+aI/FEjXUb6B0rdaQYAW
	2FRAfYI2GyD55MZTAQiRZqLONYRZpgtkPKF02r4O9sM7fY94EjKU5HhHf9T6pIk1Z7M9sjBPnpJ
	tIg==
X-Gm-Gg: ASbGncvtbDC2IorVfQFAQH2Tb6mhTmkx2IS8uUl92CzDnvODkJ9uiPtBe4jg8phh9iF
	7KHXJ59HTFlpwYA9QkgQvjImWpeJpt+tQRqKGFtC4VX1u/tGFZ0RDBZzwq61Ll2Tdrx4QA24Rpt
	KdTXhD4awfi+7uZXwQq+G71wRTykvSKdLVBbFi1Pj4B2DUpZ5NyQ0CEDndbrBKzovSHPFGF4QzF
	TRd6rEaVboBHKBw8XZiUSj2Aisc5cwwavjC0i70c4QfAVYg1dhOjSGrXE4YxomIiuezMUldBvZY
	KaszZ/d/at9kJQ==
X-Google-Smtp-Source: AGHT+IHn8Bt12P4D7LGIjw0BO78NO8SPGcPNIqwAliGFdxQR6J/2f3NkJ0bdVIu2T1BOG8p0sS+EIA==
X-Received: by 2002:a05:651c:2119:b0:2ff:a8dc:6fb8 with SMTP id 38308e7fff4ca-2ffd5fcc1f1mr177433511fa.8.1733155988269;
        Mon, 02 Dec 2024 08:13:08 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc75055sm13187811fa.73.2024.12.02.08.13.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:13:07 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7525966e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 08:13:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIXZs01syHkEPnuPT7yevu6klCyj+7LyrkUJNPPTuVSmYgEZItyypzJifjMOgq+GZ5ILRwxH7MrGVQ23fP@vger.kernel.org
X-Received: by 2002:a05:6512:2396:b0:53d:ed0a:8113 with SMTP id
 2adb3069b0e04-53df00d01b2mr15721785e87.14.1733155628493; Mon, 02 Dec 2024
 08:07:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
 <20241130-hp-omnibook-x14-v2-3-72227bc6bbf4@oldschoolsolutions.biz>
In-Reply-To: <20241130-hp-omnibook-x14-v2-3-72227bc6bbf4@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Dec 2024 08:06:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJR3O=8xHtdPapwtDS2ShL3SVTyvzNgOTNjp4U7OGO4A@mail.gmail.com>
Message-ID: <CAD=FV=VJR3O=8xHtdPapwtDS2ShL3SVTyvzNgOTNjp4U7OGO4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/panel-edp: Add unknown BOE panel for HP
 Omnibook X14
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 30, 2024 at 11:09=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Seems to be like NV140DRM-N61 but with touch. Haven't disassembled
> the lid to look.
>
> Due to lack of information, use the delay_200_500_e200 timings like
> many other BOE panels do for now.
>
> The raw EDID of the panel is:
>
> 00 ff ff ff ff ff ff 00 09 e5 93 0c 00 00 00 00
> 25 21 01 04 a5 1e 13 78 03 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 a4 57 c0 dc 80 78 78 50 30 20
> f6 0c 2e bc 10 00 00 1a 6d 3a c0 dc 80 78 78 50
> 30 20 f6 0c 2e bc 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 36 ff 0a 3c 96 0f 09 15 96 00 00 00 01 8b
>
> There are no timings in it, sadly.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

You should drop this patch from your series since I already landed v1:

c1bae6802ee9 drm/panel-edp: Add unknown BOE panel for HP Omnibook X14

