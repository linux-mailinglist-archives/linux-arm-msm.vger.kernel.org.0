Return-Path: <linux-arm-msm+bounces-88091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4645D03B2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A69A3015151
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3771D44D69A;
	Thu,  8 Jan 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkz7REIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZKhYDZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08444CAFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879346; cv=none; b=N90XPWHSXcpYG5FwJ7ok1ec4dQiMLpeu+iNCnbj9wQCDa1wuo65X0geosa8SuhAx7wWP+/Acg5N47NdN6DMskDw20+REb0iIuPZJM6CQz5Mk0nTAyoN6LnIrTdLTFly32RAGbkWMii9gAbcyv/3qrHk6k8hVFvlnOuPEOGN/p+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879346; c=relaxed/simple;
	bh=wvlJyJnXvZFyPAXKjXLUT7zhJo0tIS1PI+5bbtt20aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH3Au/A8wmbta/esy3988GJLcxvZrWIPMpZBW1rbFBA/O1adPuEjMYN0Pc1o4qIkNSF+COF/iNAwGP7gYjxmLZocmjyX/dgGDK5YF2WhiMDbcCqvYaNsOr5/QcEn0xw75PqmXz+ec4DCPkDyk43/8xouPskNrtY8pdC+fJJT12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkz7REIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZKhYDZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087Q1Z31258372
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 13:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+klpuo3lIbU8EnRsBkY+rwYCIYs84JFTC7WUPXtW/U=; b=lkz7REIa2E6qyEyM
	acx3bJC9zn93hI6qfRU6tkcLW9zQSRl6wAOE4T9XveTHb3MzXZJwjeM2LvGt7olL
	N5pi8Nu4deUhDzoo/ys0xiqd9NR32nWjYAj5i3muDAxxbeQDf9XK45P4GR4/JU6b
	blgTyJ9IQA3iGKFniTBnSgT0Vp/L39sy7RmhBJcIf9EN5ZmfTYT8ba9IBIX6MTZG
	/RjY2z9UD0RHTu84Ro0knW1zEnizbCvR1X28sHPkeSzvFstwbMfRzSVFsC7AV/lp
	X5ou1PHeRBBVWwtv4L6ZDGrwcCsmG8kg+MKT0p3TjXH9W2tGHFnkoOeWLMFBvU0d
	tdkakA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86gs2t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:35:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea2b51cfso72982485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879343; x=1768484143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+klpuo3lIbU8EnRsBkY+rwYCIYs84JFTC7WUPXtW/U=;
        b=cZKhYDZRrdtWEzls4EeCrpAFP/O8ySR8fry8wJuHDsboDp3QtG3SurTRcko8DUOBrC
         ONWb/SU33kI9DT4HUH2epYR+mU0GOTjgjMhtqdwKT2bg0I1xvw5ME8zngrKoJpKdZtqT
         /tj4w6a3Jos+W278E20K6dsJSIPf6jmtU1SLLkYevD58in4wnULe56KTIel4YJEwGcPA
         n2TorW4JDCZlqLDwt5eIEuaP2YmkgRXbjawtctjfnIADVD1f6aHcY3ILuFiES0mPRBUu
         j6fpZcy6He0A5K9ECYUSjNAlxun6v8UP/CH4zm7le4flTA2CJB53VYwqiXef77PsqJdQ
         X/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879343; x=1768484143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+klpuo3lIbU8EnRsBkY+rwYCIYs84JFTC7WUPXtW/U=;
        b=iWVGOZUQA8IXkz1WI7fBiF3w+QM0FivTyCFh7uPLIZANOxL8MIsBkIbNxSX2oxIf2K
         t/gKlzo/+NuU2p8KXyLfl4eho70UohD/vldiDNkfPuFe3qNmksVG2U/r7v5g64u9J6ra
         EMWeKbDAWeSq4RpI8BYK6+rh09eZodT8j1Ro4zLqzfNHZ0t6kV1uO+knGwheZbGpw/1c
         HAsQnaDvLVFcXTNe6IcrzHIj1lVmC1WicyFEzyexga96Kupa7aEaL07KBK+CJknY2+dP
         jUrRnoKnfO0QrsTQHqzZapu68OIb8QEHT7tG5hJ2IPlncPO+bc7zLXdR8XtYmHuONM/I
         v6Yg==
X-Gm-Message-State: AOJu0YziurRG2XU8cMUeYQxUx3M0vUMVJ9FVWlJ6sP/Fwb4go854peF1
	W455FQQS2RlXY3SxUvsMvG9SQbOgYCrReW0mKYPcTyhiXaI3gXv4tl4jTBU8kbW11ibgMWPSY+3
	eE8YUteKGJaVaePcQrKjHRXRMb1QvqKpKxTkQ4TjQAIYeHjTLcjefQ2O6LQVjUVs5sG11
X-Gm-Gg: AY/fxX6wIaEi0+pGaieXF06lDtv8o/KMPWh1N9tW9Qh763oxSLdoXz9/pjS1EXfx7Gn
	RSAB1bQWB4Oxn+fvBq47lQLys2b08zB7KupTAG0CeEETKivClpHc1AIynKdeur1mVxK9HzbIOpm
	j6QT/esggaVJ7NZPnJuBgZpGqGSaeURIgIchg8HTDhwMVY2GTi1cEo36/fE7PodcYVelTo7bqD0
	6vSPj7y8sGdl/wz7vTMar7JaIILaX0hDd2ipfZ3UV9kceY0ZuTbnJ4LXU2RBanJy2t9bOyahjH1
	qVIolViYlyPlE8qvKy/zzPthRqCdjOM3nU3KtkvLTeIzCbfRGrCz88wf3EFGWY1eZNIMWf4CTNV
	6FOiFHt10BvG0BIkUNa3sMGNb7+1FqxArzGdvEtMlpAw8xkhzKZjlRTTHZScvsYejeUc=
X-Received: by 2002:a05:620a:1a9f:b0:8b2:e5c6:b4a2 with SMTP id af79cd13be357-8c389363987mr600014985a.1.1767879342822;
        Thu, 08 Jan 2026 05:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO3YqSjyxNkFHYFNHl/4gazhGcB6YROqdFiN68T2jF88g0IgtuvHh+1L5/bf2BfuaiA8vnjA==
X-Received: by 2002:a05:620a:1a9f:b0:8b2:e5c6:b4a2 with SMTP id af79cd13be357-8c389363987mr600010485a.1.1767879342302;
        Thu, 08 Jan 2026 05:35:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm807132366b.43.2026.01.08.05.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:35:41 -0800 (PST)
Message-ID: <47c3f994-3843-4d16-9e40-f46e6138e81c@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:35:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: talos: Add PMU support
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
 <20260108092542.1371-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108092542.1371-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695fb2af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1_eGsFTZUK8iyOQsZJYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: S8v7e_brxyAYRYlf_gyOwdGDN_nMMOdU
X-Proofpoint-GUID: S8v7e_brxyAYRYlf_gyOwdGDN_nMMOdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfXzdWNAGsPcI2e
 BR049kdV3FhzCHjjGGgWQq20AGitLzSPO9BbgZ0B/Ghg9kqRT8HW6jtoadc7mGO0/jFoMEmH1DI
 eHdMTjEmpE4he3ufmV2n9R8sWuUq5ub0dG7bb0WqeYArAUqZgOQm9CAK5NCJT9s5yv7d2uN2wWS
 UVvCyfwqXc46tLmSQA2TUBpoC86k53hN7Tvw7v0K9nPr4H49Im9Yo86lkEGrLYE2FHafCpW1K5v
 kWTytVZ/IItJ2UlWhxi6pQ/JQYvbrsVdeBzvbUZ0sdWmiuwAt/9hCXHPQhQJ0cIIoVHQA8jS0GY
 c+q4GuJIeM8WL2BzaAX1uayGlSUK+GNCvxkmqYXAt2gdjwaoX0bMeu2DgceW/eMlNE0oZfP3+jd
 LT6d1CDJ5MmY01RAI3JuRfh2GABDMOENwFN28G9GFzjhsJbYicmlZ+XFio1Hdz47Hdpd51I/s7V
 7+VpY4sjwEjjgZGk53w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080096

On 1/8/26 10:25 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add the PMU node for talos platforms.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


