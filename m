Return-Path: <linux-arm-msm+bounces-41680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E69EE181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3C51663ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0A820DD6B;
	Thu, 12 Dec 2024 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1549Ovb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163920DD62;
	Thu, 12 Dec 2024 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733992885; cv=none; b=LqcWCaGQ4qeaJLWLwbQpunKK146m40unT/87xyT0oKLSofzDm5HzFlOC+Yff4wQQzAXjZX+ld2vpQEgsseNpKstTQlFpdEZFiUZFhWvm5tYsQOK7WdPAoj3WZu/YkKWwr+lowzZn/WFroDtaE8Mok7cDs7wN2foMWyqN7GbuOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733992885; c=relaxed/simple;
	bh=V9ZgLYGS9V5D6sBRuPJglgqlae/xhudICyCZ7OL/n2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5FMsSbfZd418A/q/Q6ru6hdYqbp7xbpnG/v5dNKFWQRVzd7iL/ic82pw3PvKw0o4wyuUpm/rQS0yMVBV1wVZ2XuuTO4NX2XZtBKSJXksjWGcRTAEuHxKDjFIq8tkzK7m4EsgbebVQL9GkhcagBsMU3EfodcogVpQiaq/RhBvT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1549Ovb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A90C4CECE;
	Thu, 12 Dec 2024 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733992885;
	bh=V9ZgLYGS9V5D6sBRuPJglgqlae/xhudICyCZ7OL/n2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1549Ovbr5zL06yJKspZfmXMo8dUwEMV8eT3j8RWWpS608U5NPB76hbmWFa1Y06M7
	 T2sMOwViHk6hKi5SIZN258drWGkyeHHAUEzeRBA8K/pwwcEXKSmqQ+pd7z34FJE6NX
	 Nqe0kOzdi45/n4a41fz9y9QECic4KnIzaHYVmdHbt2GGryPin7eCGUlQyDptlJNN/Y
	 XxNBuunkR5hgYcUkzWEo5xfLdsk5xS1G7FU10x1eIjcB5k5v5uy0QD+bpZ5znv2YPU
	 HQREUJPPOzLwS1qO2HCk25kr81GKC65lL8PjMWo5DEFbIRkdD64qW8v6TebmUAKGKC
	 XpEorO1fIO/tQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLelD-000000006Rn-36L4;
	Thu, 12 Dec 2024 09:41:28 +0100
Date: Thu, 12 Dec 2024 09:41:27 +0100
From: Johan Hovold <johan@kernel.org>
To: neil.armstrong@linaro.org
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z1qht5W66I1-3RLL@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <0d0a8157-32a4-4e8e-92cd-dac9a4471641@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0a8157-32a4-4e8e-92cd-dac9a4471641@linaro.org>

On Thu, Dec 12, 2024 at 09:31:09AM +0100, neil.armstrong@linaro.org wrote:
> On 11/12/2024 15:42, Johan Hovold wrote:

> >> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > 
> > This appears to be what the driver currently uses, but why not
> > EXPORT_SYMBOL_GPL?
> 
> drivers/gpu/drm/display/drm_dp_helper.c is not GPL licenced, so
> this is the right macro to use.

Wow. I should have checked the header. Thanks for explaining.

Johan

