Return-Path: <linux-arm-msm+bounces-108456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI+zKzxDDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:02:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0257D166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91F383099913
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABFB32B12F;
	Tue, 19 May 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5LeBsGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EFC32B115;
	Tue, 19 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187720; cv=none; b=VAIA1xiR5sJAy70ecQLy01QOW4csNZKoWe1ydpEp42dghB2ce+/+O7ked4glAdgyf0Z5dTFKwKTexZzCqPrAphlwIzzC+AdHrabNKWDY5wz65hSbSfXVuEwNQN5fcz9NCO68WIntlwKB1V1IkdvBqj0schY2QjRIPC92tRwGOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187720; c=relaxed/simple;
	bh=NYscWIIdn27D8ru0GipGO7b5M2awRNJFfMLXgM3nqSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rtYQDhiELe7tL0N2q/UitEO2GFDyrSw56dpmN6Sl99bGkbwSaKqa9SbUjDdZdmx0iXneIC14q9aa3jFzG4LUdnH/boaB7X8vNKIJaEUcDtMh7/IJX+9ZCs7P7OWBXFt082NHH8PgotgOG2ssqj6yIb8xM5BIHU7I6voQG0Wkn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5LeBsGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F5BC2BCB3;
	Tue, 19 May 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187719;
	bh=NYscWIIdn27D8ru0GipGO7b5M2awRNJFfMLXgM3nqSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q5LeBsGAhNWdj4jVvAswEPAuoNvM6n5JVUylY+cwqQ0dbCfWnQ4r/L7TvrYK3TYNJ
	 RWAKPNPHVkjFM7Xzua1BiyT3GJp0E/82/ubR4MYJ2gi8vMhJ+IpBQ+jNXP2mTOF9dT
	 Ekk59VvMFPwIlVqpOhIPbrEuogDzGfO6zx41s8ONE2m4eKEmnKe3aVdAyFHnETn4DL
	 AuwTUj+N+8wRke7kz1QtW81bSjFPcSK+CrtX8WE+FgQXE/+VMXvsnM8ODl1eh3V+sk
	 H5ETIsOP81hA/TNtnjpIZTpUFP6h0EEMXY9Qpm3qXwUoBQ60iqAFERqJW3sTAb9K4y
	 nx9txYaUor3Xg==
From: Vinod Koul <vkoul@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Val Packett <val@packett.cool>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260304190827.176988-1-val@packett.cool>
References: <20260304190827.176988-1-val@packett.cool>
Subject: Re: [PATCH v3] phy: qcom: qmp-combo: Move pipe_clk on/off to
 common
Message-Id: <177918771672.269794.9873642333004848259.b4-ty@kernel.org>
Date: Tue, 19 May 2026 16:18:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56B0257D166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 16:06:23 -0300, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-combo: Move pipe_clk on/off to common
      commit: f546912bcac6463a22c5825e27a7952f8b48c887

Best regards,
-- 
~Vinod



