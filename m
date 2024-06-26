Return-Path: <linux-arm-msm+bounces-24392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3596919AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 00:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CA9BB239DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844F51946A3;
	Wed, 26 Jun 2024 22:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjPa1rQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE0194133;
	Wed, 26 Jun 2024 22:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719441162; cv=none; b=FrMO0HLyGG9bGeH8nVaXr3bpDCkiIXcBUSEv28JH69rpoCRBId8/01N+leREeLDYe9qxu/9UJICWh5q71jTwR+5pgpWbRDP4BaArLBTjnUKqubV6W9X9SgdX2508Ed7Z7QMQlEj37XiLsA3eng9YKhcXMos16bgD5XcAGY/i8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719441162; c=relaxed/simple;
	bh=nQS61/CVQjJorMBycN9kyNZ19xcC2CiHekPCBW6Y/+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khF8ipbIusHgA+6W5WXhiT/lA5nEg6UuV/8bhbg7DF3NQ2U5i+OVP5/D6B7xNV3fe6yE/YMePr/79ARI5t4bOY1S3LzvpWq1jHA52hhDzroXQL0P18b4r3DOZGMLNbZDucqNn+D3bWBfnT2gPyf0lXBkhUpDuXDxXeM6Uy1rlAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjPa1rQ+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso1039315a12.2;
        Wed, 26 Jun 2024 15:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719441159; x=1720045959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U36grdanXj9yAh+pNda5S+WRPO+QWYAY7LoWhNNT3IY=;
        b=TjPa1rQ+df3L1dtWq+4vrErYELr3NvbBfo8ZFTn1FP2a0iLXmP9bADNYu7pPGxXM+G
         bE2Yvl7psG6DXG2KK08KLc0YN2BKxwFdKhCV8b7p+Ifs71oWUlFTPcR/LlvSBaOp0DlG
         8cjFBXNLWCCFcAS6SLt3u8BejCUSTfL9QBadkrpBQu0HeLSiCJZ4J12utkzbyqk0XpZK
         ibSP9yJZK67e8B9Yz/5V9329P9fol7oq/J//ueUXyVW+kYR+r+xAFN8IGDWGfSm5i5Lw
         6YPE+uEakW32UQvoMOQOzVaNshlQaK2ymTGc5G633a9u6q1h9itSlTRxMGfsASiLhrM3
         3fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719441159; x=1720045959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U36grdanXj9yAh+pNda5S+WRPO+QWYAY7LoWhNNT3IY=;
        b=mjeAWy/BtWutrxJh9Nfxo50ev9rgx3eWefzA9nywSGwYgd0DjjchlEzSsZ9Uq/D/y3
         44Od3/yn7LL4UQ80dIgsr6Bz+WwkSujHTxAP+S1pLE2RAHn0syd/Y0dZgRxXnBNqdLTz
         wX21SXMRXM4El33Xfdvk0tkeM32k9ON8KjKyV0+OZfPUsAcaz+lCsszq+Kqzt8E7/b0U
         LhYe2g/5saFZBu77CSa9NSXOR5ROU19BRqyJCoa+QkT6S/nWOmxJ/O14R4+5IjwrURhh
         DazplymDMc1HHQ5/QIpl+kjXDIe7Ae8nJQFMIbraNQD/X6ZwrfGV729hx7QPbaRkRPcq
         LN1A==
X-Forwarded-Encrypted: i=1; AJvYcCWvom27xcJaTelpld1W+M2w6Y0gEvNNfcp6RIje8IXwD/P71FpYto5EGy80P1TPzMSrAkWurMMdX9snjFFI0SmtF3Ahu7B+V43gea0GX3GEiP7xQUaLGYnCB8d7pXR3a3bCTW0MBwTn3U1WGg==
X-Gm-Message-State: AOJu0YxQXp0d4GzuqNLJz8T9NcayO7e3ycppcM5BC64F3CbM32um3jnQ
	EcDimjvcDH72Q2WJMILkLMonissN23FKapx4SHT+lLNdMdTBYYrha1+4yNctEmdOMMmcEBX4uOb
	gE5AT+XPALkiKnOcBpB0v7KE/DB4=
X-Google-Smtp-Source: AGHT+IHb98roHx5g3sBxWkKskttk5XU+NH37JopqIA/4bV6IWCJPWXBdw3kCMp992cniMQGn3EC2cUYVZE3FHSqDqKw=
X-Received: by 2002:a50:871a:0:b0:57d:7ef:573b with SMTP id
 4fb4d7f45d1cf-57d4bdd02bcmr10384352a12.38.1719441158804; Wed, 26 Jun 2024
 15:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com> <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com> <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
In-Reply-To: <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 15:32:26 -0700
Message-ID: <CAF6AEGsFExhokWqHka-cwFGqyYgo61OL=7F=o5ouRm-LoHh9Dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno <freedreno@lists.freedesktop.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:38=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 26.06.2024 8:43 PM, Rob Clark wrote:
> > On Wed, Jun 26, 2024 at 1:24=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> >>>
> >>>
> >>> On 6/23/24 13:06, Akhil P Oommen wrote:
> >>>> Add support in drm/msm driver for the Adreno X185 gpu found in
> >>>> Snapdragon X1 Elite chipset.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>
> >>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++---=
-
> >>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> >>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> >>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >>>>   4 files changed, 36 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gmu.c
> >>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *g=
mu, unsigned int state)
> >>>>      */
> >>>>     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> >>>> +   if (adreno_is_x185(adreno_gpu)) {
> >>>> +           chipid =3D 0x7050001;
> >>>
> >>> What's wrong with using the logic below?
> >>
> >> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> >> changes in the chipid scheme within the a7x family, this is a bit
> >> confusing. I will try to improve here in another series.
> >
> > I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh
> >
> > Maybe to start with, we can fall back to the existing logic if
> > a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
> > a6xx/a7xx
>
> If X185 is not the only occurence, I'd second this..

basically all a7xx are "special" compared to the original logic, so we
can start with using gmu_chipid for just a7xx

BR,
-R

> Konrad

