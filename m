Return-Path: <linux-arm-msm+bounces-89466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB9D3889F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 468D330F4EC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0103A3115AF;
	Fri, 16 Jan 2026 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPpGrj3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073830C603;
	Fri, 16 Jan 2026 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599561; cv=none; b=EnAx37qRWtAXJ74z66PeAW96QneqScj2b9c6fTNZbqMbFn03VQLk/pPiFbHHuI5I9kpU0vq6I+mfVYiO6rPyW/iw5D8yZy6YU9SGBVF6J10FYocyjHrE6iqazW/bmmwo9RrbXqlPfcSvJGsMB1vpbpgal7J6scgxa64CO4tSC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599561; c=relaxed/simple;
	bh=SX3PjBey7z44FFD2SjrFUE5n+udA4Cs/eRDLvhmjDFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjY5soJ2eocAqERD2uAChhmE5xRvJ7gtfudTQC5GyDG4uQ62ZiQJtX0HRRiLiCzqootdWcBhkHVWwOUaPE+vEoml+uBbJSfGgoCw3jEMVYyfIMjWGM1yRN6E8IKnVAP9n78B/b9Gz3CVW89riLlDYPiKfkAizo2RzfzHJ9ivF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPpGrj3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F7FC19422;
	Fri, 16 Jan 2026 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599560;
	bh=SX3PjBey7z44FFD2SjrFUE5n+udA4Cs/eRDLvhmjDFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPpGrj3kyuQjhmTV3aYt4Fo5W8nCSLXJeBt/8kSKSEu4hgq+x6Q/YrETa0vEnIwtu
	 9iJEk7afe2GnyvdIYjoSHEQtiK45cZzU2zTYLKVX27BdYQ56jk4IL8YIl8jtD44rFN
	 NbfREWG+Zglj7EqSdcNRYDpL5Z7nNJOO5vl92bTwy+MKelrZtNr8aG3/tTQe1VtqHS
	 aL+9Tkr/3duYtF7hopJpi8P7QFqpFdQspE/FiZtVV3wCjWvE60U85sGrVYWZ0KF9my
	 MseMTIlh5vLVZrLRJiK7nRF2CWgDSsFKchkv+wvyzK+veyGogKLCgBWrTDyL6T958s
	 PvZbbC4wDcWfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
Date: Fri, 16 Jan 2026 15:39:11 -0600
Message-ID: <176859948742.425550.1764024067188709567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127212943.24480-1-jonathan@marek.ca>
References: <20251127212943.24480-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Nov 2025 16:29:42 -0500, Jonathan Marek wrote:
> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
> The upper address space is used to support more than 32GB of memory.
> 
> This fixes issues when DMA buffers are allocated outside the 36-bit range.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
      commit: b38dd256e11a4c8bd5a893e11fc42d493939c907

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

