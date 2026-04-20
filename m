Return-Path: <linux-arm-msm+bounces-103768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJguNL835mkmtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:27:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C142D0E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9E0B34C4B87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6771D3E3C63;
	Mon, 20 Apr 2026 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2H1bGw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C43BA24E;
	Mon, 20 Apr 2026 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691482; cv=none; b=cQ8Z6WqUM1JsOAI3gJVvGMqiZsNnSfyfQSEu3oPS+5U6mLZ3b5+rk89iwOKRgadVYdU/APHRJrH41QJQ6/FxPRhFSMAw0rWHqqvBdZcTEyqgD9C61asEprISA85DEJmjjRcjJtcWAJjnmLnU6gJhqsY0Qbz1I2zDlJtTvsiN7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691482; c=relaxed/simple;
	bh=b2N3n3pXJf/7gTblbl17X9f/3O1FJA1n/NyhJMsGXck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amgCoZxy4bXG3r3K0j1JlKCHgHw0hts1aCt5XYGKyPWM3mk3yBRtA+PhHrSm4FhNtcHTkNhKvoCzDb5wojg5CoMq1KHD5/7D7DtHphn0EqCzZsZpLHiPpuha5QoByxu8ymzUtINKce8uJNxvsuVe2ovf4Mrf/xUCTAXmzHgdJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2H1bGw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21FCC2BCB7;
	Mon, 20 Apr 2026 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691482;
	bh=b2N3n3pXJf/7gTblbl17X9f/3O1FJA1n/NyhJMsGXck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2H1bGw++iBb57Px/sP4j/9BQ0IFhnqvMXqLAqs+CX0Zz/se9u0RztUp0VlX3cuAH
	 1lUyAEddZIAPFsJtyyA7KsLnq2UJUIfB5ez9zb2wLYydKazxlVjUPlALhEDTKs81wX
	 MXxEqrUxX5gs4ho1rvAZqrP+Tc8n4Eh72XYiJ13gxCa4dUxaQAIdscArZmHl7n2l0i
	 0Le9+W9dQZIglCYd5GpwL3yndgYf2lGA+YcNR9X5FA4QJMjjvnxA5MJAKhqxsGtM5N
	 OjkER1Rg+/VFt58Pi71fduhaFb8cqhRE3cnWFBxwNYQ/ucDogpStEs6TyTIX/4rx81
	 MbJBWml0lv6Ig==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_jingyw@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
Date: Mon, 20 Apr 2026 09:17:29 -0400
Message-ID: <20260420132314.1023554-55-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,91a80000:email,93b00000:email,5.107.6.32:email]
X-Rspamd-Queue-Id: 370C142D0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

[ Upstream commit 85d98669fa7f1d3041d962515e45ee6e392db6f8 ]

We observe spurious "Synchronous External Abort" exceptions
(ESR=0x96000010) and kernel crashes on Monaco-based platforms.
These faults are caused by the kernel inadvertently accessing
hypervisor-owned memory that is not properly marked as reserved.

>From boot log, The Qualcomm hypervisor reports the memory range
at 0x91a80000 of size 0x80000 (512 KiB) as hypervisor-owned:
qhee_hyp_assign_remove_memory: 0x91a80000/0x80000 -> ret 0

However, the EFI memory map provided by firmware only reserves the
subrange 0x91a40000–0x91a87fff (288 KiB). The remaining portion
(0x91a88000–0x91afffff) is incorrectly reported as conventional
memory (from efi debug):
efi:   0x000091a40000-0x000091a87fff [Reserved...]
efi:   0x000091a88000-0x0000938fffff [Conventional...]

As a result, the allocator may hand out PFNs inside the hypervisor
owned region, causing fatal aborts when the kernel accesses those
addresses.

Add a reserved-memory carveout for the Gunyah hypervisor metadata
at 0x91a80000 (512 KiB) and mark it as no-map so Linux does not
map or allocate from this area.

For the record:
Hyp version: gunyah-e78adb36e debug (2025-11-17 05:38:05 UTC)
UEFI Ver: 6.0.260122.BOOT.MXF.1.0.c1-00449-KODIAKLA-1

Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260302142603.1113355-1-loic.poulain@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index b8d4a75baee22..7a4c3e872d8ee 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -756,6 +756,11 @@ smem_mem: smem@90900000 {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
+		gunyah_md_mem: gunyah-md-region@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
+			no-map;
+		};
+
 		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
 			reg = <0x0 0x93b00000 0x0 0xf00000>;
 			no-map;
-- 
2.53.0


