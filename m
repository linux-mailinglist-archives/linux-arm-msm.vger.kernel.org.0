Return-Path: <linux-arm-msm+bounces-63234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C885AEFCB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0704D7A38C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDCF433B3;
	Tue,  1 Jul 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCfItxb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88431D79A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380473; cv=none; b=W8MSiex3BKFd8Iz95rcYNIcZN7krlYXodsBCF6laTpL+s+EtMYfMDLTg9N1JsUpptlZuuSZHS2MAkme9AgddnzqhWJPTnBAZeU0yZHlDpfBoYyqvAA+cnAIsHW20OUCWrRPrQpLak0CDB7HHO36I3vJjIts1QtORvDRwfNyztxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380473; c=relaxed/simple;
	bh=KxKFudIMAkAUupfpwIU+ReorMdQsudmQTUyXUYvg8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUhe/R1GOALyxJXIPrhgUuRNLln/ZB2Q38t2weatl/m2w2Bh9SeFu3K+9fvfeAjsO0jlhHrg/Dl2j7DgmkpfbKwzQmz1qJaBY2qHQ0vmm7+cvOsgIBCa2oZwwJBYvAHO1r11hGjDH+dYJp1gbaTwD9BrINdtPA902vo3y7o+LpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCfItxb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619kEmN032109
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 14:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdHjDJl9WSRNdehYgLqdLZay3sL60YxMRcboor7qHbs=; b=gCfItxb13G37CKPQ
	AASzooRSJZVMwwejVp4lLzb7zl8DfyrN0zxXtF4eTo87H+iKWenBQ+E6KeURP7WE
	7n98SeapqgpVG3dCssUi40xhchUYEhRzlhZ54EZMVCi3ROKd1XKtTRzZvLE3wyfb
	ObmfrvHl5kisYUNTeYIyqKW/0/poCD/tLSbKm976Ru6OvNNDSN+/2JK357yircYp
	DeyD7bv2zrIgsVPOzhI2UDAxPozc9bnnZcmoonWLbEY7aye3+c4LNi7yXKoF1ooR
	ElpKnXVbnWuix9CIT9raRiTkLHSX3rOYuA2sVp+yv4MyctC8YR8l/SCuu7THgrOG
	IjbCtQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k9aew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 14:34:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748a4f5e735so3444903b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 07:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380470; x=1751985270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdHjDJl9WSRNdehYgLqdLZay3sL60YxMRcboor7qHbs=;
        b=EusapkoLMN/0am3cegBdzY7ow/N6pRSFiz80W55wMh5YfOW9tkdpcYdsCRGBuEy0Z6
         nxn7llyKA3mR9Jtc+eFMcMNdQqstO/PN09fdtgML/pF1OIIK7FnSgbTPG9JyYGKUVu1z
         Q/5wMwqgre8ytmxEa8lzW4tc+4PrLKTm4QAglwW0Q6eVYoJISPogtk2kZiF39Ke8OIUH
         ZTLaikt2Hy09sShT380o9hR4ECrAYWAqmBay9vRISh16xKWB/2dQyVnB/z6+j7b8x0G+
         EZ0wCUgQ0YCQa7TIfjOVyGdsTXA6ijJSoviakmYTS2PNpsg4nSqRCZhbCzpduknT+PLZ
         Dabg==
X-Gm-Message-State: AOJu0YwSCZkyVlcELzJGMp2JEIL3Xk9G2Be2goWlpQqPsJBOUZXj9m6t
	3gECw/hFp+u4PAi59lS/0hquz8JvrDB8EEQLWnGGwQwAY0bq0lF1x6t8gNucqZnwwec/0hldxxQ
	fJcZm1n7Vlx1WXLsH9ZQ/a0WrOk3f9xwVIAAJoNhNx0G0u6ygwXsST03x0nFMCKtbPXHk
X-Gm-Gg: ASbGncuAYMNFY+TwYiZVY9OgW2xUvKANYQg5xv4w+R6m8xzJJ3tvqFstwGe4nokRkEz
	PAYZPMJqbrxyGLjMWZi5OvEUa4RruiaE+JT5eDWaPTDwpq4m+T5PvRyks6Skh4HH6ONz82YJtkK
	yTvzu5bHNgnsZfuH15AQxUlFRLbJHFZoka0uC18sNfk+l5NKU86+w3jP1+RUFBFZV6LICVYdLNV
	V4zIZZV11Kp7r8zGq7x+YH5/DbonpcGvgtUVedZQy500QnBmwOuwZIhl3k0PETLqV/AKJYhJivr
	vH8Wy5Fihb4zeuGjQROQgP6SDEjbRvWpfUhE8yQcGNZ0ym21uvWY14UmXFtHuacp7GJo634T
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id d2e1a72fcca58-74af6ee09d2mr23287918b3a.9.1751380469825;
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQXaFmKt5xsajJ65+/iX9gSySkf4+TXFivGFr9tmmWAw7KyPrLyH4ID3FavxTAaBlZvEOVFA==
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id d2e1a72fcca58-74af6ee09d2mr23287877b3a.9.1751380469375;
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f2280sm12260164b3a.165.2025.07.01.07.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
Message-ID: <fe166777-00bd-46a1-a971-46a513b6616c@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 08:34:27 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
 <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
 <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863f1f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IpJZQVW2AAAA:8 a=T5rYVBXz9qOjrkLPEW0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NSBTYWx0ZWRfX9zkxajLb6hYl
 EHiGAN1mbSYo6UCAWSL69vCoegFxzdbB1z0bT4ojZGtGuwlBW+fMB15WbymNzdXnQJ1XQODe4iL
 5zcJObGsy/fDj15cAJVJqlgEK+kVzfnVrWPvcaDUIurueKY1DxCn5xp6VEZq4nRXbd6qnZLi3pV
 kiBgUFPB8gs2a4pbSaLkygXzkbNkbqLoiZNZlIPon0sdnxsX6lodQYUPUyXzpPzlI6fG4ixh0VI
 /dAYfFSQt7oHgsq9S7Fg+/wVTBxflF+xEP4TLoKiRZZiqPZcUi+lkShqlWsdFy+giQrghVY0Yd1
 sv4j0HjgpZUCWPK4w6Zd2y2O8+zL/G0F3EZxOg3dOp8iKkezCEFcuQQZl8cQETmdOFFO4i9cK+a
 XnFKFX3XtS3gPOlbzAym5cJAvVL/1sVkmy96PZQy1ZTmF79j2J7+TIB/6ND5cmgqIkBayzVf
X-Proofpoint-ORIG-GUID: lkj1QBkX7SpxgUH3B1Ospp6nGPKPmytR
X-Proofpoint-GUID: lkj1QBkX7SpxgUH3B1Ospp6nGPKPmytR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010095

On 7/1/2025 1:40 AM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 20:31, Jeff Hugo wrote:
>> On 6/30/2025 11:25 AM, Konrad Dybcio wrote:
>>>
>>>
>>> On 30-Jun-25 19:23, Uwe Kleine-König wrote:
>>>> The modpost section mismatch checks are more lax for objects that have a
>>>> name that ends in "_probe". This is not justified here though, so rename
>>>> the driver struct according to the usual naming choice.
>>>>
>>>> Note that this change indeed results in modpost identifying a section
>>>> mismatch in this driver. This is not a false positive and should be
>>>> fixed by either converting the driver to use platform_driver_probe() or
>>>> by dropping __init from the .probe() callback. This problem was
>>>> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
>>>> driver").
>>>>
>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>>> ---
>>>> Hello,
>>>>
>>>> I don't know if platform_driver_probe() works here, it might happen that
>>>> the driver is probed before the matching device appears. As I don't have
>>>> a machine with such a device I won't create a patch fixing the issue,
>>>> but if you have questions don't hesitate to ask.
>>>>
>>>> Please consider this patch as a bug report and better only apply it when
>>>> the issue is addressed to not result in build regressions.
>>>
>>> +Jeff is probably the last person on Earth that officially has one
>>
>> We are talking about QDF2400 here?
> 
> Yes (or anything from the same family)

Ok.  Will take a look.

-Jeff

