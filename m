Return-Path: <linux-arm-msm+bounces-32998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A898EB12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4DA71C217E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 08:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66DC13A87E;
	Thu,  3 Oct 2024 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMtw5Cb6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB9413A869;
	Thu,  3 Oct 2024 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942927; cv=none; b=pQmxjqCwwfJNVV8/+vjViKi4dyfZC0Tro+W5cdE+oAMXK0lqYYfy9AGlLEWhRK/HWnKbguBJj44ce3nQUPn0+psJKgXfmFTsZhmNzMeSJGgWlNoIvwzDu5evZnmjOFQ4QyXiloSJCdpDWp72NP4I6l5l27PIJgT8oD7H5/CJxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942927; c=relaxed/simple;
	bh=ODsvNPNH3sgvdZaMhzF87Edl9jlOg6OF4Z15ytN5G3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gka1WXIUjvF0x8ZWr5HixOkY2ffpcghlx5cIU2ZZNRYZiwzGsDDlOMz8yadJt2AmUA/ivHnuHM/un7ust+hw22d/DOgeLkiugOBJiKbJDPmeK4U02FduPp/XRDwLpHeCB4w7TLN9yJ1m0ohx9BV387e7WGRCNPwGqIPk/RzVf94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMtw5Cb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D658C4CECD;
	Thu,  3 Oct 2024 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942927;
	bh=ODsvNPNH3sgvdZaMhzF87Edl9jlOg6OF4Z15ytN5G3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VMtw5Cb6QLuTIsG7PmO6D7g0W5OCF5piz2+c8CylZxYn4GWOwJpRL2iwRMkmSIyUg
	 0X/4aIKMrFl+gTQmaPWcuWRIYc6uHBYL4guVapADf/++3WylrZ3XwG0QopjlJtBYne
	 JC/m1rBhRiG0kavfvT5+hvRKva+NvRpBS8zG3xmcDHH5jTte/HMjIcrv8V3eLGc93T
	 GpKtijujak3SHLOe+ZOu9lFyoQIJAUDr2Fn1cVGR2TpB7AGgwFS/nGEGc08yUV13hk
	 0g0VwsIRucLPB+TIqgV+Np8CvD377pXUZWRoT35Cxt8ZoQvAdIX3MwmBa4yDLV+YZ0
	 atWkPRzlaR2pg==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, Shen Lichuan <shenlichuan@vivo.com>
Cc: pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240925081134.10248-1-shenlichuan@vivo.com>
References: <20240925081134.10248-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] soundwire: Correct some typos in comments
Message-Id: <172794292500.250995.16416368820266397041.b4-ty@kernel.org>
Date: Thu, 03 Oct 2024 13:38:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 25 Sep 2024 16:11:34 +0800, Shen Lichuan wrote:
> Fixed some confusing spelling errors that were currently identified,
> the details are as follows:
> 
> -in the code comments:
> drivers/soundwire/bus.c:115: enumuration==> enumeration
> drivers/soundwire/qcom.c:1176: wil ==> will
> drivers/soundwire/sysfs_slave.c:218: highligh ==> highlight
> 
> [...]

Applied, thanks!

[1/1] soundwire: Correct some typos in comments
      commit: a54dc8c68a5b33ca00b8dcd3b87681aacfbfc9dc

Best regards,
-- 
~Vinod



