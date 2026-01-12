Return-Path: <linux-arm-msm+bounces-88434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A253D106FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D87E30119AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FED307ACC;
	Mon, 12 Jan 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeEWXTv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8cYMP+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734A307481
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187640; cv=none; b=GfxDMcuuODsQq0RkuW2Alg4F6ybw6oHpiHwuV/3pW9yiXx//mVPGM+JNfVODI8L6+rRIKjRZA9QoN2QMc9bl19qvADsaqz5dyc1NU2ThnKqw1oShqjK/WRpRp0KcUX9k7tA0Q68ZyC1Hg7/11TmmR+820uXb5kRWGLcXXrDWqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187640; c=relaxed/simple;
	bh=0auznFwkymaFOm31ZXjfgA0vx0r9Dw2+u2El76a8DgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJALrRz2Gq8hDAN1n2yD3afl+0GWcD5xtYH0HBeQIIgCD25hPluADUqBy/AyzzogzYgwtYz8LhLpunJNXWKc3Piw0u9aFOifksvrH62eRE9+34ifcyki1x+A3UdDAIbAoxAofNyfpbVL0N3fO5/h2CcoJQ7u9EfzPALZqmx8Msc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeEWXTv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8cYMP+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B1EfNU1078207
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6mqqVsazJQqen4M3/6gp/6iTrRA6OzH0muEtMfmMPg=; b=oeEWXTv7UKUpAzTt
	k9dkmZj8Zc3KhovyzmUtD6iumTF8Oy6Zt5Xs7joHJa0FYQ2PPGolTldpN1/FMr7O
	TQ8gN7GIhRUWMOBbrVo+LEjsWb1qbZhZ8Ei8oxzyEYw902LO6mYS+oZB0Lb+U0ER
	+fwor+l6zicsFwxz684ShObl4OhEkHQSytUhL/COMzmGbZv4PJg/yg5SffdM56mN
	jCiGFms35U0lUhE6+9ZT165GecFIJR+JJDss1EDaJt4mLqBYmN5C5Mb9JbVVAyDh
	gichw300kNyCw0tQgJb9VYA7odwRs55gk6ch6VzHzw2Y/KbAXQSCB+QmIfV/fZkS
	r55JFg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxty8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:13:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d59f0198so65381885ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187637; x=1768792437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6mqqVsazJQqen4M3/6gp/6iTrRA6OzH0muEtMfmMPg=;
        b=U8cYMP+qNBaSDbQ4kThzTEYl5mzuWY80aDtrzdrrE+tvgX2SCjFTVbceXZiJ6MdDLi
         dZh8AG/CWZ55sYm6MnZgfnfDdECGNw6a7yGOi3oe4uHNLtdLl3oYbtRsgSsIY9sSs3Zl
         kBJSpCnjvVX1RQWtEpcThArWchqdv5cR5+MUiKXC58/e3CIXU5oX6JUU7q7e78SXc9vC
         hRjR3AklMkcfaUl21I848UcwFXPXSgaqILe8XeVPMciYOZQ5jyb31jdL4FBdqicf9XBN
         5RWgLhTxTps93lgrk83DFIYNW62dMRYtleQMINajtYnu6LWHj2Du9r4Tka1P3K3Gln3n
         27Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187637; x=1768792437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6mqqVsazJQqen4M3/6gp/6iTrRA6OzH0muEtMfmMPg=;
        b=suIq2Z2Z5kRPdCrjtr5lNgdNh81mh7Dlz2Reh6tVwhC8Msqw1DTP+O+JvbKHTYEDRb
         RdvC18IfbVewKc6DD6OFA/kvJDQoCbMW9JbIQv/zyYj/AvBKM5yCNEX7kykA3B5EbR3+
         BFi+0DDdl4cBHkFbQVlg6XKCV6Sypc3NTpphN4pdeRKlDy8C+b1avNEgTEHE7Jn7thAw
         qtcDUeh8FRWj2KbH0MClLZ12qfp9FGGsZsndAsfHsAHU1mmjpUwplpO+vme6d5AgVcGB
         xKfrF7SC+6qgjWUpvUMYo3X3IHpApMnwnIjj1E0gyvzcs7TENTePclKyxnuFLRHT5igo
         JjgQ==
X-Gm-Message-State: AOJu0YzK6uHDGhBFzsqcpVtoDKctnX63FzRYMJVoG8UOoL8abJH0LQtM
	RfNza5HZzFV7+N54wHvt+vtIciz1TLTcMX8ySaVRPZ7/rHPfzMtULHOY70Y0FtzxK24/qBOJZtH
	S1+x4fGjVLxEUh7a1+DzEBxFzrP4JogduM7O5jswlk7NPF4tlAt1Z5M9wlDyNdoI/vB1J
X-Gm-Gg: AY/fxX75ydXnuKphHohM7pNKnqfy6f3jlT7yALuUE8Os86fttihNqhMLhMRVk98eiWi
	0pcFHbQqHSUkUtPQIYKItR4m58KsZg38FSG5djBWbHUBiPon73/IkBjvYvQaN7LQEycCPIqJMyI
	FxIuPRpOrCsnZXLFnQIdX+6KkjSitWrxHYa8RAGT30DSGcvnmG5HtlT5jW7Gjkg7Vi2/1DGdzB+
	tnxIE7jXDA1ycaR7/Ivg6+E3NN0HWzdD6+hef3mP9qGcIlfDIlJxkTdE0rQpIP6lOo1Y6QzF026
	3WIFsPXcpnKxde7dROBprOmFEaPZrqY72duWfXxWdWR0zZ1uFaDGP+mCdmsD55ZmldqZlkEBfg5
	LYbkhqbpBDlV7RTVZeslQnCRRiea7xopu1GToMuO90qSwdNWHP3zuV1H5ICY8aorLAbEx+zPuz7
	MT2ww=
X-Received: by 2002:a17:903:1984:b0:2a0:bb05:df55 with SMTP id d9443c01a7336-2a3ee45bd7cmr167518255ad.21.1768187637517;
        Sun, 11 Jan 2026 19:13:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExqx5/WpX9d/gew5JVfxzktPLh3UkgTFDncv622jbztudf1Ru0CGcRYAiBudeGXetnkVocPg==
X-Received: by 2002:a17:903:1984:b0:2a0:bb05:df55 with SMTP id d9443c01a7336-2a3ee45bd7cmr167518105ad.21.1768187637015;
        Sun, 11 Jan 2026 19:13:57 -0800 (PST)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4796asm161079365ad.34.2026.01.11.19.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 19:13:56 -0800 (PST)
Message-ID: <b6035539-efb9-4491-8822-59e8a2a5ad04@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:13:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial patch set for PURWA-IOT-EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <2e8e6436-96a3-40d2-86ce-a716326f79bf@kernel.org>
 <1af7d2fd-02fa-46a4-a7c5-0a08b1e1a596@oss.qualcomm.com>
 <0ecea9df-00ea-42c7-a293-85d7660008d1@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0ecea9df-00ea-42c7-a293-85d7660008d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=696466f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AVnNOSSoy2WkAcAlbF4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cRqNdKp4gzvHEP4Aj9P603sc1cXbHlLl
X-Proofpoint-ORIG-GUID: cRqNdKp4gzvHEP4Aj9P603sc1cXbHlLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX/koT+bwCZ0MG
 rTZOckKYs9WpftWa/V4gxj9wjXF7pNM414uUDF7wKCP0MnItNkQCbaC55ojVF26alM+mKEqYSrr
 wayjN4V9UT1yMTLKLS0M7FqsMy4mWmhYWIOVZQ2gNU+ar0SPsfri+8ZgJgq0WBIC+yaWjA/cpsn
 8ABdppyy1XeL5B0U+wOOBoZqWcEm5hR2WM9FxMaZCjoQQo/oYCse8B4OTyDSwRwRz9fuuEVxIOf
 qTNx9iukfb59f7ovwdQ+zKxZY+JN/Em4OZMeWBB1lF4ZNUAWkj1/0qWyl0BDLLjyTMZIImpFmxf
 OXSS9ZzqN21gyZcHycAgn0DowOEL3a4i4mdfH6r/IX4gyVCADdfU1qqpQ/MqF90Q/IqfwJSXMeg
 OrE3GyOQ1hh8TDUtEMAriJL0LjpZR7SB7nG604zHV9mQai9EuawuolApbLV4s02bsKDL8iwxHQf
 6+fKhD9GyckIFrYM4Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024



On 1/9/2026 5:28 PM, Konrad Dybcio wrote:
> On 1/9/26 9:26 AM, Yijie Yang wrote:
>>
>>
>> On 1/9/2026 4:06 PM, Krzysztof Kozlowski wrote:
>>> On 09/01/2026 08:59, YijieYang wrote:
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>> Changes since V1:
>>>> - Update the GPU firmware path.
>>>> - Update the description in the cover letter.
>>>> - Reorder the patches.
>>>> - Use separate DTS files for Purwa and Hamoa.
>>>> - Update base commit.
>>>
>>> That's a b4 patchset, so where are the links?
>>
>> Sorry about that. I generated the patch set using git format-patch with format control options for easier review, while creating the cover letter with b4. Since the version number does not increase automatically, the change list was written manually, and I missed adding the link to v1. I will include it in the following versions.
> 
> Adding
> 
> [diff]
>          renameLimit = 999999
> 	algorithm = patience
> 
> to your .gitconfig should work too (perhaps comment it out after
> you're done sending a largely copy-and-alter-a-big-file patchset
> like this)

That sounds like a good solution—thanks for the reminder.

> 
> Konrad

-- 
Best Regards,
Yijie


