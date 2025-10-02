Return-Path: <linux-arm-msm+bounces-75741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763CBB228D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31F2E424C44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742823FBB3;
	Thu,  2 Oct 2025 00:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUMBEVeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0E2F5B;
	Thu,  2 Oct 2025 00:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759365578; cv=none; b=cGGTrKYwb+ckOqwNpQSNUrK6vGfUY2c0skm0QrFtopvObq9bsJTAlI3mVGv34rs/zBEYvF837aztJcInSWc/mXfv7sM4C4QLaQvLbQM4TUSbC042CET1d0hTBO7LIKoRnRrQF7khon/pVEs635LMXcIbaWWE9LbKctsNUY+Nxp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759365578; c=relaxed/simple;
	bh=1jhKyiATGzlkU5SEzO+NQzrfJF62mRafN2PZ9bgM9yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx2bw9mpceaVJP8H0W+zo6B5TUuXHxUgspbapQygcyIM3XYRhuDf4KT+osaDv7sFEnkAnLyZEvYqSIBP9DAkRGkJMstLIp7M5dSLi8UknRvA/i3U/+lPbZpKHEvftO+4mLDGncFvjSefMZYeRRpcKIdHouHKU+mpQstdyUpaX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUMBEVeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E19BC4CEF1;
	Thu,  2 Oct 2025 00:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759365577;
	bh=1jhKyiATGzlkU5SEzO+NQzrfJF62mRafN2PZ9bgM9yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUMBEVeWoEOfJgPCVJicP+lIxSvIgBZgnKYuA3fKqdU2Ry4DUmxmNI+seg4FyhsEi
	 K3I+PQ7MqtyNALjmq1MRhVAdeC5zvMgv1Kw7vUdM0IH6v0Rd1M7UEFptINJSaWs5mB
	 XG5zuYBdspOeQoGYWKwyObtCc40rs/tQt3/xb63Ucep3O+EzeWcf9nvLAu4+GnNoPd
	 Pv6W6WF48WIvc748BwFKdfFWBdORyzdyPJ4QIphyfma49WP/DFJcyw6hK55NNIF893
	 28esdKJzZII3u7LnhHP4g5xN7ocRXDn24g1PofIWdL9t7d346lkRmVRtLoO5daV/AB
	 rO7fiOUtmXKkw==
Date: Wed, 1 Oct 2025 19:39:36 -0500
From: Rob Herring <robh@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
	konradybcio@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: qcom-ipcc: Document the Glymur
 IPCC
Message-ID: <20251002003936.GB2672888-robh@kernel.org>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924183726.509202-2-sibi.sankar@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 12:07:22AM +0530, Sibi Sankar wrote:
> Document the Inter-Processor Communication Controller on the Glymur SoCs.

That's obvious. Say something useful here like how the h/w compares to 
existing documented h/w. Like perhaps the change from virtual ids to 
physical ids, whatever that means...

> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index e5c423130db6..129870185884 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,glymur-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
> -- 
> 2.34.1
> 

