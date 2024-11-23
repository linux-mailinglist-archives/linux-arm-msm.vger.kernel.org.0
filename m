Return-Path: <linux-arm-msm+bounces-38920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9F9D69F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50723B21893
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829A8126BF1;
	Sat, 23 Nov 2024 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCgDdIaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAE225D7;
	Sat, 23 Nov 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732378473; cv=none; b=ChyOhhxlDlzTO1q0YuD7cm20ldELPG2dM34VE7hsuzjtBPgT/H+CqyeGZKCQjlOxJWvDgjb2btPgdZhMHGnaBiu6S/9gyvLwDZm5WVtfLwA+FqJthcfe+5hBcY3pINrEgEBzLxUqmor3iAqbHfkPGjFpnIwIrC1/EKWLtn2E3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732378473; c=relaxed/simple;
	bh=E02GaD6C2zW4KVX9ewnciYeUTWpwJEUwwnHlZ+OyWAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx7GLz9gJ0/m5CHMP2KlBfkvgd0rIhp3WtVUQ5O0V8Ojb2qx1Ow7L1YrJjTXUgzMq99uX33gnnKxTO5WXFMpbOrjtVZT5FdjRsVfv82qOyWn3vchukELjXQ6lPaecFyQ+w1+hTcPVhcn/EXJ5x7gRfs934KHqAr4ym3OufSeSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCgDdIaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9FDC4CECD;
	Sat, 23 Nov 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378472;
	bh=E02GaD6C2zW4KVX9ewnciYeUTWpwJEUwwnHlZ+OyWAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCgDdIaHZ/hdTwWsN6WgLvT5q0urJF4+Z5E/Sa8AebGnhIzjcjzdtMv6lQT0jgxWH
	 9Q7kcXz2wXkEUfRPjU/pr/3HijAkVNFBs3IbCVREQlCA0kzZTm2OMGUqMa9nrIvTCG
	 hI3w87j2uxmb/Ma4j2q79eV7AM1WYYzS09T+EEyci8RdtdOa9nExvQx4FwY5XA6eUw
	 8uN9zRfIfcMu21Qbz5sBoLo0PgV+eFT0i4FhwAO1Pcyp/og3VKhJ2EegX/qVntPKbt
	 yRoU4YqT7JkZL15r1sGVOapWJckzUEXe7c7UeTIlWOGJl3ol2qXdLF4+CY4EOYaRoM
	 t31g5QM/vq8sA==
Date: Sat, 23 Nov 2024 17:14:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/9] Add display support for QCS615 platform
Message-ID: <2ihy463xjiguluacmd3qhlskjtrpotk4mmflqdtgm3qhjzcrif@x2ckw5h6xqyj>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:43PM +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615     
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> This patch series depends on below patch series:
> - rpmhcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/
> - gcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - Apps SMMU
> https://lore.kernel.org/all/20241105032107.9552-4-quic_qqzhou@quicinc.com/
> - I2C
> https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
> - dispcc
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> - dispcc dts
> https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/

Which makes it unmergeable and untestable. I suggest decouple
dependencies.

Best regards,
Krzysztof


