Return-Path: <linux-arm-msm+bounces-109456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAN7CqIPEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A695BC9B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4006830327EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5985E377EDF;
	Sat, 23 May 2026 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HH0/t3Bf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA3376494;
	Sat, 23 May 2026 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502834; cv=none; b=WDbP9RI3Uu199wbgU1FfxcnfZ6x3cTm5lkcjJ4BOaTXicCSwewjIyBUjs5596Snr5WKknrx8Wn3Vu9/qBHgYOkF58hNpYCIrm4fgDQz2r+Uv+1Do/ZTuHfDfea3tbFTUPFLzZ/V/a9PQm9eGQL280lcL7a5C0QVisxyR8JQPZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502834; c=relaxed/simple;
	bh=hZq1qeiB7sPZrliM6gt5Cze0UX7tzGHQ3RuTZdzNA24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z29C/D4l0gpUn9ou585AU6K4N6Fg12dmR+G8D+Hzgp47b/1Z9gAEbFrA1EiT2C946VigPa0MGWJjf2crFTbpS3CtW5iE/HKJeFv0n4rJRRskQz3lEWs46JFPBLl8PWJrV+FvJBf5+i4YEgNWzLLni5q0Bkef95R3batjoNTgAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HH0/t3Bf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6551F00A3D;
	Sat, 23 May 2026 02:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502832;
	bh=pUCjda0ekhy/aDVQXPz4M1m1HEwHMZ3/8j5QOP1WWCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HH0/t3BfG+DtqVfjIeRD8WhSAt/wU9EMXVCQujdojK2mqdKHnHZSdnD92zsSQ+bqp
	 FcQRTx0BHGkqAD5EIPSJ1YO72yfVhjQLykRBrNAaGD0GZZ0SPLpWbS5slXGoCCPW3Q
	 i/JCCCbzg6m3dxx3H3WdadkzKWX/k2Jmoz0W10GlaPf5joOj2WxjW5Nj/8tRGbL4pY
	 klYHVuKun0boLii1KMS9TLL5uFBYZr2lu0I5HJ1O2x3cAX6jT2kCqUh9GhGI4pVjGI
	 3DsJCD7VNw597wBa9NIFDjrKzyPHb7QTs3mOEHerdMxo18vxzvN4XmpeyhZLNIgZyb
	 DVfWDzn8x+/rg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM efuse support
Date: Fri, 22 May 2026 21:20:00 -0500
Message-ID: <177950280356.1097700.18142488835585053049.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109456-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 14A695BC9B8
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

[2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
      commit: db9900e518b2992cbbcbfb7572c2d436ec0feb6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

