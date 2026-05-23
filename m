Return-Path: <linux-arm-msm+bounces-109457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJA7GbIPEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A415BC9CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44E3D3036428
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D63E379EFC;
	Sat, 23 May 2026 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnZj6ZLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA133F36D;
	Sat, 23 May 2026 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502836; cv=none; b=NVtvSVzLksM/FV3VTQI0ugB0XJAmI0O+VwyO+HwUU1NbDC841Ua0WMsK1SdCaW4MAVKvQ/fIFJ0mPQGakoXw1JDC6Jlk9Mz6CmxY+7o4ZnczBgerwQzTUqPGXaLglOw+ZjaPivbhX1UKEjbrxF96aECsymlO1lKCzc8/nPfqLJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502836; c=relaxed/simple;
	bh=YeLjBZCONRf980DmUsJ57iT0kC8+n7vuULn/QPULgXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlbS9oDX5EFszD2xyry/4SSZYVAyojs3KOFfwTiXDyLhbA2DkMb10hZa9gaLM0Wni9DrPmrDebmrRLgUDUtVP1GakFTOya5ToSvGVszpAqnzHDnjAUkIj2R64FH7muKh3FRJ+/ZTNI27dbNKf9YLcN40qSVp7tbLzzFO4vzUzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnZj6ZLa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279551F00A3A;
	Sat, 23 May 2026 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502834;
	bh=zY9/smYCY19ybOjiz9JyNq5wzrIcU7u3k3nS7XseNDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mnZj6ZLaHr71r19a8ERtBwoUU9+9m/49jaJ0L+lVgajcfT/WTLMKI7m8N6+FR+hqK
	 /gs+eyuAY7M3AopCpF5NMcnyEdxscG+rKHUXqrmAhmwKV5RIvJv9DiJ1r4v3EROC1E
	 uiuQa8W6Oy1gsn4tA2oysUH3Hk4RJ0oNeKzxE/L74mHwDzefkTinvjiuTIISOZz1aS
	 x90bKid3rZcntVm5h5+FBf4BPmaQV3W9ZUiaK7kmyqJuqgTCOlvilf3MFwOxeHgvTn
	 g9qbiLlThtLAiD169UOUqyf0UUF25tDRtLfie0n1C7iLsho7z4cKN0EG4CMEF0A7Lb
	 wJviAFVaDI5fg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: prasad.sodagudi@oss.qualcomm.com,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com,
	chiluka.harish@oss.qualcomm.com
Subject: Re: (subset) [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
Date: Fri, 22 May 2026 21:20:01 -0500
Message-ID: <177950280353.1097700.8285469548487310751.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 24A415BC9CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Feb 2026 11:45:31 +0530, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> [...]

Applied, thanks!

[01/13] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
        commit: e231930279b038ddd3274a4819b4bc2bf0dbab37
[02/13] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
        commit: f746fedb892872cbcee698696303609f0ea76fd7
[03/13] soc: qcom: geni-se: Introduce helper API for resource initialization
        commit: 5b8a39dcf909a4723a58e424ae1b0595d6f5032d
[04/13] soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
        commit: e5f54cda9d75b21baa0e07616b5d662b55e7ff76
[05/13] soc: qcom: geni-se: Add resources activation/deactivation helpers
        commit: 8f4ce470ff8c0d7d820d319f64f05ed9a239a240
[06/13] soc: qcom: geni-se: Introduce helper API for attaching power domains
        commit: f1a325d2812797166c744ff7ffb2ccbafbac20ad
[07/13] soc: qcom: geni-se: Introduce helper APIs for performance control
        commit: c012e28e9a4a84b0fe7bf9ef7db334a9a4f31687

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

