Return-Path: <linux-arm-msm+bounces-57560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86182AB2C23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C113A171C30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C570B267392;
	Sun, 11 May 2025 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRukn+NW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E529264FA7;
	Sun, 11 May 2025 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004529; cv=none; b=ODvcKJny1ke8q6ShzLZz7qpC0egs6i5jlLCPtjhOp/nWhQbMlrimWBt9653V+IN6vjtpqpgoOyQwrk7KR/msKJ4UI/b8aJVUXOH9Hh0zCJwIZrowcbtiLyzXqfItO2IC89cGCc/lJMwQAAwdwGZ3Vb/EGnVnuQs7jxtlb2rQhwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004529; c=relaxed/simple;
	bh=InZqB7m021IU1BOWQBXw5JibkyyPcVelbZT3TTfkGck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fu37iQagjp8eyPni1qS4pij2Va4mJDtaBeuRZwQUnrdqs9e5bnmgK7hqwjvZkAvtbU9ke6PXh7kWrvi5VYrvL6o3IZpQB62W02OX41MYZ1cKQe7EFsWFniDBkk5wEkLMddH6emrGudB11EVcm/YND5+FX4iC4wrZvujiLHRnKHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRukn+NW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B7BC4CEED;
	Sun, 11 May 2025 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004529;
	bh=InZqB7m021IU1BOWQBXw5JibkyyPcVelbZT3TTfkGck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRukn+NW305zDRjEUOoBKRTWs3BP0rzwvLNVqqogbQ3eJXVidtizw6S5gHpo97bw4
	 zZgv3hKMQAKFC2ogdGQQN2CJ6m0SbEUq36HJuJ2LnmqHrM8WlqFUva9lFM66bpjgq8
	 kjwjm29FnDh1ec9PEzVyOpis8H8tu3rRhvHexA+RNPH74pOrKjUpYVvq+wTmTmMC/y
	 sPv4cnvuSj+EdJw2W/Gi4klKAkg218N2Sd8aNgfeGh4QVCj4kFKjM66gkUgm7qZc9E
	 +Tu5flcFDRqr9u6asWNizojsJl7heEqK2MEL35qXJO3gOXKMEi9115sRwL8PxCakbu
	 q4LnVNd+VWbXA==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for va-macro
Date: Sun, 11 May 2025 18:01:41 -0500
Message-ID: <174700447982.10930.5995939075038254492.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
References: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Apr 2025 10:42:22 +0200, Luca Weiss wrote:
> There's devices that don't have a DMIC connected to va-macro, so stop
> setting the pinctrl in sc7280.dtsi, but move it to the devices that
> actually are using it.
> 
> No change in functionality is expected, just some boards with disabled
> va-macro are losing the pinctrl (herobrine-r1, villager-r0, zombie*).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for va-macro
      commit: 8881698cbd8df8966bcc5fd6b500f2b048d5f0fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

