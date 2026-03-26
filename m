Return-Path: <linux-arm-msm+bounces-100000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EECrCQ2nxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8132EC4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79E8330470F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26389392C5F;
	Thu, 26 Mar 2026 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMvvJXBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AEB392C5B;
	Thu, 26 Mar 2026 03:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495175; cv=none; b=c37BpKzEVe3TBaKQcoAB8bDagd6MvtH4BjsG6oklOrgoO665pXtlHhwIXsq20TqqJIVzerWrj2BCpJ+7kkJTU8d9dSKea5imdg6o0WQ/7VC/OoM7cOPTmYl9WGDlBMwjhZrhlgDjrpdKfX70L34U9j2F72w8DUTmxtqx4u3bSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495175; c=relaxed/simple;
	bh=wunh+2asNmustZ1DHGzYOFOj2DWqEu+uIX34AaqU814=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/UWDes8GOjGeCkwYCJUJZOOsSkuGUxXZofW+oNM2YyAIgA0lo6uZ0h/T8+DYTiK71amviEihM1LR8KAxYiFgkaLRM8suaAgTHqu9AcI8bHOh07Gh7Mp9nLQyYCsHuWdySYyCGaUh+yLQAPAsC2sCJ10UYHwod6qxBakY1pctc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMvvJXBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDBBC2BCB1;
	Thu, 26 Mar 2026 03:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495174;
	bh=wunh+2asNmustZ1DHGzYOFOj2DWqEu+uIX34AaqU814=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rMvvJXBLtBeW+doa2BUAbgnjt9BJXxr27GnZqYxHDb43Jqim8Rq7RBOaFgr/yKB0H
	 S8KUKjBmIozX7ypvFfN69gUK3QlU1wA3MaLcKGBhRNyVZi2Xs5t/f9k5aFojQvZ4na
	 Ynp4RdkJyXelG+1ZL+rGWuTvPPYGQ6QRp5x0aOJAu3UI7xEA1B6T2U1By3E2tl1/gt
	 t/RTZTbpaOJbrydoKx0aeKoyQml3ulNDWKfxh8z5qTl4T24Wn/R27pTOfZRjyHybiy
	 iR5r9oUHy2A/hyIeMmtL29zLiwjoqCwvjD+6tAmi/Yd94wGCOzHdRH4BNAsWonxl/s
	 dG6bLc0N+1HOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Wed, 25 Mar 2026 22:19:16 -0500
Message-ID: <177449516617.60308.11928837361532399452.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
References: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100000-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3D8132EC4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 17:29:40 +0200, Abel Vesa wrote:
> Some review comments were not addressed before the initial Eliza
> devicetree support was merged. This series addresses the remaining
> issues.
> 
> The changes are split into three patches:
> - one patch with coding style cleanups
> - one functional fix for GCC/CX power domain handling
> - one functional fix that adds the msi-parent to the UFS node
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: eliza: Coding style clean-ups
      commit: 394715392733c1c6ee8812a70c884efa39f9e82b
[2/3] arm64: dts: qcom: eliza: Add missing CX power domain to GCC
      commit: 335804e0568bb985c763f8e9aef749654e415b57
[3/3] arm64: dts: qcom: eliza: Add missing msi-parent for UFS
      commit: 9b7dcb754a3cc6e5e13b523f17fa7585aa9adb99

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

