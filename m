Return-Path: <linux-arm-msm+bounces-109436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HQCM7kPEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0E5BC9E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54C46301DBB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A47C3115BD;
	Sat, 23 May 2026 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNGPA/Nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383A1A9FAF;
	Sat, 23 May 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502812; cv=none; b=AQkaofD+kaixaBMMtAUKw0uXErtE0f/z/2vDRIDH4Ex39TzBciLk3vl7Sf8oFq2ByfTyWl+fP5EWcwuJlS4FSnnY6+lZgv2nT9jaysrc/7min22dIIpVnpKSbW+f1ns2Y2Bd8DGBHfXKuGSTWkqQFdlHFzxZ94Tz0+eXD5l2FE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502812; c=relaxed/simple;
	bh=A9ygETKw/8eRG+eb814bTpNKVNJtD59VerDemoxBsvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dU6LcCdqcbPCW1PE5X5+qddh4UTEdjPB5t7GQzz4aKgQbKaI0p0UtW9vZ3RVXvTFbytqusgaqi43t6j0Lq7sbQ+yQxzIK5/mRTX7xFbcK5uCF0PhW7XpT3zjnheEoAJ8JeK5inmmj9SjLa2n92SpWczfk5o4qVSq5myx8euGPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNGPA/Nx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500E41F00A3A;
	Sat, 23 May 2026 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502811;
	bh=1cHIspiJ4IBDHAW5WGMA6Ll6CGVfzyq760+8iVxGCd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GNGPA/Nxv8kXQeTlgDdWMGoYH4z0CMtSxIlz827aQpH55MmTq6mf4MnE+O1pH1Twi
	 BO7EtVTBKEynABLxEH7D685uD/IWIPgdLDw6z8OiMZOIGtoIrdjJtMUcMhmFoeozDA
	 r+4iZC8gCNwcgS4paXdwv2yaPeKtOJcziWgO8AN9EoUcU3KsX27s3mF9nugA9zBTCI
	 FJ5OCFPi1tVRkR7vjsdZuSO+Q56L6B1GgMN1PxLpTna2qk8rjzTdAZBpsm7104qm5t
	 2FbD/HoAW2N9PAyd857tu66HueudOr77UVGf4Wr61dtKVjqwWkq4jUZtwTxucwLmf5
	 VFbwAcQsJnzBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] soc: qcom: llcc-qcom: Add support for Eliza and document bindings
Date: Fri, 22 May 2026 21:19:40 -0500
Message-ID: <177950280323.1097700.13273756929938721612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
References: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109436-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5AE0E5BC9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 13 May 2026 14:11:01 +0300, Abel Vesa wrote:
> Add support for the Last Level Cache Controller found on the Qualcomm
> Eliza SoC.
> 
> Eliza's LLCC uses a 4-region register layout, with two per-bank base
> regions plus the broadcast OR and AND windows.
> 
> Describe that layout in the devicetree bindings and add the corresponding
> slice configuration and driver data in llcc-qcom.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      commit: 6487b12a875a5e3cc2f99ff7eba1112fe3f72483
[2/2] soc: qcom: llcc-qcom: Add support for Eliza
      commit: 0a4d53ae2cb68cbfe3c69e14d8cfc0acc7c37bda

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

