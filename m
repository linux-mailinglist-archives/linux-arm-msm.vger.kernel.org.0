Return-Path: <linux-arm-msm+bounces-79042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EFC11C68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959D11A65E33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6DE33CE80;
	Mon, 27 Oct 2025 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5M+wqdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CDF33C530;
	Mon, 27 Oct 2025 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604510; cv=none; b=Dhx5sN/X4zcO3o4u+RqXEknln6xhSSZ0NSfbTaexC4xzqDBvnPjuQm8Q8xta44YGAfF452s4r1511Z67j+n1EVDF7SwG6OEwuf9+XdghPKzL4Rn0lcDGOZfm5pA9c1alGZDaOYvqmGHxBbw+bpZGjEVROdb+f23wu5xgS+8gWYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604510; c=relaxed/simple;
	bh=uR3OGciO5V7Xn3qr3431LnNRO83IvpsubX6FnV7RXhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BM5glXpdCc2tb4M5o1g0CBq3y51+kcBPmr8sRfMwNfIjGBoyR14Fn5UuSK2gHbJosme4E0iHs3N7mIx46HAkbsGd1nwHrl31dsbCkMIg3QwICxKjLKpx0g0z4m1QArKxy9Sc6LBbmb6X2EX/UDpB05dxKZQu+4XnEoKBFJOPt3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5M+wqdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFA8C4CEFB;
	Mon, 27 Oct 2025 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604509;
	bh=uR3OGciO5V7Xn3qr3431LnNRO83IvpsubX6FnV7RXhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5M+wqdklDJ0/8p2luFcn6+BLtnQCG36b06z8DstPWFlkbnE8I0p4gxLTF8MtWxn7
	 ZCbCNHrzxsAl2IxHyBT0i04lVwGn+h0Uh4Sy7rDmHObQeV+Z0zvAhZ2x5cuE4N1RHw
	 ENc+QmzjgdBeQOmoJVOXzFY5pXub4HPy806Ge6PZEFkVfJo4qvWsdCaAbQ/9WP/Jud
	 sQo0TDISIi+t6Grkn3eB1GCnnVnthBQNE7dc+q8pnprXPWGoA9Ha122EtzLdESb2Gp
	 fYtfqe0WPr84tqFObNM+YCjP+6yLwK0SUJFXBrLFz9yeOU9f+RcaCw/mXfx7+j6QCE
	 41FRpQ2qJ13qg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Move CPU idle states to their respective PSCI PDs
Date: Mon, 27 Oct 2025 17:37:03 -0500
Message-ID: <176160465215.73268.4069594853327616509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010-topic-x1e_dt_idle-v1-1-b1c8d558e635@oss.qualcomm.com>
References: <20251010-topic-x1e_dt_idle-v1-1-b1c8d558e635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Oct 2025 22:02:18 +0200, Konrad Dybcio wrote:
> To make things uniform with other Qualcomm platforms, move the CPU idle
> states under their PSCI power domains. No functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Move CPU idle states to their respective PSCI PDs
      commit: 5b5014f667ddbc590fe2cd3ab5a5d042e01c0e2f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

