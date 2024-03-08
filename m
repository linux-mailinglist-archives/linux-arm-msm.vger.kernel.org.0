Return-Path: <linux-arm-msm+bounces-13735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E1876D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 23:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71B91F21C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 22:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681DE36AF8;
	Fri,  8 Mar 2024 22:56:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4036139
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 22:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938604; cv=none; b=uQdm/gd2stdxGnhxzcQ1lXNVKU7ef5QxuWD8Vj+oJ6HtFB81F7VcE6fK955RZ/WdBh/MORcWTdWKs47t/lEyPHkQZQ/o6960r7iu7Ob5H+pm5EJsgtXq7gfFG2Tzuvpqerw39YwAHM7BvT3ryBcfnp3waqTJufq0Fms1sJGpBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938604; c=relaxed/simple;
	bh=ea/FMOT+LuvBUIf6Z9oNmYg5v6oX6zLSUSAj65JmdWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZdiiB35CVrkZxeHq2PHvYnRKvz0c+rFGWVR7i5TYv9lGREQNWVuHWoUX1JmZyKGsxvDl+XdHZPCOjlycUP5lF4FMkk6s2HcIow7BTg/9fFCunu+Ng0o8pkSOzCH9gnXw5eoz3jOmoHe9U1K5Y0Zyo505wdgicQZFLLUF3D2Ka+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.17.219])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Ts1kV4S4Fz1Mlg
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 22:56:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7mrq4 (unknown [10.110.178.91])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0BF541FD79;
	Fri,  8 Mar 2024 22:56:34 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-7mrq4 with ESMTPSA
	id 53omAKKX62XQVgUAplAmPw
	(envelope-from <andi@etezian.org>); Fri, 08 Mar 2024 22:56:33 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R0028d618e52-d2b1-40c7-9d69-95ea762b9783,
                    2D11F706EFA52336831762ECFB2C8F5C1953C755) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
 wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: quic_vdadhani@quicinc.com
In-Reply-To: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c
 GSI mode
Message-Id: <170993858923.2618408.4667207790973009000.b4-ty@kernel.org>
Date: Fri, 08 Mar 2024 23:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10926295649741245147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrieeigddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth

Hi

On Fri, 08 Mar 2024 02:25:39 +0530, Mukesh Kumar Savaliya wrote:
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
> 
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
      commit: 313d6aa4c64875ed8a10339a2db8766f49108efb


