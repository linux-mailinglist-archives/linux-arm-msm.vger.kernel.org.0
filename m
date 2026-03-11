Return-Path: <linux-arm-msm+bounces-96990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLhmITFssWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:20:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF326458B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01CF321B85E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489D309F09;
	Wed, 11 Mar 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d/1/ZTIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79732F5474;
	Wed, 11 Mar 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235016; cv=none; b=ju2dz83ggqajP06RoC8b2eAXBlEkougkUUmuVx127fniFxjzXQ7JjVijfW5ZyrB7ir21LyJTViOAMJe6YMSazN1wqyuaTOoeca/wdw0orAZHVt8BchIa70nPq3dnLPZZkLqPc6n+K/9L1xvueICnnvil48NA0LsvJ4nAZOaKMU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235016; c=relaxed/simple;
	bh=U13aFlwZAety379snMOfNociaZUEB0cGKCSE9d/m9OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YD8hLy7HKhWhf03ND5fF3amZZxXZkQr495mW3F237zz/F4rv4FjXz1YfYUHGgCCyab+fV4Mf4Wb0PM3vAJwrUJ4+O6UwYGBvZCYtpynzg54zvINBByQ1plqCpF8m1QNR8gDe4kLI1sDFjosLs7L23jraE+yOibn/hynW3HySaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d/1/ZTIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B873FC4CEF7;
	Wed, 11 Mar 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773235016;
	bh=U13aFlwZAety379snMOfNociaZUEB0cGKCSE9d/m9OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/1/ZTImJAB9+0FsHXXtaZgczILjEjx5Qa4DOIye7nSXW05U44v0UCX8KlpwNghoS
	 tvj3RWIbNws/7DJErRm4dSAnfQAwOEmodTawYZLQpH2U9OjCISQ1alaldZW5VZ8xwb
	 FggafbRywmXw2rTywpppWcvPobLjFHj0aQppt5lE=
Date: Wed, 11 Mar 2026 14:16:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute
 for port selection
Message-ID: <2026031101-cornstalk-partner-a30e@gregkh>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
X-Rspamd-Queue-Id: EAAF326458B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:33:29PM -0700, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
>  drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> index 2bab0db2d2f0..67223f73ee60 100644
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
> +		  0 - Primary USB port
> +		  1 - Secondary USB port

Why not use "primary" and "secondary" as values instead?  That makes
this much simpler to understand.


> +
> +		The attribute is writable only while EUD is disabled.
> +		Reading the attribute returns the currently selected
> +		USB port number.
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 926419ca560f..1a136f8f1ae5 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -23,8 +23,11 @@
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
> @@ -40,6 +43,7 @@ struct eud_chip {
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
> +	u8				port_idx;
>  };
>  
>  static int enable_eud(struct eud_chip *priv)
> @@ -104,8 +108,47 @@ static ssize_t enable_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(enable);
>  
> +static ssize_t port_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", chip->port_idx);

Wait, you are returning a 0/1 here, yet using a u8?  How can that work?

confused,

greg k-h

