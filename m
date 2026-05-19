Return-Path: <linux-arm-msm+bounces-108311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Oa7NtfWC2omPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:19:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633B576C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94C3307EDB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172222D0C7E;
	Tue, 19 May 2026 03:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvUtDs3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3804DF59;
	Tue, 19 May 2026 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160618; cv=none; b=QqDb3kWkI8NTiyi+GeM/q0QLHWzv2MKcm/mEcz55fE/9FYvERWnb/EMpv4cTmMMe7qnUrvxzaYpQqV58lTxm+lcK1xP2JksjjXo95Y9ZZD1F+oWqj1zppl6Q4BdAa48YhMv2SKzyitjcvP8c4WYMwNJxXwTQ7zry3LAOTWROIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160618; c=relaxed/simple;
	bh=wgeWKHyHwPdUULwaNcHnUzhB0xsI2UInesE/Ade8vR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDO4ivb/Jska8egKshV+DXRJsIOnzKPSVmnME1KLMzFCt7PjAPUA8YH2zs0Lut7b/1SVV7CeCpEuuOF4N2MPmwGQdzyOKaQvN6Ee8gMmigvdE2La0gKN0ITEqAdOfwSLr+MCaDNvV9ddhBwQM6vBti3Zlj+YBEg4rhyqW6gGTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvUtDs3o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7E9C2BCB7;
	Tue, 19 May 2026 03:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160616;
	bh=wgeWKHyHwPdUULwaNcHnUzhB0xsI2UInesE/Ade8vR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvUtDs3o2ATIqdTXziPEcdvwsaeB6qWnLAlI/6jdhQiiv2eX5BISQTXt3iP8ZN0y3
	 MLzXN20NVKwhXZNbBN5VyszldSNaiYOU5XO8GKmbkJbqQfRq8lHJcQRJyoYsQ7kEdP
	 d7e1O1Riw7mxivJoJPNFpuZLrEGv6wORcn31OdD97WBDjXVsRTmRCi8+IJsvX8yan3
	 oNUDZ6Z9HthqjxvfLtZCqXZOF9NAb5mIxvLUDgvMh9Y68OBaMcz0HPcJtZsX0YDRRJ
	 kJXBnN/gJzV6ugwQUrJHSlg3Nu5OMzQ8qi+8gltETGWq5/xuvhvgPR8GEEd8WGdZTj
	 fLvlIdKuS0sTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
Date: Mon, 18 May 2026 22:16:47 -0500
Message-ID: <177916060479.2063946.5158452853905388333.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com>
References: <20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108311-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7633B576C89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 18 May 2026 19:22:16 +0530, Manivannan Sadhasivam wrote:
> This series fixes the race betwen qcom_ice_probe() and of_qcom_ice_get()
> but synchronizing the two APIs and properly propagating the error codes to
> clients.
> 
> Merge Strategy
> ==============
> 
> [...]

Applied, thanks!

[1/5] soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      commit: d922113ef91e6e7e8065e9070f349365341ba32e
[2/5] soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      commit: 5a4dc805a80e6fe303d6a4748cd451ea15987ffd
[3/5] soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      commit: b9ab7217dd7d567c50311afa94d6d6746cb77e04
[4/5] mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      commit: 2ccbb3fa5cf47d05849cf6722aad1b4cc14df6d9
[5/5] scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
      commit: 4ac19b36bf4108706238cbc4f300b17dba8b881e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

