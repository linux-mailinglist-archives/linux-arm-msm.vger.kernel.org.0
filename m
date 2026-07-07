Return-Path: <linux-arm-msm+bounces-117351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g0aBG2YSTWpvugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5571CD9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PlLhrtPo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bLlTxQJb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66BBD3007BB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3834B697;
	Tue,  7 Jul 2026 14:51:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E13403E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435875; cv=none; b=Z2s0O0qVKGxuj9kaeq5GPStSdF0Xg7FftYWwjgBT05IRgfmPAyrnLFgkAhxUVmGvx0JF5cE05lALO8jrT1zSfxGTlZ2mnBkLPxQKiVvQQzrrVHG1BVSEKuNZn00aU5kmfA1of2GQnYyIOHJ1Wve0N8xbv9nEsuuIOt0Z2MA1DHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435875; c=relaxed/simple;
	bh=RuEaLadIoZsuJyS6ZmkPuRWYcQxb5NYbj/XZuDX8dGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEXApxzp99SQtEjagxSFfdCa66LVWkJycByT+iVJp0+moVKlahe0DgueMljN6T5Dl4s8hi3gScX2eSsOnAAWY2WBDwAJ9rJwE0+mfvbLgXRiiFNGoXdl4ZoABMSd1flpCsDFOgIk9rfPvAzIyj6gXCWy+6/o/cnYVo/VMmgvQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlLhrtPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLlTxQJb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8sGJ3676438
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=; b=PlLhrtPoG2XGfQwL
	4rgO+c1M5c+royndMjQkIioTQdMavHjNcypq+vUq47rfP+FlmO+bEW92DRQ/6/h+
	peu+r4mZroQNbvESHdytzd1uDAjopmuxY/VhQ86ericWxHiCfH/qvVDGm4TR5DiI
	FyQOCvHWQnPyvIwdYFF0rPgbx6/NO0/MD/KuCg77Yxpy1aEKrkkSR2nI6wXgnl/y
	VpXwQiJJdJXLNsr3fVbbUxnGcsPjYmuggY+wFekr/9si8wc8W9NSVPaLkuR8AASk
	mW5dBZsrHR66C/dZc3vaMGrq1DvbgvHINJHqr89lluvdjNT30tGmUhiJbtdiSFAh
	PORlpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15ajja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 14:51:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso56101871cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435871; x=1784040671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=bLlTxQJbvG5/XIwZXxGI11eYKgq8cHVpXI16l8gMjOZ3yQGrVPek0j/RfgxN8LZY63
         R6Z/b7TvteX6c496Z0wW4zHmo/1ndjgmrTKTm/Sp8EWAPB5My9s+7yGVkyDQhVJL26mj
         4CmjH08q4MwWiClzMMhqbAC/0gs8YaHelg6QJrM4IXh71A7VF0+EmgKE5+xmCNkGeh8s
         3GaiuQgE/kULUAxmcn/FyErnHf+Dsed7mrH09C7hqKsG0R/ehZ6jNI75jmen/YMrkEwt
         q6KiP+HHC4iezhae11dmsIqrGV5YFG9TNXGAyMkiuQb8cMrAumE8PQy4F8LyAK1tBnr9
         NYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435871; x=1784040671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=cR2nLYaBlzmrL98SQCUs1/jjNWUh3KnhQDhskSIliNFnpZ8WbxahjmE8Zt2mcbLPTR
         j46BG2V5Q7qZsJMkf9V3C4KwqFxJqoJiXdYCmt8sZtHbQqgf2lz/SRR4M8QfXIizxxrK
         XTKh8B6S2BxACGhf+k01jK8hRC7jm7EGt+W/s5ZkBCC0FkDy3g1JQCj6fn2O5JdStfN3
         +mIbpAdpHWMpet6YAuepAlr7Tq5qRrTjlq4qUKJnq3yl6imI2kzNWSOI0BeCNR35ArWg
         ySKzoYwdlWznU0GBiGbu1OdOMKNk/Je+pyqllidxgPAI4VSBHF/7YSqj9ZoFSF5yrbKD
         vByw==
X-Forwarded-Encrypted: i=1; AHgh+RosQxx/ntgOPdvZ4uDBHqsMhI5TI+WsTx5pCOZW4oRUSAzzchv8oC9r0XJJdlPVQKfbey5KKJiEGegXJOHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ToALk1JYUKDgGnzhq5bPfavcRRoHWV7uCZb5ywlSiEM/TR1N
	J8GkUx+w9PgE+HtvozigqxJgShHP4zzuuZZ7+FXPoRxqIJ0PZBaZ+M5CZ6IoH81IwOc7WKJtPy1
	o8xxBspcwUeDXFEZr6lckJrild+vV2uiafIrt9hY+nw3jXHecuwN1kIGuiHWxouFFq9D1
X-Gm-Gg: AfdE7cn0lqcBnbMox5gRZHm3CDQm0bC0jqVy+qZ9vipa2EcI9VVZTGMkell3xfQPkr3
	poN1Z11csUDLm8K+Dhq1UiaVDBfdoPcmeG50AfmQbQEfU6iE1w+RrqPTmc/9H/kSdZQu9BgUc2A
	7TgO6yQYrCE0bRI9zD1p2gbnHb7e1w6gQXqfBCQErzK7PHql7AshFJK3xrIBcE60S69pNZ22A0k
	mfcA0V7bMaqIUDl3hv9TodrsHsNquSIvclmcvyByzx+T6z90+a0TwBW7X1C8TYTxDEGgvBDp1rC
	SwvBcbzH5nv6O8C53pcwIMMC7BCjQGa5q9K49gH8sijbv9oPNjV0/o2kiuis3yFlIs47gInMiMq
	bPRMVQhfbTvQEXXCYvn9ZGS55xZwbzw7+xXV3umjxGjR/nvhibUTkrLaJ/PgjbwxLCVIycI6G5e
	3U4KMg4II=
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57993251cf.68.1783435869846;
        Tue, 07 Jul 2026 07:51:09 -0700 (PDT)
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57991801cf.68.1783435868305;
        Tue, 07 Jul 2026 07:51:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d4dsm156219366b.49.2026.07.07.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:51:07 -0700 (PDT)
Message-ID: <84f593f8-eb28-435f-9458-55aff899dc1a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 17:51:04 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
 <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: osn5AnPVzE8sCV0hNwXFZZRmIy5ytTlf
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d125f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MVBuJk07v-XTMpK2hJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: osn5AnPVzE8sCV0hNwXFZZRmIy5ytTlf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfX/WL4yUueV/F3
 OVT89jWGo6jacknkBPVO8QWxBTFAg0YnHQrMZmjIq9KyQqfW0XZBIDK032rSfXs99A+kdt9EIOk
 pcECL+Si3q9RpXodlMWZC3XV9qOYXB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfX6+Tu+FW1Bajt
 XyueyQEoqPScmyCH8Sws4hw4+fAH4odj4sBn7XtnS/ZYcqOFY30qJfZVC+5r9bH/gl9V3PypL6I
 IULa9keyy8tpeY4Kpo2TeIO67Lci0j3BpxMbRKJRCwuWoojcqqvc8N2uB1IFsyGOATqE5bPW8yf
 0hG5sCxSon38WMuyHSYUzoWsp5wTk/bbRzKUiJOemuBGSFsHt4hhiIpVvqEorMPb/Md/Q6p9pTH
 zAgt7tBt9Em1uHbl9LQwQwaxQqjgDRNrWlRypHm+ah47Hfb0etu1bvbJpl5+QVPyxOo5NdjSzz+
 o8lmBB3k69lmN3h0IEA2EOhvmfIIPpiEvpfougvQNZIZvLulmYY0evfKDOoA5Fdn+3A9WaSuVgD
 eiOqjXC/aLtOdvphmg91ysDVXzt6KYys9TyghgFmPiqlPavlxfIRiclPXO4H131pe0glwLWXGNb
 6Ruvs8rm7AkfptJ5s4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117351-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFB5571CD9D



On 7/7/2026 5:47 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Dmitry,
>>
>> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>> <snip>
>>>>>>
>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>> +                                 "hf-mnoc",
>>>>>> +                                 "sf-mnoc";
>>>>>
>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>> the device node, they are found and should be allocated on parent's side.
>>>>
>>>> The interconnect has functionality to handle bw requests from different
>>>> clients.
>>>>
>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>>>> vote
>>>>
>>>> on that (actually it is possible in icc framework) but what is the benefit
>>>> of moving
>>>>
>>>> those to camss? Is it not better to create camss icc. I understand
>>>
>>> Please fix your email client and stop inserting extra empty lines.
>> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>>>
>>>> you want them to be on parent side. But how to vote on bw? Most of the time
>>>> it
>>>
>>> If the driver actually votes on those, I think, it should be fine. This
>>> patchset seemed to add bandwidth voting, but then it dropped all the
>>> votes in the last commit.
>>>
>>>>
>>>> depends on the jpeg encoder configuration based on resolution format etc. to
>>>> set properly average bw.
>>>>
>>>> So i dont see how that can be done with not explicit dependency on jpeg with
>>>> camss and some exported
>>>>
>>>> API's which we discussed with Bryan they are preferable.
>>>
>>> Interconnects should be fine to be referenced here. Especially, if JPEG
>>> has its own port to those busses (hint, commit message).
>>>
>>> As I wrote, I see a bigger issue with the clocks. You need to have some
>>> API to vote on them (and then let camss driver aggregate those votes in
>>> a platform-specific manner).
>> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
>> for the clock voting.
> 
> Please discuss it with the Camera team, working on the camss
> improvements.
Thanks we will discuss this topic.> 


