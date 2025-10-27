Return-Path: <linux-arm-msm+bounces-78973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC9C0EF7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875F73B631D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D34430B522;
	Mon, 27 Oct 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHBMk16k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2930ACF7;
	Mon, 27 Oct 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578696; cv=none; b=g/JwBfjneAvWvmIdBVJajqA04k8ekDvx8BVpgRnfUzKDP5gO1g2/JOScqUEtuOI/4SeCWSoTUA0eqUonemq8Ih7TsvXtgROEoJ6LujCF7iNzGDp7Z0xizEdRNzq5vnN4mcZuUKVcuSegWEpmrQjPOW33NjDYQHcitoKvLtuOmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578696; c=relaxed/simple;
	bh=ZcoLJ6TJAgvXRbfGaSt4YhXygDgWPuEl37Ke2g9Va1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fftfAI3zgnCy85WAjcmYfyu/PxHnVBzTaE3dA0+U1hN2LX1BvBwUwLV4J1iOsc1vA65Mylq6V5VAKsludxjW/ewW1UT7G61CKfhhZx4vZt8ohCubG5muGwFakcA+gOR4MoCfee4II6OXCR7YZtQU/9tg7xpAzmBG+Lg/wcbOx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHBMk16k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9365FC4CEFF;
	Mon, 27 Oct 2025 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761578694;
	bh=ZcoLJ6TJAgvXRbfGaSt4YhXygDgWPuEl37Ke2g9Va1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHBMk16kXDN4oH/tBN0mpwDoKdnLax9A+QdbDSgl1Uf2EznHKuxSam6OuXZn4k3a8
	 +gbTEqY3pDq7y7QEgznaQaN2gC8+bjHqoDGWGYPXD+UU+ylRayVkCqYmcCAX541Vxf
	 nb52lxIe5gD5lS+9Re96lI47t7XgAcusJLPzYuYTKBD6C7nZUfg6KGSKDJAuN/1CL+
	 SIdS0QaNnMSdh2R49bB3pZfW0FB/INc9pmj0VSGR8yH8B3EQnonrSU6m8Y4SJsZJx2
	 qDO8Sokx6f0qmhRFuCb4OwYrKsyl/vQKe2zX3gQ0wtbeNAnacT9OuIA//KjLN64hum
	 tN3ZKGKyH+KMQ==
Date: Mon, 27 Oct 2025 10:24:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	fange.zhang@oss.qualcomm.com, Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	li.liu@oss.qualcomm.com, Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
Message-ID: <176157868965.914095.10117971877869992005.robh@kernel.org>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>


On Fri, 24 Oct 2025 13:21:02 +0800, Xiangxu Yin wrote:
> - Adjusted indentation and added missing blank lines in the example.
> - Corrected OPP clock values to match actual DTS configuration.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


