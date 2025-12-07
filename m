Return-Path: <linux-arm-msm+bounces-84603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96866CAB681
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Dec 2025 16:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39A813044BB4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Dec 2025 15:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B6274B23;
	Sun,  7 Dec 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="F08NmBhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2923EAB9;
	Sun,  7 Dec 2025 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765120856; cv=none; b=WlXN8vu32k34D3CLVMy3YBN3TrOPIKyEy4REcgeD3lf6IPtY3CDi8FIhG4F0G3IAU4KdwOIqj51dqhTBAFEIkv+aiUzo5ex1SUH6XyWWLy5pwzM2V/tebN5MbTXWtKkchlk85c+vn1mOAA8C4rcNYFCBIVWsjTbTYV0IJ1qth+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765120856; c=relaxed/simple;
	bh=4sw29FNF+hDXvAnVpBSFpwowyDJGsGQ0TKMzDyV2VxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9SWaEkWEemJUuci4esqQlgXvGxiGoTbe20pVBfEQbAxMlSHDNKwHGdPweOxY2i48v5rJwde61jyC81TCOAVwzvPXU7IEudu222z109b0Druob4udiSVPbFoD7eaUNA4M0pb+/fQogSgdsCYzB7+DI600texEPFi+WR3LJARqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=F08NmBhi; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dPTK01KZ0z1XM31H;
	Sun,  7 Dec 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1765120706; x=1767712707; bh=4sw29FNF+hDXvAnVpBSFpwow
	yDJGsGQ0TKMzDyV2VxQ=; b=F08NmBhi6FhcjTjsh7iau1T2jSqJoYseX++LZML1
	eF9QgmBE8fEAqeqYqQb+SQaIpYS5VVbdB8Hkdma6M8I4+TR9Eg+jPS3DUSEwNXMQ
	Sx2SHT22ftvysaeUb8HGbQpyKZcL7pAEglwVzK4iUETGe8ApKCPZ73C5Hh026Mdk
	bfXK3XkdaVVLXArm4/XvIpiEyE5ka2lNnBtDMOV+i9ZGCrdu4rlAFB0Lzuojwpq+
	BCCohZ7CD4ExBTzNsFEimQDj+Ln0sLVmWwoil9JHkv8TcnQOCuY+Yv/QwW9K8xNt
	nAzPSR6Fl5ncU9ECx1HsPFkuvoYjUofSuaIcZxEA92anRQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G6PJ7d-KBR5B; Sun,  7 Dec 2025 15:18:26 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dPTJt3GHkz1XM5kt;
	Sun,  7 Dec 2025 15:18:21 +0000 (UTC)
Message-ID: <46cf2cb9-76f4-4d73-be3d-88fcbe7055f4@acm.org>
Date: Sun, 7 Dec 2025 07:18:18 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next] potential deadlock in ufshcd?
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-scsi@vger.kernel.org,
 mani@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <DERQ2FF2WO70.3I04I9XAG5V6D@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <DERQ2FF2WO70.3I04I9XAG5V6D@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/25 7:07 PM, Alexey Klimov wrote:
> Is it a known problem? I can test potential changes to resolve this
> or try to collect more debug data if needed.

Please help with testing these two kernel patches:
* "[PATCH] ufs: core: Fix a deadlock in the frequency scaling code"
(https://lore.kernel.org/linux-scsi/20251204181548.1006696-1-bvanassche@acm.org/).
* "[PATCH] ufs: core: Fix an error handler crash"
(https://lore.kernel.org/linux-scsi/20251204170457.994851-1-bvanassche@acm.org/).

Thanks,

Bart.

