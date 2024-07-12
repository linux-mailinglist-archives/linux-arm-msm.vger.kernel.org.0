Return-Path: <linux-arm-msm+bounces-26054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73592FE32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 18:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A0C2873C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 16:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CEF17622D;
	Fri, 12 Jul 2024 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFlg0oGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039F1482EE;
	Fri, 12 Jul 2024 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720800346; cv=none; b=Ni6RKs2TIqc94mzH+3689nH+8cDVpIUrVNzqQ9//9RsAkAwl+nwGxh2yZGIoReVHPfko+qkYD8bPjuEffkcM4/vifMlTu1uuO3kcYPWl5luJfZ4cm3CRo3xaBStpNNRgP+RHvInZix4zumqOkLbIWcpwJp/QvWYNUzcRQ5JAlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720800346; c=relaxed/simple;
	bh=VigPz5FaSrg3Q5wQ3721TSY5CQihN9XTHw6FoD9jF78=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LsrmeQhL5job8nGAGCI++P34CVVdm1QGlNbvcwCjxe1JD19GRARPp/nQavVqFPT3dl+nEMtLvmO6LwTEsbBc0GPlf/JVQcWIl80IpVTRe/NN0wMp3mxQQxN9RWdQXczLHdG3WCJXbNVNVkDJ6ZvsPFg5wc6WhbJVMKNAjaRuGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFlg0oGn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6184C32782;
	Fri, 12 Jul 2024 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720800345;
	bh=VigPz5FaSrg3Q5wQ3721TSY5CQihN9XTHw6FoD9jF78=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rFlg0oGn7yDc/vu7JNAR5Hc3Lbx64p0KdxYPDTNMVIQ14rYjIRxJUwRcd141Iy8Rz
	 vJR+Js1wR5FBMTLBlWmWpTex+zOoH1hAShcHGiOpbc+rRnnqT530pBi2Xmu7V0VQzM
	 WOy/iTY2gL//lBCDRWup/aBUwiGJhiKOAh0/zvj1jWxzJID9TukZVtwbHgkt11R8Ry
	 +LXI87cjk4DHZE/88C8KUmkEZMsv3StAf3SrQqTW4uEobUTT+eZI6zANTye5Rdk/2A
	 wBf63RxSzzNDIxd9QVduZFb4YuVyymjE+7bdGexLDvlc3MqupKd0s4HnmXBr8hTXCh
	 mMocC1Mq8//Nw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADC30C43153;
	Fri, 12 Jul 2024 16:05:45 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.10, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <00d2b2e8-b352-4dd3-a4cf-47f0ebff5e3e@app.fastmail.com>
References: <00d2b2e8-b352-4dd3-a4cf-47f0ebff5e3e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-msm.vger.kernel.org>
X-PR-Tracked-Message-Id: <00d2b2e8-b352-4dd3-a4cf-47f0ebff5e3e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-3
X-PR-Tracked-Commit-Id: 6fba5cbd323e013079b304489629a6b814110512
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e091caf99f3a5006c95baec24330bac6f7f17193
Message-Id: <172080034570.10368.3965539697305238327.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jul 2024 16:05:45 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Christophe Leroy <christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Jul 2024 14:39:56 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e091caf99f3a5006c95baec24330bac6f7f17193

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

