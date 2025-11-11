Return-Path: <linux-arm-msm+bounces-81175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C020C4B894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217803B0359
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E77B280329;
	Tue, 11 Nov 2025 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MosCMOCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2DgMTqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8654281369
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762838559; cv=none; b=uiqsN9RJySTPZg/0wbtwTvEqrvbn+cKRfgoxI41eZelngqUfFr8t5TIMq+HiKTdYUbwQp1bDMqoKse9/+Bp9s/hZHjfct147TEmWD0B/Og/pkhMF78x4rggmpmLkyN2Cf0QkTnwUu9mVGjHIbiSE1EF5boQoPuOk2f5ulHO6BoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762838559; c=relaxed/simple;
	bh=9OF1VOFFihuJuwmCepEzHh2ATgtLynGxJRG5+laPChQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGXaBCECpaSlv8L2KO0a+MxNCs5npsg6T4xsdQEpok6rfLl615JxhjFeMtDGtnYEfzGbZEN0/NlJ4doeyzQcOcMMw2XL/Z2d/JloeGeiIYlSX8z1zeTwyiGsHQrmcBlU7U9jHbkvPZGAxTegvuGjSnV8tt0CQb6RUyVV5Pjk7AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MosCMOCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2DgMTqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB2Z31c3984882
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=; b=MosCMOCW3NChtPvs
	1bMlSDAStRvBjBJXjFGSIIe7xvCam9wnhaxQzB66lwiNjiOQ/qnwNa72xMafmilu
	PlW8P2WijEWhS+bhRRQAXYqJLiEkCvJ596Xzxl7HtrFjvcmw+PTma5FAp1Ajap3S
	zSR/bK8hYfviy4wkcYa2aMxyZzhPXjbuRNawLs/NE07hoRJmFMmUUbwsevY3uyI2
	YbohSNdFNIDmOFZ9+jTEEsg04GL3AF5R29fevs0MOKf8/aU64bqQwYd7xkC7gHp3
	TVtvbwICqiGH13o6ULl4Jr3PVpkNBc1KxT1P+VTTrC7BHTPWphRa/nyb9pBsstbH
	pb/Wqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqj1ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:22:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ba795c4d4a2so2756850a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 21:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762838556; x=1763443356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=;
        b=L2DgMTqqT2kHCVAgyb0L1d2M5AhD+8YwPLnlM3JJuLvnoQT52aDkTGLek27Fk+JsgD
         GzQ6+tMMzpuL0JH/H7WfN5t30E8xUoA1VAzSTLcxEw1bpcZVTt6BZhtLM6PmNWC/Jd98
         Rcug8a9m/InRbm5nO2yrljyXpMndqB/rojuoyKE292y8hcW4N0zd7gqoiQ/99+REL6Dg
         Es883jIpXTGBBAiu8xGZH9IB1U0jcAf5i9yKDStuO57EKDYuLS0hGah8EpvuutqCZhPp
         LZOi/txN8ca/FYp4mYf3czoqx44XLmcS/M7kIlQQlN2Hp/jmPvWCAE1GBuOqRI7oczq1
         zASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762838556; x=1763443356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Te5+jGKVmczWAFRX4897loQZ9s+94IKGhi21It1SFQ=;
        b=QTUZ2PMcpMf5w1un45T4Irgl+V4rxJNQV8HEInqkbLk9xm0mLY/4xyADne89SHVijo
         SiSwQzqigbVfzprkLpFrTlpQUT6jzHmrtuDCECRNK7iVcP4pB9EsqPesSIYyJa0whi5O
         XTx5RilHpkGcP3uFyZdnF6koDu5dZFcSKi4R13X3LZ/8FZqEm49jm5S4Q3Ngkw+xLM35
         Fqpw1nEvC/RQchvryb0VtPdelGdI3w+0PzKz3BCXcGl2rPQiuXqTYJXQkT26AJSLPAUj
         ruax9RZMHY/TBdVNtbjf1MutRh8C2TMPMNbfrCgQ2kN+MIkT+ZGIvl+vBehFUtQ6OBdM
         xSWw==
X-Forwarded-Encrypted: i=1; AJvYcCXtKRFRP/3aHpVyYll3HUyNy2OT2q1AEnJ/vviJkb+rBrdy84IPismC/Bx4G1iuYI0f1Voz1nYZ7jMe6feq@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaKQxIoG6K9XZQh6KZDRF+KhUtPlTTU6kA5We72ii+73xQr7G
	orwUh55L7LZwWq4A8UpFPj00vkWt454n98E94F1N4OaYfKF85s+1eZrK/JidUjQxXMAWjHArdq6
	qAyoNiOqipMs6iS0TOaTe/yuMqpOf2Wf9i+hGL7shbLLKCLaPu50kmvRA1sLEqD02nSdh
X-Gm-Gg: ASbGncs/S6x0jaV/bWFJTcrweZ9krGUJWTBq5DW+lkJ9boFQVhGaoGeK5BexiAnMfxi
	NR4N1NgEKxWuu1rgb0oTrmQXmIMU5IK+C0Mc754DeohgGjhzuD0gIoPIvfik39Pq1MkUXdvB/cj
	0cfTKZAFXwMO3zXHa7XMmn34/OIYNvl/+LKYn9R4tM8WBhvRdUeZBX6LMGLQyM3Dh8HBJYywAM5
	E45I3V63Vt18gnZMj/FTIO4v7fTJ8slrizywhG6lOqSrY3qv9NpIlO9u2mjfbJ4KG+JUmVNpXHT
	f+SUHExZ6qYZddrxwrIzoqaOmDff0TAC5PNDNJKMLkWZLOIb18GQIAOC0FgU9uerLh0ygbpn5YY
	1fQm94noDRea1m5+lt3ew/hUhnPXCtfc=
X-Received: by 2002:a17:903:244a:b0:246:7a43:3f66 with SMTP id d9443c01a7336-297e561ac3dmr145696035ad.7.1762838555595;
        Mon, 10 Nov 2025 21:22:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG44dhpC7FpqpgcK7ljK7RCCQ2W7yUdgoVHyPBRAs0CPdhZrrNwS6XdCmzCnymqvg8hfGr33Q==
X-Received: by 2002:a17:903:244a:b0:246:7a43:3f66 with SMTP id d9443c01a7336-297e561ac3dmr145695555ad.7.1762838554961;
        Mon, 10 Nov 2025 21:22:34 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm165660855ad.25.2025.11.10.21.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 21:22:34 -0800 (PST)
Message-ID: <5cd78217-8da9-4290-b098-8210280e65d8@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 10:52:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in
 pinmux configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
 <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAzOSBTYWx0ZWRfX/rugbTXkk08f
 fiUzRFbskyT8VHlD5Dr5ExppPNmkMMti2TrEFrU4gj1Tf/adPAFiJom7V9ZCKqdippSXCroaSVs
 ancMM9CTOgqN1E+n1vRTJFPDF/0WZCo7Qmm770qI5XjLoBZba3fRocKcGaHrvPhXckddpkYn4OD
 Dbo6M9AqTlzhIvNH9jtavVWuNScHflbdRQI85hOlVj8mgzlZBR0Nk1Sx5wNPLYdeo33pC1lRtxX
 IgZcB+apmF6P/bPCNCzY/+s/LtD9Z4vBymO2npjbT1J4WwZB7Nh1DrEiWhTNewg32N0PGVmVD18
 SFOpBlFo+Z4akieeXoGGR8rQY76QoraPOwcaL0xv5Vefbl95HItQU1cg6A5EZItt+zkJ3tje6WI
 lP3wli6E3dtPov1uxwEmzGo1JP7aUQ==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=6912c81c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IV0jPyGM1QMGTU76z_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: tE4yEVF8olF1JxbhLNSV1dA-_I5iE4J-
X-Proofpoint-GUID: tE4yEVF8olF1JxbhLNSV1dA-_I5iE4J-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110039

Hi Bjorn,

Thank you for review.

On 11/11/2025 9:38 AM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 03:40:41PM +0530, Praveen Talari wrote:
>> Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
>> to prevent potential deadlock when wakeup IRQ is triggered on the same
> 
> "potential"? In what case will calling disable_irq() from the irq
> handler of that irq not deadlock?
> 
>> GPIO being reconfigured.
>>
>> The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
>> handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
>> msm_pinmux_set_mux() calls disable_irq() which waits for the currently
>> running IRQ handler to complete, creating a circular dependency that
>> results in deadlock.
>>
>> Using disable_irq_nosync() avoids waiting for the IRQ handler to
>> complete, preventing the deadlock condition while still properly
>> disabling the interrupt during pinmux reconfiguration.
>>
>> Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
> 
> That's weird, I debugged your deadlock for you and told you to make this
> very change in:
> 
> https://lore.kernel.org/all/7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn/
> 
> So I guess Prasad told you how to fix this issue before I invested the
> time helping you?

Yes, that’s correct. Prasad had suggested it earlier.

Thanks,
Praveen Talari

> 
> 
> Change looks good, and description captures the problem.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 67525d542c5b..e99871b90ab9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -189,7 +189,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   	 */
>>   	if (d && i != gpio_func &&
>>   	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
>> -		disable_irq(irq);
>> +		disable_irq_nosync(irq);
>>   
>>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>   
>> -- 
>> 2.34.1
>>

