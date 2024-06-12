Return-Path: <linux-arm-msm+bounces-22492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2819905A20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 19:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C27EB2342B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5911822E3;
	Wed, 12 Jun 2024 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1vrovK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AE61822DE;
	Wed, 12 Jun 2024 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214290; cv=none; b=lnm5f4d2iBgERAAC/FLoVLxSKu84d5SDSPEDFWPX8cIbY7caeEiyMa73QabtgqAJm191y7qb98OuizivvOX5i+Ow0+3qd8Pn6O+QbtzSse5pz3B3dWe2qEC1AFkgOMqJCRvv9GjOl+KE0a7x3aAnMsgfxhXK6mCXl2RPYhQN8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214290; c=relaxed/simple;
	bh=S5pPQlYqkbKDLcynx5VnNb+C8Z5Qrs/To+KuhbkFjbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUldvGIP99yZQKNQubkezmxO0NM5YRYKyNcTIukcmChTvIvYSEw02ZQvOowSgwfByxZO2Fhp2yIOQe7wc1+JbrGKHnvDTyh2fS77G0FVODHDlz2cb8RpaQVSKmPfOd3AQ009xPkjj+G7hLLt8xsbxvLHNa2Yqt+S8183ocOqows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1vrovK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4255FC116B1;
	Wed, 12 Jun 2024 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718214290;
	bh=S5pPQlYqkbKDLcynx5VnNb+C8Z5Qrs/To+KuhbkFjbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1vrovK9foKbDhjD65lGc4PoEWhjUJcoEOsVg0XkgjErc0SRNTBN/FzjoIUOEDe35
	 VM5o4m4uALf16m/ToFFp792Xr4s+axmjxMzKg/SQ431cYtsf5KfLNA7x0E1JPPgnHd
	 fhuBo9pEIgUtZpTliY+4Pztop1zb6WSy1FiKm4j7Ggoz3AbF/QPh+klWSRYh5DmF1t
	 LEBPLC53wR2iNVw2kpC/R/l4kgjsqSlAbYUp5jHQaVu0OdpuqQcLKBRflCNf80/uvm
	 3QNscn2A1Xc/+Zbc3PhaDD+9MjyAkFVUVBv9IPInViggK/SmFkb0i6/6RPZsrClhtd
	 +9O7lffYFr2jw==
Date: Wed, 12 Jun 2024 23:14:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <Zmnejlkb869mN3eS@matsya>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>

On 06-06-24, 18:07, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.

This one too

-- 
~Vinod

