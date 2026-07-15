Return-Path: <linux-arm-msm+bounces-119154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kLpZMk8rV2ouGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256A475B225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=rZm0u0TU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BE7D3025707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CE12F1FDE;
	Wed, 15 Jul 2026 06:39:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19003126B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:39:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097546; cv=none; b=XGIH4TqSuXiE03NYDcaOxk7ZDrz4u1hstDCiu4NpfSAN0UThAVW2YgHvE0VntrQyYLj/or3wCBM//Sqt6/dyJg5YEfQWTWWGwOSj9jTQz8k4Phq4YB7umXj0qf+VVi3vqSsMumXVXP0XcAVClj+eUL/XobUYdxk3Qexr6A6u5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097546; c=relaxed/simple;
	bh=xMr/202VPSLUku89NjyrrMJcJ4+vAjRw0LAGM1EznR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=O8yzWEee9XWRYftYIGEY8J3ZkjNo72XZD2fHPK8/IWHJ18yKhTUf/N+bQvDNOq9aZVqjp8dD8nRlhWM7x4HAOhoAFHUtWm1h8bIgmQIT9+hZHBarmCVMgtdY2NErsmqlcAMAgqrf39Ws6HPomm4x27S/5WAZAoYJQBRLaNcnPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rZm0u0TU; arc=none smtp.client-ip=210.118.77.11
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260715063901euoutp012a7564c21645e5fab59ac5b3cf912d92~CY0MAbQJ20579705797euoutp01D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:39:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260715063901euoutp012a7564c21645e5fab59ac5b3cf912d92~CY0MAbQJ20579705797euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784097541;
	bh=QkIx5HxAGLBRNJ/u+bxOfaKWM8km5UQDkUuQ/qbWx8w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rZm0u0TUVeuWMDh1jB5qpJPX96mVS+ZsTLoHkct8uwfZ7LQWoc4uMZVSGJR9syKSs
	 QTIUF+5B0nBTc8i7gGrvruhyYotlVx7TnvEqky6QLm8fTTCbKTrvwiQf9uNG97wRk+
	 57pCrAi5r+O9rLWFnyj1CWSOkITJgz5NkjIrLpVk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c~CY0LqDzKi0392503925eucas1p20;
	Wed, 15 Jul 2026 06:39:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715063900eusmtip24c15585bd6a665ad2131db656f6322a2~CY0KnnnAY0426404264eusmtip2S;
	Wed, 15 Jul 2026 06:39:00 +0000 (GMT)
Message-ID: <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
Date: Wed, 15 Jul 2026 08:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Marc Zyngier <maz@kernel.org>, Sneh Mankad
	<sneh.mankad@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87ik6i6i22.wl-maz@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
X-EPHeader: CA
X-CMS-RootMailID: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
	<20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
	<87ik6i6i22.wl-maz@kernel.org>
	<CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.15 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:ulf.hansson@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-119154-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,samsung.com:from_mime,samsung.com:dkim,samsung.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 256A475B225

On 13.07.2026 17:11, Marc Zyngier wrote:
> On Mon, 13 Jul 2026 11:25:41 +0100,
> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> @@ -68,8 +68,8 @@ properties:
>>          - description: MPM pin number
>>          - description: GIC SPI number for the MPM pin
>>  
>> -  '#power-domain-cells':
>> -    const: 0
>> +  power-domains:
>> +    maxItems: 1
> What makes you think it is OK to change an existing binding in an
> incompatible way?


Ulf suggests that this has been modeled upside down in the initial
submission:

https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


