Return-Path: <linux-arm-msm+bounces-79039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C6CC11C3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6E4B3469A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8426C33A005;
	Mon, 27 Oct 2025 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrEiFF7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C54339B4E;
	Mon, 27 Oct 2025 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604508; cv=none; b=X1BptultpGXfVt2ZnzcAQBBw8fEQOnRED1izN0Kmxe3lYRDrP3Md4ONnMEmjKEsmwjwUQrCb3rHAxTWNTR1RhwuZ1Tf73GA5b/AJMnWHOBBzPaqnUjx4eIxAM7tP+nk7ZQUMl8FQPr1+vVx8g6QTgkC0WZg5+zeXaCJfhAL5F9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604508; c=relaxed/simple;
	bh=XZadXfDQRuulq7eO+ZHAu+ISiuvRLrVm+Es6fJA9JSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyjGfxLs59XqUaOFpjjgPejJKyzG7v96BUrq3docC9lrWbk5ZrMAtJ+xJSBv4JjNouxJvylcEHEocvWGwlvVOawL7ougdMuNDzaHIIDhqA0zfU9gc5psK4Qt5BavjYyf/GlMARlNhxdb+NFf+Rhv/BD329lIlpBkVqQUJjd3Hc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrEiFF7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5A4C4CEF1;
	Mon, 27 Oct 2025 22:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604507;
	bh=XZadXfDQRuulq7eO+ZHAu+ISiuvRLrVm+Es6fJA9JSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YrEiFF7vKqSWgpPeUloP7VJ44XQhDMmB0Abii5sL/+iAuSsa5smNf+o5i1qvHkMvk
	 Q+Jo4ebQgGgRvJK8pNeNnaFuq5EI+Xs0yR8AsRVwBLE4Rm5k5nFhXtwjcG8PHM2FNh
	 9IFLq3WcmLydMi938uWXlNPmc93Zg61hAlzY2F3Ox6xGSOkgzRxyLQNujka+5ANKJ5
	 360uWftCX9pTj5TYCYh5tFdCe+/GO9sQ3487POW16uqYV1UX4tbfZT/aLOa13u1JNc
	 k7P4eaDUh4Fl7HBHdCP81CvP6Cpmh9rQiCd2l3rVa2mbUBlwPyTALGMCG5aKN3ekvs
	 QOWWRkpIrMfEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdx75: Fix the USB interrupt entry order
Date: Mon, 27 Oct 2025 17:37:01 -0500
Message-ID: <176160465240.73268.16144716341302398767.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-topic-sdx75_usb-v1-1-1a96d5de19c9@oss.qualcomm.com>
References: <20251020-topic-sdx75_usb-v1-1-1a96d5de19c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Oct 2025 12:13:38 +0200, Konrad Dybcio wrote:
> The DP and DM interrupts are expected to come in a different order.
> Reorder them to align with bindings.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdx75: Fix the USB interrupt entry order
      commit: 222c975e06af18af0c9ab5d0b23811bed9c882e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

