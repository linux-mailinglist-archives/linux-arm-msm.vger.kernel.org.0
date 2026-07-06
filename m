Return-Path: <linux-arm-msm+bounces-116640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gEmNE+NWS2qyPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A370D6EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="hcNvQg/S";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AFC632CCAF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142793DEAC4;
	Mon,  6 Jul 2026 06:26:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE083DD51F;
	Mon,  6 Jul 2026 06:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319208; cv=none; b=pkIfuDxUHT1pM5fAo2WJqWxRUnurm87HmlNgCM8uMa/8JH5u6BlIC0k0yg4V2FAcWftpDCw5EPZzUI+mw1nzo3mS9Vz8QrdciE9vy/5sDG8j4+6gCc72GrNeBVdV2hj0nN8Nk6/QkDxxloXSbuePGdu3k5c42PocjAq35Y8gKGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319208; c=relaxed/simple;
	bh=rAxqXzUBR5Fmf7+yoT5TeCSnXPgCRl3k3lR8jsCdYK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDdMWSNMJeLTGYu9eM+PyvNLlQrctugQB8QwgDTcPMfGcdDGPD18WQNJpGBkga8h79fkZHFitMVCyziXGYl4ZVJx/1Fnxt6LDxCJlCOb+WQOWOKLSQRk/GCSyoPzIcL1mTpi47imxxGaRyN/G1QfQ87B5zVB8plKXRWKsrRnO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcNvQg/S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6932C1F00A3A;
	Mon,  6 Jul 2026 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319205;
	bh=qjfkgqJHc+vuv5GdP9BmrOnlmIsZmWvKMasVJRCyK0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcNvQg/Sxhst9aW5lA5wVAXTXGdn5wUKm85BY1veQfevjJtP2cG1Zvnjm0o2Zl4rj
	 EG9aI6mxutTF2b6kfdi3w767qS8suVj0TCmEiITznot8g1LynECoAN6OsdV4ZoaEVH
	 7HnW2rth6B4eRAPIbvS3HKtZjgSaJZlitbsFtqlc/vXlgh8fQ84UXpE7wnE0yEfYDB
	 1w+l+tCr5qf02e8yGcwJ9eYnVdD0XpvKO8BqfSKb3CCOSvrLAYqhUbnOTsN6b20BHL
	 pnRDgeHDrTtdo/39ZYdi/+K7gQ5oc8O7KvOFxz4HdjR7cfCIn+rKnEMz0jLtZOYoQu
	 eyXDDR5uX/KOQ==
Date: Sun, 5 Jul 2026 23:26:44 -0700
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
Message-ID: <aktKpIXVnJeydgCE@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-4-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-4-elson.serrao@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116640-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,hu-petche-lv.qualcomm.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 951A370D6EF

On 26-05-01 10:06:29, Elson Serrao wrote:
> EUD hardware can support multiple High-Speed USB paths, each routed
> through its own PHY. The active path is selected in hardware via the
> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
> the High-Speed PHY associated with the active path. To support this
> multi-path capability, the driver must manage PHY resources on a
> per-path basis, ensuring that the PHY for the currently selected
> path is properly initialized and powered.
> 
> This patch restructures the driver to implement per-path PHY management.
> The driver now powers the appropriate PHY based on the selected and
> enabled UTMI path, ensuring correct operation when EUD is enabled.
> 
> Historically, EUD appeared to work on single-path systems because the
> USB controller kept the PHY initialized. However, EUD is designed to
> operate independently of the USB controller and therefore requires
> explicit PHY control for proper operation.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  drivers/usb/misc/qcom_eud.c | 126 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 4aa49f0f58c0..a624c44d5d59 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -11,6 +11,8 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
> @@ -39,26 +41,84 @@ static const char * const eud_port_names[] = {
>  	"secondary",
>  };
>  
> +struct eud_path {
> +	struct eud_chip		*chip;
> +	struct phy		*phy;
> +	u8			num;
> +};
> +
>  struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
> +	struct eud_path			*paths[EUD_MAX_PORTS];
>  	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
> +	bool				phy_enabled;

There is already a 'enabled' flag, could be leveraged or still need
a new 'phy_enabled' flag?

Peter

>  	u8				port_idx;
>  };
>  
> +static int eud_phy_enable(struct eud_chip *chip)
> +{
> +	struct phy *phy;
> +	int ret;
> +
> +	if (chip->phy_enabled)
> +		return 0;
> +
> +	phy = chip->paths[chip->port_idx]->phy;
> +
> +	ret = phy_init(phy);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
> +			chip->port_idx, ret);
> +		return ret;
> +	}
> +
> +	ret = phy_power_on(phy);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
> +			chip->port_idx, ret);
> +		phy_exit(phy);
> +		return ret;
> +	}
> +
> +	chip->phy_enabled = true;
> +
> +	return 0;
> +}
> +
> +static void eud_phy_disable(struct eud_chip *chip)
> +{
> +	struct phy *phy;
> +
> +	if (!chip->phy_enabled)
> +		return;
> +
> +	phy = chip->paths[chip->port_idx]->phy;
> +
> +	phy_power_off(phy);
> +	phy_exit(phy);
> +	chip->phy_enabled = false;
> +}
> +
>  static int enable_eud(struct eud_chip *priv)
>  {
>  	int ret;
>  
> -	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	ret = eud_phy_enable(priv);
>  	if (ret)
>  		return ret;
>  
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	if (ret) {
> +		eud_phy_disable(priv);
> +		return ret;
> +	}
> +
>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> @@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
>  		return ret;
>  
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> +	eud_phy_disable(priv);
> +
>  	return 0;
>  }
>  
> @@ -130,6 +192,12 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
>  	if (port < 0)
>  		return port;
>  
> +	/* Check if the corresponding path is available */
> +	if (!chip->paths[port]) {
> +		dev_err(chip->dev, "EUD not supported on selected port\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Port selection must be done before enabling EUD */
>  	if (chip->enabled) {
>  		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
> @@ -229,8 +297,54 @@ static void eud_role_switch_release(void *data)
>  	usb_role_switch_put(chip->role_sw);
>  }
>  
> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
> +{
> +	struct device_node *controller_node;
> +	struct eud_path *path;
> +	u32 path_num;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "reg", &path_num);
> +	if (ret) {
> +		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
> +		if (of_node_name_eq(np, "ports"))
> +			path_num = 0;
> +		else
> +			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
> +					     np->name);
> +	}
> +
> +	if (path_num >= EUD_MAX_PORTS)
> +		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
> +				     path_num, EUD_MAX_PORTS - 1);
> +
> +	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
> +	if (!path)
> +		return -ENOMEM;
> +
> +	path->chip = chip;
> +	path->num = path_num;
> +
> +	controller_node = of_graph_get_remote_node(np, 0, -1);
> +	if (!controller_node)
> +		return dev_err_probe(chip->dev, -ENODEV,
> +				     "failed to get controller node for path %u\n", path_num);
> +
> +	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> +	of_node_put(controller_node);
> +
> +	if (IS_ERR(path->phy))
> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
> +				     "failed to get PHY for path %d\n", path_num);
> +
> +	chip->paths[path_num] = path;
> +
> +	return 0;
> +}
> +
>  static int eud_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct eud_chip *chip;
>  	struct resource *res;
>  	int ret;
> @@ -241,6 +355,16 @@ static int eud_probe(struct platform_device *pdev)
>  
>  	chip->dev = &pdev->dev;
>  
> +	for_each_child_of_node_scoped(np, child) {
> +		ret = eud_init_path(chip, child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Primary path is mandatory. Secondary is optional */
> +	if (!chip->paths[0])
> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
> +
>  	chip->role_sw = usb_role_switch_get(&pdev->dev);
>  	if (IS_ERR(chip->role_sw))
>  		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

