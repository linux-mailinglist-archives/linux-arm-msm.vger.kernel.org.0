Return-Path: <linux-arm-msm+bounces-114481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DbShJPXzPGqyuwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:25:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1EF6C4314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:25:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SiIatYA0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C7sdDVAJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4CB30C86AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB4E37EFF8;
	Thu, 25 Jun 2026 09:19:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD22FD665
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:19:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379193; cv=none; b=nR88/NToKkbUQuabs0OhSzOdmHxQ4idh2xOA58uKb1Te2kkcUSMdDPEwpkYjej0n+cKB+BaR3hMoQhrGuD+CIZfYEi5/C+7ynqbQuXqpqYv8k8MPtRUU2LcJ5zXsTLhtCuDx2oXIY5GcpEVCIOzrBF8MKuikOzJTvBXRf/LvDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379193; c=relaxed/simple;
	bh=JuoEZYzB3ObkgBG4v8HcpqypIuLamvT3Y/kB13uw8rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvL64atxfClK7cyo+xsWhYaIE5S10JQ/jXhwIVD79u0UGkKPJgQN6Y7CLeSj64QH0jxh4bsJ/oiodmPAQIf10206HKhKNSqu875guUODO7sQyv0rBKEtcTZFp33FP0mAkm8hb2Ylc8VuoXdRD/SrKDhVqG6VtEzvatHXmW5IaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiIatYA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7sdDVAJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q5Rn1601035
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=; b=SiIatYA0T4hkxr6e
	ucHbDYwdTVTv8KDasRQXBnTZ+t47/e+aUrsicjfLp/pp7yTZ63EbHyFAx6WWGay3
	cVqPNE02YsQ2Lga/MjgSmC8O5DFuDpBrmQaWQftEXoJUEbAKDq9wCQuFc84M9OCE
	1LDJcY+wNTM7tnKcNdno0cRdLWIslvB0L7Ml8WPFlRrnIwcVmgSfsCsNGBQoocPy
	Tw51x+WZwJOv7zue/HZvHFbv8Nd+/ni0o6RUVDTSyOQUuh2TBW/yvHPLqpRs/jFY
	lOCZ3VAHTyJIItx/DQ6t6QcU2bnSPffDIC98p803RwNMF75NrtOM1QwPEX9fCEaV
	xf4gSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duk66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1331011a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379190; x=1782983990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=C7sdDVAJNfnAj2+TNAzBVK3RtTZ2Rr1Us5No4RzLz4sKRXo9OCX4Wa+X4puqslM/Vy
         GD6So3/ycT6xZINRVyMvRJOH7VQA+9sog0A7mtgzfULiXduSek8ElajZItcJj5gsctOZ
         E+K9CxPljeCW9eD6Zs8zx6TdtkGQvbuyVjadEAafOxvtPZ9Stbs83BzQRlRLG+ItbY3r
         5bqJPyVme3F7Vty5L5qxpGJZiK7kcddKEKnW2ks4Nq3cFC4lOY2bzpcn4LOWTjF1Cvih
         mZqP1bJD5B9zS82Rs7ndeShcn70B8t30oalZihavbeR4KsUGAokQS9BSMue7x1qmocWm
         ZGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379190; x=1782983990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=V2ktREVBovVE0c5/VjW6P27fUbmsY4rKR/oVFaZAv6sd1jGVjDQWsU9D/dwciH9Yrc
         KkvdQvnCwJQ0RQIovUZUyXiqwIY2kqj8Dta9/GV4ibl2jCMjUS6joHpLs3iUVwNud5Em
         yKQ0sX3gLxO0qPo0RgrAeNjmhOCmhyo9rGeLkN9NjBbeJWfOjT2mRAPGQzPq7TcnnyO7
         KGZTQ0SzmoeVSq827QNz64u3OdPruqiW/RC4bt4M9E9jntSQeS7sCMRO+E0Eql17Ixd1
         bpJgp/D+CUcuYn6oQpS/ktLcLkHqbds2vfcChROwYSR3aaDI6S+A36AG97MsiYK66rWW
         Pxog==
X-Gm-Message-State: AOJu0YweFimAwDg3x/SlEHfdEoBxBdtcna7jJ5dgaRWyc292pXBX626L
	ApC2YrHmDjsHTnlyDdFJA17UELljKIJhz2qcb7eaY/AwPgB1DrCRF0xbG39pqEnpsFSxuo9bY01
	8fItlZGYOAYujE5ciUzwZh92THyluVDBuEd1nunqvxTix/Hg26ASW7CHiVRTKUPzIBG+e
X-Gm-Gg: AfdE7clBoXHXHDcPO/ZMlUVmzkyuI+srfV38A97CgqRrkqRnrthNQslTbvBys1iCNJw
	fKzvV5nCU0lBn9XL7Utl+E9M34DoDWS7WCqgYoGdwvXa79yCy9lye736bBTtp229bollY0TY8f9
	ypWtFJCbEK6trxBfeKt+TXbQFwewFTCXSj2CkX42LC2YK48Y53bkqyg1pAlZSS2nN29MaMTpgbG
	rJnLFKB4+8t/4+KwN9kWFLODiVYqQ3wADdW7oYLXFvGldxdVI1r83681aFkhpxlGeg4cTNW60Cl
	qpWn5ynXeEeXzt6d9Mo9LJgesOxGYymyIYLqSjNWmi86SWELVxqUs0jNf5iLv4MI9X8avl165I/
	5we3cDrWCYstPvLUsIrvvmAjVsV1fkuTAOvVr2A==
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774268a91.7.1782379190059;
        Thu, 25 Jun 2026 02:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774239a91.7.1782379189596;
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm1559548a91.9.2026.06.25.02.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Message-ID: <9160405a-25ff-438f-9ea4-e2a6f5c87eb8@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:49:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AmwekGz9c5Y9xg0yAOntwyztNVY5Y_DR
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf2b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2ecveFB43z4dzVmMHVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX0kXK66CXsNPR
 15EqgL1+pqxU05+zWD6SfsBW1VKv3WzOgdarXxVOoPrhk/HTbf0H1Xth4IpxGKUUhCtLoXNd2og
 Ul1R4sZxV/t7SFB3k5cO8JEdWtnEKsA=
X-Proofpoint-ORIG-GUID: AmwekGz9c5Y9xg0yAOntwyztNVY5Y_DR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXwOfF2s8Pr4qj
 5fLhgPO/V/LekkSo0L9h0qXoE9JdzkZsc3Sf1bR1Py+WFPUfYvZyJOx49w8JBjGKEoAB14T2JdS
 IpXJ5hrfYjt2hVCFI8jAjXLbk9zu+V/hopVMauL0CkAViFslMei+3O2+bihDt0knnFIUzD9CJTi
 SleWvm+JE/3RPOj1Q/R3woOYoZVFDwvuZizOsbbgY/DVjoL7VLiRDvdbQMca04/3dX/8tjlqqsB
 dFl4LUdI/uquxU6FoNWG66UDdqqip2k7ljvT6jExiJaUoyyWF0YDTbz6yXtUW/w4R6MbF7K5hW3
 91G3Cjmg9A66MxDS7tBEHnEzE7O5Cx4CWEe4RoNOaymXcbC6ESa/dvzlnUx+MeUzVJznZ6AhlWt
 bacM9EttpYWVz2bafQufNHbs33WHR+5IndKPLP9UVeRASROfzGZQOeA75Vtv1Qg8xfp9gHGPiT5
 GSoZda7X9O3M8zGlX6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114481-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA1EF6C4314



On 6/17/2026 6:42 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
>> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
>> as below on various SoCs.
> 
> [...]
> 
>> -	ret = pdc_setup_pin_mapping(node);
>> +	ret = pdc_setup_pin_mapping(dev, node);
> 
> dev is enough, we can get the np in that function from dev->of_node
> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Sure, Will update in v4 for getting np from dev->of_node.

Thanks,
Maulik

