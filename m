Return-Path: <linux-arm-msm+bounces-58581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC9ABCD1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8326318890AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4443B25DD1A;
	Tue, 20 May 2025 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbkEgtb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641325DD12;
	Tue, 20 May 2025 02:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707327; cv=none; b=gfzB+QI9jYsldKPfPym1e4iWYfudg3c8kRdgxu9r6zth/1JQF++7b+r7aIK0XLavWC6qpR5K51C04XtahA2FgymMQnDDRwBSalENFZi0ofl49r5HEAcWOGCp8OdLMdxRXn3lBt8RNeSdZJNMVfQO7sJfAHpYZwBwzsyT1k+n51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707327; c=relaxed/simple;
	bh=JdmIKaJ5dMQzRWrLhA56g57JwoUliRfdu9/rQHMwWd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gS+HKWG31qSsntVpX64Ia3TUQTkipKgoZqVd9qOiE+OhQDe7XbDKZx7nJ8UjeH2Q2EZtOgWpN11gHXmgV32LY2B2kIStgzMaiBwb9gxQD7OodxXcqHL8M3MV3BYuxpUBWGzIiQZ6OW6lBqDDVb1kx3Uey1Runk7i+lb6AgVoMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbkEgtb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F60C4CEF1;
	Tue, 20 May 2025 02:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707326;
	bh=JdmIKaJ5dMQzRWrLhA56g57JwoUliRfdu9/rQHMwWd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbkEgtb5Rasm7OEtbOY08x/jAjk5eYFwmARfT4mcAkToIUkMmeBweqndJHhOJY448
	 3mzOX8xGhUGvSxTS76ykHlLx7FFtpAXbHsCVW17BYwqKtCM0OTWLjCHyvIAVE9sKbq
	 K25Lrybh0BBBKvdjaSIYHOD4uafc2Tl91Wgpfa81QfkW7dWxNeSnYU9V4qm/az2bGT
	 8eY0jn60PqGvFLY3oH1ABMX/sWGgs6pj/xoyEpOsXv14yLWXcwSEs9Ev8xBSoakU8B
	 mGKyi9PKqHBSBkMaTmg+6TblIq303Ve/xYkr/PopfCBnSxtG+mQWbcZHdzO41W5vSH
	 64UwpbB/PC9vw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v7 0/2] Add PCIe support for IPQ5424
Date: Mon, 19 May 2025 21:14:53 -0500
Message-ID: <174770727731.36693.12100049603780379168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416122538.2953658-1-quic_mmanikan@quicinc.com>
References: <20250416122538.2953658-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 17:55:36 +0530, Manikanta Mylavarapu wrote:
> This series adds support for enabling the PCIe host devices (PCIe0,
> PCIe1, PCIe2, PCIe3) found on IPQ5424 platform. The PCIe0 & PCIe1
> are 1-lane Gen3 host and PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Depends on [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250317100029.881286-1-quic_varada@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
      commit: ab7f31a3830d7ab2cbc8e4be56c424e66adc5dbe
[2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers
      commit: b970a4dddf7eddd48c21a3d49bd7a1708bfe3ea4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

