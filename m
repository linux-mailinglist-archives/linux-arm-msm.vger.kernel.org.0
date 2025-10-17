Return-Path: <linux-arm-msm+bounces-77845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F79BEBF22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 00:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1778035698E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA30B311C1F;
	Fri, 17 Oct 2025 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJlv+3RB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D72DCF7B;
	Fri, 17 Oct 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760741408; cv=none; b=MGFHfYjYVsbwM8d2oAOZi6Juhd61sbUW//GAeskXjYXrTaXkPbNd7tcN9ZZSrkx5JlK35poH04+2lAVnE6ez5Vsd4F+tfg9c4hcbOLO+DYFP5smPDcDSaWtPtKVkkzYyA7dznJ3xrJoefp+DgEY4JBwOzdd3i38lE0bMB/AnzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760741408; c=relaxed/simple;
	bh=LR9ow0WDk7nKg118rjVF5Bu2uA14Kqebz9VEjk6ZGFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ822/M0BTp3d7vKl6ItsoX51cksz1rlzq/iyPREGhniGjvwxIHPEQwLNdr5I7VXa22f/yLn98/jIckPXZkj5NJp3ghdrLz3whzt6fkQIZqWuiHujqCLF4JXfVa0y42BipHfz8Qh8O/HXoTywx2zM/DRs5a9mctFNs0S3g2TGYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJlv+3RB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354FFC4CEE7;
	Fri, 17 Oct 2025 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760741406;
	bh=LR9ow0WDk7nKg118rjVF5Bu2uA14Kqebz9VEjk6ZGFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJlv+3RB4tOSA0/JVh8mq4dTGKdCNbnhiGr2lCi3sJ6z4JMsckJAscoDIaMTE5o9W
	 sudrro1mgc/w7yKxfnyfJBvZVZIBKfmT69SChu0l/rvZRg4gX9mlM0NSdiafVL0sU2
	 gCIdzPbRpgpXCo4U8BJD0rexVgQgpxoqItbP7s72hdbEwqx4C9y9/9K8ByeurWMo07
	 CgJpExXBfUBhDoGreFSZ67gahULszKOZg6xl8WKV6+egnJFRYmqpw04LXkbN5fSVhC
	 fqLsZjTJZGIWhZMbRmyaotuK77ffyox8K1O6h6O0eoj75lmNbbtGQoB1kGsOkvbPW3
	 zVhPpZpUOh8tQ==
Date: Fri, 17 Oct 2025 15:51:58 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org, 
	swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev, 
	sean@poorly.run, airlied@gmail.com, simona@ffwll.ch, alex.vinarskis@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com, 
	quic_amitsi@quicnic.com
Subject: Re: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Message-ID: <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>

On Fri, Sep 26, 2025 at 02:29:52PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 
> ---
> The Devicetree patches are dependent on following patch:
> https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/

Include that patch in your series instead of relying on the community to
resolve your dependencies, please.

Regards,
Bjorn

> 
> Mani Chandana Ballary Kuntumalla (4):
>   drm/msm/dp: Update msm_dp_controller IDs for sa8775p
>   arm64: dts: qcom: lemans: add mdss1 displayPort device nodes
>   arm64: dts: qcom: lemans-ride: Enable dispcc1
>   arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
> 
>  .../boot/dts/qcom/lemans-ride-common.dtsi     |  84 ++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 245 ++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
>  3 files changed, 331 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 

