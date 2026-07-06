Return-Path: <linux-arm-msm+bounces-116624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id veCrLd83S2o/NwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:06:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC270C855
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:06:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F3rApdqt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6A7030067B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C153AFD04;
	Mon,  6 Jul 2026 05:06:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960FE2E7384;
	Mon,  6 Jul 2026 05:06:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314396; cv=none; b=UipYnua1C7lSztvb5rZNM3ZQM2bNhTCBd35v/8QOKYAGFGq6xdg0RyHfZG6uQXX+KiUhAatpYHmxrC1qHRU99iRujzwhGnLPH5ylltowklMmvrAeog4rOxgKzqQygi9jeb/nw63IjYp3+j3XrvyB8xmymMCSiEwU++a+F0n49K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314396; c=relaxed/simple;
	bh=Qc2gR/Vp6awQGMSf1ajv3moFRz6aMkNSgqU69dGChls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfL8pj95z7fenEvqY2gJYAytg1e0rEDYW5zut3GWuGbIKnv6u07eu7RftqJf7dd5irAFQqtU6ng2WpQ8uwA1sM/c0Zi9gQj+giXV/t/Jj3ClSJ5yEuP/t5H2TAmv4E4Mcyf6aNcSBEXqJJgyvaKo+5G/X+cv2qsDfMsh+gCpDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3rApdqt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D691C1F000E9;
	Mon,  6 Jul 2026 05:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783314395;
	bh=J+fKjAPoFfEN3EhhMvl6vpLQzmaaaDibQrofdDJfltM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3rApdqtJ1Ro6TEjIlrRdBBeoa9QMpF0T1NbTXgP2/n54bvuff9bPkx9d4zkLr0R9
	 f7nGBgQioflOkuwZtxURbzdVsZvYohmLjzuzSwuPi3nOUZgaZAELeCCcS+ms/nHiCn
	 SazA4QM3ppiUa0k1KGPhoKV/yzxJkwFBLbWZXQK5R5l3jRc7Ym7cmA79Wp40+fGPGQ
	 60Jmdi5veq39D6P+h7NfbDydj8/xGIOo2Gsy96gwhdrRBymwA6Ieoy7TummUwH6Qkh
	 lpt5CaeNHSgXzSet0zB7KQhuTZZnPTDx7sJRZyALwkFJrSzKQ3kqYeS6f5evYFPLtN
	 uuWwatkmM3VsA==
Date: Sun, 5 Jul 2026 22:06:33 -0700
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
Subject: Re: [PATCH v4 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
Message-ID: <aks32UYxQQxST5ek@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-116624-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hu-petche-lv.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9DC270C855

On 26-05-01 10:06:28, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  Documentation/ABI/testing/sysfs-driver-eud | 16 +++++++++
>  drivers/usb/misc/qcom_eud.c                | 41 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> index 2bab0db2d2f0..a2a4fc5a9915 100644
> --- a/Documentation/ABI/testing/sysfs-driver-eud
> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> @@ -7,3 +7,19 @@ Description:
>  		EUD based on a 1 or a 0 value. By enabling EUD,
>  		the user is able to activate the mini-usb hub of
>  		EUD for debug and trace capabilities.
> +
> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
> +Date:		January 2026
> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
> +Description:
> +		Selects which USB port the Embedded USB Debugger (EUD)
> +		is mapped to on platforms providing multiple High-Speed
> +		USB ports.
> +
> +		Valid values:
> +		  primary   - Primary USB port
> +		  secondary - Secondary USB port
> +
> +		The attribute is writable only while EUD is disabled.
> +		Reading the attribute returns the currently selected
> +		USB port.
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 926419ca560f..4aa49f0f58c0 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -23,14 +23,22 @@
>  #define EUD_REG_VBUS_INT_CLR	0x0080
>  #define EUD_REG_CSR_EUD_EN	0x1014
>  #define EUD_REG_SW_ATTACH_DET	0x1018
> +#define EUD_REG_PORT_SEL	0x1028
>  #define EUD_REG_EUD_EN2		0x0000
>  
> +#define EUD_MAX_PORTS		2
> +
>  #define EUD_ENABLE		BIT(0)
>  #define EUD_INT_PET_EUD		BIT(0)
>  #define EUD_INT_VBUS		BIT(2)
>  #define EUD_INT_SAFE_MODE	BIT(4)
>  #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
>  
> +static const char * const eud_port_names[] = {
> +	"primary",
> +	"secondary",
> +};
> +
>  struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
> @@ -40,6 +48,7 @@ struct eud_chip {
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
> +	u8				port_idx;
>  };
>  
>  static int enable_eud(struct eud_chip *priv)
> @@ -104,8 +113,40 @@ static ssize_t enable_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(enable);
>  
> +static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
> +}
> +
> +static ssize_t port_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +	int port;
> +
> +	port = sysfs_match_string(eud_port_names, buf);
> +	if (port < 0)
> +		return port;
> +
> +	/* Port selection must be done before enabling EUD */
> +	if (chip->enabled) {
> +		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
> +		return -EBUSY;
> +	}
> +
> +	writel(port, chip->base + EUD_REG_PORT_SEL);
> +	chip->port_idx = port;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(port);
> +
>  static struct attribute *eud_attrs[] = {
>  	&dev_attr_enable.attr,
> +	&dev_attr_port.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(eud);
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

