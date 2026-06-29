Return-Path: <linux-arm-msm+bounces-114843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s7P9DwgJQmqHzAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:56:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85E6D61B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kQXHEg9a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bbmnIBQA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114843-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114843-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E383005D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D658D3932E9;
	Mon, 29 Jun 2026 05:56:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5F392C34
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712568; cv=none; b=jp6kbILfiVfGgFqq2v00SJ+7XqKwuLovNIswS5RwfGEgscJjWMBgppr5NjxEcKVuHhJvZqsmIPKgJKW/dzlGHhRPpBvoGMx4mMkYje0D/i/eEDmS8AUITwd0bZMiujfCWmvwMJbGWOZE8GI8F2D1c5jnl/zQJ2omY+yJNpAbNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712568; c=relaxed/simple;
	bh=Mr7j3gKOAGqyiLE3oEXghtyLorH2MjCZtUHo1zFa/Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isxQuP2gT14FkGw4ysa/qaqt+41pcBaa67TjJk6D+xH+V6Vv8F9FbCQd4FepG2U+oA5f4vSCainRqn9npL5vw4UH8/tLw8SpQD8Pc8SqpjPnWz2RaffcVzvwcgRMf6X1If86oCMTJJqAjAIajNZFhmXP7EygVtbVFON5g7tBm5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQXHEg9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbmnIBQA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJ5M1780975
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=; b=kQXHEg9a+fNPuipS
	9V91IUJn87aFL9Q9DdGquiQbvqkba4Lfm1qHDtd+5xCCLQUTeI2df28pwJWYZnMR
	oAOvV2juObyQl6Ali1aFka1AbQjULowB1dhywLLhhAhvNN9uZ0qgIPoZ+RpzWNL5
	XRPs94u5j472OvvX/spwsS8DzqqW12bDPa8wi6Loaiph6ZNcQqH+azrjtbPoQQU7
	Uh1jy3PQajJ0A/iFjxlAmppQQqd6BgTujNwu+s8tklgYSIZ4yNf8ToL6roeda64K
	rrrQMIRolZtLDkl7v8UqIEpDbA2czyJ98zgIs2pYCYMd9HvuEE8pRPEzZh3tPcJc
	WIRGDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u74u67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so1723065a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782712565; x=1783317365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=bbmnIBQA9GMmzLBYilEXRM/Wc8QV1VQ+n3G7WuRr+CxjCefjadSQ9TqkISOPfQQGXN
         QcnqdVKQQJ6n0TpjNfBw/50M9LGgOOQWXOXDO0HLCaYt1wVQATvdrI8wdItEP5xao3nQ
         zS7yjdCWVgxWiiI2kDQEGUr5ZB3cq1pXDmOzs+UTzH+CQpzi6S9u9mKWSc/wN2aaMNjZ
         nrENeAQFUW1mgdafViTYuqy0w3EOYlhqVvDpiFz8b+IQjZuSoYg/nAcRbjU8umJAtsxK
         Lg4UkGYp0JL3s8hMtSS0M9chRr24/4m24zZ3q0WyPNBTCwUAvNLqhLyutz5GBJEdPsPL
         UBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712565; x=1783317365;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=OFdVfmhs5tNjusumx4zVG8tR4LVvfM3oYuIw2Idtm/9J4ND4zckD4B5Q6snh5A/OpL
         SQrnEB/bZNq4+cwEVE3liLbq17cCvY2cfapCZ6/2CJA9y024lpt5yrSbI0Ml+GXAEebC
         sh71flyqO2W12YiaeailjQMtA7/qGmTDzUHV0YONZMN4nV9zNSXCj3he+zOL6RU+kJ1i
         E39SwaGaK2pZGNJ8TjFUat2UroK3foyd7pW+uYjwx2qjvJUG+IXjrZOFWgSMTqesP1qY
         Jzf2SoqH8WskuFQbJfge4UbhzV2RdX9/5DkN5DVaWHrSzprkF2747l2WAb9tWmYBxX4V
         YkCg==
X-Forwarded-Encrypted: i=1; AFNElJ9d7ozEGam3IxxnZezclERTForoBsmrT3p+4Nr2iGmSci9VAJiImU3CMwTBDPRiWWDKhNFcU8k0qlQOTcNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3kUqaMwTPqMsix5oH7Yhm2irJdt1rJ9Oz6AF6FqeDnWDuA16F
	PL8gMj1yB16/PBflUy4TUt17GvU2gGMI5a+aPsW7aM6geY2QKJmP62g8b+S7uhiv7GBPfu2GesT
	IhZkZ1EyccQ+RQ1N5q/eAmYRbBgUDB0ugZXyVtwxRz75fdoQZEHenLxuh1x7l3LM9IY8Q
X-Gm-Gg: AfdE7ckW2QbCwYleGkknpasAI4H2P8qCclcN5UMhFbYaT1nBKBBnjfmqQa3J8iw8ROF
	56+CM+5XZDkoK3GN1pCG08uCv2+nFag6xcn3Y6gDaQOpilH8aO62C7WsQrw0xIpTthSyqexuatz
	O814nPOzr7uLI8cAM8fFUVBYwKWzB1NPaR96fOedioLn03+bajxMOx5COxxBjfKaiS7aKUWL3iK
	W0nem/0SYOs0Xb5WO3Juggr933Y3+A5JMP5EDYzHeNZ38XkdrdOdn7J12szaWDVDpXTLiyirflK
	IETG9fQZFY26ktwfrwhvEMvCw9WCtnkCY/7GvFEWi70ivTUGcV2LLjQUr4pnVwGZDdb0d6gXZVZ
	jCCny2ahTeslCksUTkngJIqUBB7kyCnN9u1OiC33XSIaKQYFSueWHwMHB/hHi+auw+BDvYEfPGT
	xsA49iFv+F
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239039637.54.1782712565068;
        Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239006637.54.1782712564508;
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc91f6dsm7072662a12.27.2026.06.28.22.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Message-ID: <1714ad84-18cf-48d4-973d-b5e454d27c6c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:55:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, ulfh@kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linux.dev>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfXyDTHYrEjpo/k
 /GRAPac3k0ygacQPDHCKkzlUJzFNZA7sR3infQ9LpbxxovFxBXKN5Px+YWzc/iHs8fOAJS0hQSv
 IUpp3RLBs8t8oXrzBi2AtZVAbBb5UUY=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a4208f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=-HkNxc-VA3X1G4HRPRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hWYGQoBjns3IDAzh72pWhzNxrTQr-pWK
X-Proofpoint-ORIG-GUID: hWYGQoBjns3IDAzh72pWhzNxrTQr-pWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfX3beDhI6Gkj7/
 m5NkMyp8pFMzAIUXezSmgJ3nwHbbwEFrr0X70aSsBkKKjXEdYThyePCcgg1nFWb0kMjTjmy5CDG
 qo6fgXXNtdCEU7Bvmuml8slkBZifXYI7xlPsqwG05uPqXgsoI0GUtbzl3vDGx/JKfd1tlww6NMn
 ByY15a8sp9pUpI5pWy3j8w68eqDFHrLG6Ijz7R0gyhR9AQuBVmyuKni1RWqruF47hF3UXu8m0Of
 YNH0b4fkYMAEcE4vnLJZBMqfIuq77eShj5uPJPikHeKA1miSsiMQcHzrq3+e5sW/0c3P07IOLG3
 2KZiYdA4AcxoZqvZpqP574dCAER4OnEgQvb6N2n/LD554g24f6QjbzqUct9osnAhJbv0b5yksFU
 aWWWxZxVFMc6WU82b0NV6jA99uYtl2YawnPVNtPFWSE3pe4qRTJAlIUKEZRmIHVbV4cfiyOtR8n
 66YL9lS/Hw3wLiWkL3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290048
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
	TAGGED_FROM(0.00)[bounces-114843-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:url,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yuanfang.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:sudeep.holla@arm.com,m:ulfh@kernel.org,m:suzuki.poulose@arm.com,m:leo.yan@linux.dev,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:alexander.shishkin@linux.intel.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:kernel@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanfang.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B85E6D61B1

Hi Sudeep & Suzuki,

Gentle reminder on this patch. Any feedback would be appreciated.

Thanks,
Yuanfang.

On 5/25/2026 9:17 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 12/19/2025 3:51 PM, Sudeep Holla wrote:
>> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>>
>>>
>>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>>> domains. These components require special handling due to power domain
>>>>> constraints.
>>>>>
>>>>
>>>> Could you clarify why PSCI-based power domains associated with clusters in
>>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>>> OSI mode was originally intended to support them? My understanding of this
>>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>>> to be a flaw that should be corrected.
>>>
>>> It is due to the particular characteristics of the CPU cluster power
>>> domain.Runtime PM for CPU devices works little different, it is mostly used
>>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>>> framework to manage the last CPU handling in cluster.
>>
>> That is indeed the intended design. Could you clarify which specific
>> characteristics differentiate it here?
> 
> Sorry for coming very late on this.
> 
> This series is intended to handle coresight components which resides within CPU cluster.
> For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
> are hotplugged off, access to coresight components can not be done.
> 
> The implementation tried to address in two parts,
> 1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
> 2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
> ON while coresight component of the cluster is being accessed (using smp_call_function_single()).
> 
> The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
> to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
> cpu-maps (which also defines the clusters) from device tree is a better choice which will give
> the information on which CPU belongs to which cluster.
> 
> (2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
> cluster) will not enter power down in between.
> 
>>
>>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>>> .power_on/.power_off) callback implemented which gets invoked from
>>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>>
>>
>> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
>> correctly, all of this complexity is meant to ensure that the cluster power
>> domain is enabled before any of the funnel registers are accessed. Is that
>> correct?
> 
> Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
> for same cluster are being accessed.
> 
>>
>> If so, and if the cluster domains are already defined as the power domains for
>> these funnel devices, then they should be requested to power on automatically
>> before any register access occurs. Is that not the case?
> 
> Cluster power-domains will be only available for PSCI OS-initiated mode but also
> will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
> platform coordinated.
> 
> After discussion with our HW team to automatically request power on for coresight
> component GPR [1] can be used but they seems not working as intended on the existing
> SoCs and will be available on next generation SoC.
> 
> [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor
> 
>>
>> What am I missing in this reasoning?
>>
>> The only explanation I can see is that the firmware does not properly honor
>> power-domain requests coming directly from the OS. I believe that may be the
>> case, but I would be glad to be proven wrong.
>>
> 
> please see below comment for more details, This seems not a firmware issue.
> 
>>>>
>>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>>> out of LPM, making standard register access unreliable.
>>>>>
>>>>
>>>> Are these devices the only ones on the system that are uniquely bound to
>>>> cluster-level power domains? If not, what additional devices share this
>>>> dependency so that we can understand how they are managed in comparison?
>>>>
>>>
>>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>>> Their drivers naturally handle enablement/disablement on the specific CPU they
>>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
>>
>> I understand many things are possible to implement, but the key question
>> remains: why doesn’t the existing OSI mechanism - added specifically to cover
>> cases like this solve the problem today?
>>
>> Especially on platforms with OSI enabled, what concrete limitation forces us
>> into this additional “wake-up” path instead of relying on OSI to manage the
>> dependency/power sequencing?
> 
> + Ulf in loop.
> 
> Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
> requests, as far as i know, runtime PM was never meant to implement this part and
> pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
> to cluster power domains about a child CPU/ sub domain being on after it has already
> been landed in Linux.
> 
> The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
> the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
> low power mode.
> 
> To put it other way,
> For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
> its cluster power domain) ON. In order to turn on the CPU, one has to still request
> the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
> which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
> only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().
> 
> I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.
> 
>>
>>>>> To address this, the series introduces:
>>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>>   device tree property.
>>>>
>>>> Really, no please.
>>>>
>>>
>>> Our objective is to determine which CoreSight components are physically locate
>>> within the CPU cluster power domain.
>>>
>>> Would it be acceptable to derive this relationship from the existing
>>> power-domains binding?
>>
>> In my opinion, this is not merely a possibility but an explicit expectation.
>>
>>> For example, if a Funnel or Replicator node is linked to a power-domains
>>> entry that specifies a cpumask, the driver could recognize this shared
>>> dependency and automatically apply the appropriate cluster-aware behavior.
>>>
>>
>> Sure, but for the driver to use that information, we need clear explanation
>> for all the questions above. In short, why it is not working with the existing
>> PSCI domain idle support.
>>
> 
> Explained above.
> 
> Thanks,
> Maulik


