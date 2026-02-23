Return-Path: <linux-arm-msm+bounces-93805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNrHC8SznGnsJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:08:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDD17CBD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52A60317FF46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCABD361641;
	Mon, 23 Feb 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3AIdiY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887825FA10;
	Mon, 23 Feb 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877028; cv=none; b=ef+002tjFoJHlEHHD2tsJbvoWGZ51MyAEQhiM+mpsD/GiU4gb/G/WssKqP5l9wZkzZsvrOXDLjob84jwp3WtwfY1Oy0BD//FeDkmdYypsiziYrhXwqw7SKvk+I9U/o3S1LH2EcdGFaO9A6HaWqh80abw8+6vg5UaBRUCYC+jWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877028; c=relaxed/simple;
	bh=aTh23EkOJI0kjUod1Hs09WDlySin3Rd8su95Qd1Sxbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp4piEZlHtkfCdm9gzUAsidI+hRnq2ovSgoXRp7NHz8nxM+0t6nLjIYiyWce+Dk0FpRkGkgG1oNGeFuoHRxyfhSFgRpgYb1kJN1YibMiw++jGhvK4/MfTx5VObBCaGKeIq5H9hEgd9SkYFrpzN/yOrte6d5vrGgwtp40GrGfZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3AIdiY1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3ABC116C6;
	Mon, 23 Feb 2026 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771877028;
	bh=aTh23EkOJI0kjUod1Hs09WDlySin3Rd8su95Qd1Sxbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3AIdiY1aWDJa++pm5SdWAXF58jKQG7vxcOkk/g3sD4FIY71PPIutHXG6R44JPj79
	 1SggovlSNnN0ReSuS9yc4TYmeZIVcF7N68XB5VMuj15EXMdt/4fkxisauTZR/nl3Jv
	 UAkoocK2iAN0T7e2B1EDU2tswqxU9T9SBSu2u2tHomXLxW0G8GJc0x58BPwcRKiMv0
	 gYi88QIURdsrshq+uual9Mb/FWpKEbOkL4A2r6NYF0Q4h1CguOEo5H+XeD9oyS8l0r
	 e0Ylem0e2Wt3Hrv3JiNViBAz/ZuQWyUkSi3IOmpozH+eRSjh5gJo0hpK2sIkjpzScS
	 pbT8ZzJ9FHBBQ==
Date: Mon, 23 Feb 2026 14:03:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, Luca Weiss <luca@lucaweiss.eu>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
Message-ID: <jup7hphwpa754gyhtcahz25glecp6ctpuxcwzvco6wrbokvnip@quw7hrauahsa>
References: <20260201210230.911220-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,google.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BCDD17CBD0
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 05:55:03PM -0300, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 

Is the error only an error print, or did the thing stop working as well?

Should we no longer carry
Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")

Regards,
Bjorn

> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: changed to detect the >= condition suggested by Konrad
> v1: https://lore.kernel.org/all/20260126235018.969140-1-val@packett.cool/
> 
> "possible_pds" is the best name I could come up with (as "num" is already
> taken by the number of *successfully attached* PDs and "max" is the constant
> for the array length) for the count we're checking against. Maybe the "num"
> could be changed to "attached" but that feels like too much diff.
> 
> ~val
> ---
> 
>  drivers/remoteproc/qcom_wcnss.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..60f629b5bbed 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -441,25 +441,31 @@ static void wcnss_release_pds(struct qcom_wcnss *wcnss)
>  }
>  
>  static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
> -				 const struct wcnss_vreg_info *info,
> -				 int num_vregs, int num_pd_vregs)
> +				 const struct wcnss_data *data)
>  {
> +	const struct wcnss_vreg_info *info = data->vregs;
>  	struct regulator_bulk_data *bulk;
> +	size_t i, possible_pds = 0, num_vregs = data->num_vregs;
>  	int ret;
> -	int i;
> +
> +	for (i = 0; i < WCNSS_MAX_PDS; i++)
> +		if (data->pd_names[i])
> +			possible_pds++;
>  
>  	/*
>  	 * If attaching the power domains suceeded we can skip requesting
>  	 * the regulators for the power domains. For old device trees we need to
>  	 * reserve extra space to manage them through the regulator interface.
>  	 */
> -	if (wcnss->num_pds) {
> +	if (possible_pds >= num_vregs) {
> +		/* Do nothing if vregs do not include PD regulators (pronto-v3) */
> +	} else if (wcnss->num_pds) {
>  		info += wcnss->num_pds;
>  		/* Handle single power domain case */
> -		if (wcnss->num_pds < num_pd_vregs)
> -			num_vregs += num_pd_vregs - wcnss->num_pds;
> +		if (wcnss->num_pds < data->num_pd_vregs)
> +			num_vregs += data->num_pd_vregs - wcnss->num_pds;
>  	} else {
> -		num_vregs += num_pd_vregs;
> +		num_vregs += data->num_pd_vregs;
>  	}
>  
>  	bulk = devm_kcalloc(wcnss->dev,
> @@ -607,8 +613,7 @@ static int wcnss_probe(struct platform_device *pdev)
>  	if (ret && (ret != -ENODATA || !data->num_pd_vregs))
>  		return ret;
>  
> -	ret = wcnss_init_regulators(wcnss, data->vregs, data->num_vregs,
> -				    data->num_pd_vregs);
> +	ret = wcnss_init_regulators(wcnss, data);
>  	if (ret)
>  		goto detach_pds;
>  
> -- 
> 2.52.0
> 

