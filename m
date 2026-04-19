Return-Path: <linux-arm-msm+bounces-103630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLKfDtbY5GkDbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:29:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB70424296
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA45E30054F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 13:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7424C378815;
	Sun, 19 Apr 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="DlS6c2nS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643063264FD;
	Sun, 19 Apr 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776605395; cv=pass; b=DqfRNqzBKJGHS8zNRUM4tC7BErpPsKdxiqAOfHHxoSknYNrbA1RIP4k9OHd7AYMwgl4g0VnvymSdUBcjArs8Umz32AIWcw8QOiqgwEzGIJT70nUpImERUJoAh8ar68OS45MwYG+3vMNLnq3iLZbm/0WS1aQEvi4hZPG+3/XkFyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776605395; c=relaxed/simple;
	bh=4Z4Wcqw7VDcVaplqu0BW77vSFI93Nn/Cayk4WSUUvis=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=N/NBFWdY0bUAbE3jtPMb7ogn+P0S7OKLzmTjXov0gBCityouDD/9+88mG7oEfD54APMbSQawWEJJ3XtG6eGT7qRAWtBRKGHpctwzOTWI1z5iWgqVWGIMginoM7zYf7LxVtLraSFX164ieQlSWdYmWTbcO2FTZz8AQZav5zPAISw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=DlS6c2nS; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 593CD920DA9;
	Sun, 19 Apr 2026 13:19:52 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (100-101-160-57.trex-nlb.outbound.svc.cluster.local [100.101.160.57])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2DBA6921737;
	Sun, 19 Apr 2026 13:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776604792;
	b=9muj/N7Ze2NuewtzKQNOPtzUb5DUPdyJhzjex2stFinR2C+lxprNisFXL/gkQaaBzaBiBJ
	JwtfydKyPZV4mWBOBZcE5y+Yh0CJ6zR+C5/R2Fa9BXziwaX88pg+Qv2VxboDdQF57o1hdq
	gZWF3uGO6/ZMeIq5Xkf5i8dSFpv7WQN3XilfQj9ouiiQv7cWlTyTu7f4QBvB8IHbdcmUtd
	/LyR7a5flVgBH9EJ8P7pyy1r0iH+8dlfIpOFsqphyJWLZVaDe7E9H2b8fYfo8sNfl6o8x+
	h90DMccbrJartcHt0zsA/FN9v/xpDJSUEtgP6PHrE7iX3Fz5j0ov/37QKqqCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776604792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6xNFPjnZXhlVOTlNwyTv/QJqMpXD5bnOXpRChy332Bs=;
	b=B6Ew9GBXJbGJv5GzoPoxPCZNQivlxU5SCo5ZsijVqMxinb4SZ2Fr5YjpAgyi5/CeGVeDvY
	qHrb6vdtNMpWcGX5mf8j8sJRhZNi5JhLn9M9awQNKJY6QfcHbvSwLs8Udy2hg53zP3FT3B
	EsJrDWiu1bu3YSwGGI8i96bY0l56mSzVQF3sbNCeC0fkGFWj82Tn31+KWSJOdjRTsggzk2
	Omi78n6Svn6sgrxGnXQ4snUeDZjnO3VNSZxdETQ5pSeDlIM8tMyrLcl3pdFPoSZO7wwEVH
	XGPLNh0hK4WD8a1oI1A4odnnAnDyZOmoB0tChCTt2IxSiAWa+0kUhKPNmLpaVg==
ARC-Authentication-Results: i=1;
	rspamd-5895b9784c-hfltw;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Stop-Little: 4b331d3019656871_1776604792216_2934851878
X-MC-Loop-Signature: 1776604792216:4247610514
X-MC-Ingress-Time: 1776604792216
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.160.57 (trex/7.1.5);
	Sun, 19 Apr 2026 13:19:52 +0000
Received: from [IPV6:2001:448a:c020:c3c:d097:d42a:836e:79a] (unknown [IPv6:2001:448a:c020:c3c:d097:d42a:836e:79a])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fz8Nc0G8FzyTd;
	Sun, 19 Apr 2026 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776604787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xNFPjnZXhlVOTlNwyTv/QJqMpXD5bnOXpRChy332Bs=;
	b=DlS6c2nSyZHacVndzRty1/Y6I6X2G9idreGv6AZx4WVPRocEH20ru4ErFlER9ODtrICJZi
	rwqze+YHvrUdjnn7ZdPe33KqzjaBB9aQ7+cTyvgQpjqRsu9zBJXqJfPJwv0Z+L3QVW/u/f
	NWDN5HILfhsJR3nPVwfKkHK1DeqIRcnhpjT5HpyHJ0CQVXKbbPqmODzuAkw/+8cOyUhjA7
	peduaPtdJ6i7SO30HO1FTG1ZpeEOBDTdP7fHJ6JK09XVi5Jtcs55us4GM+3/s7AblkBMYt
	gaVyuhvGKXVzJh96qPd9us0mBI1Uz+5lONFHkWMp2G/MfkPjkd/Oyl0RRPshJg==
Message-ID: <794655c7-b09b-4bd9-bed4-edbf1ff16fe7@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8960: add SCM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
 <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 19 Apr 2026 13:19:43 +0000 (UTC)
X-CM-Envelope: MS4xfA7QW+BcQYt2wlQj4YerYBTTS8O/rpkk8GYgo22cvkJdA2o7SQq2viRL64/s8WXzbk5FI8JYkX1gUu8z26yJrhUEWM/377AHDibZn700sQEI2XKk/8Hr KQq5v/f4StI8Lzn32Sw05cdmJIzVwY8wfqPRMmbLr3rKq5HX76RRXxsQLRrsa9sK237Ssw2VlDZUSRirXlyYkmEMBxHzBtjvBAJ6ti2c2x5vLyh+28dXg/9U /e/O0f4C5oaemTZpdiW/gPj7LDQXBd2n5Izf4ea2hK0Y6Gpaqa4wpf7brrJ+ccTWfeL/9DKsxYbPC5J4JHcSPoqi7EAd0pK9oSK2hnFAxtumXSKjPUfMdXSy eB6ueNWGZGruclMNsf1Zzd4Xha30NoixP0P0anazC6PROTmck/SFX9Cb54Vrwv6Q2DFCnryAVtptJyd7+Xi0lYWtB+BkBVxGyZ10ewgkZNn9hUB4YO2gAgQe mc9XAZNYad6FZVB8NpLtJpo74BgHD4Yq5ecRxfR3IWxg4tXCSdvKEARrc5JuWg5KoBP96BZYKgIkq4hTp1IRLjlYtSbwAQXIKrqsl6ex0keyUze68N1WikFI Yd1QHeLS5lcTrj8WNue0q+YBiPWub8/zqUCCMVHGxe+mbiJPR7DqJCJPc8CfgJQjrR9DvoEUe2nSJNeWMLwQuwrxseHSNtHP/+eipzaWV2zKpZy4hDiCWNi6 sNsf8CS1MmgDFfm8YJiRapV08K+XrQEA1zaz/MEO+rTMOiFkNTqPHzTbtp7TVVu4zv2HOeUYEt5uDmxNO8qfbaOjSDS4SDM5
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69e4d673 a=q8XfeKLTkGORBkIvkVRlwA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=gnZU6cfvFUOo9DJwXEoA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103630-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:dkim,smankusors.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EB70424296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/2026 4:46 PM, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>
>> Add the Secure Channel Manager firmware device node to the MSM8960
>> device tree. The SCM is required for secure communication between the
>> application processor and other subsystems.
>>
>> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
>> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>> ---
>>   arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> index 1d5e97b6aa4b..bc3fd55e524a 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> @@ -77,6 +77,15 @@ l2: l2-cache {
>>   		};
>>   	};
>>   
>> +	firmware {
>> +		scm {
>> +			compatible = "qcom,scm-msm8960", "qcom,scm";
>> +
>> +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;
> 
> I'm wondering if this should be an interconnect resource, but from a
> quick grepping, I think this is always supposed to be @ 64 MHz so
> perhaps not really
> 
> (please tell me if you know more)

Unfortunately I don't know either, this was ported as is from
qcom-apq8064.dtsi.

-- 
Thanks,
Antony K. S.

