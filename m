Return-Path: <linux-arm-msm+bounces-36870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62179BABC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E876B1C20831
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37F019D062;
	Mon,  4 Nov 2024 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDLupiVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993AA19CC2D;
	Mon,  4 Nov 2024 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693638; cv=none; b=no/46EgfS5onNlMqokoBYK3EGGvuzOjV4dkosgpeJbH9ruNZy75qGRpxekBvKCdknJvyYpkpdkF8ZFM3wl6d6J1G8hM5P3NbWqZyRav41MdPm4E+S7278WhK6nMF6pdyZPAro+oRmGk2qaMrSvC3jsNYZHWb6xlZN4pj2TbOryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693638; c=relaxed/simple;
	bh=uT4Jn296Ogkh0TJ0NJaAbmssa2kWludOUaskYBppEy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/1M8TKtOC/r39JhHDuoQnXaIMRxFUZkeCM8W5rl0c8M5wvkA3RRQqADBtrAIfN29P1n4rM6+XW/SWM4aQxAv6TyWel6kTDt6o7XVV0opJrHdaoIqlwCeJsWFb2Yd5N9MugeFx33KBsN66bQGiczk3lAt50ZTCxoIGziUFO/RHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDLupiVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A14C4CED6;
	Mon,  4 Nov 2024 04:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693638;
	bh=uT4Jn296Ogkh0TJ0NJaAbmssa2kWludOUaskYBppEy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDLupiVZokprW3yCyNZvRdrojzUmP21xXIJwO+h2keQnhVp8qKeLymz+kEqhudGMz
	 rn+yTD4f7h3YW0m3fb7iSC+Kx03DrzMRmGmht/CycyM6BOP/nrhBHeqTCGCcmxsIx1
	 6a6QzNXECptVk4zGZ972aRRuFFslbBcX36xbF7zOdiDwuVGnBjx3pp+wjpGcZA/4b+
	 QCIkwBo2/Hf93ANKzcx0Hw4iAdubmVj6xOljebl7WBZ4PlpfcKUdbgwFI32MbfOylf
	 9tBB+gdMgivIZaL2S2iHcEn8HfVNJjZuCfgjZf6DdKpsj8SbOPE9GeLiqx1CbVQiow
	 NmCqzHsLqgNzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Song Xue <quic_songxue@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] soc: qcom: llcc: Add LLCC support for the QCS615 platform
Date: Sun,  3 Nov 2024 22:13:44 -0600
Message-ID: <173069362374.23540.9462621373824686675.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
References: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Oct 2024 14:38:38 +0800, Song Xue wrote:
> The QCS615 platform has LLCC(Last Level Cache Controller) as the system
> cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
> interface.
> 
> Add Bindings and LLCC tables for the QCS615 platform.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Document the QCS615 LLCC
      commit: 08e2d7c64edddbc0b0885be901b3f752ea245587
[2/2] soc: qcom: llcc: Add configuration data for QCS615
      commit: 9f85ed1976bc7882a300aedb556148dbbb245b96

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

