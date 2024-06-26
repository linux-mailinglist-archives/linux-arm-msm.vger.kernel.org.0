Return-Path: <linux-arm-msm+bounces-24200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A991774D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58A41C21C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D7613C3F6;
	Wed, 26 Jun 2024 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g88LUNsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBED13BAC4;
	Wed, 26 Jun 2024 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376264; cv=none; b=HiL+C/0qyc+i5PZdSZpFFEjRM3nqBDNimHI/4lXtRcpwsgu6Zz/VIuS3nrcWvGCIrjpmDJAZCQ+Sjng/cDkaOHyq4eUt+Si9tjCfaGs04wUeGUk9Yt8f9kLWzeW0xq8CNw8h8KbVKyzLHdL4ujao496CZ1VaU3xO6nblVjy+ImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376264; c=relaxed/simple;
	bh=aR/lBw0zSVMYctEsFfxjWNTileR4UqFKHRMPqvYm6Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2bX4z1kDrNWy+ezn9d7oSVIlzfkF9/M95WbkU8apRUkFH4oun+v6GjuWMbsZyMrz5qQzxQy63DXXJ/33pLrfk9UyDaYBoe4h4yIg5fKdHwi3HQxfgVvacFKhCAX4YyK8hcciQg0jREpSxlnLGMAOIjL3iJQUH4ZWZIbOqk4LI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g88LUNsU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A218C4AF0A;
	Wed, 26 Jun 2024 04:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376263;
	bh=aR/lBw0zSVMYctEsFfxjWNTileR4UqFKHRMPqvYm6Yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g88LUNsUnW1dtz34/hvHs4Ko2RrapYkhpGRbYoG9bOmUr+oWG9TAm2hIqeujbo8Yn
	 QCGOl6ZHYS+/b1CAYcfdMCWfIUyghKhOzTbSm7u/3asWe9VETiyp52FMbSuSsHhEB+
	 /0/TbigvCq6sp3y2tAWmSO/CPLUhPK1lrfzKjA5ND1wDpUpYoJbhhnXS81U6533hdl
	 zQSnqyBO0eKLQyngoeSb8sRqn645wE8eX9ZRpUhxquIU/loVKStWb1eBHE92+U+498
	 7defbNC3OB73xL7Pi71Ome3wYvPpkKTJEKcXCTcVWk+7EBoxXzmpblQOVqEk3x1zhq
	 M/GSSr3z4nI8g==
From: Bjorn Andersson <andersson@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add resets for sdhc_1
Date: Tue, 25 Jun 2024 23:30:53 -0500
Message-ID: <171937625577.44413.9428599061509489455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624120849.2550621-2-caleb.connolly@linaro.org>
References: <20240624120849.2550621-2-caleb.connolly@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 14:08:36 +0200, Caleb Connolly wrote:
> These are documented and supported everywhere, but not described in DT.
> Add them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6115: add resets for sdhc_1
      commit: 66d83a42f2a3f545c347a9612e9af39cc3804e9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

