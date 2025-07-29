Return-Path: <linux-arm-msm+bounces-66976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBCB14B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C3417C088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 09:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F64D233721;
	Tue, 29 Jul 2025 09:35:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mifritscher.de (mifritscher.de [188.40.170.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FA25771
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.170.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781707; cv=none; b=J42ntoEDEOF/3dI+QFKjr7tkIwMucGc8uyFC0rZLEtkWSI/t5TDPlx+Fp3VKZwb9TbjT6i2SJTZz1i08/JmxB4aDL+6gOuHzwyLs6bY7j6h+CMxLey3epFMM08OxQh2bUQYTkPIbNbpq1O8PVVpz7flBDh+0gRVqxumMNFbqNe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781707; c=relaxed/simple;
	bh=PSnoE70CyGtAUQzhhhXcNyb7TD041Ko3FgcnhjnoRBk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=D64CaLQ8LYPTkz3JI9pexhmN2oXUH1bDMyzhbmbY3/6Zhn1t6526lfWrY3TA0Agl8/np5D8b4NK+LvZPNc3f//tHWzqyyLxTrJhYBMR2GXjhucIrgzo/a1ni9+YRAIB4rpsEc/xmUSFCkOpEucf1c401QpPblRb4nmUx2V632uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net; spf=pass smtp.mailfrom=fritscher.net; arc=none smtp.client-ip=188.40.170.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritscher.net
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mifritscher.de (Postfix) with ESMTP id C88C43B1E47;
	Tue, 29 Jul 2025 11:27:59 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mifritscher.vserverkompetenz.de
Received: from mail.mifritscher.de ([127.0.0.1])
 by localhost (mail.mifritscher.vserverkompetenz.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ciwsDxHz8izk; Tue, 29 Jul 2025 11:27:58 +0200 (CEST)
Received: from [192.168.99.192] (unknown [195.52.26.99])
	by mail.mifritscher.de (Postfix) with ESMTPSA id B980A3B1C86;
	Tue, 29 Jul 2025 11:27:58 +0200 (CEST)
Message-ID: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
Date: Tue, 29 Jul 2025 11:27:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Language: de-DE, en-US
From: Michael Fritscher <michael@fritscher.net>
Subject: [newbie] [patch?] for mhi to get Quectel RM520N-GLAP (WWAN Modem)
 running
Autocrypt: addr=michael@fritscher.net; keydata=
 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
 Mx0vDjwh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good day,

my first email here, so a tiny introduction of myself: I'm a computer 
scientist and work e.g. with OpenWRT and microcontrollers. I know some 
basic workflows with git as well.

So, while getting the Quectel RM520N-GLAP (the GLAA is running ootb) I 
stumbled over problems. Luckily, there exists a tiny patch ( 
https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15 
), which only adds a PCI Vendor/Product ID variant for this card to the 
mhi driver. It applies cleanly against 
git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git . I've tested 
it with current OpenWRT and can confirm that it works.

The big question is: How to get this patch into mainline? ;-) Should I 
simply send it to this list, following 
https://kernelnewbies.org/FirstKernelPatch ? It is also ok for me if 
somebody else steps in.

Best regards
Michael Fritscher

