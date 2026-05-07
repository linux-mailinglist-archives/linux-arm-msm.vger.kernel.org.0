Return-Path: <linux-arm-msm+bounces-106447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEACEKek/Gl2SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D38604EA62D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FFAE300D4F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7367E3F7A99;
	Thu,  7 May 2026 14:41:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952012BCF45;
	Thu,  7 May 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164896; cv=none; b=jhKK9zUcxYg/S2FFb3a9h5jNq7RXRrlPkZ8POKZDiRClBasJJ0spuZID/v141y/zlrE6RboAZ6uWBDDdHn5RYQMo4XN4v3z6vFSWJ//RNfqJKD1kW9eEixWpKhHejSdPPH2wRGtwr9Uf0sTwxtAwdKY0R+SGSgZMJeYGOVQ7Kug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164896; c=relaxed/simple;
	bh=/G82ZJL4fq2pASgXTuyCVa+jIlQEV9GO++0+SDVahxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+mrdpJudRZ1ApLv0N1kLdW+fQF2O3w8w6XzAejZsTAENGLQNY//kwhrMror4onTvmRptTvMk1w4faO+zhF56Kne5/HskvoEyyDaIA3OikrAJ+ak1By+sk2jur3SMF3MFFPH6uKDStWLYyBXkEjtg2o7P+UmzgxXD6pQII9hUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz5t1778164874t66b1fb6d
X-QQ-Originating-IP: aKRevdUM0KQMFsPUbirQ5dYlgvsyW94yod31K7p4GOk=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:41:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5595070006359918145
Message-ID: <27523595C5577AF2+57a3d4c7-0b67-4d20-88b1-bf12b128c191@radxa.com>
Date: Thu, 7 May 2026 22:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <afyh9nOoTT4wlzaY@baldur>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <afyh9nOoTT4wlzaY@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NM38xWL3V9gjUsCK+zzb7bkbAtayQ/WL5rBchvlw43O1uHARr7MvET2l
	WaY9PTEkPhuOmS3NprHjL4Ip20bz+QmcqeggTjYKb9kh5kH/aVyLqDIXG7mnIWKLYDaYFB5
	xNBWvSGmvGe8CxCtJwTjdjuqUaWcoVWf7j63YiILiTBgcMs48nGKUP1lKlY7WLtWxpCnzOi
	B2YEfGUiAvpqkHl23ymXJDenbNzWnB48xV7tGjzWkOd45aO7IjhrcgFCgdFbHQ2GA1bK4fH
	l5oi9wh5FD5b/+Uck7LLuO634f/dLVmQL/OAG7lkW/3aV7ymHXPMPPVSOoUSDvdWc7fDk3+
	0ccUc8+0tnvfxssH7DNpKp/A5LK3wUimOp5A+bmEuC2ZX6e5q+Zm7BBl1hqWfW4yXmjOJxu
	QCnzh+kAicAIbIZl1gR/97WAQgks7++dUTx02LPWgaZfmAENmaerffp8WcDq9+f84NupQZK
	TpihZ16VYtuYfaNdeIXaqPzXXVQeXB9xjExsaRHRoOa91CFC3SLRMVZunzclLKO1WDA3Q1G
	IHmbpML3PIRd+B8w6aam+RELJQKyyZLQvXjmGcL+BaL6U4UGtWWctSTyOE2FQDN5vqDgMxq
	Twj6KAFjnVrq3hSQrVmO5voC/aCqEQuF/iz6/irJjMBF2nZKz6uqC/Zu63cKk0RGPqky93t
	v+sYq+FA+xR1FQNEnb0NkybDHHrI4BIhD4SQv3zQGYT8eoqTLEsJQwlwNL1velZSq02N/UU
	sVoEPcGvxSuGy36ktn7rAcHhUJdBQ+qF4KsmKUEBRnI8+4Dvb7LN+0ebqN/Zue8CYJssN0k
	8vlfRxfxqdq6D21diTq8diezLNF+KPpqeKbaznKAeDuowZxx63VoTvR5OPbAQrxuaofuueE
	e8RLj/bJmZPCiOzoBYm1FFyacSK1VvVj8lUg7Ia/wxZ9RbytLJW+ReqHgnFJ1FYyJQIGTuW
	qTDimP0j+SDVRLQvi3y2ACZ1wa62+4Ya4yvwR6o2B16SjXgEixyOl2sO8FGW46tUi/FqnmL
	OSLGR9kz/zGePwLu5qN4HHbxkzmepxeKp5ZsJEmkWOG7N5CcC1dMi+EfwdGwI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: D38604EA62D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106447-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Action: no action

On 5/7/2026 10:31 PM, Bjorn Andersson wrote:
> On Thu, May 07, 2026 at 10:29:24PM +0800, Xilin Wu wrote:
>> Flatten usb controller nodes and update to using latest bindings
>> and flattened driver approach.
>>
> 
> Can you please confirm that we survive a system suspend cycle with this?
> 

In my testing, s2idle works fine. The testing is being done with 
clk_ignore_unused though.

> Also, start your commit message with describing the problem you're
> solving, not by describing an action.
> 

Thanks for reminding me. I will fix the commit message in the next revision.

> Regards,
> Bjorn
> 



-- 
Best regards,
Xilin Wu <sophon@radxa.com>


