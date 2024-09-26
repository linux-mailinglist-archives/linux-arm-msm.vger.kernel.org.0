Return-Path: <linux-arm-msm+bounces-32570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3D9873B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0131C22F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EF31114;
	Thu, 26 Sep 2024 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfZfmJ6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0EF510;
	Thu, 26 Sep 2024 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354399; cv=none; b=p6n3dPeq5F2H85XlP/p0tp9rK1M41sDxLvPZ3keXmjyvGqQOBNIcXm5XkhZToH5VKy1RagDly5yJDffXaEdmA1/4yaEwZrSYnidQq6E4sZI4+lfuQcwjGKpnTj2pRO1KDt/HCW9EWUmkPhjb6tjeL6JFyaxz0GUrLFPJEGvF6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354399; c=relaxed/simple;
	bh=X6di7L1Vl/r4MqrcmOwroFyWwMv/8RSXL4kKCm4I0Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c63o4UhmWxvKUMSUYQdPrbdbqkHdq4RS5IkajZl9MGhzz2P20/Hxpb5hUpyI/H8IjT9gfOobf1k3sV+uss+IthjXJkPvSI/93XKf5LEz4D6a94MRB7Kt56/rwqFur+Ve7jQfT/E+StzD8R2ZKXvzgdiEJUv29yWbMlnizFKJ8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfZfmJ6V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D05AC4CEC5;
	Thu, 26 Sep 2024 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727354398;
	bh=X6di7L1Vl/r4MqrcmOwroFyWwMv/8RSXL4kKCm4I0Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfZfmJ6VqztDgJbud3JS2fzpq6KH5KeBQkGd2j+5IpGu0weS6uAl615rS+tX7z33G
	 CXA3F2rsMHblUQ6Vt2aCl+yYu/frnvoSLSCjTuA+XRxMUsx/UB6bUfrFox9OTiCfL1
	 2bDsCHoV8bzF3KX2hoOnM5722jhhxUALEgJ5KhQ5UOLmZP1kRtQ9Z1Ovbq3x6xkjsi
	 k5/f7SaSU/EfTm2pqVlo/qoAK1ysZWfKJmY/3Rz3CZqEdC5I7qUXsK6L113nF6KGfr
	 Oo4A6l503uL4uV1bbDl85CppdrfzhMmzXw+ZsCNfZz+ZoXRQ3wIVlEZ07VAFokjHTB
	 UmMe4bt4kYo9Q==
Date: Thu, 26 Sep 2024 14:39:54 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org, 
	danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org, 
	mailingradian@gmail.com, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
	quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Message-ID: <tabzs5jvy54rbwgjjmzodkpwm4emt2oevxjc2kto7znij2i23y@5wn45pstnmiy>
References: <20240926110308.2201577-1-quic_mahap@quicinc.com>
 <46cd6c25-0a82-46c6-9382-167a44a689ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cd6c25-0a82-46c6-9382-167a44a689ba@quicinc.com>

On Thu, Sep 26, 2024 at 04:55:02PM GMT, Mahadevan P wrote:
> Sorry, Please ignore this thread/coverletter
> 

go/upstream and adopt b4, please.

