Return-Path: <linux-arm-msm+bounces-27178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537193EC47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E7E281D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFCE13CAA5;
	Mon, 29 Jul 2024 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZJ2u/PZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3E13AA42;
	Mon, 29 Jul 2024 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225537; cv=none; b=mMgqBQSkeQtZaP9BYG3DylFPGxlgX1lLl3nb9vOAHFlTH29VoWexWW08LgOgfsMFTRpsEUz0rez7CQbl1KYz9JuWzcgsLt6+eaVEChbXOIx/Kah02EwA+CvxkzhFO0tPU+raRZm1HmQH1IwUDi0foUfHV32ogsvP4BsfxPV98RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225537; c=relaxed/simple;
	bh=/v/DRKP6407YguylmPIWnQ5RbqFfvfOQjtwMnP9zQkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6VF9EiPdkZRrAhmWpq3bON/zybD63lpI/p0zci/k8oCGcStyCGSDSeTztEx64AsmXVWb0ssj4YlHfgMNg0uUWctv8jo6GsvVquE+HStZTdq9BqFSKSmD9u9w3oI6y/Q105mJLtQ4dYdYxDIt1bSQGjKSNqPj835JZASFUJLdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZJ2u/PZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D10C4AF10;
	Mon, 29 Jul 2024 03:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225537;
	bh=/v/DRKP6407YguylmPIWnQ5RbqFfvfOQjtwMnP9zQkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZJ2u/PZyvT9Huh6P/AFZYLLEdXqwTqXKHngtpgZ1o2yJGbZUtd7LzR+j+i+IVxZK
	 RDuxKTzmZE5xryIxj54FqSk3fN20D8ohHPRTugZnE8+4KzUore9yMI3AIRuXI82uIY
	 vNvnPms75xH4gs4yGOjGGsLPT0dKZfTDER4K0uHyABgj19ZIp6XxdAsxo1VikNvJdg
	 3ZgscmPZdJAlUOwsSabUL6rgydwFKb9tGfuQeH0skNhYKzD6h+Yi6OqiiodHLIrjFj
	 kx7JUx3ui2qz4L66/cPBmyPnmWdtEruRAQfiInO+JeYf3MWfgGcfrHh+6VXyexdisR
	 c2AcxaRCd+o0g==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add rpmh-stats node
Date: Sun, 28 Jul 2024 22:58:22 -0500
Message-ID: <172222551324.175430.6851901009214864906.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723081357.1521942-1-quic_rjendra@quicinc.com>
References: <20240723081357.1521942-1-quic_rjendra@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jul 2024 13:43:57 +0530, Rajendra Nayak wrote:
> Add a node describing the RPMh shared memory that can be used to
> retrieve statistics for the SoC low-power modes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: add rpmh-stats node
      commit: 5ff751ae1b4e15c23afc7c305556a2d74f22fbff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

