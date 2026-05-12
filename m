Return-Path: <linux-arm-msm+bounces-107188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LCGIGSOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42B5293E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B30F23148307
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA833CF02A;
	Tue, 12 May 2026 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBC/Zp5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FE3C1970;
	Tue, 12 May 2026 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617425; cv=none; b=X6Nz0+wS16nGqCdHZBbfw4YKFpVAUcPjB4BEZOC//Mu5e6uv0m2oqS3rKB2fj5IIlp3diaUvEEiySJ/WZTro9ZK7snMfLPMn5juTD/h0LePFNXIaoPatNcT1+G455oi1ZnQEDkssN2qvPx+2iXWfvIh1+lmdnnhd1PCku7D/Xpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617425; c=relaxed/simple;
	bh=x5ogbsrTFFyw57EYl24ys2HMDZsdMXRuUbVAEiLMAYs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tegrWJtPsl4R7WYKXIf7O8s2Q8RpkPDaKP4SS01urUuh76YM3b/oo0DPFknRx9PQ3ZZ8uMKB0vtoXkxrWG175TdtfQU9Z0ik53TvSf2ok3XmVcpfBhRaI4BkdrOK6mc1Orknxl+NAvoRBAd9HVdOh2fBKEh1HReB3U0ZKv3PW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBC/Zp5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD12C4AF0E;
	Tue, 12 May 2026 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617425;
	bh=x5ogbsrTFFyw57EYl24ys2HMDZsdMXRuUbVAEiLMAYs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kBC/Zp5BR3ylfnsRchCcKWh9ltxt8iJKx1YTpH+bqOQlzxGXQ/2/f18Bq55M3oDn/
	 vxkP73p1vSqHyvQ7doKvgvhaz4wsYYJuJpL8HZDkTYDrLc1DVOOisz7EVBtBjuXQJp
	 EOhKYUsDWL0NY0jh6GKtfq1yKj8AHHcfXG6lbueelbnY5G/RF5C+95WODmsg8l3RBB
	 q5/MtvQRnIwHTQXyQ4XU1TzClKFFL60M2gHiqKyd7ly8j2Q4Ya8NTWl1fMuhMk+rRI
	 SgIcnGTNU/XK4zlHImlbqMJ1eE2lJORuXpGDNxXOxH9GntqSFkh5bT8lai+z1XXiv4
	 YR6T6XP+5FqMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
Date: Tue, 12 May 2026 15:22:56 -0500
Message-ID: <177861739362.1242344.324950696788189163.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A42B5293E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107188-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 07 Apr 2026 22:18:40 +0200, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
      commit: 08569936a11b8ed20f95783d80d1ba2f4e93fa93

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

