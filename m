Return-Path: <linux-arm-msm+bounces-65348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C99B083D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C2B3A1893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5108F204096;
	Thu, 17 Jul 2025 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9d+e/fC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B8202F8E;
	Thu, 17 Jul 2025 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726681; cv=none; b=LQdVmJFDizfgOFOMougJJbB+f0EDFnYVP1VwatMrrFSrqLEVEmjnl4qnuHi/Ink/uH8FQOA+7U0WP/Upa/VGnMY0kS+On4LgGAuHl7UujjioJkyHc+eqAQEU/A/KCmpFMlxR24A2L6JKGOtN46W/j773g5A5n18BlNEZmqabf/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726681; c=relaxed/simple;
	bh=X1AIyDHKzYZygSLC+V1RSG35mq5EX3DPcH+j4nQtbC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYoJ3XE9jAoHB736EOBFwiTdjjtXf8LqCM5n+awEWl3OsUT6rc0bT9ZtvRMQ/8h//US7UTDU89+mQfIaIE7ldbzV6HOMp+RvvT7f4lNosl3Pb0qOrhFbWmIK2KN6/ku6iylZZOpVB69O1u9PI20EgscOaYGOTU68s4nSSvWrLWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9d+e/fC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668B8C4CEE3;
	Thu, 17 Jul 2025 04:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726681;
	bh=X1AIyDHKzYZygSLC+V1RSG35mq5EX3DPcH+j4nQtbC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9d+e/fCPvOq3mTMN+Bdts/D09iov//8lVGx1GXeOq97ZsRvyaIZh+/TiRhHOVyva
	 MYBPj7hN/xJZSwi8Nld84tC8XTFiT1ObvBkR392C21xwqq0Hz3WDjB0+8c9Pd3J2Te
	 Du3hkzlR22uOi4IqhPu4zK9pKmi/iF9OIbeK/bJa7fgpsyZUvalBfHu068DmuNil6X
	 bSoV0sTiytd0N+Ee56Q4EXWXEy8n3chXqgK50XR1XVoysdUihl+GRMTY3+/En2sy/k
	 y3UZBvrETfztw15sD7GTq00MENsvNNZMdKvxJwm9zR93fecoY6MBS+dYMftJpH0Ydx
	 nsZrQNubDzLyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2 0/4] firmware: qcom: scm: fix potential race condition with tzmem
Date: Wed, 16 Jul 2025 23:30:54 -0500
Message-ID: <175272667120.130869.4406679660383581017.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 14:12:01 +0200, Bartosz Golaszewski wrote:
> There's a race condition between the SCM call API consumers and the TZMem
> initialization in the SCM firmware driver. The internal __scm pointer is
> assigned - marking SCM as ready for accepting calls - before the tzmem
> memory pool is fully initialized. While the race is unlikely to be hit
> thanks to the SCM driver being initialized early, it still must be
> addressed.
> 
> [...]

Applied, thanks!

[1/4] firmware: qcom: scm: remove unused arguments from SHM bridge routines
      commit: 23972da96e1eee7f10c8ef641d56202ab9af8ba7
[2/4] firmware: qcom: scm: take struct device as argument in SHM bridge enable
      commit: dc3f4e75c54c19bad9a70419afae00ce6baf3ebf
[3/4] firmware: qcom: scm: initialize tzmem before marking SCM as available
      commit: 87be3e7a2d0030cda6314d2ec96b37991f636ccd
[4/4] firmware: qcom: scm: request the waitqueue irq *after* initializing SCM
      commit: 7ab36b51c6bee56e1a1939063dd10d602fe49d13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

