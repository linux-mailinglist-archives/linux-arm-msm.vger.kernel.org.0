Return-Path: <linux-arm-msm+bounces-71407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45433B3E62F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02478204778
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 13:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7746533A027;
	Mon,  1 Sep 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+jCrNZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49533A01A;
	Mon,  1 Sep 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734877; cv=none; b=FJkMZCBRIHyPNBXiubJk8hHNTE8MZJ1THb1uhlP1WQHU7YqxiKmQ1pcj0DuNWEegOVuRuASCL9OyarjjQK1JbW/JiiFwV4JJOdfqMNL8QF4nlFmYP1RyYn+/PJ2A69FDS8/de6HXldfKjtP9efAVH433q/kw6waabUV0zalU8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734877; c=relaxed/simple;
	bh=dKazTaBppRdZ6pcD75vpdUcxLLB5hqEqMkzZHVCiBNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAGErgLOSjovhSRU10hKXPKc7U4ZtylkMBjx3ruKJ1Jp64RTcGGtHBm+tP6MJsO25o3lFrv8jWIzf72E76j/5KyuZGqnkU7HYx+c49UAPIcCAb7gB7dude5epxQznJ9i5bbeAY0KsO4F2BMGqqvnG5MRP7T8jK9A9mR/LVIrs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+jCrNZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B07C4CEF1;
	Mon,  1 Sep 2025 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756734876;
	bh=dKazTaBppRdZ6pcD75vpdUcxLLB5hqEqMkzZHVCiBNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+jCrNZkKxm1FbmK7b6ytLKAccupSYtvZJ2uNzZpJd8Tq0XYY+TGtUnl4b4caNfMG
	 M9A+8hepao3DlYv4q/TiNnMM+DdFy5pbNyGJXOv94ql+QikuYXFWIxbQ0uSxjpevZP
	 C5uWZcc+eH++OHHJ5Pn1MatGlzqgiX+FncArgfdQorkd9kGVR/mJP499McpJ8jrYDO
	 DUmk4v14SDDEgKEv+iU817LJvYvdJ7Yo9QNnJK4iKo+U74FbHbBX0kUOoqPDlA5NNO
	 kFtiMV3LME+uq3NWq303IC7Rc4A3o1TiVBaWbOdNUdEzno6RCp9a6f9RDg/sAYfH6I
	 ip07/GiRVh4bw==
Date: Mon, 1 Sep 2025 19:24:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom-qmp-usb: fix NULL pointer dereference in
 PM callbacks
Message-ID: <aLWllyKvag-BAXjn@vaman>
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
 <20250825-qmp-null-deref-on-pm-v1-1-bbd3ca330849@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-qmp-null-deref-on-pm-v1-1-bbd3ca330849@oss.qualcomm.com>

On 25-08-25, 17:22, Kathiravan Thirumoorthy wrote:
> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> 
> The pm ops are enabled before qmp phy create which causes
> a NULL pointer dereference when accessing qmp->phy->init_count
> in the qmp_usb_runtime_suspend.
> 
> So if qmp->phy is NULL, bail out early in suspend / resume callbacks
> to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
> qmp_usb_runtime_resume.

That is a band-aid. we should enable pm only when ready... 
Why not do that instead?

> 
> Below is the stacktrace for reference:
> 
> [<818381a0>] (qmp_usb_runtime_suspend [phy_qcom_qmp_usb]) from [<4051d1d8>] (__rpm_callback+0x3c/0x110)
> [<4051d1d8>] (__rpm_callback) from [<4051d2fc>] (rpm_callback+0x50/0x54)
> [<4051d2fc>] (rpm_callback) from [<4051d940>] (rpm_suspend+0x23c/0x428)
> [<4051d940>] (rpm_suspend) from [<4051e808>] (pm_runtime_work+0x74/0x8c)
> [<4051e808>] (pm_runtime_work) from [<401311f4>] (process_scheduled_works+0x1d0/0x2c8)
> [<401311f4>] (process_scheduled_works) from [<40131d48>] (worker_thread+0x260/0x2e4)
> [<40131d48>] (worker_thread) from [<40138970>] (kthread+0x118/0x12c)
> [<40138970>] (kthread) from [<4010013c>] (ret_from_fork+0x14/0x38)
> 
> Cc: stable@vger.kernel.org # v6.0
> Fixes: 65753f38f530 ("phy: qcom-qmp-usb: drop multi-PHY support")
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index ed646a7e705ba3259708775ed5fedbbbada13735..cd04e8f22a0fe81b086b308d02713222aa95cae3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -1940,7 +1940,7 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
>  
>  	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
>  
> -	if (!qmp->phy->init_count) {
> +	if (!qmp->phy || !qmp->phy->init_count) {
>  		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>  		return 0;
>  	}
> @@ -1960,7 +1960,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
>  
>  	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
>  
> -	if (!qmp->phy->init_count) {
> +	if (!qmp->phy || !qmp->phy->init_count) {
>  		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>  		return 0;
>  	}
> 
> -- 
> 2.34.1

-- 
~Vinod

