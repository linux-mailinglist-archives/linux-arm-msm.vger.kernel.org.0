Return-Path: <linux-arm-msm+bounces-82075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D4C63D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB563BB919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BCF3C1F;
	Mon, 17 Nov 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1VAzl7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2ergzND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A975130F957
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379097; cv=none; b=TlZHOVOdJwSYb6QiIAQafOsuOwwLRsRhvELs9/w+fm1C7OWk8v2qh6ucNZiHfthVZCJx3IXfkoErpVy/Zb+80IvK9G7sn3tkYjpf4ngNY9YQcgR81p1TdRiSQSDLQAoe3XZRZevhn/ns9UuwIKvdt8zzjO9iLsuztM67MRgncuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379097; c=relaxed/simple;
	bh=Ud+tp0HdRdv7dJ1x5/ZWmfDjPnywEzaj9HfWrbT1DsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ct2QG1LBbDhqGE/j9znfXScha4yMEwLWfY872mHtMqdYJl4Rt9fzOBclTUCn9GevjmMF5X5nkjboJ9q4QV0eui2nkJd+t67kCok7lKKuJJWXfN6wVWEQxwx1ftk9IxgPHDsC8GpD36apGIHWIEWep9SkI22x4pL4A57UfdIch04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1VAzl7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2ergzND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nuQa3318416
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=; b=m1VAzl7wPekFmusC
	8tv5pis3TbVr/olThBtVQb6wodqYM3BqGw8QEd38xAxa+V+wi4jN3fWDOfmKb6Xr
	DSAhgIyQ7HyoBmmBTpPb1emjnHkTTpKZzmjUXhvFRUqtzTCZJBVXpz3ggKcPcDDO
	Wv6pYUYAXDkibV2uCgL6jAh6Nmonf86eS1OjD33uGUgyouqrfZalIjfN6YueELcm
	fRIwFWa8GnFLNYJGUCkvW1feu8GI1zdklauqNBMnkTJcf8Lyxf2CPWazzRy3eTUB
	RM0ppgTN+wZ4najtddc/BONkfOaqWEiTrCDROlHoFpfOZBHuxp3NItWesAKZsjfd
	NnqZpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5cgxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:31:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6a906c52so10734671cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379092; x=1763983892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=;
        b=Y2ergzNDl18tA92uU31RxsdrLwvKXScYDadWzT0IHguQmhSCkc6jc5Unkzh6mCjUjP
         SUngvT+OgUtXPFmjgUta52W6CvLv+9232JTuqJOOOXgoXGszmAJ2qpqt5igkjRcpCjFE
         WI8rNRD+YXl098HSrOH4mub7gyyfY6GFy+C7A5uI59iIVGhVaRZpCHQDEWrtvwW24Mq7
         mrNZZ7uOvm7ZijIqSwCpZdPn7wa7ZOfGtUtWWbmEBFVkZnmd+lpANcvPaZxwxYzZIj+/
         ulNnEAF//iTMxOo2dauTZgQm1M+5anw6JZNdUysPLg8r5M4PUd9jZzkWRuau3kE1othW
         Ftzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379092; x=1763983892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=;
        b=t2FEIl5v4zPx57sHRHMGPm8BtfBK0O/iTgm/IFVBEe/n6Cgi8qUgRO5Wts1b2VKE+J
         Tqkw/KptspBQBZDWUkBQmjGUaNJkDiNEySkHrnB4oRGhStj1EoCH59c90W3qV+uEYCzl
         c24kBoN9I85ADzu3iwCRp2MFPXHtv525Gmr/2PxOY1LTJ1RxKVY6EGTko/OlrMF+zu3V
         RTqB50c8u/QuJsrU5aidDmFaJDp4lEP01A/P90fQGPtbGz40kX+db6VXXk6B3fae8BWM
         rhJzKmorm07vzKZj/fufbxymWTK5wht0L1RdlWHC6wB/z5JVtHJqIpB0pC5GTaAdEJV9
         v4eA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFdaMSs/M5/AaZQij9qXPXWpGSPUWYBk3ovWxkXYeAk2G3u9MAcvxGFn+o0d4aUl1wDuWDSqN9KKkQ6Lx@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXlITlY7HvnVSN8ADMtpsQZ3GVWMWU2W/jlt0Y7jB/+MOG7QQ
	bWkUwgNSsmhINmk22wfB9TMZcKEXoSQAUKFiFa052ZDKo92VEZKnzLq6a9Oeu6TBHG3MXAI1rsF
	A1KjOS4eqneaQEWBT2PrlfTmaLd3JFl3n/HpDLAIhB1LLmYL3rlg7CCZO8MwtLvBb+uvN
X-Gm-Gg: ASbGnctfphoDKG5oSBoY5VhW57dZ5PyQEpSO+jerqZ1/4EZW18esoN1SrLWRNQ+rfxv
	Hd9LY5sfw0Pt8PVRKdVhchVCOouuncV61oXC1UC1OREEYQSR6E9SJvo4iw5UYLWah8CM0Pt7WF+
	w6CCsRULdTCexqTpP2UHF8UdcDH5C/oZ11oDuFIw/JgGeMa0o/M2sJfgCj2Vxe2+YzO5radu2vu
	jjne1GFVaDoVR+Z0w7JcowEUtts7QeZ3FfEJhb4vOChevwYgIXecEq003IO9U3xkuMsbQ/4OHc6
	4v/72OVK2uNd3yjSX84T5OZCgfCc9AJmtkMrKIh9AMXkeZ183IXNPAjPCyiBaMZS9tx01MWA9gW
	KReFctAIeLoU9cwO299ISlVeGTsszbErx49Wkqb5NK4XcOqXiEX945dNn
X-Received: by 2002:a05:622a:409:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4edf36eec92mr108556281cf.10.1763379091653;
        Mon, 17 Nov 2025 03:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLMD6VRAnOzPNz4g40Qvt8vPutO31Vosum3GYhdislSLFcTDayUceesttS6gR4/wv51rIwlg==
X-Received: by 2002:a05:622a:409:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4edf36eec92mr108555921cf.10.1763379091028;
        Mon, 17 Nov 2025 03:31:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1db6sm10005006a12.26.2025.11.17.03.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:31:28 -0800 (PST)
Message-ID: <8adbf95a-4ca1-418c-bac5-9a5e01116164@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:31:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, kpallavi@qti.qualcomm.com,
        srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
 <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
 <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NyBTYWx0ZWRfX93dIH9WtouRL
 SRcbHG8RafuNa6Bpd0ucHTtLcqsGBX8mUc7AeYV4JnpKK4CnDg2vsB1Y7dYceWpNYNcEHXCZYwT
 aKv0T/1udHvb+nw/v5Uf4bq9lDWwVSAqU+3OpC/nc0kyqYnLQIu4EiZ+r6IUMeZCdG93UeNMHmu
 AOQb/ySMibLOcT5q0uvpKlGWaCAF9pMZ8nwJhrFsIBWb4IUPDykbHwLXKpabD9fR/a/XFChFIc2
 h3JDEqIJRgM5lt1uWMN5r4oRrC9FIxQbpbfJX4LqdEmZHKhO2/g0N78GvT7xFEDfOVjVSOAXpXL
 GXgpDgiV/fF7jDDmPiiLZugmmtU4+8KN2Y8OSUK8ud7mkus1VBx92Qnn7BbLtq0S+9iOQ/jDb2f
 vIC6r2yLM9DmBEl/oKq38kRHpDRoUQ==
X-Proofpoint-GUID: TieOZo-gx6IXxXspLhO_JRxW-AteCAyq
X-Proofpoint-ORIG-GUID: TieOZo-gx6IXxXspLhO_JRxW-AteCAyq
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691b0795 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=O8XbOLt1H2ra-FkJ7roA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170097

On 11/17/25 12:22 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 17, 2025 at 12:37:33PM +0530, Kumari Pallavi wrote:
>>
>>
>> On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
>>> On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
>>>> Update all references of buf->phys and map->phys to buf->dma_addr and
>>>> map->dma_addr to accurately represent that these fields store DMA
>>>> addresses, not physical addresses. This change improves code clarity
>>>> and aligns with kernel conventions for dma_addr_t usage.
>>>>
>>>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>>> ---
>>>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index ee652ef01534..d6a7960fe716 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -106,7 +106,7 @@
>>>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>   struct fastrpc_phy_page {
>>>> -	u64 addr;		/* physical address */
>>>> +	u64 addr;		/* physical or dma address */
>>>>   	u64 size;		/* size of contiguous region */
>>>>   };
>>>> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>>>>   	u64 ctx;		/* invoke caller context */
>>>>   	u32 handle;	/* handle to invoke */
>>>>   	u32 sc;		/* scalars structure describing the data */
>>>> -	u64 addr;		/* physical address */
>>>> +	u64 addr;		/* physical or dma address */
>>>
>>> Can you go all the way and make the type dma_addr_t? That way you don't
>>> need to typecast the dma_alloc_coherent() and dma_free_coherent().
>>>
>>> I believe it might complicate the places where you do math on it, but
>>> that is a good thing, as it highlights those places where you do
>>> something unexpected.
>>>
>>
>> While this not strictly limited to holding a dma_addr_t.
>> Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
>> set, S2 mapping expects a physical address to be passed to the
>> qcom_scm_assign_mem() API.
>> reference-
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b
>>
>> If you suggest, I can define it as dma_addr_t and perform typecasting to u64
>> wherever required.
> 
> You don't need to typecase dma_addr_t when passing u64.

*on arm anyway

Konrad

