Return-Path: <linux-arm-msm+bounces-43433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9F9FCEA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D511218829DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A05A1D5CFF;
	Thu, 26 Dec 2024 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkwFjXsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38791D5CDE;
	Thu, 26 Dec 2024 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252748; cv=none; b=uOPQpioQ/gBCDQiOK4/coomtYiMvsCBjsv1uFcUtLXSKKlveW6hTNkwu6IbLrURwlA0eAXa2+7tU9JWAEE1jxq+mKAer4Zjhcv7J+YQr7inpw4lnNXLquTt615V180M/SuNbc0zVP1rR/YKHcoR8te8IhWncfhD3W8OKpYujWdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252748; c=relaxed/simple;
	bh=71BItPlbLZpfF27YNhqq0NWqgx5zslKOU+R7NLf11zM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVaNt0PGAjULN2LGoRVrXmNXJzTLwLgMT7yfGOvCMk4WrNBqo5hAVGEyRF8QiqBbV9VQ/QjQzIPq64lsitPULHD76JlxhMe4EH4LGAYSxJpwnYw5cVl0zl6+IzRUbo9ZOOvbYpXG6M6N8BaNKBfImvuUNNKIj/vysLTVpFs6wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkwFjXsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1962EC4CED1;
	Thu, 26 Dec 2024 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252747;
	bh=71BItPlbLZpfF27YNhqq0NWqgx5zslKOU+R7NLf11zM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GkwFjXsHMeMfPcCwf8EY7gP9GvvE2BV5act2b1YUda9zId80dslRCMhLtSzHPB6/8
	 wkKgdYo+iIp8OzJs8cQxmx3c9ck5Bd+z13iSpZ+RfagZgVsYRdt4PYZ3Mi9oOz/Gcw
	 VvAtHiWleudoNvk4wrz643DRdiY+dlegmY0r11b3NL1OBVkS6HBtXCzbEQuSh5ZNKx
	 5oFkAZ0xEBF1HWxMNV7X7crvi7MT5VtYfFzxWxqyoCz9MXfdNHHa/+GrRYelRE/7dT
	 vbZ/lyGqRyMaBUEuy+5bjNvPRoJoq1c/tTTU6a/h8R/7Czbu2hHrttf8ztqyObKqfR
	 90YGtBExXsh6w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/3] soc: qcom: pmic_glink_altmode: simplify locking with guard()
Date: Thu, 26 Dec 2024 16:38:37 -0600
Message-ID: <173525273246.1449028.4546246895052680534.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240822164853.231087-1-krzysztof.kozlowski@linaro.org>
References: <20240822164853.231087-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Aug 2024 18:48:50 +0200, Krzysztof Kozlowski wrote:
> Simplify error handling (less gotos) over locks with guard().
> 
> 

Applied, thanks!

[1/3] soc: qcom: pmic_glink_altmode: simplify locking with guard()
      commit: 95fee3009461f4a65247db677f445fbd67776019

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

