Return-Path: <linux-arm-msm+bounces-86984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A81CE9E26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E3083004209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689AC26D4CA;
	Tue, 30 Dec 2025 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwJA9dak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALHvJH3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D32459D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103924; cv=none; b=rtOH9Sry8/A2RSivQ953avRcVPXX8O+5hB534M5/WDpWFjFX0OCkzCMhb5pKXRndjMGitU+v3w8jnFs/E4l9cjHGtKDNiYqygwSfBLVLhEatlehsOLIMGtRpbaym5kAV4rrrb3rc+sHJb+U9LeSRWYM4gUF24LWDy++kzFHOJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103924; c=relaxed/simple;
	bh=ipuL6M8Uy33Xhv1jXr5EX+fil6uqtSvN0xbOhuIFcyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZ3OfM1PvxPH7s7hzskwLWGXr9GxkVu1PwJ9m5r0IbKSKRKQHSEbjxXGgwSnjQOuPvUjKzeBoylTNHiS2Jc62g7dMF+oaZq0AVnGT44G35QiLHQnTh1Jup2wWHVRlL5PnQvS/L9IZ06EqHJpwgQKa4Dr7+rDF0iBm3vi5hnSG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwJA9dak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALHvJH3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9pDCm2618396
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=; b=iwJA9dak67b781Lk
	4NaV0iAKDY+b2kL3XbgtYcdlKRT3B4v+pRkqBkQTUKsgZOt95/zcOqhoEDz/njHH
	N5CerzgtUhfXLSJVhCGpW1RbRiNIWrA8eaCtipOTM0cilxL3A7CHwyOj1GAcvK31
	Q2PHcpr+KAT2vMBV/rog3g7uBxc1JXQmFOdYviBkBNEMa812aGPB3eT0+4WF+GzA
	BVYzARc82+zrOCTkD72ta+gdviEB5xGywJxwWMDwhcKr1qRWk0cJA1j2BNYCVExD
	8Y3Bgk/4Fq24XKd+E/2k4dpzDTq7lIUEgvZVJ18x6jmHtt/lgjIOluqADMrA+cQI
	qlaeXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gt54y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:12:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so33134451cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767103921; x=1767708721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
        b=ALHvJH3V+tHfiRoZKoWMPylMwK32uwquhRSi8hk9iso+n2aeZz4Jeenw+bGClf1l4Q
         tkpzcDM7ZJbE4c26dDgJvqGBGnsAe8m8uPl0RkncslQudCowgNobIw/zSu95tGHdSKiy
         cuYeIK4r6Mq/y1yItYo/zVQezXtXsJYS55JuV7O2GouyEaInd6+NvEWWAzcYFvlW5GJ+
         KHNrunCsI9HLaBV+bX0eoPNBPgWOHkInDaRD3LSVqB39wzuArPGpgMgkoggLH0GyB60k
         T8ugmZ7BmlnjXZE9HKmM4+RxI+2Tj55kDi7PCdwRHWO1uZxcDmHVpUoJ5xPs9qzmAGwj
         HpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767103921; x=1767708721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
        b=gWPGVNBqf10UFOJuM5bnDa9EUyXIBrwcNKHskI1IuYmt2sRnT6AE+2/lPP7BIG8OeB
         YPbWm4QSE3yyWtBzkz8vtNJeinKB9TMvitpSdnStTKjsSTctVTDt2k3OtQV/nIFwY0EO
         K8HgI8FXAKNh20iAVkeWEqd+4J9DFN+loUdzV0A4P13PmlvYk3fChfuylYf+V0Vo/Mz7
         EYToY4rSOfNsFT+ZD9UoQ5y0tB92bo2FKHOWBopVmiLVRuIHHYbmJSUd6aO9vtpfWVt5
         t9qKrYjt+WDdSLfGmJvZxvM+YRzpDGSGn/UKV8QZlbQkoft8sLCO6ZmisO/cJg943//T
         f08A==
X-Forwarded-Encrypted: i=1; AJvYcCVaxOznJX4j3Y/LSWHXVLkSAkBSm1OqfxSVR7jz7IDiC3KoUfzUV7FOBKzY0wzRqyYWQYEVXtOKFPzoICH6@vger.kernel.org
X-Gm-Message-State: AOJu0Yycqa+VCx+SYt53ZhIjXTD4gAQKb26cmu7Ikt81XVASiccarO6j
	ppdO2fShFJspzFvTmG6pt9iOYTtJ7Wer4kgfQ6JYqGy+v+TOQ8XSVjdY9xB53B1rFvu7y78piTh
	TssF4Q7psj4ycllGGXtGn3grfQwp/6v/GdxYadlgnA3yyTmzgBFiBDkwn+TGrcISSQ/LV
X-Gm-Gg: AY/fxX4QLEXp43GbzKec+F48bjhon9sVbdABgxWMLRxHR8TYa+/PmuHncbWIu9iNHs0
	f/T44mwYgI2tTh5t7q1TJkSFMxrF3FRl0EDv2UUVU4MtkKApXxPpw/vaQ6KcKMZt8TTqFXASrOx
	L6SQhShPix63c4SLKwVbsrSyM04HL8B3uQgQEjSKS8vgjMMrQcfS1cK11TL2Tgc/IUDLwJqNglf
	63mahLXeBCQmMO1INdm12RQOe3OCHNvOq9AzBKhpIJD0U79Ra1LuSNiqsn5ciNaDmBWYgkomcKA
	ApqXl4hPoXGRM7IDPzDjxB9MYBctI3nFnNvqpCQfR6AJoXzbbKo86aMIA1gHXjoTji1JSk7jZBW
	6nzCHwQLfT3Q4QmKFE4MvsRJFbUXfRc1wWXFQWa0xClxWp9r5oYdV/4xqnYKYeNuIWQ==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4f4abda5f11mr392930491cf.7.1767103920936;
        Tue, 30 Dec 2025 06:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjQZFxa4VrpeId28bY9g+GLwW9YjHI5WOe3r+GpOiw5AGB2EQDoUopk5HC/dXCkr4ncHO0Ew==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4f4abda5f11mr392929851cf.7.1767103920380;
        Tue, 30 Dec 2025 06:12:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:11:59 -0800 (PST)
Message-ID: <b486af10-bc66-441b-ac3f-ec150caf49ca@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:11:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663
 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3Bak-m8NUslsgUfPYDeqI1SU7Zatz7yV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX7cnIzY9oJSvi
 KoW7oJsAaN+R0UruY3dcNutdAnbhje/fBspEAlbAO2HA5dZNvROOjx9F++wio/0n/8RQIZryTWK
 VHfZkkOJ6cLV+HbuE4aVGHN6JCw1HwZUQgyGNGKFYdHRmJqplxjDuLFidaAfcaxWbRprvLAeRRI
 RH68cBUkiRkk3R4U/BObIuyO/I6XpwtKiZF9arQFRJV/DYiHx5eD2HURrNTS2nyBeEbkfsmIoQm
 JzQ2XBTVil1FmwKVlv4bi6Aqpcq9tFirP8svbT4azIvPg3J0KS3v/pl/pqQv7sq3eC3fZjKjKPe
 YF0+jotBW+veyHj+WyfbneWoRTvSLC4/zzPdHRAbxv7V9XcO+R2iQWPanwse/6mEysDYjTod8v0
 /AMLRCw4N3PtVJN5spuAM1wJUlRXN2kcDHte05spT+gjNF6mZD1d4gBZDhX7csd3qkWElQNEVDz
 8bpj6vdfmmgt2Ic2a1Q==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6953ddb2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3cl7Maa516Pf-TGxC9oA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3Bak-m8NUslsgUfPYDeqI1SU7Zatz7yV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

