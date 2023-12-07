Return-Path: <linux-arm-msm+bounces-3677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4E80868F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632A11F21DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BAD37D14;
	Thu,  7 Dec 2023 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+gqu0Hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A6731739;
	Thu,  7 Dec 2023 11:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F956C433C7;
	Thu,  7 Dec 2023 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701948074;
	bh=Y+kCs8J8Xte1h+4V1sfgYUbvivj8bv1hTvD8IuIDh+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+gqu0HgAAr0TvC+OmZqlvMV+esi/bBl1U5DBLY5pEgyEhigN3qu5ic0LOFs8xGEW
	 GjubXsS26m3+ZXhanUEOi2q0MuSBCYCOSbgTxODrwr8cEHPIh7Dl7EJGsXDiMj0U+W
	 iKGzC2sbvJPXnJaWKM0Mw05vxO1S25jFERAWaJLB9M4IxPdzoOmgJgzGv6eeQS7RCx
	 frIuj2vmZ3/ydvd3y0ZvUX3oq6V6IBi0iMlKlfSAFKt+btXI6e+4hZCySzkCAV8nqS
	 mkiMIwUtlNdxgDalgPhnuXbOQgYZJFIEsTmWOHm/vHDlF5Er9OWLaoIZ1klFBqoeAg
	 PM+kvTyiDB6HA==
Date: Thu, 7 Dec 2023 16:51:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Naresh Maramaina <quic_mnaresh@quicinc.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chu.stanley@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Message-ID: <20231207112101.GK2932@thinkpad>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
 <20231206153242.GI12802@thinkpad>
 <effb603e-ca7a-4f24-9783-4d62790165ae@acm.org>
 <20231207094357.GI2932@thinkpad>
 <286b6f8a-c634-19ed-cf53-276cfe05d03f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <286b6f8a-c634-19ed-cf53-276cfe05d03f@quicinc.com>

On Thu, Dec 07, 2023 at 03:56:43PM +0530, Nitin Rawat wrote:
> 
> 
> On 12/7/2023 3:13 PM, Manivannan Sadhasivam wrote:
> > On Wed, Dec 06, 2023 at 03:02:04PM -1000, Bart Van Assche wrote:
> > > On 12/6/23 05:32, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
> > > > > On 12/5/2023 10:41 PM, Bart Van Assche wrote:
> > > > > > On 12/4/23 21:58, Naresh Maramaina wrote:
> > > > > > > On 12/5/2023 12:30 AM, Bart Van Assche wrote:
> > > > > > > > On 12/4/23 06:30, Maramaina Naresh wrote:
> > > > > > > > > +    /* This capability allows the host controller driver to
> > > > > > > > > use the PM QoS
> > > > > > > > > +     * feature.
> > > > > > > > > +     */
> > > > > > > > > +    UFSHCD_CAP_PM_QOS                = 1 << 13,
> > > > > > > > >     };
> > > > > > > > 
> > > > > > > > Why does it depend on the host driver whether or not PM QoS is
> > > > > > > > enabled? Why isn't it enabled unconditionally?
> > > > > > > 
> > > > > > > For some platform vendors power KPI might be more important than
> > > > > > > random io KPI. Hence this flag is disabled by default and can be
> > > > > > > enabled based on platform requirement.
> > > > > > 
> > > > > > How about leaving this flag out unless if a host vendor asks explicitly
> > > > > > for this flag?
> > > > > 
> > > > > IMHO, instead of completely removing this flag, how about having
> > > > > flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
> > > > > by default and if some host vendor wants to disable it explicitly,
> > > > > they can enable that flag.
> > > > > Please let me know your opinion.
> > > 
> > > That would result in a flag that is tested but that is never set by
> > > upstream code. I'm not sure that's acceptable.
> > > 
> > 
> > Agree. The flag shouldn't be introduced if there are no users.
> > 
> > > > If a vendor wants to disable this feature, then the driver has to be modified.
> > > > That won't be very convenient. So either this has to be configured through sysfs
> > > > or Kconfig if flexibility matters.
> > > 
> > > Kconfig sounds worse to me because changing any Kconfig flag requires a
> > > modification of the Android GKI kernel.
> > > 
> > 
> > Hmm, ok. Then I think we can have a sysfs hook to toggle the enable switch.
> 
> Hi Bart, Mani
> 
> How about keeping this feature enabled by default and having a module
> parameter to disable pmqos feature if required ?
> 

Module params not encouraged these days unless there are no other feasible
options available.

- Mani

> Regards,
> Nitin
> 
> > 
> > - Mani
> > 
> > > Thanks,
> > > 
> > > Bart.
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்

