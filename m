Return-Path: <linux-arm-msm+bounces-86328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE79CD8F07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61C783007B47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07141329391;
	Tue, 23 Dec 2025 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNySYuO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHW3alA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E62D8DC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486926; cv=none; b=UBX9G734pMmTWdFSMjw86+XNmeoj8ovaG/3GFgq58+lEepOk7nucnLZV1UprCzEr8Ke7fPX7JjbY6uE5UvTg978El6vArdYjd+Kjg2u0Hpn5ltVqZqxEhhHZ4LjCPOYPnuRTMfMaj6GRgGPtMa2PxNNZE2RVDNkcpZQAr3tU9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486926; c=relaxed/simple;
	bh=lJIY32/GCIbR0U34vNiVLDJMSF1KbysHIJK8Sy5uI9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ao2cHbzpfNBT6GdT1Wg/zqdvEFbRhmqMcjpM4bhPj068WDYpqZkwvQ3wqhOA2Qvdc+I6l2uyvieVGkhnkS8DiHTDANsYHO5VA/Owh/pGNYmXIaN5fya0wFrpbt1iHPqgdlCDpio0VP2LezS1shBeppKd0757sn4GwoHhRk6pXtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNySYuO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHW3alA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6wvpL1630783
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=; b=KNySYuO17iEwVQjh
	iHbUHlQDSdr5Pygt68Scl4tv6ZF5s+lOLXN+ipJssmvbD729U1iCtXa93IST5VO+
	nBT4KX1HciSVgbPQOLwe+OiZVA3JElipp7GVlSd5YwohTuRzFtuGgitJ6YBUSoul
	L/G5xUGu9beJBoSgqPPB3XIGu++UNiYbwtmCizg2v/sRL2R0/B39hbpEo6Q2qkcV
	hWcs2T8KwJslmBGeuZ3ni8X4SLHn/GQrR497aPnTU3ZzfMNPJ5bCqBEuj24v92o7
	pSvqwpHbffhSnhjdyW45U+hxwV3Ux5uGuiR3xItlZMFlfmMJtVnzCkcoAa0sZmVa
	gq/vAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8je15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:48:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f8e6a5de4so67393215ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766486924; x=1767091724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=;
        b=jHW3alA7SDf6ATntUCU0mkIky0Qxpq4hmraMVK6k1NyMy3gYRqlRl4fQ1uOFDkcHI3
         XQMmYC9ulykqs9DvsB67yQvrLRWR1DjuHBx7NoPVdTeiFz3dpreHIIKd7UUrATqS+1v9
         6mbtlmkE0/NOjr+QY3hS/Had08/9twFhRiA6cK0b9xFqZ5QsjmwWNPCwEIXcV32VmBeu
         WITJW+LIFBNwxpzwno+Y/u3hMaaUYXHUb0EmzkkVpMDl60srmnM7Vl1T4aexXAYQSbdX
         rC//NF/OVF+JpqgcXIeS4deThqdPWUOSF7+C7QvVgqudaP09UJr2J2Ddlhmtp46X4l/N
         VJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486924; x=1767091724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=;
        b=CvsBm7T4lFX0BtnYimPLxfpIN78bSnGzFXuT6Uyb0F2OKA+4ebKvoe9qybVDDXs6BC
         coBGiS49UYeofmZCVPqt22tIpUUmk6QBs5QMIRahqQteBd9wugwDrXITLMDfSUzsrIJT
         GmwiqKzgjE0kss6XnmhEr/jfT4oXyALQLHFOyWb7k/KtT68UsArjx4xSAGTs+UT6XsKP
         vkU+KjQmUw12Ng0HfK5GMmVMZI9ImChLvqsYKKxPAAaDaI0Vg63s10g4CtNfuFne3Mzn
         S3MNL8p3KifnK6KJKZ7gy1glA+kowaGzx6/7NwmlXzhr20FMQtbAoyYaW49ARqenAedw
         cv+w==
X-Forwarded-Encrypted: i=1; AJvYcCW7mwlFPpNXwzAqYzsbyiYQ6OzeHOvcjiw0c9oW81pPKPGFagltuShEk8duSKA3RUQASTkj8V887NIl58Tj@vger.kernel.org
X-Gm-Message-State: AOJu0YyofmxACWKnVoMjrhI9cOea9ZacstdoGR9fpf2xx/A+SYaB+EUE
	31rpbqT56iivY5YfQjdjEskBN+4ozCYoTId0eWw9XyU1yx3GKliw+62V8cFYegaO5+rzk9DsTRm
	3knfiEamQbv65IxaJzYGf7m7NmMDaIRfEv9vV7k+nnKukhT01sjCjKUc2LnnTK9uRnKgM
X-Gm-Gg: AY/fxX4bWDwlVmaFvOJd1cXEdEhBkr16KcymY5jR1i0AY2C4bL2S+labvz/k0SjR4nd
	2tE30enZVtfk+SsfBJOOB9awNQDeZkkSbxnlyZGyfWHmf33tI5iPGoSyNjQBfk3kmOt3TS+HjKt
	Dy0lDjirdjfbhwLIQTXKr4WQeQSum9BhC1QFJNQZMU0tz6t5VlNBfLAPyGKUX+pr8UyyFvvx372
	IbCHDwiQu0FQtSY6EkX6tLfUDZQ6R0XKk/ZPkIwQ+bD8m8NjP/rVziIXBFm0oCwqi+uHfhrX4zZ
	ZhDgT9/LsHg+PSt0wpoO52PT8GbBHrOY5zaeSfewdB5LyMH14I8k38YKAzfr82rkMUfOLL/tMmH
	5lrHc9goUDYD3yJ41DOO0jZxueUhXvFXXfadbMg==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2a2f2836764mr139761125ad.29.1766486923889;
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGKGRq2ffp7hGOh+N5A3dzp/NoIb6jP9M8gUpRTD+0+rRLBvYqvrBUqBrw6Oxlq1LRAApRRw==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2a2f2836764mr139760985ad.29.1766486923433;
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b22536esm13253932b3a.23.2025.12.23.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
Message-ID: <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:18:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eV65PlQPmKmxilSjNTngA3qLOiUvY-mB
X-Proofpoint-GUID: eV65PlQPmKmxilSjNTngA3qLOiUvY-mB
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a738c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MOVBJHszn32KNyIy_nMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfX7chxjWzIJduV
 DeSxG/IsfL/8kgeD2++Jzc/AlKj44WPliIZRBidPcVtnMD/fNk0D6ttvngJWJyFtLr4DJajxE5w
 xFTDBq3GsSFpJ3pxlwDGteAmtmAxfjw41y2SHIrkAcQmuKdRyfkqiuukS32thk+m1/brkzvutVO
 g24TOAxh131OIDFzsyxFcRVhveP/xFWUGqtgH7khUstMAM9w7fbvqbOEet5baXRHT6MX2zAhNBH
 qDzEVfaOcpmk+NEjcbei3TZpswox8xUOxeCkEHzT+T/Be5W6k7hrASpzehO716S/fSBAthqN0CC
 P0hRcMi+sHrzPmpAd4EKR7AzsZxGjn3d2+/Xs23SPdVDtFEnh1LfwLomZ8g6gAIxATTZmJSSUyU
 R9uEX+OZeKaXmcC76NOTf9Rl9FBt1gqOL2/l9Ho/las7PfoKj3TDV/Cp8La2iYVZGajnx81Y1oC
 rjj10wSK6QQm11KRO/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230086



On 12/23/2025 12:39 AM, Bjorn Andersson wrote:
> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Please use oss.qualcomm.com.
> 

My bad, will update it.

>>
>> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
>> derives an intermediate percentage `duty_per = (num * 100) / den` and
>> then computes:
>>
>>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>
>> This introduces integer truncation at the percentage step (division by
>> `den`) and a redundant scaling by 100, which can reduce precision for
>> large `den` and skew the final rounding.
>>
>> Compute `2d` directly from the duty fraction to preserve precision and
>> avoid the unnecessary scaling:
>>
>>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>
>> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
>> a single, final rounded division, improving accuracy especially for small
>> duty cycles or large denominators. It also removes the unused `duty_per`
>> variable, simplifying the code.
>>
>> There is no functional changes beyond improved numerical accuracy.
>>
>> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  {
>>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
>> +	u32 notn_m, n, m, d, not2d, mask, cfg;
>>  	int ret;
>>  
>>  	/* Duty-cycle cannot be modified for non-MND RCGs */
>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  
>>  	n = (~(notn_m) + m) & mask;
>>  
>> -	duty_per = (duty->num * 100) / duty->den;
>> -
>>  	/* Calculate 2d value */
>> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> 
> This looks better/cleaner. But for my understanding, can you share some
> example numbers that shows the problem?
> 

Sure Bjorn, will share the examples.

> Regards,
> Bjorn
> 
>>  
>>  	/*
>>  	 * Check bit widths of 2d. If D is too big reduce duty cycle.
>>
>> ---
>> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
>> change-id: 20251222-duty_cycle_precision-796542baecab
>>
>> Best regards,
>> -- 
>> Taniya Das <taniya.das@oss.qualcomm.com>
>>

-- 
Thanks,
Taniya Das


