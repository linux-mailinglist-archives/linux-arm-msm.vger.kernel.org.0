Return-Path: <linux-arm-msm+bounces-20241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D808CC423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 17:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA012843D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0477654656;
	Wed, 22 May 2024 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbigJODn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C0770F1;
	Wed, 22 May 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391945; cv=none; b=DQckZd6YQplZXjyHm6UHc7p5f2wu+kcsXBNP2cDBiHJqjQItllwV1K3EoW5ifXk/v0LVMI5X6LARFOiRQkqZ6grBW08spjrne2H4MS/yUSSO45orCK5aQFcWctvPucXfQ5zMjPgAOCiy6IG+TvqoH2omkYP4MHtBpnYXxijqZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391945; c=relaxed/simple;
	bh=pk7gL9KFnLHCIcDNZkl0FBoe2u3ggrO0NEiXwJ6x+Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxXjx+ugMgzecvCH6ydef2IyEA3pQMciWC3Xl3OfoFQjiRk2U0A/+E0bDvSTcSLSbBIpDbuPN6XPYPXEQd2CAgmuHR9XOFp8UeoZe5tEQvGLdg7ki0MD0Tk3r0/bOBWeoTav83GVjxEV/fVXJ/8wYNxezXaW6SZT0KVeLN0h2L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbigJODn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572b37afd73so11673335a12.2;
        Wed, 22 May 2024 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716391942; x=1716996742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3Viv2LgBYblTqqidUO+On3iQhxj1js86l0CizZE8cQ=;
        b=LbigJODn1m80IK0Dm4FuIlvdDZ/2PjmFBS/vF7Q5UfsBP28clOZ5V2O68D4RwMOtus
         CIi0/Xs3VNIewFDAWH2CbgnQApMhIFSvyNZylncN/or8UnM9yItrD3mMfditJ8xRdmnL
         me8qBN0ArOQl/gI/wY4GghhyNKs5+XyO+ZR7aVzrfq2Up0v9b1W2LB5liUCbJpvYBDmF
         lVD/IHHzR2c/rHGKmavDMTBKlNJGOB1MMbvLoXr2t6fm34qzt7+jVOjmC68O4JZHTDvE
         Mk7HXMd2vA12+P22IjQL1ttCPiDi/NLVZNK8iZdfNOKFbmlTeIuWZTDprMglfyerXpcX
         pTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391942; x=1716996742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3Viv2LgBYblTqqidUO+On3iQhxj1js86l0CizZE8cQ=;
        b=ZsTq+l6DZoK401QCTqWa79EnVgPXES1rwQvITYW+zfRZ33qqre7fUNGMNO7Nqb0gtX
         /JH4PmYziI5FsTSwsyk17x2vtU/+pPiIMTocrRRwdEoMGCOrLfPZV2LCZBg3HmAkgZig
         uI1ITvxJblUerTv2u+XZWN/ktqFJrurrzDmQoy8lxIfuvO3dDQtqvE//aYT7nttoDfuS
         Kz6VJXln1uc9XI7lUklmkP7fnpv0R2scrS2Zzu2RuVbpsgIulQezUAdZio0hNO0kS7et
         6pamZTVMtczqbz9wl29gmK217LaLElmf/MnIx/woA/rIX9A7igGXWgY/5tmjAfgxRVmE
         Bi+A==
X-Forwarded-Encrypted: i=1; AJvYcCUPWvq/BP0oKYnyI3GAlFJjaNq7TMAgxruu4kUGiOzoOCU5XAA5n2z/EN6vxk7MkJzrmjJbw88eQaBrTpSsGIsHkP2mioWRl+eIi4CkE6vms4Cqqzt3m54qy0HvEFPLI2ejrKmWkse97lk0Gg==
X-Gm-Message-State: AOJu0Yw0H9CZMC08AQ3oxMxcv3DHA6DbHQ83I20yVmg2kO5xoPPz05e7
	y8rkeNlWy2TFbn0i9HMeZW6TnIG/f7mdhTFJve75ELlfzVvAdtDRcSD0ntee1fBULA4pvjR8SXk
	HGYmW2PuCfnI4CnUXnU7OvcfVhYk=
X-Google-Smtp-Source: AGHT+IH5HcME7lGOWDOdDwP9jdihZAipJCFAzwf/J2QQDekZihZ5LC0rYZLOM07LyJYn+gzVqndQwHXb7J+X2KnN/mU=
X-Received: by 2002:a50:9349:0:b0:571:fc6b:966c with SMTP id
 4fb4d7f45d1cf-57832a2678dmr1401490a12.13.1716391942380; Wed, 22 May 2024
 08:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072330.229076-1-pvkumar5749404@gmail.com>
 <Zkzz7PZUnU/xP/O2@hu-bjorande-lv.qualcomm.com> <CAH8oh8UY9FkHy=RyMU2AOZr+1x_KyH4m166kVmQd6peRNvFVTw@mail.gmail.com>
 <Zkz5WtB0pBLqlc+3@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zkz5WtB0pBLqlc+3@hu-bjorande-lv.qualcomm.com>
From: prabhav kumar <pvkumar5749404@gmail.com>
Date: Wed, 22 May 2024 21:02:09 +0530
Message-ID: <CAH8oh8VL8Tn_w_pDRzW9UzwS27RF_Zq3OFa_aNqPPyuH8z=5Eg@mail.gmail.com>
Subject: Re: [PATCH next] drivers: soc: qcom: Auto cleanup using __free(device_node)
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	julia.lawall@inria.fr, javier.carrasco@wolfvision.net, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 1:13=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Wed, May 22, 2024 at 01:01:22AM +0530, prabhav kumar wrote:
> > On Wed, May 22, 2024 at 12:50=E2=80=AFAM Bjorn Andersson
> > <quic_bjorande@quicinc.com> wrote:
> > >
> > > On Sun, Apr 07, 2024 at 12:53:30PM +0530, Prabhav Kumar Vaish wrote:
> > > > Use automated cleanup to replace of_node_put() in qcom_smem_resolve=
_mem().
> > > >
> > >
> > > I don't find this easier to read or maintain.
> > Should I change it , explaining the change ??
> > >
> > > Also, your subject prefix does not match other changes to this driver=
.
> > The patch is to add a __free function attribute to np pointer
> > initialization ensuring
> > the pointers are freed as soon as they go out of scope, thus removing
> > the work to
> > manually free them using of_node_put.
>
> Yes, that is what the __free() attribute does, but I don't find it
> easier to read and unless I'm missing something you're not fixing an
> actual issue here?
>
There is not any issue here, the patch sent is the cleanup of unnecessary
of_node_put() function call.

Thanks,
Prabhav

> Regards,
> Bjorn
>
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> > > > ---
> > > > drivers/soc/qcom/smem.c | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > index 7191fa0c087f..ad1cf8dcc6ec 100644
> > > > --- a/drivers/soc/qcom/smem.c
> > > > +++ b/drivers/soc/qcom/smem.c
> > > > @@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qco=
m_smem *smem, const char *name,
> > > >                                struct smem_region *region)
> > > >  {
> > > >       struct device *dev =3D smem->dev;
> > > > -     struct device_node *np;
> > > >       struct resource r;
> > > >       int ret;
> > > > +     struct device_node *np __free(device_node) =3D of_parse_phand=
le(dev->of_node, name, 0);
> > > >
> > > > -     np =3D of_parse_phandle(dev->of_node, name, 0);
> > > >       if (!np) {
> > > >               dev_err(dev, "No %s specified\n", name);
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > >       ret =3D of_address_to_resource(np, 0, &r);
> > > > -     of_node_put(np);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > --
> > > > 2.34.1
> > > >

