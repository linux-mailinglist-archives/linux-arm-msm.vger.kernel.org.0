Return-Path: <linux-arm-msm+bounces-92984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF+AHJAvk2ke2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA628144DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23FD93004CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8831353C;
	Mon, 16 Feb 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOky1iQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C623128C6;
	Mon, 16 Feb 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253621; cv=none; b=b8mMFk6HtSFeZA2vE27xfV/3UwyM9vtxliSULT5UUMBZJRoj/loCzeAFsRhv1Fj/JgQXAmAg3L4AKsq/vwBtfd8coFsSZHM2TLhLNqJKWT41mTuTmiv7RJL161ek5OSc/LAynY5Xk5AKxTs9HXc92HakKMgwDjfOsbOvD78YwNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253621; c=relaxed/simple;
	bh=HZ6sQIcfz4i7aAUkGnkzO+bfJ830rmqltw2OdxrOaG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdoQPa70czy8eII1l6eoJcuY+T2Ecd44dIGgay/i/2BTaVeEwGGCQ0srlWjuA6mTvQgrr1B3aFwWo+u6RcAF4HQjC0DSiyYJYshRJRIuVfQvFX/mdgKL1rX5jG981xZPVwQTaz2lr6LAi81zCt9VjuPJlWzmcSJHQHh2y2cLBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOky1iQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D392C116C6;
	Mon, 16 Feb 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771253621;
	bh=HZ6sQIcfz4i7aAUkGnkzO+bfJ830rmqltw2OdxrOaG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOky1iQ5CT292DEDIzdPeCetrTeuFgFisd2/R2giUzdZnXNG0rRStpFnbd6nC/C0g
	 4sLDBVOGJo6nFuFEP3FX3OxE4uESDsCO9m/nUvT8VPY430+VXqhXTpcm/Ru0pRseyP
	 kaQQ7lkykuEzQdcf7/fEWhmu4DZ86ggkGHUgNBni22Pg90zWO9RVcDCm4LGcyYb2uj
	 Ivmr5JdahKXPsz6pGEaTtK5p7DxuZHDT1AEx1tCYjmTJB/qttMnToPVCvbEkCwHlRS
	 d4UMVYraGKcVnp2+JpxTdYb5ttaZnjsoekeH9th7KRIhRHXT5XJ3rXyE3rod/nzrPx
	 1jRO7IHAaVRaA==
Date: Mon, 16 Feb 2026 20:23:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] phy: qcom: qmp-pcie: Skip PHY reset if already up
Message-ID: <aaqqdz2ssnetfgtybuerjfnkgr7r22xj2whaawaqhgm4y2ygom@jtkn5z2nw7aq>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
 <nmle3y6nb4kjcwstzqxkqzaokeyjoegg6lxtmji57kxwh5snxa@p76v6dr7rgsg>
 <53f0c45f-7f5c-4abd-af84-cbb82d509872@linaro.org>
 <cvxvq7f2ku6aq5gbbqav42ckqk2raesbxq2bx46mxvapcza5v4@5zuyjdtn5us2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cvxvq7f2ku6aq5gbbqav42ckqk2raesbxq2bx46mxvapcza5v4@5zuyjdtn5us2>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92984-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: DA628144DB7
X-Rspamd-Action: no action

On Fri, Jan 09, 2026 at 04:03:37PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 02:10:49PM +0100, Neil Armstrong wrote:
> > On 1/9/26 14:08, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 12:51:06PM +0530, Krishna Chaitanya Chundru wrote:
> > > > If the bootloader has already powered up the PCIe PHY, doing a full
> > > > reset and waiting for it to come up again slows down boot time.
> > > 
> > > How big is the delay caused by it?
> > > 
> > > > 
> > > > Add a check for PHY status and skip the reset steps when the PHY is
> > > > already active. In this case, only enable the required resources during
> > > > power-on. This works alongside the existing logic that skips the init
> > > > sequence.
> > > 
> > > Can we end up in a state where the bootloader has mis-setup the link? Or
> > > the link going bad because of any glitch during the bootup?
> > 
> > Good question, can we add a module parameter to force a full reset of the PHY in case
> > the bootloader is buggy ?
> 
> I'd suggest a simpler thing: if the reset was skipped, reset the PHY in
> case of an error and retry. That's also one of the reasons why I asked
> for skip_reset not to be the persistent value.
> 

I'm not sure what value would resetting the PHY provide in the case of failure.
As per this patch, skip_reset is only going to be set for platforms where
bootloader has already configured the PHY. So in the case of PHY link failure,
simply resetting the PHY won't help IMO as the PHY register contents are going
to be presistent due to nocsr_reset.

- Mani

> > 
> > > 
> > > > 
> > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > ---
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++----------
> > > >   1 file changed, 18 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > > index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..c93e613cf80b2612f0f225fa2125f78dbec1a33f 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > > @@ -3153,6 +3153,7 @@ struct qmp_pcie {
> > > >   	const struct qmp_phy_cfg *cfg;
> > > >   	bool tcsr_4ln_config;
> > > >   	bool skip_init;
> > > > +	bool skip_reset;
> > > >   	void __iomem *serdes;
> > > >   	void __iomem *pcs;
> > > > @@ -4537,6 +4538,9 @@ static int qmp_pcie_init(struct phy *phy)
> > > >   		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
> > > >   		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
> > > > +	qmp->skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
> > > 
> > > It is definitely not a long-term state, there is no need to store it in
> > > qmp_pcie struct.
> > > 
> > > > +							    cfg->phy_status);
> > > > +
> > > >   	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
> > > >   		dev_err(qmp->dev, "Init sequence not available\n");
> > > >   		return -ENODATA;
> > > > @@ -4560,13 +4564,15 @@ static int qmp_pcie_init(struct phy *phy)
> > > >   		}
> > > >   	}
> > > > -	ret = reset_control_assert(qmp->nocsr_reset);
> > > > -	if (ret) {
> > > > -		dev_err(qmp->dev, "no-csr reset assert failed\n");
> > > > -		goto err_assert_reset;
> > > > -	}
> > > > +	if (!qmp->skip_reset) {
> > > > +		ret = reset_control_assert(qmp->nocsr_reset);
> > > > +		if (ret) {
> > > > +			dev_err(qmp->dev, "no-csr reset assert failed\n");
> > > > +			goto err_assert_reset;
> > > > +		}
> > > > -	usleep_range(200, 300);
> > > > +		usleep_range(200, 300);
> > > > +	}
> > > >   	if (!qmp->skip_init) {
> > > >   		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> > > > @@ -4641,10 +4647,12 @@ static int qmp_pcie_power_on(struct phy *phy)
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = reset_control_deassert(qmp->nocsr_reset);
> > > > -	if (ret) {
> > > > -		dev_err(qmp->dev, "no-csr reset deassert failed\n");
> > > > -		goto err_disable_pipe_clk;
> > > > +	if (!qmp->skip_reset) {
> > > > +		ret = reset_control_deassert(qmp->nocsr_reset);
> > > > +		if (ret) {
> > > > +			dev_err(qmp->dev, "no-csr reset deassert failed\n");
> > > > +			goto err_disable_pipe_clk;
> > > > +		}
> > > >   	}
> > > >   	if (qmp->skip_init)
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

