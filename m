Return-Path: <linux-arm-msm+bounces-94719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N2uCUQmpGkiYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:43:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C841CF61D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532A9300DE34
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47F52C08A2;
	Sun,  1 Mar 2026 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyYXU+m2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF4175A7A;
	Sun,  1 Mar 2026 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365371; cv=none; b=UKek9uVTBWTSpVjxYJ6dNW60aoHtoaZeKH2DkdQuoO4RQpFVpNboF+eGh67qcV9+7w9d4MthoOSKym+eL2l/xaBazu4dCOybTD1RY8IHOqQ+c5fCSg5dzTQXuzuBpjRoJ+3LISh1/Ixx+Asi28IqTKRsfboHNG0fnHCvSKY0X5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365371; c=relaxed/simple;
	bh=pnG7tvFrtdyv3WXvEJzx29lT5AfLh/MG9mcbrHMAO58=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agBKrUcITDJ1nNT7/ZwOOiTk9u2QO1i+2Tf/wUQMCIlUhLKMSRHNizmqBlU4qw33f3sGaO0xC0vK93W+a5ay3l+dDV1V4MTbzPv+SCGHh0Gfh8HEZaxLNcmhPoVBxb28BcRKQfqdwJCEc52jpIjr+kGqXeFOmgUHay3kjcWvjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyYXU+m2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113CAC116C6;
	Sun,  1 Mar 2026 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365371;
	bh=pnG7tvFrtdyv3WXvEJzx29lT5AfLh/MG9mcbrHMAO58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lyYXU+m2KtoMlQCaYHSTGYS7k3vPg+urdvgKLLe+VN1j5otDmcgzfqS+iLGDgFJzX
	 jCm7hWoMDFKF2Tln9kI+qBdbepd8+KQENY3/NjjjFYTz+YGvjuP7e4k7wNe3Uk2Zgu
	 Jr0bPBy+UyNWcQvmQCXzz+KPPnayGZHysd8y7IcOOuHF81+roKEctBCQTqq0NnX+4d
	 fClOtSBtYojZA6yE8Z6jdIfXQIEaNPa5QpjG5XK3H5qVbVu43by8JChZx1rOYHJHuw
	 r6L7w1bU0QM7Du1mb7FBQWrad28PDiwEwILS4hk/qRBD+Wu7VA1tNSGsNwyA07oYd8
	 XzD9ut4GML8xA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwfCC-0000000EvkI-1rlx;
	Sun, 01 Mar 2026 11:42:48 +0000
Date: Sun, 01 Mar 2026 11:42:47 +0000
Message-ID: <86zf4r93ns.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,	Nipun Gupta
 <nipun.gupta@amd.com>,	Nikhil Agarwal <nikhil.agarwal@amd.com>,	Joerg
 Roedel <joro@8bytes.org>,	Will Deacon <will@kernel.org>,	Robin Murphy
 <robin.murphy@arm.com>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Saravana Kannan
 <saravanak@kernel.org>,	Richard Zhu <hongxing.zhu@nxp.com>,	Lucas Stach
 <l.stach@pengutronix.de>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org,	Charan Teja
 Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a struct
In-Reply-To: <ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
	<861pi3amuu.wl-maz@kernel.org>
	<ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dmitry.baryshkov@oss.qualcomm.com, vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, charan.kalla@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94719-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.228.225.192:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1.111.188.160:email]
X-Rspamd-Queue-Id: 82C841CF61D
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 10:46:57 +0000,
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> On Sun, Mar 01, 2026 at 10:02:49AM +0000, Marc Zyngier wrote:
> > On Sun, 01 Mar 2026 08:34:20 +0000,
> > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> > > 
> > > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > 
> > > Change of_map_id() to take a pointer to struct of_phandle_args
> > > instead of passing target device node and translated IDs separately.
> > > Update all callers accordingly.
> > > 
> > > Subsequent patch will make use of the args_count field in
> > > struct of_phandle_args.
> > > 
> > > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > > ---
> > >  drivers/iommu/of_iommu.c              |  2 +-
> > >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> > >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> > >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> > >  drivers/xen/grant-dma-ops.c           |  2 +-
> > >  include/linux/of.h                    | 21 +++++++++++++-------
> > >  6 files changed, 44 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > > index a511ecf21fcd..d255d0f58e8c 100644
> > > --- a/drivers/iommu/of_iommu.c
> > > +++ b/drivers/iommu/of_iommu.c
> > > @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> > >  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> > >  	int err;
> > >  
> > > -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> > > +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> > >  	if (err)
> > >  		return err;
> > >  
> > > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > > index 57420806c1a2..6c3628255908 100644
> > > --- a/drivers/of/base.c
> > > +++ b/drivers/of/base.c
> > > @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
> > >   * @id: device ID to map.
> > >   * @map_name: property name of the map to use.
> > >   * @map_mask_name: optional property name of the mask to use.
> > > - * @target: optional pointer to a target device node.
> > > - * @id_out: optional pointer to receive the translated ID.
> > > + * @arg: of_phandle_args structure,
> > > + *	which includes:
> > > + *	np: pointer to the target device node
> > > + *	args_count: number of arguments
> > 
> > Number of arguments *to what*? Isn't that the size of args[] instead?
> 
> It is a number of values corresponding to the phandle in the DT
> property.

No. It is what the *caller* expects. Not what is is in the DT, which
could be (and generally is) a pile of random crap. If the two don't
match, return an error. But don't randomly overwrite data that is not
yours.

[...]

> It might be not obvious here for iommu-maps, but the struct is
> idiomatic in OF world. Let me quote a (trimmed) example from
> qcom/sm8650.dtsi (for a different property, but it explains the meaning
> of the values here):
> 
> gem_noc: interconnect@24100000 {
> 	#interconnect-cells = <2>;
> };
> 
> epss_l3: interconnect@17d90000 {
> 	#interconnect-cells = <1>;
> };
> 
> interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> 		 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> 		<&epss_l3 MASTER_EPSS_L3_APPS
> 		 &epss_l3 SLAVE_EPSS_L3_SHARED>;
> /* I skipped the second pair, it adds nothing here */
> 
> Here the parsing function for this property (of_icc_get_by_index()) will
> call of_parse_phandle_with_args() 4 times and it expects to return the
> following values in the of_phandle_args:
> 
> 1. { .np = gem_noc, .args_count = 2, .args = [MASTER_APPSS_PROC,
>                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> 2. { .np = gem_noc, .args_count = 2, .args = [SLAVE_LLCC,
>                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> 3. { .np = epss_l3, .args_count = 1, .args = [MASTER_EPSS_L3_APPS] }
> 4. { .np = epss_l3, .args_count = 1, .args = [SLAVE_EPSS_L3_SHARED] }
> 
> The whole of_phandle_args is then typically passed to the corresponding
> xlate function, specific to the paricular .np ('provider'), which will
> use #args_count values from the #args array to return the object from
> the provider.
> 
> Now let's see iommu-maps (again, qcom/sm8650.dtsi):
> 
> apps_smmu: iommu@15000000 {
> 	#iommu-cells = <2>;
> };
> 
> iommu-map = <0     &apps_smmu 0x1400 0x1>,
> 	    <0x100 &apps_smmu 0x1401 0x1>;
> 
> The property matches current definition at [1], however this spec
> doesn't match the DT practice. It forces that the property should use 1
> cell for identifying the "object" in the IOMMU provider, even if the
> provider expects to use 2 cells (two args).
> 
> The correct property should look like:
> 
> iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
> 	    <0x100 &apps_smmu 0x1401 0x0 0x1>;
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-iommu.yaml
> 
> > 
> > > + *	args[]: array to receive the translated ID(s).
> > >   *
> > >   * Given a device ID, look up the appropriate implementation-defined
> > >   * platform ID and/or the target device which receives transactions on that
> > > @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
> > >   */
> > >  int of_map_id(const struct device_node *np, u32 id,
> > >  	       const char *map_name, const char *map_mask_name,
> > > -	       struct device_node **target, u32 *id_out)
> > > +	       struct of_phandle_args *arg)
> > >  {
> > >  	u32 map_mask, masked_id;
> > >  	int map_len;
> > >  	const __be32 *map = NULL;
> > >  
> > > -	if (!np || !map_name || (!target && !id_out))
> > > +	if (!np || !map_name || !arg)
> > >  		return -EINVAL;
> > >  
> > >  	map = of_get_property(np, map_name, &map_len);
> > >  	if (!map) {
> > > -		if (target)
> > > +		if (arg->np)
> > >  			return -ENODEV;
> > >  		/* Otherwise, no map implies no translation */
> > > -		*id_out = id;
> > > +		arg->args[0] = id;
> > 
> > What if args_count is 0? Given that you place no restriction on the
> > way this can be called, that'd be entirely legitimate, and you'd
> > corrupt something you're not supposed to touch.
> 
> args is an array (not a pointer) in of_phandle_args. As such we know
> that args[0] is legit.

Again, no. The caller is telling you what it expects. This is strictly
equivalent to:

	void func(void *blah[], int sz);

func() is not supposed to look beyond sz. As it stands, this change in
not acceptable.

	M.

-- 
Without deviation from the norm, progress is not possible.

