Return-Path: <linux-arm-msm+bounces-29367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479D95D140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71231C2174D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 15:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7322F188908;
	Fri, 23 Aug 2024 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z028GTwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A96188903;
	Fri, 23 Aug 2024 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426514; cv=none; b=p3tBFtDULLIMju9zukVgm/FBxiVhYB4QvXAp+QnvTzaCuhIgx8GlT7dhEhQ6T1rN+iGznvZvcCOi8fGYN/rgwQbSWUHaZqCziZw6h7+TLpyTkJiyJHqv0mSYtrFaAFv3XhkCtVnywOcUdQm4zuYkaEdYY+Wq71LPZIP4r1c+Fio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426514; c=relaxed/simple;
	bh=z/xlA997HrrjimGdMRbL+kogTgPfZTfDFAxkUoJUHPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgvnfCDK3IdrHkU3F4Tzq7hexTcM7dLvHNjHr+CdaYQtjl2MTRbYMLXOkT+Hnm5qIwm2tgAH6G3HhTyyM9ftVG/pRl24uq0nXpbBJtUnNPu9CUS38gVYUopBW1bCGaVHMyamhtwhxyzq/YM+ztBJ7CshapwMHaLtuyhUJwfiwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z028GTwJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30861C32786;
	Fri, 23 Aug 2024 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724426513;
	bh=z/xlA997HrrjimGdMRbL+kogTgPfZTfDFAxkUoJUHPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z028GTwJDVdrD1dy3EjvhFp7/d7QDBryXCZodsxMo5qKnH3PWsQ/4+Wm6eTEOplEp
	 kyBxZ8jGqrPeG1Xt8UjF3BY6dJ8CDvKsug5GIhKRmTuCV4NrVNBw8ZaqqiDNn028+N
	 NVE4bPZFx8i7vIG9zzXW4Gy2cPxD11soRQ0JnmfdL+f5+tDk7wneORN70sI2Sa0XGl
	 z207z0JmHzApJt8hYOYpgbu5My/ukNBLeso2W2h8bw5s2cXb4TcR+6oAOuUZgzBM13
	 VU1auf4S0UCnI1WUEFGc62AHSLTSq7/h8ij4AjUY+ZmCIeixPeD8mntVJWiTS4ZRVS
	 Ksi6NBAv4Cdhg==
Date: Fri, 23 Aug 2024 16:21:48 +0100
From: Will Deacon <will@kernel.org>
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
Message-ID: <20240823152147.GA396@willie-the-truck>
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
 <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp>
 <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
 <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
 <3332c732-4555-46bf-af75-aa36ce2d58df@gmail.com>
 <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
 <d766e2e8-9f3f-af3a-bb5e-633b11bce941@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d766e2e8-9f3f-af3a-bb5e-633b11bce941@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 30, 2024 at 10:16:00AM -0700, Trilok Soni wrote:
> On 7/30/2024 1:50 AM, Dmitry Baryshkov wrote:
> >>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
> >>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> > My question is about forbidding 16k pages for sdm845 only or for other
> > chips too. I'd assume that it shouldn't also work for other smmu-v2
> > platforms.
> 
> Yes, my understanding was that SMMUv2 based IPs doesn't have 16k support
> and it is only starting from SMMUv3. 

I'm not sure about that. The architecture doc for SMMUv2 talks about the
AArch64 translation regime in section 1.5 and bit 13 of SMMU_IDR2 says:

  | PTFSv8_16kB, bit[13]
  | Support for 16KB translation granule size. The possible values of this bit are:
  | 0	The 16KB translation granule is not supported.
  | 1	The 16KB translation granule is supported.
  | In SMMUv1, this bit is reserved.

so I think Konrad's patch is about right, but if you want to extend it
to cover other implementations then that's fine too.

Will

