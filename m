Return-Path: <linux-arm-msm+bounces-117693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p4QTGftnTmpYMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:08:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C734D727C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:08:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="I/6K8tSV";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F6Q3VhtO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C232330881A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274814A13B7;
	Wed,  8 Jul 2026 14:52:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FC496911
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:52:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522334; cv=none; b=cu9qcCD9V+KIPiBOTwQompoX9LSb21EgM3e12v+tkku2LAfcTLuU/V46bJizBzG3P2jorqQnN8BdomfCjpyq9QIJOgi2h9SWtWQGdVxZll/A/8FiSsHawvSX7ID+1kPPrpwMFs3P7Behm2HAIgzdwuwetfw0Y2kurI6kSSI7NNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522334; c=relaxed/simple;
	bh=RoFMDCUUj62w2tWbiccAzqrlHIyKF0aRDZB8FP8cyts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbkqDib98VhThcdx4GzIS4/VEpMLRb0N+5IlDniFThhFoQY1rKxuEkvgjAZSzXWB/V74ozMnjYMpqzVoqarRpD5VNgWNmC2LYV7GF5et74TFcMiSaWT74C4dqA/cKs+33ePKi2OI9BBTIHZbTkhh2kjCNIyvT5spnE+kxgaMa1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/6K8tSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6Q3VhtO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3SG82667491
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=; b=I/6K8tSV8Tog1rSx
	QxTgfuz3V4KJuTrPPMd8xzxm2aaI6LUUSzIanf1NQbBAEsalbCXUwg382Rnv3p/a
	jlD5XnZYGzgz8Uq63XhVbDtel8TCA0glGeJp7uDS2/7jzS24G+OzLfripjdAvyUs
	FLlAFqO7Fr/02nlVXF7J7d7Yc//8R67dC1D06wli2yKvt05bnScaZi+H8ZaqYGwp
	W4BNxGV2GnQmaAUIBS9iFVnWhFsGQKOGoAs7QJFDxEy3zArlMLhqu81mxr2WIh49
	rrlcQ5TANwq1woAas9TIzX7YWOK0hKx1eMAwxXKKzh/eZDTNfg6thRCZ+7owT9yy
	0rAePg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:52:11 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a17baa4d18so940326eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783522330; x=1784127130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=;
        b=F6Q3VhtOmkjcmy1GAszQ9vNuarpUoEE/zrOdrS/6lNHRWdj+rsv78HkHppN1+wU/Jj
         MK2KaGK0pQ5Lf6Vvc5+/V8tKrx46r1+erln+MHTMI8+mS2mXBJoFGhDR6/sPzttc9pCM
         dkl7RyH+PWUlvYt1UL9T0JTHQVHfBXJb5Dvm89Z1Vwj0f0YQtu2edJkCyaSKiEbTW7cD
         gTufOEGv53XE68K3qe1L2Wr/W/I3APeR+ATpxXjTZ259L0otL1bhhtG1iH+CSknIFFJm
         KPZKKrbNR1VQ/J1ndNMA5BqNTWbzyhs9YC+Vu9mwpW6l4tPnihOxXkGfATwUF869jvgk
         oPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522330; x=1784127130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=;
        b=LBQdOT30rpK/iJDNrhESEf4w/452pQNCy1ykUPpXUfRFEDLDwAHm7apemGnQfiR1HR
         SdsffiZk8sOP4OamrGq2nCScI1O5eogiUN2oS8UYsRNumXzX9Ovrqb/Ed877lUsrS/9H
         VVOuuFrMvlWdF3mEMwFh+KNC85Rgzle3KLaG9Sr12xeAcLxrFBSbfJdar9vrJx21C1r0
         DZutU7WR++zgQnGZ4xGoanrgVmpCMWdhnxErHLemwiPV78U9h1aDbMcXncRjljm9H4iL
         i9KU8T2IZHyCSe1FUBiWiulAGZs897a+TVLQtw48G9hVLzc1/xn+q8Xj/9CaBz86V6/3
         /JJw==
X-Forwarded-Encrypted: i=1; AFNElJ/kIcKncguH5CfObWUlueQtv+KbXBrfPI9A5Kujr7tMeB9aoCQ7/7vBf714Uou7Ahh5LBI/oPnFDWsapSQi@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMSkX16DpOepJv/TsmuCeahxZuSW7PIUS8SyuItqHwR0v7fNi
	EPklelgIhNIa7J7eVJUeDfA2BV1dSmWH8PjK85ZS/DEPYttbsV+y1mFAA0SVaCOVa5CgD0W0xqZ
	emBXbIfQcN0Rm9+pgRXz+RevY9e5RL4pOLfFPzC4NnVNUUuDerq0udFNOny0sCPzqAVGB
X-Gm-Gg: AfdE7cl3+LX5r44RoKPF/AM03a/+qxVoLH2Jlio3xuPcG6NnWcds3UORpLPH+J6qnWB
	CV6dfYiiLrXMzLnokKVUVHH80j//eQJC+ccGZORUzCNo4DZMNuSI9j6dDncyzckWbyoWG4xmH6e
	pgQOv+FYZFBjQPdsyfDYzafRsBdHr1sWRdM2Za8QD1krWWMbS8OoRyaGimbhgyYF1YAcaax22PB
	DxwVjGVGbLKPod/RbPKxiuvCfQ3YG2+SUl+1UruUjS2eVcfMLm5MlmcV8f5/IFBhm2lvUKPBRpn
	C21V2NRwV0O52X5EKWy+u2hx1tQS89nkiVUe0kwXolrBHaAn84dUxeA+rvUTci6x5BYoWRjMpnO
	50XmlYdneZoIrYSJAScT4gydDrO/ujJ+71ZbEWNI=
X-Received: by 2002:a05:6820:20e:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a36da17682mr1672826eaf.58.1783522329625;
        Wed, 08 Jul 2026 07:52:09 -0700 (PDT)
X-Received: by 2002:a05:6820:20e:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a36da17682mr1672782eaf.58.1783522328951;
        Wed, 08 Jul 2026 07:52:08 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13d624sm16831050fac.1.2026.07.08.07.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:52:08 -0700 (PDT)
Message-ID: <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:22:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _rWAoB0oKkCxzn3fS46uX7_DTv01NZD1
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e641b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6nhsP2hVHzjk3Kom7RcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: _rWAoB0oKkCxzn3fS46uX7_DTv01NZD1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NiBTYWx0ZWRfXz08+T+Ca23Nm
 FyoZayCM5YdFF/K2hFYI4Ddq015OROQyo+Z+fv6uNx2LjOWI6u+6+ubJDMb0/aF0WsqO1Pgzzr5
 qXIsOPEFMw9EShfJVVPdTsocdq7GqcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NiBTYWx0ZWRfXyzZ2rxx56wYa
 F5nNXnioUHKFwEfWBiJmGzanrx3J2w5bAj3LrcAs+OJrja8KDI5SyZtZj2OZr9S0G8L1NZ7mTHE
 TuayTLE/4xVJwWnl25lgrJnYHNdSW934Sxd/mLEKZb+BfvEfE61T96zXBAr3NLQiOqM+sZwPh2G
 CNotRlDk7RlqLlJEl57BqaA9/R0BMSkI+4h3HqRGhuniKDl5TURMh+83nqMuuHaVIAk3rKEbad9
 in8p01Oa8pYDkmRJNLqZIM7a/kMNxNJrtOjKj3vnFA8Ke+5RpxrxMo1lxfHz717+EWO+kHAsIxr
 Cacro7fZ0IpjOXNkZ11pu6w58s4MuKfHH1Dl5FXy+p6dn7sKmfITMBS1cfMO2c0bT0GVFm7nh7O
 zDubb/v3KR/bNPhSF7+CmNJ8XNf1z9gvIBtGh7NAkgOzzQ6vKPvRhUZFAsQXPpQXcl8ZcpBZR14
 PIJe6M+9ub+E0axImIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: C734D727C42



On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>> path before the SMMU register space is accessible. Add the optional
>>>
>>> Why is it limited only to those SoCs? Is it also applicable to other
>>> Qualcomm SoCs?
>>>
>>
>> I was hoping to keep this series focused on the core infrastructure
>> changes: the bindings, base ICC bandwidth-voting support, and DT
>> interconnect properties for the platforms currently supported on
>> Qualcomm Linux and have been validated so far.
>>
>> The additional targets have not been tested yet, so I'd prefer
>> to add their support in a separate follow-up series once validation
>> is complete, rather than growing this series further. WDYT?
> 
> Then it should be a part of the commit message. All SoCs since SDM12345
> need to vote on the interconnect (and then, in the cover letter mention
> that you convert only a few of the SoCs). We possibly can help with
> testing on other platforms.
> 

Ack, sounds reasonable.
I'll add the first platform onwards which interconnect voting is 
required in commit description.
And update the cover letter to clarify that this series adds
support for the Qualcomm Linux-supported targets available today, and
the list will be expanded in follow-up series as additional platforms
are enabled.

Thanks & regards,
Bibek

>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>> to describe this path.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
> 


