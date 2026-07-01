Return-Path: <linux-arm-msm+bounces-115705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p07nAjgTRWoW6goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:16:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5926EDF51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:16:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MtSdEaD6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZEPac8hB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7FA7311E084
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D7F48BD3D;
	Wed,  1 Jul 2026 12:55:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC2481A8B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910502; cv=none; b=XCWRM+A5V0xo0fKqOstV31HRgN+dy8WwaYnDaSJhEeddFJdaXYwQryj78bCCm5Xn8PWT1pnfCOpvXWg2bkH9RhNlMVo03IfejOKTnUkKI3BHnltpRa2Q/0c+Ra5eW41k/8dtG+dDxO6dZ+sVAzjFAkBHEIkE/m3fjy6niVI6MHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910502; c=relaxed/simple;
	bh=74p5OdZcEEGetMQvAyC2B1sZkPILGKwBYM/hhxiO4nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra3+EEl7t5xFUaWrK2g5m7OA+jbFLBuooJusEW+F0dy0pa8gyXM1nIvlz8fhDschvgJppYF3J2muHBV/urbaIVdh1FBGXh2U6goHLnEtzb1qv+unpGq2/RthToY01lsPraIfC85IX8quqIGtPYlTCN49uIIUZ7DGflA8i76G2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtSdEaD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEPac8hB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8OlY761378
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=; b=MtSdEaD6slx+sUQx
	jGrKqq9oOpitSm3+7YllihpIWFsbms/IQtzHZpq0YzLf9l+yfGPclBHNT5MsT1XL
	lN+7julGIpxpbGGQo7NWrz4wsu59XWiamJsG7+6wupLbQNJTUlXE1xxvo8wOo/Sv
	DvxwW5ocUcHqJmAXGEXdc17uisw03Pg9MNmhZ5K7NpE0peghZkmrFVzPCUiVqUxx
	kh3tvH6bJ+pLCp4X3ldt5lRaHJxG7TzIT3aGhjmQ42+ooT6VR2TuJty2cYS6MkUu
	LBkUTNzNLGLq7avLyaVmFnyzwD0cEd22Tix9/5Vv4BxXzjM7AlTNwxsqpLtfdF4V
	cWeD7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd0q17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:55:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so647902b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782910500; x=1783515300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=;
        b=ZEPac8hB71OdogfNBzw6EwZwbHja3MRCYsWzaBcL3sJxc58XwqcdAOmRG/e+bZD6zF
         9oUwFogrcMBGJeBjpDVK/fzguHhRfuzE9wuxTm2vRKrjkBQSTPTDwG1Cp5oBbN/GVbKH
         JHpQWaicjTjahXMcUUBoMHMIY18IeJKGfXoey+0jTjN5fzcvUXePyuzgUaLCocJoqq3T
         /6nlgMF193pnaFsHmS32186FYnWmtDcy2VSrbvveuo9L2+vywpZss+84+aFqRltawPqz
         FAru0PZNp7JMuwBNxGxND6B38KtGKWRdO0Vx+nElHuz4BDo4LF/85br0+K35ps7k/Eex
         6OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910500; x=1783515300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=;
        b=SXuYd3d/N6YozhZQSdbXdhmlgMWd5r2AZtpwslL1lY1BcpauBzvQUbRNAv63n78YKC
         UvVfXMNJ+0ap5tehmdgqNZsnDWdUID9xwkPQ33cOfBmUZ8ke34nYVO2JYFBSlRU/OIUE
         lCYVUQWMNrzxRD+3w2wGGg+0I7TPlgVoBXfXujLq50ihqohGlivld+/xBj31qYSmVl7c
         9DbNnrzMKAbA10tyOwc5d2YtCZA7pl1WdXScbPw4BnIjI5bytvFLo8t7GUHqQNgeeo/t
         e7/V6K7ijgNLEzH1u4UFVM7PQXUIBzicj6KFggshmKHOmO2ee0/4uVlvFiud0JGGYwg+
         RC0A==
X-Forwarded-Encrypted: i=1; AHgh+RpRsSfRIqNtY8CHWEIhwN9NhOcfjAU0ga9KJjXsd7gm/4rABD/miP8XwQMSTVeHczuJgvLlYS0/x7nrLwKH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3aGgyvosPJKeJ1VVw9335x9n8rCjb+5EjX4zj/SOW17Tubee
	uYEVvrIWLeFeP317Ba8271bLzABuFCcE/AqlaZHv3jzG0ssrp/xCFVJOdxpfCHEsZeoa4Dgh9KL
	tNLrv9P8uckE9k6OaJOWqITcNYrBeGjlQTAg9K6N2A4q5BF/u70VSrl0k7rL9BalDkr7H
X-Gm-Gg: AfdE7cm4vxor0otiOXEg1L3ebW6cUea/ySkTKRB6Y93/hUm4NFQynpMHkIkk/sKkjJC
	4p1OwPu+0nWf4s7acCHqgbTj2XuilZhFstL2HWMNV9mKA/mxzzA9/RROg5q36vuCiflTy9fbh6D
	+DK9Qy8lSS2PFfvMLv44PXyo8d+3tgokNidoAMcAG9Sd9SuCytDFCDhlDq+7Otwhux26BWzdk9b
	D6F8n/NBQPJYhhKr6/smj4Hs4v01wyrmrpGZex8SdYv/jYVBL76b7FJbzhrhE5eXVsvE9J8a7yE
	lZAh7FrHpd7H2y/Y02+wo4AYQ3vVIUWv1IEWDF6Ru09chJq6v6jYn9xUuO7bJUs9FiC1yk6AjDp
	puG2eSeL2z+OajELTj2NLVwR4nQJduy5OhUWM/kB0xSmrfQHKA1Z1zUCdk0DupeXCIfJQXnHg19
	o=
X-Received: by 2002:aa7:9315:0:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847bf944a63mr1320509b3a.15.1782910499770;
        Wed, 01 Jul 2026 05:54:59 -0700 (PDT)
X-Received: by 2002:aa7:9315:0:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847bf944a63mr1320474b3a.15.1782910499241;
        Wed, 01 Jul 2026 05:54:59 -0700 (PDT)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cdfb7sm4008598b3a.39.2026.07.01.05.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:54:58 -0700 (PDT)
Message-ID: <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 20:54:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a450e24 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=i5S6TmXcA3_pwKZvcRIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: w5azHiMxStHlexI_BH15Ite2Z8i8qeXO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfX8avF7zHqGObE
 qTWgm2qSopnkf8TG5PeS+2Yi/WCQ9nOE4fmdjbZYZIWEQs8y6P7Xu9lAr2CEfZrY0Yg0xiBdkjH
 giqWTH0sY6NGyXO5H/dao4qoXrfzpoQ=
X-Proofpoint-GUID: w5azHiMxStHlexI_BH15Ite2Z8i8qeXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfX2rnkv4TKYaxx
 NYybuf3u7ihZ3VOZya/4BaZ4hWhOViTr6vciWXwq+exRSmeRTJPPAjbBt/SLCpT4u65vn4Y1J/t
 ONsB1XlDv4LKeTFwu8r+owtxSOc7s8DwYCG0Jw9FY3F8K8Cr/CM6BMisZR+DbROZyCin7peNywh
 rTIwru+UvKZ1r6S8tyQvNLy5VjNKddbjmvwCtS7KhNyp18yENZidrFtevbSBJswsbH/2klYpEim
 /FpDZzGHdt6WhOx2t3O0Hn0C8Kg50z6RtWCksVrqGC95l+MYHBhgi12BPeUVgaHiSd3AblE4zM0
 aBCjCWv2t2Xj9MuxY0uYtdGEgBX9vsPfnu5gpuA53JjUfczEskStkE59VYBjeMm354ZkdR896Sl
 VnF5DeqmDBndUK4RsDEg0ai+UpeMtmZl8FfPgZhovgZJ0sHdrrlc81wHTiFo4qBNxiDdAqrY7sa
 EmASBK9DwftwcSNIlUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C5926EDF51



On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
> On 7/1/26 9:31 AM, Jie Gan wrote:
>>
>>
>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>
>>>>
>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>> AMBA bus.
>>>>>>
>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>> created on the platform bus instead of the AMBA bus.
> 
> [...]
> 
>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>> clearly distinguish this platform-specific case from the standard
>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>
>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>> I do not see there a fake, duplicated compatible for the same device.
>>> Can you elaborate how is that relevant?
>>
>> Will fix it by removing AMBA related description.
>>
>> Shall I update the clock name from apb_pclk to apb as a platform device?
> 
> Why?

For the previous platform devices, we got comments to add the clock-name 
with "apb" instead of "apb_pclk".

Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml

Thanks,
Jie

> 
> Konrad


