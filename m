Return-Path: <linux-arm-msm+bounces-59934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FEAC97E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 00:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A119F3B6CD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 22:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EC728BAAC;
	Fri, 30 May 2025 22:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHbDGDom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED028AAFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748645839; cv=none; b=qbGqXSLQZTmUj8fSrhXtBZ9cFH6eZz/Afwv4drmhL8mhu/vGUNFuyVes1VREJGTahdFr0lyzZOITVDv3k7e0rT9IHM6om7+tUyKvV3/TVL87ocOS6ZsBWu/9sZm71T8JQ1U4HSujcTaatfMnba9Xy749j89TGvqeL36FO3jcL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748645839; c=relaxed/simple;
	bh=0rYnwnIKvNm0c3HgIujOwnxEWY1I8+r9DMa/HukZvuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qys9mASU3IK/WOb5B5q2vv2GUqp/p6iRfnhEIG8dLy0BwR8+SAisbsW+JjAWPMzmC7L/tEd0WdtVsYvdgz5WUo1vNzv5pV16z0dqpYcU3rIDrWpTz2CsY+qK/6NI2rw4LGi33WZgG+v9npOAYXYG7SDYyuOMXTZowNEKPBqJKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHbDGDom; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ULC9U6006927
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 22:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=; b=JHbDGDomMYOz+9lc
	bGe5DVKWwuvuvrOOC8avb3SGZRkQUWmFdfNrwEFZdOh8vhKClpdMcpxjynr3+mf1
	VSfYNtrRzvWPrmbSwYhy3muGYTHuZQx2Sq29BkD9gylJ8lMADAUjQjsCMpzPdq5l
	492bVILA5MYZGS8pEVFjvdmmNWOTzKvNdIMcK4TqiowBNP5cWq3hJukh8Z1jpUNJ
	FULiI+Ww8tLKWlM38i6hCBJSwJDNA8u2WNTJgpiVTDAtWnoZzz8aTUWJdP57IozJ
	rCCo3Iddw9ZWOi2RqC/5P7aUKvGPGUnpJPIbLd2l35NZyqEPWReZs81PD8d8+joP
	d4hnaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqju78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 22:57:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-49a4f4021ccso3694601cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 15:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748645835; x=1749250635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=;
        b=tPOLf14qrujJ56PtfwvM9IRfQrVJNDFdoLVOIM8FPPDaWCPxEs7ntRthqxC1KkF6TA
         Szgw1ytkDZoKNPGj/6SZ6tdcuW8N9wG/Xt0pGmm6hh34tuDx4+3rX/lbRx1dI+7YqKxJ
         TmJFhDbgv5JqxdOVf2Qb3Yo2LL9VNGdsxh/M1crGmEnfANMWMOSq5kvp0V8DAMzl+/4D
         D/yX6vNiQKPwyNim1SiWNpgffIbXunlPm50jJhq57TuHlVd3WoOxgVumjdIl81ymMFg7
         nNHLWzGBbchVKrJTvuZmmiJtd0Mp38Pn230OIDvZkS6sANPt9BBG35ArOxUyPuZ6LwBE
         P+xA==
X-Forwarded-Encrypted: i=1; AJvYcCWeOetjnVzs1rhWzE/RbFagu2dGqWqXGpuBKqogzWXoAwhedbRercOLiytYDh9lrjdG6xzWdrqImhk7uvai@vger.kernel.org
X-Gm-Message-State: AOJu0YyQoHlbSYb2UgZlCpkzUK5OR6ZpIQYBMMjUGAXHzceeWetRB1Qs
	MrOBTy/zAgkrLypR+85hX7j0vM/MOCe7CV2sDsD2cX0gK4z7VlJb46hKh0mnMrvBeszr3k/rucL
	14uxdVB/EM7lvTWDi5s/VDMb1eagGKgX9qIAgujst2h48h4Qd/cNXzl0ukBXHEfeAPu6y
X-Gm-Gg: ASbGncsljtuu5gsGvPfyUlkZ8L0fjEXo8rvfoJJXE65BnRrZvINi0zblInBOEZd5fOc
	7SVj9+cUYTB7lhfoDgSOIp7RpNhrwfnBs3rYP+PDMTcqHBnUjChIvHK9F8zHGR6Wz3HTWIHoGQK
	4+0TC7rANeoQKOAFpP+otFDa56QcWNxO/VtxL7NuS2vwFRM9oI0VW2s3F256QRSu7j/ZpFxhLDw
	J3LZEiTZf/CBUjwgFCrO8jCKK7M2SYTawMBr3C0JQ6kGP5/4zju/mDcAsxPcJe5d3390toOtadf
	FhrFbZHATB8bUS+jFrCv7To4EzvtoPJSv7CfkA3jEGQkBYTZFCOK23Ol4a251DYo3A==
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759801cf.12.1748645835420;
        Fri, 30 May 2025 15:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyHH/AeRi9HZArP4FkQ3X90OwCb53n/Q6G45zWYMJCs/FB6Sg2hE3vZ4Id8Zqhiwv9MGAlMg==
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759651cf.12.1748645834917;
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e74csm403329766b.51.2025.05.30.15.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Message-ID: <a297d9b3-a82c-45c3-aa14-a20125af0a3f@oss.qualcomm.com>
Date: Sat, 31 May 2025 00:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fDkxugZB5uf2t8S4IxJynmJ_2Vr_9alM
X-Proofpoint-ORIG-GUID: fDkxugZB5uf2t8S4IxJynmJ_2Vr_9alM
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683a37cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=k8BryfKUEck1Tcg5KdkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNSBTYWx0ZWRfXxRqKeVqtRJ0m
 hrdjzOMfU5LJIPeUd2O2s33ASuHoUs8/iso2h4cB0Ohp9BWQNgLTp+1MS4uHt1l+CUFWJj9VTyL
 SnOd5iS9FOHPHZ7U/ur5iMBG6IvN3r63Af7zVGc7xeewkxBGcWoQM68T0kAt9Ppi96Qi3D6ucHe
 8WXBqR4SzDYexSby+AhNykqt15/ceK5DxLGKrIMTxeM/Xwc1xcka40GUZq/OhPFma15mMtQ3SRq
 +FVFjD7DXjHoKaYHusPH4yN9qfzpdhf91m0RfrZXATYsB5UigSIXn8hZJ5CYDESgjEkedSABjWr
 4DDi4hSqOwBxym62lymarM7JQ5aC63Pf1W1uBTfaglonK8A6+ePU3sDoYAvPgta/1Q2lzW+MQeL
 5h6Ovvk9URX/ozkScVZECF2CgAVaVAQ3O3xURE7WrW79QMi8XNSUYRg6PepNNDazYkYeS6Pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300205

On 5/30/25 3:20 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

