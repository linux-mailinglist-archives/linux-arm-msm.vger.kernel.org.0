Return-Path: <linux-arm-msm+bounces-100858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CtwOyejymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62935EB0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 290463113C56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071CF3DBD47;
	Mon, 30 Mar 2026 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg4gQq7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B13DB64C;
	Mon, 30 Mar 2026 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886541; cv=none; b=ZPXr6kf0mTzzmTYHB96bNNQNhQoXDvDT7AqLawHWr0LaM8KeyWSi0PiAKQ5lKBsuo/rN/hYzOOTv0bnOnXFcRVOXoxg5YIHIllJCDwtOOqMirgyv+c5cosnLE4f5zwWFQxzXUvcQvwujfUphBJKALsJ//2fOs/MovjcuI5N2Vz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886541; c=relaxed/simple;
	bh=FCHnG0LQp25k68PKS3ZW4mVElham+3FqSHgF2cAqLlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M46s6N9fC/V/9mNYHKp2v8xZGOI8B7DqZm1c+FOc6SUqGOC01C/MUq/GLSk+n+l8Pk2Y9Kn2Zk47xtVL7Ezad3C02ir97wuHlQVS+3KCurN3qGCEQmAKrFilZ2b/tnU611DlTo9bwHyZmvlq1C4iuzqNJl+lJiL8PO1GM8xmbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg4gQq7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A04CC2BCB3;
	Mon, 30 Mar 2026 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886541;
	bh=FCHnG0LQp25k68PKS3ZW4mVElham+3FqSHgF2cAqLlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hg4gQq7/1FIfhs7FhOHKCnJUjw3WYAUqCTvSTho6VBDHanGpYUtTt/Et/sdk1Yrra
	 WGEdzggvCsFe/FOAgKDnXwi6TkXjVHUd951bk3ILzvRtJx3oTO4Ugn9mNH37Q3MAul
	 2sZxRN1k4HA2jXM9POGpM2Ouy7i2J47jfb3npi2WFdkfuWV89V9Xc6DlIem6kp7KwN
	 Ukrdio5xQv1/DXcbEl98jD3FGaUPXbfra5RCjHjRDWdYHNk41Pod9nTQaSlCqsOV8G
	 zZBF3DvaqH4yxX4tKdmjEAe7Z+daamSH/P+96N6WAMU/uCxFFbKfSxv3Zx/n5xvP/y
	 ASafoU6UOZg0w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	johan+linaro@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	neil.armstrong@linaro.org,
	Abel Vesa <abelvesa@kernel.org>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	qiang.yu@oss.qualcomm.com,
	quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com
Subject: Re: (subset) [PATCH v2 1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration
Date: Mon, 30 Mar 2026 11:01:39 -0500
Message-ID: <177488647748.633011.4846757332023994409.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
References: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100858-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B62935EB0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 10:09:34 +0800, Ziyue Zhang wrote:
> Historically, the Qualcomm PCIe controller node (Host bridge) described
> all Root Port properties, such as PHY, PERST#, and WAKE#. But to provide
> a more accurate hardware description and to support future multi-Root Port
> controllers, these properties were moved to the Root Port node in the
> devicetree bindings.
> 
> Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> initiated this transition for the Hamoa platform by moving the PHY
> property to the Root Port node in hamoa.dtsi. However, it only updated
> some platform specific DTS files for PERST# and WAKE#, leaving others in
> a "mixed" binding state.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration
      commit: 11b72b1ca9891c77bc876ef9fc39d6825847ffee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

