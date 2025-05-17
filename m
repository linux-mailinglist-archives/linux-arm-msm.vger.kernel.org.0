Return-Path: <linux-arm-msm+bounces-58286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7DABABDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 20:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BABB7189CA7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 18:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850FB214A77;
	Sat, 17 May 2025 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUJ+dPzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3F2147F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747506539; cv=none; b=fDmAOhuDRl4K5r3X42YUQYuKooXnQlDURkopA7e+/Me8+X+MNx9tl/oJ72F7FzOHrltLr+Phbrk0GHJ69mliGLABi1IaEhl9yadecNVjKHbtsC4TQ9Yc/k7s+chHckPdE3O8StfwFvzlVIHM0eaVHG2ef+5hVBEu5crQd2GPeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747506539; c=relaxed/simple;
	bh=venq4ySRUNYuHOZSXjX1NXCJQJfWk5jFiFmaLZjp1z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWO2ySFiNfS7Jemvm1W/KxxM2QoWOMopqmo9tB/Pl9v2x6VcgJ7BlRYUeDKPT7sOUXqYnIa0zUH2Amr1gNKQRUgoGQ0S3kWW+bkr+KKY0dFd1JYwyMRJusDO7DEC6vIuwsNDiG6svUrpCqCe/DWt2acxasHhzcY37TSo46qnDa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUJ+dPzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HDo29b008679
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WM0LxhWS7WoqwNfrt1DjXdDre6/96mPxCXdCCzvVj2c=; b=kUJ+dPzmPOUT1H2e
	4f3vdsTGtRsnkKqfAHQaVG6C4ia/O5UBXNhiKnvDXpWPJLOE8wn8fa8CHIPZQQxb
	fSI67sTTSEaWrXxCWefbK1Cx3sgo2vf5h4aT+tK3DdS2hSl459bt6NoowRStl2+b
	/h2tFib9F1xUpRbecSDNtJpNpCUDXjMtC6LvdcMwddbid/XMZE3ryN1bXKF8HJAU
	C5bG4XIDWLKhxV/J4eLeKfo2EgtcPupxMzNHPFEHE+10FNbRR26YKUPbLUwRsLcE
	Q0X3KOx3wUnNrDx9uYI7E4pzVzYbDZH2+iCSlw8sZdOTnae8wA8gvgD4dXGDq10U
	yg4NaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyh0ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:28:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so78990585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 11:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747506533; x=1748111333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WM0LxhWS7WoqwNfrt1DjXdDre6/96mPxCXdCCzvVj2c=;
        b=Hbhnx00SE9tJJ0cxbSwZLiDyIbP58abQinG0sFII20gMveAk1lbeDcJWrPO0HnLWZV
         kcL5FSZoYyrBkCC7z70riiLPYiBzARzsu974j59HAm3mOnHr50Bzfzc3kViBl4JxYYVz
         iyhq94bxdbRlSO3KD8ejsssB3wQS/qM2wEbUE3nW9V84L+VYkCToSJH11vWobQwf69y4
         gH99nhMf3eOjuR6a+7R4pK9G6ZRQoN+kyXG2b9Ctqna7v1qJ9S5OK4j8weQyLrUWOtXY
         miSVsp3H+0/yzyIDDpxqaU6oqNncxvGbkVBH+TrRWx7VinyQag5lt920BA7HUYAyuB1b
         yI2w==
X-Forwarded-Encrypted: i=1; AJvYcCWwkgZqOtLIPV1+iLxHKvNi8pBcXlLI2IVcfczhqq1TgVPOzWHPnhwCkswuYXJeIEMLN4pSmH2l3rIO+Bvt@vger.kernel.org
X-Gm-Message-State: AOJu0YzuX69vrVmb7Gy4ctBaT6GYlACNDlHM2NuKO/Xk0geXR5jXvIHR
	COuBnGUhWdpXP/wAwVBRztB9KYnUlpY+6sec31M6c5TC37rKoSYadfXEzOm1hrXIyQX+qvDXVuu
	QOp1y52Grv8L3BG4L18xyGmKlvmNp7o8Qr+p3WN1lPj9frAlJ8P4IaOef/ryaHfaYfai9
X-Gm-Gg: ASbGncuij2t2T/sQdlC/6MOY2AkUuMG4S73W8kKJx3jwhPd2iygSFD2iDcw25LC2XT5
	wYMDuAScZj4pwRm+MIRW4x18plkldjs+mWyiAQZ7M31sDkizpe7Q/mzFeU+IW0+uDFBbr/3CibT
	+bOrGg6HQSSrNC8IocC+nYbA2tKVvzZy0ZS3CFTQEYnGgmz/sceR91HWa8drnLNHRBQdYi3/Aqw
	vQq7iSYyGiSXtj1Vevo1cvddsyor4cAY/dZpZJUYSKQkksrHG67tWDHqcy4x6f4grGUmQfsCxEo
	BFqfd0+tJzGRdZzfVr1uECMUvBGp3fw1Ui9lXO1lPsQgjIMuUlvLfhH6Kmd0v+ciTg==
X-Received: by 2002:ac8:5acd:0:b0:494:acf4:9572 with SMTP id d75a77b69052e-494ae232bd8mr46453671cf.0.1747506533379;
        Sat, 17 May 2025 11:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlFqFfxfLYXFiiljRHIXrnkNmpSimkZBjJ/iFwPezDkWXAt4BzxdvbnuBYSABObtqzWL8Xw==
X-Received: by 2002:ac8:5acd:0:b0:494:acf4:9572 with SMTP id d75a77b69052e-494ae232bd8mr46453431cf.0.1747506532951;
        Sat, 17 May 2025 11:28:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4c516dsm325677666b.154.2025.05.17.11.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 11:28:52 -0700 (PDT)
Message-ID: <6fa4959c-d733-4d50-904f-caf933e02da9@oss.qualcomm.com>
Date: Sat, 17 May 2025 20:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman> <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i9Czy7MVW8AaxERf7jjvL2tCe6SWaCl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE4MyBTYWx0ZWRfX9Z+dLpcJXx7B
 if9s/qN9rAjlag5X+KST0hMwgsLelki8U4vt573oArZJsMMGB1QvWMFZzqEX9Hl35tTA1A16S11
 V/uAxdP9WGG5D7aQ+tE0PygIwNjk81yTr95OwvDINgu714BZjwJil1DSdBIAbhR+R0POg2CLwbK
 SFKu7np7pg0lkmnAVwOP7En3QALvfQC+fz5BR1o5aZpqKlE8aY79qhzT/DPEfvLw9ilgD2lDsj5
 eq9zZPWELettCGo+Bnm9bAbh8IP2ZWKjHCqn0aqYL0PTqJUlUOYgUUGwtGc/hqEcZV2Ht6DM2/B
 4Xny1e8Pa7S9rBvePAM0IZF0UhkhTx4xAwBvFn+z+53ne/W2m6+M5o+EE/lzYVCH4fw3brqHG33
 LZLmNRqLeGZ6Q45RKsqgY4+0vW4cItSk8i6G7+exHkzEXX3xr6qAowQftVHyWHgxVa3NPQet
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6828d569 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=jJrOw3FHAAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=VM-KvOk4zruIL__GPFMA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: i9Czy7MVW8AaxERf7jjvL2tCe6SWaCl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170183

On 5/14/25 8:24 PM, Wesley Cheng wrote:
> Hi Vinod,
> 
> On 5/14/2025 1:33 AM, Vinod Koul wrote:
>> On 16-04-25, 15:45, Wesley Cheng wrote:
>>> Hi Vinod,
>>>
>>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>>
>>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>>> +					const u32 mask, u32 val)
>>>>> +{
>>>>> +	u32 write_val;
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	tmp = readl_relaxed(base + offset);
>>>>> +	tmp &= ~mask;
>>>>> +	write_val = tmp | val;
>>>>> +
>>>>> +	writel_relaxed(write_val, base + offset);
>>>>> +
>>>>> +	tmp = readl_relaxed(base + offset);
>>>>
>>>> Why are you using _relaxed version here?
>>>>
>>>
>>> No particular reason.  I think someone pointed this out previously, and I
>>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>>> non-relaxed apis comes down to preference in this case.
>>
>> Nope you cant! There _needs_ to be a specific reasons!
>> When you are doing read, modify, write, it is very important to know the
>> right version to use...
>>
> 
> I mean, its a write readback, which ensures the bus transaction is complete
> based on [1], hence why **in this situation** it is up to preference.
> 
> Otherwise, w/o the readback then we'd need to ensure writes are made
> depending on the required sequencing (in spots where the sequence is
> strictly defined), and that can be enforced using barriers.  If you feel
> like using the non-relaxed variant is preferred let me know.  I can replace
> it and remove the readback.

Readback is stronger on arm64, as otherwise the writes may be buffered and
not observable at the other endpoint even though the instruction has been
issued, even if a barrier has been issued

Some resources:

https://youtu.be/i6DayghhA8Q
https://lore.kernel.org/linux-arm-msm/20240618153419.GC2354@willie-the-truck/
https://developer.arm.com/documentation/ddi0487/latest sec B2.6.9

There's been a real bug observed (pun not intended):
Commit 2f8cf2c3f3e3 ("clk: qcom: reset: Ensure write completion on reset de/assertion")

Konrad

