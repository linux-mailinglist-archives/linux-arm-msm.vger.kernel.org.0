Return-Path: <linux-arm-msm+bounces-108533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKHkBw9wDGpKhgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:13:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD858052A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE622301C93B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50476335566;
	Tue, 19 May 2026 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbDKO5Ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFAB220F2D;
	Tue, 19 May 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199786; cv=none; b=e14DJXISjLPB1SIITR7SiFz4LJqGxI52PkzPdw6DzSatU66FH61seK/NEsNZ4c17wFVsEBY7KdtE5K09/DhfiqoJOXb2zDw3L7MKytlk6KSX5zBhhMWrRoLGJA9HoZ6R0RUtkMWqJ4PPDcbUExAS+lAnTuKX8w+p607E9atdRN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199786; c=relaxed/simple;
	bh=4Ltbq15kjfEzTysWd6z+gU1ilYXfFEJgzUN6Fba1Hds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=okLcfD4/Df7m1rMhdiM3h0zbR9LpP6g9U7E9AI+0LkULbu43YM9Fwa2DKF/QdIB/IlEIxEmSVqfZ7l+hUuphiF/lsGuVghhtEPvRZclPhKV39kWE7Lnf0qkU8gb9N5MlwCADIiETkc8MxrTtsfU1SySpFl86FeSDR9yuQubIFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbDKO5Ff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399DBC2BCB3;
	Tue, 19 May 2026 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199785;
	bh=4Ltbq15kjfEzTysWd6z+gU1ilYXfFEJgzUN6Fba1Hds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mbDKO5FfZ3jTbYMwIWc8ztlxKfbASRpLkX6sgeAn8/L/Yn+1cjwOFx0LeLuEruduQ
	 C5Bq3OOKU6z3DS7XSvvZDMxrSvBho6MblvvjUNeQ6pHJRguNfu1NZP0ussBe06OqE/
	 0q7PZD1xXZmXYU7jsxvDjsO4R+lDVWjIgYer5FmN6emQ/pl4si8QWuYK11ZQTkY90f
	 e+cbLIVYmEj4g7rv1fPuP7GxyVRZSKMhMBXl4fFYS8yNULAtCkE2Y0Fi+3a+XikgXR
	 F1CIweDppnDY5rIo43bGzlNAjgMAE4ggB/PmB2pX+uO8nE1I8/h7G51au8alZwo8QA
	 LGNwQIF5XMoHg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM
 efuse support
Message-Id: <177919978388.21674.2828277188173354902.b4-ty@kernel.org>
Date: Tue, 19 May 2026 15:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D2AD858052A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 19:24:19 +0530, Pankaj Patil wrote:
> Add dt-bindings and dt-node for Glymur QFPROM efuse. The GPU speed bin
> child node nvmem cell contains details of clk frequencies supported by
> the GPU, which is then read by the GPU driver to select the correct set
> of operating performance points (OPPs) for the device
> 
> 

Applied, thanks!

[1/2] dt-bindings: nvmem: qfprom: Add glymur compatible
      commit: 79d6e37d56cf42006fbb999b425f8f7cc5bdeb61

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


