Return-Path: <linux-arm-msm+bounces-68389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC4B20CC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E379173AA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253BA2DE216;
	Mon, 11 Aug 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIPq813X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD6E555;
	Mon, 11 Aug 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924246; cv=none; b=GRrXeg7F4xNYzAaqH7PRr3jtt6mNGmEj8mCJBC2TZMLb/eGrG8qhdjcbmMRoYf935OkPr1Hvr+L+QXJpUOd8CUkxIvReNY54ppyYXyjY5fS76+hUi5OhDm1bTwHk12SRAkdsjSUYbNYXFa5RX3HE1UlabXcgJkRIP4ba6aRZhuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924246; c=relaxed/simple;
	bh=oq38uB5DipW7YdbYA9bax6TfPFx48orh8SsizKxB+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=blPTuOGOa61EYkDk93vJdFbwDz1coP6jPSYg0oMwuMeVnjW9fwQT8io16rGtekXnqQn4VVsCY50meWcsq/SSMYYMfkrIUACiSXKuwUObxQZ5BcnhhgVt0tnGjl4Ty+c4XUGaAX30O1rf/uzfMzWwzxWQfdAbd21qmwibsCV0YcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIPq813X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E46C4CEED;
	Mon, 11 Aug 2025 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924245;
	bh=oq38uB5DipW7YdbYA9bax6TfPFx48orh8SsizKxB+Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oIPq813XUUyhs82FhUW1Q29vxS4cds9p+x4zIuyg6q0og//0E25eqZ/KrC2noDQvA
	 S/ymYaL6E9bsP9dQYjYZi9AVV+UoEqS1OZnPzO0lYFgTT2lWlHt3x9XSPGooARQh0n
	 rKBpI+L4LY82WfYT0673Y8KKG4iV0YU4DfJS+0MPkx1XOISDr13Zerw/VX7HnOAtBa
	 BM6imsXYb4KjDuXto83XErdfPNHR7JcvK533E4GJc2MVO+tKJrAuQMQJ5cDerIJX7o
	 0wFKvTsDGHzn/R6z2b9WVhC6XX+dD+7rei3UX+Bmnhig7OSGXZ15EyHnoZUq6Sz3ac
	 QtCpvBlfcjqZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to eDP refclk
Date: Mon, 11 Aug 2025 09:57:19 -0500
Message-ID: <175492423749.121102.7449698379457693030.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
References: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Jul 2025 19:11:12 +0300, Abel Vesa wrote:
> All the other ref clocks provided by this driver have the bi_tcxo
> as parent. The eDP refclk is the only one without a parent, leading
> to reporting its rate as 0. So set its parent to bi_tcxo, just like
> the rest of the refclks.
> 
> 

Applied, thanks!

[1/1] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to eDP refclk
      commit: 039cfa2cee7e02f6d89772ac6104e5327d4619cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

