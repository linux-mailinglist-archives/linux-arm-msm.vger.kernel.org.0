Return-Path: <linux-arm-msm+bounces-87477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39999CF43B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3EA731A53F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F14D3358CD;
	Mon,  5 Jan 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK7cqXC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D029BDB4;
	Mon,  5 Jan 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622095; cv=none; b=GsY/bRlQPE2X4gmQL6O9DqkPVf9zSBqn7FD0XvZbMB3p5ehUduyCt8xkZ+iIk7rGYlg+DzRpSggJ5PgnEiBFXZfwmhD6e9uNZTG20ioG5kOZS9GMibhOoOGIY4KaleQUxPwD1+y73zV6m/B5O+3a5XB7G9bkvFELYbmSagZ6o2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622095; c=relaxed/simple;
	bh=4LkMlRDSHlVjlyZzixfeKZNNayfMAMDu8Ft+VUvZ3Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ta/a8Vd6sisAy+1EC8oFD6j8j8j5D1D8VUcjh61PpSsh2F9yo53hpgdrLpyDSS3CTwhHk9H8sAaRc3Z7RCh9TpMdVR8iD0yAmB7akRe0r1MyAA1RbAD4SC6smtlArnZzs3aiPV/Z+l+z2Z7OastUAivawBiO6oRUO4wwf49bwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK7cqXC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F6CC19421;
	Mon,  5 Jan 2026 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622095;
	bh=4LkMlRDSHlVjlyZzixfeKZNNayfMAMDu8Ft+VUvZ3Ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WK7cqXC7hF6IhK/EXTLM+12LThlxjWjlx5MHxskoq+ofPv/Jl8X7l7CJ7h7h/OKU/
	 D4DDqd76r0IgQwGFP4S0IdnkMmFi5Aq7YBST7mzvev4d6s1vwTNpf6Hdb4EZaqCyDF
	 9+BCzq3WyTe0eZjXWk0oXLOtDKqZcnnn4Jr4syWdQ0JBwDWPxdnoXe59kr3DSha2aH
	 QCCaQStquiABe37HH9ZH3R5ElalMz83GTEOrRpadgufSyJYOGZnBzwjx+EPwtk3RZo
	 flOM/gIP5QKtMJQyzsZEU2iggb6ecQs+GNiDyjMqONzT/k0FUn7Gp1kJ4lInloTrcM
	 Iob2rvf9nZ5dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
Date: Mon,  5 Jan 2026 08:07:24 -0600
Message-ID: <176762206385.2923194.7883329798064485749.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
References: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Nov 2025 15:45:45 +0530, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI16 on the LeMans IoT EVK by adding the
> required SPI and TPM nodes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
      commit: d46a0900bdb95a4b1175fa821b46abc11664314b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

