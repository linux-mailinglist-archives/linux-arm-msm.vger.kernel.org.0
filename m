Return-Path: <linux-arm-msm+bounces-65590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E0B09CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380AF1C45AB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 07:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2E621D5B2;
	Fri, 18 Jul 2025 07:32:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63350213E74;
	Fri, 18 Jul 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752823933; cv=none; b=PWtloXzIRVIMy87PO8d3cKajPMZfCQPFvFhS+Sob1NELVZCJJK+7oHd5Dh9o0sQYJbz7LdSDJbtuZMri+CBeLoqriR0E8EGjiNHuuIqJ4ute3p/SZDuFzuQPCImjy9tANGGkJqqMtKGjXx2jtupxC1D+fsfY1HIcWUzuQxMh+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752823933; c=relaxed/simple;
	bh=FkuAVdJoW5Ey7KhzzzKR13G0A0j7aei4kTkkaY5365w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANSF5RgUKhJIWwuLJuKEV3a3g0GQHz38YQc9vL0NxdV2BIf1Jih1Dvt76Zid267MzTfCKdwwk2QK4OjBBk78xrTD0Mkm98tcWnqzJnyuadhKJe7bkS+kNwwSjryIOKG2PF3wue+TcEBopzXPd49YHdo5n+HDAvC9VczCaMWNuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CF5C4CEED;
	Fri, 18 Jul 2025 07:32:12 +0000 (UTC)
Date: Fri, 18 Jul 2025 09:32:10 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mahadevan <quic_mahap@quicinc.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov <danila@jiaxyga.com>, 
	cros-qcom-dts-watchers@chromium.org, Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <20250718-finicky-orangutan-of-piety-fcfd6a@kuoka>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>

On Thu, Jul 17, 2025 at 04:28:45PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Current documentation of assigned-clock-parents for dp controller does not
> describe its functionality correctly making it harder to extend it for

It does...

> adding multiple streams.

Just extend the list?

> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> and assigned-clocks along with the usages in the chipset specific MDSS
> yaml files.

It should not be added here at all, but since Qualcomm added it, it is
an ABI, so explain why this cannot be fixed or impact of this ABI
change. It is fine to drop it in general, but reasoning in first
paragraph feels incomplete. I don't see any problem in how it describes
the functionality (except that it should not be there...)


Best regards,
Krzysztof


