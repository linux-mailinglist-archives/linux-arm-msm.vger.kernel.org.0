Return-Path: <linux-arm-msm+bounces-39245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC09DA16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 05:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBC4284174
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 04:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E4121A0B;
	Wed, 27 Nov 2024 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHxQG5sL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327D10E6;
	Wed, 27 Nov 2024 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732681273; cv=none; b=n0+DDyasqWG67SLeSuYjNN0u6c86IghUbc79lHaHyc+YwoV6Dhp+m2PDfkr2HjJ8eAG4mNGlV0RxqvGYyrkDLB8MjNx27TJLOj2yWRmhppTkPal74bz99IwzPxCZq6ZZW44iz+FySHSLVKaxPfNiJEvEXoLx6opB/9LUTiKWSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732681273; c=relaxed/simple;
	bh=eHOLQKunbk8Z3giDEIVHC1DnAyRTlQQ9KQn/cuoZS7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgKsIWd9KEk6keNVN8MJsjurSBcjQ9CzTPNodl1TXGMm2BlcaeyxmFXI7QAL8iT0EU0FYKGb4mySIPJFtx3gUQm5eVE/DHqEaDdfy4S4Mt3ZT9z9QydQx7sJUIaHTWt3CdjeY5I7UrZava78XCcIuBwVGKGwa1kNJQqg1myTGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHxQG5sL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADF5C4CECC;
	Wed, 27 Nov 2024 04:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732681273;
	bh=eHOLQKunbk8Z3giDEIVHC1DnAyRTlQQ9KQn/cuoZS7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHxQG5sLVqZUZTAiOvTwoSBEJAQfVtGniz0PQwBIE1txYPDdeZ5Ic6WNRzeGQcgQO
	 dSDtnCfBI4DmJs1SUxqb8zN9WxQ0NeOGrCo/V/OtPio9W02z9iTS/qyYU+ewU98Iva
	 TlKHdFs7vGL7uHayaDq+pPqYw3ztw7aazAR12KXjGwK+4q5LKWhfuKXo8ExmvRr4RC
	 3VSMDDZhVfcvz6beZcxdo9GC7P4RFcPEildaDZgrQUtLyri2wC1U30PIBsIzKHgbIo
	 6FuDLPfyMiY2zZMSJn6ee54mOsCnB85ax/kwtuofA9ucTI5L45qD30KXgvspfAdOQQ
	 Qe4OE9J2BGghw==
Date: Tue, 26 Nov 2024 22:21:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Keep UFS PHY GDSCs ALWAYS_ON
Message-ID: <tebgud2k4bup35e7rkfpx5kt7m5jxgw3yo3myjzfushnmdecsj@e4cb44jqoevp>
References: <20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org>
 <20241107-ufs-clk-fix-v1-1-6032ff22a052@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-ufs-clk-fix-v1-1-6032ff22a052@linaro.org>

On Thu, Nov 07, 2024 at 11:58:09AM +0000, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Starting from SM8550, UFS PHY GDSCs doesn't support hardware retention. So
> using RETAIN_FF_ENABLE is wrong. Moreover, without ALWAYS_ON flag, GDSCs
> will get powered down during suspend, causing the UFS PHY to loose its
> state. And this will lead to below UFS error during resume as observed on
> SM8550-QRD:
> 

Unless I'm mistaken, ALWAYS_ON makes GDSC keep the gendpd ALWAYS_ON as
well, which in turn would ensure that any parent power-domain is kept
active - which in the case of GCC would imply CX.

The way we've dealt with this elsewhere is to use the PWRSTS_RET_ON flag
in pwrsts; we then keep the GDSC active, but release any votes to the
parent and rely on hardware to kick in MX when we're shutting down CX.
Perhaps this can't be done for some reason?


PS. In contrast to other platforms where we've dealt with issues of
under voltage crashes, I see &gcc in sm8550.dtsi doesn't specify a
parent power-domain, which would mean that the required-opps = <&nom> of
&ufs_mem_hc is voting for nothing.

Regards,
Bjorn

> ufshcd-qcom 1d84000.ufs: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
> ufshcd-qcom 1d84000.ufs: __ufshcd_wl_resume: hibern8 exit failed 5
> ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: 5
> ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x84 returns 5
> ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error 5
> 
> Cc: stable@vger.kernel.org # 6.8
> Fixes: 1fe8273c8d40 ("clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag")
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 5abaeddd6afc..7dd08e175820 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -3046,7 +3046,7 @@ static struct gdsc ufs_phy_gdsc = {
>  		.name = "ufs_phy_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
>  };
>  
>  static struct gdsc ufs_mem_phy_gdsc = {
> @@ -3055,7 +3055,7 @@ static struct gdsc ufs_mem_phy_gdsc = {
>  		.name = "ufs_mem_phy_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
>  };
>  
>  static struct gdsc usb30_prim_gdsc = {
> 
> -- 
> 2.25.1
> 
> 

