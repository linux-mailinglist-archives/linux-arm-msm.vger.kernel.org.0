Return-Path: <linux-arm-msm+bounces-21842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA68FDD4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD88F1F22A57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A7D28DCB;
	Thu,  6 Jun 2024 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V//X5Vt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC1E262A8;
	Thu,  6 Jun 2024 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644042; cv=none; b=UO47mV4R6sU8vtSXhTHIXGBwF/ORA+DqCxQB6mtKxq9PwvFl7Ob4DLxUdQ14q9xv5VHZ2psqPijndKmJkdaFXW3aSBODw5t8yUHeRlohD63aZyHY8+XbVbt+y7Gh+jE8NG87q8jl6xTbpULmkPtfJIGOMcMhZ08Oj5D/tH4Hc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644042; c=relaxed/simple;
	bh=RfQHc9DDEWzHPfWvNKvWlKK16H35ZUaU+/A/XzVJlAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sg7ivuMwj/vmMODhPQjOKJ54f57+2reMOeCo13dqUrVrY5ZQMMMdYcB4U1RULG5zYBuXgrtMQuSaxzTzGNomlKu8VLBF7oa4nsgbnyJY7FlZ8vo8Od6DwZ/JZLRmqcYc8gi5/8h1zgPaAAatAtGxH/pS2tBW/Uc3QfCov4/LuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V//X5Vt5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC008C3277B;
	Thu,  6 Jun 2024 03:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644041;
	bh=RfQHc9DDEWzHPfWvNKvWlKK16H35ZUaU+/A/XzVJlAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V//X5Vt5gfQURcMCSVq8kItko5O0/UXEmXdkOiKtewC5nQigMi6VLBUen3x2VnQFq
	 uebLIkK2DobFv6Nyi7vpj4L5zBmXeUbtgPtQ8GgwlRvuoaZti3iaxz4R+BL7pcp/Hz
	 TIKCI+u7tfKpW1/QopjbOPRNdRiq+xPh/Lk2EHadHV4gEbuGLFT8Jnf1czQ2fVK04/
	 3wol9qaQJbg5ERHH6CNR6KJA+1pO99APKVYP9B3YCcvOaLkAD6ujDoPIIi0gTDoea6
	 Kwe96aJl6B7TkTsr98ZCvp/NI6jXdZdHUjAOPg+Sn8+LCROpiQI7973MJd+mEiAFYa
	 psVLUpjIPz59A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Messier <alex@me.ssier.org>
Cc: Luca Weiss <luca@z3ntu.xyz>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/2] Add HTC One (M8) support
Date: Wed,  5 Jun 2024 22:20:28 -0500
Message-ID: <171764403335.730206.6565859700406968189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
References: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Jun 2024 02:28:55 -0400, Alexandre Messier wrote:
> Add an initial device tree to support the HTC One (M8) smartphone,
> aka "htc,m8".
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: Add initial support for HTC One (M8)
      commit: 0e8a41e511c98f5f5796c0dca8ff983d1c967b93

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

