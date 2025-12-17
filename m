Return-Path: <linux-arm-msm+bounces-85602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA928CC9C20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E90533072E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F8733064C;
	Wed, 17 Dec 2025 22:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAtspn4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE4330309;
	Wed, 17 Dec 2025 22:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012375; cv=none; b=O43Trb6dQ6LpzxNfFXnl6r1Gu2sK5kpmwMLju/w8zHDOPJaq0+uq5QFB25P7zpI8w9NRKCoPN/k7n14cvDonpHIpELhwvbkU71SVYfmLgxhF4O43nA/mfyQP1r464tT0MQT3YmqGtOXGYZXnmnf5BeN8OVZLk2XVM1dnKkYsfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012375; c=relaxed/simple;
	bh=4c5vMgeK3RGuJU2a8uepiWICvMBUCnWppwKt6gD1oWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgbRUj4eDd+0crfV34E0WiJs+kKvGIAArtY2kM62kO0i3/CAlz/59t6bGYICjCcmfvvT8NShv9kI9mKIuuDKgK5OtsAIjtyZXvEba25Ze46FrVNoq4J25ajLEpeweG7WNel6Ik1mzSrRlxhV0qYMow7viU3d6DotZR6Og4TsXRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAtspn4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B28C2BCB4;
	Wed, 17 Dec 2025 22:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766012375;
	bh=4c5vMgeK3RGuJU2a8uepiWICvMBUCnWppwKt6gD1oWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAtspn4qJ6qmYN7LGxrgPd+wObsXj+BU1FIIRMqt1ZCNrxRVHX+AVSRUpfmclkXUR
	 We4GJdhOrMG0Hxq+q4d+b7yhZUzjQ9oAUZ4GTtdWOLACWULNk7HGXnwkraVp3G54ni
	 HRobXc1EbON7IPB6+wKJzfEFVhyer7/IZ7OOMPD55pXKMqmavND2XBSOwxyhwU2M/t
	 x9tJk0hF980wxLHf7b5+l5byuz377ac2LA9P8RZU/CLmClhwdHzTeTY7KrXymZB2f4
	 3PfOIGvswYMdZNpozibp23w6oKbwxc6GiZ1iMkDkm7mZEHbie5id5lhKUFzounNBej
	 jiTgVNHzvgnQg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: quic_sayalil@quicinc.com,
	nitin.rawat@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: talos: Correct UFS clocks ordering
Date: Wed, 17 Dec 2025 17:07:37 -0600
Message-ID: <176601285468.201175.2478674762145052914.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126131146.16146-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251126131146.16146-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Nov 2025 18:41:46 +0530, Pradeep P V K wrote:
> The current UFS clocks does not align with their respective names,
> causing the ref_clk to be set to an incorrect frequency as below,
> which results in command timeouts.
> 
> ufshcd-qcom 1d84000.ufshc: invalid ref_clk setting = 300000000
> 
> This commit fixes the issue by properly reordering the UFS clocks to
> match their names.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Correct UFS clocks ordering
      commit: 8bb3754909cde5df4f8c1012bde220b97d8ee3bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

