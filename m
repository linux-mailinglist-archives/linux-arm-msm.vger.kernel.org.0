Return-Path: <linux-arm-msm+bounces-57601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1267AB356A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4343189532E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 10:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEEA267F61;
	Mon, 12 May 2025 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQcWt05A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117C1267B8E;
	Mon, 12 May 2025 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047336; cv=none; b=SPgu2Gv5rxTSlLhdBbY/zTi9gjWQQL86A1seDqF1Y0qMFjxS0yJA58WA5m3jjBPgs3aaXpR4uEMRXrbL3CynQPJ5QyMY8NlG0cqII1FTbi5kk5DR7lBu5ztPp+h2DNIWXk9JcYmaaz5I+oVfAqL95GC9FLU2lg7OTR9jlCb+n7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047336; c=relaxed/simple;
	bh=MGOd2Z+p+ESGQAlLsoi7LwKL0U0PKPIY60mrV4IPIQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEiCXzh1xojIAC9ipvEePTfpXEQDvHpOcNa0oWLn0OUeH/fHM59dSPitvQPC3L+lqjYxQ/nSIXSpBhFablrjDF09kJGlR+WLllxxuvMy97Uq1KMGHOSPRYNbNzHRMG8ilemaeFcz3rx6sCf+7qMBie/VsGOkyWU953LoYnGexF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQcWt05A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48C6C4CEED;
	Mon, 12 May 2025 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747047335;
	bh=MGOd2Z+p+ESGQAlLsoi7LwKL0U0PKPIY60mrV4IPIQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQcWt05Aq7N0fmStblOYhERI7+0O02J46jIb9EnFzetPA31Bd+/OrkCSVUIeEwVWS
	 6rklwsLm1IChMn4Tc6GD4njMR4fWzbRComYRaxYElueCtjHLba80cmK8BwlqVaaPOT
	 8i3FEWf/qCQIBTy3n2eKnQ8MANwgSrCICGAMHb0Zca5r+0PqXaADurjz4IreZNuMk/
	 zdk1vMejifL7DBMKUsOkmRmZuv1lRSlsxtmECOwImLrP8+H/yiGF9XMQyoACEsabo/
	 mZjg7+a9GxSpeaZhLsI7HPBolRQPxIrqVD9O577NJ+j/u9HZpePoSH/Bs7y5EeAynP
	 IsjHpiW2nRR4A==
Date: Mon, 12 May 2025 12:55:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
Message-ID: <20250512-fantastic-rapid-myna-e5ba6f@kuoka>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-1-d4da14600501@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-a623-gpu-support-v4-1-d4da14600501@quicinc.com>

On Fri, May 09, 2025 at 12:51:39PM GMT, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Update Adreno 623's dt-binding to remove smmu_clk which is not required
> for this GMU.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


