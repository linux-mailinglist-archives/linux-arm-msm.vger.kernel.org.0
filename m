Return-Path: <linux-arm-msm+bounces-77652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FEBE5D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 01:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021D03AD3B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 23:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A152E6CD0;
	Thu, 16 Oct 2025 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gmg9BTY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33D2E6CB4;
	Thu, 16 Oct 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760658633; cv=none; b=PlQpODF5w6l6pq/7RQ4yqph9K1tGFJtIORDCpbq5fcKnEc1NHRVhvaZb4kRfHxW5WrGmIdDqWFKSqNzajgMrNjcQ/kK0z1/Z0PPN+bLF0vlgPygaTuWp4TLEDt3EtuPweGcxH1fNes2AZm49Tco6RgXJ45NkFFfUHk3yoIAyiMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760658633; c=relaxed/simple;
	bh=Mdc6wXMCPl76s/kPCzZCo8+4ezzldNR6VvB/1WdYWSI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Pgy2Lskkl6m1ncVMw1b6EfBN7ylImGq9BhoGnCTeIeo8GoO1HW++W8koi3i/NnqZVR05Ru+vfZmPGrm62ItL1YoY6YhASGtGLUQfh/hOupxcRHIxPfoD21KTlGXM2uXo9lEaGHZwsLqBeVANrolp2ku/p6g2NE27FV6VpkCLAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gmg9BTY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD27C4CEF1;
	Thu, 16 Oct 2025 23:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760658632;
	bh=Mdc6wXMCPl76s/kPCzZCo8+4ezzldNR6VvB/1WdYWSI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gmg9BTY2rpUCPCx7zwL3K5TDcHjcbj2Dax5DvphzB2wJLVbUKsKozV/rZOTZA8wkH
	 WnSuNHBRPFpzrg/AW2ZDxZ82UwD9J9Oa3pKHvH8zEPkb0X71Dmj0iY0mbn2Ue5bVK7
	 aGgVxFo/PTyvcQyVTc3cMvrPPenH/VqPqbYJmRrqBaT80cXr2WP3+hFhDfzYCY+Vlq
	 mculaor+ewjoOqzi+g/txtT3j5tEtn+tZmRvliGBaECAT8Im44jB5et/3sLJLR8OUf
	 ZBdYcQXmAx7WojtxT76C/io6qQ+eqFqBfOBSGNRQRjsm1uey8ruZyRqgaYItj9djQj
	 /wKk8VLeA/MqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD0839D0C36;
	Thu, 16 Oct 2025 23:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5] dt-bindings: net: qcom: ethernet: Add
 interconnect properties
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176065861625.1949661.11017826698339546563.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 23:50:16 +0000
References: 
 <20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28@oss.qualcomm.com>
In-Reply-To: 
 <20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: vkoul@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_scheluve@quicinc.com, ahalaney@redhat.com, andrew@lunn.ch,
 krzysztof.kozlowski@linaro.org, konrad.dybcio@oss.qualcomm.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Oct 2025 18:26:12 +0200 you wrote:
> From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> Add documentation for the interconnect and interconnect-names
> properties required when voting for AHB and AXI buses.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v5] dt-bindings: net: qcom: ethernet: Add interconnect properties
    https://git.kernel.org/netdev/net-next/c/01b6aca22bb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



