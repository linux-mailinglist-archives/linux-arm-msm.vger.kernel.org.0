Return-Path: <linux-arm-msm+bounces-116621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eieTL7ohS2rRMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:32:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B957670C572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S4LLoTMg;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C94F3007AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 03:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76AE3AD52A;
	Mon,  6 Jul 2026 03:32:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE035839C;
	Mon,  6 Jul 2026 03:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308723; cv=none; b=TTsSpMezr6njG94PjwdaMVHmwYpRoO9fVNLeAA/iz8/LS1LNnZmHe79q7rP8QDssWLkmsQEXhr9gpcLwUts16Cq4w9N33QH2WB+BlH/Tlu6gSxdFDp0JfIxraj5/bTSxk6ht6qT+VmLZCQwNi4yABkL0vvJ77piEQJ5r+KHTEOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308723; c=relaxed/simple;
	bh=GBaSpkX/ZWZ8FKBzWzRYdMKpcyVa+GFYiM6rKv2byGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maeKFvRBhg1Vyee+9JaB6WNW9L6vKPGCXfKG0tPeRyZD7ygQXgKMeogCyrBDEhiWCi9dzC2GmdNoz6RLX1UoSq3gxgQddzCf/L9sGnVTrnGaZy/K5kzbS95msoVLalqZPI6JnRrWxJB3AqpSrEMcrg5q6ru5MkwhTjIT4UA0xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4LLoTMg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2551F000E9;
	Mon,  6 Jul 2026 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783308722;
	bh=pgK1AhmGSy4aon6P61BNRyRaQlwaG8JpQ/TTXfTW+so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4LLoTMgX5Frd4+I3ALkC1K+q2wrqr+SFmn19E3s7YcZK7/SkSaBaJFuezpe2CKwn
	 68jnToZBcuz1mFPuMLF7YiVruGQdKS4bnpjVA/l9ufvCrUJcN44+7ca3oENHeEIY2W
	 EXcRf54OV3/K/ClX8U2MT74Sle858zHULjxXt4PbTNKeG3BvY2E3O6ooRTuZjJfqKw
	 wdudwo2M27+Yb134Ps/A/QvwuZTWDIyN5sXERbi+jrchqo9p/V2hwZMzejIktBo9SM
	 i2nzN2W54jSfwuasY/DoU6fuWELExMREWxnUr4bF5Mpikf93WNAwHRGS/UUr7/ctGf
	 jjU7GfEaiCVHw==
Date: Sun, 5 Jul 2026 20:32:00 -0700
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
Subject: Re: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch
 support
Message-ID: <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116621-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B957670C572

On 26-05-01 10:06:30, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  drivers/usb/misc/qcom_eud.c | 89 +++++++++++++++++++++++++++++--------
>  1 file changed, 70 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index a624c44d5d59..7fbb74bf1599 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
>  struct eud_path {
>  	struct eud_chip		*chip;
>  	struct phy		*phy;
> +	struct usb_role_switch	*controller_sw;
> +	struct usb_role_switch	*eud_sw;
> +	enum usb_role		curr_role;
> +	char			name[16];
>  	u8			num;
>  };
>  
>  struct eud_chip {
>  	struct device			*dev;
> -	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
>  	struct eud_path			*paths[EUD_MAX_PORTS];
>  	phys_addr_t			mode_mgr;
> @@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
>  
> -	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> +	return 0;
>  }
>  
>  static int disable_eud(struct eud_chip *priv)
> @@ -274,12 +277,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
>  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  {
>  	struct eud_chip *chip = data;
> +	struct eud_path *path;
>  	int ret;
>  
> +	path = chip->paths[chip->port_idx];
> +
>  	if (chip->usb_attached)
> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
> +		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
> +		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");
>  
> @@ -290,15 +296,36 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static void eud_role_switch_release(void *data)
> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>  {
> -	struct eud_chip *chip = data;
> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
> +	int ret;
> +
> +	/* Forward the role request to the USB controller */
> +	ret = usb_role_switch_set_role(path->controller_sw, role);
> +	if (ret) {
> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> +			usb_role_string(role), path->num, ret);
> +		return ret;
> +	}
>  
> -	usb_role_switch_put(chip->role_sw);
> +	path->curr_role = role;
> +
> +	return 0;
> +}
> +
> +static void eud_path_role_switch_release(void *data)
> +{
> +	struct eud_path *path = data;
> +
> +	usb_role_switch_unregister(path->eud_sw);
> +	usb_role_switch_put(path->controller_sw);
>  }
>  
>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  {
> +	struct usb_role_switch_desc role_sw_desc;

Should role_sw_desc be zero-initialized here? Otherwise, some entries
of path->eud_sw are uncertain after calling usb_role_switch_register?

Peter

> +	struct usb_role_switch *sw;
>  	struct device_node *controller_node;
>  	struct eud_path *path;
>  	u32 path_num;
> @@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  				     "failed to get controller node for path %u\n", path_num);
>  
>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> -	of_node_put(controller_node);
> -
> -	if (IS_ERR(path->phy))
> +	if (IS_ERR(path->phy)) {
> +		of_node_put(controller_node);
>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>  				     "failed to get PHY for path %d\n", path_num);
> +	}
> +
> +	path->curr_role = USB_ROLE_NONE;
> +
> +	/* Fetch controller role switch if it is role switch capable */
> +	if (of_property_read_bool(controller_node, "usb-role-switch")) {
> +		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +		if (!sw) {
> +			of_node_put(controller_node);
> +			return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +					     "Failed to get controller role switch for path %d\n",
> +					     path_num);
> +		}
> +		path->controller_sw = sw;
> +	}
> +
> +	of_node_put(controller_node);
> +
> +	role_sw_desc.fwnode = of_fwnode_handle(np);
> +	role_sw_desc.set = eud_role_switch_set;
> +	role_sw_desc.driver_data = path;
> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
> +	role_sw_desc.name = path->name;
> +
> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> +	if (IS_ERR(path->eud_sw)) {
> +		usb_role_switch_put(path->controller_sw);
> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
> +				     "Failed to register EUD role switch for path %d\n", path_num);
> +	}
> +
> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
> +	if (ret)
> +		return ret;
>  
>  	chip->paths[path_num] = path;
>  
> @@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
>  	if (!chip->paths[0])
>  		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>  
> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
> -	if (IS_ERR(chip->role_sw))
> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> -					"failed to get role switch\n");
> -
> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
> -	if (ret)
> -		return ret;
> -
>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

