Return-Path: <linux-arm-msm+bounces-117026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x121EL8KTGobfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:06:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCEF71549A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A2+sA/pf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SQEb0smy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D18130065C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 20:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8603BFE2F;
	Mon,  6 Jul 2026 20:06:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185A226E71E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 20:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368381; cv=none; b=jE73Y7r4vaJQTLgyedgDduZKOwNXdkupB1oh3YX9Hjos30toqoeTE3vvvQftJLG4DFAC8N2diIsPnjMMRinXHmyRc6atfeSz7pqI0gBYSXNPlNJzF0Hi0/oA2WPsCUztUPnmDEKVyrHCpFIcnwrPbMn48VPXDG2PiiygH7FnhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368381; c=relaxed/simple;
	bh=l8heLlrrTPYNvH6OlXPMwBbUF/B/QIXvGRy0A8EXBPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnUgOdAOP7qebfiiVMi1VJt3PqKWrcQNI30XmlBJmTGw41OmvZyaYToseJXBnjYbOIac5334a05jnvgD6j8Oc1quHLjAwnx1i25BjUheYPEAFvT7EdCNoq0PlJYyLf08gPvNPfuSwWicOwl8BhXc2ObVhmuvxIBWCqaHCw0VFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2+sA/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQEb0smy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7fM990243
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 20:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=; b=A2+sA/pflXJxmGj9
	59ZriII2fhNp2WN0kzFToRm19PyG1ZzN3ZtAxwpUgIULN/i4b8olLkZucYfJgs9n
	sOH3W3gsdYm1pifuiPBorvFjOIT4YWzjDMPX5chFwUGIKJMYF/vipp7Bj3PlW9Ab
	Wd9+U4wfP23RFtxGBNJCzF/hErbix8L3deUOtvXK9tTCd/1NLObqo/xJ6rrsYGnp
	W0OfZyGPiohlFIowqWLlfwjN7wjQJXAdzAEDDe3OASOZm6ojJHPUiDrWHaiQJNqV
	mkfgSG4xC3pHLYsBvRTUTfOb9S/M6dND7ItLTZnSwktZgkxMrSPgpu8BwcVVWywr
	aAwSCw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtqk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 20:06:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so172603a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783368379; x=1783973179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=SQEb0smyUnynTiz7nxjVYuCwAdBvTBenaTdqAw1pHJrgTC8X4f8r0MIfUBM+1CAxVz
         WkMjAAg9AOpEPT3oDTJCLm3nOa89/p4pITqGKAWylMUo2Dv/AUTuK9G4BjvlLfMB/YsF
         Pcdkt92Cv1uW+seqtuDOxYaHHzGhZnEITM3vKy4xVkE/YHXztNHFzHnMrBX4VOmfAutj
         d9lLRYe2lHq8tzdkKA9Fx1lkpUUuVnLeGVT3uHyj0ciPNumia4+V9Zw7LtssinSr8jnV
         QBHK4TVSVa7MihZ4Ljs3/i6tcUhiMhy38yeFktq+KpXuCXnuAwGfiTV/F5660FLb65D6
         3n4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368379; x=1783973179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=YCHxapfKrXmBP1gaLTVAQVpmtOp0vIIXjDmPX0PsSBN79cC8dpTbgPHDJt3zrwzuHG
         Yw66zOUysCuNwsHOvIIJSnFvtYEUZC5sd/w3dI8WITMOVahn/kN2cjV120EThhZltxSe
         3AeT3CgUyHnOw1PSe1wgBPgaKgkdMnU/Ks3pQExDrw29p4aAdIDZ3mb2lpS9BprhsCwS
         wx4zzgfecUNBk9f8dTZo9kozMk/5EvbbcMr/v7ssjzq51hBkns1k/5rGtB6e0kxYoLAR
         LHClV/B3BoJi8J1IuLAiEJDDr9dWvCDGvoIs2pnmBA8WdFgJ+82tUZB3OvLXSXQOhKAe
         LCVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpxnfa8/14BunwMMlmI44mt7yCkBTaySGH6H4MF5H4+V0EZZ1hdLCxG9y2L5xQ/kR187jp4vRATnIhBDCSe@vger.kernel.org
X-Gm-Message-State: AOJu0YwC48wyf+FYGVLw6N2S8N89rPqB3jiJ4NakAi2S+2Lp43yz6SzD
	Nw/9ZUhKvxsRXPYXc75IEzyNNEqlmLdB4d1EGXAgwflVPwotYDbSkKrYs41eAsDx77yZlSLhj0x
	D2lXVc6JLXQRHMqEoX9Y0XFZ4ErqXcZ5GaIPdHacdCzPeDEWFgf8IUD3C90oM79E6e2cb
X-Gm-Gg: AfdE7ckV8X4f/A6ZRl6rukebIEV2hfmgbuxGeZgkrxxaxVN+OldGEWE0KjTM6Cmb3I4
	s39mUPb5oxcCX4S5/qZi9Gx6PcMuNdBn/1QFjbe15kacFnttnoYCbVRuseG1NLxlvuRRrOLfWoN
	13isZJTW/PZv+70AjfaHllyd9t7sh5YmqjTqoAfXw4xJZWFfL1DGKzSgVbWvoDC3QyiGV+Y4FTj
	ZogqTRRmrVtfxP5fADQ3I3LmyPZT/J4YszTCz/lDPihfTGE4v0SbQpmTq6dP/MY4lDb/54aZk82
	/CdAqik/Xhccr2ND3nzs5RZGEX3+k7xX8BA/SEW82v6Qa3Eq+UZVNe54qZeRwSnr3cVuZ8n9VNj
	8dFvLu8kCnNGOJXfOxi/jTvXM+VAqX2QXkKo=
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984578a91.1.1783368378556;
        Mon, 06 Jul 2026 13:06:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984531a91.1.1783368377972;
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm47949eec.5.2026.07.06.13.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Message-ID: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:36:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pUS3xbve-huI1rRhj5k8ZN2bST4uBaSp
X-Proofpoint-ORIG-GUID: pUS3xbve-huI1rRhj5k8ZN2bST4uBaSp
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c0abb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZaZH7ke036cbytEKeQwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfXw9pR7w0yz+Is
 JnB4S66p536EbzNz+HExNq/gGofkMrVodSokP9oKekhf6mHxyKzdT6PBgRiWpmwTCb5KQwSTyzf
 dTdvne12JiNan1D0MhbP3qFrUqq6bIQ3Ljxh3vJ5vIGU03Df1KrIqX5YRIgjrEn0FE3EC/Jspsb
 qXGGxcmCFpMxnRy+FnSp1ayA4RYdx1sECD9lejCCCNajOjN8QlJ7ge9dt3EFdh0sSuGUIjj2wXW
 o9ceXp0IUWvG0evgH9x55FaTH4m/Ei1JUlYnh/HgCMDmDn/KAchz9xmwNPiFBejcls1vKHiUjIX
 EAdA0OgpX3OzOgb3jZCgq/YExBpf8gd/gljbj226PbRjpTWMxaeNewkHVk0JTypuFYJOC90pW2R
 898FioiF21Ts5AU84ekXihSgUsIH8/IwOVQ/koApAg9x5fm/yhYUX1xpyo4ohJo8AORV/qCQghZ
 kYX+kXaNg3o4I9WMuCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfX8euIluSiiulJ
 837sR7Z7GRK3Ynp4j5GkaFc8KFPzTqK2/R576VLihxX6o4oWvt9uram2U2yS7Ktm6rrWoLR3ugc
 FvpWFgDzlxYGnghBQZuHY2A1Q6Veel8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-117026-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDCEF71549A

On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			qcom,gmu = <&gmu>;
>> +			#cooling-cells = <2>;
>> +
>> +			nvmem-cells = <&gpu_speed_bin>;
>> +			nvmem-cell-names = "speed_bin";
> 
> This looks good to me, but I thought that on a8x, we're supposed to use
> the freq limiting register in CX_MISC - is either of them preferred?
> Or are they just hardwired to the same thing by chance

I believe the other register would work, but I don't have a fused hw to
test. OTOH, this is what is commercialized.

Btw, the CX_MISC register is not present in all A8x GPUs, for eg: Pakala.

-Akhil.

> 
> Konrad


