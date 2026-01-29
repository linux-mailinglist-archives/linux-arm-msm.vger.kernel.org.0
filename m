Return-Path: <linux-arm-msm+bounces-91181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBKaO4lbe2nXEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:07:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D77B03FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B5D30107E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F42D385EF8;
	Thu, 29 Jan 2026 13:06:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185F3358CE;
	Thu, 29 Jan 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692009; cv=none; b=UvJOModZDwKyRcTZJPw1tRk9jJ7K5DkP6eaprkTxxRUyYIKbqwNg3tKyfBq+FcyLkSVQe02Yn5kLwKO/KVmVPOAixJp8bupsUIJNALEAlxL7FDiHiJr6pP1X01nM9JNvi8h19kuXkTX2yCj/Zff1+PmgU0CjxAyZ26TIfiYLa9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692009; c=relaxed/simple;
	bh=4zvRqhRiMCup6EoT2ntBAuuubr6FQxYVeKjSdVPsOD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJ7kAKHrO3yEWlfeXvFhiLno/sfNrSdsFr3oRwh1M2f0aCnAKElhN+XhUE9GmVByT7fuyrObPuWALNrPi7agjYvh2Z2IayZ/Ej6zdSiMNnyl1WLyFKF4j3isJD5mAdpIDjQxGMATIrNYL0GYc8LuEjhIt/o0dqHKT5a2awf7Jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz4t1769691913t366438cd
X-QQ-Originating-IP: gz+CZwWd9plegMHqHSJgsZdH2WQTASPPIlBKPKpeCCc=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jan 2026 21:05:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9450623713281733181
EX-QQ-RecipientCnt: 11
Message-ID: <B4C4E86D6B3966B4+c6e5887b-f61a-4425-8608-d4dad52fed69@radxa.com>
Date: Thu, 29 Jan 2026 21:05:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M1RocC0a9oEUB1s3OPAAUNbmd8ZddQaz/jHhsiI+tPTnRw4OoAtcHyPz
	YkYT0Ffk/BWfrzcFyyO2swPu4xsi7Gjev2UpQpJILwzcdmfDoVNAwFe+e/SV9iNmaI05dpI
	aurbkzNfUe7vWwX8ZJlfdvDixAQSBIl+sobi+y8vlNdQtDZHwrGEj/ohui/C7F1jiJ6ghJo
	3VnZRcKl9t7ZjbYh8krcXFXQH0uBMiFSFBS2smTr+Uf6fe47JENasZ8IcU0qLQwE3zUMBo8
	nPenaFlJe3VoSgCNCxFkJJCPIJfeUPphY3RvahCfF7h7CHB1TyVjliyWnbriSSSmKPgJZ5I
	IgqwjxQHSoJud6NKVwlL8fHES08GOJur6eIZHce9egoTjk+Vj+ZK16gZGtHRRiTy9sKOmuW
	OwLSEN+FNmMIPbN4UoMvXMu9+tG8kXQg9AXpzMGCETWQo8BYMDYgnw4Qjm4UX4xEadBqUks
	8fcyTtbQ2tYRf4xBDVhD2rrkC9tABOMGSfPSy4TQlsuZ+6EnAL2zBncohepIFqWkfCiEPru
	0zok1CZa/rIpppwvxuhK1z9XSQ7EUCXzLP0Op9mfjg2GQQPiYVMtvxakawUtLZP/ivQY+z4
	1PrczJFEbs9CJw7WLMQfnd7xfQ2i3AzPoH6hoU+MuF2QwVHmUoqGezVWM9Ra/mL0ykbkji5
	RQ40Ot5HoCtk703QW6FYtCupP5OnsG9LvYGjjuqqR8vXYtcMe0FVNcqYBZn94l5Q/4sw6G2
	fFBEVgwWioYXRWuCegy8xTJfKFCpHTnIAfDR/d/XGz122m9Qk44FS/mcXMSBLdvpBIKKMgs
	rkeCqFAGB4sl0bTQ8C5il/QE2Vh0oBP7qYvNhgwNrL+xqzrXiXV9fxsT4vCQxHLJXvpli7G
	tE7GLha4HFndDHCeZ9Jk7ha2u/6N4G9cQ3U3cSXPZSx+tzoTwrQlGYGTx7JdvMMeBy9V+MM
	JPtTaJyl0ibFgyF3UScGQ9QCPW0L6vchR2YLnSdc/beH4cYZu6LATpGV4+YwATkkWlolZ3b
	Dy16k0mI30yMLRFs8rdhe/V32tP14sFDsmTgmSff4ENQ74hZKg
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91181-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:mid]
X-Rspamd-Queue-Id: 79D77B03FF
X-Rspamd-Action: no action

On 2026/1/28 21:26, Konrad Dybcio wrote:
> On 1/26/26 12:44 PM, Junhao Xie wrote:
>> Junhao Xie (2):
>>        firmware: qcom: scm: Add SCM storage interface support
>>        mtd: devices: Add Qualcomm SCM storage driver
>>
>>   drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>>   drivers/firmware/qcom/qcom_scm.h       |   3 +
>>   drivers/mtd/devices/Kconfig            |  17 +++
>>   drivers/mtd/devices/Makefile           |   1 +
>>   drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>>   include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>>   6 files changed, 481 insertions(+)
>> ---
>> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> This is 6.19-rc7, please rebase on linux-next/master (the series
> doesn't currently apply because this base is essentially a full release
> behind)

I will rebase the series onto linux-next/master in v3.

> Konrad

Best regards,
Junhao Xie



