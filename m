Return-Path: <linux-arm-msm+bounces-117914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hN46FAdfT2p6fQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:42:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC672E6AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:42:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QH4aKFOA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BuXQsK9p;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117914-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117914-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24ABD3052B78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC433E7BB1;
	Thu,  9 Jul 2026 08:34:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7843F1AA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586097; cv=none; b=G9ROa/Ounj+QHuCd/hNrUmfdNNXt9UCpu532bmIDxIyJfKi5sJ6JocVbYtmCUL26ny3+mz+P3cNxeBY8sm29NxSRqHwgqWAzDcthvs4yBICLy/fZgHuJ1yZqJQXIJ7+tAKqTzqUOYANqgcLCBFw3xqaCwQ+GdbS77SRJz1xXgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586097; c=relaxed/simple;
	bh=uHeEFphcgQohAkDYr/VqMWOeeqX47QSuP5logWgt5a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVwU5ak8u6KdWdm1oAXaJPlkLMndSC3KAZ7EQb4zPkv7pilX/N9sTN9rRsNErr64JpEu5onIMf7rHVYjpsq4uNrHA/A+fV5nc1G+UbP0g4WYMgmhATZM65JHINYJqly09i7FZSYEyMIVnj1Y0irOJlO65BIQEjP1wbK5mJ0P2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QH4aKFOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuXQsK9p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Z5u837398
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=; b=QH4aKFOALyROa1dJ
	Op4o9GswvuRrGVtMDVlQYqO/7EySTe76uunAUKFGppQr9QMa1aUYDs7rb0S3iBHL
	ppZx1ot8Oon8YOpcOPHOVbDTxNl6H6jgP9DxmktMpt8bQij4JTO/NZ3vDrgOqazl
	MBRjpLBPe1zDSHdZfVIq0yfWr1SVyRrY5bxKQ8xL3kBARRf05mv3OyhhvOJIQ57J
	IX6VrkGh/zpZnOJfGLzaAeXvAs22Uh2qFLR55c1+dS61ycYdFpbkjGfrQpB2Hlee
	2je3aWcjV597bdK/di31lsE9aJjsr0K2dRp255nm1d+kKX2FyjH7q9Hml/pOANwh
	zDrG5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb795-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:34:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca3b314193so15989745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586093; x=1784190893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=BuXQsK9pnVSnCmzbna/Rrdy1UO71qWfXkf2OrIWBmB20oN4FPCnI4Dvceqoiwt4B/e
         IVqKq3A0/IuxEe/30AiXWYjdDs8bvR4z3mO5MCnOTN4maYPUvXRwCIVRww2abCwertsk
         6f/GHpegp+bumuIBaV0s+XoPqZixgx5cG1v+isAmoR3BBElCHGw1GjsoJA+1yvUSJxut
         XAO2h8TBmzgsmdTBRpux0jhG+Vz1QSE3HupxXhfWjNIyjf4jy/pgOUI/aa+S2FP+LD9z
         eYmzm7ZKqIKQJV9spN5KklviIfd6opDHGARHI8sdn5/RAi5Wl16m+KokBgH0YJprJ6aK
         yOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586093; x=1784190893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=X7XQnOZBDXYBrCEw6CUtEfybXTMs/9aNoXNOqZS7aFCkOm2UB7GDF/Esn5a5Jna+Il
         xSo0Z4RoittqG/JQaJmAAA/akBxd5Sb3jKUniiyB2pPoIkzwrt/1d7hxkZkDg01nuoJE
         NlzXFoi7YU8Q3X0kEbX5LofB46rRzG8E6LcjTZkRvfrDa8POBUhpeN7yayfd9h75vyMk
         C5Ssh/McRrTtT62cD1gAEe7gdB83aKaYebdWiSeI6XYcGYkHoW+SOlAtaxbi8F8eua7S
         Szb72WhML/OjLvG5Ac5QAk36ot15TfiiGnlJDW2lhgpev0daJUa4UCZ9tj2X7JTnFFAT
         +NWg==
X-Forwarded-Encrypted: i=1; AHgh+RoffUKXW18QT/8iBhKON1HUFbohAONyAikFFljBVEUdxkm3sELt0xgOGVipq3bBERjK8N3DuevFE5SDxG9d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1B5Td8axqIHNGbhF4k4lSawT8AIVyEU5MoF4AtCTHFoTJz/d
	2PxZFQoxpoUulE9/byA867tdYAjFA2z9lDIAV9BZBrL5vjJDLBwrEbmWBIkaUc+7DsohoM/HCC7
	7yFeamAcXltfwkT7qAVqD9PKaJF9WRYkdQoW8LrwiNjyeVDPKUqZokrfQhHgtR81VOXRI
X-Gm-Gg: AfdE7ckq/hj9xnlourY+9XFRojE7U74YYU09ZzDI4fpGL+z6Wfj8Q6folUAaDZSIeuf
	kZDAKyPg2ZVRL16uxCatcDYp6eeAapAHfdfhvVZmKYEKLvorHIjdCuM2uDj2i3CE5Gm15HWxXcR
	XxRFDK+zZgczvlKwmp/Pz/1FZo5xgVDP3vuMayADy+21sP78GpWJDTxVajExM63nEhYAe3vLi/Z
	1wEWGGlUJY0xQfpj8PSTvZvHcWImwRcWIT4YnVhJP01T1VjtLY7YDLs2tBBiSBB7ligRUbvmHnP
	nxshq/y5TL5e79BxcXLi0wI/EQB1quJNUuk+XuAWiLn5VmtXvei9oH8FuSgtv9UnUSF0K8vdG+y
	25XorO0YkLNUS+zpOBzVPAprUIvdBVe6FDbmqq/pgGwL1dbSdX4MNp3Yg93BCZ0BL/nWCRLfD3J
	AQ
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67471435ad.21.1783586092838;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67470935ad.21.1783586092330;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm40865795ad.39.2026.07.09.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:34:51 -0700 (PDT)
Message-ID: <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:34:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX3Bol+6B4W9dJ
 ONXmAs4huMJs1lcVWUqmuuymz2wdS+EwvQXe649i83l9+XqjjuDi4gxliV1yE6upfbprTqPevXC
 vhVsmbPOieDs1xQ16VW2KOLGYN2EzCfiYqg4/N/s4RAAet//0XeoQsyzhWyL1v0/hYvot7qUHw8
 A/1+tziViSjas2Tqan/D7OUGnmqarXQwV6ZomLMbObocvI9DW8027v2S9DTcHQOT39zWb2JUfR7
 hpEQCaYp40W3z/04iDOjE8w7GAQ4Nsl9WO14WWVO6hIl+KphcY9t6ww6HCLuBEU6D0szi4OfMPV
 X/Vl0b07hJNsFONqtjuXE96zMKu4RHMnxZsdqovronf1HeaU07Wax4NqRPO1KUNr9/K+ruv8xCY
 cR6FabMtMJkkdylClKAonklLb+dXDBPovCr3KkFHpY2yHJxGcmyA804InGgdhBXTL9LsxbUtC4P
 GfY4b4Wo/zvP60+FvWg==
X-Proofpoint-GUID: xdCQVfjmtNQ60t6JOrgxx4JvV_WTvPg2
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f5d2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fv-GP7Tdd4dwdnXjSPsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: xdCQVfjmtNQ60t6JOrgxx4JvV_WTvPg2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX5fwAgWhTeni5
 74VSl7ziyTha4DbpJxMhr/2FGXXapaFtpnPPMbsUoNdf/gJ9cQuM8MgcAaYsqQkSQwYJscEEgGc
 jQQNF167z9OSMXCeoB9iwdqjnsjEcFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090081
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
	TAGGED_FROM(0.00)[bounces-117914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 89EC672E6AC



On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>> The TNOC compatible previously required the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>> "arm,primecell" entry, so the device is created on the platform bus and
>> bound by the platform driver through its compatible string.
> 
> I asked already: this is not a valid reason. References to Linux
> structures are not correct here. If this is your reason, then answer is:
> fix drivers, by renaming or doing whatever is necessary to platform bus
> to behave like amba bus.

The issue is that we are not allowed to introduce a DT property to 
bypass the AMBA bus validation, which reads the Component ID (CID) 
registers. Besides, I cannot fix this in the TraceNoC AMBA driver 
because the driver is only invoked after amba_match() succeeds. Since 
the device fails the AMBA match, the TraceNoC AMBA driver is never reached.

The solution proposed by the CoreSight maintainer, Suzuki, is to define 
a dedicated compatible string for the Aggregator TraceNoC device and 
have it probed by the existing platform driver. If the AMBA bus cannot 
identify the device as a valid AMBA device, we should not fake the 
hardware description to make it appear as one.

Thanks,
Jie

>>
>> Drop the custom select block as well. It was only needed to avoid
>> matching the "arm,primecell" string on unrelated nodes; with the single
>> "qcom,coresight-tnoc" compatible the schema's auto-generated select
>> already matches the right nodes.
> 
> Why are you describing the diff? It's obvious.
> 
> 
>>
>> Update the example node to use the standalone compatible form.
> 
> And here.
> 
> You got comments at v4, nothing improveed. Your commit msg tells useless
> things like what you did or you want different Linux behavior.
> 
> Best regards,
> Krzysztof
> 


