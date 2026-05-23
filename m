Return-Path: <linux-arm-msm+bounces-109435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI6sFOIOEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D705BC868
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BAD33006D60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED482D3ED2;
	Sat, 23 May 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmNN19rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C481282F14;
	Sat, 23 May 2026 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502811; cv=none; b=NkH8rm1HVuwstL4oY/bWJIDxKBC6hlsfrV+47VD9U6Rw82Q8+2oYkNFo9PpZ6e4iG71499ujY755ukVDrgEbJVG2OlrjH3IzRa5E+vdAxjbTcf70hHCWq7XWZdyPoq0UsrRjlstah9bYk6Nq3UuxEEhXzbZrzMKrsrY5swAm8x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502811; c=relaxed/simple;
	bh=0f9diajCf0c6ZXQ22Ho6P7ZZtuJmw3d7sOWic9hlJf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVJdnn7ARdWc4tz7hPxSsilXKDKRntgcYVlP2dhy4zPraSctBht0vU/9wVy597UhH3XWOn11jqs5qEg+EYrdbQia3YPzSdR0E2XSkCCBpCH4csHOiYmvPPxHvbzRsE7Z63i09h7d77C8UIeMNw0bKPCV6koF//M4I4Ptk+GnqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmNN19rl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550C81F000E9;
	Sat, 23 May 2026 02:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502810;
	bh=L5JlirbjFfB21zoUQZA7EqZmU6R3Fk117vmWr9nl5K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KmNN19rleHUOpp6yHYW0gN15Ho2E1L+kssQ+lHdmWTAWPs+jpQ4UHEI7g098HLqrA
	 1VXu4+eyJj8HqptI4TRdYJUcFlytypayhmA2NT7WItBDyZomKHaAbCuOCmbEx7aowT
	 8M2yfVCKsHKqYkXCAx4TeCZIIYrfvF9IQlxyuumWuwpNQKojw2fHBJ2xkTqQpdSP5A
	 pTDCnoYlRZntmLuPIyrxl8mKKTY5qtYRtCcJCMO2ryCyicXQhP1T5ZOUIPy4xBVmsd
	 YzM28K99rIFnrS6NY8V/KxtSyKYdhqheKlU/km4S2Ha0lXYssQZ2hpV6c5dH7SyqUo
	 yqfhzr7ZAhifA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza: Fix debug UART and add more support
Date: Fri, 22 May 2026 21:19:39 -0500
Message-ID: <177950280320.1097700.16123203155680537119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109435-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 46D705BC868
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 15 May 2026 16:22:37 +0300, Abel Vesa wrote:
> Fix the Eliza MTP debug UART index and then add the missing
> QUPv3 WRAP1/WRAP2 serial engines, the matching GPI DMA controllers,
> SDHCI controllers, their pinconf state and the LLCC system cache
> controller.
> 
> This series depends on the following Eliza binding updates:
> https://lore.kernel.org/all/20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com/
> https://lore.kernel.org/all/20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART index
      commit: 179d11c1c0cfaddcfc984edc3c1863ab600f679f
[2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes
      commit: 844807e1f89d8852d570b4be5297a79ea674fc47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

