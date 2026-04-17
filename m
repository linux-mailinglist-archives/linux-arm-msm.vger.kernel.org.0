Return-Path: <linux-arm-msm+bounces-103544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEWeHk1P4mnx4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:18:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4E41C7E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9851730C33D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4043E2D7DD4;
	Fri, 17 Apr 2026 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI/gUHIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSiZjKvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390F26056C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438957; cv=none; b=Yv2LpY6Q2pEFq4HtOaXj6NgArem6aS2CeoAtj67mNfGWJtIfAUPw3A4gUcG/+ncpo2o8PtVEd1aFaLnREj4L0lLY0u9hRAHfHRIEfRoqPbRarHF9TiZrJndFGvRr8hUfHwArUs01cBV9/kAYgAG1qyzp7tPTL68vFhcGnY7KXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438957; c=relaxed/simple;
	bh=FUQ58Buz0KTXfDHUt9IvxtvQxDPIY63zZw+nNkTx/oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzaGdlPWfi/SdiJWhz/l+bAmg8y8+7rFLktVCvgHp7XgS1KtGk9GpmLJqVEiVbGF24F3vdAkHO5ZPTyqHam2qIssSUOmSK3cgUv/0kgsLgjjQsiubbcHJvnwsP4gYnqNBBd/4QZfxFCP8Qd6Tr40ta2iDmKSsRG+esQe//IcbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI/gUHIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSiZjKvo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8tj3L1971830
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=; b=oI/gUHIPaLvOHB0W
	wJSq7dp8aYAuJF6x+jcuxWvSl1apaj8ddzZq1Yw82kVWkqLTJX8VoyGQcy/PfENc
	6DI/QcSgpjLpeTYfrljdQ9XIkCmzz9eNza1Gzl5yKySFsentjHoIDK3W54X/Y7qZ
	kGBg//o7n9rs6TZ5O4R4ILP4d5eD7KFL3iXkYAUbZ1wdF3FTJN9z6H1wPGROG+hv
	M54dqnLGGVXEnTuIQa+duTCPB5J0ovucwTVc/ykEirhQUtg5BrY8vXKnqKOfm4Jc
	X5ZegTgfXuTLj5LJvewYjV4RyKGNEV+XhuNR+8+sWYIsQVFPnbRT0454lyz3uoPZ
	dozuaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhsh9bqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so15150315ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776438955; x=1777043755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=;
        b=bSiZjKvoIjgqfj4zwURMXJViMJH7GaGq+q4ZIujYEMY6LXm4ng+Ud/+J0jVfoWuskY
         V1spb2INV0PRWeKUgBMdKYXMR6yrZdVmiagsfx15slt5kKNf5WPfQVpBmZpD0VT5W28p
         xQDyKIhvsJdGO7uRttDXRgIxKEu6PjidLGf200q4Q85bh6rd6r3Wt2nGCqq793Qrt6j9
         yDPZtEpYGWie+hHDGflI/lCKizxL8jWriXSg/ig8PhaMOvZSsWkT9kfE7q4HjNivo91i
         yBK3SG2iKtf3hhl2yKhh0sEqiEgUtvlN8iFvW1nOgnxOSSMA+iHOsun1jD5yP/Bg8Uzo
         7lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438955; x=1777043755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=;
        b=RMU+51vQZTSv7jwWoZjwxJb2JxlVmPF4aBLK1ugEmynzC/lDoVJsqaEUgA3U1PxX0/
         PfbJ/NtRTlGSsUyELFsmPSRy6RrPYhNlC9FS8SF+eGYXwJaS3gQnRkpY9Brw9pcL3Jtg
         cJz5Z5Xt1HpF4TRTb1sWNPZfxFOHy9kF53ehmtb/xnhv4PTQN21cvnGBJRR9ZjE7BD6c
         xYsfn0jbkLRvQpQGWOwJKvr7/pYbOfs4aXTfOS36ZL8iz4H7ZmEvAYf8AkU6C1trvuDm
         cawtZ0qo6Isw8CfcvqlVY6tN1yZmCEPqLpjGfQrn5sYSVtEgObYRCofF+icTuuZG2PdA
         n+pA==
X-Gm-Message-State: AOJu0Yw7+FGrFGORcIn4oLNdIDDxhNnhYuMTiFY1M/NH2m1sDW4skXrd
	FDrZZvbbe2CxQ712PC4oGz8kz8XxvL9+e6wewsF6/rlfeJiriRlq3zzkTCTmiAXw39RvWJ0Gan8
	vjVcN5ET/qh9XqfQkMv8sJ8woVnXHjQvJ4c+Dl7i5xNpGKTkQrO9FPhqCfnmuZJ0OZmtg
X-Gm-Gg: AeBDietQwIbcXjMA5kLvFZpuAbwH508WyIPnP7gn2TJvobHuC/iwLSCXDeL85PPm+gp
	EbiLoLqOaaH8t/4SXQQhoyzKr39GzldDym5bxTbg43ntOnasqkzPboOWp+Sw2kmLBcPCbIOCqKf
	GUli86oPJ7dLmdIKqVGBhuqFCtFtwP7UrIVTK/Xf1+jp2FNEpNO7ppEKUBsB7pi3t5qSfH3CbnN
	KrVY3EYbgZHQQMeUiTd8rJ2ZudBVgBx5/NTgulVTePClg4eRMF7F17nQYb41QRJFkQwwJyEpUjv
	a6m14KH2FYb0F2zIz1d/8fyT6qRHHqKAgH+Dlwy2gAkbZ9nsGrVFX2vF0nLi3CEmq5Pi+Kdki33
	+lMTSiXo5IqqiFmqRgd4dW+44A2fX0NwX3miSAvJdV8EUqqhxhHNJwtZ5aoemOZ0=
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr21404135ad.13.1776438954299;
        Fri, 17 Apr 2026 08:15:54 -0700 (PDT)
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr21403775ad.13.1776438953588;
        Fri, 17 Apr 2026 08:15:53 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.36.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa92c428sm29382555ad.0.2026.04.17.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:15:53 -0700 (PDT)
Message-ID: <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:45:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d6/FDxjE c=1 sm=1 tr=0 ts=69e24eab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=XANuBpsXGvULjGEGCPeV4Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=uZtfZZKPeAmlM9mCzUkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 39_y05lRycT7ot0SNySm3wa13Eid98-N
X-Proofpoint-ORIG-GUID: 39_y05lRycT7ot0SNySm3wa13Eid98-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NCBTYWx0ZWRfX2SdKJtBKz5N/
 TSOZd9WyN74uDDTMdVpoPRCAtOm24gl4HE9Q+In4+XXqwaRN75nMBtdPCp2jcrxUafBv1a8AeAH
 zkCuO3nRR53zH36Cyc0QLtA2WVtsuVqt64wYuxc5MukXZejCXPTy5cbJfc1wAV1S1bhWFe19OzL
 NRSyqF2UTQBYdimjUd3Bx3v/SaONals1uoaAbfQIblErhScV+FtrgpJ/uvi22Lprt7dElCG5s0z
 2ejkltt2d6k6f2Z+ve/phr7DV6XlofxYEr10BOv+5JOhjUM7FOxTvfcuHs5skzwBN7OEdKX6Cfy
 BinnQj/L9T2/4WYnOZ2XvU+FpAiBWXH86GG+AugcGmHGX/iri/OfSS2tYXRYZYp5GIrDwEJ61mB
 gbfVwYbsXp/IExgdKxzTihpYYnpzeew7KF82qIGWDV9OScxnP5fX4SBV6h8ljLNMauxzTYlGEHk
 LWUvK+1Pk2xKMxs/Wdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170154
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f6000000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103544-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1A4E41C7E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15-04-2026 15:22, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>> Downstream [1] this region is marked as shared and reusable so
>> describe it that way.
>>
>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
> 
> +Ekansh some insight, please?
> 
> We're giving away that memory via qcom_scm_assign_mem() anyway
> and I would assume that making it not-"no-map" could introduce issues
> when the OS tries to access that region
> 
With the current version and the upcoming planned enhancements, I don't
see any major benefits of making this as not-"no-map".

With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
entire memory-region to lpass VMIDs. and un-assign it only during
fastrpc_rpmsg_remove(). There have been implementation in downstream
where this memory is dumped in case of SSR or audio PDR using minidump,
so marking it `reusable` might make sense there, but that dump logic is
not added upstream.

Upon checking the DT, I see a bigger problem here, this memory-region
looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
Please correct me if I am wrong about this point.

[1]
https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500

//Ekansh
> Konrad
> 
> 
>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 4b47efdb57b2..13094b5e9339 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>  		};
>>  
>>  		adsp_mem: adsp-region@f6000000 {
>> +			compatible = "shared-dma-pool";
>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>> -			no-map;
>> +			reusable;
>>  		};
>>  
>>  		qseecom_mem: qseecom-region@f6800000 {
>>


