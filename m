Return-Path: <linux-arm-msm+bounces-98045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDn2OmHIuGnTjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 04:20:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9392A31EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 04:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 669783085C29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 03:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834912C21EC;
	Tue, 17 Mar 2026 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krhSqnpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE872BEC27;
	Tue, 17 Mar 2026 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773717224; cv=none; b=ZIdBwKlYPB9c0hIiff7JgZ2t8Q8Ao2obZjIupHJzdVUC5YOiMNcc080ZDjuYqwhJlCDFEjEVGdC+jffbgYnbTPe3fcVyiCSUASoC++D035dHf1yoX8aBPFb9pahUK2/p0brEJ6HptPaNW66zy8m87wAxmX7+KJYCIpMTV/3rOpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773717224; c=relaxed/simple;
	bh=IvhB0hUgY7XFQjSQOV+VFgjeRGtimpbkLsn6YgkeEho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uufa3EtIM6bmCChYsHW/sYLIQiewp86C9FoWbTax6Tn42A7Te4O19zotmLcwZKm+P8Jyq/dd+HS5Vv/jE670Pbh0ejtSXAJjdXNuRtpedV5ga7zYe+2XQS3vdGf1tEg6+xkneYTEU7l/Y/ANvzWeq0ANSOlrTx2f1qqnM6/8Tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krhSqnpB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774FDC19421;
	Tue, 17 Mar 2026 03:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773717224;
	bh=IvhB0hUgY7XFQjSQOV+VFgjeRGtimpbkLsn6YgkeEho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krhSqnpBL//s7ZOo/PpI/6lXT4nQCpkVbfmX39h7+4t1gjMwgooH7G2rBa0Ua4WLg
	 zLKXr5VdCuCeawXOA77zcrrnv38j263KGNWbljO7FVxEW6C7HzRQOfrUz47Ql8Y5YK
	 AudEnBmbdDfp0buStpGAUQyfWo9nhxNPp5twbSxZal0WEz+K9KthM2/vwKD6efUCx9
	 KizEJPbepk0eVnSp7G+78iQUlqDmbehxDRBeijSTtnki9PYkkadJX311yKqybjBJay
	 b0OzWcV/Ak1xteXplAAo8M5j8DH3EWZcACCOSK0KEYa2X9pHiq6UHRDj4ogzw7CIZf
	 wbsXSNp/ixLtg==
Date: Tue, 17 Mar 2026 08:43:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe
 power domains
Message-ID: <op5idkaikhclzezdfvf6hziomyoqfbeogymeyuv5kcee3d23bb@qlnu3a55fjdh>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312112321.370983-5-val@packett.cool>
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
	TAGGED_FROM(0.00)[bounces-98045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F9392A31EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:09AM -0300, Val Packett wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> This fixes the link not surviving upon resume:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: Disabling device after reset failure: -19
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
> index b116a9c0b2d9..4095a1f54a09 100644
> --- a/drivers/clk/qcom/gcc-sc8180x.c
> +++ b/drivers/clk/qcom/gcc-sc8180x.c
> @@ -4199,7 +4199,7 @@ static struct gdsc pcie_0_gdsc = {
>  	.pd = {
>  		.name = "pcie_0_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR,
>  };
>  
> @@ -4226,7 +4226,7 @@ static struct gdsc pcie_1_gdsc = {
>  	.pd = {
>  		.name = "pcie_1_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR,
>  };
>  
> @@ -4235,7 +4235,7 @@ static struct gdsc pcie_2_gdsc = {
>  	.pd = {
>  		.name = "pcie_2_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR,
>  };
>  
> @@ -4253,7 +4253,7 @@ static struct gdsc pcie_3_gdsc = {
>  	.pd = {
>  		.name = "pcie_3_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR,
>  };
>  
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்

