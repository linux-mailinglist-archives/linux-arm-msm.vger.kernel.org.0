Return-Path: <linux-arm-msm+bounces-83982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3CC97A86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C96C343517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B22931196F;
	Mon,  1 Dec 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJSg5RpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yhp1VRnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE12DAFC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596575; cv=none; b=LjUr/a+pFoPuf6qnhO208E53UP4bCtNlHRz5StOKGyDCVlkK5B6DAdBbea2jc+/wmdmGBZnZbXYknbS2H9tJ66oiKtvOdK530dIVRlkXV08NUVLkc1pBfhOyo3ARtu91UG6KypecMhB1N9AKWeKBJLWHFM5UKXCuoe8+A1e2MeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596575; c=relaxed/simple;
	bh=YHUabI6oaBSTjvgVlO1Hvn/bjS7A5uSs8UIw8izSD8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFeUyc7083Nb0TNcL5tbOZSxA60ixZjzUofKbq4mbWtNLt2ohw/L3EKduuH8N0AjZHX7Dfme82jYA95M12ibX95DLBAHHG1iI/RBiy0Y8nEmDzQw2bYIw2hQSFFYfdMnGEvbNL1ipmXJ/ncbMAGojQYKxYAhQOxLrW4LoE/WJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJSg5RpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yhp1VRnv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18OCH22563012
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=; b=mJSg5RpBUIE6sVZR
	0qImgYNxxDLUhL8hHZEgA0DLyoxdO/1VtZb3AjFdb32+oIwf817ivY8lns+R8tDX
	8Koi0RjU3ZCEBxQ1hJIrZzi6QG5Nh/Rn/nInGuWRAwMh54nXWph46CyPPukrwh1q
	i4sUx1kBmQqJlVUqNVWHg8dwkC8wQ6swlVORPm7R/zsCW9ztRD1hynS+Ns8G8Fwy
	J1tKZr+OoWHkGfhqyHdrjv5ePZQpDFCQAZHqpEHiuxyI4Q3yjQ5sf4Ji4fdtVeBj
	S7gpG40eSrcsFobalmtiZtdUo7nB+cRmDWmFN1tDqEMxrkk78hNlrbGMRCjFBqfp
	2aSB1w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt4s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:42:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dfadf913a8so450149137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764596573; x=1765201373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=;
        b=Yhp1VRnvFzTsNNIAXN6RSiiJI27CP81NhebiKZi2I/LDAgzPT4QA1fjYNGliocLsxi
         0QJWl5bjVDPOhZuJd23eQkStBwVxDosdGVl2CUrMAm/rKVLJfpSfZpJ6VRL6TnQRxZSx
         xgjHgkUznZnB5FJj2ZhmdFde0qeh8RyrepTYEF+VjpEHI2ru6ZYjHt4dOrgZ15fKrPFN
         1FynCB2VnYqLWDuwYRti2G/Gd7FntRiUZ/Eap1tAaVIOsXQvWnZIlPS0IJsZJM5gbvpV
         H/UqjaJtErUY8dSZvIzpw9Njflt4haIZ4Y0FdgBXYEb+u5eFh0awwHyel1XW+fNW5AdH
         RhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596573; x=1765201373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=;
        b=rtweUjN0nwZ2FxP3uh7PnnTPPNcB5pq8ZvDSHQCbPSdGnd0KvV4+sdd7OB6HOVv+8n
         JaTVoFz0XHGr9MOZMn9mTcrt26vbB+JoipKwuA1T+FqvbbpVlcCZ7rXoMOR3b/3SIXpX
         PYSvsVa+8mdqSwCdKPsncieEXGS4r+eJOBbqGdJPTwQMTCU2JETTDBQHW2jkMhORZfeM
         tRJmmwIqlZv1nfxX0/fd40Fgmc5SGa9lcgeBo+gzgvmh8iR7GEBZy+Bquw2sfRZZ03te
         vsYVK2lrCO9KNHW+YyVs1/Ucg6QRVJAbPxRNfxydDSxVIzPcN8i2QT1fYuMoCO6xGh0o
         7kug==
X-Gm-Message-State: AOJu0YxY90gNHVZmiTK279UQqp8TfmBa4ggziLHAoP1Yan6NgQYe9v/f
	kbpwnoofUsgja+MfSSdXFjbkpRWsFhDhE3AAdLaISACIr/qCKZ7osLVq7iDHnfTxjvDLnZbC3H3
	v9qOB8Qgt2dfDLPEAYvp/0Cm1dBBOOqnuGc5X6/H89wMgelh0MKM30mfGZsmvdxn29riw
X-Gm-Gg: ASbGnctVFgxW9xSPuC8IPn/6YjHWzT4hCUHm4KFoV8Mt5qYnpJnLJ5x66PV57QlHgjB
	/zv0eSS/FScNih896re5uc6DTcj1y3vrBR17jR1t38AyHgenxPj9/LYK5of+dDamCQJmjSgmvQJ
	fvk2OuutD1cUxyBfAee75w5w8uVsBAJjoVfYXQFuERbBo/LMJN1y/5WNN0sRmPE6cDhe2vZw9Wa
	NlKQmMc3Sq59uIWQjPClgToVUGOcb+ps9jP/XBGpla6GQOC1nvhywSWm9eLuITojkPMwlsSJHO0
	kW7FISgHVAUiiKAoCKmaEdx/ch7uZ6QM2bJ+8w5ohs19p/2MFHKZqzr7sWFIBdNc5vU114TT+rw
	HiIL34R1x7m0ZiWMolfa2DGUlXuR1CR7m08775ALBpx/MQw9xk0QjbJOMpPg8n7e7lQ8=
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr6519680e0c.0.1764596572705;
        Mon, 01 Dec 2025 05:42:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFZokWE+Czmsot/9JmOCq7jC8Gts2P4ILmE3eeU7u1uTuz2O2A4guvb61pBVl0X8a4b11mEQ==
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr6519658e0c.0.1764596572293;
        Mon, 01 Dec 2025 05:42:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062261sm13956466a12.33.2025.12.01.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:42:51 -0800 (PST)
Message-ID: <1d9b953b-5af0-4a81-9182-f1cd47e772f1@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:42:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
 <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
 <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ms27ZhXH0kYCfnD4zaxm8Dk1m9H4TJ8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfXz+Xo6jlLeilF
 9+G4hSn4lDcMDEC2JhTYO8lWq6xFIKygvLtR0uv68ULnAwvNkyBrijDmmE83CFtZ8NPftsbZtKP
 s8ll8lpLPhrfLNiIeYm1b263R8DNOIvBv3pacrZXwK88IgiBDrROw9Jkh9FI0jyvOCWK40o9kEk
 1+1B+17Ob0pnSiahOMlaEWYIbyoaLMROn/ZGG+IkZECbWw4mdgWfW7q198X20L1POCKt3ZrK8+H
 kzX3Tw0lWleMPO7KTgNL8V6htWtL4tyOszltOe9bUFuMDNoRXBRnMULyUMfbmSogEqZ2MSAfWFu
 hoEqEZ4mVETg9+Y/vVuJMJWF2stP0AQU+5AI1NLU63Pl+vyPRxqV0/+jP9d70T/xMzeZ1QWI7mf
 K00PJKwA8ZVgWzX9kWtfiSFelHPorQ==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d9b5d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6Gc6VnWkpHiBV2CdH10A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Ms27ZhXH0kYCfnD4zaxm8Dk1m9H4TJ8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010111

On 11/28/25 3:29 PM, Jie Luo wrote:
> 
> 
> On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>>> becomes twice the actual output.
>>>
>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>
>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>> IPQ5424, IPQ5018) that use ref_div = 1.
>>
>> I'm not sure how to interpret this. Is the value fixed on these platforms
>> you mentioned, and always shows up as 0?
>>
>> Konrad
> 
> On these platforms the hardware ref_div register comes up with a value
> of 1 by default. It is, however, still a programmable field and not
> strictly fixed to 1.
> 
> The ref_div == 0 check in this patch is only meant as a safety net to
> avoid a divide‑by‑zero in the rate calculation.

I think some sort of a warning/bugsplat would be good to have here,
however I see that clk-rcg2.c : clk_gfx3d_determine_rate() apparently
also silently fixes up a div0..

Konrad

