Return-Path: <linux-arm-msm+bounces-20159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EAA8CB443
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF14F28514F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BF0219ED;
	Tue, 21 May 2024 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhhHJnLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A721DFE8;
	Tue, 21 May 2024 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319899; cv=none; b=qENMt5DgZ39s/3xuAgrjanttFRr5kQkWkahRUx403Fq38XmnpqghU4awmttstyWAcTugERdM4fV7/4K6Y7eXv6jmIm2KFaWQhyn4OAV9m5WusiAKlRJ7Kg2Kw4Gtf12ICI7E3sYT0TbVBCR7uO9WQrgo5WxDO0o1nteABT+80YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319899; c=relaxed/simple;
	bh=78K19Qcg2otxUfwNNuP0p0Mlmh93smXOvqGrf3iT4/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWgMPsFnZsFdl2pAbPCMGjWRXUjWncwHjwvzwKrFaa463lUuGJLPxpPHdeUaLS8tMQxWes9Z0YjUKyF4Ervb4s0Ly2cAkxqgrpZRHdcyiCeumXOt/AhqzmNZsgbRpNMcl3SrUzUhnKh3DfnukF4NFXpV+Lv39zpOjHtvVKUW4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhhHJnLL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so6364648a12.1;
        Tue, 21 May 2024 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716319896; x=1716924696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53Zorp8t5qnAddy2gdK2PGGiuFQcaDuK99jXkcIzJFE=;
        b=HhhHJnLLUSlbNKHrnax2RKKWbuKt8iKMgB60v4nzY9hr4ArzQqvVg/ZZIYyFOuTbU3
         TRoYXEdLq9/x/v1VeD+U0bipSp+zFyGkA7QwSZW+07zTHfTBZEWjs709zC/JzgOYceCW
         UXZRcMqZy64yG7s1docvgIQQ/gloVSHK4lwcM7CKJHsmBbIf4xvkWuopGsdbLBMt3iC/
         7m81OybyIOHxm++yD9iXpxYRm2hMh+P4lo2MpO/1tmzboIhzTZbFAmUj1R+YNFjHWzf3
         IeM2AgNQjtrdwp5efrF16l5Zk+1F1R0zl3rgXA7X4vCXvl0EGoy0iQ0mn/8LF3oPAwhT
         NcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319896; x=1716924696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53Zorp8t5qnAddy2gdK2PGGiuFQcaDuK99jXkcIzJFE=;
        b=rSfZhPtrMpp37lQeduPxIqQP7laHuYqMYjzQ8fTXTnvh4DbMJyvD073uqqG8HQOOcR
         Atl/GTegWpFL3/SKLjS5fpYj+TbboMwl6IM/l8swFPX7kBO+ZJhWArb1noHTdD+n02QL
         tG1vGEC7CeDMpiz/UdNRRlVv+warQ0O/uKelpv5QfC/cW7lcchcCm1Hl18b7U1VCbnvO
         U1FrEG2na5v+i9x0dXZqNnyR/AcpjdOmZ+tQRp0o5o46YFJY1OWSFgX6ZWs8q6Se+W2A
         Xnj7jwOoxvkFMsmgJ6okUk8v69/6R1jjtzkW8i6KMuk8cdzeuxd4byVFRzl7r3zwsXdo
         6f7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKXem3OST+tEWYT9s0q8qswNvsEQqOhHwgynmoqAvP08GC1Dy2oGo5oJ2P2UMv+hvlLHhqJ+Xb3MP0fDUDdIaDP1hqUp36G8f0Qxti97dmBAEtY7oHEEvLiJspBlFye7LAxSYTq4425CJMug==
X-Gm-Message-State: AOJu0YyFs+7lgZDH/cFaySWO36uVbiJV4Op7KGzsWPSiS/fa8Q3tDJip
	3Jgh+z1mYj34OdzGgX3dEgZZn9Hye/C4BIVP8p+0VglfeuUzPT79pn+TxX137XsaW73BQYvJFL/
	OwcdHEu1dRyKQh3Xf/RuQG8wToL4=
X-Google-Smtp-Source: AGHT+IG9JDR+hmtIE8rrtTpMznEtqUQ6HnuawCJM0UbbL/mnbMYdyNsYaR2pFyINafRu0RKprDAF1I3xCSYuBg/pmQE=
X-Received: by 2002:a50:8d16:0:b0:568:1882:651f with SMTP id
 4fb4d7f45d1cf-5734d5cf95amr23347950a12.25.1716319896019; Tue, 21 May 2024
 12:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072330.229076-1-pvkumar5749404@gmail.com> <Zkzz7PZUnU/xP/O2@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zkzz7PZUnU/xP/O2@hu-bjorande-lv.qualcomm.com>
From: prabhav kumar <pvkumar5749404@gmail.com>
Date: Wed, 22 May 2024 01:01:22 +0530
Message-ID: <CAH8oh8UY9FkHy=RyMU2AOZr+1x_KyH4m166kVmQd6peRNvFVTw@mail.gmail.com>
Subject: Re: [PATCH next] drivers: soc: qcom: Auto cleanup using __free(device_node)
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	julia.lawall@inria.fr, javier.carrasco@wolfvision.net, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 12:50=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Sun, Apr 07, 2024 at 12:53:30PM +0530, Prabhav Kumar Vaish wrote:
> > Use automated cleanup to replace of_node_put() in qcom_smem_resolve_mem=
().
> >
>
> I don't find this easier to read or maintain.
Should I change it , explaining the change ??
>
> Also, your subject prefix does not match other changes to this driver.
The patch is to add a __free function attribute to np pointer
initialization ensuring
the pointers are freed as soon as they go out of scope, thus removing
the work to
manually free them using of_node_put.
>
> Regards,
> Bjorn
>
> > Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> > ---
> > drivers/soc/qcom/smem.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index 7191fa0c087f..ad1cf8dcc6ec 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qcom_sm=
em *smem, const char *name,
> >                                struct smem_region *region)
> >  {
> >       struct device *dev =3D smem->dev;
> > -     struct device_node *np;
> >       struct resource r;
> >       int ret;
> > +     struct device_node *np __free(device_node) =3D of_parse_phandle(d=
ev->of_node, name, 0);
> >
> > -     np =3D of_parse_phandle(dev->of_node, name, 0);
> >       if (!np) {
> >               dev_err(dev, "No %s specified\n", name);
> >               return -EINVAL;
> >       }
> >
> >       ret =3D of_address_to_resource(np, 0, &r);
> > -     of_node_put(np);
> >       if (ret)
> >               return ret;
> >
> > --
> > 2.34.1
> >

