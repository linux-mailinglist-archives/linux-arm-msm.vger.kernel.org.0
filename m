Return-Path: <linux-arm-msm+bounces-89682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC7D3AAB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F290D30A2E39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC96D36D513;
	Mon, 19 Jan 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYSbdrq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEvaeazt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D9E36D4EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830691; cv=none; b=KRZcxK2WTeGB7HCnCtxxp2necB6Id9lFLWX6hrW82UJYsrErLX/QYUsrWVX8H2T5qmQu4M5GtnwBA1cDndlfWrWvupOPeBAWiCU8OiZqPjQD9310J4Z9xfeqTxmGSTkMKM+c0Aw7SmHQq/KcPq6qbYcCy7CI/DAE/Z4//4KrUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830691; c=relaxed/simple;
	bh=lyQ5oYGO5BWiSdS1hcwl7DEZmw0rG3EOwyPXalkwDM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miqrDKmWASAE2LiAQuk5gt6jyn1igMVqagq2nEl/ZVdUPnN9I5WsWeVh0nc24YcEjcuavI/4iKRJdODLUwdrdPCLIHjW3U/ufH9YwwNOcr3TRDikWtef3ypIkpu4qu4zlGRoonHeYht1mJpQBJOr4w3koK+hDpmVPnD08xENikU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYSbdrq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEvaeazt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDMLt1440845
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djvHE04gT4Vn5K4oxXDDmAx6PChrXJER98gGJu0Seb0=; b=BYSbdrq002E+1bjl
	niem7OM8mj/4o0GxbZiBZu8wU61rtlZVtDicm44AXkc9OYK9gQzwcjWv3xejz6Uc
	4iC+czYNCfNpxuYUsiHhf7eOGgU0zV1DUmkvQ75LGbU0ad6psvpqbMZ/oPGyOndY
	dOh8qJUIWE5Ulbtt5FZimq1uSjrTKkWYz2cANwz/TbA2LZsFCEfgqkjlhx/TA9Wh
	kx1z1/9A3pxb1iMi6z+TB9o2/pfP8SBXToNJLj9iShCrfgyNghkt9+HjoUrxfvOH
	2l96jjiC30vx4ynDAFus4W9LdhcnQqooW7UiDT35ZUAysBZMqt8aYm7icE2/fDfT
	n6+Bqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3gd5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:51:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b20137a6so504134185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768830688; x=1769435488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=djvHE04gT4Vn5K4oxXDDmAx6PChrXJER98gGJu0Seb0=;
        b=PEvaeazt9GHQhjiznCvHKFsUz98s1iJ2cr32r1EYelKs1bwmDD542ip5GNe8fsk+44
         hGxs/2UApdVw+nAVokZ5Kk+/wILmr8HQYYgCwaQms73RTvmeIxKZrfIJOWsv8LIFJ9hy
         /EVJg8zulg6q+G9nl/LvvnoEmESTWYNfkASQuu/mbpF3sOBvYp9bQjBVljhcESS0OOEe
         gHURsLZULhMr22PrtuY4y2Ge1UxhhhgjnALknDRtn24kN8lozJn4u0FKbsEqyhEcgScO
         ro2UaV6MwJUlV7wiQvasMeZEY6rSlYnczih9lblUHYUUciI8qNwAzbqEYMY7xm/kqZYi
         FvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830688; x=1769435488;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djvHE04gT4Vn5K4oxXDDmAx6PChrXJER98gGJu0Seb0=;
        b=wY+EjEuf1xNIAbUcT0ovFlETsnHOfYFTlDwEH2espGVBHiwN5LVRQPZef6LCCL2GDz
         /dyZ4irt8cyPpN1eYfUbgZP7WaiXWPx6bpzCdeOGfSYxGY43GXKIFW8MXIiGPZ3R4LIX
         FmL9MPqa/r8VcXuyjUK8FdAkMvw/6517KJPeo9VCpsQPTfSQ+/EAPjcALgwjznLmeYSS
         YKNEm8H+nJruGzbqSQjSKcLvtohWDO2xL+HJDoeS+TJS1SKxE2RKAOJhOUDPe5Yd0WGx
         4QUgcUSLBiPPk1gUPSKe5o4MVqbzqVpd2YZ5WfIp4Fh7aD1IakSAwIB3FL+nUrgtQkfQ
         IhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcbKPKdnbpZ1Jot6lM4R8PDSOkoHY7aKBV5HMS1bOA6bqBvK1A6uTTANDsiZw6yokapLL6H+qX35IhgGoo@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwmocLyTLD8tMgKucMEhvybfmAh+VFLtWuLBiQjmnXoUQ8BbA
	Q/nlnXDWveqKluFXAKVpma2rHC4roaB3V+cPSkgpwDMu3tuqAqWbktAmc7c9DjJ6TuB6DG17r92
	/X27A5+P+XwYoIeAGSCRtT2GHwbkZB48uDRHi2EXOAbwBbWMbz41LmnLX1Rc6SJ8LkEc7
X-Gm-Gg: AY/fxX6ZYtT2GrfbyF1ivkm4lbhS4XRcQ7Lyzr37vkkoFjfTl3SDb/Ijd7XD/M41Fqx
	H2NhHUe+BfTJ8tGeeiqK564ePgC2vmpA27fXjCBclLKcxZ2P00EsHLkO+BinYpYZvZolU/0q7og
	HBU8mqpnU62l1xaFU5HLtJWNx8VRFWNc0yBBEG95H9rCd7FnG3S/RWG3Nl4PTOzMz0Ka2KhqVWJ
	C1L/J136qgQvMIzWNioL3AfkC+Z/2wh112PFIIG60G6zjxOIxTrquypocKKQ6mQ3rZfuWsKcvzg
	EO89zJxtKxaTSfRJOuWemfaM12WXBHzO2hGI62BDSHKidkm3zvjunNej32hazYqSBaxg8LLihLY
	Oz72psz4Bs1+s+hGiqA5vJWCKs/sWd/96+O1Tcg==
X-Received: by 2002:a05:620a:4095:b0:8b3:9e:3124 with SMTP id af79cd13be357-8c6a6783831mr1567699785a.64.1768830688616;
        Mon, 19 Jan 2026 05:51:28 -0800 (PST)
X-Received: by 2002:a05:620a:4095:b0:8b3:9e:3124 with SMTP id af79cd13be357-8c6a6783831mr1567696485a.64.1768830688110;
        Mon, 19 Jan 2026 05:51:28 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9daaabsm81705505e9.4.2026.01.19.05.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:51:27 -0800 (PST)
Message-ID: <f54f4eda-5776-4a68-a661-b66619ef9041@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:51:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
 <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
 <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
 <e2dfb857-1fd1-4d29-b04b-6dec0b7563d5@oss.qualcomm.com>
 <45f650d7-7369-4a0d-b931-3ba9ac998f75@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <45f650d7-7369-4a0d-b931-3ba9ac998f75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e36e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=R-YYc6eSStklxcYmUugA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNiBTYWx0ZWRfX2RT02EiaucdM
 nRq5Lw4J5gEC70yrXvGjLXj/IFY3HPMQYfwUPGp7z3reYs1VzV35fxb4uu7bFoSJfqlZifNPmcL
 hifwgY19X+cOIA6K89irl/7Kg9y5n3pxJOmWmJslcCzQb3njMEvb7Kve2OA7WQk/39xEw8jXdRg
 fnKIY99BNRDIag6hOQH5EYrk/Kqy8qLXpbdGCjcmM+ZUR+NuLHYINuDjEb1p2MAGLbQCWeSQWPt
 LRHPiG9TpQo7bGLkuAsK0C5b198jz8F7a1TELobWa2Rtyaa6xc+4xhqPKAKEhYQX4NBDPKTI1P/
 ic8JXJLRvdC28ewIFGDTRqgqdeb5FzN76RznIbmFmmtFFmgJ4hG0QCQKE7DYuoX2depkEswtbXw
 x6dgIhHVT3sfjtnJtRWYK/62Pdwjji9uQni1YdcLiBiuIhenx+uUSM3SVdTNGnbLR3o0YhSNKIH
 HgiBERECgTw/uSZpoOg==
X-Proofpoint-ORIG-GUID: Hevm8CwA5EMRERfTj3NgCBzO7vNIXcKY
X-Proofpoint-GUID: Hevm8CwA5EMRERfTj3NgCBzO7vNIXcKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190116

On 19/01/2026 14:35, Konrad Dybcio wrote:
> On 1/19/26 7:54 AM, Yijie Yang wrote:
>>
>>
>> On 1/19/2026 2:34 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 10:39:04AM +0800, Yijie Yang wrote:
> 
> [...]
> 
>>>>>> Changes in v4:
>>>>>> - EDITME: describe what is new in this series revision.
>>>>>> - EDITME: use bulletpoints and terse descriptions.
>>>>>
>>>>> Oh no. B4 probably even warned you about not sending it out.
>>>>>
>>>>>   From this changelog I can assume that nothing has changed. Is it
>>>>> correct?
>>>>
>>>> This section was generated automatically by b4 and was not reviewed
>>>> carefully. The actual list of changes is in the section below.
>>>
>>> But why????? Why do you ignore what was done for you and write it on
>>> your own, reversing the order, etc? And even if you decided to ignore it
>>> for any reason, why didn't you delete it?
>>
>> The confusion was caused by mixing b4 and git format-patch to handle fine‑grained patch formatting. The Git configuration Konrad suggested did not work for me. I ran b4 prep --manual-reroll <msg-id> to allow b4 to track the upstream thread, which caused this section to be generated automatically. I did not notice this and mistakenly re‑wrote it myself.
> 
> I found that I have additional options set in my *local* gitconfig:
> 
> [diff]
>         renameLimit = 999999
>         rename = true

This one does not exist. You wanted "renames" but you set it two lines
below.

>         algorithm = histogram
>         renames = copies
> 
> Perhaps that was the missing piece!
> 
> Konrad


Best regards,
Krzysztof

