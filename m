Return-Path: <linux-arm-msm+bounces-4675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACF812965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E45B5B21041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB20E12E52;
	Thu, 14 Dec 2023 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfZql0JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0346E185
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:33:13 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-42594f0ca09so39290361cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702539193; x=1703143993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pD0FCZ0EPDMJ3nRws8kwPInwEm37ac/pfVSgH1LgqOo=;
        b=HfZql0JFFRIuMDVLQYZYiEk9ZD+uJDiooV8ThOXjd6AkH1CY8ucjYWEZfF1+Thg9Fp
         zt/NnYFJ9AuD8+LCYlYw8h99Tyi6DH7mxiqKgns5gtGkYXHFn5S8MPgd6XnhMc0s8+Rt
         qpNuQYt8p1jeb0lED3Q171p6pU7cV6Kn6QSm6xUpfmVAlc8/a1p/w2X+UT+itrtLtRr3
         RGF1AiNBourVQlC0WHG+ebZuVu0yVxePzn+z2p3dAFvKaBFGdcycFW3pdnsjfdb4qxfd
         Yej6RFNbsUFG2xw/s4KIdXt1ZOchjeBX8QTPRxA6DzEK53+eb55rUuJxQn1p9C/CX83Q
         wE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539193; x=1703143993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pD0FCZ0EPDMJ3nRws8kwPInwEm37ac/pfVSgH1LgqOo=;
        b=OsHuDLwcs2XNgnTNtlauFp+blimX3wVZpHHp7VdV/PQT/QDsjxmOywRvlqc8zCvRl5
         Zap7Iyz5TO8Adcy+zePYzQG5hMfpdP0U+DL7JJapXujto9JyKUUcYk8iM8hITFwObaxr
         v3tTz+KSUUDPf4WmB4+ycEhEKp0Y2M36SAXhrziuc4MzpiUiixmFd6Ma9cZEA4wvAfxu
         yaLKs6kB6UAfwa+x9fJVsAC4EH1Hmu2G5LXg0xHp4o0OSSj//n5qRjmot34AMi1mllsv
         O5amTIgEBo1/tzsuRrcF6cL8dUbuwdSLTePGOjDnBiYqKNqVwhsU9yG/xkJKJ4PEtKHS
         MdyA==
X-Gm-Message-State: AOJu0YwxNDA0ZcENAvK8DOMXM4yzcy9x0CAsSGQQmJKrY2oDm3kf8A6E
	z6OjSuwLRO3kdr3IHKAHoRIF
X-Google-Smtp-Source: AGHT+IGgp/3lSkFQD6Hrz7dtYYIJdq0NZpJ96MNKXxBvC74rabqBEsD01nmLhWNc+9oyvzOqj8iQbg==
X-Received: by 2002:ac8:7d50:0:b0:425:4043:8d2a with SMTP id h16-20020ac87d50000000b0042540438d2amr9146338qtb.69.1702539193114;
        Wed, 13 Dec 2023 23:33:13 -0800 (PST)
Received: from thinkpad ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id eh9-20020a05622a578900b00425d18d50e8sm2842852qtb.30.2023.12.13.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 23:33:12 -0800 (PST)
Date: Thu, 14 Dec 2023 13:03:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, ahalaney@redhat.com
Subject: Re: [PATCH v2 05/17] scsi: ufs: qcom: Remove the warning message
 when core_reset is not available
Message-ID: <20231214073303.GH2938@thinkpad>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-6-manivannan.sadhasivam@linaro.org>
 <7472fe73-e7a0-5c8c-6e85-655db028a5c3@quicinc.com>
 <20231208102832.GA3008@thinkpad>
 <190651ad-6aeb-69eb-89c5-ed18221b5a7a@quicinc.com>
 <54e882ba-4758-1283-1a52-1f12201e1836@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54e882ba-4758-1283-1a52-1f12201e1836@quicinc.com>

On Thu, Dec 14, 2023 at 12:43:02PM +0530, Nitin Rawat wrote:
> 
> 
> On 12/8/2023 6:59 PM, Nitin Rawat wrote:
> > 
> > 
> > On 12/8/2023 3:58 PM, Manivannan Sadhasivam wrote:
> > > On Fri, Dec 08, 2023 at 02:55:21PM +0530, Nitin Rawat wrote:
> > > > 
> > > > 
> > > > On 12/8/2023 12:28 PM, Manivannan Sadhasivam wrote:
> > > > > core_reset is optional, so there is no need to warn the user
> > > > > if it is not
> > > > > available.
> > > > > 
> > > > > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > >    drivers/ufs/host/ufs-qcom.c | 4 +---
> > > > >    1 file changed, 1 insertion(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index dc93b1c5ca74..d474de0739e4 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct
> > > > > ufs_hba *hba)
> > > > >        struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > > >        bool reenable_intr;
> > > > > -    if (!host->core_reset) {
> > > > > -        dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> > > > > +    if (!host->core_reset)
> > > > >            return 0;
> > > > > -    }
> > > > >        reenable_intr = hba->is_irq_enabled;
> > > > >        disable_irq(hba->irq);
> > > > 
> > > > 
> > > > Hi Mani,
> > > > 
> > > > I think core reset is not frequent. It happen during only probe ,error
> > > > handler.
> > > > 
> > > > core reset is needed in kernel to cleanup UFS phy and controller
> > > > configuration before UFS HLOS operation starts as per HPG.
> > > > 
> > > 
> > > This sounds like core reset is not an optional property but a
> > > required one. I
> > > just checked the upstream DT files for all SoCs, and looks like
> > > pretty much all
> > > of them support core reset.
> > > 
> > > Only MSM8996 doesn't have the reset property, but the reset is
> > > available in GCC.
> > > So we should be able to use it in dtsi.
> > > 
> > > I also skimmed through the HPG and looks like core reset is not
> > > optional. Please
> > > confirm.
> > > 
> > > - Mani
> > 
> > 
> > Hi Mani,
> > 
> > Yes Core_reset is part of HPG sequence and is needed.
> > 
> > Regards,
> > Nitin
> 
> 
> Hi Mani,
> 
> I see this patch series is merged . So planning to keep the warn message
> based on above discussion.
> 

No, you should not add that warning back. As per our discussion, we concluded
that core_reset is not optional, so devm_reset_control_get_exclusive() should be
used to acquire the reset.

If the reset property is not present in DT, then ufs_qcom_init() will fail. This
also means that we should fix the binding and DT of SoCs missing the reset
property.

- Mani

> Regards,
> Nitin
> > 
> > 
> > > 
> > > > Having existing warn print can be used to to debug or atleast know
> > > > core_reset is missed in device tree to give indication complete
> > > > reset hasn't
> > > > been done and we could still be operating in bootloader configuration.
> > > > 
> > > > 
> > > > Regards,
> > > > Nitin
> > > > 
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

