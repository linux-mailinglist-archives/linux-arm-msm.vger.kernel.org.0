Return-Path: <linux-arm-msm+bounces-89775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DAD3C16C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B61AD567B35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3AC3ACF12;
	Tue, 20 Jan 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov4gbPkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rgjn5N3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953B3B8D5B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895779; cv=none; b=hYy3Xvuff8BlYph2sL03i5t5PZoDe6eLYiaALlepSJiGjse1dpS4h/j6ZRjaFKLHbeFln7ibmZ3JvxgVN5BKMGcqSmqfO6i80Z15bKsaoIsBZpcigsSzm7PFDAJ4Kte0xKKbP8DN4FVF+/Q0l/5rUU4XF+CluBtdXklJPFarLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895779; c=relaxed/simple;
	bh=A3q6+wEcVXOwNaUIOc41Dhe9Ssf7vGNyYFuZ6euRtFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYgc5aMmU2ZA4Z8vonLVmBENJZJDN51EFWkdcrvIcT+NFYeusEuAPT3J7fxkM6xVayfZD6U+F4jD9asSSbA7TzWCk91xVqqjhbLKpSXfw3mC3UXeV5DpcVhp6CG/Q7KvjlBg9K5IcD6L6j6DIwkZEObsPiYQXSJk2zw1EFgQ5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov4gbPkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rgjn5N3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K29a6p3176740
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKsLovc3KARkhs/4j/9k3GVlFSpps4fzd+8+jeJ5Fh4=; b=ov4gbPkhPBvrGYXK
	9JUcYDfDzemzidbvJ6mol5gOOB3uaC1K7XuOkKAS9zJTUJIW2V/X/+Xg2kEbQSOk
	SzTUEiX4k9SVWqJJhf1RnNZHS5Z5lFHSnnUMw0xeXeAv0e6PRK546BfAgtINTPQt
	ftXbMUP1nBV1eGHNDG6DBoEUzlVv555D/GHW1LWSyv74vYy6OB8tGOw+Ub6GS8Tg
	YabxkTumRm+aUYNeQIJQl4wre8iwIkcg67gZcq0IU8yjeZaM+9YbNd0tbXnfAQHk
	MxWGZO/ZCp93aDUkjPChU6/wrt8bEs/UnjEEnNIjnhbY8Ts2MWOQ+FSze8E04xrb
	CCt4QA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2gwm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:56:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso4915185b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768895776; x=1769500576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKsLovc3KARkhs/4j/9k3GVlFSpps4fzd+8+jeJ5Fh4=;
        b=Rgjn5N3KkyW0PPpq2hyXs7mtM46v2bkA/1dxcwBAOvZ3JZQkQ+sW+YRb5ifrgaYXAN
         yq+LUfMyYZXeWe+v37TBGWU7rgvjgOdl2bM7l2BgVvbxsLyT+LQ8pQflm6V1tTeUByf6
         qKn6aX8hNNUWeuiFNBqLFwEyesvfy1dwe1HRg/oRYaB2lYoVmTr7k0Ui7vBvEohoUjyG
         +vOPLy5u94/BBKLgBx+aZro/LZa43MnMIHJurEbwPTUdHbZnG92iXOdHBNN8SZbOLfqC
         HS1v+TeEdgVQVtthbYZYMw4LRwhNlbKPL0kknA1n5qSTMXTUNgZU5Tl8dl5fP5ccwclp
         N4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895776; x=1769500576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKsLovc3KARkhs/4j/9k3GVlFSpps4fzd+8+jeJ5Fh4=;
        b=wWm7aDPmkZxNLC9pPE3VKYxBDcrkbKa5Hbvd39BozeCvDNvPS1ULXP3fNFTGFu1WfY
         Fxgey0/TQtVPIxBAHNX/3p0mZeA+MAveSzLG3mrL+vSvVd34nea+zI52xo0Gg3aCQkYj
         Ah/6FUj4333tT1Yk1V/sbhj0yW49EVuK3LaC8OfNxQzjDZwWwWaQ8JvC03xNlWObpama
         /mgTo1xG76FA9Dp/+yrQqF6S7w16xFuIfwNURbo0cfpoxLrNcslwE/g4SYQmaVoqsGM+
         LRKGu2kqMdSKoUVgtgQAU14vFyx8dz5L1ppPPCxu4TxahXL2Cnj/r7Sn4UCAjJzRqN/K
         pZRg==
X-Forwarded-Encrypted: i=1; AJvYcCWpM2oNiT3eLlTcJ6bAbB61x/i7W48Kqf7f+Rh0G12Y48i3YwAT+R8ukWGCF0ntXNjzJ9v3Bqnc80C77Cuf@vger.kernel.org
X-Gm-Message-State: AOJu0YxVs5hL59clHYNH6Olx309f3gh8US84yVP6UHFEmRQ6Kf4wUgMO
	8o6FsCQcHVLEb/Vf8IfGG656RiclW0fV7eoU8H4IxD6pL38vI7hkdfv3YlkXmUB3tuK8tu99qgN
	Rypam3TNbyclpSRGBpB/MET8A2OqNJ0QD52lK571mvZ1++5djtjeVMUpTxnNiCaIDveBw
X-Gm-Gg: AZuq6aIglvoRfxGyEWH1cPKLmrTKWd5PPA7zbmPwPbAUw+x57BJjhFdfD2PDbTBV62o
	mDdjAz0BJiPF+vXrwlp2H5Esy4m1pGb5rzv1g4IWTNLQTZ3WSnueQmrgUYDnxNI/QXkGswwpg7b
	tA9RryZOgtB+RokT6OvfqJetygJWrAyGgt8WckV1jkWZHoXB/9A1BPeBy9dAnpGCMjNrYkySPFO
	YUYmCMpbhX3pPinXoFGWWp5rjrZesXe2rjg4F9oRT6JGICJnGe7YcZwk8ZA5oW3iLVgMXht6mHT
	dAgHZElGLxZWGebv5YiPfEQ6mQv9AgbEb7FyUMplm1sD3mMiHj2YtCEywhNSxGT1I8UOn8++x+3
	EG7a/JTdXjDhI/fAxXHUgVtlWKsDjaLoKYE4/pxt9l612/trdkMiSKG/poW/LXysI7KhjH48U1r
	TEYfnO
X-Received: by 2002:a05:6a00:3a0d:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-81f9fce68ccmr13367832b3a.28.1768895775874;
        Mon, 19 Jan 2026 23:56:15 -0800 (PST)
X-Received: by 2002:a05:6a00:3a0d:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-81f9fce68ccmr13367810b3a.28.1768895775371;
        Mon, 19 Jan 2026 23:56:15 -0800 (PST)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1291135sm11142535b3a.47.2026.01.19.23.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:56:15 -0800 (PST)
Message-ID: <8c63a77c-1676-461a-bfcf-55202e723718@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:56:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dp: Correct LeMans/Monaco DP phy
 Swing/Emphasis setting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com>
 <47skckagggxijdhinmmibtrd3dydixtj6pccrgjwyczs7bj2te@2rq2iprmzvyf>
 <749e716e-a6cb-4adb-8ffc-0d6f4c6d56c4@oss.qualcomm.com>
 <5ytgf7saw6yfvqzqmy4gtjygo4cx52vomi7mwswc7hgedzz3rb@eiqxiqs2cjmb>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5ytgf7saw6yfvqzqmy4gtjygo4cx52vomi7mwswc7hgedzz3rb@eiqxiqs2cjmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sjzpzvIYyMAaJqBiBCYA-EAni9AyCb-8
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f3520 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=TcOkVFdsAhurElaN6YEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: sjzpzvIYyMAaJqBiBCYA-EAni9AyCb-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX7fgdKr/wjLdg
 B6NAG1EU/P31OcF8QNpLAMiQ/LKh3Z4UWF3ymU7aQHLnpO/izzyGS6eKunkhVxCd+3FrdTRDWBi
 f/H2zdHEW9iiwP+zIAwbhFsyhHvR4u9sNlBiZ1/QrEVU+pUANXBuj5ROlNKcsGfPf7kVQijQjDJ
 tleAqdI0exH5vLdJ2bzBmZ7I8kjnh9yFIQAjH/Y3iaGsZVmFgWjqYJNGbw6Q3n+1Il55JMZ41Uv
 u5nJ/KPlPOR04uDpjXYNNteFZ/gQ5MeEri5KVlA+Ilq15ZW80SQFdnnO0VWJkk6ucw0pewM8jlH
 aL0TzTNhJeM3PBjnupax1tLQUeFXVM3pacziDv8TB6H8s+X/KdRpFJ+9GXZp6OG1h9P702x4i9F
 KuDu4OcLL0kjMKNIVGoX+AyWzWRW3OPWuKck5wo1g4nuhzwASmV9sBV/Lojii88MWjJsj3fUIf2
 WPL807E5K/OvjiHEM4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065



On 1/20/2026 11:12 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 10:43:46AM +0800, Yongxing Mou wrote:
>>
>>
>> On 1/19/2026 8:55 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 08:37:20PM +0800, Yongxing Mou wrote:
>>>> Currently, the LeMans/Monaco devices and their derivative platforms
>>>> operate in DP mode rather than eDP mode. Per the PHY HPG, the Swing and
>>>> Emphasis settings need to be corrected to the proper values.
>>>
>>> No, they need to be configured dynamically. I wrote earlier that the
>>> driver needs refactoring.
>>>
>> Hi, Dmitry. I plan to submit them in this order: this patch → LDO patch →
>> refactor.
>> Since the refactor involves more platforms and may take some time, I’d like
>> to get this patch merged first.
> 
> This patch is incorrect. It trades working on some platforms (DP) vs
> working of someo ther platforms (eDP). I don't think it is a proper fix
> for any problem.
> 
Got it.. will post refactor series.
>>>>
>>>> This will help achieve successful link training on some dongles.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Separate the LDO change out.[Konrad][Dmitry]
>>>> - Modify the commit message.[Dmitry]
>>>> - Link to v1: https://lore.kernel.org/r/20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-edp.c | 23 ++++++++++++++++++++++-
>>>>    1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


