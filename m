Return-Path: <linux-arm-msm+bounces-104331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBtvHkMb6mkOuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF374529E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA50730238E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6679F3EF659;
	Thu, 23 Apr 2026 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJZRgTk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBlb4yZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CF3EE1DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949701; cv=none; b=paQ6osgvXSBa84LuUPQ6vwxyVh5HjCbSzJbzS6Oph7v+7VEalTrJ5Y0GUMUqRljkgoRuGD0cfDHmcEfKRthhGgqP6hQyzsE7APBP3gqPTCv4XlxjDJXggBuBi37VkX57N1LiFz0jfWfPFVsrhY0o3HEMoDqr/sTyBzDXdl9QBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949701; c=relaxed/simple;
	bh=JeKBGFKhmjEikeykEpVzEpAMRaL8OGouJD/58jOryKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0LuaBJyK8u7ZFzQLhKVthaYqva9ASpcglZVVVYJSuN8FeEDmQo/ZBkBzcBGxFP9awXnkph3y3b5XKHRx+qXGCKaafvAkg1pA+E/OioVGK+0l82jXxiWPXr+aCmdkTa1XRewv/FwJ6LGnqSX+xrh4Hsig6zK0yjxjgQBBEv+TY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJZRgTk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBlb4yZQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBx0Iq010165
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=; b=RJZRgTk/VEJZYy4r
	iGRQa4yy8j7KjA6LemHZiXfyson3/4DzjwM2wkzqtzBIrlOBg/3c7JGB0DnSslAx
	mK5Nq/ge5Mv2Ce/ESwBlwKaoDh1ywNYB5P+NSGoWj71GyqFrdJqFJVGC932ZW7QX
	l5LdHvflUo4afDaq8gea8Hcs4G+PJqyFQ6Q0Tp8ZfEUfX0c1lqvv+dC/hW5eHcuL
	+mCvzCuw0G8UT3smUTmw234huggSWakt9HFAcdlGrplI+Iy206I9KPgMT3HfcUdO
	mRjamnyaoGnGO9WItD33In4w5WzbY/ROpjm375WyIRElLkY+WxeVJ1q7t9AY8hI1
	drGb1w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk17881q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605a1faa7f3so419766137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776949698; x=1777554498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=;
        b=HBlb4yZQG8gN8CQnxzNow7Ms9enElGfjB/NFLCY0XGzoLY/ZwcaPbbm2LvwNaBms8h
         PNzZcPKgZttsWpXh34ONWuKjmLdB6xZseXWA2Y0c7NGBM5/ynnLJffKgjzn7fl8sVKSV
         dsOQtgj/q2jBeMJves3LmsJf7virukVx3tfxSoO9QrUCyk426g52OrPfmc1ik70F7xec
         q2dDgYSVVLLNd2vkOX6IHldgxfPTdcYCFYnVDzoSxg/VX9ZeQtnA3OxZQfHcVRwilqDR
         eqE2aD6iNGNhAJx3wWr8/H9yGcVz558yhI2R5CUX4FDCE1csO3q9D+4Ee3Ma+M+p3vER
         SxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949698; x=1777554498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=;
        b=hGGSI4XrOB9c1CM2zGt2A/SJefcGVh+f7meC6XlNLnakX7TWj+BS5hqy5F8J9y3bmJ
         LSRAG7jgaPFlW/CPbb64oObCTPxhGfHeQ1Ycj42wheVdAt4zNjiQb5PrcdNkHVNsBIWb
         n7ndGeWGEMhpb7KdLV6d4kUTLfIxBtAocoHPb5onA7hgfBho3RvrWRargrx1x6tO6/Ru
         /Ku82eDxilITDCqN0IroWVhPEf9kfXFs5mRymNa98gSOv8beiwgr1dbhrBgtVPh7X/G7
         p1e44c4Sl4/LRn7EIuXL+MTVav137NaFrodNIWz4f9BEZZmUMMBxlvLgiHwKYt8xCHie
         sQgA==
X-Forwarded-Encrypted: i=1; AFNElJ/PJl2yWabihKI0t1TIOUzSluoY3Nc7n+9l7o13rzSRz7QS+vxk33l8KNTfA9Hs04/ypiUHrA/WHROgbfvE@vger.kernel.org
X-Gm-Message-State: AOJu0YzmyJxQPSKdfWrn7IOdvpGNzUXzM1mH7pAtunKYj3G337HoDUAv
	JbGkwSYpq1AXrJUqAj2OkY7S3sSuL1/dPmKU2/Czz57x1tFmhsalYQgYe4Je5PL7yviUV8JynBt
	zf7OkWKis8KYDKH9a/3SrCg4eVjJ0kqMYzamUu5RXQKgY5p+KJhoiQonfnriP1OWCmUwnx8UFfv
	NO
X-Gm-Gg: AeBDietskBYXoSv7uUGQF/5G8sx9dDk+va1V4D3HnhYT1QK4Ww8/AaRYIX+wmms2dMr
	lsK2U18nNDWgyMrmIk+d9qEUzZrK1UVOK6teSvQTWTS/Lwlvqb9ggzQqswgCu2TTbjRwsFpB6W6
	1H2hCRYeciVOCP+9ZV4SIsC/VOwMMXVAlUKOdemgJ0XlLVFLIQqBaif09/RSgN1qeXeEb7NUi0u
	IEj3SAJxtGMj3LG23COU5xK16iUF2WT+9+12le0jeBa1IgshVxHOxQCtR6oM0epM1F1zGX3yUtL
	CXbYe0/FDJbJ2oEAko4rLjnkHtsIcyWlQxiUtvIFRRuEONRImXqVmFTvYg+EqmspinnySN8z5vB
	+M7XigW6MZqvD1MEGm5+4IKUyygxpGgYOl4EQk/yjEeXcyATGfY0wowuMoYNOo0LwjMWGQ312Pr
	lqQe0Hl0R3Bj6ksw==
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr5263148137.6.1776949698270;
        Thu, 23 Apr 2026 06:08:18 -0700 (PDT)
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr5263102137.6.1776949697737;
        Thu, 23 Apr 2026 06:08:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553980csm655451266b.58.2026.04.23.06.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 06:08:16 -0700 (PDT)
Message-ID: <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ULDUCTK3FDK1qsI7vBQjiFuI_JeZpIdP
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea19c3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=FdLPwuPmqTsolQjbzToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzMCBTYWx0ZWRfX3JuN3dEUrfDI
 hd5kCnd/OOzqaaMY8+rUDIlKPmSb4M3kRDW7faQOW69N0+pbqOkCwYO0QfqzZ+x+qQfRIbLZkyw
 PnHUPBjKqoj6KDdN/fLmzBe8Dgx5KDpc50faPWQ5RMooSOaegiw+QH5gyExYO0ArUfCljkhmpq1
 7djIKdCE2XystDbHT9V9NZ508fl9j6coNxcb5uFE8X2OMtn3W738cNIrPMENdAp/PFG984zvICz
 RihFv4TYx3YjSEHyBqhYxIUFHvelu2NF59zQ+L/FkW8641NM7Pwm7XS3K8NX0fQo5nvgstr9pAe
 /0f8tx8fcC4KjbPY0Um3qKz1qq+iMZIwgfUsqkik6XY5NAvjTc0I4P1djjpuuVp/wL6zqf4BKfA
 tJLTT4LE6EV6bmCyYmF/AJk9bkIJVLmeEKL+pvjc8rJ2AcQEy3v6jrDcPeJciOMSH9mcoBmY5LG
 3rQPgynZVB+wXHKsXRw==
X-Proofpoint-ORIG-GUID: ULDUCTK3FDK1qsI7vBQjiFuI_JeZpIdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230130
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104331-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCF374529E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 3:06 PM, Nickolay Goppen wrote:
> 
> 23.04.2026 14:05, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>> assign it to the ADSP FastRPC node.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 36b419dea153..af2bc29ccdad 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>                       compatible = "qcom,fastrpc";
>>>                       qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>                       label = "adsp";
>>> +                    memory-region = <&adsp_mem>;
>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>> Please double-check that, the VMID used to be different on
>> older SoCs
> Do you know how to check that?

The least painful way is probably to add debug prints to what downstream
calls hyp_assign_phys()

Konrad

