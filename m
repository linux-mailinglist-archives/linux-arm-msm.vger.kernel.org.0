Return-Path: <linux-arm-msm+bounces-108912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HszCamMDmrG/QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:40:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AD59EDD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55587301627F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 04:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2C434CDD;
	Thu, 21 May 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="FYWZ+cnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0E36A01A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338367; cv=none; b=c8EG930+kbi1ev5np9Leg64zYypkdENrLq0PMJRtw71OAB6l1yprUxw7YijcV0ikjHACxaeO2v8X7LXto6TK8mxRpPBLIQ71rjX+KHe+LtqlyAfFQf4o53DhddShLFOHROE+3JGujxAu7EIoxaPjS9KDk6tHzi9h0iYceYT28Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338367; c=relaxed/simple;
	bh=qynQuhr2td5HO4aMZNbXY8KSW2cmUMU79ToINMt7Zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdvhI6CKIehyM5vkwdjKdE3hesS6IskV+LHNsnjRuXkOSNQbcPu4Vh0w8pb5ZGfylC91GAVUceR53ioRrZUSN1d+nlAkGo5BhIlqBEGTfhRdKMsDRtGwu6a8QrAVK5uK9mFUkkOlhXariSK2iB83GeuyGdVQ0mTsFfecfdDgKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=FYWZ+cnQ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <1f659806-bde5-4f8b-99ef-339f680bcf65@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779338362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOIC5lFHEmXyRzFnIMJxxDLSfJcJuQc8tWENTkCRR3w=;
	b=FYWZ+cnQ1f0hdcDw44jC85XPHBTY7jJKnM6pxdaCWRJqpwL9lAwLLmHJLRSrPBqaYN9PMG
	bCdToxPBXNY9zJL3mXbtJ28W+JP/JvSqVNd+gOmSIv0MY1CsTo2QACCyzTvg9PdJvQMG5x
	pp0oniIXuv5W7FryKWhNXdwl581O7vhvbugqBLn6LK3eAdAtjkJnnjfsGKDMoNE15EyGVB
	DYZoQjU61xr5IoWupAyYUECYvJzneEtKpwpyD7p92qUwz0kfxI/uP5fISFiUMIXqDhWGQ/
	98RZivDA2kQiO8WXG4hVMosz0vDQDmPqIu6klPG0QRU6He5pGr92ON54NDTCvA==
Date: Thu, 21 May 2026 01:39:12 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT
 maintenance
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108912-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:mid,packett.cool:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 950AD59EDD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/20/26 10:09 PM, Michael Scott wrote:
> Four patches:
>
>    * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
>      today on any board which registers a usb_role_switch on this PHY,
>      and will become reachable on more X1E boards as their Type-C
>      support matures (patches 1-2).
> [..]

Thanks for digging into this!

I have successfully used automatic role-switching (even switching 
between USB2 gadget and USB3+DP mostly worked fine) but I do remember 
manual sysfs switching causing more issues..

Would be great to see no more dr_mode = "host" upstream. Though I 
vaguely remember some objections related to booting from USB (?)

~val


