Return-Path: <linux-arm-msm+bounces-103223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CkRL3Ob3mlrGQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:54:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D63FE26D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53928302AE0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8056C31717C;
	Tue, 14 Apr 2026 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="TiqLUims"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD82940D;
	Tue, 14 Apr 2026 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196442; cv=pass; b=e9TLVqcBYk5kFQB6QXEB5UpCTWI276PUPg83wnTq/9q3Buzmy6NmuAGPRjgp63yiSQwa63dpVvPZj2rrFhVtGLqVcK1hng8LM3hAvALLk7S3kU/T1caopC/+mAiXwqMSMOjgvBUTWklgnaAKDTg3owjhVE74sVsrjp1dlF1XuO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196442; c=relaxed/simple;
	bh=7WvCQGE408M/tjCa20yqORMpgf4xuI9KFcOmldx34cg=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=I1t6yUFunajDmoEKohxp1rQI2F2l4vQV+MCnhV1xn7m0AYx4WV1YzIR9jgLDRoG7tlalm5QfCQtxTmhB2juQrt+t1GuyPZxBHpnhywtq8s6Hvg/3dnX95MNIfYNm06SiTpyMVD/FZgBXIp1JNdjPQXDMyMj49Hyz2mam+BiOBHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=TiqLUims; arc=pass smtp.client-ip=23.83.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F161F1831EF;
	Tue, 14 Apr 2026 18:34:39 +0000 (UTC)
Received: from de-fra-smtpout5.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.103.3.248])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id AC0F4182857;
	Tue, 14 Apr 2026 18:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776191679;
	b=h0+Wl09r4Jb6ElUM74yB+1tLtwdcgNjNj8Jy/UQo1qgEHPyP6WyHmbEwZ3trXuKuFa5fa6
	y5r6wJMwmq9jSt3E3DaeLWi35HmBvujI8YaYPXuTOuPQ4EDIS7KglVcEIpioUcEPl6gKAi
	O6f4hQAjbVMaw12EY8wGPeuipFn6VRXVlP6IkIMOLsU697JzOlywe14UFo6rHR6vr2W49J
	OxTssaKQJujNS9V/D3wQW0ejFUsYnE0uecqZbvzUe0FYTXoQ1qcNpsqVJCAoX21sHT0xOY
	wm5XlOC6O10DF3pF3DP+cF+MFd7NjNxcuUQ6JittK/UYNh2eM0d3/bQBdPK1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776191679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gpgfN6DbbDYUoEv7FYmkdpMcaInCHwivEUU7GyF0eLM=;
	b=L0bR/UzySDbrGOyB498CtuPT5hI5ZHYxCSUHK3SsmJlIPUao/udZWO6X9pywvdYI/YdKsw
	sf+buFxzAfTFvVjh+AHWU2O/EHanZbbGMj+NvhJAdQ3KIokpc2G5p1MmwZv+DluvwRuuYx
	FW/Go9vvdgpSOZ/ZmMowhK175IXXmjouD4YXBKSpQgbWIme+ndc13n00sUA7Za7ODvvI7W
	in/WDhtxwnKgwdhs6fUHY+xVDufrvywOGzvVAF4uNHh1cVg5xkvInTFe0RHbXXsBKM9cVN
	UhmUf7hdeqLRQyYABaRBoXwkvR0Hrcrr14KFKCaR21vhQjJZVzSFcP/f4ctpKw==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-rchfv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Shrill-Name: 0adb92150e59946e_1776191679731_1913615334
X-MC-Loop-Signature: 1776191679731:899577504
X-MC-Ingress-Time: 1776191679730
Received: from de-fra-smtpout5.hostinger.io (de-fra-smtpout5.hostinger.io
 [148.222.55.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.3.248 (trex/7.1.5);
	Tue, 14 Apr 2026 18:34:39 +0000
Received: from [IPV6:2001:448a:502c:8e5:6024:6b9c:479b:4913] (unknown [IPv6:2001:448a:502c:8e5:6024:6b9c:479b:4913])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fwCc13MLZz3whZ;
	Tue, 14 Apr 2026 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776191674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpgfN6DbbDYUoEv7FYmkdpMcaInCHwivEUU7GyF0eLM=;
	b=TiqLUimsTKiadMsavCPlO5yr7+MMn8SzYzZU+Ha6/cDfpEW7sCuJP7hD1otRY7zcx7oB/i
	GwR9run5jQynuQ5tHWO7arc3sdOGIoDoAlhZE/p4YDXDqVCJyDYoAYMqAkgA2keMWJiA8k
	fTZqJkhXJrwemECd5IQuqKXabUp2sIIrKdxVf1Wm5mvrPfE932OEZcUEmbLV5aMVE+yuve
	p8hiyEC438c3O1ovF537qLCACLwgBPvnuRFF16+aoqh2AJrmafzQ6nRF3VRBTkvwoTtgzK
	kbV9MDUauDtcWrh0ThDKF6heVwUkr0K0Ti92ryOeY2n9PMqzD9LQSXC161JX1g==
Message-ID: <b80727eb-6a7a-44fc-b6a2-56c4ee199b57@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
 <20260414-frisky-aloof-koala-4cbfdb@quoll>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <20260414-frisky-aloof-koala-4cbfdb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 14 Apr 2026 18:34:25 +0000 (UTC)
X-CM-Envelope: MS4xfBKezBSY7fb3Vp/z4ss3b8AATAJnxt4KmDCiBy6XWl2DdgQ5thpoo0Vb8aKy4BzWav9yaSbDfzAift0d+S0MVFJ80uj4ajC+fvgMmTXhEBCIALUQ8zoq wG2DTv5dzAVTT6vvBrW+eoqII2DyEgLo/MQj0q+5/dRSGaDfuFKBsZEoANRi7Z5EhblLhX7zMqUFYM3CMnZqiYPZ4xBOxK0vpzFvzlyN8xaWd2q75S10QIH+ oa1aLHuLsfg9ka4HjFfPEGDvi8+2Qi9ZVFJ05W8/tjEO1HeiaVaLl60jxIe6PV04xwMqfownyd59aYJBhy10BJS+XapzYBZpxkKlzJV5nXPYX3rAKO5AFnyd clXXHEKnTezcNbOhmAdB0h+z2PMDjXQOymUiDBQg41q0mSG5acTLJJ9OfEdzUtWoSAICgUdUA9nX6zl/whbzJHAwBkHy/mL6KcfytfyYsuVczGNSMj7MiU33 7f8afMyuDCm5eAg/SyW5ruve9Nk9HKNvuAuxy05mav2s/4z1Psn2uNT+6G90XnVNOlVX5fCoL7LEg3AAvg3rPLpsoKjRi0fsTaB4/uYu2uEBo2CBvek/pwkY yrquNvPfeYhIEu/rr6WQDyS5xyzLraNoMqWzzu5hKGYFtFw7aHAYpENJh8IiRbPOlY3yk2p16hKELDGfJN0eCbJwBSXd9pfcAl0UMAwl5WwzgNROhKS+5YVH lgcUBfMtqp1mRwKS/2uTj8jNUOVOdXRgtk8HoAgpXJJ5hXs5f2hs3A==
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69de88ba a=1gsgM/SS/RpV9eWVQt0g8g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=CFQ6Js25d_d4tH_QHGsA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103223-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 111D63FE26D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/2026 2:19 PM, Krzysztof Kozlowski wrote:
> This was also sent. Where is the changelog and versioning? What changed
> here?
Sorry, the cover letter should have referenced the earlier dt-bindings
series [1] and explained about it.

In this patch series, I combined the original 2 patches into a larger 10
patch series to make it more complete. Especially since earlier feedback
noted that the bindings were not used by any in-tree consumers. Since
the scope changed significantly from the original, I resent it as a new
series rather than a v2.

Would you prefer splitting this series into separate series like before,
for example:

1. Dt-binding series:
    - dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
    - dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

2. Enable wcnss series:
    - mfd: qcom_rpm: add msm8960 QDSS clock resource
    - clk: qcom: clk-rpm: add msm8960 compatible
    - ARM: dts: qcom: msm8960: add rpm clock controller node
    - ARM: dts: qcom: msm8960: add scm node
    - ARM: dts: qcom: msm8960: add smem & hwmutex nodes
    - ARM: dts: qcom: msm8960: add smsm & sps nodes
    - ARM: dts: qcom: msm8960: add riva nodes
    - ARM: dts: qcom: msm8960: huashan: add riva node


[1] 
https://lore.kernel.org/all/20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com/

-- 
Thanks,
Antony K. S.

