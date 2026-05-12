Return-Path: <linux-arm-msm+bounces-107178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IABCDGaMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:24:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079B529122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9C9B3055F35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106643CA4AF;
	Tue, 12 May 2026 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKusWVLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DE3CA497;
	Tue, 12 May 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617414; cv=none; b=OIxq09uw0RFUPDSiAQOF0bpxc6eJF5R9k+vipzFmNJbMgs67dpEdMBe32E0NfHtqPxuGQbwwiAO5WVPbs5ZXMmkg1qLWQedGt/unt+bnATd88vcL9SxfMFSWzDq1s0Qrc8C8tVlKlZ7fgSRCtkOhSMPPXcyKFkmy21T6dwrwOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617414; c=relaxed/simple;
	bh=xC+MIySvisbk77hAaKAEPPC5F82a5RSCXd/wKgjGcMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDsi87JWX5CK/M4Aivka/2qNgPZa3pQjwiJf4ocLcIDac5augdO/h+iaMVx0+Bg96wwFz28ZicTD5Y47LF9iSA20yKVYiPXlCjjgQ5hwZUqZwJK8xRTMPAzGihCX0hcX1oIFFvG3y+5o8to/PG7qE7QMNhKnmCm46/oXkg4lpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKusWVLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0547EC2BCC7;
	Tue, 12 May 2026 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617413;
	bh=xC+MIySvisbk77hAaKAEPPC5F82a5RSCXd/wKgjGcMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKusWVLm+RT/THPf0YiL0Ou0xn4TaHqzcNXY3x4AfJqG2pbiGFloJ5KfExHDgfxOC
	 nsq/bNFePTQEr6Xb6BadPsjto8PuuD43aOCwV9Shh2hDp/XFl61KlpTjXPA+zcoM3S
	 LygwApY/GKc7s49v3xUM5EIQsKRw+N5B8SlcBVnWlEqOCOOsrURIqlBwq8rkjGCG0q
	 7DIQX9EMeMSmtHJTjMKPEuQtvkvzpn4rmFKf3wFpTbt1qre0Ly7Wy3keTmdT9t2lEF
	 QPnDMPee50YrZ4C4ZAC7vZzRLnDtVbdzvtlrijnmmU0ebGs754P7I9Gb5XK5/z5Ctc
	 Z5reDYXutPc1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haritha S K <haritha.k@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manaf.pallikunhi@oss.qualcomm.com,
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
Date: Tue, 12 May 2026 15:22:45 -0500
Message-ID: <177861739380.1242344.12288912445885928325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
References: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2079B529122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107178-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 07 May 2026 11:59:50 +0530, Haritha S K wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
      commit: f5fb358c7d9161a6abfd2c619b2999c7e51cd2fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

