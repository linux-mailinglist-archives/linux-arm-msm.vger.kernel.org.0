Return-Path: <linux-arm-msm+bounces-64028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B6AFCA8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34B8B7A379F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E851E2DC32C;
	Tue,  8 Jul 2025 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AklCRbiJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C7F9E8;
	Tue,  8 Jul 2025 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978346; cv=none; b=gQHLlXMojDNCqQY8OIiLYXQYvaYRiqT1+0qE48b35W+huoTom6QlySDf7LqjYGXklkOz4rj5huxhOkp7g4DXlVry6wxJ4NNeMhQGnNSMzRqMC1eLs1RYp6EGzUL/EERZ56QdudlYH7oZjgPqlyXlM414QaPqq1VWHjttUnUSvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978346; c=relaxed/simple;
	bh=fKwQm9+PEYT4qO6DjCMzeRFdSKjvUdDiBPrtMKoE008=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju11aRPT9fbRA1yVcTymduUcF6d2HRtl1IXodWrFqE4R12+CDlXT7AH9ml4hiXmLeJwL1vuP16FrolXd3q4Cx77jHZ5KVLGo7hBdx6sVE8nGdB/SWzxGG0SRfUBMVKQ2MKAkTrSUnBMArcxOx9T+L0BzPZaf3HBn57y3IW9Z6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AklCRbiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D58FC4CEED;
	Tue,  8 Jul 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978346;
	bh=fKwQm9+PEYT4qO6DjCMzeRFdSKjvUdDiBPrtMKoE008=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AklCRbiJr+EFM2QaadOQIp8WvZQKti5qV8pj11XFIPAyeZ0P3NCNu0wH/WNspWOUF
	 hC8ItfhUyTH8d1iF92AkPB8Xskv2PWqiIIugkfT1Ues9un6EY5M0LfeM/SA/KKlgVE
	 dJ6orp0FY8jKCxwsUUipFLZ+G5H/C6Jq3/8iWqkEYTNjY53cNbOhWFOx6gyYHO1/p2
	 OnlD6V6pKc4w6wqajh4Tq9m8DVfasbEWDZkGfgBtjAlrYYna7X6xG7oyQPMYKN/nrW
	 60wwtfo0dugRVncsAmSfBlzSqUWhNbW0g2w+RpwyC4t5oD3gU3e5AX5La0Tuc6h/QE
	 YpRNW8zlO0VHg==
Date: Tue, 8 Jul 2025 07:39:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sean Paul <sean@poorly.run>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gpu: describe alwayson clock
Message-ID: <175197834459.378548.13310049824030256384.robh@kernel.org>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>


On Sat, 28 Jun 2025 06:02:36 +0300, Dmitry Baryshkov wrote:
> Adreno A506 and A510 have one extra clock, alwayson. Describe it in the
> schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


