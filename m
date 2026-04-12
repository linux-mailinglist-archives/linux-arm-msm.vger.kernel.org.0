Return-Path: <linux-arm-msm+bounces-102846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFTtIj8W22nj9AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 05:49:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73EB3E2A1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 05:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCDF13008757
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 03:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700262D3ED2;
	Sun, 12 Apr 2026 03:48:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E131A6828;
	Sun, 12 Apr 2026 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775965707; cv=none; b=T1+D9cl3vBP7TzCks4SVdzF4vCTJMbKBjJTMKmcOTHbqURnGxqgz0Zn+w6plsgC1U8eLvJJSgaUA1xA10ainuRc21KAsAWFhk+5bh9pCZr1+wOtPyczeVSRVv+SLX6rYTsllR6hOxAT+Zn2Lvnqr5OI3C1+h5dMb9uB4TNwqR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775965707; c=relaxed/simple;
	bh=Shwe1898vRBh8CC7NQ/j/z7cBo75OO6vQGWWvCPe85Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCuZv6vUeCf3xyHpDJT1wxLG8SmVJ41AAPjegYQUnr7gJu7KhRfAu1pDJAaRE5KG5d8JM41gxzEsG89hfMTqm/UcE8e48d1fdukRz5cSJX7j/sZjmZ2BFhAzJ4WofMbXkgEJQIRWa95ZKU6pLsjNrze0WCAv3TMUVUffLxfNBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz4t1775965668te83a6abb
X-QQ-Originating-IP: qUAYpAzp+h5uzx9PSZQMQCkfZr6QGRT/gnzLBcy3tmU=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 12 Apr 2026 11:47:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4709009809936813395
Message-ID: <A76960166F7A473E+e74b8c44-c412-4eb3-ac13-ab9a8ebce8e5@radxa.com>
Date: Sun, 12 Apr 2026 11:47:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] ASoC: dt-bindings: google,sc7280-herobrine: Add
 Radxa Dragon Q6A sound card
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-11-14aca49dde3d@radxa.com>
 <20260408-pretty-poodle-from-atlantis-dfd1fb@quoll>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260408-pretty-poodle-from-atlantis-dfd1fb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N+n6UtIkOPCa+7mPMHsiXOG9eC2loerQlrRrmuH2WXJeQeRdVuIP+OFu
	NgyEkYYgYz5yPPEdCb82Mx6eAj2vqJBnPPlL8WMzzDrl0niu2VtOnO1hw1puEhlKlCF/HH6
	VXh0VC7mX+B2CL78A0FgRwkYZAMVghDO9Brovp3wfsVuhRSb4Q4baftHTebqjdHj+i6pqXd
	JgU5NPzaTKk0k02Ha+dcQ2TmMEui2X2iSXJFWH+nrR5+tkrYpbYAVDpmSmtw6amTiOha2CG
	6agOeTeVyrTg962HBviU20/JdX8ZAFsCs8ZcO0YY6fTd34WmuAUZAPJyAIWbrQphIUccmTs
	NGQh5PGVb0O+1MnJGCmUY3KxUzxBcpPmGMaHhLK/H8jmUA/CD/LozcMMOFkJg1cZ89O0iso
	jezXE8kFyPjChXgyg9BRa6GqU54t1kqVcSO+LTC0r616gFh+qX0p/XGr/2ekwuIIWqVaKaI
	zKfItLddtbcyvOPdP/iY4TRzu9w7HWDpMvGi0kjXaIHe/z4wjJRnrz7Qg/xJa9kcu6x6HHA
	QJJq7iN/5fuCavQprZW/gZajmQgfhiMJIFgMouB2nhI0LjOlzP9o1k9EAjyJThpIuqDu9xR
	wp9uI1PWRVNwUoWXXehHZQi+ShLxcfOTqNQdgJvLbBb4Ek8TgPivV1olRlFaFVm4ocMhycy
	YkWOqeAIrlVDEV+PiTn3aY2D1dSRoxq+t1m/8kGekc6dqWne8S01qEEAavrINFo5WgNKNQ5
	ouBv5d0wNPEuJ73jqm1b5PuB3yUddP1YxdCfLu7OZlYabxgQshubcAujYx9VVl56kbxQLNL
	9KbUQ2kO2YXuxWDCLYuATBlkNy2osLaWoY136Qia93hrmhcaT9TivjmMlKOcaNZ4C59Hil+
	eMKH34aHkWQ+O714cvKUt0kQVE9q9h5X+dWS/QsVWHIWGwkFUK48KLLzalCzSubpyx3d73B
	wAxMvq2qE/jKVNyM453ibiE8cD49tqh9nM/KNK7HNFbgMSyn+PEf4550y0uZLwaIG1a9ftr
	lxgUbyD7g3NFiU6FWAm7GKI3lfMCw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102846-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: E73EB3E2A1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 4:48 PM, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 11:20:03PM +0800, Xilin Wu wrote:
>> The Radxa Dragon Q6A can boot in EL2, allowing the kernel to access the
>> LPASS hardware directly. Add the compatible for it to the bindings.
> 
> You are not adding compatible for LPASS, but for the sound card. And
> since you mentioned it, what happens when you boot in EL1?
> 
> You need to post bindings for both cases.
> 
> Best regards,
> Krzysztof
> 
> 

Hi Krzysztof,

Thank you for the review. You are right that this patch adds a 
board-specific compatible for the sound card, not for the LPASS block 
itself.

For EL1, the default Dragon Q6A DTS already uses the generic
"qcom,qcs6490-rb3gen2-sndcard" compatible, and for the EL2 LPASS-CPU
variant I can also just keep using the generic
"google,sc7280-herobrine" compatible.

Would it be better if I simply drop this binding patch and keep both
cases on their existing generic compatibles instead of introducing
"radxa,dragon-q6a-sndcard"?

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

