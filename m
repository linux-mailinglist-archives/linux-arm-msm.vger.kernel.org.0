Return-Path: <linux-arm-msm+bounces-87009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77357CEA68F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 19:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 786E23016EC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C4026E719;
	Tue, 30 Dec 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzcKXYS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA45221F1F;
	Tue, 30 Dec 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118046; cv=none; b=MgVS09B3XLnh/yxrXfEleWHV+ovsC9CkDxWUpTs0EwWomWOBtqWwTeHgdDfplZbgB52n6Qg7ooOtdy18D1ue2DOBRQdDMx/QG4qbFLAE823WfSAs40HjAVvNX9xyijNwTFwodqp+M1GVGTpvfAjCNTdOC9Jnq5qgs7T5w8mjUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118046; c=relaxed/simple;
	bh=NCDy490TpQXg1SrXADbkgQVLfIf/ieUySJmjn0ZF6lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7QI85m4J/g+tsYIUVRv9jOquu+teskcgQZSZC5diV4dmQwwtPHUiN0RESnZoAUiNn5BWdQgTwvID4QlLJomNL+RF4LBRgEIi8vl+5sCkMOnJy+b2pxYKf+Rtc0XM7qgdSQ5p98N2xR6+tQFqFJmAGDHwEDhnF3UOUk+nU3OPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzcKXYS1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C30C4CEFB;
	Tue, 30 Dec 2025 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767118046;
	bh=NCDy490TpQXg1SrXADbkgQVLfIf/ieUySJmjn0ZF6lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzcKXYS10iC4Ff5p/up8rjk5DFhb9i3cwtFSMaa5w/be6KP3a6+KOBxEWBjjEzH1G
	 TkivbkkzgXGtTOTdGrwuS7aKOQu3dD4WRdHBtS/x8+zrwybFiPKSTS/O7yu15aabmD
	 lY7dZUZ05RaZnCX0qDX26k+JysVlZwZTQn5H7eK1/PIDIOlC1fPAYURYyM4CAicZFU
	 6KJexlrruk4F/X/PtW7JZU+zEkiRb4J6dwyM8iPi1qgfj/KmUiMxf1n9t2qCdGKjZv
	 ueSpddCI8ySqvyHfEx+UO54eg85HSbTWYQRypyetjYNLJ4nly6Jn47EMqx44kAsFcQ
	 ICBfBSbVmsvGA==
Date: Tue, 30 Dec 2025 12:07:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RFT 1/3] dt-bindings: display/msm/gpu: Straighten out
 reg-names on A619L/610/702
Message-ID: <176711804473.885549.6357046736592597919.robh@kernel.org>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-1-4a24d196389c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-1-4a24d196389c@oss.qualcomm.com>


On Mon, 29 Dec 2025 21:47:39 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These GPUs have physically have the same regions as the base case
> ("main" + "cx_mem" + "cx_dbgc"). Remove the specific override.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


