Return-Path: <linux-arm-msm+bounces-215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17E7E62A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 04:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029DC1C2082D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 03:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4085668;
	Thu,  9 Nov 2023 03:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXjCzmlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34205663
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 03:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABB7C433C8;
	Thu,  9 Nov 2023 03:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699500438;
	bh=8l3Y3uc+DtLheJHzFBiWnmoBSiDiQ5S3umInMPR7G6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXjCzmlQaH1wqB6FK3BCldzyLMdyPaCbMrrMeJb2mpz099CS1s0YY7IGctM9M2aRj
	 xZaNF3IWZmml6PhRG+LAMxqkNS/IYpDM8yz7TtDvSTCCn7msvRh5tItl5c1Np/iuSU
	 Cp+arfYi910kgCPjIr227bQK5YCJTE77ElHI8EZnsQ0r6PJir0/98AVqQw0JnoOduI
	 W7nsu0jVHtRtqUU4scgBgzwqSpUgYhBIOoWkHdkUoZpnfPwLTeUdsdsZdOMe3VIhSc
	 G+y2HMhb40gtDjlUJVi2Naj/VwF9tIk0ZNm7+2MFeGcW6L5lnYH9CR6DJbGfzFBKr8
	 m4LUF9PCwVddA==
Date: Thu, 9 Nov 2023 08:57:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: Can Guo <cang@qti.qualcomm.com>, bvanassche@acm.org,
	stanley.chu@mediatek.com, adrian.hunter@intel.com,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts
 with HW version 5
Message-ID: <20231109032703.GC3752@thinkpad>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-5-git-send-email-cang@qti.qualcomm.com>
 <20231108052555.GD3296@thinkpad>
 <59f83fcd-6c2d-6b8a-55e6-0db07bfb5744@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59f83fcd-6c2d-6b8a-55e6-0db07bfb5744@quicinc.com>

On Wed, Nov 08, 2023 at 04:42:42PM +0800, Can Guo wrote:
> Hi Mani,
> 
> On 11/8/2023 1:25 PM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 06, 2023 at 08:46:10PM -0800, Can Guo wrote:
> > > From: Can Guo <quic_cang@quicinc.com>
> > > 
> > > Qcom UFS hosts, with HW ver 5, can only support up to HS-G5 Rate-A due to
> > > HW limitations. If the HS-G5 PHY gear is used, update host_params->hs_rate
> > > to Rate-A, so that the subsequent power mode changes shall stick to Rate-A.
> > > 
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 18 +++++++++++++++++-
> > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 60b35ca..55ee31d 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -442,9 +442,25 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
> > >   static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> > >   {
> > >   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > +	struct ufs_host_params *host_params = &host->host_params;
> > >   	struct phy *phy = host->generic_phy;
> > > +	enum phy_mode mode;
> > >   	int ret;
> > > +	/*
> > > +	 * HW ver 5 can only support up to HS-G5 Rate-A due to HW limitations.
> > 
> > Does this limitation apply to future targets as well or just to SM8550? If
> > it's the latter, then we need to use a flag.
> > 
> > - ManiUFS host controller HW ver (major) 5 IPs (they may have different
> minor/step verions) can be used by many QCOM chipsets, so it applies to
> several available targets and future targets which are going to have HW ver
> 5 UFS host controller. This limitation goes away since HW ver 6.
> 

Okay, thanks for clarifying.

- Mani

> Thanks,
> Can Guo.

-- 
மணிவண்ணன் சதாசிவம்

