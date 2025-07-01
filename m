Return-Path: <linux-arm-msm+bounces-63146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A6AEEFE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE9517A2A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E12242928;
	Tue,  1 Jul 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZEvDCM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA31EBA1E
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355659; cv=none; b=JPUQFiAbuE4yi6hIMmMwcx6PrH+nzdjdxm3ayiKiDF+MwMJnFTHu8mhM5DgdPOqa+kyCCcPoniL0lnlAqwaV4hcBjFyjx9Y5A5jIEUSqaUX7CJgtkOd9UpYBsrYayeJSKHBBh4zCrCI2X0Bvi/hbHZbi9Glbsw53gP46jcrSVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355659; c=relaxed/simple;
	bh=HPdrHWCoDuz13Ky7biRX7elTO+NC2HCwGNPBBt8sgL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTc5HarLR6oKs8fmtNyTx55CTUizP7RivFJL1fm8etkXJz1tW2YFjRr5ZRoYZUAT2glLKCtcHewmegRwuOZEjRsQx02X1W1BIt0REfnKXIKgh1rIGH6rTjWky+A2ifoSxUQxFh/KTwje1CSi48SzWmn54eeiwVw0NiwR4t8RK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZEvDCM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614RVEA028430
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 07:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBiUuHa4Ev9QfuzvshOa4pF5bJbfaWZqMb3L/YViHMI=; b=WZEvDCM4cX6BvRq/
	PFuv4W4DDqBcKiP/duuLq6RRydhbVPTi2zFCdKiZdKRtnpz4lw+qhukm9xqGeRcF
	+50gsHo90HJ/2rwv+ZJo/S+98Bt6ZXJcJZY3MGZ7aLiE/1cxQSSFVEPoywuj/ODX
	eHH6PQ4bV1bINlDIpIAnc7JVXo04fjQVs0klDu7AQpoKraPypyfBq7GnbVyoS+Ww
	NbtFaLqe8vrjcqAdM9rCouSmKUCftOB37Zr/zii0/VoKZy+gMQpTd1QIEh5/VRM2
	GLKyoozK+cGUlmhFediQEuE0ZJeA6Xg1lwPT0d7BfYtaupXmrAUz6/yKQyNU77JZ
	NEmO8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvqm3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 07:40:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a804126ed6so6722451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 00:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355656; x=1751960456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBiUuHa4Ev9QfuzvshOa4pF5bJbfaWZqMb3L/YViHMI=;
        b=TS++IjxLmB0zg8inPVGTnvRr+c/ddGQDLmvviKKRI1hUFWKP4QFsaVSk/yQFOhp7td
         gVMeLSSjZ0UF7csdZCCGd6lAU28W9djHPS9MWtnV0iutYcMNLuQkdjfOJ4HixgQ4hIyl
         lagMgLbfaFGqTHCvhK2fj67CHrmJBMSqwa1GhQoFg+r8LP0wcdMisKyMrWFXc08gyrGw
         UeMbmEiNiMniULbmc4j4T2XPz1x1fMM6SZf2sdKYS0E5VtOR6CeM3EFXllMiQhX1jI0a
         UgjD0j9RerZ08Do4iARGoO8fzPHB65t5xw2ecVW+KCvZqdek+BmEq3XO1g5ZntzaquZU
         znAg==
X-Gm-Message-State: AOJu0YyUYXP2LnoUUsukOMKTyMFevmYQB3+MFjaMh9MPqa8lAie9Zbyy
	enPHBaE0qh94NlVFKc/+8TRtphG1JIFkz3JjN8x1nozI4fDlCCCU7fl1z84jPOPVFr4NoDGBkLp
	YaL+51fdN0/BwPt5/GcnCnmVtraf9dDPO/3CI9uUl+Wf1U3GEwQzaLWqGjF8A5fkJTW8s
X-Gm-Gg: ASbGncsvrAiuJv4H/H28A0GiLmi0E+oi8OY48A1YUou1269Wb2z0/U/Mz4/VFmCMgm+
	xEcIRDD1cXYyfP/5647BqctVV7tA5oqDN1lDm+x3jsVPGi8q+dSoJ8f2JN8QAZYDKxq1IT+pExU
	knzzCr0GhDCc6pMiUaA8kwbKGhvqj7l9UoumEhpwWUJgrt31NudnrdQRVMlLhG71x+Sj55Md3Yv
	Py1z8XHznbQLO56PV49x/O1E5xCAxYcep/S4gPhajwaMEjek71gONZ8JAAXFH6+wJ4aYdBBO++4
	9AhWcfCnTO83IoCXz3WOmEK6YtswKxNHSalFold4+hFJjjK7OvPuBao9PVt2KvP+mYHNzE4uVuj
	8KVEyArSO
X-Received: by 2002:a05:622a:11c5:b0:494:acf4:9572 with SMTP id d75a77b69052e-4a82f7911dcmr14041761cf.0.1751355655675;
        Tue, 01 Jul 2025 00:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8vIAxiC7R4/LjBlXrebEnIw+5ENBMrqahks1cWfXfwrsNWihn1ztDjWEuPkXZzU19jTs+TQ==
X-Received: by 2002:a05:622a:11c5:b0:494:acf4:9572 with SMTP id d75a77b69052e-4a82f7911dcmr14041601cf.0.1751355655195;
        Tue, 01 Jul 2025 00:40:55 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20e8sm801034466b.165.2025.07.01.00.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:40:54 -0700 (PDT)
Message-ID: <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 09:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
 <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IkzIiDRlOq3uMzSwmUIFb8GqhmJh6Q6F
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68639109 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IpJZQVW2AAAA:8 a=8sca0-RJ1klIZi52FdgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: IkzIiDRlOq3uMzSwmUIFb8GqhmJh6Q6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MyBTYWx0ZWRfXxJFl3guPzprt
 lmtaM5lUp2snuXZOAlLIPnvys1PFvmaLPlBjyHf4w+NyEkDGsIXlZiwEQyTERjEPdGCnX9I+Fw9
 +pDa45RfVWkFPsCQ4NkT/vfpQliRBMd32+NQTdWTb+sZuKmskKG4iybn4lOKegxJQO9qT2YVbj2
 b8RNlA09sT2HHPcoip7nV3lqiqAwasMVn54dQTLY1+woOzvm8DEbt/qFm/iKduB9EQ02grMO2lS
 +bGmAK73d/EwvMlSADytSFc120FEYvKw9/0kwoQnIcbGluGr56ntItqwgR5loO4non8aRX65xxr
 eg7JGXwDknxFBC7zs3EMO5C29QzMHFxfwStnItoOPOYw9mqeNVB2apvkmE0qWfXFSVn+BALXh91
 3iL7it5lCcFKgSo/B+axV18PqS+TU39/EN7crfTVSIsDyriWidp7STjDZtqbty1Xy9mteoH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010043



On 30-Jun-25 20:31, Jeff Hugo wrote:
> On 6/30/2025 11:25 AM, Konrad Dybcio wrote:
>>
>>
>> On 30-Jun-25 19:23, Uwe Kleine-König wrote:
>>> The modpost section mismatch checks are more lax for objects that have a
>>> name that ends in "_probe". This is not justified here though, so rename
>>> the driver struct according to the usual naming choice.
>>>
>>> Note that this change indeed results in modpost identifying a section
>>> mismatch in this driver. This is not a false positive and should be
>>> fixed by either converting the driver to use platform_driver_probe() or
>>> by dropping __init from the .probe() callback. This problem was
>>> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
>>> driver").
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>> ---
>>> Hello,
>>>
>>> I don't know if platform_driver_probe() works here, it might happen that
>>> the driver is probed before the matching device appears. As I don't have
>>> a machine with such a device I won't create a patch fixing the issue,
>>> but if you have questions don't hesitate to ask.
>>>
>>> Please consider this patch as a bug report and better only apply it when
>>> the issue is addressed to not result in build regressions.
>>
>> +Jeff is probably the last person on Earth that officially has one
> 
> We are talking about QDF2400 here?

Yes (or anything from the same family)

Konrad

