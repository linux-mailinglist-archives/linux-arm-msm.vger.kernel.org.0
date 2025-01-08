Return-Path: <linux-arm-msm+bounces-44478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022EDA068DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2DF23A680E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9537205AAD;
	Wed,  8 Jan 2025 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KA0QJrOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76D204692;
	Wed,  8 Jan 2025 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376714; cv=none; b=nu4ouc2tG9Si7udxpgduGMJtomFZpDJe40ZKPZ3GbNeagAXVeKVACX+iGFYfM+Or+r92mkCItm8emX7OuEKPpQL/M9fbFnLun12OoHCfO7B6SzN8JIGM474jJXGbBIXuHQqs/aVPk79uRZtQBwa6GxgajEcWb8KuK/5zsZ73foQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376714; c=relaxed/simple;
	bh=62gc0GXfQW93eg7eDx2mS/E3Kuh1ABxnaDg8CAt/tV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EsfJa2II4Lphg+YlZoBsHomVgIBqk50MrrE/oW465TBi77dA1rf4qBQoBuQTnAXMd10wV7f4x1AmC4NEZ84WhHLZRsAbzfgO+VXRIxBu1lAvc7UDecXceeJb4cSBYIhvZiG0LRFBFREhiBve+7WFOUZXKjy8x9i8G8tcAMiqfRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KA0QJrOF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87606C4CEE6;
	Wed,  8 Jan 2025 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376714;
	bh=62gc0GXfQW93eg7eDx2mS/E3Kuh1ABxnaDg8CAt/tV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KA0QJrOFVE2JYq6JrQhXuL9P0G0R606SWjEaak1qcC4diGJ3mh6O+btNZXjFeHOry
	 nnt/vgkNHY6nPvaOzlNAPsvnnnpygQEScRIZhsv+dd2zf/jPGANbAdrsrmPZnSzRbR
	 jPERnhdVOyL53jRzlirs7Nntj4Xt3wLKXGSA5F+xfeCVOmFkN/oQ7dAP+I9gzh3UeU
	 TDH+afvSKheeCfRy0MxHPuki/IzmiGN7urtZbEQDa1h9+xUj7hLLxF3pPBoA49npHg
	 Tyr0K8J5nwpudRxzOFe/IFQ1hQR4y87OzfYygnVbDI2wAX+YwILoX1tlRZ9nwzKBam
	 MmJuJ+IJT4F/A==
From: Bjorn Andersson <andersson@kernel.org>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: (subset) [PATCH 0/2] Add the download mode support for IPQ5424
Date: Wed,  8 Jan 2025 16:51:46 -0600
Message-ID: <173637670468.158785.16456969244162164787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
References: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Dec 2024 19:44:14 +0530, Manikanta Mylavarapu wrote:
> Enable the support for download mode to collect the RAM dumps if
> system crashes, to perform the post mortem analysis.
> 
> Depends On:
> https://lore.kernel.org/linux-arm-msm/20241204133627.1341760-1-quic_mmanikan@quicinc.com/
> 
> Manikanta Mylavarapu (2):
>   dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5424
>   arm64: dts: qcom: ipq5424: enable the download mode support
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq5424: enable the download mode support
      commit: b6f4f8c7690cf117ac40837a870d4d309c23c899

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

