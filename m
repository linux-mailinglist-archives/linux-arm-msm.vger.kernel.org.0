Return-Path: <linux-arm-msm+bounces-17507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5908A5BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3BE1C21A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130F6156652;
	Mon, 15 Apr 2024 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="InMLCVRK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7B156225
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211179; cv=none; b=UIm4GGeggkPmW0h39J0coNZx9ZYteNwM70daJ+nnOJ6aYPObrsXAkSGS41ed/UO3B0feIWz4ctgVXpse9Mc0kq8JF5rHcO1tvQjcnXjSIb+rvzmu6ayWPveKUkWwVeqgetjB2iQ23Bv9o9olCZcQPJ4F6YpQml3dYaof1fTJxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211179; c=relaxed/simple;
	bh=3f44RVReelwdCSGbY3G3UnF/F1spdxFNz4KzB0EHUe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oysQGVUfYKKaJ4A2UD19jDto/LOqmGDmLMjqaWKJitgsT3IwJAzqxnHd1GETw43dyGk2ab8HZ3yZmGwQ0gQ1mIsgLkyZxN3zdb6+aPl3FE6A3OnINvh31Nqt/T4iEpMU0GyJ6eshcgwY9WBFr5kpNmv3UJr26buGpex+rUqP0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=InMLCVRK; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-23319017c4cso2480319fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713211176; x=1713815976; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=naj/YQ9ncheD39vcOQ7UyQeYC8KWCng+2i7jmecCLPU=;
        b=InMLCVRKrobzzqU7PbcnfUjvf0mv+o0+Hs1VY+Kv20hLVPml+uG5HYITTACznfY0yn
         UssyI7yn0R2NHaZB5xvRlOFTaNVwXZvRh2jiDURy67s4gcix10FmjT8KKOAAR+vbdPd8
         1OcIjeg4//jD5veQPFnDl15wmR7JPgJaQuKHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211176; x=1713815976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naj/YQ9ncheD39vcOQ7UyQeYC8KWCng+2i7jmecCLPU=;
        b=gtBcT5DHSkPoMXeQEa2LkcbPJvgZg7JpYKoa45M1YIIW4b5qosfy4iZ2zUIqSUykGV
         JgjDdpnsAo1P0CSTNMnn1kYyD3wVqjZX2eq2aoBw8OGZ+QQ/tFHkVVjv5otCTZojDrOJ
         +Ht2ejSmVS8kDTsHHgr5KX+6qhOD5sqlx7QhIQSJ1cUM81RT541QNTshDvK2Nkff7VWq
         FR3bt78pgpTKrF3eYz7TUTz+MstVq/rx2BLWhZxSW6DBdffDh94RsztE7XVMjtMdJbCQ
         eoBuJAmDGts1lv5wa6zzZRlKqpJLt6aEYio4nGqfQRC1A5ateB6QX8ymJ3HXbfRHee34
         RwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe67R9thBIbk/x8i9Xgj7+bauC2+7smcx8yBaKG9EHRhc+x/VDDkzZiw3WDgpxW/bS8jKp1qIp/RHnnfHGOPkRIiwAcYoo3zJ2FYZlGg==
X-Gm-Message-State: AOJu0YwCU5RU9MOigewD2IaeK/5hQH6L/kuOe/DLAbnY+VlsqABx6EDd
	j5hrsuwb7WyQ4scnSKoy1ZdHqG8NhnnrPd1/FlW5FMui9YcLpuStPjbALFHGLRmRchu8klfe75x
	+Jg==
X-Google-Smtp-Source: AGHT+IG5l5icaBGht6tb1EsJpRK4K5KtLTxhmGHP4ofJmo/sTsoa62ZauKjd/B6LklPjhQ2/b+VgeQ==
X-Received: by 2002:a05:6870:b52a:b0:22e:9806:f97a with SMTP id v42-20020a056870b52a00b0022e9806f97amr10994596oap.2.1713211176049;
        Mon, 15 Apr 2024 12:59:36 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id hi8-20020a056870c98800b0022f126c98e0sm2430675oab.3.2024.04.15.12.59.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:59:35 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6eb8809a44eso508710a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUzSoc62345UN0aYmeNyGEF3Hojyuz4jIw7bvX+IXgSXrSFfR6vUcJOOSmqLNq1GimflUkwHM4By32J6yAEC+O3J6NFGTeXQKBny7+jQ==
X-Received: by 2002:a25:ab2c:0:b0:db9:794b:5733 with SMTP id
 u41-20020a25ab2c000000b00db9794b5733mr10827321ybi.19.1713211153708; Mon, 15
 Apr 2024 12:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org> <20240415195348.GD22954@pendragon.ideasonboard.com>
In-Reply-To: <20240415195348.GD22954@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 21:58:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCteGngbSS6CCuUxM-PQiBz0W0WfoFr2E2oH2d8qt746_A@mail.gmail.com>
Message-ID: <CANiDSCteGngbSS6CCuUxM-PQiBz0W0WfoFr2E2oH2d8qt746_A@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 15 Apr 2024 at 21:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> I'm afraid I won't have time to review any of this for the time being.
> Unless you would like me to put uvcvideo reviews on hold ;-)
>
> Jokes aside, my first reaction was that this feels like a bit of a waste
> of maintainer's time :-S

This is part of the media-ci effort.

It is definitely not the most fun patches to do or review, but someone
has to do it :)

The whole idea is that we want to get as little warnings as possible
from the static analysers, after this patchset we almost achieve that.

It is only 2 trivial uvc patches, I can ask someone from my team to
review it if you want and trust them ;)

Regards!

>
> On Mon, Apr 15, 2024 at 07:34:17PM +0000, Ricardo Ribalda wrote:
> > After this set is applied, these are the only warnings left:
> > drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on line 689
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
> > drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on line 768
> > drivers/media/usb/go7007/go7007-i2c.c:125:1-7: preceding lock on line 61
> > drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153
> > drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:154:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:171:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:201:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:220:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:230:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1008:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1014:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1267:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/staging/media/atomisp/pci/atomisp_tpg.h:30:18-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > CI tested:
> > https://gitlab.freedesktop.org/linux-media/media-staging/-/commit/055b5211c68e721c3a7090be5373cf44859da1a7/pipelines?ref=ribalda%2Ftest-cocci
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Ricardo Ribalda (35):
> >       media: pci: mgb4: Refactor struct resources
> >       media: stb0899: Remove unreacheable code
> >       media: uvcvideo: Refactor iterators
> >       media: uvcvideo: Use max() macro
> >       media: go7007: Use min and max macros
> >       media: stm32-dcmipp: Remove redundant printk
> >       media: staging: sun6i-isp: Remove redundant printk
> >       media: dvb-frontends: tda18271c2dd: Remove casting during div
> >       media: v4l: async: refactor v4l2_async_create_ancillary_links
> >       staging: media: tegra-video: Use swap macro
> >       media: s2255: Use refcount_t instead of atomic_t for num_channels
> >       media: platform: mtk-mdp3: Use refcount_t for job_count
> >       media: common: saa7146: Use min macro
> >       media: dvb-frontends: drx39xyj: Use min macro
> >       media: netup_unidvb: Use min macro
> >       media: au0828: Use min macro
> >       media: flexcop-usb: Use min macro
> >       media: gspca: cpia1: Use min macro
> >       media: stk1160: Use min macro
> >       media: tegra-vde: Refactor timeout handling
> >       media: venus: Use div64_u64
> >       media: i2c: st-mipid02: Use the correct div function
> >       media: dvb-frontends: tda10048: Use the right div
> >       media: tc358746: Use the correct div_ function
> >       media: venus: Use the correct div_ function
> >       media: venus: Refator return path
> >       media: dib0700: Refator return path
> >       media: usb: cx231xx: Refator return path
> >       media: i2c: rdacm20: Refator return path
> >       media: i2c: et8ek8: Refator return path
> >       media: cx231xx: Refator return path
> >       media: si4713: Refator return path
> >       media: ttpci: Refator return path
> >       media: hdpvr: Refator return path
> >       media: venus: Refator return path
> >
> >  drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
> >  drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
> >  drivers/media/dvb-frontends/stb0899_drv.c          |  5 -----
> >  drivers/media/dvb-frontends/tda10048.c             |  3 +--
> >  drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +++-
> >  drivers/media/i2c/rdacm20.c                        |  5 ++++-
> >  drivers/media/i2c/st-mipid02.c                     |  2 +-
> >  drivers/media/i2c/tc358746.c                       |  3 +--
> >  drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
> >  drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
> >  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
> >  drivers/media/pci/ttpci/budget-core.c              |  5 ++++-
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
> >  drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
> >  drivers/media/platform/qcom/venus/vdec.c           | 15 +++++++------
> >  drivers/media/platform/qcom/venus/venc.c           | 19 +++++++++-------
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  5 +----
> >  drivers/media/radio/si4713/radio-usb-si4713.c      |  8 +++++--
> >  drivers/media/usb/au0828/au0828-video.c            |  5 +----
> >  drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
> >  drivers/media/usb/cx231xx/cx231xx-i2c.c            | 16 +++++++++----
> >  drivers/media/usb/cx231xx/cx231xx-video.c          | 10 +++++++--
> >  drivers/media/usb/dvb-usb/dib0700_core.c           |  4 +++-
> >  drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
> >  drivers/media/usb/gspca/cpia1.c                    |  6 ++---
> >  drivers/media/usb/hdpvr/hdpvr-control.c            |  4 +++-
> >  drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++---------
> >  drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
> >  drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++++----------
> >  drivers/media/v4l2-core/v4l2-async.c               |  8 +++----
> >  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  1 -
> >  drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
> >  36 files changed, 132 insertions(+), 129 deletions(-)
> > ---
> > base-commit: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
> > change-id: 20240415-fix-cocci-2df3ef22a6f7
> >
> > Best regards,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

