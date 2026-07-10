Return-Path: <linux-arm-msm+bounces-118161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcFVO8qLUGqQ1AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:06:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B327737844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:06:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LkqPmu9u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bd1w8fu/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0633330054D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360773A9879;
	Fri, 10 Jul 2026 06:06:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E67384248
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:05:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663560; cv=none; b=cOmzkV0cPR1mJsdJbUCDla+WrrPANoycn9RdLhZiWM6iIyyYzMXbRwEBI0bQgPG1M85b+yisRle4Y2hwjqWzZ+bszG8uKKJhIPcJky5Sb1nCa//ejaYLh8Ac4kng610sJku2ZQn/yvdLXMh2Sd2A25ToLoiGg+u36gCCCQrCMu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663560; c=relaxed/simple;
	bh=qA+0IJFl9PR5cNXrobQbP+5Im40y4SAZ/GkzfaotHio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aswIe/Cq9oHlgzgEgNwpDK16Vo5twi2EntYMaVmc8XTHrTzYMZyC8ST59BsTIA1U0xVNIXQ1D5dnWrBJxscbEV75gxJlaoZTmCifj0D3rFoqgPFNrTmYT4x1DYzbqZBBKSHrTTG7O3G/vLXrL/qExxTrNzv5Sb7Wv7NUlLS5fGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkqPmu9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd1w8fu/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mrZL3721322
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrTdROjUR82KO5Tr5hBCL8VlYLfIpeYkN+z7iLoplTc=; b=LkqPmu9uI6rybdfQ
	UBsmB8vr6FL+6iwVJDY/UdWNNo4lwfEUtKq7x5N52REM20Yv8qyDYvd0fCnFw7V4
	Zv3ddZlWmw+gTY5wtM8/IJaQ4zu1NOyQnY6GAL/DjszZ3VOYI9FW80WBQ61CelMq
	VNGW8CnrayGViHQrMG1B9KypyBf7FdrypZfezlNAk8acsiOTEY/GYB2jo5BYvgRy
	SgiK0Y217hcoOmghnf80Nic0Toql14QFwSMmRWJWaH/eLujDNXSX04lS9Hf63FKx
	9O70Dsg2gCZve2QXRdAgfzC3kFh1knh2BPUooYwDoVrFKumeLs8MuNFwh/VR8LgG
	ym20TQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt9keg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:05:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0ab07320so5185431cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783663557; x=1784268357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrTdROjUR82KO5Tr5hBCL8VlYLfIpeYkN+z7iLoplTc=;
        b=bd1w8fu/SPVMrO8uT1s3WPKZYf/Nx484Pucxl2IVI/Px8jqie7RrFG7zoHRm82y6up
         NzNcgPZL+0WF9Dy563ITeszP3bxFmKFs8I/nxnnxxh0Tjn138eXDRsj56WswYUcRbQet
         wUHMhpPNGVi+Ruc/jJpnvUPr4slRcRdb6yTEZL5MtSvZD8Nvr6GRJIj4bJ3bd2qNC7BP
         knaayuPRJan5s8YJce03Pl0x43alTc9jRmQr2vhMZcGpSj8Xrnz9BX3py814Tx8jWnrD
         fjSoTz/OkzxDHIb6KE7SKH4KVX2oiP/XuWuHRXqmbpMZJnn1idY4n9VFkw2+6QveNS2M
         QoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663557; x=1784268357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrTdROjUR82KO5Tr5hBCL8VlYLfIpeYkN+z7iLoplTc=;
        b=REOb5kBA/y+IYyQgBPbYc8svZ3h0iAXwNs+WkNpAvHhrIkFEBYPsMOye9KHZZp1pSq
         7sX3cJh7edycuDQqc2Z1Cf/LXfirPro3M+gs5DiN072xXQiRA/YpcPwe6ensMn6UrUBd
         IGfKk8ecpHgIEpNVzn0l90piD64HtHC7VBzkRj7D8x/3Zio4RxF78BD+RvbghwbXAXBc
         FbwEasgfVrju4elXX9cTZ972P6YJ0B3iDSaHCvfWBpgPaG4U2qDT+uVOBopN38Ubwq+M
         BACVjNTi9XwHteGqlFYk14Jq5AngIJ+r/XzZ6AeV1IHtiLV0Yy4wd8IYbQl+cf/qTXEI
         jPdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7MyTutDNcQFbfKtGo3NObBgM8fFID1lvQuqdmciBjugRG5ec3TExGM7p6kavGZsgV8FyT7pKaHrxNEBiN@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnwJt2Rb8D3M5TciTaQsbn8BYMBB7KyFlBEHrkqgxslsRrxjl
	y85NWt9Pc7LP4v+3GG2aThSRrdL9QTN5EhLmW2iGMyZjZQaMZGgZ5WQJBhjX0ORttBko9KOMD6D
	4wU09gCyBPd+HEi1kOmsbSGulZd5jvYtgKADCmfq7TsIurI2Dp2URd03Q6/UnmZrvNKeqxB+DUw
	fp
X-Gm-Gg: AfdE7cmftiVGcv87mZy7N67TfhfjGSNAStcTBTPTAA3FVVlUq4Z0fHpwuG0LgMGDb0t
	4kjfbCelmYYtW49d6rSp3CwJfmUpePDcw5he2CIs4j9c4J4d5i0Si1AnyBckAaQNm21AsWOnnWe
	+EKn96ylloJNaL/PQfwPGyHgXnAU0OH5Cl64EZNIXBbtYe01plTHYlbRjF78jcD9zxMt+UWIeaJ
	dLME1BaHMwErzvKH8lGBVwcjB3U/sIFFhxK78JAQHppSX1WqXzqmOxRC5TBwRjA6vJWI+Dv5NiQ
	NjJJ/pJc1Nq8bLSCmHwkV5RmVC/keXk8Ffif6Gil0PHoirdobjp5lKpW8vnLHkR/kkBji0QilMx
	Yu3t/cxkZ1QGZoh477xeL79YSZvZckObAr+v/1vUge7SQ3A==
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr114446431cf.64.1783663557083;
        Thu, 09 Jul 2026 23:05:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr114446151cf.64.1783663556699;
        Thu, 09 Jul 2026 23:05:56 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d6cbadaasm327419266b.46.2026.07.09.23.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:05:54 -0700 (PDT)
Message-ID: <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:35:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a508bc6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JeYc7mxaJg17-esw_n4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ELO_AaS9R-UN66YsverD5-o_1_bPEqrg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1NSBTYWx0ZWRfXwJIVIUNu66U0
 rxM8ehVx8hNP1/EuVH1ryVRzBhmXEW34BDuGxYR16FZDJ4hNVFor27BZNOE9tLU0j0wapFDclfQ
 +D76rmhQ/qSlgid4/9dOKtTnGVgdjqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1NSBTYWx0ZWRfX60Bk/V/uTqjh
 z9fhB9v8iM6YbAAl78IVcpc2emH48R6o+FLEL4IhNDs4zddNtfLwGy5RiwtIECoOVc9NOQhBt+l
 GfVsxpnlLJZ6Y02WaujkAOWwar/K26DYoIfR+vp9tA4eo8ig0llcwSofqpBdgjNEdwimJDmnZ6K
 cOgW0k7QI2ncFdvfCQ7dfSPux5ifkuv/N3mRvYFWWdBKWxG9sqCISWzSWq6miDevjy6ZFY3rDoe
 og9i4L0esbMN1hc8vTLUlLxbIqVz5R/nXwbNtTdVyLkVtAFkeZyVS6izXB0f05vJ2XZreXlyqZ4
 AqhIac9cFiW5fdfuWDbXMRpqeRyH8gwU7mSueNMSIIuf5YNyRQ0d9wBW2FP3K7Efkwo+BEiumDv
 ioIFxsglwwQpPmvIRXXzlTN8ldejg6+NilVBSksDXeXHeO0syEFOFQEpQuu5s68Rmy+DmNmKUQ8
 kYEEyRQkzF4no0oQFng==
X-Proofpoint-ORIG-GUID: ELO_AaS9R-UN66YsverD5-o_1_bPEqrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118161-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B327737844



On 7/9/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
>> The Iris VPU has separate streams with different IOVA constraints. The
>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>> pixel stream can use the full IOVA space.
>> Using a single set of IOMMU entries for the Iris node does not describe
>> these per-stream limits and can allow accesses outside the supported
>> range, which may lead to device crashes. One such issue was reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Add non-pixel and pixel child nodes, move each stream ID to its
>> corresponding child node, and add a reserved IOVA range for the
>> non-pixel stream.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>>   			hwlocks = <&tcsr_mutex 3>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
>>   	};
>>   
>>   	qup_opp_table_100mhz: opp-table-qup100mhz {
>> @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>   			reset-names = "bus";
>>   
>> -			iommus = <&apps_smmu 0x1940 0>,
>> -				 <&apps_smmu 0x1947 0>;
>>   			dma-coherent;
>>   
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +
>>   			/*
>>   			 * IRIS firmware is signed by vendors, only
>>   			 * enable on boards where the proper signed firmware
>> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			 */
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x1940 0x0>;
>> +				memory-region = <&iris_resv>;
>> +			};
>> +
>> +			iris_pixel: pixel {
> 
> Unused label.

Kept it for consistency with others, it can be dropped though.

> Also, shouldn't you specify the IOMMU region for this one
> too?

There is no iova restriction for pixel domain, hence region is not 
needed there.

> 
>> +				iommus = <&apps_smmu 0x1947 0x0>;
>> +			};
>> +
>>   			iris_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
>>   
>>
>> -- 
>> 2.34.1
>>
> 

Regards,
Vikash

