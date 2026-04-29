Return-Path: <linux-arm-msm+bounces-105237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE9tK5Qg8mm/oAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:15:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739D496A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8594A301A73D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE27372B59;
	Wed, 29 Apr 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXOWK4FY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQnAj1Qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E73002B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475363; cv=none; b=UUJY2qwDi84A9Ish8fdkqRgtbziMljyxaheZgaw6q8JHSFeBVDyPWzIU0v1AwO3D5MjYB4zUV0us09YHM9Ccr31/Wyhwj67l7dEUdb6Dr8rxTAt54giEozINEhwVzid/MHLlXymtrpiFsvaggk5/d2bjYx/fWaTjzOlTV/nK0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475363; c=relaxed/simple;
	bh=gtnFX59B1anRZ4vdjMqWGofH8RnHiE4XajnuH5mLi1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiGMd37i1DzNcr/zCASjXcIX1/Jqj22ZEwrVTrZmfkTC7vkPru7km/ooMJpqcApRDpU7Lr4igdG02ulGPEn/icvLMp6izOw5P6ySjL2V8bMcppCnxswVXX3RshxnM8FRX6MOs0fnua8DApEUhRL1fLaavqpqf74jNw7PV65xy08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXOWK4FY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQnAj1Qd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF1spb963273
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=; b=kXOWK4FYDMIl0i0k
	xYFSCh32mDwTTpWHsrMx+KAVzh9f4fdZGPheBiBrf3Dr3mwtMm2GAJ+PSRmgLdk8
	IZpBbIrjVWQTmpQT3gCQeSxqxGC/5xEam9uQwivEDMSzfnwpzfVeUrCMT8VVPEzD
	EO84TDk/dkVeW7Xlpxldg6af8ggOx8kCpBXgSG5FFsIUdhTw8BueRlB6v7Jpc8eH
	Sh6fussvOQtBugPAKPpU4RTuR2aGyNsv7xVJ5hinERpcxIZ/l8K4zqVY3nwr8P9C
	FK+e6KKkho06mNsfL3WqHuKPZqI9epKb/6zuF5AvkLluy8JvW22OUdhStaTV4Aa1
	FJ51nA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uyhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:09:21 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4718a1723a5so2141779b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777475361; x=1778080161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=;
        b=fQnAj1QdGHz0LkaqzzA9f5z/NTGHOOxpqbbuy4S9GVHWPAX3PxEQKlNb9RA/cOMrdh
         bDOpD++lM2i2rx7Y2MWvdnC52K4dQBY3wmLcM4thYjgB5dQw15XNt54CiwNZDTFDr/l/
         WPPmFpZzBwRXRUHrBsU6IjbcXksHurD6CXF9vZC0Sd0tWNdV37xFkrXzuUjfZJGzA4Az
         RA2Gab8htbOdWzCht5FNhIIiVGzUR7N05cvYvtKJIOuI28g/wGjITINiUdAn71JnmYFc
         qb408j3ejCx2s9E9GfTBc+MZVhmHzIvuV+iiZh13Ecp/1l2k0jYSGuSJfL7I9qRqORQ1
         8Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475361; x=1778080161;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=;
        b=THJd4JhMBth/ce3DDsWPt3QHAHOR9qT55udMlDRZgDz7dxsXNe7UXPBk5+NOrdHRxT
         5YrFPpKfGxzxEN9hnDTKjN43AHMk4+G1LFvLuxCley7cOHY9U21nOyPqYzYwWqe+mzUt
         o8IaPqy9nfg+Akt2M/7j30F1j8d0Ofhkq1P8rXQpZiP8nO6E04GdkOUiXMddPQT0/q8w
         dGwTZbmDZAjSen+YcmBGSES/qHX+hcE9H1n/iVrBHe1r2ynugeYRS6FOamWpBeWzJGnd
         2BVst79tfbVqHlWxsVMaFyF6+M9b/kj1SHY5V/5fVEZ3S45/cRCUP4uqNYSa6iTuvNh8
         75MQ==
X-Gm-Message-State: AOJu0YzmaN5VbwdFzRmDfNb2VWdC7Zv9ORHeuR5fqZY912wiyATEPplq
	AqElYaTqBYci2RpSpFe73Uoluxo4zjGsmmws8qBkS9cUtCKa0XtoQU37X4lU9IaK4w63O0yE19K
	dfipTdrIw4Tx/lx92sujLpVR0MpDDh5a1hy9M/+Qz84BwUEw8hnOk9K2MKmUMKY3DRiZd
X-Gm-Gg: AeBDiesfQwuhJL2xEKokoxedt5nJBOyp8RnHzL0yF7c9T7IUoks0brDtwIrw7WwKtj6
	geW31pKVdnJUfgqwLr7WqojYwFh+p0dlmqF67UE4iSZAg6ysYn+Z/7TEPs9jqayKzIZXNslUPso
	3jnm5JkqbKyFou1osHMsHyFATNQTem8xgfrjgnDJdmrKHVCKIKHb7RKCNIwLaaLDSh1OndNvRma
	FrhqSoACivdDEgl4eyEupbn0RD2Ihscqsqbcqhob+XLLOoNRdLr38j7dUnDUizePcudT6LK4G/7
	IzEbGW4wd3UbpYhWQKdB1zidWab8y7cz2lLiMMxJXFOgDSXh8wL20+LExKYqhAA2YpUWS+S0es0
	dY3oPXEX34JxmO8rtCaRRGoFCTiZzh5d4tarA5VrbLko5ifmzNFNQHxwQPxM=
X-Received: by 2002:a05:6808:14c5:b0:467:de0e:feb6 with SMTP id 5614622812f47-47c3d96ee0bmr2047600b6e.11.1777475360108;
        Wed, 29 Apr 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:14c5:b0:467:de0e:feb6 with SMTP id 5614622812f47-47c3d96ee0bmr2047563b6e.11.1777475359694;
        Wed, 29 Apr 2026 08:09:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216675sm6501075f8f.11.2026.04.29.08.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:09:18 -0700 (PDT)
Message-ID: <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:09:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1MSBTYWx0ZWRfX6tEMZ5C6nW/Q
 lYOQVJKAuynt65pYFC+NorgAwPzJLOkkmXPcALzXgx7foAf971HorOqqob83Ij/ssc8Fa14gVy2
 ITycbvWySapFHAhbDLa6l09K5od33DYqqwW1QNh0kc/ZXcBHWeNzT/W/Bc1UozZzhw/tdJvZ0UD
 7kqH/IIfxGWgH6H9WNIZDDbIvaUUm2KIgBW4YUx9YKUwy3V+6+2oPTmw8iaXWM388YnzGRhSlXs
 FLbD1LGQglNWaBjWFwqcRi1dN1vleHLKgEshcnG1binmK9zg8saukceFGGbrEiNcKM8eVvq5SGf
 OLSgVQsRd1k1EGN7xk1Fg0mwG/lBU0i6YqcQoffDjlVgbZ9Y6zEfhw7TSRfCo+DjMLG3ZAtCSUr
 qWC6ySsf/3M2dznbw+BKQhsGKy29oYlQdIEyr93jdKg4RnJZfBSRfYb6yYg1WSXZtnv67bH5QOd
 KYMoaPGRfw43Do0GUcQ==
X-Proofpoint-GUID: aWxbuP95K8QhA6TE5WrspA73wUcatpjc
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f21f21 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XT8seR4E2Wfhm39xuMUA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: aWxbuP95K8QhA6TE5WrspA73wUcatpjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290151
X-Rspamd-Queue-Id: 4739D496A8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105237-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 29/04/2026 11:23, Konrad Dybcio wrote:
> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>> basic or fundamental SoC feature: bandwidth management between internal
>> SoC blocks.  SoC can boot without these, but power management or
>> performance will be affected.  These drivers do not represent any sort
>> of buses visible to the board designers/configurators, thus they should
>> be always enabled, regardless how SoC is used in the final board.
>>
>> Kernel configuration should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
> 
> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
> are required to boot (minus the OSM_L3 driver which is "only" highly
> desired, so that your CPU's bus isn't heavily bottlenecked)

So the few of them should not be a module? That's what you want to say?

Best regards,
Krzysztof

