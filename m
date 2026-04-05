Return-Path: <linux-arm-msm+bounces-101878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL5jBuS60mm8aAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1139F864
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DC7301AD1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD83B358378;
	Sun,  5 Apr 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rF0dD1rS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6813563FB;
	Sun,  5 Apr 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418035; cv=none; b=o93VqegVftuqcvG6s/RIPq/wFaR3T9CVfgjMVFcl5REELRbw4mTcdOQ5j1SOzZwr8NhdVDPzg6HMb9ldes0QnwNYqn/WyY4MuNDHwJQA5IdV/E/u5R9YhoDIGeuUG5WlkIo/PqUUXpgtS/apuO0CYxRilZDMX4tWjKwPuvsM9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418035; c=relaxed/simple;
	bh=bcdQYL7EhIubI8NIAgWhB6Nh2elJGgYkYt6pP5PNL98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDm/exqZZ5oDaNpeo7/CVAla0mb8O3//Lx8XtuAWH/2cFtRSm3fACyeC7uAxpdbH9CtjapMeCmaKLvLjhxquaFKNLyDNMQcQH4gYh/PWK3Dx9kfXHhvfmRruO/MxK8BQIaFMxQhsnPxw8hQ5+WywTflPVzSU2pa/wfQS5vFCNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rF0dD1rS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C77C2BCB2;
	Sun,  5 Apr 2026 19:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418035;
	bh=bcdQYL7EhIubI8NIAgWhB6Nh2elJGgYkYt6pP5PNL98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rF0dD1rSP88l0Jz43uWE8BQE5UP+D+g6ojP+WNEN7jnSIffvpCLEuKZQ+7SBQx6tE
	 NlZqAE94CvD2NwcVwOWaAByzywhz+hcgUmUpFX8yBCaTDipPePNXtj/acjxnorlhse
	 j5S/Nx1Hx7qnvI7dsmAw2sCyIQ/IzFbcri6wcrwF1Ht38PhnauyqyRLJEJ9AjKOKKV
	 jp3Ji2lnxWofCTM0pSR6CJsnLHcOCFnnhiWzom8wilua79cA5Rm1tMwma4+vmtjaEu
	 GQthC34LAMA+Q9TDX5Bs6nvd0rzSlJfVTHyjkgVJN5xM+lZ/S/UOXhYD7OseIeDK1J
	 zTT8eIF3pXZag==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v8 0/4] Support for Adreno 612 GPU - Respin
Date: Sun,  5 Apr 2026 14:40:15 -0500
Message-ID: <177541802143.2061229.3144892197628318346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
References: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101878-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6E1139F864
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 04:39:52 +0530, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
> 
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: talos: add the GPU SMMU node
      commit: 1d5c82f19b8a079767622191fa7478028a6ce79f
[2/4] arm64: dts: qcom: talos: Add gpu and rgmu nodes
      commit: 8de397a5618aaea810e447946a1f1d19c610fdc2
[3/4] arm64: dts: qcom: talos: Add GPU cooling
      commit: a74c7b347d7e1094bf16e5053889c9ba4d9a3ac5
[4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
      commit: ed5ee207bc075d774ecc837acc90d02548cd5061

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

