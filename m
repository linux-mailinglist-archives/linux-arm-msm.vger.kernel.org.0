Return-Path: <linux-arm-msm+bounces-91972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MComG01nhWknBQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 05:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA17F9E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 05:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A14D7300DF7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 03:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09802335096;
	Fri,  6 Feb 2026 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="OYcNyfmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40D334683;
	Fri,  6 Feb 2026 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770350389; cv=none; b=lRith2v3JdNRwRvJe3lclhOkefDe3Xq5KPCPSecmRwHkhP2fTQKfzt1PXl5oWbpc6ZObM7lFCl9AQWBm6g1zIpGdv6hnSD8mLDRcuo5aLBQQylcS2J9rrxQ64bZRz+KlLj6FgTh745igMekO10X1FRgnOJXe6V2IzoDDmE9y2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770350389; c=relaxed/simple;
	bh=8txVc62y45mnh6DZ/FW9IrBiVRTDXecDfLRtWXzfji8=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j0FAgk42u4/BIRIb+FgW27kci6UDyqOkOy8EVqm//gslObfebonMuTWoM758oVBD/8P2ca/qaqvJtn46yu59Ir/wjDM3NkChjLOXRoRtaoyx7xe9IR53fnyW1EakHaJMiIV62uE+7cZuAnkDlG4Y08gpuLuA21IQGOONCcvoVG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=OYcNyfmj; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VVcXhUeq2JWenKG2PzSQIyudZvCgbAuRw9JlOE4QrEo=;
	b=OYcNyfmjjbZKvip2i+sCGsa6pVrgYNRXNlO/XCsMjXHNPcVgtghsRqFEP87YuWofuWpl6Outi
	D1G8j98VyZZ+fWnI+9OxvomSJgniU/p8femt+af5ptTLI218HFqy8Sr8jnJSxe1vWQAsXEe6XuD
	Ce2k76tyhRLX2zoqJ/cVTOM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f6gGr3NwgzpSts;
	Fri,  6 Feb 2026 11:55:32 +0800 (CST)
Received: from kwepemk100013.china.huawei.com (unknown [7.202.194.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 47BD42012A;
	Fri,  6 Feb 2026 11:59:46 +0800 (CST)
Received: from [10.67.120.192] (10.67.120.192) by
 kwepemk100013.china.huawei.com (7.202.194.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 6 Feb 2026 11:59:45 +0800
Message-ID: <7f32eb7f-3402-461c-a932-66ba36399fc8@huawei.com>
Date: Fri, 6 Feb 2026 11:59:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, <linux-arm-msm@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bjorn.andersson@oss.qualcomm.com>, <chris.lew@oss.qualcomm.com>, Deepak
 Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] net: qrtr: Expand control port access to root
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Manivannan Sadhasivam
	<mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>
References: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk100013.china.huawei.com (7.202.194.61)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91972-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shaojijie@huawei.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DA17F9E06
X-Rspamd-Action: no action


on 2026/2/5 16:21, Vishnu Santhosh wrote:
> When qrtr is loaded as module, qrtr-ns runs from SELinux kmod_t
> domain. On targets using upstream SELinux policies, this domain
> does not receive CAP_NET_ADMIN, which prevents it from binding
> control port even though qrtr-ns is a trusted system component.
>
> Granting kmod_t the CAP_NET_ADMIN capability in policy is possible,
> but not desirable, as kmod_t is not expected to perform networking
> operations and widening its capability set is discouraged.
>
> To address this in a contained way within qrtr, extend the control
> port permission check to allow binding when either:
>
>    - the process has CAP_NET_ADMIN, or
>    - the process belongs to GLOBAL_ROOT_GID (root-equivalent tasks)
>
> This permits qrtr-ns to successfully bind its control port in
> kmod_t restricted environments without broadening SELinux capability
> assignments.

Hi:

Sorry, I noticed that this patch has several check failures.
You may want to pay attention to this:
https://patchwork.kernel.org/project/netdevbpf/patch/20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com/

1.Single patches do not need cover letters; Target tree name not specified in the subject
2.WARNING: line length of 83 exceeds 80 columns
3.AI review found issues

Jijie Shao


