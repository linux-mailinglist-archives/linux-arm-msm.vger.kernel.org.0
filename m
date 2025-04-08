Return-Path: <linux-arm-msm+bounces-53584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CED30A8142E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 20:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941391BA3922
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320D0216396;
	Tue,  8 Apr 2025 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bG+1as5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3C23A99F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135236; cv=none; b=qBkRu7ByHaSgOWFWEydhnf8V8aPKC7yP2ucl48TfkKbipdyK7YBvwmYy+GCdN2GxykKknQJ6u3YLk6Im1xLIrHewHSjO/ZobmCEYP6HXAK6u8G3yViO1rosPGKvaIbuSUuAGNmMbNK/IqZJRs7EbBhc+qNJLz+YWhd4PfPmrqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135236; c=relaxed/simple;
	bh=IKRxW8iOvOnceIWgj2+pn9aFnGfhMnhGEcl6HM1Y/2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aszfmwHB+gx55rAvHIORGhkDkzJMdBw2MtcD0qV0GJPSnQWFN01rcaBXXTeBVhR1VpRQNWL3/kEuoJakDHDgmWpmbhOTP7B1nn++w/DUDiAZ+vHXVwHdzyMOU671itZ08iemA0+DJieLszXOcdN0fTIZR9S59xf9exJLnTrVe/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bG+1as5e; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5232055b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744135232; x=1744740032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+0LerDyV9VF61DFjpKkcTVQ+Gx5OvKrFKicvV3UQ60=;
        b=bG+1as5e0Hgqw3O3kXf4NvDmKaHfQmHce0DHomVUkrawe7kNRqNR5rewL7mj6wF0FH
         17MEJqa/DTA5N9hauXqWDovekXVka+R/ddH1kROYQp35o6MvrYhFnLI2TyTlg31m+h0r
         RJ0MxUh9Pr2N7NhMX7q73qhiXbbI6mr5aMBOg6RqXAN2wB07WMqN0YmcwJwh8qsj+Nre
         cSy2BTgsCkyvA1324+zMCSPK0Rxx7zVffdm+yJoa3NnanNi/YOlvtaZJj4jN/TvHtY/j
         ETM/46+EmJFss+YxoxtM7S9irjxmUOwkh785Ka+sd7nn6cfME2xkf/NyrsubUmuNfGSm
         6tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135232; x=1744740032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+0LerDyV9VF61DFjpKkcTVQ+Gx5OvKrFKicvV3UQ60=;
        b=g6XEzz7Xap5To15thTVl5IFhkg9NrdZdRrG42qP8IbV1osyakjxfM2IzDOVxJpprAN
         GU/U61k1Qk/lI0aOT1tlo+/BnQhsKLjBH/5rRHxYYaH/EVD7ZqygQjoz3L2RnHoFMNu8
         5Jo7B1K7WIhNClysnjl5BnyfQma5ZXdmhm0/TKiWDYHUdI35oztYMcBkKY6e1Icwd0qc
         dQxcWqTH19AdV8lEgRTQwS/aaJ37vzxJn7Ak68JPXtIOhhIHaI50HpdNengDKfI6QL2h
         gJnmkUQAIuecWhyf7RIVwXkAQ9+OvNjiECLaDnCvSWcPd6VH9gePEdN3ihALdEbb2UJo
         +9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+i4sZq/HVTmpiPUgdNH/NkoffaxyMKKmN9/mOer0v3I1yIbosFiSiaFwO66Z47RPi3Kz5b2e+C1JemXO9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iWzPK/AZsEyvrQW9bizp2QeE1KnMpfUXzXDPfGJm4QVTjO+F
	XuKRZpjvbADm+HZA29ufZyM7FCsUlmRsdeHwpMPUdzQ2/bVXpPL0nKdL4KbiRyOUHea8hStHvpQ
	=
X-Gm-Gg: ASbGnct+fBt4/o8TkStSHIzPPErak1MQFU+mLRovBVonXErUw05gHbTJFfYFSTp04td
	OXL83+Uj655MP9zcNwFsTwxB8GFEfB4wd3DbOFPgEvtWVDRe1rDntSw0DoChE0oypWj2E7ut8gF
	ELDt/R6Eb0xEhe5h+WRkZdXSQmXrxK3X4jLQEdJhTCz/atwRGrTjHYCt3a+sWQL7LwEGna/8LGP
	jlXlS2WK3HxiP/4gcqWuCY65egUhPmDDM5o506kj62GyNeszxmaxijj10XRh8SZHpOIsqYjQKXo
	eEJTVXuTGn+v82lnMIwtksBmQknEOXOlYoU1PoxBx3hV1gOvNqdPyC1f
X-Google-Smtp-Source: AGHT+IGbXmuvDasWqfR5DUW+LETiZrUs5vidBCFKPfHYN49uKTRWvJsciqfcQbQm8F14O/bxFXbYZw==
X-Received: by 2002:a05:6a00:14d4:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-73b6b8fd296mr21570487b3a.24.1744135231604;
        Tue, 08 Apr 2025 11:00:31 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0946sm11181427b3a.103.2025.04.08.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:00:31 -0700 (PDT)
Date: Tue, 8 Apr 2025 23:30:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: MANISH PANDEY <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2 2/2] scsi: ufs: introduce quirk to extend
 PA_HIBERN8TIME for UFS devices
Message-ID: <fboo23erbvvhjg7hwkamudlopjeeg4tkwfjjcnor7ck2m4v3t4@redldauhvfhr>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
 <20250404174539.28707-3-quic_mapa@quicinc.com>
 <hcguawgzuqgi2cyw3nf7uiilahjsvrm37f6zgfqlnfkck3jatv@xgaca3zgts2u>
 <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>
 <l6xao2ubcvv3ho56dv6qfr3b62ve3olfbhvywg2is2xdhod27r@2nyjfwinrxzm>
 <25d8a781-14ea-4b97-b6b4-f9d472c1b692@quicinc.com>
 <cwwf4z2lrdhyv3nsj7do6ycn4tmdaii3wsr37vehgqpvvkgkwv@iugp4vu5srdm>
 <cf81fc11-f47b-422c-9c7d-860e6f93d930@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf81fc11-f47b-422c-9c7d-860e6f93d930@quicinc.com>

On Tue, Apr 08, 2025 at 10:58:10PM +0530, MANISH PANDEY wrote:
> 
> 
> On 4/8/2025 10:01 PM, Manivannan Sadhasivam wrote:
> > On Tue, Apr 08, 2025 at 01:14:50PM +0530, MANISH PANDEY wrote:
> > > 
> > > 
> > > On 4/8/2025 12:53 PM, Manivannan Sadhasivam wrote:
> > > > On Tue, Apr 08, 2025 at 11:07:58AM +0530, MANISH PANDEY wrote:
> > > > > 
> > > > > 
> > > > > On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
> > > > > > > Some UFS devices need additional time in hibern8 mode before exiting,
> > > > > > > beyond the negotiated handshaking phase between the host and device.
> > > > > > > Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
> > > > > > > to ensure proper hibernation process.
> > > > > > > 
> > > > > > 
> > > > > > This commit message didn't mention the UFS device for which this quirk is being
> > > > > > applied.
> > > > > > 
> > > > > Since it's a quirk and may be applicable to other vendors also in future, so
> > > > > i thought to keep it general.
> > > > > 
> > > > 
> > > > You cannot make commit message generic. It should precisely describe the change.
> > > > 
> > > > > Will update in next patch set if required.
> > > > >    >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
> > > > > > >     include/ufs/ufs_quirks.h  |  6 ++++++
> > > > > > >     2 files changed, 37 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > > > > > > index 464f13da259a..2b8203fe7b8c 100644
> > > > > > > --- a/drivers/ufs/core/ufshcd.c
> > > > > > > +++ b/drivers/ufs/core/ufshcd.c
> > > > > > > @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
> > > > > > >     	  .model = UFS_ANY_MODEL,
> > > > > > >     	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
> > > > > > >     		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
> > > > > > > +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
> > > > > > >     		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
> > > > > > >     	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
> > > > > > >     	  .model = UFS_ANY_MODEL,
> > > > > > > @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
> > > > > > >     	return ret;
> > > > > > >     }
> > > > > > > +/**
> > > > > > > + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
> > > > > > > + * @hba: per-adapter instance
> > > > > > > + *
> > > > > > > + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
> > > > > > > + * to ensure proper hibernation timing. This function retrieves the current
> > > > > > > + * PA_HIBERN8TIME value and increments it by 100us.
> > > > > > > + */
> > > > > > > +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
> > > > > > > +{
> > > > > > > +	u32 pa_h8time = 0;
> > > > > > 
> > > > > > Why do you need to initialize it?
> > > > > > 
> > > > > Agree.. Not needed, will update.>> +	int ret;
> > > > > > > +
> > > > > > > +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
> > > > > > > +			&pa_h8time);
> > > > > > > +	if (ret) {
> > > > > > > +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
> > > > > > > +		return;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/* Increment by 1 to increase hibernation time by 100 µs */
> > > > > > 
> > > > > >    From where the value of 100us adjustment is coming from?
> > > > > > 
> > > > > > - Mani
> > > > > > 
> > > > > These values are derived from experiments on Qualcomm SoCs.
> > > > > However this is also matching with ufs-exynos.c
> > > > > 
> > > > 
> > > > Okay. In that case, you should mention that the 100us value is derived from
> > > > experiments on Qcom and Samsung SoCs. Otherwise, it gives an assumption that
> > > > this value is universal.
> > > > 
> > > > - Mani
> > > > 
> > >   << Otherwise, it gives an assumption that this value is universal. >>
> > > So with this, should i add this quirk for Qcom only, or should add in
> > > ufshcd.c and make it common for all SoC vendors?
> > > 
> > 
> > You can add the quirk for both Qcom and Samsung. My comment was about clarifying
> > it in the kernel doc comments.
> > 
> > - Mani
> > 
> Just for conclusion, why i moved this quirk from ufs-qcom to ufshcd.c is as
> per Bart's suggestion in patchset
> https://lore.kernel.org/lkml/c0691392-1523-4863-a722-d4f4640e4e28@acm.org/
> 
> << Which of these quirks are required for all host controllers and which of
> these quirks are only required for Qualcomm host controllers?
> 
> > Should we consider moving the QUIRK_PA_HIBER8TIME quirk to the ufshcd
> > driver? Please advise.
> 
> That would be appreciated. >>
> 
> Just to brief, QUIRK_PA_HIBER8TIME is required for Samsung UFS devices and
> may be applicable to all SoC vendors with Samsung ufs device.
> 
> If you suggest to move it to ufs-qcom.c, i don't have any concern.
> BTW Samsung UFS driver already has this implemented in their driver,
> So i need not have to add this quirk to Samsung driver (ufs-exynos.c).
> 

No. I think there was a miscommunication. You can add the quirk in ufshcd.c, but
I just want you to mention that the quirk is currently applicable to Samsung UFS
devices and the value of 100us is derived from experiments.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

