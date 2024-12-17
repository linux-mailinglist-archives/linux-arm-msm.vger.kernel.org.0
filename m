Return-Path: <linux-arm-msm+bounces-42575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DC9F5147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E8D188255C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86B81F76B9;
	Tue, 17 Dec 2024 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2FD/3oO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9913D891;
	Tue, 17 Dec 2024 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453541; cv=none; b=KYjYEW5cjbn5g5I0//6y0UDjoqI4P0VZFOXipK7aVkwK6/157fTFouMekXgigNeH5m+Y/TROtWGwDKl8lKhenJXrZjwcMywYouHUm10jDzQ5Xdgj4MOV7SyDcFlZbHm+Zk6/j4RpnG+0ylAv3ElvJsiaF7Mf5fQYYWum9Ovd/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453541; c=relaxed/simple;
	bh=G73dEmCpyLAEEaqfslDcFrOX9JrFVkdVMI/lVWpiwmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ta9BDgcw5oS78NBBe+6mld23m5dpskxGQsWhi6fEN2C88Z40AulMOesuABudH7ibFVSJNXaOCmvR7EN8zKY4pNVgWSucWOsIILplny4UgGxKj5V3sMNMiRZQ+xiDO4eCpk6ruZabWIHXnVtJ6aLaO+D7eiBDMX7Bn++ntp9h3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2FD/3oO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA13C4CED7;
	Tue, 17 Dec 2024 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453541;
	bh=G73dEmCpyLAEEaqfslDcFrOX9JrFVkdVMI/lVWpiwmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q2FD/3oO3vI6NM+g6CXGe6mccXDYY8RFhXI1QUYioT2tlKN12oH1OjLvGkvcrPppz
	 5ecCj0s3fyuCdPBEtbMi1wE3xdE5vhdjs0Pr1LcTzyDlEMdLLfHlvlaitrKLYh6PxX
	 FhPhNoPNoRDjwDjvx/iP8LQ2oyU+5b1Drg0VeRS8LnLgF7/4WtuVOh87isNwI55EXv
	 +96lf9QCTr0YvjJr0uQ/m1HGOaRmSGy6uN1Xn0z+1JJZfbInhuP3nH19ZLvfw1rkzK
	 1A8lhycr+0vgw3SbQbIqomQ+7RFhQsz6vuIIKfngAroRuA20lbwOGqw08neV/7PBDA
	 qhuNV69G+T7Dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] soc: qcom: pmic_glink: fix scope of __pmic_glink_lock in pmic_glink_rpmsg_probe()
Date: Tue, 17 Dec 2024 10:38:53 -0600
Message-ID: <173445353299.470882.17564015032047540036.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240822164815.230167-1-krzysztof.kozlowski@linaro.org>
References: <20240822164815.230167-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Aug 2024 18:48:14 +0200, Krzysztof Kozlowski wrote:
> File-scope "__pmic_glink_lock" mutex protects the filke-scope
> "__pmic_glink", thus reference to it should be obtained under the lock,
> just like pmic_glink_rpmsg_remove() is doing.  Otherwise we have a race
> during if PMIC GLINK device removal: the pmic_glink_rpmsg_probe()
> function could store local reference before mutex in driver removal is
> acquired.
> 
> [...]

Applied, thanks!

[2/2] soc: qcom: pmic_glink: simplify locking with guard()
      commit: e9f826b0459f1376b9c8beba019b84f9878419c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

