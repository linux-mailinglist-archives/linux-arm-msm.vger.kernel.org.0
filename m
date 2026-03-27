Return-Path: <linux-arm-msm+bounces-100428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEUpNK7bxmkoPQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:34:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567034A352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 334C130771C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFCE37CD41;
	Fri, 27 Mar 2026 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Wdf0plUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D137C106;
	Fri, 27 Mar 2026 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639447; cv=pass; b=U63Rgrv2EE8VcThCLGUtjDTOTvfloIiV/BhfmzS+vec03u8WsmWopDOgITwk7vlnfGwolXET9atJSfiaHI1sYlJGU4GojspjkibTaWRLFe3rkZ9CYCoMzcTrnt+goswpT2YSCv+/nYvP+6UReKuGbwYh+T3QxN+RpVZkN7HGM+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639447; c=relaxed/simple;
	bh=PUSztIUro6Z3furr61dKex2o7Dkj57/lpaQYapsxrgo=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=Q8AKgT+ZzIrBNn3rzSIvsPl4CYmhJLSkMZH2Cr5HGDZXGVkRU7ODB1a5sCgDUREL8AjMpNJcnqE0ZZYUqmORVu7lYXcLmdrrB0LXViNFZ7l1cUCOGfMnHcUEkvWqAKJ8X5vohGkCg14S7TSRm5K23AcdHyPGzvocfSxbN+6HOo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Wdf0plUu; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 263467E2C70;
	Fri, 27 Mar 2026 19:05:12 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (100-115-116-28.trex-nlb.outbound.svc.cluster.local [100.115.116.28])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0F76D7E2F52;
	Fri, 27 Mar 2026 19:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774638311;
	b=IYy6h9DQWrd49d0CVwIqT44C5QI3kycncafbWAJWY+Z3vr9G2NA+a6BTTtKohSp1VRiR6+
	2n6QA1Z1Hi6rRip8DNNNubW+qZ0LAHJyFu7jKCGrG1+4TBoaC/p0f/Nrla9USLPJ0sqWNa
	yZkGOO2YBZrIdtVV6mTKiJterB2B1AEecdf+JxvhVUfCZnOLepL1Bj1YcVvCq2WGGAN21g
	ZHn0Kr4Koc9wYwTptQhtt23g6OW74E80DVQA99QmH5bZxCIf3vN7X4pgb4YRaBlw/qK5Zs
	cCySvIQat+nF/g/cKMsOfEQ8/ZSgL0ywjy2D4r8+SqijxFxgr6kPb/hfsJKcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774638311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=urdPlQnffPNS3930VfPP6NP1Km4+SI7i5jmZi3CfVKk=;
	b=tG8zTbNyNuUaGRYRPjBU7Lf4aGtmKmQ2N/v5N7t+8BbITjMBZytc+4hhOlhYfCbllgB0de
	TveTgL5tAzuiSgeINNRbvf35wY7kTBoP7wZU8q/JPlnh7bgwEyfEWbnkBFupwUo0/6RNO4
	KUbKh7TkFfwU5UnG0XLMTskuiWaXjPw9CVjjpmNWJH4EvQQJSIRuHNUWQYWfRFOeZqhmgd
	qXjxHLSiNA4Y0OshapotpBeEkS4Ktv5n9CxBkkWBqowKwPnNDC7U+TOXMoGRkXY5q8YlEh
	6K1lWAMiKM/5Fvlbq96IzwdSSXbd8xm0SzGbeGaaaHawC3Q4N5ueGmoLMWoSZw==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-qjg9m;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Macabre-Suffer: 198d6d775a2863d4_1774638311954_1497667489
X-MC-Loop-Signature: 1774638311954:1394827398
X-MC-Ingress-Time: 1774638311954
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.116.28 (trex/7.1.5);
	Fri, 27 Mar 2026 19:05:11 +0000
Received: from [IPV6:2001:448a:502c:4ea6:c47d:9c65:bdc7:d11f] (unknown [IPv6:2001:448a:502c:4ea6:c47d:9c65:bdc7:d11f])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fj97h2KWvz45pT;
	Fri, 27 Mar 2026 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1774638307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urdPlQnffPNS3930VfPP6NP1Km4+SI7i5jmZi3CfVKk=;
	b=Wdf0plUuMfPOMkAQ8glcvPYh0u0Ay5RfzoRot8m0tve4TeMPU70hSGao9EEcgAKCUq3sef
	P7/0qB5ZI1davWDmNDOreKp1uhI5Y/UTPlsNdkFDQi0Bv1TxY1AG9beTlvSd98WhZwQY/V
	4rbZoBNekOEw0lNUwKSSHXXGB34x9B/znl5saMKxSuXyIuLgmDIAuYFKxubReWvybvNacn
	K/WmTR3Rteqeh60Tl0urDcuuZDyYV2XIhOwenqPYr+1HGErz9xsa+G9+blQkquPcOaJ50r
	rCHc/2Yv734aLszpOg5rihBmJa2frJRvjaJO+nq1gZzcCObYoJijjC0H1NCbRg==
Message-ID: <c8e6166f-e9fc-430e-b290-a97c2aae2b31@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: add support for reading
 channel labels
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
 <acUIAh_r7mSfIiEB@ashevche-desk.local>
 <0b85a229-219f-4457-8fe4-bd4b3545684f@smankusors.com>
 <acWDMg58qxyeM5Eq@ashevche-desk.local>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <acWDMg58qxyeM5Eq@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 27 Mar 2026 19:05:04 +0000 (UTC)
X-CM-Envelope: MS4xfEqvzjXxVf9yColdO4Y7KOcvmc8GtclHktRL50CzAIt9ppyIjMjc6Hat3ZT3hjTIe6ygH3lR2eGRnHKjQg3M/Bkt7nfQAzADzw0eMsnGgmRnHsI7iAtw kuU/jnfOGvOzXF1vNHYV6dBFsr+cy5ZmfF91X9ni2KNGVhsGmCMhYWG1KiGH4LsWCEtwoeFxMRlJK8uDil+mDraCamHdTbL2FsgZZuZFIZZU5HAkn3DWAQ7B zCjR45Ajyni/IZPjPN49gqoLyGd76OzPdaSMPkPmOc18Trj3HVnsIHlM5Z4/XyNYnzYdZBLvMHQ7Rp8wEkqyEVQQL7N+PZo47HjZcLHkpLVktb0AtOvzjtE5 N6DMXCUzJWKwZ8lOPeLJMoc9mSTlx2sPlI1PFloa2W9Zd0Pu8FK/apwMHPoKoprsYIV9fTJnSJnqptyHV6G9CEXnny+3gB0W9LwS+ymbKub/4j5jq9P7lRKM xMCT28hoOxx69rKVWSqxWuk+LU5Fz5HT9AMjvOX7tSZJLLDhMlSOitR1B+wZCIfXsU7aztn97tvTzxwf7SR9uSVapew5+CbWwcM48m4pWrcQhtQ7eXLlaPqb ESN1p26xBUAXUk7EII5XFoOVEC0lx3jKGa5ITH0I4xBzTX8FFltr/4SkAvWkmGJcs8aUotGpUcbZsB4iiDyzJSzuk0oYSjTBh0N/B1cHfA11oEsofkLCRtfd +D0K7gitW3BBkx/9LhKeVdcmc305nwMbE0V+z9xdVvIcjWpN38J9gmMaxIZoqXc+DANKKy08ryM=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69c6d4e3 a=2f+13PdvnRQklfqNEF6FXA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yDFIC1yK4SsZJBJc34sA:9 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2567034A352
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 2:04 AM, Andy Shevchenko wrote:
> On Thu, Mar 26, 2026 at 12:00:52PM +0000, Antony Kurniawan Soemardi wrote:
>> On 3/26/2026 5:18 PM, Andy Shevchenko wrote:
> ...
>>>> +	if (!ch) {
>>>> +		dev_err(adc->dev, "no such channel %lu\n", chan->address);
>>>> +		return -EINVAL;
>>>> +	}
>>>
>>> Isn't it a dead code? Also poisoning dmesg with this recurrent message is
>>> not good idea to begin with (the user space will have a door to flood it,
>>> which might be considered as an assistance to hackers to clear immediate
>>> logs after a successful attack).
>>
>> Good point about the successful attack hint! I was copying the existing
>> code from pm8xxx_read_raw. Do you think those checks are unnecessary for
>> pm8xxx_read_raw as well?
> 
> Yes, I think they are not as the returned code should be enough to identify
> the problem. (For no such channel I would rather see -ENOENT, but we can't
> simply replace that in the existing code as it's part of ABI.)

Just to re-clarify, do you mean for both pm8xxx_read_label &
pm8xxx_read_raw:
1. if the check fails, it should only return -EINVAL without any
    logging; or
2. remove the checks because there's no way it's not found?

-- 
Thanks,
Antony K. S.

