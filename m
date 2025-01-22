Return-Path: <linux-arm-msm+bounces-45844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B6A196F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA34D3AC09F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AF421516D;
	Wed, 22 Jan 2025 16:55:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D744C9F;
	Wed, 22 Jan 2025 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564903; cv=none; b=LwV8WoJ0XTjwrhRrD0r/LHqO+JP6Q2p6p/9gMN+kgkQlnzuegi7YZZ+a7j1dewhKjR/Q3H9pP1doeInjijfKUVnJLG7b8G1xcdkE0wE4uopdB+vEIz4c/9tfGuvPzFACiwEVT7fMzNhuhmW7l40jCDcyZAHz8QicK9n0VS7rtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564903; c=relaxed/simple;
	bh=xcdIuHa4dHK+xTDIe5vJcOZNElnrAsEKIxNFNEDhqwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LE1jSnxCr53Wa6HGoAa5WDZ2b2Dh2h87XLIGw83GOINfncZp0iAI1NrXKEO2499DzUuaPmqVxYXXzl6XjIuxgUJvl6uhlRvDpQjYuzeVZpvFZQaljeWHbdkEUGYMG7l7Rxc2V7dc/LlI4uXsVDyAkTh7Y6vZdvxqsXjB0cJ9AEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C4CAA40ADD;
	Wed, 22 Jan 2025 17:54:57 +0100 (CET)
Date: Wed, 22 Jan 2025 17:54:56 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <6g3dfqm274ykypbyz4sckyisg2t67ch7mvh2h6lbkt2lv5unaf@5jcffdimidmw>
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
 <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>

On 2025-01-21 16:58:24, Luca Weiss wrote:
> Hi Marijn,
> 
> On Tue Jan 21, 2025 at 12:06 AM CET, Marijn Suijten wrote:
> > Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> > DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> > (2 LM and 2 DSC for a single interface) make it impossible to use
> > Display Stream Compression panels with mainline, which is exactly what's
> > installed on the FairPhone 5.
> 
> Nitpick, if you send another revision: s/FairPhone/Fairphone/
> 
> >
> > By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> > 1` when the catalog only contains one entry, we can trivially support
> > this phone and unblock further panel enablement on mainline.  A few
> > more supporting changes in this patch ensure hardcoded constants of 2
> > DSC encoders are replaced to count or read back the actual number of
> > DSC hardware blocks that are enabled for the given virtual encoder.
> > Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> This unblocks panel enablement on upstream without any hacks on top.
> Many thanks!
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Thanks!  I fixed the Fairphone capitalization typo but forgot to roll up
your t-b (something about this being a long time ago and forgetting to run b4
trailers -u), but then the patch changed a little bit.

- Marijn

