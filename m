Return-Path: <linux-arm-msm+bounces-111923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bnShIjDXJmoUlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:52:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D867E6578BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:52:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kvp+drH3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L+l5qBOF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111923-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111923-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D951C305660B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653E3CC300;
	Mon,  8 Jun 2026 14:37:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CF3C3458
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929437; cv=none; b=D+w/ym7G5cwoZfpCu4dUdcm7jwWqW4BHM5Ck4LmbnPxkymRutpsrY2IdaA0MD6O1d2Py0LPodoZayycjADBkwwrMJjgeCu4o14MiDjG4wumaz+DCsn5pcVmWSmuj+73FpM0fe/8la3vGZ4Dgig5H33IDqfBhNTj/UG4PL4UrTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929437; c=relaxed/simple;
	bh=GhxPscyjTdRqvnuHsPORS2ylxlI4B7zrF6GCR8tfbkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EITc5Y6YAKJu3G6QPwPtGtUQ+lamzNPc8N7rEbdueL0CZZesd7pE4+yfG1UkdvxP2Cznp2ueUjLpa3Kci6jjXNg/WOqyjxWYuizZVHByPhb9hbYYcsr3Dnhb62cN435l5p1J4k8/sQRjzAAm1KCAYe+eKJdOZtJvQ0CHNTovuZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvp+drH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+l5qBOF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY0e83918026
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=; b=kvp+drH3ktQlQkD5
	z97b6zFqqntjW16AtiJ6RlbqmRsNm2oc9usjfGX/TYZaEdbQ+Gw/k7ooh2n4YgOK
	TfUcrcjE/IRF0xVJrv8Sj3BtU7m2PZjQU88LLht8airbemCq9Dmgg0PF6uojBTg7
	JNfIGUSndCF6U+cRcHUJj2SPKkmG08vT6TGTNixBz9KDn3VyjPCDo/DehY12l+E8
	Q+on8JjHKEXqp3jgsezBzXIicBCmSYWlU0YxBM0EgfTehFcapN0lX6PujEI31n2Z
	jtH+Q4+YMZtfQDbxt+ApCFsvzjy5xzFh3EBtbiaCdgF3oUUUuc730yquXHZrJssw
	h5gODg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8h760-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:37:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842692bf60aso6590797b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929434; x=1781534234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=L+l5qBOFP8ZcpOVKEUWqyI4YGTLLzfmC6ihI4i/cV+NKWhGIo8Nr+cA/c4W8b8OfPe
         k4cPsi0gqWVJKRebTIczE21iJ9sM4+2g+IErZ+Wslg+yAGy/Kp0RftrWzowyjeRdfnln
         joM96Dd4GuNQnwklmE1YU/gnO5cyacvLgU8A8QpI2ARjV17XS1M748CczSirefmJkCEx
         WIprhiNjhWY6VBbt29ZnQNEctgBJqAApW5qqHMqMpY/kjOPfNOQWVfWQkIcTWe85/ipY
         nsGUouUoe2jxgUAPVsBSrD8frbJDx2hwDobaG0GFUGjGqqPZXMR2nfR19ecUxWvlEXCw
         lhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929434; x=1781534234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=m1aEwCnRRFkApJHUjNv7U7PqeLEXQhfyEhQ9MYgAsqxzXnkB2WwSj8FOPSz8HC+xgN
         u7SulXW3nOyWVA8mKc9B/JIXlbi5AdQIE0PtCQHhjuaEZMsnPRSJK3CSGgIOGbA9YryV
         jvXqIr6RoJKQ4IVP/7xJMiaT4QqfBxEf4K6FBK13SO9ocnnRvQ4taequIJVe++Zn65t/
         fBMyAm+l07Vx23HhdQlgku7d/THC+31X2ydWunK+MhG3Q429NbGiCD4AYf1kmmF5UUV7
         4ko4lxF4VbOT1KNIBSw1VHVJ6DJ3wXRJmjQZR5OoS4eg40bhA8foN7aYFTJ794y+jEci
         yNqg==
X-Forwarded-Encrypted: i=1; AFNElJ9o7ZrOL65e2zvifpgiqDDAjbHuDk9f5RUYgXnnlMmCqzVjYa7ZkcHkHcYI+du24iEKdNChRksgLfLc7QAV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RXtIsSXvtWoJRkurL93QhDEFCPclmsV7hQ59S4DdF5u9tbTO
	Uf9TkAAmLM08nSr1xvIZq5W7P8Il+OrSRKOyU60XW3unWegz19Daehb0HVHd+e/H2bc8QsziPth
	1MwbAp0GrzPeO6u2sr7tDay/mk7PKixT3lzZUMx/pPMp7069ANlqCeBh8fR743j7f6aP3
X-Gm-Gg: Acq92OH75UHGidhYtpgwGYnNtnJdRQK+5sGfteii1JbemW4HbyQyicHzlV5b61QlVlJ
	SU9a134CW/SkAITdEy69j5Ptgc4WgpxOArMOxmdaXyG6kULLBGPDY6qLwDUIxP6byH4WfH9/KeH
	5fCmhU8Ptb8YMORDmzcn1Mybl0LbMlp7oArleJgqgamixAHDFUaoMD8BbovPK5tj1B701W19/Bw
	adRhfUjclZDZFECkOytVeOAsFAzpQvqpNFPfn+ori4xGzL0bLe/PLxqVgbSLTpdk4WkTC5zccx2
	mzFjBGGkZ9rVbor6WQSvvke31qKRazkZ+oPiS7NI7wHsyEyryLHHKRjeXOsgWbqyKmQSiBJNknR
	bvvQLVwtNSndUZkZyVlPkZEoJh4oSTPcJzeb495JUdeDLMKiOMT0/6WOGULrN
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671452b3a.10.1780929433664;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671413b3a.10.1780929433126;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221470sm19692216b3a.6.2026.06.08.07.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:37:12 -0700 (PDT)
Message-ID: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:07:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzOCBTYWx0ZWRfX5/5jM1ChUeBQ
 Xd8aNVRhWtZTr8WNSP2IlcWGRaRB2MzgqASrwqqhiiptgLVW/V9yVcijGxTCYBvzRdexISpa0VR
 Q6Tmw7c0s4mXSmOhi5/St9zBFZ4Ne7z3Usx7KGY3onED4qLcOwB54z5g2wOr43J9Z2YLA9RvON3
 X3sdxIiOWDaSrSnT4Z7jYu1w7ifF/LZvmXMxWi8WBlFP7zIiDCWtG2v/7s/n/ygSMugETyYHz8v
 wviP/y2c9HYvjNj+XPqb1Ax7t9MdhxjJxjE9CP2sv8JUP7m4fv5LP2bKyEt/RRw+huDUCEopxZm
 OMAuyef5dnq6+2ILJcjwEjB1Z1AMuiRmiu1Z9gT5S+pN16SywFHz/hCj1ylHnN0v7vj7XrdACkr
 2lP78Rmgn+hxqQpfChLA7ulQ7/53y53yWrOEHTqa7kgR8eJ0KnUyq69c0/CyxPDom6owZGoPALt
 9bPRNdBIKyvsgTRZLvA==
X-Proofpoint-ORIG-GUID: FxVS-Emg3MPOsz_7xYvh7ia381qC1H2I
X-Proofpoint-GUID: FxVS-Emg3MPOsz_7xYvh7ia381qC1H2I
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26d39a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5xEeDdGLKqE-Cjx_tAgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080138
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
	TAGGED_FROM(0.00)[bounces-111923-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D867E6578BE



On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
> 
> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> be voting on other interconnects too? I guess so, because currently I
> see that TBUs vote for various interconnects. BTW: should apps_smmu also
> vote on the power domains?
> 

This race mainly occurs in GPU SMMU, where the GDSC can have an
independent vote on the Adreno SMMU. However, the GEM_NOC vote may
already have been removed by the GPU (or any consumer of adreno_smmu,
e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
errors.

Mostly this race reported in suspend/resume cycle (when gpu/gmu devices 
moves to slumber/suspend state before adreno_smmu powers down
and the later doesn't have explicit interconnect voting).

In the case of APPS SMMU, such a race is not expected for any known
use case. APPS SMMU is part of a shared infrastructure block, and its
power is typically kept enabled as long as attached master devices are
active. Therefore, explicit power-domain voting from APPS SMMU may not
be required.

Thanks,
Bibek


>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 


