Return-Path: <linux-arm-msm+bounces-44184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45800A046B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFB216653A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6541F869B;
	Tue,  7 Jan 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kV2ltQ53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5B1F8692;
	Tue,  7 Jan 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267960; cv=none; b=u9gdaz7GqfCKnq4z7jIBe8a+cetdk+Ztqsn5K2AmT5NLuCXMfp5wK+0JsvfIHiGbVSj6wQeH1ZJZwHVZnA5PTemqUy6AKiFZRieYGjx0+tXOVZeIs4pSucptB53Gt/tqhUQvXsPZDcUPdNw26+UCFzZfGHjgHKhp7yMKiEu9x60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267960; c=relaxed/simple;
	bh=07jDPIoBejUenzYrDl74DlZh3Us3wiKxZfB5Csu03iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVizu2e1t78Q7TIJxMysyVyPp8OqqjF5pXVEvuwODtT/BAZ6oXzvU8oQT5ZgCZRKwgUq1hq5Gx1wjsY0nT3Zc6IXI2x1pnSFP3WukHxfD2p2WJ65QCIh4OzzPzxbGNdjzGDUZc42tzFC3djmCqFy+fEIuCI0sSX3hSiHMooi9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kV2ltQ53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8CDC4CEDE;
	Tue,  7 Jan 2025 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267959;
	bh=07jDPIoBejUenzYrDl74DlZh3Us3wiKxZfB5Csu03iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kV2ltQ53gO5T9VkbXtHjQFp47UnIgLMcN4jV1wkkkzBD+21l2JXpYczuol9Is0GMD
	 cwjJ5JvuZ8ofU+EaUNTzil+JFwYQfX+NIf2iAirHIS23LBod9flTfCSAbosThCbq4P
	 ouQ/EcKH6H9RydfrJ3BWc8lDMiFZeJLS80KyGK5td4wt1ov6VM4uquNuXWAJAFb7lZ
	 CpGaRoBrJr936AEQ4MOJTC6KLYkF9i2rs8lkF5M/s5lWjH2zA+lfpvdo+S2BxHnYe+
	 vfrlRSS/G4Vge1FEls6UqUtBSJH0wCF4cHQZQmtSZ79CW8nrPTwN0Khu4PtqZBLLLx
	 INfCCUn4IxNng==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 0/2] Add gcc_xo_clk for IPQ5424
Date: Tue,  7 Jan 2025 10:38:48 -0600
Message-ID: <173626793410.69400.12476909030557183675.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
References: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Dec 2024 12:11:08 +0530, Manikanta Mylavarapu wrote:
> The gcc_xo_clk is essential for the functionality of the WiFi
> copy engine block. Therefore, add the gcc_xo_clk in dt-bindings
> and gcc driver.
> 
> Manikanta Mylavarapu (2):
>   dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
>   clk: qcom: ipq5424: add gcc_xo_clk
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
      commit: a8b56cb27d47ecba7b26041c05fe423130ee7a24
[2/2] clk: qcom: ipq5424: add gcc_xo_clk
      commit: d966ee051ebf97e973ea9e84a7f98ab1906510a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

