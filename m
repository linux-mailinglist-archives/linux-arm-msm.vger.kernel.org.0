Return-Path: <linux-arm-msm+bounces-31972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9CF97BFA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 19:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723CD1F219D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 17:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1A11C9861;
	Wed, 18 Sep 2024 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb/FLAzR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097921C984B;
	Wed, 18 Sep 2024 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726680556; cv=none; b=AeNGNlQA781lUK4WzNPEk3ip/C6LCF923A1Y9UOB+N5xbi6oy6VmtyXqzhign90mjU2ZnvmjUxyS4REN4/KbbnwFz1pHwfAahAdQsMVnNi4vnLDDjKaqW++3qPCjLlZQFT6mKB1WLopaoS2bRkoO6qZpuZxX0Vv//frr03CBkNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726680556; c=relaxed/simple;
	bh=5RTDuijP9fJkOz811bYIghMnhBUgzhcb2J0NWydmciU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ9IsY11vnh6/ngOnOC2Z8co3R+2NnQAoef1o+OnI9FLMWgw+np/6TCTcTMXVZ4SZ78YbeTUGJdl0C+prSeOLpzM2vIBPu/j3mTIqxUAPfp1K5O9jmyRF21vveYOwMS1xikQ7GeLZCPyW65RNqXJyOW/1ftsXwGGIZujANW3H1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb/FLAzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC2DC4CEC2;
	Wed, 18 Sep 2024 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726680555;
	bh=5RTDuijP9fJkOz811bYIghMnhBUgzhcb2J0NWydmciU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jb/FLAzRSfcTClNv/Iwql3RJDcCWp3WfcuCTPvHCCo/ToYmkGfcVMKpQOeGRKaLPE
	 /elsy90yJHtfbWmxjOAyjg7U96cUulHOiVwFgdivKyqxQbRDrPquz1p7YB9RT0d705
	 PqGxkl/+vDZfS8d8SMGrAgcCa6qF/XZ76wuShzooIOn1eQcyqAyLXegdZXO2h7kqFS
	 eUnnFsHRPu6RtPj7/fX8oajm4iY+Za/rThQ1rfULVPHP82/FsdgKW8CjxPAnmVPmsW
	 EGHR2mV2dbtj1ZPqmQ/IeiVAA3mpJ/tj8bAX+1SvzNzu7eskVNeoLM7MvTpWA7On+l
	 q5LMNMrOnxIkQ==
Date: Wed, 18 Sep 2024 12:29:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno@lists.freedesktop.org,
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gmu: Add Adreno 663 GMU
Message-ID: <172668055336.1832877.11076449182367280767.robh@kernel.org>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-2-25fea3f3d64d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-a663-gpu-support-v1-2-25fea3f3d64d@quicinc.com>


On Wed, 18 Sep 2024 02:08:42 +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Document Adreno 663 GMU in the dt-binding specification.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


