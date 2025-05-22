Return-Path: <linux-arm-msm+bounces-59019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC96AC07C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8283A6A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 08:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E3B262FEA;
	Thu, 22 May 2025 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnuX/zGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA461624E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904005; cv=none; b=ZpPmYLk3APBvVc4y1mph2MpYrRX4CYhIDXL1fAM6y5uLvHV/JNEscjzpw4kmEab2sriJ7mBCe8hKfK5SHXldkmAjsq/6cUSNtduWiIdB37jk3PMRfgnrzbCG5KB37RHdE91+C6ISsUMtGSRRzVQ65r0qU4tAh6fjRoYm6upMC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904005; c=relaxed/simple;
	bh=zU/z3bLOlzuSQkcMtTCVJsX995ruiIR5eHpPKYALmb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZBXYEw7zTqZII9kGNjXXuzZ+an968h8tm5m+BEbjTLOiQqtBaoRuniqbZBjWEJoKXinhwT3FLdjXOhUcCYS6TBFh+WeuQh8D/Lwqco19WuRkYLJ/KgMOT9kYgdS7mNtLaqU/7YNG3dIRlV43NTUFIz8WDZsk+neRWyKhvUiZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnuX/zGR; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4006365b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747904003; x=1748508803; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wE/Nk3n7Qj543anMoi03EY1HELsp/mGZ1M/Gx4pgSIs=;
        b=RnuX/zGRB42yAzoOnJoC9hdHdh+bsle5+JSaKcpc2ibo+JJMx9xPSbBjo7nrpIzpQc
         U/4wrr29Xqbb/Eh5aIfwAIR4+CKP8YeWRVbx+SNaqvBoSRkPaZZ+XhmJ76Z1HY9vohx8
         etjvMKtG6Pzrou0QopWMHprnOih2psTbhlWbnaE1O6jUfOchpt+WikIFQDJHhH1Wwdqj
         qkIM1cfDz2WMVl2B8LduEdfOpsmlaf0kmAzVjYtpBRyl7QfIpmDDuTu2aT2w8aJUtemD
         Iln4cfv8nqW2DHJcdbnEwX/wgqgPmHkhFdzRGbETKIpzKZAlbzI2fLhFqSM4plgjCKos
         +BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747904003; x=1748508803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE/Nk3n7Qj543anMoi03EY1HELsp/mGZ1M/Gx4pgSIs=;
        b=G3LAX3xNRZIYP0vMtiiYfSvhn4b6EO4q90YlnZXBe/etyUhEV4v2OP6aUYLnzm7irW
         QDZ6iktmkNpyQ5x5rRKDpAzdxqtCyj3YOYeAvFI6rckrrqnxd0KIBAvZvGkROShYm6+R
         1q1LZj7yT9Jm12qXY+ZGNUvciBXQcT7lCe2UVNkZYiW8fOYmY3Vvzd3GcrINHKWKEObY
         HUY3NVoAnaiG/q+nloilxRNqrrN+h24dhUmc3UcngEdgxbChE86N0vG9O7CasfSfGGbZ
         LKo6khxzZ+kUA4EC2fKAzIaNsI8ToMzkSv5D0NFMiwW+X8d3KHb0guMfIOECroJm2QpX
         HNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUVSAAdHK8OMUbZGC57fpx6iL1/uT0me8I8V6nDFS3k4sc9B6Ql7N2AwM1yt180znaugWW7pSsIlUqCrIUP@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGfmxg/e5sIoDTvTTmIeylSdsQUbHhwthDTZIWnyX5XqaWQjW
	lJ7oCaHDHgGqR6fC9H+AsNRY6ULf3N3Jz+HTHoCMl2y2XPFDO0c38GTd/iCUl+H5Sw==
X-Gm-Gg: ASbGncs1UY5lQkkF4P70yYRuyTxTafZzbl4b1uHFDdO1OtY0/cKiPhxwgp9wkQ+4tkm
	rINI8jYS/sFREyxD+14EwO2sFNQi7MNnpwFPoloUra8YOzrcXfHFuVJx5GnGMVkwdYkEXbxASCY
	1UZSHnAiH6zDOBiTCQ/S5ZyBkNTGssdtTFeWff9QVbyAaSLnJN5ZXB9uDqrtEIRWoxjpGcryAzV
	XEnHSHStooFTn0n8oJXavfnmVBoaZhtGhP0cn4xQBPqnKg8URDu7mdnSEqRUtvuEXbBij48aMmZ
	Bf2cRhWtNh1kTruuMiCma58QMt6ubXhM/Tnm+fdGe5DZdLvD8fureQhhmUhZ4w==
X-Google-Smtp-Source: AGHT+IF5uWmk4PnvIThnJSvV0zNx6s2lAIFa7Qq/vftR90Qhtr6lQ7tpJ/xet55CCmVXUt9jRfsojQ==
X-Received: by 2002:a05:6a21:3385:b0:20d:df67:4921 with SMTP id adf61e73a8af0-2170cafa33dmr33994739637.4.1747904003020;
        Thu, 22 May 2025 01:53:23 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e589esm10810267b3a.9.2025.05.22.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:53:22 -0700 (PDT)
Date: Thu, 22 May 2025 14:23:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
Message-ID: <qrope222shpeqvhe2dnh4p4jmznuu7tr3jh2zujwbbd3khg4yo@wm2epj5ydefc>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-8-quic_nitirawa@quicinc.com>
 <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
 <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>

On Thu, May 22, 2025 at 03:49:12AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/21/2025 7:19 PM, Manivannan Sadhasivam wrote:
> > On Thu, May 15, 2025 at 09:57:18PM +0530, Nitin Rawat wrote:
> > > qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
> > > Remove it to simplify the ufs phy driver.
> > > 
> > 
> > Okay, so you are doing it now...
> 
> Yes
> 
> > 
> > > Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
> > > into qmp_ufs_power_off function to avoid unnecessary function call.
> > > 
> > 
> > Why are you dropping the reset_assert()?
> 
> This was not aligning to Phy programming guide .
> 

You should mention it in the description.

> 
> > 
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
> > >   1 file changed, 5 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > index a5974a1fb5bb..fca47e5e8bf0 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > @@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
> > >   		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
> > >   }
> > > -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > -{
> > > -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > -
> > > -	reset_control_assert(qmp->ufs_reset);
> > > -
> > > -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> > > -
> > > -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > >   static int qmp_ufs_power_on(struct phy *phy)
> > >   {
> > >   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > > @@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
> > >   	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > >   			SW_PWRDN);
> > > -	qmp_ufs_com_exit(qmp);
> > > +	/* Turn off all the phy clocks */
> > 
> > You should drop this and below comment. They add no value.
> 
> Comments are actually provided for each operation within qmp_ufs_power_off
> which actually facilitate understanding of all actions performed by the
> function which may not be fully clear by code. Hence
> I thought to keep the comments. But If you insist i'll remove.
> 

For complex code, comment should be added indeed. But for
clk_bulk_disable_unprepare() and regulator_bulk_disable(), NO. It is obvious
that they turn off clock and regulators.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

