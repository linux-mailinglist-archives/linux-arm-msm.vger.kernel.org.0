Return-Path: <linux-arm-msm+bounces-2675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C571E7FEBE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 10:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81618281CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527F238DE7;
	Thu, 30 Nov 2023 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMKiS05n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92F2E403;
	Thu, 30 Nov 2023 09:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2D6C433C8;
	Thu, 30 Nov 2023 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701336874;
	bh=RqZHsXY1RzLVHWsscpg0HFTRVpHt6GF1c4U3w56N2eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMKiS05nO0Si1eNtzrPbl9O5VvGWL79iQx4/rFwHxcP9yFesqDnHGijIl/ft5FVks
	 l1FMYpzWO1TfmBQ6m7A6rAk7YMKGcYwFdRu6AC2z5arq28xouhlDYAZf46dQPNfwxw
	 9SnBuAlAhJxqfu+cdmkk5tGegtpBzWaeu5+51e8oXhyJoIxtQ+UexikeyvTi4A5fbC
	 XkTpVvS5yhIsDqOLMdJhTn+sEr8CoQFueNRxrcZsyjB/nIlJEhoJz2lOCK5+OQdFeM
	 i0xhNkrwkceohr83T5YHsuJrJ3jPZD3Oe+0+hyoFSlZL2pVLQm+UWk1/O5Y0zhXaO4
	 bTlt+UPqhio3Q==
Date: Thu, 30 Nov 2023 15:04:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, bvanassche@acm.org,
	adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/10] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
Message-ID: <20231130093423.GO3043@thinkpad>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-9-git-send-email-quic_cang@quicinc.com>
 <20231130071240.GG3043@thinkpad>
 <367744ed-a7e4-485b-b855-2cb26ef1ee16@quicinc.com>
 <20231130083827.GM3043@thinkpad>
 <c112b051-05ba-45f0-a9f3-f0da5afad4f7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c112b051-05ba-45f0-a9f3-f0da5afad4f7@quicinc.com>

On Thu, Nov 30, 2023 at 04:49:12PM +0800, Can Guo wrote:
> 
> 
> On 11/30/2023 4:38 PM, Manivannan Sadhasivam wrote:
> > On Thu, Nov 30, 2023 at 04:14:25PM +0800, Can Guo wrote:

[...]

> > > > > +static int qmp_ufs_get_gear_overlay(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
> > > > > +{
> > > > > +	u32 max_gear, floor_max_gear = cfg->max_supported_gear;
> > > > > +	int i = NUM_OVERLAY - 1;
> > > > 
> > > > Just use i directly in the for loop. Also, please rename "i" with "idx" to make
> > > > it clear.
> > > 
> > > OK
> > > 
> > > > 
> > > > > +	int ret = -EINVAL;
> > > > > +
> > > > > +	for (; i >= 0; i --) {
> > > > 
> > > > i--
> > > > 
> > > > > +		max_gear = cfg->tbls_hs_overlay[i].max_gear;
> > > > > +
> > > > > +		if (max_gear == 0)
> > > > > +			continue;
> > > > 
> > > > You are setting max_gear even for targets with a single overlay. How can this
> > > > become 0?
> > > 
> > > Say 8550 has two overlays, 8450 has one overlay. We are sweeping all
> > > overlays as NUM_OVERLAY == 2, so for 8450, there is one overlay initialized,
> > > another one not initialized (max_gear == 0), we are skipping the one which
> > > is not initialized.
> > > 
> > 
> > This is confusing at its best :) Please check for the existence of the actual
> > table instead. Like,
> > 
> > 	for (idx = NUM_OVERLAY - 1; i >= 0, i--) {
> > 
> > 		/* Skip if the table is not available */
> > 		if (!cfg->tbls_hs_overlay[i].serdes)
> > 			continue;
> > 
> > 		...
> > 	}
> 
> We cannot expect overlay must has its own serdes, or tx/rx/pcs, hence I am
> checking max_gear intead of any specific member.
> 

Hmm, then please add the comment as I suggested above.

> > 
> > > > 
> > > > > +
> > > > > +		/* Direct matching, bail */
> > > > > +		if (qmp->submode == max_gear)
> > > > > +			return i;
> > > > > +
> > > > > +		/* If no direct matching, the lowest gear is the best matching */
> > > > > +		if (max_gear < floor_max_gear) {
> > > > > +			ret = i;
> > > > > +			floor_max_gear = max_gear;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > >    static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
> > > > >    {
> > > > > +	int i;
> > > > > +	bool apply_overlay = false;
> > > > > +
> > > > > +	i = qmp_ufs_get_gear_overlay(qmp, cfg);
> > > > > +	if (i >= 0)
> > > > > +		apply_overlay = true;
> > > > 
> > > > How about?
> > > > 
> > > > ```
> > > > 	int idx;
> > > > 
> > > > 	idx = qmp_ufs_get_gear_overlay(qmp, cfg);
> > > > 
> > > > 	qmp_ufs_serdes_init(qmp, &cfg->tbls);
> > > > 	qmp_ufs_lanes_init(qmp, &cfg->tbls);
> > > > 	...
> > > > 
> > > > 	if (idx >= 0) {
> > > > 		qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_overlay[idx]);
> > > > 		qmp_ufs_lanes_init(qmp, &cfg->tbls_hs_overlay[idx]);
> > > > 		...
> > > > 	}
> > > > ```
> > > > 
> > > > Since the ordering doesn't matter for init sequence, you can program the overlay
> > > > tables under a single condition.
> > > 
> > > We can do that, but we need to be careful. When I say (in my previous reply)
> > > the ordering does not matter, that saying is from the UFS PHY HPG doc.
> > > However, in SW implementation, the 'tbls_hs_b' is actually overwriting one
> > > COM_VCO_TUNE_MAP register, the same register is also programmed by common
> > > table or overlay table. So qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_b) should
> > > come after overlays.
> > > 
> > 
> > Then you can program tbls_hs_b after overlay tables. Wouldn't that work?
> 
> I am programming tbls_hs_b after overlay tables, just a heads up in case you
> are surprised :).
> 

Cool!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

