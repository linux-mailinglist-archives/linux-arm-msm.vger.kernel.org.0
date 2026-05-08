Return-Path: <linux-arm-msm+bounces-106613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAhbMxKx/WmlhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:46:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4C4F46BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C45300E70C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA2732E128;
	Fri,  8 May 2026 09:45:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC335E95F;
	Fri,  8 May 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233550; cv=none; b=r9KqFn1sJ0Vcuz3vJk6HkYFjV7tWjfaK8nh0ZAys8hUa1T3j4aewjILlAM7jpf1oIfBoCVe4sMB5wG06UzG3gh6xI8XKQAljTQXPih8tHUxixoyyijda57b3B/C/Mf6fEw4VAdEaZVlvVirKde0RK5/c70dM6sME0cECTGHZPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233550; c=relaxed/simple;
	bh=yD5mv6i4XMyQskiJ3T7ao4rCkZieXYZR+zBpBWzxKkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kv0He/SNhkf2Fb0Q+FDTKWH8aSoK8gcWRBsc31XwUTXIGRTg1yV0xQAeC+SNlGig7MlLa7aN4yhZEWFpw3Tbeo9xmjPO7KHzO8kFBZm77UaE9WZpg4b067RVmvd791GpREzriBcbsm2qcLI7p80M/iAliVVlkL4qWshnhBBbNYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz11t1778233516t88494dd4
X-QQ-Originating-IP: FYDRL9+aHSkAoSrjKpeQafotodHwpkqzbik6NOTWWAo=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 May 2026 17:45:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6858079310630328061
Message-ID: <63E2E0FAF03FD04D+90daade8-e129-42a7-9ad9-ef9394a8b00e@radxa.com>
Date: Fri, 8 May 2026 17:45:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add missing
 qcom,non-secure-domain property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
 <37b80f4b-4824-4e03-b129-b0687a6b9023@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <37b80f4b-4824-4e03-b129-b0687a6b9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MRlJlBnjh5AJnR186AzCI4uWfKj6dTbj96QEngsoA6H2rMDQ1pbw+uOz
	1DzTX9+irq2fbR17JzE/IJLGwHrWy67reLfPO9bnetGpftmIcSeNb9wltH56+Le/Fh1JlZa
	VIQrWV3/fxGeRJD0lWfY7W+fAzd0KOSUlHkApkq+Qq+DyDVnzxQij1+U7Nm26zUoT+U6fvn
	96ZgOvqUh/9a/effrhzHsM9ORQhSQh/5T/ZpSzcj/yzpvGxw95mvb1Vz+wiTHe32jUMc/VF
	zzsM8lSO/aHmWJaxgvsl0w2AKG/BgcSzrCsCzukYRaxPXpTdDdv77p0lHFz4jRZCh7eUBX3
	rqZ7SC+mENh4FR20806t4iQ7cqg+BqPkwxBLEtPxcW8mDXq38jhiAKf7BN5mhVqs0Neg602
	spXk/8Ax0a1ZUPg+oeH+eJ9WqHGkqnmnXKnVbLqhde/7v24uZ7mTKQcthTB25xq76Han94X
	V+2bwj3dSMRG+23Hqce4NDg/SpCgIrqAfJb1nJeOcuxYVrnuSMlmj84PK1en3g/NG+XbvuG
	MelkxDhYg4yq1eKVB5TmSV19fKbOWoQANhle0IYjFPndfnhM6aKEgdh4y6/4z49sYOq2CJ/
	ON2MjWzdxvJYZnW10GpfNdxE4one3CUdsyTl7SXDqm8ki+LPmrUQTlOX/C9Nud2MvmZ45cz
	UWmmcZ99DPfQ6ksmlIGL8DRcmCb6DcFic5/rLxAybon58XB7NtbGe0owfyhgkEpH+OzolWU
	PzFTngx28LOLbTAk29ZEOjE3LhwJp4iVB0hOc84F7QBmYO8+xVnmMQive14e1B1ZExMyHAi
	753+TpXWc0EEaCk7lDm3TRCMNdyumnhukoOxzfRGomPCgcfwqOAKWF6Zjc/+SlFFqZy6yJt
	g8L670sC1xvEWsbhFPBUjJ9ZdlkFj1rSiKbJ8Nh9+Hj2axianPzXOGw7MJtUFTNUzDFhLYU
	hxxaqZU1zEKgqkr77gkrE5jj8HBUuQrSgKPvgfMbu7O7i77ZfeaUfHQVJagpiHNbdmUKNIJ
	4MdtcPPw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 71D4C4F46BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106613-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid]
X-Rspamd-Action: no action

On 5/8/2026 5:40 PM, Konrad Dybcio wrote:
> On 5/7/26 4:54 PM, Xilin Wu wrote:
>> By default the DSP domains are secure, add the missing
>> qcom,non-secure-domain property to mark them as non-secure.
>>
>> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
> 
> The CDSP accepts both secure and non-secure code and the driver creates
> both "endpoints" regardless of this property

Yes you are right. I guess we can drop this patch.

> 
> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


