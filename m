Return-Path: <linux-arm-msm+bounces-20761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1C8D1C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EFA81F229F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D67A16DEA0;
	Tue, 28 May 2024 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpCCd8Os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458816C875
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901613; cv=none; b=YkIMKsDvgyi/m0MYEDJcUYU+FLwSgwXuwa7rgeurNT6g6ajA6hd01IhWgs211mw3Mhjx2Q67YzVRnKZfmPYk2NtYZSXE4dKf7dbk4oqeQXeMrE6UwfbQMC4ZNYk3r5FSoxUmjd4+U1i4ZHm4yJeFj1VYnsUOkRYPmpGP3IzLImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901613; c=relaxed/simple;
	bh=ZjSXb5QFdaYC4KHHw8vBDJN44RBUEPkfV+5MYpMQ5M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4nLUOPV0gWQKTYwe63BFWcFnL+zXu5AZDtfx5ei/Op5UqrCG5hzTvDfcpdaIHIqQWrDaELs8qOAxRzwbpLWGMxNik0kLwKPlfJ6T0bt1R1aduAF4+OMdElUD5XWbRvjOUQ9gdB6UuiG03dQmZu0vyYUI9buq4Jfet7N8xTaBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpCCd8Os; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-529b4011070so1047172e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901609; x=1717506409; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOBv4wkspGTZHjGiw1ESITmbKKi6oC3SplGyCdxHuQI=;
        b=BpCCd8Os5Zl7R/vsnW2YYz7QE/8FYfe66ji5UviIYLCawFGObUQZmpu3d39t7sfG7A
         db3g/sPpcQGYn/kFsGpccXgDrz8r4ahaYZgmj4BKgKVGifGMY1J9usgmiBt3QiUpfwT1
         sbxox2MPQFMxaaEpOzcr1/tEOLR8k6b0bqHQ3MIMzuMbCJ7+9MOrNG1N/+/2pZKZospM
         mwzZKi8fcv3SNnorQsl/3TZHfGqzjhF1u5vx9DGozLfM6I+APOAiZ/433C96WejxEJqg
         pX96G7V2cRMsdoDY5Mh/fwpDWtZouW/N7ALE6voAV+dP4Yqobl6FbZpWwk1E8dOLlUa2
         fBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901609; x=1717506409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOBv4wkspGTZHjGiw1ESITmbKKi6oC3SplGyCdxHuQI=;
        b=lgBIo3E9Zs+YZuIPnTJBx1JZDp7jKeWKgFYhBz150o494scRZ1NICGvwPJXB2xRpgD
         xXeHXigIgMyV156G7CCsn8Ki1nY2SvFks/q0kbHIJ9sN9JDgPHLixwUBN3C9j7AYkhfj
         W96Xeoy8S2HDljGHncdxI7XroFL7ZV/i1bCMMgNcaywnApyKIam0qMO/P2bIisLyKr9D
         G78PFPxBE+Au7r8Vx/Cm5bQ8JICplxl57BvfUbq8B0JI1tcATc6xQQVJCg52kooNgNXm
         sTeNqPCdMZi2Iru1gKIHP1gmt/UmE1I5q7Zw6+a6LLP07iSHOPmwJ6yvRqu9FGR4yaVT
         aEtA==
X-Forwarded-Encrypted: i=1; AJvYcCWvM2PgghiIMe/gZRCXkt5x655DgPi4n6FPj1w/3701hoWAv6VeL8A7IRVbio48+vot2+dNKF69TDrbC4G9vZZoROUlXoYSu9f7KS8wRA==
X-Gm-Message-State: AOJu0YyF/nks8j0GcLsJjvU/Ys2dIsdwysBVh23itVBnAoiT8HnQGC6h
	YCt2UjLBYoYOyaiVgGbiweCH5UsMsCMNOTiMnsGQ8sWn0MYBb0SPwmfsyzcR2yM=
X-Google-Smtp-Source: AGHT+IGtTxUey92N1Y7JyzLJjX/huVXGMV3PnoHL5XuMv5BWbmYemBDkBlvarhgxlDFIAbXdISDDxw==
X-Received: by 2002:a2e:7d07:0:b0:2e1:ebec:1ded with SMTP id 38308e7fff4ca-2e95b0c0445mr68255751fa.25.1716901609297;
        Tue, 28 May 2024 06:06:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98bbcda6fsm746891fa.80.2024.05.28.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:06:47 -0700 (PDT)
Date: Tue, 28 May 2024 16:06:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jsnitsel@redhat.com, quic_bjorande@quicinc.com, mani@kernel.org, 
	quic_eberman@quicinc.com, robdclark@chromium.org, u.kleine-koenig@pengutronix.de, 
	robh@kernel.org, vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com, 
	quic_molvera@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Message-ID: <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi>
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com>
 <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
 <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
 <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
 <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>

On Tue, May 28, 2024 at 02:59:51PM +0200, Konrad Dybcio wrote:
> 
> 
> On 5/15/24 15:59, Bibek Kumar Patro wrote:
> > 
> > 
> > On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
> > > On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
> > > > 
> > > > 
> > > > On 5/1/2024 12:30 AM, Rob Clark wrote:
> > > > > On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
> > > > > <quic_bibekkum@quicinc.com> wrote:
> > > > > > 
> > > > > > Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> > > > > > the TLB to fetch just the next page table. MMU-500 features ACTLR
> > > > > > register which is implementation defined and is used for Qualcomm SoCs
> > > > > > to have a custom prefetch setting enabling TLB to prefetch the next set
> > > > > > of page tables accordingly allowing for faster translations.
> > > > > > 
> > > > > > ACTLR value is unique for each SMR (Stream matching register) and stored
> > > > > > in a pre-populated table. This value is set to the register during
> > > > > > context bank initialisation.
> > > > > > 
> > > > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > > > > ---
> > > 
> > > [...]
> > > 
> > > > > > +
> > > > > > +               for_each_cfg_sme(cfg, fwspec, j, idx) {
> > > > > > +                       smr = &smmu->smrs[idx];
> > > > > > +                       if (smr_is_subset(smr, id, mask)) {
> > > > > > +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
> > > > > > +                                               actlrcfg[i].actlr);
> > > > > 
> > > > > So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
> > > > > downstream kgsl's PRR thing (which we'll need to implement vulkan
> > > > > sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
> > > > > to enable PRR.
> > > > > 
> > > > >           val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
> > > > >           val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
> > > > >           KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
> > > > > 
> > > > > Any idea how this works?  And does it need to be done before or after
> > > > > the ACTLR programming done in this patch?
> > > > > 
> > > > > BR,
> > > > > -R
> > > > > 
> > > > 
> > > > Hi Rob,
> > > > 
> > > > Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
> > > > 
> > > > Thanks for pointing to the downstream implementation of kgsl driver for
> > > > the PRR bit. Since kgsl driver is already handling this PRR bit's
> > > > setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
> > > 
> > > The kgsl driver is not present upstream.
> > > 
> > 
> > Right kgsl is not present upstream, it would be better to avoid configuring the PRR bit and can be handled by kgsl directly in downstream.
> 
> No! Upstream is not a dumping ground to reduce your technical debt.
> 
> There is no kgsl driver upstream, so this ought to be handled here, in
> the iommu driver (as poking at hardware A from driver B is usually not good
> practice).

I'd second the request here. If another driver has to control the
behaviour of another driver, please add corresponding API for that.

> 
> > 
> > > > Thanks for bringing up this point.
> > > > I will send v10 patch series removing this BIT(5) setting from the ACTLR
> > > > table.
> > > 
> > > I think it's generally saner to configure the SMMU from the SMMU driver..
> > 
> > Yes, agree on this. But since PRR bit is not directly related to SMMU
> > configuration so I think it would be better to remove this PRR bit
> > setting from SMMU driver based on my understanding.
> 
> Why is it not related? We still don't know what it does.
> 
> Konrad

-- 
With best wishes
Dmitry

