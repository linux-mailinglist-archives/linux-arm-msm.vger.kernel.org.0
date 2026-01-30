Return-Path: <linux-arm-msm+bounces-91242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOlGKOdSfGmwLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:42:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC4B7AC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EB8B3011BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 06:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C948C33D4F6;
	Fri, 30 Jan 2026 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs68VRF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiX+GxHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185433890E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769755364; cv=none; b=UwWb8rpDbv94Yh7wltctc6seBUjfvOXlPBQTjV3K8uW7m2kMRcIi7gcjxxESyK/VIsBJ6aXLfzR/+P+iU8bTcdC8IAZD7GNY+mjwNiRqcqYnE3wweXMbVR8dk7olsy7u4xzl67C+7lNGEosuXYenFkeiark2IKJnFD+CrFEyrSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769755364; c=relaxed/simple;
	bh=jtw7KOGqnd1x5l3rhpf+dMbdDDnSOzeycNLqpZCEhVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJXEGxd9GbRBmesvxcCZ2pd3tvHv2S1Z/ooppH8Vns0RJZ0EpVHvq2ECpeBzBc28WCVMjttPBF2KnxUNQ/g+YcGVa1ebl6DxZ+oYwbBFB2aWjE3IpkzcXtQ4iXEIpWxVliMyT2zt1Z9wOWoMSak8OEReZ0vo1DWuhshqv14FkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs68VRF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiX+GxHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3W32S1902476
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJ6t4kgrhe1eIPNb8YLYC7/0mcFgobKjT0RiB3Hsnm8=; b=Fs68VRF22CKmiccx
	FmOmRTIFBnxljUXUSnk3ieaPwfoIXFl1+Hd1gc3S+/mjm139hniRlsz1Hnvijq1R
	EQtlkSNqnaL4FY54ufY7nf3Xn0ILrHSW8uMwlU+XctZkeoeqZ0klBxPnH48rHykA
	BiqewU7v5Umm7KL3TlDH6JEX/FAm5kyfU4b1k9lNxvtYf2SXZUBrG6eQTELVpCFI
	yVkUDY0PxNh3B3OpE+KDmvsr4eS0nI80orvla0zEBVE+0n7KOn9AYQ/FYpqGjYOT
	DklKDXTRhzivgwbXXhZo3qPl9mfJjs1RHpZ4gHYe+mQ78E5iluQ8lBxN4SCIqceA
	aWqGsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sebf9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:42:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab459c051so3448174a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 22:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769755362; x=1770360162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJ6t4kgrhe1eIPNb8YLYC7/0mcFgobKjT0RiB3Hsnm8=;
        b=CiX+GxHnORvNS8Guo5F1IRJneTyoTfW9ugHNFNXCrGIoAjl4N3gLo8jcIqKeWMUzvs
         tHOdABTE20ZMx72XiBLqJtvDdGHMhqr+EFdDRpzjp5R7CRZMMuzF9Ql0fuNUZxcvQ9FN
         4WcC1o+ZZMUL40+uztc9ho8vUkmlnD9nqYJa4Jh5mHmAAfSleVBqiaUnrfBkTkkzmUt7
         8ZcHdZn55oYLXFvcV+KaxtPCKj3Ce1XRzbwR3h3HORdscKFcKGtu+swID8CFHHkfLYWY
         49Zt/oLywjwMwaxFy8BCnzLjE177LHc3E+N2L/uHc1V+Oh0r4NfZLx65A0GxqWbo7Rqv
         eSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769755362; x=1770360162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ6t4kgrhe1eIPNb8YLYC7/0mcFgobKjT0RiB3Hsnm8=;
        b=K43HLZWNw8o/laN5w117wYFZdKQ5BQFIBO/BVVhAl+RR5n5IxiY14uZwCNezEQzTs9
         tzraKNT5zlVnbViBbMJteyLq0gS7WJEx5NpJhvJ2AhQd3jcaYnjRfIiMlaMAZPHtHWkq
         Dm6uQLEvX+RBNcv1ZqSgCortX8o279pelKuXmIwgetgannl+P4huPkOiCjcY57l6ZnAo
         nJWT2eBnODewOCKeJVk0ZfQmHYL/lnk1Vei3qK5bZNVm5Wc2IJ4wpMEYRa8OfywZRAtj
         ku1PIq1BUjGu5qhGB7xbn6SEu2dA9BJdcgyug7Swuzf2rYJWIbO70eku7rYVJuuHFABI
         dBtA==
X-Forwarded-Encrypted: i=1; AJvYcCUNxJ80ezT879N3FD9ofWq22pezmb/r8LOY5rArHrODk8tURi46HLi0UJ0MgMlcxYLkfWqbsdiI7jDdOjQz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6cjex7VtIKrX346XDguL18j3B7r7c/cqIBXHisWCtGQ7j6lmN
	vvie1DAf3AUTH/Y5qYPYnQwG7sMwAA6XjnFRJ/0AddlpeLV8jaiv9Ykuhc2Idr5kNnxCAeVXC5+
	FdilmKv1iKo6o0t8f+5hF+ZwH6R0ZW9xDOQ+Phq4DnAndzchdgfmeMv5XHw3cljdr65wP
X-Gm-Gg: AZuq6aL0zlfH0s3ogLDclzXZsc4Um0vcEu39vgAiuJOdabbkKHKx/tDlYXtesJG15DU
	eEH/2ectIsfcYy/oyUm854fuCYxKRtPAZeI7AeJNsiIjEPSmld5tdXjTDgVyVWElkPquuRZZmKx
	L63zXEwB7AYvgr6Blsdfi2ZCuN8t7CgUP2L4WcfkFb6qKw3nn3zJ/rkUF4GOzibT+dr8uOpPKls
	El8vWdouEPJKQqlRMpclNzcjBq8F6DUC8uiNY0Y7Ba+lafHmDdy7yNUKB7EUyLsXMyH8vrnG1nL
	WSPhJAwwUxuR+j040TAA4D0xkMkRV0JJ54CHEDmcWK1JH4Ry4iW87DCIqP73xIeHwHZscQypWMo
	r3iRiZKu9JuEZOSsuRqBBi4MK5NoQP8qx9FdK+XQs
X-Received: by 2002:a17:90b:1c09:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-3543b2dc04fmr1791628a91.5.1769755362098;
        Thu, 29 Jan 2026 22:42:42 -0800 (PST)
X-Received: by 2002:a17:90b:1c09:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-3543b2dc04fmr1791592a91.5.1769755361608;
        Thu, 29 Jan 2026 22:42:41 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb419sm7086345a91.1.2026.01.29.22.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 22:42:41 -0800 (PST)
Message-ID: <07f0515a-8c1a-456a-aaa8-1533717573ab@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:12:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] thermal: Add Remote Proc cooling driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-2-gaurav.kohli@oss.qualcomm.com>
 <20260128-colorful-caracara-of-persistence-dbfaf2@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260128-colorful-caracara-of-persistence-dbfaf2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2GWIB6w_4Yo0-KObbeO70FTSQlQjSRTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA1MCBTYWx0ZWRfX7hlxF2b8L8LK
 Ka+yLHGCtbveR2hVW+yxGJK82uT2Z3LjaGpz5Q4hkbcIrUK2hdAQ+9WotDdy1Mi3+2dz6ffYoc6
 LlXO2z0Y+PBR+gOi/KS7E3UgGPziIVUIlPi9BgqHChE8brVQ/tdP9xLbh7wcBY/7tu4J6v2WzRy
 3v3e9CvCrmF6us29H4iEaev1huN8rIWB5PVcmgEucd1kKJc0If9ffbOu0be6ROkrV3uo81FmAw7
 L6OL7am/AbWcf9U7bbzje3yly1d2rVAJmowhxkBhpLxDqam5hy4TdtycQOu7V2eTh/S+0xMg/49
 8KXdjw9LRzLwoaJYnTbHsfwiV8jenEXqc/xWilKImHHkENsnJcgV4635/uH2vfGazctcyJuPmwW
 fpJPTgyl2YOxtnod/BIneYtrOkQUpeg3vXEP5Mh00GnVfqTZSzbzBcRs2dhDtrKH8J3Kgia8dGO
 RUtwLK46ApJPNmirExQ==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697c52e2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SE6imBzcV5aIF2VMCmAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2GWIB6w_4Yo0-KObbeO70FTSQlQjSRTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91242-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07DC4B7AC1
X-Rspamd-Action: no action


On 1/28/2026 5:06 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 27, 2026 at 09:27:15PM +0530, Gaurav Kohli wrote:
>> +	if (!name || !ops)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
>> +	if (!rproc_cdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	rproc_cdev->ops = ops;
>> +	rproc_cdev->devdata = devdata;
>> +	mutex_init(&rproc_cdev->lock);
>> +
>> +	char *rproc_name __free(kfree) =
>> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
> Ah, you keep ignoring review and sending the same buggy code.
>
> There is no point to spend any time here. It's also fastest way to get
> your future contributions ignored or NAKed.


Apologies for the miss, will make sure not to miss this in future version.


>
> Well, ignoring review is obviously:
> NAK
>
> Best regards,
> Krzysztof
>

