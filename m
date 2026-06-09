Return-Path: <linux-arm-msm+bounces-112011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wqp2E3O1J2qv0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7565CDD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hpnnm/sL";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hvx4h2Cl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5B130CDA3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A0F3C3440;
	Tue,  9 Jun 2026 06:36:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F937F019
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:36:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987000; cv=none; b=J+LVPkWCPcrwX1C2brM1l8fWpeOjI7+SuT7CGkgRcdeB69OI5xpyEfJbAeOW2q7z/4EpStBS7VWLqHs0f2QPdqK4OsHSwJuKMVWg0+mD4b8rgcsqA8ltk/aUVxTm5eku2GUhMPMUGUG+PnrfTMK0nn4Y4Z9SuFVv0culefHH0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987000; c=relaxed/simple;
	bh=oKeHTCClEnzlDhjKldDN8fmFaL+DbHLDQswkC6zCsg0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cPEHojI9kQHgHugp5Qk6J3lf2nrecv+K7yVwiUO8J5IMIola0Im8QTYd1hSYFNhjHpoeLGDaXU95NgceNozDv/LLTSM/OJZz+S3YPf3TH3Gv+dCS7A0tb4bHRVZEm81VG11H1Vf/lSQfSZpuXmcuYPx4jpPnuhBMT8dL2Dak8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpnnm/sL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvx4h2Cl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wfwE1061243
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=; b=hpnnm/sLyW9cKdl1
	nH7rTWeatKi9LJPam4wU+PejBOmnHwevAOC/iC9La6VA41TkV+40W0EwZGKVPeeg
	rAgAoj26gbaUtvDWfJ9FDe7AdBUOU+8dT7PNlVS4H4FcuWqgLg2qTiTTNkhtGp2r
	+0E3Jvn293VwaIy+5gG1k1D0Nm1cztz2HSr3dBYC0qxW356KARl8Q4yqkluVGeEC
	DjEG34JM2agdCM/clAO5+9homihYlBc1fIHCOSIHxjAAU0J/B7hhvanvDxQcXOdF
	JsHo2H9tE7XfKRTiV/aZDx8gK1V/7m5CIt0CNERGKRgMsSSOC+fMWoPBvbnwXk/H
	0s1gkg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44tmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:36:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8424aac207eso4790711b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986995; x=1781591795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=;
        b=hvx4h2ClQg3zWo4zXfa5zzyhsavCzOaW8L53VH7BPZqE1XGd9U7QY3vMTk0A2nn0EY
         uxFsdf5XyTfCCOuUucycHcCWqaD0LZHPyi1J6x0g1pf21qol1EfBK4T7zeSS/SBGOS03
         Cw+uKuNCbkxZ2nFBtQO59R3swO4XtLelt62+xvE/OMysM9+ihPf4A0bKrU1AowR64G1g
         1ZFzHgx7WPSWhSqyX3jObP8n9wgWc6grZtMEdwS/9dKYQ/+chR9bHwxwlq8+jJuddlYs
         EGlLVm/KSuLSBkVeis+UC+o6q6T8ZSJhbnXZNrJtOM5jejVzCrVCj/+9cJbnj6yrYefx
         5l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986995; x=1781591795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=;
        b=SI1CSCN8L1dH0dAtgW4xs9jk0oKvYVVxDKe8E9hMLKqKe42pMgUWoHrBpc/qErMuru
         JPmbDBZ+WtvCTUGVbABj/YORO0DfaJXVoRZQecaUHf5MAavLHvWIDT9G/ecUY5bcaztR
         I+wTcJ3KXAbyYDGWlvD7++6baFGJ40RDb3jF+z32afEeKEGMn7AZLAxIInkK/YE0i0uh
         3KbTij6ub97bWWWyElGiGqIfWDH7XbbS86trCX0y6ud3ItxyRSDEXQLl9PB8dLMxq/yi
         rKu/d0CIXYyCT9qHvModxzCxDiVMmLZHcalV86p7zjm1eWXxuvN26CTem7WxNLoQordo
         cchA==
X-Forwarded-Encrypted: i=1; AFNElJ+gszQNnqTGatHtydZSslzCNOAXD8Bxw/RuEXYPVH37mZJ/e3BN3yO8uPaiTGCPo0IDgcr2FFPluf794aSx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QcGdAopOmPDbM8ZYiJox4oA4JBXdpbisEF8a86mf2sol/rTp
	Fm7bwjFC20+TQfuA4C4ksE+YofZNTe/51Dwrk1Km8etAagDEhAhgMvmzW83SnUtFP+q1Vt2KySx
	JBAytNHom//2eMUrQH5Hksh/AjKtFLm75bk4jON/3vuiG+EiIiCz3+095WJLtPsBcfchc
X-Gm-Gg: Acq92OFgodrJSk+s2DxI9moE++Aqyv8rWlmJJJo/c5Zg68n8m1Dskkbm6X09hYEr72a
	yECOuphIgfEQlqCwQmYqIMwRVfOd9kxVML6uJMBXPfdNeTBI11tkpbYc1bo72+rM1qpOvRyzBEc
	JOSPxsal5gQK2ajTjK92oMkjkuT4qa5c5Yr4fVhLxv624z7Tp5vhZDW5ir0o8ypUEBWKYIojV0H
	Qc2Jt7dp81mfic/5dKZkQnFDeGs0W+sgErmFLvOdoB/gYgE+TqPBiUwW9wTqdn9Ai/btMxfFrMa
	FOh0afnMoVbmpFZD5Q0IFnht2dF55XanMjfHgkpir9eMNIJrg7SaxYQlICgIaFrdj5yKnZyZX5V
	6NlPoGBUxmwCfxuqrILWDWPKcfSaIW7lys3FcueNUN8yUpMvoN7K3UDDSIakONA==
X-Received: by 2002:a05:6a00:4acd:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-842b0ffafe9mr18208599b3a.44.1780986994825;
        Mon, 08 Jun 2026 23:36:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4acd:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-842b0ffafe9mr18208554b3a.44.1780986994350;
        Mon, 08 Jun 2026 23:36:34 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282910d1asm20288133b3a.56.2026.06.08.23.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:36:33 -0700 (PDT)
Message-ID: <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:06:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX/ws/VSRK32oW
 4GdqmQBQE+MxrHCGImN5o+Aiqj6GrNXoU7z8Gdrvvr/gaFFXSDIpGRGDdnUhxG0I1+SYU4zFLbT
 sXNTU0S0Xs9PjbzVlR8O7IGn0kgvohD0VbcOeJepjJ+3oA9tVhuo6o9NV0PMQlZRdg+IeOrs2N8
 dWmrlKZyQHWkDuKLOEAr6WZGraJ9JSIdypZIpa/LPJKIqa27PSVdSg1gP3ZCLzz2tWVD60e9NDY
 gpKbfobwDoKKDNlFAzXx8+lm6B7YMej7KvTi+uaVBwd34hkg+vxVZQR7V7rxEG9ePIIWrq+FtsN
 dqa8EJpIXLwKx8zUa0JoG4I1MOpzCJljIeyrW1Lxn27Q5WKckJZlIF9uNVUQlUM1p9pdk3m2LVh
 54H4HeRNoV501rwi+KcGhcCW8LWKARfumLAs564hVxF3hwktTbdlQAG5KHWolzsevBBinCN+pCc
 o/fyacsrplIo8d4HQLQ==
X-Proofpoint-ORIG-GUID: v1ToEJrmaLLhDAztB0o8ilk6eTNkclmN
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27b476 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AuIPJNTv_tJEKgpUhqcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: v1ToEJrmaLLhDAztB0o8ilk6eTNkclmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090059
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
	TAGGED_FROM(0.00)[bounces-112011-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4E7565CDD4

Hello Bjorn,

On 5/18/2026 2:06 PM, Harshal Dev wrote:
> Hi Bjorn,
> 
> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>> Glymur has a True Random Number Generator, add the node with the correct
>> compatible set.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..64bbd5691229 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		rng: rng@10c3000 {
>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>> +		};
>> +
>>  		tcsr_mutex: hwlock@1f40000 {
>>  			compatible = "qcom,tcsr-mutex";
>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>
> 
> A gentle reminder to pick this patch for the 7.2 merge window.
> 

Another reminder to pick this patch up in-case you've missed it.

Thanks,
Harshal

> Regards,
> Harshal


