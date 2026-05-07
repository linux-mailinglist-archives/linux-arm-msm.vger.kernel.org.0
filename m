Return-Path: <linux-arm-msm+bounces-106329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SERAAUVk/GkqPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:07:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A994E6798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCD213067C70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E1A3CEB84;
	Thu,  7 May 2026 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pf26NcSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMjgTAxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA72874E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148004; cv=none; b=fcH2lu5x4+o1vSdlfo9Csd8nxQVc6/vSubFYhHCGbEQROqx5kviOX+qUG3IFAMp7Lzgj1LypjWwCyoihcSKgXSOYM8AvjxdPlKHn5gNX1ypefweO5/MuW3W3Xdia6js1DIHHCzgA2RdXPzubbjfbY0n5xkaFGa6ONwmqEhq1/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148004; c=relaxed/simple;
	bh=yOCUHpotWozcC1m7TJw1/KIAyIx03i4Pj0MEjLVgVDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exZ0tOvnIeYbjSpdQSHENYYNjSuFD0L0EUDU8zrLb57dJQMn6q19xESFufpf4vIZECs6+6siw9gsF5DWpFTULq+lTrnCBeNYTM9bwkLmIhCWdrLcpN9LgNK08XRP/0N0H8ak008hdk1BHVD8OogH2iAE02kzfkRxMAO6MKQj9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pf26NcSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMjgTAxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MIN53157321
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 09:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	678j4tCJM5XWKuhF7X7zIK6Yx6XfJebqnO6Op1WlavE=; b=pf26NcSlIBQRQfYZ
	yypeuQoNB2UyUWLAnLAz3pSHHAs9SJ98t4o9nAEKtlqZT8CAdA2cDkJZ377bCTfO
	h9SzFdlWGWZJEOVfYQi4Vx5G4Vn0IBb9k5WBIWWpoplx8BatcYr4KNs3xFoLbSXi
	TRR2EBDERTM9GEWW0zAlNuSMrtIljE936x17XiWn2mYI0qynZMVj1dGtW+CC8a9+
	MUed0V7YwCcoOpoeIFU41KNu8jeoknrv7rs8/uOeJ4Bi3UAFz1Z00qDUTmuos2/y
	pFH78DTbnhP/TdGNcTuFecODHOrIeYmQvweD7sJHKjIyywBtHPvkrfjDgf7C+TVt
	wz+iMA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf11w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 09:59:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so561076eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778147997; x=1778752797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=678j4tCJM5XWKuhF7X7zIK6Yx6XfJebqnO6Op1WlavE=;
        b=fMjgTAxsWD4BO0a7SpBE592cg6IEXflLeXfjKzsz4dnMiZj9WEgknKRanU7CuHs1b5
         9XFzt/WGFx42lYLmeByCOGw3pq9oObLR0f3s6C+uf2KBzYV1H2tLWH/PzWBOFmGd6r10
         CuqFEsMkiOqiPESAPAC3qa1LKDe6/raAEm7s1iM1jPDvQPDejbg5w/dAvd2yiSGm+uL9
         Xyxrpo9gqv8ilPp3tbeBH2EpPnroUHlptIwVAY+6Lyst/aXybrB56Z8rHfgRwpC+2LCX
         qvG6Jt4xAgmLuhLBUUJV+/W8jtMWdWClMRPTVYwmWaXKp7bSQA+eG6SZHGLkT3z2bF15
         iC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147997; x=1778752797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=678j4tCJM5XWKuhF7X7zIK6Yx6XfJebqnO6Op1WlavE=;
        b=kuo5rxs5O4vgOQ2SFClA6V3LP79DthUDeQeQIOyYrd4rFtGolp+W2jopSbljIiaV8O
         bCfda7XzUepHbVBgPI1wngY6yDzE1vonJL4/FqSQqpTDzzPjAR+8nXMm0RHJE15rvq3C
         VrxgwxGFAp+KJ3VZ7Rr4MxlU0LLKVXtTuwC+bi0cuFsX21k7RmqJIuuxTpXsZfGIM/Ua
         hgaPNWxkNdJs/vKF7vNcnyof/FjvzgNmf8DPqq/fW+bRqSaoDwMeG0DKXK/2omOcvQKc
         Xd3mf7cPN/PqMMoZCC9gEOQIjOPHcjLTRUhhwXOuLm9kL6/WQyyfqEUtQLQ6I6/n/PmB
         hRKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BBQVp3MQycdsvR+I8R6ahSdvoHnm+szl8WdlD3tM98qypYmghwFlCh9SnhEiKBPe14TVGe4BrOuV9sxWb@vger.kernel.org
X-Gm-Message-State: AOJu0YwSjJ8o5/mhCbc9ro60qIMCxzyHWKNspSBG8R825TL0CeNsOgES
	AiYUFDsxNswQRtc/JfMNgj9eNnysN4eKxoC/zmEzztiQSEGQ3PIpdNMPku0CKjCMPfFifFKAk17
	bwZXfqUIO36w9leO2L8HWrmsu5AEB+TYWMeumZpmA0eFlYABFVHWgUIUVhi5et5KUkvy7
X-Gm-Gg: AeBDiesdUOA9mQ81kaCKS4IioMgD7trb400H9VrwIuA0P+DLXDBXPUmMRXV2Ugs0Iqp
	jH/EudubJnk1Ui01AZl4IqbldbJDLjvQeYC3hgRBUqHJ0mkxg/Mld56a4Rf3iwwNwH8/aK00AU0
	N+W+6mB3FLtw7m4AfNeF9joSr5+yi3CMywMZk6CQ6ALtrxPKyKpZ8ARujeA5wuPOqCGDYqjYuau
	JSqEe1ltAFZgbN5kugk6EVAB9HtxBcRQyJc3BiUd/Rq9zFsxLKahXqZPi5uAa0zcpEzoHmj7RgR
	u1toLuBgP1uBSUDXAS+ewp4LmvUXWFPW+6aTcL0PuJ8cXlWqagUe65iZXp+szr6J6I37x59V8mV
	9/K3ghx1/QaMscSMcnyR2O1HKFQqniVZt0hQLxSWxMgUVnYafTOEtfNz3t3d6pDJZTKji8Denpt
	2888kGB8G3llak0w==
X-Received: by 2002:a05:7301:1006:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2f6e1e3166bmr905293eec.3.1778147997103;
        Thu, 07 May 2026 02:59:57 -0700 (PDT)
X-Received: by 2002:a05:7301:1006:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2f6e1e3166bmr905276eec.3.1778147996489;
        Thu, 07 May 2026 02:59:56 -0700 (PDT)
Received: from [10.110.10.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm8102758eec.23.2026.05.07.02.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:59:56 -0700 (PDT)
Message-ID: <4fe79c7d-42f3-4001-a5ad-a61c491ae29e@oss.qualcomm.com>
Date: Thu, 7 May 2026 17:59:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        ebiggers@google.com
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        deepti.jaggi@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        quic_shazhuss@quicinc.com, trilok.soni@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
 <20260430032136.3058773-2-linlin.zhang@oss.qualcomm.com>
 <41da4b77-4d0d-48bd-9578-2adefe5466af@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <41da4b77-4d0d-48bd-9578-2adefe5466af@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5OCBTYWx0ZWRfX8LfSIOPPiyFD
 bJB1d1mhFn8uXVFPu/DnuM9XhjseiLA62ZceTITZTTvr+VsjHdlDCvHaa/q6nCbHlyGQ+MTiJsx
 y5sCMsdiQDa+iqlS2XCXOKq5L1dSWZ5DUYFXWkjfisvP5WbmnuUPMmalVAE7JzJNbFSZV6Q7iBt
 AJ+3jzuVHTwW7jALmTT/OpXnejlMchIPlIAbICf5I/w2mbtMNK7ZfsLx2enMcdh00MLZ1S+Gi7O
 vJ1hAbSFBGnrZPBa2k6JH6jgo/IIS/tytnSdktA2HRxWSy+j0Z79BAGSJLClO06MX31c3+khnxi
 A6OYMcbzEraPonvasLkcVv9vPHdLeUInNvNffN+x+DcyysqiAf1oT9wxf04KrWChUjbi8nfh9YK
 GzuRhv6A7uhfLUF7wQmCBJayPqzzj7cvNz54cDTrp9jP/yAt05ut5ZVSQX8yQgS9RJL0FS7RZIH
 5OfYMSYVO7RgT7ZvGdQ==
X-Proofpoint-ORIG-GUID: je4VzvrWh_j5ZCY09wB7Vlld2Yva5WpN
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc629e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DO7WzgAb8V_MQCx-KrYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: je4VzvrWh_j5ZCY09wB7Vlld2Yva5WpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070098
X-Rspamd-Queue-Id: 61A994E6798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106329-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/30/2026 2:13 PM, Krzysztof Kozlowski wrote:
> On 30/04/2026 05:21, Linlin Zhang wrote:
>> On sa8255p, resources such as PHY, clocks, regulators, and resets are
>> managed by remote firmware via the SCMI power protocol. As a result, the
>> ICE driver cannot directly access clocks and must instead use power-domains
>> to request resource configuration.
>>
>> Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
>> optional for platforms that use power-domains instead.
> 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

Thanks for your guide!

I'll send a new patchset on top of the latest kernel version
(branch: next-20260506) and update the to/cc list based on the list of
scripts/get_maintainer.pl output.

> 
> Best regards,
> Krzysztof


