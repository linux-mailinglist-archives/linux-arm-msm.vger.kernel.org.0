Return-Path: <linux-arm-msm+bounces-107399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK2zCJ2xBGoQNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:15:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1F537CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96E373001A53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF8D4C8FE7;
	Wed, 13 May 2026 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwRZJSVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvnELmIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B138BF68
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691731; cv=none; b=lwMoc8ZNTRieOcHpqq66/4yK8Do9DTu3p0WfjKQwkfYWFQ6pgbcvbAYrMqu8bQPRaw9fBjU6nbcCO1DgSZYn92mHsbGIBuZv63/oMreJZthhyRdrwc+yZoJ+y+UQEl13fgvmngkmF1NAghnbUhQRChhcN1M3UNhHvGwfpbREFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691731; c=relaxed/simple;
	bh=vWw8VNMpTozvTsxTcuJrrcpVmar5XpLh1HoI5fCIVwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeBmB7ArT+BB6eK18lR7tZUbnl//nJSIPY1d906me/isy/fGBjcKReo0ENFsGS0PQyw0oMDaOY4ZSRBWGWTxtiOmb04fyTHxbNLPKdk3r7f+yP+iHGcgkdIcnWC05MRWDiQ0w0OEr+JVQm7Uuunw1JAI+ZW20yFanksNhS305OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwRZJSVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvnELmIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdeL21242787
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=; b=mwRZJSVhviiSAN7O
	+dPy6BYZtRqNK5TiHRlEYWwo33oPXH28KRXkO3fLIFl8oP8mqsbZ6/K/vPH2g4FP
	iY+aLQ8esUm0nbCHaBB9H35iSHTWjrN0PaDJIkOyxA+wOZNy0KyDnl0INvZYlAZc
	HtMCLt04bs18rofVJ73OYiOakldLt5OkhpR+RHih8NHAkWvFyZSBrvML0sNeYrC4
	J53WCLZCEARze3+WCsT/fRdasYHjx7C0Co8E6TO77OcVUQyLy6DT7Pts+VUwfC0Y
	ng219d1ASQCrh1wtdPjFWHkDYB/G7KXGk2kiWWf8vD2I5X/ieQ9iliYVxeirHJTS
	6YoOyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trb9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:02:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso167698425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691729; x=1779296529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=;
        b=HvnELmIe3GHgLX4YgvpryAAggu3OJcbyDKkvTXuXYZBpAcg3SD/l9EHlSzTEXw+RLp
         s7cmQl4yjQqqtupqGXGSNSV/rt8EPjhyPMB4hDMoPDLVemvQbPI9oT2NJYyamZfhMohy
         e+IuwSz8COr2Cie5dj/kogR0qe9IlILlVc+f3i+LJd/C4iXC2DnDrXJA/xO+YMzecipA
         NTajpggHfRq0q2hpKEVxNxtdMLLM3GNhb1XNA8tc0lx66x3WihT/CSIv/Cj4/inoOm93
         l5+wqJt0QVQ1/WkGV9xq1MQJMgUlSLgz05t43wlkiTF4KNdXyjYkJNCTAXtjmZIKpOts
         fcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691729; x=1779296529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=;
        b=hzvD3d29gJdnU8D50S8dlXp02de77/GJWcgS0cHYetjzr5uvhs4/v/VsbEhwoPQGe7
         7uVj+IABfuLExi2MMUKXafBi782UrUCFQ9Gk2ewpY1QLBqziQeb20JgrzljG/T6EPTDQ
         CCu9pB0vppaUh19NwRLXCpZL3bZmRHl2YBKUuFfySmI/1pmpZ4V2s9AoeRZjJeGzFZ0H
         jUfWY679yZZRm3Gr+4XSx2Ju6f8j8gQpCM8qL5zv1yjbvV2Y/vcBeRviyr2wl2QpBvGj
         tDIdIU5l6AyZhdwRUjjuYLFAqm5FmN+EKXTC6AyTUzwX12bet9cyM4vMsKSuBGhzKWC5
         T3aQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MOIlX9nLeQo39dhkvKzErDb/SkpQQkJINKCUxtTbPMgfE/6/sKzOUmvdVoaCdQsqh7U2seuiVhW1S1RCR@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTcBJyEh0HHACn/DMbEwoypPbXcuNdbnZb01mwijApisDgdUb
	1n30l1BnOg46urB5FTfGXB1tAP/NelfSd5HR8itvUir+TU6ebKpXeVzpeUkl/x4oR93Gz8LDGR0
	QQVV2pvHHsXVertCbxTTiIw+efhV3XTMTTGtTCrX8c4pjUa/4qhNW2OyjcT8OPBIti6Gi
X-Gm-Gg: Acq92OG19vqELfgCTkUJyLsmisPCZlQyyCzvCn8aDdsZW67CPrzvtLeo1hpgVJG/m69
	5P9Lpvfdb7mQEDqoFc3tVGcUMjtHaHnQuLQ6Dwhoq3o2HUrD/JmPba9Vb6vMZUSZpNMHqQsFNHZ
	9hs2iFp6maSPk9HJ1Deyyi79Tu4/6dE+zjbn0/KnAPgj2YDgSPNqezu8MrCBpQ7P+EoWHrDOZjl
	Rc4lmApGUWOkWSMr0qz61JVcVTIM0FQbcKmm8NhLSNAz53AygCG8ad3xmeUuiy+Pxyx/9f2fxLH
	rKJw+HhJDMxqPAW8hsZM3zwrn3Z8/VbiyNqTINfd59GFSh29wTV0RQzkMLyxFLj2nElCspBsqm6
	u73+jJWfDM+GFpGdt/6ZoTEaGdFaysugT7XRzA5UGxMJ7/RcfgvjzFE+kzgwLorZe40A=
X-Received: by 2002:a17:902:f551:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2bd30210db5mr41157555ad.21.1778691728385;
        Wed, 13 May 2026 10:02:08 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2bd30210db5mr41155195ad.21.1778691726554;
        Wed, 13 May 2026 10:02:06 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bc83101ee1sm141611295ad.79.2026.05.13.10.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 10:02:06 -0700 (PDT)
Message-ID: <b328450e-1bd5-4e3b-83cb-36ab647da657@oss.qualcomm.com>
Date: Wed, 13 May 2026 22:31:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
 <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
 <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04ae91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BiA4-BlHbpJUGHtcRRkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MiBTYWx0ZWRfX3004iyKdTE6X
 Belsd8KuikGmPIc0HJVcbIHD7MczgTzGfYT7N2zjp61UfH33ZJChghr0EUDJeG9MCClx8SKXw/1
 sT04xeIDO8xeyAndJoOksiIxhyf6gXhP4RoF7UpfPA37GQ9r6uMAUDwGhkbVnu4VVtmtPZykf/n
 USKb4XfM38T/vixPNgTUYjls/05yAp9nbCKgIMmGfEWiJKtazMk9BuBIPyKpvq4ZNKZD0EkHG+I
 qnuzAnfpZ+H0BNBfX3h+/ufFG+2W82QtWtJNtJmskkdU0NYtByRRS5nZ4/DsyT6bM7kU0+y1PSd
 3J7vm+Qs3GACTBPPa2/6NNXuEoRHj0OQOtHBwsjUW2AYBqM/y0ArBqQxVYDBcdj3tVN71inuwfG
 W0wuO/BjA/7IGDvnHLUrNaQw6nP1kBG2coEsDLxwMdBmGAm8760KnkooaSu/9+sRKQq0U+Tnb/h
 EMshyLiMQS44S7eNqQA==
X-Proofpoint-ORIG-GUID: Eb4sH_QavYjeRYkAPTfCWSe49D2new2N
X-Proofpoint-GUID: Eb4sH_QavYjeRYkAPTfCWSe49D2new2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130172
X-Rspamd-Queue-Id: 10F1F537CE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107399-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foo:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 9:33 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 08:00:39PM +0530, Vikash Garodia wrote:
>>
>>
>> On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
>>>>
>>>> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
>>>>>> On glymur platform, the iris core shares most properties with the
>>>>>> iris core on the SM8550 platform. The major difference is that glymur
>>>>>> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
>>>>>> one. Add glymur specific platform data, reusing SM8550 definitions
>>>>>> wherever applicable.
>>>>> This leave me in confusion. Having two cores, each with its own set of
>>>>> clocks and pm domains, I'd have expected that each core scales
>>>>> independently. I.e. if the load is pushed to the core0, it requires
>>>>> core0 clocks to go higher (while core1 clocks can stay at the low freq).
>>>>> Or, at least, the clocks would be set to the frequency corresponding to
>>>>> the max of the workloads (if for some reason the cores should stay in
>>>>> sync).
>>>>>
>>>>> However, I don't see it in the code. All clocks and all power domains
>>>>> seem do be scaled using the common workload. If my assumptions were not
>>>>> correct, please explain it in the commit message.
>>>>
>>>> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
>>>> defined in the DT node, where the clock frequency and power rail level are
>>>> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
>>>> independently scaling one clock high while keeping the other low is not
>>>> straightforward within this OPP framework.
>>>>
>>>> Do you have any suggestion on how best to handle per core independent clock
>>>> scaling within these constraints?
>>>
>>> This would require more plumbing and driver changes, but:
>>>
>>> 	iris: video-codec@foo {
>>> 		compatible = "qcom,glymur-iris",
>>> 		clocks = <only-core-clocks>;
>>> 		resets = <only-core-resets>;
>>>
>>> 		/* or core@0 */
>>> 		codec@0 {
>>> 			clocks, resets, power-domains;
>>> 			operating-points-v2 = <&iris_opp_table>
>>> 		};
>>>
>>> 		/* or core@1 */
>>> 		codec@1 {
>>> 			clocks, resets, power-domains;
>>> 			operating-points-v2 = <&iris_opp_table>
>>> 		};
>>>
>>> 		iris_opp_table: opp-table {
>>> 			compatible = "operating-points-v2"
>>> 		};
>>> 	};
>>>
>>
>> clock source "video_cc_mvs0_clk_src" is common for both the cores. It would
>> not matter if core0 is scaled for a specific workload and core1 is scaled
>> for different (let say lower), as the common PLL would always generate the
>> higher of them.
>>
>> Infact, going with the approach of exclusive scaling would be an issue here.
>> The later core scaling command would bring down/up the corner for other
>> core, and could lead to under/over-voting.
> 
> Are the dividers between mvs0_clk_src and the branch clocks really R/O
> in the hardware? Can they be scaled to account for the different
> workloads? 

dividers div ratio is pre-fixed in nature, does not vary with workload.
Again, you need to look at the source clock, rather than the ones at 
different core. Even if they are scaled differently, either in software 
or hardware (assume for now, hw does), the source would always pick the 
higher of the scaled frequency corner.

> The commit message should capture the details of the
> interaction between cores:
> - Can either of them be turned off, while retaining the other one
>    running?
> - Can either of them run at a different frequency than the other one?
> - etc.

Lets capture these details in the patch which enables the power sequence 
for the dual core.

> 
>>>>
>>>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/media/platform/qcom/iris/Makefile          |  1 +
>>>>>>    .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>>>>>>    .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>>>>>>    .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>>>>>>    .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>>>>>>    drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>>>>>    6 files changed, 223 insertions(+)
>>>>>>
>>>
>>
> 


