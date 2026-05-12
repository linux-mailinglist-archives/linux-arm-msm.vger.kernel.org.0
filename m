Return-Path: <linux-arm-msm+bounces-107179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCjLN6aNA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:29:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F3F52929A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3BA1311B4F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6963CAE60;
	Tue, 12 May 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrhOpK/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD63CAA51;
	Tue, 12 May 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617415; cv=none; b=SC7qgA3YQ2JkR0I3Ojx9svz1kVsWi3z6/DOZUjvS3eIW/aY1BIdgnJitXBgg7eG+rHe+wwpv0OssRgXtpkjAqpL07hblFEzEr3PM+7K+4gH9xFdIaNgINRAt6OSihC5SsYW3FMC1qYsvQX/T+3peH6AVqhOSyYVPoGGiCmyMVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617415; c=relaxed/simple;
	bh=Ziiq1lQIaRMTdSAD5F7GQogjzHQoMWPR8kOGGdizVt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uy4QizP//z8LuhycDD4M4i0wBQ5W405IwjH6vQf2eEpycjSdXT+ELPLPfxnF9PELK6vSl1M/ZUUycKv+l5RrpB8eVZ6tdoeeThMqDu2Jd2Tf3TEOwia+on13HYMEG97TxhHyBrRFreiy5ENuDiJ5qTkCEpvzlmag/9xy9Y6KSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrhOpK/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0453C2BCFA;
	Tue, 12 May 2026 20:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617415;
	bh=Ziiq1lQIaRMTdSAD5F7GQogjzHQoMWPR8kOGGdizVt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YrhOpK/U6AGh1ueawrEZm/YFdXeXSFjFq3VI1QJ29XEnH8AaFGP6NLtiGlWEwzU04
	 qs/tjbzVHNCcBxgeVt8P1PMW591/58boXhQzOBOvBUo4prTDv52nn2ruGe6e6tT3BM
	 oVwKojiMA0YK6bcJ/SxPWoSqJfbghS6PEN/kii3ErMbktOo47T5VyvVeOhTIvGyMJ6
	 NvgLQwmF9uVECYk6mcSya8lI3IfllcpE4CqKwkrELlvVj4gRjRD+znzeGJJzHHDgGn
	 uFEOK/6IooQ/OjnQGXfvDLFOSx/t+3a0bbyBSgQXXLQJLV9+7F34oopTf0nH8NZG1S
	 4Jml0eGCyLGQg==
From: Bjorn Andersson <andersson@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/2] Add Crypto Engine support for the Glymur SoC
Date: Tue, 12 May 2026 15:22:46 -0500
Message-ID: <177861739350.1242344.1525682685379618223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65F3F52929A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107179-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 05 May 2026 13:10:02 +0530, Harshal Dev wrote:
> Document and add the device-tree nodes to enable the Crypto Engine
> and its BAM for Glymur.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: glymur: Add crypto engine and BAM
      commit: 93e08fdc55f227847dc9b249fd5eb43403e7e8b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

