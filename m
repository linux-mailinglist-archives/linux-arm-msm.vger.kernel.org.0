Return-Path: <linux-arm-msm+bounces-69512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE53B29D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C35C17DF3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0956630DD1B;
	Mon, 18 Aug 2025 09:07:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.gtsys.com.hk (web.xit.com.hk [111.91.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465230C35D;
	Mon, 18 Aug 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.91.236.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508035; cv=none; b=i9UHUke6BnLX0PRaaDcdVvumFGKYjNpPqGnM1zYSplv1JR7zoKx3KD+xdua2vvZHY9ISx1kFQ06kfPKMyKIQXLAUJIArven/bURmGpP8U/GZ9UB/wWo/zwgxadf2bm2pvE9naXl+6pzdekCLVp4Urfsu4XD+W29OMP+rysFg3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508035; c=relaxed/simple;
	bh=TBifRXM7fC06DAIyZn9H9xkUwW7zOFaGhJr8+qvpAcs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UQdWz8rDl//KKcZJO/yWaCivCPN3a0Ct7bYO+klp+NX00G7+xhJPJjUs1XSX7iItI4hCbD6UT889Bm/TtUJQ1c7wuqEDhVN0KtichcQ7EZB6FmVuXxaN8zp/yNzZ+GmI99wz3fIJWhA1m66jhi+RBHPmvNnxzyJV2+1mlBkKp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk; spf=pass smtp.mailfrom=gtsys.com.hk; arc=none smtp.client-ip=111.91.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtsys.com.hk
Received: from localhost (localhost [127.0.0.1])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 966E51C99;
	Mon, 18 Aug 2025 17:07:03 +0800 (HKT)
X-Virus-Scanned: Debian amavis at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBcBJWIRYBHv; Mon, 18 Aug 2025 17:07:03 +0800 (HKT)
Received: from gtsnode.virtual.gtsys.com.hk (gtsnode.virtual.gtsys.com.hk [10.128.4.2])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 66E44387;
	Mon, 18 Aug 2025 17:07:03 +0800 (HKT)
Received: from [192.168.0.125] (ip-037-201-119-101.um10.pools.vodafone-ip.de [37.201.119.101])
	by gtsnode.virtual.gtsys.com.hk (Postfix) with ESMTPSA id 053F21FC30;
	Mon, 18 Aug 2025 17:07:01 +0800 (HKT)
Message-ID: <15f8b090-fc05-4ce6-9374-f8f4322358fd@gtsys.com.hk>
Date: Mon, 18 Aug 2025 11:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: soc: qcom: mdt_loader: 6.17-rc is broken, missing patch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The 6.17-rc serious are broken for qcom soc, the firmware loader is 
broken without the patch below. May you want to push it for the next RC.

Here is the link/patch

https://lore.kernel.org/all/5d392867c81da4b667f61430d3aa7065f61b7096.1754385120.git.dan.carpenter@linaro.org/

Thanks
Chris

