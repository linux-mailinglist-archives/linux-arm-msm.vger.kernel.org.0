Return-Path: <linux-arm-msm+bounces-48075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A17A36865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18153171235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9CE1FE45D;
	Fri, 14 Feb 2025 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qcxn7uo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D141FE44F;
	Fri, 14 Feb 2025 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572714; cv=none; b=c+QLU10gh6Bp2NXZZGAH9PySiKG3XSTfsZQi3kCHuMARJlEOshS1E5vuH9VQWkVTCfpF92gdfVkVLhTAQ10wH2nn9h7jWhfjXR8E9rcOUe5J9CqOfCewgAZ7PqpZYKhmlE66bohkZzybiMYr0SpNRsrUtYbqSn6EMD6lGaERaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572714; c=relaxed/simple;
	bh=x27UVrWMW/myIDVNYtLb5KAqSyNByrFFZ98VEUwmg2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TlhytQq77Jm/DUHkUDTdhK2/qLaZGrEEeT5hBeYV3vaLM0VH6pEOn2Sg5Eec0+bXkFIwoB4DVcvvBcqyKNFwhGSvWiYB5bx8zR9U12gBqVpFNkCTAdei69Izd/KI8M4roND7r3zTDeqBDEOjCCorwRFQs9iAJ1jfeNWPicEWsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qcxn7uo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95056C4CEE8;
	Fri, 14 Feb 2025 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572714;
	bh=x27UVrWMW/myIDVNYtLb5KAqSyNByrFFZ98VEUwmg2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qcxn7uo0WCNiQpj8I48P8yysVe1iqT6ruHQ+jUWeAC5aiPp10Nx4pLeKiCA/XEm+L
	 OnCs8f3cvyAGX7xkwMT5jVtJUFt7xFsAmEVIPCDoW9P44Gl+c5GsozVsRqHT3KK0g2
	 35ZRrv6KxVqWWHo8eHTLc2wEFjZ/dFi2tVh7l/YHhO6iT2+Zhq7NVhSfTTUTeBU/Ua
	 qTRi64Kdt+vwYxy3yOj9PYzvYQQOmuOXwIHDjiS4RT0KTBf9Fg1GBHLM89U+qi4jGe
	 6SuzD4DWrO1rOlcT5BfK84JbyySAA6VXguW897qdM48O/u3ACU/brnf1gkHqdrG313
	 +LWzggkj/kcaw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Jordan Crouse <jorcrous@amazon.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
Date: Fri, 14 Feb 2025 16:38:16 -0600
Message-ID: <173957268927.110887.1989860299812471198.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122222612.32351-1-jorcrous@amazon.com>
References: <20250122222612.32351-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jan 2025 22:26:12 +0000, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for
> the SC7180").
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
      commit: 52b10b591f83dc6d9a1d6c2dc89433470a787ecd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

