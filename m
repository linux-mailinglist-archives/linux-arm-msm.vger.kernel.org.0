Return-Path: <linux-arm-msm+bounces-107175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBCTE1KMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:23:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D169529109
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C4063051722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7B3C65FF;
	Tue, 12 May 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBFcgKos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A13C2787;
	Tue, 12 May 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617410; cv=none; b=dRlwWlzwW4gjshtdONjri1x40IjG3siIqa40GoKl+SZnoiamCpce0YV/aKvIPRCrCNy5WbBxaQ0Mj/ES7mBdtwIPhomydV7FD6V+rG+jcj7IDnLoM4EIyHCr1kLAfENaUr97azOaZF0OhnCYUydcOwO4lfiWRJtLTG23L3rpxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617410; c=relaxed/simple;
	bh=QOCRf6dLqepCUa6YKt4nUPE6Zc3Xh+Mg+fkorBi7bIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iiTRY3AQ/zRhkgibwPWWfanMVkDDpDRZsT7d4yevNFeF577ejvr6sqUZO3Ynz7UbIdvFpzWmwpNYkIV8z4+hCNPHuEIMb1lQzQl1lB7/R+zTT4qvi6V/yh6PErlzVJ0XobaIrhpMZImhxmwt/jeKO2YyPO8QMiq1K8AVdlkTEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBFcgKos; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9A1C2BCF5;
	Tue, 12 May 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617410;
	bh=QOCRf6dLqepCUa6YKt4nUPE6Zc3Xh+Mg+fkorBi7bIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBFcgKos6PPNAbO7HUcwr43D7t0unrrTpYQD4u1grZAUZXILX366D4OM4eQyjZRBo
	 reujSoZiIRvAdtOFN6Zgok1Iq0VlgMcaf742A9dgOObMnWuxAlM52R/EwbvnpusxHt
	 TQZjdenDzOAMnEs15paNHH+HkfiiSisjCpawPSZdRAFr097kfxDSEPDQjC1aO34Hyb
	 FXr9XECkmsZ6WHT3jpZgAa9wGk0nd7AWHWL07Ru1vOYPLgnbCuO6kVBNzRKfuqJieb
	 TGa8b8eT6mD7SGS5G2Hree2GJa/JHBQuXKwsKrqDCRD1k2k8Ua9y/f/B3VgMLdUTVl
	 cLdxO2LNrpwKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: milos: Add QCrypto support
Date: Tue, 12 May 2026 15:22:42 -0500
Message-ID: <177861739348.1242344.18372214369388033089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2D169529109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107175-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 06 Apr 2026 02:09:59 +0000, Alexander Koskovich wrote:
> Add the dt-bindings and device tree nodes for the Qualcomm Crypto
> Engine (QCE) and its associated BAM DMA controller on the Milos
> platform.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: milos: Add QCrypto nodes
      commit: 208af18362e01f59bfe4a71a8606b09acb673cd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

