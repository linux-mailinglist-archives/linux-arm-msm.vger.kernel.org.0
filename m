Return-Path: <linux-arm-msm+bounces-93267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KICCB32hlWlcSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:24:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03E155E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B8D3024CBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0A130B51D;
	Wed, 18 Feb 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrsCQP3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClaSVh3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE130BB8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413872; cv=none; b=Dn6qJm3rwHYNKIQj1TVJAblvjx5njHOm4EY3OF8IZbL48HcNOHpX6+mhu9mMxZT/r2jwgatZq5r0hRIE7YyXBtf/Qo9fhcrBJshlp6ou4gbMIsZ0emxZfqCNqGZMKdMwGnMKmLioJb0eMX89Fy3DhVqh7HJGXK8OOgltzvb86lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413872; c=relaxed/simple;
	bh=t3n84ScvnFt/PXH+NefQQz4XVZm8WFyP0DLTedCYLKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F57cyMdypvYpbKhc09Oe55gTWPLFfh/l6zJdDPrXOBokO1jrDPNiknA17I19B6zTEDWi14Prlg0pFnzG9Rk3BDSW2WazZn215+nfeuZYKXBWRQatPDUnM01bK9rvRmehPX6zwg065EJo3L0D8GD/EjDK6xjK1X9HcjIXn+a/5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrsCQP3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClaSVh3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9B2Qo3695372
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=; b=NrsCQP3/XLjHF/eP
	s1SF9G3wPkoR6/F/lYbEzRwIN9K0V7idR3JlFq6wRFc/E96lsePfxJ0Za49Luq5o
	pieNrKuTKzfWDcr4AHAUqZb7C6YkMyx0ISc7BpPqomBNj0baG3I6xtsAbelpUpDa
	8cIaVPqE72NBHw8EnWQ6SjjYMWYzRIciz35rzpRYwuYeJN4qYChtX7hZ2cyEJv3o
	DeR2dmz4YVUR6a4H+s1yEH6Maqt7GjBW1v95gwMz8RnxXXOxueMnbV3KPMTL6LNK
	YhI1oKw7jTdlKk3FyjqtrwMAj5GSW8Kfs3KBFSQJbKfadE4l7z9gyE+wEKSAX5Kx
	8narwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb230k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:24:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f5c90f07so53887136d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771413870; x=1772018670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=;
        b=ClaSVh3SK/ktxjJJ6A/qMMoLIANXXpctBSHSB8mCDLIw0ylBCUjpl4d6RUO5X3Y5/c
         2eE67seib1LSometEEmMklD1Nb//WIbEpl6dcd+ZqXxcp/2D9oRElnoxsfpHkty3Zy1G
         xRBnDxPaLthXwHHftfv4qRDxqj75Da5XEdCvhI8eKmC0oBnMxn/GMiegH0D8xS5wvVtW
         xW2faX+p6huyKVmoWEYho62M5DWCPlvamXo0l+aY6yidRiMnhXp33OSbf7QgDE5BQfm7
         W0YurUngLs7ET6NrzRoeihM7JwbhLO+cLORu4p+21/Zjd4cXhPKmUIQXfetAuJurB1Ar
         0ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413870; x=1772018670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=;
        b=CsyJsLs2zHdIkRV8Xm+8/4RqdjPt6s6LIsS+SdX2wwwKRNJJfwdxc8ngkBfm2xBH68
         Sj/KQHPvKmpEZCAIKHOfiKEjFdbXKL6kxtb7nupmc0zvrVyQ858D8hMlhVvd6QkQXhWB
         zggqJT/SJ2D4hdJAZAy9XZdkg5byUXKcCaz0SzA0QkUbTdSwTac9y8+IM13rvXghYl14
         2iBcyLU5vb34zqmfqo3Q8/nxXQoACr/5XiWzNyspJ3CSv0jgoGduwN95hUsZmonyru8R
         KC1P90K9jVkY6EKB2sY+GucHkUfHktPCl8ZfP4eq+fvu9wD3fREC5IRWUTe5mAYQysGD
         aYwg==
X-Gm-Message-State: AOJu0YxS+1K52q0QdV3PjTnjlk1PKpZvWmSZulVNjnV0ED/oAIhOKI9T
	fMWjNAZWXGZkRTV2YGzbXmAmxQ2bxCtdMhgY5usc/AAWydSnR0QDrhG548ABm08YFWB9OUWokZV
	GuvTOOeYLDo/R2E1/bU/vnc3ewE+2RG+fOysn+92/93H8vaz5+PCLJXPGdzJ9a74HMj8J
X-Gm-Gg: AZuq6aLCdRx4/boq5pOS6VDq2JYXAdukc8UrtpzcWMSD2NgYLZPRUHrli+b/vkYAq6+
	bTMpq+3JoRbq+ZUEUG7ghRXcSnEYMgYez4Xuv6p6zr4p42Hvdn5r5bRNHsy8WjFcbNH0fPM1LBU
	bgdiG6qUnXC+TLcVpQnuns1xBR3le9nwKFtxSfoiazVQjsm/H+eAuQ88Gr5GXw/WhiMI0+f/8uh
	ansVTF3RFq/RZRRxAHx0a3/7xTRRKI6uwMiZyzyWavm6FuG6PyHIKnJyh8TX1pl2IVwkvyjj7zM
	pilXb4BsYHFRenN923MyUHhepsvS3kVFcsZlSs+gk10EaA/2urclAXCBiu+d24EwC+l+zMNs6pk
	d+Jsv8DdODlRlihkdQcTx00XLz8ZXJ7hY5eECgFS/NlzaFc2+Y2zvG2GE30vmbmYwt92K8QPSi+
	3NdsQ=
X-Received: by 2002:ad4:55ca:0:b0:899:5565:efac with SMTP id 6a1803df08f44-8995565f010mr19929906d6.3.1771413869675;
        Wed, 18 Feb 2026 03:24:29 -0800 (PST)
X-Received: by 2002:ad4:55ca:0:b0:899:5565:efac with SMTP id 6a1803df08f44-8995565f010mr19929746d6.3.1771413869292;
        Wed, 18 Feb 2026 03:24:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm458895166b.37.2026.02.18.03.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:24:28 -0800 (PST)
Message-ID: <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:24:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EH-VBStdNqIYW9vxTgaBYqCbVUqRoFhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMSBTYWx0ZWRfXzn5INKA4QOki
 0N00jPPs3YdBwWcCf18wH81bnuOV3efJ9ykNHrYaIeibayK221PL2SGIRee9g6rA6e4fSe6MviH
 /qVo3O+dYQ6H7T8j+IZJU6ePMKgK9NzDKURZW35jsq2DX0sxA5wXRXJxzYaNYuUGnEzoktUgr8t
 gF9MkhiuK0KAMAtRUwxF0L2lii8icxfWRoRIj5L5T2B1FS3f6LfZO2UV7zIHJ1t09W0JCZRA6ap
 R0N01eKPKySkhdwMbApzJs9H9BbOfCeXCuUl9bqbGRM0Wa6zbLfJ+BMidDTjJeP4NFJ58VbrUU9
 XZ6K9SgSd70d7k1jmENkpE2bUeCYSSNHPgOyMXmcjV7j972bL9Mi/5Kyn0DyMSn+KfWV9UTdF9X
 6CWfWnYNt+/lncWetK1CpWA6yYNY9ldepFNy0ONjG9p2Hk8YXG/YkF7v/MItfgsnd7jZsbdEEc4
 ioo2zzXl6t0mLpuBNTg==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=6995a16e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=QSeG49lCECCrRmREOcMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: EH-VBStdNqIYW9vxTgaBYqCbVUqRoFhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93267-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,codeberg.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE03E155E1A
X-Rspamd-Action: no action

On 2/18/26 12:18 PM, David Heidelberg wrote:
> On 18/02/2026 11:30, Konrad Dybcio wrote:
>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> If the OS does not support recovering the state left by the
>>> bootloader it needs a way to reset display hardware, so that it can
>>> start from a clean state. Add a reference to the relevant reset.
>>
>> This is not the relevant reset
>>
>> You want MDSS_CORE_BCR @ 0xaf0_2000
> 
> Thanks, I prepared the fixes [1].
> 
> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> 
> David
> 
> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/

Please don't alter the contents of dt-bindings, it really doesn't matter
if on sdm845 it's reset0 or reset1, that's why we define them in the first
place 

Konrad

