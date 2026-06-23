Return-Path: <linux-arm-msm+bounces-114155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C1JlKO1cOmqd7AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:16:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CA6B62B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HfcyVXX/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iBzIl1lY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9B113091503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5937106E;
	Tue, 23 Jun 2026 10:15:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B8374E43
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:15:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209711; cv=none; b=Vk1cow9wW0KEryx+XvbXqNZGBg8IjnHJwrPUer/0WEKhNKX3BTJEBOz/3z9Lzbd59uJCnsUNpwQbdFLVWFbp6cqJ/7tCkwiGNIz5GcxpZjeCc8dzEL0ETtFmcusIdtRn4GRE9hSCc/oa9aROwNVhcotsxex/aTNI7ih3wgzwKi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209711; c=relaxed/simple;
	bh=HRjTJvpI7OkyQuWdlZOrCZFlet+k8nzSkJL0BGd/LMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4xphdsIGgmvs+D+nsN6/TNGzLIzARoEyif5ceqP+r5fF2inD/MY2AozcMKSZSpyd1PLrkMzh7Q55W/0viedatjm6c3MJD8pYOSsix4eGtxzUKfrgoQhGyHLLBKOaFthTkxFTvPkeVqobWPH0UzKoiesQ43CV4mywFshbP4QFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfcyVXX/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBzIl1lY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA58sR4126690
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=; b=HfcyVXX/oVYqot9I
	aihKXfOxY4NvBUE9xKbzrCXS8a8WbpF3L80rrQbUp4Q4YWvD8fV0reUu6GPua/Cn
	sRW7MEAY4u9pdgy8j26SnXBHPPlkEGtKpVH7FiY40HOaXSbdEZ+z1+KV/64ctY8G
	J57dTC/F74zfNu0uBRQs3hpLKJQuXGMMwjHJASMVFd79gwPM5IiKbrhT9j9bZilb
	sNqbQzER2kH6fkQoquUpJZ4ZQEYQ4Hnmrb8QJsJtA+ojPqK8uTnqoW4d/mhT9BrO
	D+sdTpefBWtWAnLLTky4yc5dxYNNaBk28QT4ZCPlE5+ZURXaJ5JHGWCAOhJlzCoO
	5sxQ7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3201gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:15:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b35fa876so55595585ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209708; x=1782814508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=;
        b=iBzIl1lYC3iBGsn1bntQLqStFy8+eZX1nu2sYf3PzmJDEFp/qIP5NQLnopmIKyucdS
         K4phK6hTeF2GxhovR6/wMSE8QcUrgzHF2/7hRwnp09FN4kuiVHwt0Fx33VAQsLr0zIC+
         JZddtigA1oLPuHXUZD1/ylv/8GwT1reTjrPspsR9XWQeh3wQOtunVHPKcy36KB09lALz
         PCCW4iAcp9V0LbH9jHSlcyuxzBdSrS8kjiGPseMnSKtAvt0po7uL8LhLFeenMpDIVS5v
         XxEYujqRaDScKRJEw8jL7ZPjtMprf93KA3iCg4aKPlqm1a2uwVgZc2G1sHOuQFinnLbs
         NDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209708; x=1782814508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=;
        b=hnWHG12mgnMBrvZPOS/sirNOj/GzP0g58mijlbX3BCidk9cfppBs4zm5cRu0fC6F5n
         XhYs3vBP2hfYXAi0HCoIY1Ah6f28W0Eb3z3p9nj9xzs6wf6jg4CqA0b2VrY2Dlx3Wtrk
         mORXVpNJegmx+bRZDXCYB1F3S6qxiokHTV7p9WEcpTCb7yMJIioUgWdhRsn3Abu4d/Up
         cXyuJT4t3b/z7CHzzFNx2VXPxSsXcdELXstoeAvp0RNRgQ2LKxXvesu0lXkTPCbXVBGu
         DFg+g5WFHgfWANkabg74R0bpQ/O1M5LRDNU/BGyr0Jarj4fbEsVNi6/JPL957nGY8IdP
         450Q==
X-Forwarded-Encrypted: i=1; AHgh+RqvxNym/izubb9ckuffxjYwKTO/l6daJYvqnE1VaZ4rBwaC3d5OR13fdnwg8s6Yhgzt9MmhmatyAA2uf0zZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLLwJ61kJzATof4b43KMJka4dHiNf8Di4OG10n68nCxreMEqg
	MGnLiXgMlWIyQfU3PdCnyS6RLFaEnk0SPWzHeOBCMpl7hM7ecYtdRBaJ/vxzo1rVy9gXjOZdHTB
	skOkSRCK/VGhAP2r+Gcgbdt/uJv6o907dchaK+ffpv4P7fomoPxFJYm8sngIFK/emGTjq
X-Gm-Gg: AfdE7ckb3Yafl7ASMlfLihDtU/MtBLIcsOzurghBpDvwJ3S+ayezLIGp0vT7URLuPy3
	m5lZREs5tRarQERP5C+6LyiFVQ2IaaKxJyx+aVmg+/1LLWJGnA3s7rd0Xl05KvJYddwvGqWgLVW
	3XExo3z3sYhodkpYLm5o3cn2gZwidblX9FxBL5dDpqn0YNH8fAmWa9HbN9dOjcRyZnPCZRRLyYf
	KitkAL9KKEtOT2NbOXVHYt7LqxM6ujiiykE/+T1WjRBDgptzok+8wDWQt8eNAa4VLARo0s84OuD
	z6ksxpNKaEtlDf9uJOtIVCV/2e2Ss74iHdhdLEKxxJycfwRh86/mJJebRpVUrJZfwF1Ko26fWiO
	YKEP7gz54RsZgXopyoaPCODnsMXqbSdtHf2WUNd4=
X-Received: by 2002:a17:903:41c3:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c718c88c55mr199553245ad.8.1782209707783;
        Tue, 23 Jun 2026 03:15:07 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c718c88c55mr199552735ad.8.1782209707315;
        Tue, 23 Jun 2026 03:15:07 -0700 (PDT)
Received: from [10.92.171.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f5ff5sm107134765ad.29.2026.06.23.03.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:15:06 -0700 (PDT)
Message-ID: <0a911743-b372-427d-b188-3521c6ccab63@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260608-sweet-powerful-ibis-8b2adb@quoll>
 <4d643a18-a044-4350-b7f9-2c61f50cb792@oss.qualcomm.com>
 <97a16bfa-2315-47f7-ac5e-b130e7fdcf26@kernel.org>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <97a16bfa-2315-47f7-ac5e-b130e7fdcf26@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXzCYInJiFaiJz
 9BxwsoNU+DeNnk4Xnwl/cga2JegrnVRPh+corM+9X61k4MohB3vuJODysgSBVjGuUM0f9bMEvSi
 YL3Kwxzh4dOA9a+8yDseCVxMD0rm5ZE=
X-Proofpoint-ORIG-GUID: hIi77umHpfHIO0K3zauHmMZbVeachmQZ
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a5cac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cM1uwEMTts-In_BrvGwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX752EoOF5AtIL
 TPZkbkOqhnA+Y4B/m+HAfbvp+tXbaD+5naWiSBYhCeDxIiv/4EbxC0QCYUef33xAlnDMMR+wsqO
 KiyczI+c9lbUW7htqpCP+WXQLbQAXcycrAV8ia1RlVuN5ixN9lyLeabVlb9nCWXhtXj6TSJHWSu
 QSXpPihm/oCCNMDRjjnftnRespLpd3NZS7aFbfQL3W0K+vDBrsKTwXemAsK+A8CCQVFbFnxW6mA
 H6TT0weAxda5NUuQc6EqWBfznNvM6KlKnwkaed1OWDSMnNDNmrZgie7Y4t1JWM4213/xXCP3v+f
 A7W7646LbOR705xLae7ewBwuDkrrsxBIDHLy4jslH5IdRRH+KnwJ2uqi06GdTuJtlmkZPp3fwuT
 MGykRmRpRXSGm+GPj+Dt+aoKo+/IwS6KQrJ+jEd2PcjtXkyzDfW2znH870V80Vikv/+xD6tWQ9D
 jDJGdJMXE//4GAVe82g==
X-Proofpoint-GUID: hIi77umHpfHIO0K3zauHmMZbVeachmQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-114155-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com,vger.kernel.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D8CA6B62B6



On 6/19/2026 6:36 PM, Krzysztof Kozlowski wrote:
> On 19/06/2026 08:44, Sachin Gupta wrote:
>>>> index 000000000000..a0ecc9f35cf6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
>>>
>>> Filename must match compatible.
>>>
>>
>> Thanks for the review. I can rename this to match the compatible naming,
>> but wanted your preference on scope:
>>
>> Should I use a generic naming scheme (qcom,spmi-mbg-tm.yaml with
>> matching compatible), or make it PMIC-specific (qcom,pm8775-mbg-tm.yaml).
> 
> The second one, please.
> 
> 
> 
> Best regards,
> Krzysztof

Sure, will update in next patch-series.

Thanks,
Sachin

