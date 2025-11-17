Return-Path: <linux-arm-msm+bounces-82088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22806C64001
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52744343105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE1D320383;
	Mon, 17 Nov 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgExG8mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBny8Pq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782530C35D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381407; cv=none; b=V3VOSne33obDif+73O/m4qVUQGnr7S4kugLMlx5h4iadBIAMKVWl7fRwK7w81LoFyr+jlWQIv9EVCdMyKACgPvSckSV3qMR3cbMN400+3uk2nGd54LLnnA+WdxI5fjfkX0gikjOccVYYDyiGT/yRQGSU9w1Asbixn5yriQRyLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381407; c=relaxed/simple;
	bh=efuSSjKL+m3PmEQEcTMBvuPJby2QnW/7yiQllx8UTZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFqzqfUPY0ADy+WCSXgXdSW2qeNTYzKFIPHZvzwflurNv5NjLqRDGxh7NtaFo/aPnw79g5de6OFOAuWoCQEkXB8T2NZ2CupL3GC16B+43uqJGactV7qNu6q/rvWK4hD6AX6TuG8dB6Pl3I2n8SwmKaE+wjgJ8iR88EioDCkhRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgExG8mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBny8Pq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2qb63671286
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=; b=NgExG8mvhfViX3ZJ
	MdUNTLo1DrHc0SNn5ONL8SAh4PgSH7q5EIv4V/GhXogLZZk2aizP8sN2YaLLU7s0
	Fj+BfXIEQb3Ron61xpPL/3JdXnGZ0bZW1whWnvLboNyQrm5MhSTQgh7O0HXzjtAs
	b+TBpap7q6/qHZEXvxBephuhYr7fLwaOsPXsjWxOrAxjqUEu40JnBPsgCyptld2Y
	nabhC6kB1Da8Z5egpJeTAu8PlfUSxqz+QxY7WVxUDhaGWiC2R9S2S669WKau8oiy
	bF6By+WCswahBIMMe6udTwX+RiiOvKZAEIUl2c1c+0Wr1Wr3wggRVZXXkY21MfC3
	CVwd8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g5866e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:10:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee24e1559aso420421cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763381404; x=1763986204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
        b=gBny8Pq7dx1gx9ijD4qEXxMqiuZ4BYYIp6mCWNFDSUVg3B6h4YMtKTk6X0Yr3+ig9V
         dUqSecHi11CRvwVPoIuF39ZbnMmHJfIZFvktyZ7n1nQYATfb0/mcTwXgGWQJrGgs4Hib
         OiTK641rpM8kKjErdRsvKc4B86ZES3AmX+iWd8OZ754ZHCRIfaV94y7CUrhtBWqT9r9m
         I1hR5dT5aYZQtCba/a/iYo9MstR8oaDxDONH6pjbLzvVLKrJLfqxSYltt0im3tJ+S+1l
         Xq0xAbKXBfF3bZmmSuq2BuvIahFAjw1dzj3NR3hPK8LGi720gvrX9ovDv5afj8qQUW1J
         ZwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763381404; x=1763986204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
        b=Hs0omvG3nikfvbcq4eRY6IaAI/Vd37TsLzBq54QjXHGZgfYE7tLJXI089Mp6t9W9pg
         4spVI9runNSxgl+x7WicJmPMXvvz3RaDj9ADDnepZ4imCyCFZzfXa+kUo4oYapVjVf5F
         AvVWYONuRANbGkqJ96ZhwfBRCYPE433VMBjsqBUMDzMXkp5jRR+N9JkHtlUvsOu8kYlI
         YP2Lh3sTcjMCMT9gTBALpL7t6pAin3xqBO9KwQhSRdj71W9q6oLEg+85yb2KZ8MzRA0P
         /OUqSBestTJaB2E7nkJ7fctoOA60e/Uq2Ya9c4LkANBRcPEsQOzoawfGVy3bzj0XtLgT
         07Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWWcTELXdWqQ+OAjBugsb8akSVrGfzW1T9dn2JoTt9tdWWLFyxMp9TvszmAJjRt5mhmYiWsHSYOVpTR/EaK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oOE5mxp30T7EK0uFtwx2rR5JjQeyXvQjtRsFrp3lOeTZQq7i
	yu+jtYbtzMm5sTgQnL7hYnGlUj1BHoDk+7DxUMDfzD24KTV0ek+FJ7raWjQJ+aDrV5aPt39u3sr
	O3dV5b0BY6y/mJvxR6UT3TBe+iW1teT2pVXroxJN/bMDglBJoDh0zLuFm4B0+tutBuY/R
X-Gm-Gg: ASbGncsrEBzwDmJnDzJfcZofX5LiMXyi5TUgYGAwfYDLUCY/ctxUwoloPE1AKQmwmjG
	kNXoaJgEZom4LvKlwELwuYjVSvPp4rYG2sHghEypluQ7GCQClojJZJbPspeemdB8S1rW2ab8lqN
	C/MOFKBMNG/oFa9VRmSLqFOHxLISvR+Xg+JRnRn+OuqzKEcYQD0sDsTnNfaikafgQ/Cs2CFm1/v
	MCBZuy+VkWSm21q8Agx3BxFHgKwxxsYGhLCrB7K6vaKPGEAFikJMVwfkhunu8bDyZZfPO2+XSEu
	j4SZ5I4fKm0uL80twx0UHxw9uTZhHijvM9XA0/ZvlZDd4DtyW8EWTKoYV7xFe++hesBTpzPXrrm
	fklrFTrlG8zCCiQtqm+PP+B05g3nTnbLsaE0p7Zm0ffjuisqlzkSuhQ5C
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee1db1b80cmr34880191cf.3.1763381403008;
        Mon, 17 Nov 2025 04:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+lM4RiA/uszIq5rz0kJglCgk2Y5+U6FHrUBKDfiMzHtGedL2M5TFrbseUbsKOh6X51HXKUg==
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee1db1b80cmr34879781cf.3.1763381402354;
        Mon, 17 Nov 2025 04:10:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm1059268066b.31.2025.11.17.04.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:10:01 -0800 (PST)
Message-ID: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b109d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=H1CbSrp5QckA0GuTRH0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ykhTH4BQKIO2OahMoEkAxBPo4HuwYFz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwMiBTYWx0ZWRfX3v3FQTgZMUH6
 Ji6Sp3b6lqnZi7V53URBgX1TqvbsvdG6Ct63nAIS7eOpmEuVtp1huM/cRESuFJR2yHzRvnmDxNZ
 pmsZetW/jO1zVHmrA7YY9OtGn1dDyf8m8nDpbhpjFe5vFqef53/5VO09DACbrZV9y1KKZ2N912x
 8uAyEamO4QqOMajULuwCLvtj8QLcprn9cl0p3L5I3cwRkIMfyIVUXMbT3OfjkapKMvWjuTaUJHP
 WXv7JT/wN/yuV9Bg603+fV/3Ra1L3su9s9oDmP82o2FfdmeeyhcwedhDz/Wd3HF7aOfGCgwC3MG
 NnqhXMgE+zbvgyOPxQmxhw/m8mct3P22I+kCkTZfmMQmzRTWbg5WW/hkLZfJfgLhBBZAeuyIcYB
 35KQLPPGi99gcQPAuXCvVntahEfnQw==
X-Proofpoint-ORIG-GUID: ykhTH4BQKIO2OahMoEkAxBPo4HuwYFz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170102

On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
>>> IGT reported test failures with Gamma correction block on SC7180.
>>> Disable GC subblock on SC7180 until we trage the issue.
>>>
>>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Most likely I will squash this into the GC patch
>>> ---
>>
>> Peeking at downstream, 7180 and 845 should have the exact same GC
>> (v1.8).. it seems like there's an attempt to program it through
>> REGDMA instead of regular reg access. Not sure if it's actually
>> necessary or just an optimization
> 
> I think it's mostly an optimization.
> 
>> What tests are exactly failing? I couldn't track it down on FDO GL
> 
> See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> triaged it yet, but I assume this might be related to platform
> resources (it has only 2 LM blocks and only 1 DSPP).
> Another possibility is that maybe we need higher CFG bus bandwidth
> when writing LUT registers.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393

igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
seem like a good return value for this error but anyway..), dmesg says

05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119

which comes from:

idx = lm_cfg->dspp - DSPP_0;
if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
	// misleading error message, it's not LM%d, but DSPP%d
	DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
	return false;
}

which comes from:

static const struct dpu_lm_cfg sc7180_lm[] = {
        {
                .name = "lm_0", .id = LM_0,
                .base = 0x44000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_1,
                .pingpong = PINGPONG_0,
                .dspp = DSPP_0,
        }, {
                .name = "lm_1", .id = LM_1,
                .base = 0x45000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_0,
                .pingpong = PINGPONG_1,
		// no dspp here, errors out
        },
};

would simply binding .dspp = DSPP_0 to the other one just work here?

Also, would that mean we can only have gamma control on a single active
LM at a time?

Konrad

