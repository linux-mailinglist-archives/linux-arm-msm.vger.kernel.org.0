Return-Path: <linux-arm-msm+bounces-116082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N0BPDDOcRmpnaAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:13:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D339E6FB231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MgTWl5Lq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20E3A301876E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2767330499A;
	Thu,  2 Jul 2026 17:03:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6791FA859;
	Thu,  2 Jul 2026 17:03:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011785; cv=none; b=UsUiFxws5yAZsJeEaXVmfvPDhVoH0mrLvCLMMb0WcQ3o18Eno9ZMDL3pus1vJbHZCGE/o0U6svLrS2tVZCsk1v6olm3rfJmfKACZ3NqowYZWMCNXFo1z4vxUqaDBg4fhLGmKa/dAyjGESHG/H7YeD/vJ6ZQjTUiAyTxY5xeBBOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011785; c=relaxed/simple;
	bh=0fRUAxIql9zJX0CTkn57utoSsaY5R675bkJwbK4FEaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4wxa5vuRNzZZ5OrKBfpXAKBY79Tu66JP3SG00U4pQscdWA+nxssTcwOJDEeGkLECYxUXs8FIuflDOHfm80I9SwmPbm+cdgl6LYWyUVAuQmQprM+2oBnpafR66wPY9h0OoGCtFFxgOsdJFkuKTkq0G7xtV7MzO/VdsWX1HRUA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgTWl5Lq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559631F000E9;
	Thu,  2 Jul 2026 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011784;
	bh=EWlmN7C0EdV9vLSXkkywb4aSBBVQ/UqBNA3ZsS8+NQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MgTWl5LqT+S7cugSoiTDDf5C4djgxaA/IqsZjTCMmEafFz4d9/hFGFj/81TRKf6/K
	 Lz+vQ7QUUrvFWcvMxDrCH/x294pkpAXi8vzaKhv1vxDPYIKuINTdHvxTghOdYhr9a2
	 RMV/DRL/J4KrN1/+AIjmPy4YXxp9Rk+nEkDbPPBhzeQzpiSiFDINWLs/j2Joo2y67O
	 yynKeoPLZkKRLjO4MwczJ0MUOPj9etOR2K2m1sux4vO+PcWJrmbORNG0E5/HkeKXbI
	 A06su1RQ0nMQdaIeCLMrUCS1+oSYxxieXBQgi7ev503m5RKSWE4V8FaBswtbytF+WR
	 IIAueyW5K9+SA==
From: Vinod Koul <vkoul@kernel.org>
To: andersson@kernel.org, konradybcio@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com, 
 quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 0/3] Enable ADSP and CDSP for Glymur SoC
Message-Id: <178301177996.772155.14771946366579248445.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 22:32:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-116082-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D339E6FB231


On Wed, 01 Jul 2026 17:31:12 +0100, Srinivas Kandagatla wrote:
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

[1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
      commit: b496bb56b418788aa8625950e94206abe7282e18

Best regards,
-- 
~Vinod



