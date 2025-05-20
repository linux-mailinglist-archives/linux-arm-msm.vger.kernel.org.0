Return-Path: <linux-arm-msm+bounces-58580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65388ABCD26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF1A8A3FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAB825DB1C;
	Tue, 20 May 2025 02:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjKTqn2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E425DB10;
	Tue, 20 May 2025 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707326; cv=none; b=VwRfQ1exzmwoaxhWJ15druWLjF7K7EqwrpXl3ocpyScwJBot496mpP461Gqx0IdcsFVBl0YL3RG9WmdW1PMzOVVVaxwwrbPW6TEjrdtW8gFmTduC1Yud7XVJnWPWwdozdLpy3Ht/Yxe5Ob5M1P63yDUXMQfCmjFnzhUoE12eWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707326; c=relaxed/simple;
	bh=H3RNy1QopA8XBHXbgs1WFb57N7pwcUaae1WDDl+1nOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqW3vb1l0qacqCf+5a2dbsLzSs9QgxJ4NLgp+gm443bcO5PpLHaSJSj6tl6jBD0KLaJHuhnE3YJoSTiiza5oOTAvMAuezLgvW5O+wt0ArOMwL4muvNltwRk2xl+KC1ZqVWd25j+GxiFU/aWVFw7arklMC9PEn4m1cCWDfMwA7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjKTqn2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756EEC4CEED;
	Tue, 20 May 2025 02:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707325;
	bh=H3RNy1QopA8XBHXbgs1WFb57N7pwcUaae1WDDl+1nOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjKTqn2+EXKczcxbsqsoW31rFjT8KnlygR1/vW7JRnW7ZTFfn7anWDPAn0K6v64wt
	 iYsKZJt6mtizjorRU7yzFXNGvSV0K0BT34QAf3qIgOhpQeFRnZH9QSbyb9I8VZSor/
	 Orl45jGs9RuI+d5M/q1gKyao53YlSRois1DWntQuaQXB45P0j9y8OtWZH8DyjJe6zP
	 PHNH1pqjfIsoYPdVv82vbj6d5d1oCTCNAyM8tbuMEAPwNpUi5yLq0df6Ricg9AGP6K
	 Br+tvlzjoehl8LrLRz8prDBXsIA68VLN1+ip3G8h0YRXAMdg+8OD76LmJCz9pZbP+e
	 PwOqn8wYMIksg==
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
Subject: Re: [PATCH v5 0/2] Add PCIe support for IPQ5424
Date: Mon, 19 May 2025 21:14:52 -0500
Message-ID: <174770727694.36693.11130217965966018978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250306111610.3313495-1-quic_mmanikan@quicinc.com>
References: <20250306111610.3313495-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Mar 2025 16:46:08 +0530, Manikanta Mylavarapu wrote:
> This series adds support for enabling the PCIe host devices (PCIe0,
> PCIe1, PCIe2, PCIe3) found on IPQ5424 platform. The PCIe0 & PCIe1
> are 1-lane Gen3 host and PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Changes in V5:
> 	- Dependent dt-bindings patches [1], [2] from series [3] have been merged
> 	  in linux-next.
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

