Return-Path: <linux-arm-msm+bounces-64029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D6AFCA94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D1B16A7F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0D82DC32C;
	Tue,  8 Jul 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8/viqs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099418A6C4;
	Tue,  8 Jul 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978413; cv=none; b=ORhYNrLj+H5TQIwYtkHGvhzGnSbMOmhc10k4CihMgDakH9pXjmYiOCR+RmVnM2VYdMSVOI7YAs5qW++MklWZ7EzCcW7RdCa8gmJxSEWVOfDsgllYKG0QoMLmk/f1hqH2vEoSh92CS1mcZPoJ5mSdG/7R7tWIL+KcoWUPCD0LZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978413; c=relaxed/simple;
	bh=AtLFdAeVACJNl2ke3aWgXmohwufWhuQO0Od69sJQtwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da0yVd7rEeaU6go4QBjhY3geKXOZdirLGvgVTNhfI4YY2EAwN6NNaq6hvgQx1FoigMwMI2OjciXFhLFoYZ062yWuXsGmRTj4Kf+u3IQCfsiclDBItSVE5viKNDGBwNfbNV+wsbhNcitbJUKR76Nn4YtSWVpbMqi9VvuoVpUDJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8/viqs2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F9C4CEED;
	Tue,  8 Jul 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978413;
	bh=AtLFdAeVACJNl2ke3aWgXmohwufWhuQO0Od69sJQtwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8/viqs2t+fnwxNyMUVBOrwddW9CBf3GI5noe8EWgn7uaX5Mr+SmmZYterIA4MZQa
	 UY3K8lizVuaAdp9eF5665g9mZKHovDY8n18LhDurLifW5GAwneXFgIscrN61hh7Zr1
	 tX9T2q6uF5d1RYl4+IAyLs1ihbDafUL7kemVXzGYHtvztkQ9ZW6LnphjsihVYfsWjh
	 rNE6WdOIJSROEcTP2vszbrZWZtqj9hOT+xTCVMNz1j+n6e02mWHAWiOryWlRNTvUpF
	 DA5a8YNX7dJSGFZ1vdz9ydOas7aH40Xbj/3OpBTlmP08OP45ZsmAQk2to9PfzSQXeP
	 V08ikd/+3nO8g==
Date: Tue, 8 Jul 2025 07:40:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] dt-bindings: display/msm/gpu: describe clocks for
 each Adreno GPU type
Message-ID: <175197841127.384639.1538751354808329630.robh@kernel.org>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>


On Sat, 28 Jun 2025 06:02:37 +0300, Dmitry Baryshkov wrote:
> Rather than having a single list with all possible clocks for A3xx-A5xx
> define individual Adreno GPU types and corresponding clock lists.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 220 ++++++++++++++++++---
>  1 file changed, 194 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


