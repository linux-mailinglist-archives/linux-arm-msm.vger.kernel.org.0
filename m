Return-Path: <linux-arm-msm+bounces-51554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB078A63C30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2B93A75CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C1916C850;
	Mon, 17 Mar 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2vUp7FR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38649167DB7;
	Mon, 17 Mar 2025 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180167; cv=none; b=Lw6KHQxCPoyMKBx2dhFsEdFb3UXMbMJvhI4P+u7Dn70UPfupxAvlZYh6plWuEM97yXLMTwdfClRmiX/J6dxQr/uP2f9h+3ucchYJQNaySFqC1LzhTIWjJW8MgVzi2gYQRvzja57eQF+fCnLjyQZUPUbNjIukhYrDrgwRK0q0SPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180167; c=relaxed/simple;
	bh=yFaYSWToPIOrq3oUyCJ+rb7qmaxSDreLelw+cCjbNrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGrGUVRB3QnWmlSNyJhsgpT/Czr30xnrB+xVc0+jfDw2+6Ik2+GMTenL5HcMXnmBeBdNPJj8eWUSLQnVXcAgK6hl+U49M3Gk7jIYq/6lxLILEcNjNghpHzX4A310+mCadt3Lw3Rcx12YSYj5VFv7gnwq3ZXv0nQqdz4z3fHxYnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2vUp7FR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC82C4CEEE;
	Mon, 17 Mar 2025 02:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180166;
	bh=yFaYSWToPIOrq3oUyCJ+rb7qmaxSDreLelw+cCjbNrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2vUp7FR8iNUvbFNnB+D5qW3wx64gbqbldcd7XvXeQu9rKyUpoy+ga8voex6sGSm/
	 oP9gioQHHdJE32BiMGw8USnQTogWDMGg4yUoWwWP+B6mtPx9EeYdQtza9yXbAx+1Eh
	 C12tiM31dh9n3t/St+7BcLsU4/pGnufthbrrBu1CT4lVI7Ptd+oVAh//jA97OMDgyZ
	 Sjp73NBn7bttiSvwGZ7gOqYy6Wis72KhXQ+lhxAF593DMq7emDHsE9wJD6H3mFq+4t
	 y+KGj5vZ+kc+c7BcbcxKqIwxWgk1tMLOyLZRqEHw83THmtLg33Qoi8aqHAe7VElFD/
	 PvFRlg2TV/NKg==
From: Bjorn Andersson <andersson@kernel.org>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	jonathan@marek.ca,
	fekz115@gmail.com,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 0/4] Add and enable the panel
Date: Sun, 16 Mar 2025 21:55:46 -0500
Message-ID: <174218015895.1913428.7302445471992593262.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU
      commit: 27b85be287f96180de2499b981eec83850df0da9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

