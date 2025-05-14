Return-Path: <linux-arm-msm+bounces-57994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32970AB779C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484779E3045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42628297A75;
	Wed, 14 May 2025 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfHBHU5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15613296D14;
	Wed, 14 May 2025 21:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256664; cv=none; b=E7o3zD2g7adQrdd0XmFPlTIqh2kEk5eXdgF4YFecxp4LBf22nuufduuiFL36Wy48djILwikjaj0PXsBKOSJcZtqM6hHXiJH0++zToqR8SvxxAi56qY+f2ptKq/WvBXBjNcSMqUeA5ri+s/GiqivVGGHr+tvbhPrP2pm/thsw8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256664; c=relaxed/simple;
	bh=MJfXH/aHqUWWQBLJdPGj36mLklHCP1B98t++b802jdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4NrLUMcJmYfOj8jycRdi3FnKASo8BjXmtsO79sIBv0dxc2VtuWLGkEFmBSz//X9RxVFZXBepN9t9PCpi34+kNjqbufa98wGeazk+SljhdUKhE6l0Rfn7Y7HMz1EC/pl9Iq31O2ANABBvyjhUgWStOkmYvceRiLnDYNILR1aTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfHBHU5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336D4C4CEEF;
	Wed, 14 May 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256663;
	bh=MJfXH/aHqUWWQBLJdPGj36mLklHCP1B98t++b802jdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfHBHU5BmSTAo9NP0uXH9Lhbl0kRej73s26nv9HeN+lT37H6eVvczoRuMwfcXum8n
	 +N5mvZNCpm3fKlO/2h4M6pkw2SZbCYK6BZgFbshqLyCdv90NxW2dZS+lfTmVGWzVBy
	 0I07L/npc898hhG0vXqH2xKN8DOIV49eGBHZFOPNkVWExz3GgfNpgANP94rBdbSEoL
	 rpIziybDbuwQjLMxxDRltw6pQDmxp5SM1pq01LJA0rwoXdvau4EKdeFzHp/Nkh6/2v
	 ycAt1qdh8IUKNPizl6ZJswe5ASB7GSHXtwc4fUrCNyNxHica1gEawA1hdnO1vUxUtn
	 pHoS9zBz023QA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: linux-kernel@vger.kernel.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Enable SMB2360 0 and 1
Date: Wed, 14 May 2025 22:03:48 +0100
Message-ID: <174725663049.90041.11055392730869944737.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319160509.1812805-1-juerg.haefliger@canonical.com>
References: <20250319160509.1812805-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Mar 2025 17:05:09 +0100, Juerg Haefliger wrote:
> Commit d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
> separately") disables all SMB2360s and let the board DTS explicitly enable
> them. The HP OmniBook DTS is from before this change and is missing the
> explicit enabling. Add that to get all USB root ports.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Enable SMB2360 0 and 1
      commit: 48274b40a3719a950b1062f8125c972a2df5c083

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

