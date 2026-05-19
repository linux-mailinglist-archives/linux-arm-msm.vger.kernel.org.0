Return-Path: <linux-arm-msm+bounces-108560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH5mKviLDGr0iwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B975820EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B563310D4CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355132E974D;
	Tue, 19 May 2026 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr1/KBlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A52E040E;
	Tue, 19 May 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206654; cv=none; b=d6F91s2D34hsHcU3PvpSdNuwO+RB3i1VtE6QPwCeCwByFhTtVGxbsBIBJ4ABacwL8bMdyFbE5USBu5AoHPZueY3Bz+t6KBTtG/PXUaDfHhoPXXGm3e9ziEcH9/X2T/O40GD7GSIn13mzB9L9GxwAcbdDQkQrf1vNEsxE4wqSBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206654; c=relaxed/simple;
	bh=ESxNT0QNiRL0PPOO61nmNN7xTNyJHHAm0tK5nlkrSdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gSCZrS1UQJgK+S7uKEYRui+3I1hn47oyZ7SzAR1Rw3u1qjDGqyw9PmhYWHIb6Up6H8GH0tQ3E/QZEQrVeQ4f3YUwiGycBuufj1r+U43AL1cnR7SQ8eHXcYr+rBySu99w4UKmipvSnHNApUbu74KynksbKL/grRJbmsX1dA2Pix4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr1/KBlm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3C6C2BCC6;
	Tue, 19 May 2026 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206653;
	bh=ESxNT0QNiRL0PPOO61nmNN7xTNyJHHAm0tK5nlkrSdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gr1/KBlm2AihnXMxWmqJrx+ZdXpck1sa0lBCICgT5EKNxxTwR14PR3vTcs18OYJmj
	 JhdoiBY5PFRAAyq8LJL2PPc+HKQZTCTB2MC+b+LxMUR6FvIa0nE5E1h3CPl9bMcFZy
	 B1DMLTalmzfUY5EaPW2SvwPM3ouE/vQX3CONmhS32Uoh3PW/xHMNONJ+eriunkDea3
	 Z3YnBCO8bWaaqFBH69cJ5famwMeveF2BCvBDQJGsGcOBzQVIvWvEmW4Si/gmvUPOwM
	 dxoGGjfqWM9SY37JzcZm8rAq/SYEsWUmDs8gR+aL44LMlzr4zOVsvvlJv0eUtpekG/
	 FzRrUOglD0zAw==
From: Srinivas Kandagatla <srini@kernel.org>
To: robh@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Subject: Re: (subset) [PATCH V6 0/5] Enable ADSP and CDSP for Glymur SoC
Message-Id: <177920665154.52067.7621121229285353762.b4-ty@kernel.org>
Date: Tue, 19 May 2026 17:04:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108560-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 48B975820EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 09:23:33 +0530, Sibi Sankar wrote:
> From: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
> that the firmware streams of the remote processors are managed in kernel
> and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
> Qualcomm SoCs now support running Linux Host at EL2 [1], this series
> documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
> fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
> hence the iommus properties are left optional.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
      commit: a24bbef55c3d9a515b05cd168b80115673576104

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


