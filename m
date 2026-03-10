Return-Path: <linux-arm-msm+bounces-96446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ChBEXOGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE12244618
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38D7530391CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0F03B585D;
	Tue, 10 Mar 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l005Cgyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976F3AEF4C;
	Tue, 10 Mar 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110834; cv=none; b=RiCT9bu5HC71dyxBKlQ88PLSY0m2fHlYxPjxkRUlzfY3VBrlC1mNYNyXQ3BBgb4iW7cciJhO5LfnuynPo1NY90c+JyZLrPamIjLQ62UM3MynAJKJ0rq3UB+EKvJT5LwcrAFtP1OZvORLPkAL08mpfru8FkWUDqm2PObyZrgbCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110834; c=relaxed/simple;
	bh=mPyMqdybiEZKh+OY70Ny8PoIuKQ8uZ9UWLh1Gpev2JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i97gaY72kysBGv8mZ3ZxaqQXc375zTaIOl7BvHiHAUVJ2hmiO1TkOOppbWHosE+qZGKXJ2YLZN/TREVsoo76ZNXwJM2pOTd4FKq5l5A4NhKRotJFigwqYl8SvJUwSv/rQ5eZfq/Gn9cHwXXXttr+64torrM2TCxSJvL6Np61f6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l005Cgyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63548C2BCB1;
	Tue, 10 Mar 2026 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110832;
	bh=mPyMqdybiEZKh+OY70Ny8PoIuKQ8uZ9UWLh1Gpev2JY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l005Cgyol62P/C7sFFieOoDrXB2B7OA4x/gGfbI/8LKJsSvtzMy4UBBFevWIhMb1q
	 oeZtu18rEa5y6CtNrRNGIUM11ADBxaaJZSoC6Wgo80yLtJpSfbhjqis2PJttFSSybq
	 AaL75a9UTppV8QgY7qGIkXbOIAfQJKCp++AJ1MnW773Db7xS+bFw/zktmhVSZeEGGR
	 kF6f+Xq0cES6nZXIJ+YmiZTQRJkSb6ZYJvWJn5lqsSyZYCLZB/NqG4k9PcPDbz1zlM
	 YpdzPG5YccsUpBigl5I8wnUVqi0UQlVjTPhWGx91RHfN6hy+s7uPIKjK/HIl3B8ns7
	 CcLEU9gs3AG9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
Date: Mon,  9 Mar 2026 21:45:35 -0500
Message-ID: <177311073307.23763.14804834542219404834.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DBE12244618
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96446-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 20 Jan 2026 17:47:07 +0100, Krzysztof Kozlowski wrote:
> Document the IDs used by Eliza SoC IoT variant: CQ7790S (without modem)
> and CQ7790M, present for example on MTP7790 IoT and evalkit boards.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
      commit: c3d1892569afad7cdd5fbe94b4698e3b87fbde9f
[2/2] soc: qcom: socinfo: Add SoC ID for CQ7790
      commit: 2ad034b05154bb61d1296896ce11129e97e838f0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

