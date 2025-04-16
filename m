Return-Path: <linux-arm-msm+bounces-54550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA3A90AFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBEE8188AEEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7D421CC71;
	Wed, 16 Apr 2025 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSE38L85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BE21CA0E;
	Wed, 16 Apr 2025 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827053; cv=none; b=djElcWp9pBSpyXePnhiWJFmgahof7hYra7nMh+phVdNKM+xYxNbxiZXloYPcEEulpCGsIlkN7Qyp0lG8/jI76I9U//I9w73i0q65oJ6AfE/DS59vocWHwd+/Ny2aqQgQV7PjOKZX5MY8hZA7CWe9upaYqL/a8QszeJ4tyspEXPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827053; c=relaxed/simple;
	bh=fUsOYAuDBR+EO6ABz7h1b/IfKhGz0OkzAPybKgDjLvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=toK9jB11dNyDVGDsK7EAJ77x73GMUtXx2Q6Nh1Nu84cC0vryXYIO9fRccgE5E7QX5ZRs9pQn8aMdcp29hCobytGlV5sN4KWeW6NjiXzkET9UtQEyipFgl6iv/0B5e6gEI1Q4ZU2gl1s+BMSQTdaNlWRMq+DLOU/Bl2vW1Pm96nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSE38L85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1943C4CEF8;
	Wed, 16 Apr 2025 18:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827052;
	bh=fUsOYAuDBR+EO6ABz7h1b/IfKhGz0OkzAPybKgDjLvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VSE38L85OEDTURdOo2F1iNZhrmVYdBPEHDMIQw7J8T/9OPypKSbGK4UwqBJyMapUO
	 6yTBd/GQaL3uE/BXTP+sliGhMSNKHbpD/hAYFYZQ388F4E1QPXrP7wREgwHinxxrmP
	 /gp7SdubCb3+e2wBZ9nqrXGAecEzGczU29RADIc6G6sBcH0a3tji+dROPacqj+w7xv
	 piA75kkvnLq9qW2djAwkdNGg6pYc+yy/mO6Wn887uHRsy27HzqI/AnIK0j5i2l7/3v
	 wkuhHkR4Eby1kn6esl+CbbV/LFR3mo/RGvx9EzfqfP3cFxBbLtdTVRa3FO0yS8772O
	 1jUCPUz/jtdCA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com,
	quic_ekangupt@quicinc.com,
	quic_kartsana@quicinc.com,
	kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: sa8775p: modify compute-cb nodes
Date: Wed, 16 Apr 2025 13:10:43 -0500
Message-ID: <174482704420.446874.15288807161367330267.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1739260973.git.quic_lxu5@quicinc.com>
References: <cover.1739260973.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Feb 2025 13:44:13 +0530, Ling Xu wrote:
> This patch series remove extra entries from the iommus property and
> remove cdsp compute-cb@10.
> Patch [v2]: https://lore.kernel.org/all/cover.1737615222.git.quic_lxu5@quicinc.com/
> 
> Changes in v3:
>   - Update some commit messages.
> Changes in v2:
>   - Update some commit messages.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: Remove extra entries from the iommus property
      commit: eb73f500548a3205741330cbd7d0e209a7a6a9af
[2/2] arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
      commit: d180c2bd3b43d55f30c9b99de68bc6bb8420d1c1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

