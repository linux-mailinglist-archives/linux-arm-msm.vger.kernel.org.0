Return-Path: <linux-arm-msm+bounces-93515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHnoA2tzmGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:44:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38751687FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 454FE3049948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6397B29994B;
	Fri, 20 Feb 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C12rBUTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2E41754;
	Fri, 20 Feb 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598694; cv=none; b=IKrWafwXNfrtS6Ltq90VnIZDJyUko0H69QS8fW7tZ0dGZVEUrDTmzweCSdOMlhrTedNDc9YA9G2QNi0fiRSr0t7tQZwOkLxu74aB5gAoOHWB7FinhDGfow+0N/QZ5qiMK1BNVt1eYN/uNrr8SrE/U1K/JOSR+aEk9Lw+O5l70I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598694; c=relaxed/simple;
	bh=RG2Hbf0o3KuqHZA5+48UswLVGJeXGifkvsztTu4/mN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+rHcgC284T6Zum4BFon8Si14T6EP6uN3zA0omH6GNXmDc+J0yEE4RQKEU7xik0rFszvO+tN0cVIFgsRx0QX7XHqO8lklVWqMcOc2UjBrDFjtGzNFmfFTPLs8twTx/DPQPVAUjSdMGdLvMTB5WJbzwaNNyFulfAM86SyWaeyCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C12rBUTn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB7EC116C6;
	Fri, 20 Feb 2026 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598694;
	bh=RG2Hbf0o3KuqHZA5+48UswLVGJeXGifkvsztTu4/mN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C12rBUTnA1iJHVlm9ABE6opSgoFtD/ToalKiOumJIOKBNooJtp5TVG/aJmvhSYzoN
	 JdxJ7uk4iCij2Aui1zxPm8KDGulo+EhprMBZduPecMxE0eTB+C/K2rVrG6MjNvVBwA
	 V0tAmRNwiC3Son3ZQwnVkKQgTtax/HAdgY9zjkbrgyU1c0zY1FMYUqv36qm+mLv+5w
	 HIj9eCxwC2UJ46qn+BMXGx8FTh9f7R/YHTrpBiyacN6nH/CCzjA0TA6eRsJ76X/0Wv
	 Lo24d5B3SiovMtgewWVYU2pfVG8IjcwsMGCjEopMcAqm6LJ/WpZUEGvEutRLP4bLW3
	 16gH6/69vLArw==
Date: Fri, 20 Feb 2026 20:14:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org, 
	Brian Masney <bmasney@redhat.com>, Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and
 clock voting calls for ICE
Message-ID: <vimd3tbnu4mr2uqporj7d4fv23aq2cb6e5een43yz5spe4u2xx@ufyzb2lzlc6j>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93515-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A38751687FD
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:41:35PM +0530, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
> and the 'core' and 'iface' clocks.

You don't need to vote for a single power domain since genpd will do that for
you before the driver probes.

> Also updated the suspend and resume callbacks to handle votes on these
> resources.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Where is the Fixes tag?

> ---
>  drivers/soc/qcom/ice.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..4b50d05ca02a 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,8 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <linux/firmware/qcom/qcom_scm.h>
>  
> @@ -108,6 +110,7 @@ struct qcom_ice {
>  	void __iomem *base;
>  
>  	struct clk *core_clk;
> +	struct clk *iface_clk;
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
> @@ -310,12 +313,20 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  	struct device *dev = ice->dev;
>  	int err;
>  
> +	pm_runtime_get_sync(dev);

This is not needed as the power domain would be enabled at this point.

>  	err = clk_prepare_enable(ice->core_clk);
>  	if (err) {
>  		dev_err(dev, "failed to enable core clock (%d)\n",
>  			err);
>  		return err;
>  	}
> +
> +	err = clk_prepare_enable(ice->iface_clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable iface clock (%d)\n",
> +			err);
> +		return err;
> +	}

Use clk_bulk API to enable all clocks in one go.

>  	qcom_ice_hwkm_init(ice);
>  	return qcom_ice_wait_bist_status(ice);
>  }
> @@ -323,7 +334,9 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>  
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
> +	clk_disable_unprepare(ice->iface_clk);

Same here.

>  	clk_disable_unprepare(ice->core_clk);
> +	pm_runtime_put_sync(ice->dev);

Not needed.

>  	ice->hwkm_init_complete = false;
>  
>  	return 0;
> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
>  
> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
> +	if (IS_ERR(engine->iface_clk))
> +		return ERR_CAST(engine->iface_clk);
> +

Same here. Use devm_clk_bulk_get_all_enabled().

>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> @@ -725,6 +742,9 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  	}
>  
> +	devm_pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);

If you want to mark & enable the runtime PM status, you should just do:

	devm_pm_runtime_set_active_enabled();	

But this is not really needed in this patch. You can add it in a separate patch
for the sake of correctness.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

