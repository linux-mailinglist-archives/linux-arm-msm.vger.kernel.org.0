Return-Path: <linux-arm-msm+bounces-584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10967EA035
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 16:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69EC2280DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA0D219F2;
	Mon, 13 Nov 2023 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsvJlJdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E5219F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 15:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819ABC433C8;
	Mon, 13 Nov 2023 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699889988;
	bh=QpKKoeuWC0pCYvMri4WMZVGR1FislkCUUfjedW52+8g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LsvJlJdUzEM6WzOqNWI4Zo+T3V6Tn0+dD9l/eeJd/4eQbO/JHIIWnzcEqQzFMEYJh
	 drgYzsaZwX2afmMpKIuJYwVswtSUikRDGIYv3jU+oxZmMOmLxDWeYBL9avIPBFY6xW
	 LHabIpBI3PF+GmXYDRJSmBqgI+a3uN3ovxkRjia32a1AzobJtH3t85XmdEEX7SpLRI
	 F4PEl1ZBU/h+p08gpeSVvaveQAdWUaxjNH3F5I52O8G1pD7N7LCv+kx/lKfsltOzk6
	 16yYx5wLsblR4BDgsSF8g2jqovG2bhRL0mnmNcG+zGs12ekN+rsDEIDBommPcK8Hyy
	 b9YTndGFwoC4w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169988998449.3390604.914976926360003239.kvalo@kernel.org>
Date: Mon, 13 Nov 2023 15:39:46 +0000 (UTC)

Luca Weiss <luca.weiss@fairphone.com> wrote:

> If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> property is defined in the devicetree), it's a valid state that the
> remoteproc module hasn't probed yet so we should defer probing instead
> of just failing to probe.
> 
> This resolves a race condition when the ath11k driver probes and fails
> before the wpss remoteproc driver has probed, like the following:
> 
>   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
>   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
>   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
>        ...
>   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
>   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
>   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
> 
> So, defer the probe if we hit that so we can retry later once the wpss
> remoteproc is available.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2a3ec40b98b4 wifi: ath11k: Defer on rproc_get failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


