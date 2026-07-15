Return-Path: <linux-arm-msm+bounces-119145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V1cxEaUbV2rlFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:33:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE2875AB0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:33:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bKfISOvW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119145-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119145-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5144E303C4F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DB639CCE1;
	Wed, 15 Jul 2026 05:33:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67908757EA;
	Wed, 15 Jul 2026 05:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093602; cv=none; b=QhpMsf93G+uy/Xb+hznkU2RwGJFeBh5kNp1QYyUhSgBEVSvrGZDT1MsO1Xpj5Olxapv8DuII8jdMmg9oP7lK7jmwqRII9qNyE7XKy4EpUbjttgWTPEUFr4iFQaCa362n4YkggwA2ouIPBSDNMdlU9+3tiMKWZKsMfN33R8baKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093602; c=relaxed/simple;
	bh=XYgakFKwsRTNmmzAVAmkVmR0AIruII9xqKBuP/xoqMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj3X3ca4lRdExbZ8KT8gHjRH7H7BvG8UIyJWQWQd/ZKmXqJQ/OKj5bkz/6syqxLwtMj+KO4wGsW94cPm6a7IHkWbQfJ2K6mUZQqOMrkbf1yOLVB6LihRISZhxj2PbwPpcCSakVT5rm1raBzt3a1fYrR2HQGAb9oHb0a5kXlCuuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKfISOvW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F5C1F000E9;
	Wed, 15 Jul 2026 05:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784093601;
	bh=ub1dSpkN7bCGP5dpQmCwxrc51eS+OQh0ansOg9qf4KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKfISOvW60NwonJtPahJyj1/ExU1nq+pM1YOCfIJ+CyDZ425UOZMpsUjsbjYOCkvK
	 wp3yf4jUuSrqwMm6NcxAkhU8AerAlscNVN7k0UjvmDK6TitqVo3peeN4C0XtUfuIi+
	 cgwP77mRYngypVHVkDd2a8pgXw8BqTetZxnwtRd6TUWQVW0rWeAQdYGkH4z7m4KlvM
	 Vf0/QbkXalkMWFT4Of0FFHx/XxIDkVw2NMyS/y5ZT8ZgsUwYznyNx3icEI6YPc57jW
	 QNcws48lXstLBWPYHzM1SYIc38B1G4PZR5CXilI3DnrC3eLHmLHkAwRvdviJxX1apJ
	 OJqL83VanFxGQ==
Date: Tue, 14 Jul 2026 22:33:19 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
Message-ID: <alcbn1qCJa7hjeug@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-4-elson.serrao@oss.qualcomm.com>
 <aktKpIXVnJeydgCE@hu-petche-lv.qualcomm.com>
 <4ffd0645-dc50-4157-b63b-5e93fd7520a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ffd0645-dc50-4157-b63b-5e93fd7520a7@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119145-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peter.chen@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hu-petche-lv.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BE2875AB0A

On 26-07-14 17:32:34, Elson Serrao wrote:
> 
> 
> On 7/5/2026 11:26 PM, Peter Chen wrote:
> > On 26-05-01 10:06:29, Elson Serrao wrote:
> >> EUD hardware can support multiple High-Speed USB paths, each routed
> >> through its own PHY. The active path is selected in hardware via the
> >> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
> >> the High-Speed PHY associated with the active path. To support this
> >> multi-path capability, the driver must manage PHY resources on a
> >> per-path basis, ensuring that the PHY for the currently selected
> >> path is properly initialized and powered.
> >>
> >> This patch restructures the driver to implement per-path PHY management.
> >> The driver now powers the appropriate PHY based on the selected and
> >> enabled UTMI path, ensuring correct operation when EUD is enabled.
> >>
> >> Historically, EUD appeared to work on single-path systems because the
> >> USB controller kept the PHY initialized. However, EUD is designed to
> >> operate independently of the USB controller and therefore requires
> >> explicit PHY control for proper operation.
> 
> [...]
> 
> >> +};
> >> +
> >>  struct eud_chip {
> >>  	struct device			*dev;
> >>  	struct usb_role_switch		*role_sw;
> >>  	void __iomem			*base;
> >> +	struct eud_path			*paths[EUD_MAX_PORTS];
> >>  	phys_addr_t			mode_mgr;
> >>  	unsigned int			int_status;
> >>  	int				irq;
> >>  	bool				enabled;
> >>  	bool				usb_attached;
> >> +	bool				phy_enabled;
> > 
> > There is already a 'enabled' flag, could be leveraged or still need
> > a new 'phy_enabled' flag?
> > 
> enabled reflects the user's sysfs intent, while phy_enabled tracks the
> actual PHY power state. These need to stay independent because a later
> patch in this series ("add host mode coordination") disables/re-enables
> the PHY on host-mode role transitions without touching chip->enabled, so
> as to preserve the user's original sysfs setting across the transition.
> 

Thanks for explaining, I have no other questions.

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> Thanks,
> Elson
> 
> u8				port_idx;
> >>  };
> >>  
> >> +static int eud_phy_enable(struct eud_chip *chip)
> >> +{
> >> +	struct phy *phy;
> >> +	int ret;
> >> +
> >> +	if (chip->phy_enabled)
> >> +		return 0;
> >> +
> >> +	phy = chip->paths[chip->port_idx]->phy;
> >> +
> >> +	ret = phy_init(phy);
> >> +	if (ret) {
> >> +		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
> >> +			chip->port_idx, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = phy_power_on(phy);
> >> +	if (ret) {
> >> +		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
> >> +			chip->port_idx, ret);
> >> +		phy_exit(phy);
> >> +		return ret;
> >> +	}
> >> +
> >> +	chip->phy_enabled = true;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void eud_phy_disable(struct eud_chip *chip)
> >> +{
> >> +	struct phy *phy;
> >> +
> >> +	if (!chip->phy_enabled)
> >> +		return;
> >> +
> >> +	phy = chip->paths[chip->port_idx]->phy;
> >> +
> >> +	phy_power_off(phy);
> >> +	phy_exit(phy);
> >> +	chip->phy_enabled = false;
> >> +}
> >> +
> >>  static int enable_eud(struct eud_chip *priv)
> >>  {
> >>  	int ret;
> >>  
> >> -	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> >> +	ret = eud_phy_enable(priv);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> >> +	if (ret) {
> >> +		eud_phy_disable(priv);
> >> +		return ret;
> >> +	}
> >> +
> >>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
> >>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
> >>  			priv->base + EUD_REG_INT1_EN_MASK);
> >> @@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
> >>  		return ret;
> >>  
> >>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> >> +	eud_phy_disable(priv);
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> @@ -130,6 +192,12 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
> >>  	if (port < 0)
> >>  		return port;
> >>  
> >> +	/* Check if the corresponding path is available */
> >> +	if (!chip->paths[port]) {
> >> +		dev_err(chip->dev, "EUD not supported on selected port\n");
> >> +		return -EOPNOTSUPP;
> >> +	}
> >> +
> >>  	/* Port selection must be done before enabling EUD */
> >>  	if (chip->enabled) {
> >>  		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
> >> @@ -229,8 +297,54 @@ static void eud_role_switch_release(void *data)
> >>  	usb_role_switch_put(chip->role_sw);
> >>  }
> >>  
> >> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
> >> +{
> >> +	struct device_node *controller_node;
> >> +	struct eud_path *path;
> >> +	u32 path_num;
> >> +	int ret;
> >> +
> >> +	ret = of_property_read_u32(np, "reg", &path_num);
> >> +	if (ret) {
> >> +		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
> >> +		if (of_node_name_eq(np, "ports"))
> >> +			path_num = 0;
> >> +		else
> >> +			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
> >> +					     np->name);
> >> +	}
> >> +
> >> +	if (path_num >= EUD_MAX_PORTS)
> >> +		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
> >> +				     path_num, EUD_MAX_PORTS - 1);
> >> +
> >> +	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
> >> +	if (!path)
> >> +		return -ENOMEM;
> >> +
> >> +	path->chip = chip;
> >> +	path->num = path_num;
> >> +
> >> +	controller_node = of_graph_get_remote_node(np, 0, -1);
> >> +	if (!controller_node)
> >> +		return dev_err_probe(chip->dev, -ENODEV,
> >> +				     "failed to get controller node for path %u\n", path_num);
> >> +
> >> +	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> >> +	of_node_put(controller_node);
> >> +
> >> +	if (IS_ERR(path->phy))
> >> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
> >> +				     "failed to get PHY for path %d\n", path_num);
> >> +
> >> +	chip->paths[path_num] = path;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int eud_probe(struct platform_device *pdev)
> >>  {
> >> +	struct device_node *np = pdev->dev.of_node;
> >>  	struct eud_chip *chip;
> >>  	struct resource *res;
> >>  	int ret;
> >> @@ -241,6 +355,16 @@ static int eud_probe(struct platform_device *pdev)
> >>  
> >>  	chip->dev = &pdev->dev;
> >>  
> >> +	for_each_child_of_node_scoped(np, child) {
> >> +		ret = eud_init_path(chip, child);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	/* Primary path is mandatory. Secondary is optional */
> >> +	if (!chip->paths[0])
> >> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
> >> +
> >>  	chip->role_sw = usb_role_switch_get(&pdev->dev);
> >>  	if (IS_ERR(chip->role_sw))
> >>  		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 

Thanks,
Peter Chen

