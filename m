Return-Path: <linux-arm-msm+bounces-70791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0891B351E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 04:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727E85E00BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 02:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DED827932E;
	Tue, 26 Aug 2025 02:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNJ4cCU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379A23D7CB;
	Tue, 26 Aug 2025 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176633; cv=none; b=ABf3WwVOAGz/l42yHAkbpqmmm54O27Q/JUk6B56MHt630bBay0Fuak6U+Y3gFbrj81FEVdNH2p8ISrvOgXxOPgaJaGlt/WlzJPaSy/mlLhqqYnygdav4jEHd7LuOWHXYn3cJFxGdp6oT67hMNdBvCrIgSyFumiTS/qPpIXwYhxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176633; c=relaxed/simple;
	bh=AbJJ1EszlkRohUPvaEJ+i+FE4jPykgsI+1CKe8TjVRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZbhVrjL1BZlZwjRCztsSFmDBjFtaGdL4RsfOrKRCDQpMXk+oo/YlLTvSFRIFljcdXSqrZAPvSIfT+9btGsQpwHJCPcdmQREejrFv6YFA5RKU2WjEblTHuaSZrQXq5gdpt1vE45jf9Pkl8Y/ahwEefNGQuM+ZwAhOkCg5cqj1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNJ4cCU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CCAC4CEED;
	Tue, 26 Aug 2025 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756176633;
	bh=AbJJ1EszlkRohUPvaEJ+i+FE4jPykgsI+1CKe8TjVRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNJ4cCU02NBjgYoZikNeB1nB6F843aosoX176giwHCVeN7LEKRfir8KlC352JbJn+
	 xRMeIQhwJJxY97jrU9EQParoxZpVaGaQlkA8F42yZXIVtfSMxvJIYnOvRWML+ehv37
	 MeHkpshnhaWd1lvgiTcutcCOVQbmYTTiLdPizJX10hO1z+k/OZvxTclcr7mLGvfSm9
	 D8z23d19m+Twew16ncgm2SP0mEVot0sXXEFwu33cB4zp/udQSZ2su2+ZOYRknIfNuG
	 9l46KVXysUJEOmapX0Kpj6aOqvo/K4GNkh4R7G3PBR56MqYjsDt1GJWdvC2N8tg1td
	 iOf9io9Jv+Acg==
Date: Mon, 25 Aug 2025 21:50:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Poovendhan Selvaraj <quic_poovendh@quicinc.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom-qmp-usb: fix NULL pointer dereference in
 PM callbacks
Message-ID: <sxqgnmj4bawj7n6kan7tiutb5ynhxz6cgbtpbz2xx4ixodtdw6@q2ftbnpjouvb>
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

On Mon, Aug 25, 2025 at 05:22:02PM +0530, Kathiravan Thirumoorthy wrote:
> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> 
> The pm ops are enabled before qmp phy create which causes
> a NULL pointer dereference when accessing qmp->phy->init_count
> in the qmp_usb_runtime_suspend.
> 

How does that happen? Do we end up in the error path inbetween the
devm_pm_runtime_enable()? Or does it happen by some other means?

This would be quite useful information for others to know if they hit
the same or just a similar problem.

> So if qmp->phy is NULL, bail out early in suspend / resume callbacks
> to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
> qmp_usb_runtime_resume.
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

Has this been a reproducible issue for last 3 years? I think the fixes
makes sense in that it introduced the indirection, but when did the
issue actually show up?

Regards,
Bjorn

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
> 

