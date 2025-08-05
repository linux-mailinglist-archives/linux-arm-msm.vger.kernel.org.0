Return-Path: <linux-arm-msm+bounces-67749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDEFB1AF1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A48316A883
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 07:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624DF22D4C0;
	Tue,  5 Aug 2025 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="CTJWqxy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB5211A05;
	Tue,  5 Aug 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754377464; cv=none; b=RK6c64CoBYdZXSoCAPStYRO6sXnY1P5Od8UtPVMdPt/Z3OX8w7kBCQM9WMV8+IN7CvwxYA94WP6mrYtSp3+YGcoZIGWUqTS2H57QevbiVb3jGqxRT3Hh1B4FhbjL03W1OUm5td2oFJRneLkcHGELjuKtgjh7yiHMv+c0/GtEl0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754377464; c=relaxed/simple;
	bh=5uDYOUMZrTejftPlMZKgHiBGagrW9EPJArJrhS8uH0k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UhJAsuNCxdn5pYgnHnsazFD6vD3ZUALfxphXepB078hdZB5LfZWn+mkHhzfuusziQuKpKtdGUcws1fshUX52mimphXdWtsUft672dwVvES7naPNsBmo6m/meeK0pWaCef3+tgzKywlTx+2qXZJQUbzp78UykT23obGsYRwZN+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=CTJWqxy8; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Im8AW2zssJUnDTA+iPhcytNyfBphTb1ooCqgE3qplAM=;
  b=CTJWqxy8Anxwgp4CEIE3T2l+gUxFksfonVJgE8CXdZEoVv71tuAIVB9S
   AN6aXPtwZQeMRFh5jyNnLpvIdp52UHbP6+TXdIAm7jOB7H+N0WDYrIU8T
   heuidlRIU+kBQnH9YvN74weSQG5Xo5fBMR9TbsWTJ+P7JhlewDu2I4/zD
   4=;
X-CSE-ConnectionGUID: bqWHRGIASii8Y6YX9IbZww==
X-CSE-MsgGUID: TH9HU7JESoaX4wctB4eEkA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.17,265,1747692000"; 
   d="scan'208";a="234188575"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 09:04:17 +0200
Date: Tue, 5 Aug 2025 09:04:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, kernel-janitors@vger.kernel.org, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Marijn Suijten <marijn.suijten@somainline.org>, 
    linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Drop dead compile guard
In-Reply-To: <CAKXUXMzgABnN3bbV58xVwYNithcUg7fZgW0DxGCngJnNgNzrfw@mail.gmail.com>
Message-ID: <e6e82d2-8ae3-d448-d28d-1e54ffabcdef@inria.fr>
References: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com> <d7093377-a34e-4488-97c6-3d2ffcd13620@suswa.mountain> <CAKXUXMzgABnN3bbV58xVwYNithcUg7fZgW0DxGCngJnNgNzrfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1516920272-1754377457=:3539"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1516920272-1754377457=:3539
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 5 Aug 2025, Lukas Bulwahn wrote:

> On Fri, Aug 1, 2025 at 5:33 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > This patch removes some dead ifdeffed code because the KConfig has a
> > select which ensures that CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is set.
> > Konrad was wondering if there are any tools to detect this sort of
> > thing.  I don't think so.  I think the only thing we detect are
> > non-existant configs.  But let me add a few more people to the CC who
> > might know.
> >
>
> I also have a simple script to search for unused configs, but that is
> just five lines of bash and then a lot of manual filtering.
>
> If I would attempt to implement such already rather complex analysis,
> I would start with looking at this tool:
>
> https://github.com/paulgazz/kmax
>
> Possibly, there is a good way to re-use some parts of it or extend it
> to look for the pattern above.

If there are ideas for improvement of kmax, I'm sure Paul would be happy
to hear about them.

julia

>
> Lukas
>
> > regards,
> > dan carpenter
> >
> > On Thu, Jul 24, 2025 at 02:23:52PM +0200, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >
> > > SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
> > > check.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > > Is this something that could be discovered by our existing static
> > > checkers?
> > > ---
> > >  drivers/ufs/host/ufs-qcom.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > >
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 4bbe4de1679b908c85e6a3d4035fc9dcafcc0d1a..76fc70503a62eb2e747b2d4cd18cc05b6f5526c7 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -1898,7 +1898,6 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
> > >       return 0;
> > >  }
> > >
> > > -#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
> > >  static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> > >                                       struct devfreq_dev_profile *p,
> > >                                       struct devfreq_simple_ondemand_data *d)
> > > @@ -1910,13 +1909,6 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> > >
> > >       hba->clk_scaling.suspend_on_no_request = true;
> > >  }
> > > -#else
> > > -static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> > > -             struct devfreq_dev_profile *p,
> > > -             struct devfreq_simple_ondemand_data *data)
> > > -{
> > > -}
> > > -#endif
> > >
> > >  /* Resources */
> > >  static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> > >
> > > ---
> > > base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> > > change-id: 20250724-topic-ufs_compile_check-3378996f4221
> > >
> > > Best regards,
> > > --
> > > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
>
--8323329-1516920272-1754377457=:3539--

