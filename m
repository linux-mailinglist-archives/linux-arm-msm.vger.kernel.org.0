Return-Path: <linux-arm-msm+bounces-99489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLajBMDvwWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:58:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3D300CC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0A5F3018237
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E414F37CD3F;
	Tue, 24 Mar 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH2Ik1eL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F237CD21;
	Tue, 24 Mar 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317388; cv=none; b=O3CuzcgvDTlq9Kttujnm+aZ4yxB46h3fZ3BdWhgjg4WRcx3uH3K0pVOyeTPBCObazWFPXRkNgc95p1GA0CUuzdF1h5gu0WjuGlkpvZdQgq7Gcb4EtQL2BDeTj+rERLeownUlkv8XcbHflHcTiyX2lEm+I99TECgbgZsB5a42TEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317388; c=relaxed/simple;
	bh=Q+UquOnuGYeW6MFQGrXSMFvP8yvv6a3VrHK4iYkzm7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNdfqRivCr7/I93AUmgV/HtLwpfyax132EnZ8VkGPTjnCDEqUpkMz3Tlk9bSAcThsMnlkt5DHvBCI8fssnmba4JINL7RzBhc0F6e7PsPq4wWtczyb3ljl6MqUug48TfcXK6FhaoR9bVTsVg6DAtiKk19plSbG9LABbPsqN6RBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uH2Ik1eL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29D5C2BCB0;
	Tue, 24 Mar 2026 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317388;
	bh=Q+UquOnuGYeW6MFQGrXSMFvP8yvv6a3VrHK4iYkzm7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uH2Ik1eLx94l2EmD8Hbkaift3AhTjMMFcDeddYf490Ve+Z4mz0SdwgcCGVeTtNO+G
	 +2TJ252DbO8c1H6lAW0xWobys8kYPVKdGfn5yr8gSSw1lMOWo9Nnqytk/KkXD+d1xN
	 Vp8iLQy95IWFC1wP5FocHNj7scoXTb7KAsjX1yujprcd6GEtpqQ3vdPaHKSFwmr8La
	 /kPc5bWAlhjUIzA64Yi2Fa80CZXjIr9Y66YdyvNgK3M7w6e0ic8HFxC12a+zg5D2wQ
	 bV+Y5TaFhBSlFQVgUWIyYr5PQA8E+vOfYlIgUSV3sOlAck++jcWl/e20PuzaOyNs8Y
	 KMRs243ylgbOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] clk: qcom: Add Eliza Disp CC
Date: Mon, 23 Mar 2026 20:56:18 -0500
Message-ID: <177431737469.23057.9064236435225913383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
References: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99489-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FA3D300CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 12:49:41 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Patch #1: Use maxItems
> - Patch #2: Follow legal requirements, add missing disp_cc_pll0_config
>   usage (W=1 build and actually test), regmap_set_bits.
> - Add tags.
> - Link to v2: https://patch.msgid.link/20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[3/3] arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller
      commit: 263aaa90d8aa81310db8a754c86f7299c3df9d8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

