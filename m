Return-Path: <linux-arm-msm+bounces-114814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C7xAMJ/TQWpduwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:08:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC36D5787
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WLTkKNL/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DXcl8dLM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B443300CE75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 02:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9651731AABC;
	Mon, 29 Jun 2026 02:08:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC0175A94
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782698907; cv=none; b=EIml6Alksg2jvZeVT6GvjSOjAD5pHI2Ib+j53iD57voOHLSAr1VsQo1yjKuhMH7VDPf0DJxTJ3sPSRMmUkk8CljZxkM+/EANOldeUMLIoZNEVWFODBMaQW9CVjoGZsQl8YRr8pBCDI//okQ8JJRvcjLt1W9A69QBGM0n3CSslvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782698907; c=relaxed/simple;
	bh=trOx6KMkTWjUnkalk6/gDNlQpuLuChdQHMKM6WK2fMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/ECgi2CJDlTgolqjOGYrf9T0qEV22p3om0TOhm3WB9k3zv7jHV7uFjZuCXrJl14jLVMZzAqvQzOnC+6jarM1ssw//YSe+QrbsJX5hkdG2yusWA5X9exfER2NN4tB6Qh5y6n0gqm+vk0tO7e1AOxQD3mX+MZg/4gnBvMzUkCjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLTkKNL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXcl8dLM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9f46976854
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=; b=WLTkKNL/4couuf/g
	52YliDdMBEeXnXG9GQVG/EBQZLZJWWenPC7RNUWRCVkvpzRBOzFh7wheO2cetdFA
	ehSCQ4sckaeTOSOUB4QyGGplx/wx+p0wGqz+hv+fLPSd0RzwpZt23Ct777WyjJSs
	F8Z3UBSrMWUIHfhgcLTLg4QQE3r3awM79nkV5BvrubcGx+Hyhv14VKrdA+mw3bBf
	CFlmHv5P6j3tQRoWRre0cMuNJ5u098X7GcGjm0lj3kcnx5tMEoNLumzKQen6pvAN
	tFkU5IbOqAyGXTMTAcAHnkCa87i0iv+foCklUhvOsZmZTuGBuZwyeIsxJf6ijF1t
	cFzJjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a43u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so833158b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782698904; x=1783303704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=DXcl8dLMR0vVyNfdE71uEFlTp9ToeXl70M3GbRG3OFK/ihS/FZLyWqXvh61yNDk5me
         CG/3XgW5HjdwB98PtngGp99HWOlPXDr/bPSc/wKwJJxMQosQlbw5d5jFc9jl0jZlvUOC
         qxKpwlrSPQ449e0PY/eQCWcbrSSv+3JMWuMaiaRT0yfhSr7OMedhZ1Zbb11ivGgDGw0D
         5r99pZR+WjuodrKnbnjR4uOIPCrN8pMkVgWjO/TER6hYhftWvrX5TMUaBiuaXe8cvX5E
         BLxXnHWkwyLTn2WOOFiw9v0KiS8MNeWo54B/yyfx0RVWmhHj3+nu0n5er1J7ad+31U1v
         AwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782698904; x=1783303704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=kOKhwmKFf7UT8Rh0koE2BIHHezT2AcnFzO9kLoy//ivon9vCjKHESDZH5JDVCt3X+z
         4AXwl6bifKg3CBLr+PJ2RdEKXa7HdT9ZrCGPV5QyVe8SHCjtDDIrc8HHKHgQXbpqtU7I
         +sClnlO/qlHq4xlmYBO7GytojJK5k23UKrV4imPeUBo3nq30oVEtlDjuy9rXZxpfY0DN
         O1r4GigS2nPmvSG9MbAyWhkwNTfNJQpzmTjcdG7w2LE6zLTWKED3hGv7VBgMyd4KJpvx
         3Kud0kNdqZNwy0LNVGSHRxlFU5L0+ewFJBF3HTvptbebYBOdYvg7M84qs0qiZHs1jYuy
         22AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCRQcxt1DLFdKflNdYG86mMn1hxSm/0CRG0wUKFiurBfFyMlh2CTuXh2DXUydo28FaRnhr+jKGE46blE1H@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjVAx0gu8EdHLdE+MI0K7fovHC1fIzhhL2fLdKhckGxJOig7w
	PRp3agIzKHoHtUI/ODDgaAJZp6wm3jQLbGbNwu8OLwa1RBoGcnbCBFZhKvXmKot0uKPwytI+Tqf
	7/p4Xbd+0WXqF8GQTQdwShhny5PncYcqwMKcfo49FABanjL6oy99+0M7eFIeIAsGWj7pG
X-Gm-Gg: AfdE7cnIu7xCupdZUnUFSGKEk55MzzK7lMivE07UmUctGg1eQCmaLdMjAoIJYymN+3s
	O8/+4HWjj8IXOhsVuFCn/9YpGPu5p7D2ARLuId5+wwvksgq2K8UPIpXLyEUvwV53uJzFCbaUcB9
	lfZr248pSUdqt9kqPIj1NdVLayhaWFz2l5spt7H3ydHjnmeAyi0SIGf4KyzeXKW9iwxCcPYnK3e
	7K2FmyvEjcntX/t4cBojjqnvxgbAO4lIr2khuXl1PTVP2neCoHm4f/HXSUVdnH32cbdxrns+B/I
	rux5w4PittCSWMBIxXpxdExntLxejNT6YEgJJRv/pndR2wW4WDU59kIHd7q3Pw1aDGTlgcxdeC4
	eKA0GpTbx6pN/vxsk/JGBk1FDbrhJoByLhkm2gYNbYZIhYVMjHbeTQAQH3j6OU8NzN+1tQhkHep
	Q=
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944862b3a.45.1782698904517;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944844b3a.45.1782698904079;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40ee417sm10426170b3a.40.2026.06.28.19.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:08:23 -0700 (PDT)
Message-ID: <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260626154949.GA1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfXyJD0ACuCDk0z
 MhEPhC7BhKDOQrSCLDuW9nno4NWC8o27PT70y4VyOjlEQ0hXI3jn+A57gCY0lnx70FBDK1IGzxu
 HXq0d9P5Rx1J5gvh3VFYWm5thL8+hwuwwDT0aHhCkxDR4Pq+FAxKdq4J9bH6Cd0+JP0KtIvKacv
 tIK8Pr2IRVsd16WPxeXHk6XpwYVGhxypmx5PQ0NdByBCD45iHxD6txpJeotYIiaB2ov90Eg607T
 x6QVfDU3r/aGoN2R5XpsVRrjmM+cLaABBBndhBndUri+nHSz0OGJMMXIBPoWIHDe0RbbBgW9//k
 FjG9tvhrcE350LGU28Gf6InWFJkyEUJ1ADY8B9rWh75u2k/OGXZmlHK20wW4FXIUjF3I4ndGFKp
 yYYTMITFtTuuPMIS402Jq2tahDcE4teljYf2IK6gJlBttYRo0ugUFvxTx+QUM94gTbeCyVSLJBO
 zEmBelT2GeLsBq0Z+mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfXyt6RALibDOZN
 NILZTLYDH7CVL/aBq9qiH/IbvR0SRM66SDN+iKtYRk3of5SpmJSPsUHjOUAGb+ekRzC4JAIArfr
 bZ9dOmzTZqbkDT4gjcUU+EbiOwWe9Xs=
X-Proofpoint-GUID: A0lHU3fKbLzfl-ibRedgEPN_jlLD7T3s
X-Proofpoint-ORIG-GUID: A0lHU3fKbLzfl-ibRedgEPN_jlLD7T3s
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41d399 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=AzejHKQscgVUoiqplJQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114814-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1BAC36D5787



Hi Leo/Suzuki,

On 6/26/2026 11:49 PM, Leo Yan wrote:
> On Fri, Jun 26, 2026 at 08:09:58PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> I have another proposal: what if we allocate the ATID in trace_noc_id() when
>> the device does not already have a valid ATID?
>>
>> Possible scenarios:
>>
>> If the itnoc device is connected to a TPDM device (which has no ATID),
>> trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and a
>> valid ATID can be allocated for the path.
>>
>> If the itnoc device is connected to sources other than TPDM, trace_noc_id()
>> will never be invoked, and therefore no ATID will be allocated for the
>> device, saving resources.
> 
> TBH, I'm not sure I can make a judgement here, as I don't have enough
> knowledge of the topology. And I'm not sure whether the listed
> connections cover all possible cases.
> 
> I also found commit 5799dee92dc2:
> 
>   | This patch adds platform driver support for the CoreSight Interconnect
>   | TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
>   | from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
>   | it does not have aggregation and ATID functionality.
> 
> With your proposal, wouldn't ATID be allocated for the interconnect
> TNOC while being skipped for the Aggregator TNOC? That seems to
> contradict the commit log.

The ATID is allocated to the Aggregator TNOC during probe. The "WA" in 
driver definitely break the original design.


Can I fix the issue by adding "arm,primecell-periphid" property. That's 
would be the best temp solution as it avoids breaking the original 
design of both the TraceNoC AMBA driver and interconnect TraceNoC 
platform driver.

The TraceNoC device here must be treated as an AMBA device and I am 
continuing to investigate the issue with our hardware team. We aim to 
fix it from hardware perspetive for existing platforms if possible and 
ensure it is fixed in future platforms.

Thanks,
Jie

> 
> Thanks,
> Leo


