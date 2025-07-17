Return-Path: <linux-arm-msm+bounces-65434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17CB08A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C6621AA3207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0104A298994;
	Thu, 17 Jul 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="bEG38CqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B8928BAB6;
	Thu, 17 Jul 2025 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746561; cv=pass; b=G2gxbFz5Lz+deo83zjDE2JvKk6XIIl3o20G50anqOV1uXnazdZvbYdIRA/sz1PmqPzu2ZHNiCEilFYhfRYFKecL0KLpj2Fztx95Is455wQbGQEDwayYfdto+yyKH4BSYP/f8MD7BJ876OfMxbfF3e6QMhtm0nrbTtGQAM8yU/xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746561; c=relaxed/simple;
	bh=3TCSP5YsJJZxWWG9gzHlts5qsKwW6ywGf/7i5c1GoPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXykT57LUudEbvN3gVnsgcSKhgy18f9HUrwl0DNHVLXskENs3rjhsKQJUdKyEA3yBfPPAIWFpnHARTTfXk5TPpZvCwuZ+lcsbY2H4jM0frN1YfejwnJNdgm1FQnRIfBE2MuQGN+gsfkSS2qQibAqTYvN7nfmOp86GRicswD/oQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=bEG38CqW; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752746504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M9XVSkLcEivARY1KsRcgxvtccxrp9BIp95nQrmP2wMM8r5lkfJzgqJJuOsSlgmTCPUKk29auCTSyM8q1YGrj/sgdOi4ILHCbrfVBbrKZswB3xJZ91uzg4uBNwp8D733Jf8YCFvg8NTNMgmcvR4OAa+F7saO6K55+F3m3yMfJRp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752746504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7zbbhOqYxwf6LYJJ8iaNZjvt+FQoyqG1h3AVsEX+9S4=; 
	b=jURjRTqXNYWxXRB3elTgt/IVr9u+CMY6OvWiaNoJIGesrcexknNmQhNapKaaHqGMxcdGOTopflehdwXbFzpymdW1b4E0nob1Sc35JpgeCia3E/4UWhG4thrrb7+H9xZRwC5Pz6id5LyM9cJFKcZcLWV++pqoCRWgH6oWQei7Cg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752746504;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7zbbhOqYxwf6LYJJ8iaNZjvt+FQoyqG1h3AVsEX+9S4=;
	b=bEG38CqWdgxZAGzz1nAibBK3wM41aDhJ+esyEkA0+Hc2kU8qgvI79cpD38gfdlMs
	ZqPr+9L9aKdrvamHaQ4TUgozx7q/JIDgskK4kV76r4HJo2LtMaIDBip7TA/M/TYvBqO
	n4FAkwWG/1U22sxEDtk3gW7YzNBuRCtTvA6U0/gg=
Received: by mx.zohomail.com with SMTPS id 1752746501710546.3262397099994;
	Thu, 17 Jul 2025 03:01:41 -0700 (PDT)
Message-ID: <9fc6c67b-d313-47a9-b487-5edca5ca48ec@collabora.com>
Date: Thu, 17 Jul 2025 15:01:44 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] bus: mhi: keep dma buffers through
 suspend/hibernation cycles
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>,
 Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Kunwu Chan <chentao@kylinos.cn>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <bb1a5f3a-5ac0-434b-8da4-e43c996cfa30@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <bb1a5f3a-5ac0-434b-8da4-e43c996cfa30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/16/25 8:36 AM, Baochen Qiang wrote:
> 
> 
> On 7/15/2025 9:25 PM, Muhammad Usama Anjum wrote:
>> When there is memory pressure during resume and no DMA memory is
>> available, the ath11k driver fails to resume. The driver currently
>> frees its DMA memory during suspend or hibernate, and attempts to
>> re-allocate it during resume. However, if the DMA memory has been
>> consumed by other software in the meantime, these allocations can
>> fail, leading to critical failures in the WiFi driver. It has been
>> reported [1].
>>
>> Although I have recently fixed several instances [2] [3] to ensure
>> DMA memory is not freed once allocated, we continue to receive
>> reports of new failures.
>>
>> In this series, 3 more such cases are being fixed. There are still
>> some cases which I'm trying to fix. They can be discussed separately.
>>
>> [1] https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
>> [2] https://lore.kernel.org/all/20250428080242.466901-1-usama.anjum@collabora.com
>> [3] https://lore.kernel.org/all/20250516184952.878726-1-usama.anjum@collabora.com
>>
>> Muhammad Usama Anjum (3):
>>   bus: mhi: host: keep bhi buffer through suspend cycle
>>   bus: mhi: host: keep bhie buffer through suspend cycle
>>   bus: mhi: keep device context through suspend cycles
>>
>>  drivers/bus/mhi/host/boot.c     | 44 ++++++++++++++++++++-------------
>>  drivers/bus/mhi/host/init.c     | 41 ++++++++++++++++++++++++++----
>>  drivers/bus/mhi/host/internal.h |  2 ++
>>  include/linux/mhi.h             |  2 ++
>>  4 files changed, 67 insertions(+), 22 deletions(-)
>>
> 
> changelog missing
Sorry, missed the changelog in the cover letter. For now, please find
changelog in the individual patches. I'll add changelog if there would be
v3.


> 


