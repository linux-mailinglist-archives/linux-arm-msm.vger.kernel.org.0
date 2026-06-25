Return-Path: <linux-arm-msm+bounces-114430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lLRULet9PGrToggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:01:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 509186C20E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZvA9h5M7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LX/4DRt6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88A09301E03B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 01:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD9A366DB9;
	Thu, 25 Jun 2026 01:01:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F127522CBD9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782349289; cv=none; b=nbW5Z4m1rGvW/EfZhzAY4ZY1sNS4/NRcyPiCfEnstUbXZdV4UXs/d+Cek2juM3bS0668hjfaT2AztF85VQVh+pT7Xodi2IJKM5k1gfoRRAciRzjhGMxKSX5Vbm/mnjTU86+BIJ356jDdJRLie624of7TbxqZAMbhYgD2s3qcHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782349289; c=relaxed/simple;
	bh=vLTeuALGLVem3atvJ6Rr7ZIJuSU0nlwaxwJE5U04Emc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bm1434nh8tiZWvGCZuqi1TPbV6N+1H0FVGIgwgRSw4glfTIZpDjxC8ZWG5glG4uFBUlN0jbRv0yL/IjObAVEL0JXpe+4ks6crPJoviXBnmfthyHWck4+7uwmDUntix3lHxbDt3BSmGsxzsf3abrHb8pYh/htnuzyqCxy08bg+cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvA9h5M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX/4DRt6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqYhT392191
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=; b=ZvA9h5M7xX7s9iOu
	5kdKGdO3Uprji+67EKohMHTyzZL3cqzFUQYDNDaD7aep3vQmeeFn5czi/BBmkPaE
	6lkwreJDTBey9OUM/9KzVVNkyuUmK/szGOVgQQkyPE2a4qosqOjpbPWENsM/t5C4
	/MCOR09Z5Nt4GysZckZrQSzrE3Z80uWbezJu5y8mAPyG3yxwGjV/1nqZMJ74Kn5i
	FreDKnT8shxu5fXAg3aqNHKMZ8L7z8PM0BTPLr/PVXprudx4vHIij6RrxXEVGLby
	ajyNE9BH1w9sxBQ02LABObmurXrirLDVJ1xfBRxpTFk19KtjavxTbA+7XhqY83KC
	30FIFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g353r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:01:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7ef3cc6d4so5299455ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782349286; x=1782954086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=LX/4DRt6LI6HlRyPYN5oUnz/fX/r7Oiefab0tHPp5iK7aSdkk1ax/xELhaAKQEyKTi
         WikZj7v270i1xEbtWmLHd6/eJ2hEA0ZGn1eJnrIYAaEMbnRLNj5JAto+QaAdrfy8nqIV
         CDQqigQYu86TGapdIrpJMlhFIkXIdNLc7lgu0tJ6SGr9afhof+dcOejohaf5U0fhHtsw
         olnO8fcSBNdAMTKIA+uDreM8aiGTlcw2ZSRbapaQHPp+0LZRV5NpUMegF0yXvpGfZ3ai
         QcWgf7P4SWWJfMb0ljRQ9C8RzYVRramGUmcqi23+CxIhcimv2dYlMWl3a9m+YLHaO56S
         JXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782349286; x=1782954086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=cezO+NYROQ3Yo9esbK8ZB6SEbnn/yaXSxtCPbs2ED/BJCV44vGh3EAZvkD8cpAXfF4
         KhCiIEtad3zWHo4NCxLltGD9WmgihxmRGsPFiAwJdqe7buBaFSfVAIET5csVFWmKQJD1
         fLANV3sBtK6YXD6D+l9LRw0HKPDkfwVAGrq68cwfPGS9D0F7jHuBPE3B87pa4bI/pOfn
         SrFYErUcSesvzl3jvQPVQABHh3trwUuWCk+65gae0x6XT/9zlalgGNR2bKCmi5Hy1kfG
         BlKZg9B0i5BaiDzLK9/cTidExh3KMR47H+ZWp3gWA2zCuI8kgUcOQmHFLgJrku9iBao7
         obhA==
X-Forwarded-Encrypted: i=1; AHgh+RqmynRxzUDQEcS6P91EnWu8rjpaeu4PXgFDSLFWXCZfrM2e7CY1E8YaH5rjRDfilDy1EOOsmjo6oQU/xl5S@vger.kernel.org
X-Gm-Message-State: AOJu0YzevFCAfL5f5pe2Apxz08YDu0mPDTluQ8297Xs+1e/d/XxcbcB2
	dVlzxLlnulTGPTGJv76fwOv5VOeI272I9ymtBLyU7my3HFYiodCp35+K7mrLtf4enzPiH82eXeX
	9pAkrd9miQFFdRW1UiKvifxIEszA6DYOkPd9iMHduvlAIwYPI2KCJtlRFSlKvOHHYVRN4
X-Gm-Gg: AfdE7ckSobTc23+zXK2d+tKqGpJk+abYK4KrNA1hGUjR+LcC/rEhxjEH1Kp/gYe2R0n
	rrIB1K2B7n4HQoUs63kUc39R+sHuagBteItpni26O47OXuUck9LiAJlSy9s9orMc+YlRmFZTjG+
	Nv+9zpKhpWCYIfYDGwGCyjT2VKzQae6cJ7+UBceLcm/72rwmdLm+lFqAUed32bj/gM5WcAwGy7J
	pdwZef9pXimupA8iQGito/rrTUjxHWKDXmC0Ro1DPKqMN6AbzdneXEV9TGc68oFB1EcQAY5nTem
	KlT8EOt/8ClOszoPTdjltngtXwAvJq4f5w1CqerkJTbeMf/9zXz45/8OYTFpRB0vrstEMCmFHJ4
	2FwIh9Io9mufiRwlxDCucQZHoeAYyCQlSoH9BruOLQZ9Z+g1gRp5CJNa/gAwfaDO3m/2zCtFDtw
	7K
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5407095ad.0.1782349285605;
        Wed, 24 Jun 2026 18:01:25 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5406375ad.0.1782349284807;
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f65062adsm7653335ad.75.2026.06.24.18.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Message-ID: <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:01:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260624151610.GC575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c7de6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jcv4FM0po0oPS6h7aqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4kblsxxOI4BOYhKfkhBYfzluQ8q_ZHTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfX7Y+53lMBncPZ
 TIADFUNF2WdB4HoM1p5q7yk11JtZPYY/v9fyzrhlaqIRnU0AABCVw+ZHOg9JsE6ue1pXWbqAUng
 Clw2sbBdB+aReTqvYiwcMeD1kTabd/dOzKX5TtJxIq6PmnT1fVnQyOd+RvIpVoM5wiuYvE/PvUx
 gOiLHigiB23YQsCrRvfmZoNzoVTLkcQfHYJxW5t36D9tS8mV1mfP7YiGWJ3r7TeWf6UMn9LLvTZ
 DFbGw4Q66lJ3WQDrh00OiW3Ik9YO6tstWbm+Trru9Qcga2rSpfu/bEsjaKh6UhLtC2T2fjnFAwk
 u3uHjeL3wwnDFLoFNM+kuEHJGNAqrnpripNdRKcquaeK44RWTFvRZPKxvu0gzyruHwp3t1k/n4T
 p9NWxAuUJEQPkDaxJ32uf5f/TL6wRqdvpB5lD3hZR06+G+13upfn0041DMIwrfQqZIa6Btxa3Cc
 okykOYen4ZTr1JGB3Zg==
X-Proofpoint-GUID: 4kblsxxOI4BOYhKfkhBYfzluQ8q_ZHTB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfX/yFABOn1Ql32
 dCopFWTQEZKHOppii9EAmmi8WpyB2ZLOsVhJFljlKV47N9KWjfuLfZCnHHdc3Vcl7N6QUU9Kb7W
 9n7m4WnlgsOZ4pWetPBkKIBIkjhZZCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:suzuki.poulose@arm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 509186C20E0



On 6/24/2026 11:16 PM, Leo Yan wrote:
> On Wed, Jun 24, 2026 at 11:08:32PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>> Why does it fail ? power management ? hw broken ? Is it really AMBA or
>>> do you pretend that to be an AMBA device by faking the CID/PID?
>>
>> The CID reads as 0 from the register, which I suspect is a hardware design
>> issue. I have not yet confirmed this with the hardware team. As a
>> workaround, I provided a fake periphid via a DT property to bypass
>> amba_read_periphid.
>>
>>
>> Leo commented in other thread:
>>>> tnoc.c registers both an AMBA driver and a platform driver. Shouldn't >>it
>>>> be registered as a platform device instead?
>>
>> The platform driver is intended for the interconnect TraceNoC device and is
>> not designed to allocate an ATID. The issue is that the TPDM device borrows
>> the ATID from the TraceNoC device, resulting in the ATID always being 0 when
>> associated with an interconnect NoC device.
>>
>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>> and the issue can be fixed with this way.
> 
> I think so.

Hi Suzuki/Leo

Which solution do you prefer to address the issue?
The interconnect traceNoC platform driver is intended for the itnoc 
device, implying that no TPDM devices are connected to it. So, if I 
modify it to allocate an ATID, I think it would be better to rename the 
“itnoc” node accordingly? Or it's ok to leave it as-is?

BTW, the traceNoC device definitely is an AMBA device with CID/PID 
registers.

Thanks,
Jie


