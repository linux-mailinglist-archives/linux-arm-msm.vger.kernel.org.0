Return-Path: <linux-arm-msm+bounces-92186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGvRIxs4iWk34gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:27:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20A10ACDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5B3E3001470
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 01:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346D521883E;
	Mon,  9 Feb 2026 01:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="suEFqXku";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="suEFqXku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A461DC997;
	Mon,  9 Feb 2026 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600470; cv=none; b=rZCHYGPBziLXi+XXvteLmuTdydSICC6wnPmeHpKRmF1FL5skk/mIz+TlAht8Uaa+LuCpAQ/yGvD/qmvjK7UPwza//7Np90VjfeBkU6eGAWD1uMiDpPRwuP/o2N9clHIzIOXDfTqp0U6GPu774GFmKTF4KZMq85UxK9KzLe9fsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600470; c=relaxed/simple;
	bh=RMyU47wjT1CMTVhK+z4SEoW4cTybFvlsK6AVmIblP68=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TZqJbeYULznYsgiw5sRyfaUOTuPPfR1QI20aRyYocSAJdwLx7IX0LLhGDEPK/nSat3E3wCY5Fk6TF775XB8llK/FD3MTx2CahXNZMGGSuN1dqlAjL2hXSw3ROpTVcItuZjtUr6LW8zICyJZ0vJ4wXDkoQe6zRNZxmi9ADa1gbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=suEFqXku; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=suEFqXku; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RMyU47wjT1CMTVhK+z4SEoW4cTybFvlsK6AVmIblP68=;
	b=suEFqXkuBQN9Rm0Erx2DNT2okJU/HfXtRazLxLMPPVOPtIMSjNJlFuc+vK/jactYtbu+AKvDp
	7XWimHq6QVEJem1S65iVgAzmYfhlVTXoUcVtRiXVtIyweeKaGxEGT6gSsKztl2Hmgt75EoU3Tzi
	J64UUOzmTzUfm/kFMkSdssI=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f8Rqy2GZTz1BG5C;
	Mon,  9 Feb 2026 09:26:54 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RMyU47wjT1CMTVhK+z4SEoW4cTybFvlsK6AVmIblP68=;
	b=suEFqXkuBQN9Rm0Erx2DNT2okJU/HfXtRazLxLMPPVOPtIMSjNJlFuc+vK/jactYtbu+AKvDp
	7XWimHq6QVEJem1S65iVgAzmYfhlVTXoUcVtRiXVtIyweeKaGxEGT6gSsKztl2Hmgt75EoU3Tzi
	J64UUOzmTzUfm/kFMkSdssI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f8RlQ1mjVz1prQ3;
	Mon,  9 Feb 2026 09:22:58 +0800 (CST)
Received: from kwepemk100013.china.huawei.com (unknown [7.202.194.61])
	by mail.maildlp.com (Postfix) with ESMTPS id A90514056B;
	Mon,  9 Feb 2026 09:27:37 +0800 (CST)
Received: from [10.67.120.192] (10.67.120.192) by
 kwepemk100013.china.huawei.com (7.202.194.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 9 Feb 2026 09:27:37 +0800
Message-ID: <ca5d1c12-cc61-4669-a2f8-f19306ee792a@huawei.com>
Date: Mon, 9 Feb 2026 09:27:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, Vishnu Santhosh
	<vishnu.santhosh@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bjorn.andersson@oss.qualcomm.com>,
	<chris.lew@oss.qualcomm.com>, Deepak Kumar Singh
	<deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] net: qrtr: Expand control port access to root
To: Jakub Kicinski <kuba@kernel.org>
References: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
 <7f32eb7f-3402-461c-a932-66ba36399fc8@huawei.com>
 <20260206183436.3291c742@kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20260206183436.3291c742@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100013.china.huawei.com (7.202.194.61)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-92186-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shaojijie@huawei.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C20A10ACDC
X-Rspamd-Action: no action


on 2026/2/7 10:34, Jakub Kicinski wrote:
> On Fri, 6 Feb 2026 11:59:44 +0800 Jijie Shao wrote:
>> Sorry, I noticed that this patch has several check failures.
>> You may want to pay attention to this:
>> https://patchwork.kernel.org/project/netdevbpf/patch/20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com/
>>
>> 1.Single patches do not need cover letters; Target tree name not specified in the subject
>> 2.WARNING: line length of 83 exceeds 80 columns
>> 3.AI review found issues
> This is not public CI, the maintainers will point out the issues
> in the code if the failing checks are relevant.
>
> If you'd like to help with code reviews please focus on that,
> reviewing the code. We do not need help with trivial process matters.

ok,


