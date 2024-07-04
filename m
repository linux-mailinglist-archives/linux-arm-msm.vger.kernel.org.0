Return-Path: <linux-arm-msm+bounces-25224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B6926D68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 04:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AEB91C21E8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 02:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB36125B9;
	Thu,  4 Jul 2024 02:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct4RJi4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEC9457;
	Thu,  4 Jul 2024 02:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720059942; cv=none; b=LVr+GULfu7FFZie8ANS/5H2VDLVwmSzG5CvKf+wyWzwMfP6jTpU0Ggn692n6ab7AVeIb9FgI00vP4tlienZnbwBLkC6Ij9X+y1WBfP1QDWhUIzpUjGuzvm3Sm0hMYCu5l2HW4QZqPytukQRQalBwgPbpkpWDUcLJVhBwfipnf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720059942; c=relaxed/simple;
	bh=dVK3JwyGY6+ZxaownZlNQSE2BC7btSfN5OnAiAZQZ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkFY5nt00DJKOB4IXvt/AmBuF9yhx2kbx7HW+eePpBTFMK02Tql1ldny8YEvv8vDlmceVRinqQ3ijmVwkDSAtACImPgtv/imSIaWikFgH3OYHJrZKIIKMYOVWa3VqMbGkzQxZZvre0qDPhZqZyRPqDsn4nfumqj5b2dRE8/ENy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct4RJi4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0636EC2BD10;
	Thu,  4 Jul 2024 02:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720059941;
	bh=dVK3JwyGY6+ZxaownZlNQSE2BC7btSfN5OnAiAZQZ4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ct4RJi4UBlXR8zvL7tq3WfcJzNxSMfIBvhReVvdfk4/yeM7j+bpJpMY/TfOhEVMrU
	 D6OaR8M3vzOTpamEc81Sjau1qBtqxVvD/T3iD32AqdLMootP6kBgJRAVwLhbOEdKis
	 htf0LDi3L4b1Xj5wED+T5Mxd7fHQ33flEzxBYrBER8sa5ElC668hF/S+9rlYzULKdE
	 vc9zjHUdewDsspd09EMUHfuy9J2zuhahCLpg98fqhLhC8LmAQLI+iBUoapSkPo2qGa
	 mK9rlyv4y6h+SXjIiKeevneGgLbC6EeZomiaxAxwi95PCJ3DfUWgcGCMdrd/O5TORT
	 gSKtN+CzRSWcA==
Date: Wed, 3 Jul 2024 21:25:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: David Collins <quic_collinsd@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] spmi: pmic-arb: add missing newline in dev_err format
 strings
Message-ID: <ansfnfz2ttzdq3l6t2xr4xxd2bi7uixt45hghgqjppf47lvvnf@yoc63yszrohc>
References: <20240703221248.3640490-1-quic_collinsd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703221248.3640490-1-quic_collinsd@quicinc.com>

On Wed, Jul 03, 2024 at 03:12:48PM GMT, David Collins wrote:
> dev_err() format strings should end with '\n'.  Several such
> format strings in the spmi-pmic-arb driver are missing it.
> Add newlines where needed.
> 
> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
> Signed-off-by: David Collins <quic_collinsd@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/spmi/spmi-pmic-arb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 791cdc160c51..c408ded0c00f 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -398,7 +398,7 @@ static int pmic_arb_fmt_read_cmd(struct spmi_pmic_arb_bus *bus, u8 opc, u8 sid,
>  
>  	*offset = rc;
>  	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
> -		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
> +		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested\n",
>  			PMIC_ARB_MAX_TRANS_BYTES, len);
>  		return  -EINVAL;
>  	}
> @@ -477,7 +477,7 @@ static int pmic_arb_fmt_write_cmd(struct spmi_pmic_arb_bus *bus, u8 opc,
>  
>  	*offset = rc;
>  	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
> -		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
> +		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested\n",
>  			PMIC_ARB_MAX_TRANS_BYTES, len);
>  		return  -EINVAL;
>  	}
> @@ -1702,7 +1702,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>  
>  	index = of_property_match_string(node, "reg-names", "cnfg");
>  	if (index < 0) {
> -		dev_err(dev, "cnfg reg region missing");
> +		dev_err(dev, "cnfg reg region missing\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1712,7 +1712,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>  
>  	index = of_property_match_string(node, "reg-names", "intr");
>  	if (index < 0) {
> -		dev_err(dev, "intr reg region missing");
> +		dev_err(dev, "intr reg region missing\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.25.1
> 
> 

