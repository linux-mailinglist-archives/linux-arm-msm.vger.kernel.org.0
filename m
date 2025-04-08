Return-Path: <linux-arm-msm+bounces-53467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6717A7F61C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3441B7A37EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 07:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4921D26159B;
	Tue,  8 Apr 2025 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJbsUz5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833F261579
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097026; cv=none; b=uBJtKGw6cE2Vp4fmF17xW7lEKaVreYGfaj/8W4gqfBX3EdcALkgQWRZIhTxNm03Bgq04sXaw8CKUOuNw50Q1c2vy9HBpjgYHfk0HLimnD0ZJjb9WrZxOwOlyB4nbolT667CXbqbKyl0Gd+JiS/FXD1myDIisiTmBXtBNgVkUAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097026; c=relaxed/simple;
	bh=rL5dGpnFjOxWd3LsB+ItQyiyXmnHrcABj2M4ZSlcHDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8YpntAJrqPWmbnA0MayMg5/CYSFOv+1uXVelas6mUi9dLHJtL3p5oeZvjuINmucCI8MzV97Z0ZsmOyr+zDiZQDrJztHBozfP9Uw5JvHBTegus/HgkAqOeUeTT3oN1CvgtDTiU5KOawHLHVS49/g0Nyu6cnV1T3rS8ue7OWXRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJbsUz5X; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so71773545ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744097024; x=1744701824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVo2aw8e68tzNUEBR5LrT7OG8JEIu/cx6FavvcXXg2o=;
        b=uJbsUz5XeE6hxVIz5jX8ptxHA5XoKb+yTII+mdK+VOU7n1YmxMjAIOqbp7MsJq9tuw
         fE/pRLuWpTe5MEcbttBT+ABUx2FcGa2bF2tRVsjR4IlRavwF4hNN7WtSg3UGWwV39y93
         q++HJR7nkTc3dDktm1oeOggH/r/N/BzIeZIz9iaspPnCWJRkmQqCB7VBKwgXe6B2XTM7
         Nb43SEZ0SdzmDVRkGl0ltxjtUen8jIPMLuu4ZwCgTmxLp9Yw1LQfXutIzg1IRUBLCUax
         y49lXwVhHFZD5JkuBW0QuMlX8DHReYRIz9ZYZTZ+qz4tAZ4KMeFz+VzNHOWncqej62tQ
         9gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097024; x=1744701824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVo2aw8e68tzNUEBR5LrT7OG8JEIu/cx6FavvcXXg2o=;
        b=aZvF8pGARxFUxIfpLgSlyRJO1l8hVYclhfeYuRcxQvwQn3O5/RvhmmQ7iYZbM/Z89/
         eT57usPsoWgtwZTgUNigwtBPq6zwU3lS6v6pK/ag+h86GzQeSvXuc2DoAaRwhpE6eMLd
         TeNS+MqyUi4POHSGyH7bTe3RFGn/iRvdWt1x+jx1hR86jJEcFVh1ABvE1IgVIH7kap0w
         VF9DaZNwPBVen27d605GYDmU6yEG/MnG4q4x3DPn/00pfZf5W07+YRkQvKRTAorrDYPw
         BVM3wiAjM2Wgavp9tHAzgm6mn4Kvu6kMUQeN5Msik3uA4UnEaRaZwnYjXnBedo/G+GGW
         1gzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX11RE/X+5DtGj02hseLHugflwydJ0ne+utHo7YXDOyVKhw3XftodUd4zg3W8o+IKzcjtSxui9QI3TXsYMs@vger.kernel.org
X-Gm-Message-State: AOJu0YyeltEtKrvaS77QHYFdFlrrs1l3ITrbQ7iJuHffpF+nKZh3XHp1
	A2hoZSBTsJymENvJNLSRqQqpnDKqAEzRgx1+rn/hAkeK229Cx62JD1CETZ867g==
X-Gm-Gg: ASbGncvhO2/KGCT6UWiompQ7MCDoUABVwGc6mH7TE/haAEIsUEqgJ5mVH5iHSpJ+tVY
	fDkUCBr4rrYGzBDAvpRMI6o7z+zuNg+jkA9m5WiNE5eXXUuVkys9p16ua3z4nTbXCnWU7jpvPwu
	6Bhqw0M5+qx67JUZnIusszV5tpccbDH6z3So3M6ftjLMLw5KJXxB8ntEzZA1EQ2xEOczNP/e3vM
	IqVlShcoYHZwgL+cQKmtiMbFpEqh34a8LDQyrOwidusj43PrVlW8iZLlEu4alQ39+vGm2QO/umb
	P870mAw9x2EaiE/uKuSpIev8LqI6ZorzKx1H41HWnhNhqbfaANxCi/U/
X-Google-Smtp-Source: AGHT+IFPM9/HimoR1iqD87ojIqSwcwz9XpIsOOx/gkGl8C+bQirMDZCXalGm8Chz/NcPiOQyGMeqew==
X-Received: by 2002:a17:902:d484:b0:223:6180:1bea with SMTP id d9443c01a7336-22a955734cfmr159838375ad.37.1744097023770;
        Tue, 08 Apr 2025 00:23:43 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787776f8sm92798135ad.256.2025.04.08.00.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:23:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:53:37 +0530
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
Message-ID: <l6xao2ubcvv3ho56dv6qfr3b62ve3olfbhvywg2is2xdhod27r@2nyjfwinrxzm>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
 <20250404174539.28707-3-quic_mapa@quicinc.com>
 <hcguawgzuqgi2cyw3nf7uiilahjsvrm37f6zgfqlnfkck3jatv@xgaca3zgts2u>
 <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d09641c7-c266-4f0a-a0e3-56f63d8c9ce3@quicinc.com>

On Tue, Apr 08, 2025 at 11:07:58AM +0530, MANISH PANDEY wrote:
> 
> 
> On 4/7/2025 12:05 AM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 04, 2025 at 11:15:39PM +0530, Manish Pandey wrote:
> > > Some UFS devices need additional time in hibern8 mode before exiting,
> > > beyond the negotiated handshaking phase between the host and device.
> > > Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
> > > to ensure proper hibernation process.
> > > 
> > 
> > This commit message didn't mention the UFS device for which this quirk is being
> > applied.
> > 
> Since it's a quirk and may be applicable to other vendors also in future, so
> i thought to keep it general.
> 

You cannot make commit message generic. It should precisely describe the change.

> Will update in next patch set if required.
>  >> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> > > ---
> > >   drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
> > >   include/ufs/ufs_quirks.h  |  6 ++++++
> > >   2 files changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > > index 464f13da259a..2b8203fe7b8c 100644
> > > --- a/drivers/ufs/core/ufshcd.c
> > > +++ b/drivers/ufs/core/ufshcd.c
> > > @@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
> > >   	  .model = UFS_ANY_MODEL,
> > >   	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
> > >   		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
> > > +		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
> > >   		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
> > >   	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
> > >   	  .model = UFS_ANY_MODEL,
> > > @@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
> > >   	return ret;
> > >   }
> > > +/**
> > > + * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
> > > + * @hba: per-adapter instance
> > > + *
> > > + * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
> > > + * to ensure proper hibernation timing. This function retrieves the current
> > > + * PA_HIBERN8TIME value and increments it by 100us.
> > > + */
> > > +static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
> > > +{
> > > +	u32 pa_h8time = 0;
> > 
> > Why do you need to initialize it?
> > 
> Agree.. Not needed, will update.>> +	int ret;
> > > +
> > > +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
> > > +			&pa_h8time);
> > > +	if (ret) {
> > > +		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Increment by 1 to increase hibernation time by 100 µs */
> > 
> >  From where the value of 100us adjustment is coming from?
> > 
> > - Mani
> > 
> These values are derived from experiments on Qualcomm SoCs.
> However this is also matching with ufs-exynos.c
> 

Okay. In that case, you should mention that the 100us value is derived from
experiments on Qcom and Samsung SoCs. Otherwise, it gives an assumption that
this value is universal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

