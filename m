Return-Path: <linux-arm-msm+bounces-95455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AFwLDqaqGkGwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:46:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A710207B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FDE6300E3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 20:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27A8372B5C;
	Wed,  4 Mar 2026 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFtrj/Cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF97366DAC;
	Wed,  4 Mar 2026 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657199; cv=none; b=G85SUF4+k6lTHbF8+UjzBcl80/vM/uiy2kAVrWKEeAny81kgELQadvdvlFIGLf0E8krCGqdMdxkWNuT46IJblHOSrLcyFE3j3yZt+H+yS0WgfSNj22QEoDSDfFuEoAastSazzzhiEgde01TEvXC5ugcnOnAKYahJzgqvXmOOraQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657199; c=relaxed/simple;
	bh=xZPU+lO15zbS01J/5fhSubvCHoqF8ecKxJyi14RpyjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax+ElLcA+H22Cnz+0qUUKn5xD96OHRR/ms/ob9DK3rkJ7NdlvAVTgE/ftVQWjYF8oqm8LlfVzt2H+ZO0WADTYBcqlibXKE3fSzSj3jNTGb6yGE3gdKhfoPy8sgoI0HCmDsS/cHlRoV/RiXDODQtn6ATmQ+RaKj8fR9OYDs7MKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFtrj/Cf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95EFC4CEF7;
	Wed,  4 Mar 2026 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772657199;
	bh=xZPU+lO15zbS01J/5fhSubvCHoqF8ecKxJyi14RpyjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFtrj/CfE7jawNLOVd9//PL4AXeNcwg7aU2khJ2s3QPivnnq8v1QTuywFUWuNkCIc
	 Hd5/evtUohpOUbwHRqikiTH2OU2K7N8j8TBM08HgAwmCtklm2J7GI/dWMViFl3CG1W
	 QOdbUPYl62X3ibbincSJD1obKO54k3qe3PrCU0FyCUHyLExhtdHUw3n5qHX9TVKyRL
	 OdMR5zk7Dah5eLwQVZOxKlKLBUSkep7RziDbGG7EN2jq2HsP4zkE5lC+ulY16of1Gg
	 PGHG0h6ONyCzYYXkCy5ZWvF5o1fFzJ15kkkEXpgRnJzG/i+Ho5CrNVIgzkKZtMdrRJ
	 fngDBxHqKqc1w==
Date: Wed, 4 Mar 2026 14:46:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <qmtl3j7czisocywmkwgaxxuzhc6e6zzvaqmqjs5p2phcpk2q3x@rocbjxeguv4g>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2A710207B33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95455-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:21:56AM -0800, Qiang Yu wrote:
> The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
> a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
> that must be powered on before initialization per hardware requirements.
> 
> Current PHY power management assumes a single power domain per PHY,
> preventing proper setup for this dual-PHY scenario. Add support for
> multiple power domains by using devm_pm_domain_attach_list() to attach
> power domains manually, while maintaining compatibility with single
> power domain PHYs.
> 
> Enable runtime PM to allow power domain control when the PCIe driver
> calls phy_power_on/phy_power_off:
> 

Enabling runtime PM seems like a separate change that impacts all
existing targets, while adding multiple power domains should only affect
the specific ones.

I'm not sure if it's too picky, but it would be nice to separate this -
so that any issues that might arise can be bisected down to one or the
other of these two changes?

> - Single power domain: QMP PHY platform device directly attaches to
>   power domain and controls it during runtime resume/suspend
> - Multiple power domains: devm_pm_domain_attach_list() creates virtual
>   devices as power domain suppliers, linked to the QMP PHY platform
>   device as consumer
> 
> This ensures power domains are properly attached and turned on/off
> for both single and multiple power domain configurations.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index fed2fc9bb31108d51f88d34f3379c7744681f485..7369c291be51aa1ad7a330459dcb857f5a1988f6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -17,6 +17,7 @@
>  #include <linux/phy/pcie.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -3334,6 +3335,8 @@ struct qmp_pcie {
>  
>  	struct clk_fixed_rate pipe_clk_fixed;
>  	struct clk_fixed_rate aux_clk_fixed;
> +
> +	struct dev_pm_domain_list *pd_list;

This is just an pointer to the list allocated inside
devm_pm_domain_attach_list(), as far as I can tell you don't need to
keep this in the qmp_pcie struct - as you're not using it anyways.

Regards,
Bjorn

>  };
>  
>  static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
> @@ -5348,6 +5351,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>  	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
>  	WARN_ON_ONCE(!qmp->cfg->phy_status);
>  
> +	ret = devm_pm_domain_attach_list(dev, NULL, &qmp->pd_list);
> +	if (ret < 0 && ret != -EEXIST) {
> +		dev_err(dev, "Failed to attach power domain\n");
> +		return ret;
> +	}
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = qmp_pcie_clk_init(qmp);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

