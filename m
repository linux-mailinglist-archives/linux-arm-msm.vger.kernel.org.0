Return-Path: <linux-arm-msm+bounces-105042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGcwMjjm8Gm+awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:54:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9670489672
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFC6C3101141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C2647CC7E;
	Tue, 28 Apr 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTc8psaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0Y+5eRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2DD43DA3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392858; cv=none; b=BZW8DZnko3d1aYVbL12bzpZD0l9O8+zqTqtK4TB4BqTy+KWlOI+/ftXpLSkedT2KFTk6yV93ZwYT+H6fhH4wIoh8HHA/Pc+hrHM+gJ0NqZ5J7heDdUy5PnxPjnWTdSiARvJI5sJykB+V8BjtrEGF7T9ZVvkevoStivXGKo+oeJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392858; c=relaxed/simple;
	bh=OGGx6Juc3+wfrS3W7vKIGdl7XlXSnp2EAZG1ceHvcEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBTbW1ryw6eHZYpGJjgDi4S7T33h44RP3VpgVWoJznK/fl+tQbtpaJSIMwA0Pp/n1Ho1h2vcMVwk59VMGW2BHVjmsNtBgB/WdijxzgpXaIc3fzlaPL9iJ3merTa5MN1+bOm3PllH0tsQiKvrHQ3hm6mMqLiBWYly5qajlfJABGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTc8psaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0Y+5eRb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRiK1531388
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=; b=nTc8psaP9spOnEss
	BctGpWDa4uTwTFgwV8U9Ue07Evsqz3mnp0VWoyj7GO+XljHrfVTFmQSfpEuyW7A4
	FCGerCp+k8eboHHdPbxDTFwHxPEHBHhaC2xwZKR9rRoPrTlWaaNJU3PXLBFLxaan
	lptvdek22/FiC9Fp0X5rQ6xqsgMcxqOEvtfbD3is+mCuBTQBhDDiVp4QhODZ+60t
	CfDvAD9CllFbXszsTufAR060TKWVVSXM3DurLdW1zE88X1hzG+OfhKt/Dg0ZSq/Q
	v8165B/sEjszvuQxvZoZMyxc9HMMZV9NdkJrur05PIeuhRJgXuUnOA00t8ParNDK
	Cwu2HQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud21b28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:14:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso14787534a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777392852; x=1777997652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=F0Y+5eRbvZbHDAWykbZOEVgYqr1qlZLF9ICiwpqdJ6ND8VpAONIh/05IZb+JmvOQP7
         2u7drFeAWH2p8ccbkY4CJCxdYDoh+ma5DDgW++/gsRiz899C0zuTac5r7FoOkUFgrrYg
         K1sRtW79uMhgzgq9bm0GUTywucn5ibPsG2bEd54FjI7LIQNrzQ1y5OzShMEBewgBc/Tf
         M0E80Dp+XtUYVlxUoQ9xrORws6gpvjS/MQUCQIQab8MFnAEb4iv+IxdILWHLNGW1/iiM
         N002hiNU9uF27HaYaSevPeW3rqZCvVH/+Jh7FwPFPlOJCt16oe3lxVbNId7Np/jMbvag
         c0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777392852; x=1777997652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=o/7XAN3f/E/ekl0srM5a80oTjZiRRtazypoh+xjGvnf49EXPfRVOE2nBEhMzow80gi
         SCPdsitHqBtEmwgsVkOgJikqf5AgJy19+RO9D16jSJCcExmJG3MC4SHsNn02SlEZoBtj
         BMsQJMqBDlY2auae5IDTRqrR+sMd27K/rAka40zZLltOPtlVrIqTNOfk+8rfG22aGQVw
         KwIiew7hGpfxdtdxlit4IaX3n6ilcrf4njMIxr9Cj/WrLm7rvJ6K2rFKIJHWHHK80ZfW
         xGlXZ5xM8gAWgGj3fu43cYFVwZ25PMY/fWlMQPPKVpN7Ipg1gr8hKIrC3k1vj1scDM7U
         4eJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w1KfMov7RyfNe3lVK5JbXRxWIzQmuhWVrzqDPL2j/nfP+3UixyFbY8jD/aD1KGISsefZifE/TMBFi35Oe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gxeCvYLCthx8HUcVUNVtmE2RqzvpFU7VCF3xvrQjEWRH/3/H
	PAW7WoY+9y/D5s08zshjufMdF2FP6EXQIUA/m0pr+uJ4yi5IaVdZRGpxu536S7P10py7OQfu1db
	ULxVzMT4kEzzK/NEUvmp2vPt0Ixn1trUF25QbzwJaUo/uSYeMz49ZeGLzYjObU4PvZr3L
X-Gm-Gg: AeBDiesGj8PFcQIOiCIytzoru0Y8KI3WkXgRy99ObanZZ6mA7bZfslfhlfgWZVdTwb1
	vHg7DfyURpxePCAeqjk+n7x8/Ruy457OECVcdc20zQH6Lco+JkoT1sZfLTNONejgl3gb4fh/JGm
	G3Nyl4TkaK0lUFHf1hVKLMXSauwCX8AIZfHke8W2UWSWCXfKMd9fmB/FX51lLgX8GjZEBrXSZMe
	DxtHi03o+8B94zzA4M+mkIM8G2ZzpT+rfo5eTafGlBa0hiwER/Ao3CIbdTnChGRhsqD/QNd237d
	XSSTtS4jitdFlhpGmpJ9FtJumC7q9Vz+zafYTGRuwB9E3ijTommar1tMDAma98SQZlPKRBWdepq
	VdOzX2/nagOYII7uz3Uyq6sZoB+Xx1Tr+tyGO2KXbRwyod9QSsyPYtC9uw44OiwXEoBdPHt0YtS
	Q1
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8508a91.21.1777392852123;
        Tue, 28 Apr 2026 09:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8470a91.21.1777392851489;
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Received: from [10.48.22.70] ([110.224.93.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0213862sm90551a91.15.2026.04.28.09.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Message-ID: <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:44:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0dcd5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=m8rBHnErhwdSF42aeuMaWQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nUfVBXcxunSxYJDyQRUHoOiWr8a6D5yI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1NSBTYWx0ZWRfX4N2nFgJJdji/
 GfygWmPwCWiuOBdX7dsCABGZfOcGSKIlyejtSLC1xkbXCGLhDIVP2IToPyo6ftSyFp+CR+0XRB/
 nBX6vjdQfC1h3ZPmWDpWYtowkSPF8NtMHRpaNebQHVF2E0G5Svec6pcSdqztRIoxMYbon/FkKe5
 DvZIsUCJ3/pOqDD28cCPAGKFuJzaAPlELoLAZ6Z8VcCl68D7Uaf7lubAyVE9Ngu9o59HvWfA6Z2
 UkjynwAeZljM3wWXajKsavHbfZ6K99wSCTq987f2Vvk0huJnxBMypfA/s1xhk0xW4bFVmuLUxnS
 YCJz/zywU5CuSJJHGsNQ1SztBq/vExd150Oc27fjbSCmHe9WC1XOiBNtU8dc6/J06K8YLh1URHA
 8vwWfZ5tVgQ39uDsa+7A1WFV9X+iidnD+rTwQYDeAcBvBTtXfKnSH7CSWEljne7RU47dez9caCS
 L425YehQlHnvD0Mpnew==
X-Proofpoint-GUID: nUfVBXcxunSxYJDyQRUHoOiWr8a6D5yI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280155
X-Rspamd-Queue-Id: C9670489672
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105042-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 2:57 PM, Linus Walleij wrote:
> On Wed, Apr 15, 2026 at 1:29 PM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied for v7.2!

Thanks Linus.

To align with Krzysztof's change[1], do you prefer me to send the patch 
for IPQ9650 on top of his change or do you plan to take care of it when 
apply his change? Kindly do let me know.

[1] 
https://lore.kernel.org/linux-arm-msm/3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com/T/#mb046f22f0c90ed7073e17073dc04daa931e40ee4

>
> Yours,
> Linus Walleij

