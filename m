Return-Path: <linux-arm-msm+bounces-48079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15942A3686F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DE0316AAB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A5120C000;
	Fri, 14 Feb 2025 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhrR7CWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC2206F0A;
	Fri, 14 Feb 2025 22:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572718; cv=none; b=tXKWGchNMFIfotJb79vfj7DCksEMhE050ROKcJQ3LjcZj4M1rI+aruxfojDxLdM4cOngNipFH/V5FIxbqTEq6+DBY8E4ijAyvssxVxpOxSbmVzwvO5I2JlaQgGCHxTEDMcZ73E/yKXc/JnKI2YYizdL/bTwQ6X/kgLuIDPewLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572718; c=relaxed/simple;
	bh=J4XFtM72YIIZ5v4c9kn+15GubKLzOEbPKqnB4di7mb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRKX5hSWRs+CpTG432aOHuM2ec0Oy+yr1m839+jm1+KTQetb01k4L4ujh4YOgWFaIxHaOLI/60ueXQO+UpDAywrSSa7AWtLkdTHnCQRMPspnDB2BFXT29ST9mg1SnsXzy4ewAw0f14uMIXWKP1gAaH9vhVrZh5msLaDW1sU1ivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhrR7CWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD88CC4CEE9;
	Fri, 14 Feb 2025 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572717;
	bh=J4XFtM72YIIZ5v4c9kn+15GubKLzOEbPKqnB4di7mb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EhrR7CWo9V7uBYwJGWCHrmzkETuoB09T2jMorfHLYzmIFojyVVZ+5+0g+WakQ3W4o
	 2CLuQFk1mwdGer0Wu9vGrccnIG072lK8GFzz+tdkh0DUFyUpQznfBWTQ9jq8MyD5RU
	 22heFPmZ3fy2wLbA7zZAQK1Q9MnwBgKH42zsAQfZTMCwcQXsuTcza1YUZHdA89vh2v
	 zSbS0wS/pSYwXzU9KToPhU7bJR6xVSfF1/e7yrYrxoi7CU0KgHpjIYArwykfUl7ps5
	 Xp/3Q+iPTONnbPhCwh4PJdrW/HBLFh6ZgqU/khMZKyoPQ43M4gxtgtuWzfpcWPXlG9
	 PrI2pvUmRB5Eg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saranya R <quic_sarar@quicinc.com>,
	stable@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3] soc: qcom: pdr: Fix the potential deadlock
Date: Fri, 14 Feb 2025 16:38:20 -0600
Message-ID: <173957268922.110887.5172881427439356224.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212163720.1577876-1-mukesh.ojha@oss.qualcomm.com>
References: <20250212163720.1577876-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 22:07:20 +0530, Mukesh Ojha wrote:
> When some client process A call pdr_add_lookup() to add the look up for
> the service and does schedule locator work, later a process B got a new
> server packet indicating locator is up and call pdr_locator_new_server()
> which eventually sets pdr->locator_init_complete to true which process A
> sees and takes list lock and queries domain list but it will timeout due
> to deadlock as the response will queued to the same qmi->wq and it is
> ordered workqueue and process B is not able to complete new server
> request work due to deadlock on list lock.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pdr: Fix the potential deadlock
      commit: 2eeb03ad9f42dfece63051be2400af487ddb96d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

