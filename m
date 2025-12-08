Return-Path: <linux-arm-msm+bounces-84687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC891CAD94F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 16:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB737300E461
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169B02D3A94;
	Mon,  8 Dec 2025 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3LNcEN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzPm88ny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E7DDAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207613; cv=none; b=YLpp6ACeNFcu4yeoj9Slgfp0ZN/YEyI0HtGr8Y9LfTjBtz5Pmq1kyzhd5HYqfKpeQaAjweF5pPSLrzNlmBYvWfIn6gygZsX47eJso/zbotFnGNg2p+J6YiINILErrmURErFUKnR922v2sCD+Su7c0Z9+iMRxC0Pmn3V28KPxO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207613; c=relaxed/simple;
	bh=xZfk50ma7AdlvowuTPRFzzolE5S1Tno0tXqGTPodBIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EC6SWM8lOObKgnkv1+EQqk082kwOHh0JLNGO3NO6MmInf2TLr8/Cf+Lhl5mnwhagUVPEyemin2Sc7hbZVoklf/B0+a6tFddKibFGMA+AkYbvoZOHyLMvI+acIxvIAlvECGXreWnxE9CXFZN1T5dc7xpVDtI6qdfmfagXr2to5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3LNcEN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzPm88ny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88Pakt2928399
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 15:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqCvg/3l6zhBX6ki+fHy1y/STCSaxUZcIuYXtpFK5+4=; b=P3LNcEN+3gGuIxeY
	3qFjhH9Ql26GLrby12Qa7rEuRR5AE3CP7WqcPJEkQ4WQiu3lbEPREhYlxnd+zO95
	aPIlR6k1Ajofe7blGY8SjhpUIq0i6FYmUa7R8NmzsRxxKbmMrRziWiYVsUUpOiyE
	8+5b+8Z295nroaDNGeFGEg3eGxP/ydO4cuZOdBwfneyzQmtvaTvuxorkeftgeoNk
	9cPcVIVWWB45dEOyOB7S+1GyKRfH1Y5xtM44kLbiilGk3Z/OjjwHeLT8id7SNi3o
	2+A5Mvgq2D2ZjhbIQP2mUYWqww7eWYTzRoaDqlg8gm9HDs8ysB6F2cdHT7FHPSMG
	eDAioA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqtg3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 15:26:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so13193331cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765207610; x=1765812410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqCvg/3l6zhBX6ki+fHy1y/STCSaxUZcIuYXtpFK5+4=;
        b=SzPm88nyyziHSI43uAZJ96pRzx6uOIFMDb5WrQBWp5MxKR4R0IQJT3Hc/ezr3T82Yv
         Q/2T3gr1wetkjDQhINUg0RSK4D8Q8gL7XM8cUWFb1G4IzK0QD8Z63U//pSIM+0TnhMyI
         I2XFmUO4ey7tg2Ke5DBu7zrIo+jAhDtpjJu83hHO6/WZIO7oyMbc0+dQLLtuibcWSyxc
         bWGObrCvhNjHg1kfyR59w2atyH6sXPDg/O6UtbD7Dix372lwuLZ1f4PRAgw03xCcDGLr
         +EPjP/inMQAGdmuM7jv2WSW+ldHjPeoQNM9WnB+a+knB76NmIa6h4BsCMx3YKEIogrOW
         E4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207610; x=1765812410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqCvg/3l6zhBX6ki+fHy1y/STCSaxUZcIuYXtpFK5+4=;
        b=A/6rxbcIJ40IgppKALbx6e5z0hZuxkjhqAat/osSUJFD4DkRZGOrMsq33vB/XDKZhm
         FrepOfqt6aJjcHh+NubjUls3zK8ndLKYPqr/6sEFxKsT0iX4q1SdK9ltXmu5kE8nbwIe
         YagyCpKWoYQhVg3E7DdSi/t9xCGSeoREE5kubcy6r1GJlP3kWpt6Ne/8Zi8OgjSAGo1S
         dy291b6OP3uJdHyvkPmB22AmgFPJHPgIurE8HHnWj/dKgqNCAHAsyu8XZAytks7j4/1G
         vBtXJ1JBZ+haiPkyFog38ulrAMHhThMholjTT7wFSxeEr6QdTAB57vHmKDtbAsCGcSog
         JfBg==
X-Forwarded-Encrypted: i=1; AJvYcCV1jLySB6iYPv/7k5dntNiSgvqI9lsPKBYOEuePBLwqT7oEDhc3NW7n5HaYyQTbxOeCnoiwkSi2/2LewANU@vger.kernel.org
X-Gm-Message-State: AOJu0YwLL0/SLUzHnD/n0h5+IHY3LPO3q0Vkh0IPxxHBXmQ/jXhxkg6w
	2WSMyjfzBkI6D+Ej7YC0DIoa+ToCOHGjgDOJnKfqMXKKqQ7DIANCMWBbHge6O6CA/3AEpxQc6lv
	gC2FadrV8UqA8cQXWt/fKJhtClkPu/OFC7+IBRoZ1zlscrfVgspIUXaDVqAcJ9ctVbKht
X-Gm-Gg: ASbGncsN4ty3W75MuxHIQzo6PyyuEtuqHVkUvKEG+VltKQc8pmHmL1wiSESTpob/6h0
	04nDGuLKxqbCSxVI3kOJXQ76N/SEU3VDOrYNtdYE1P9koB/vvCMH23P7xrpW/Y73vkiwHk9/OSw
	aHO0tiM+w/+upFlXTYQYzEeEMkuhmORyU2lGm6Olywdvri2TxDNf9kRSjVoJcpS5Fb95wETUjfn
	pP5QPA+mZV2TPaQ1Jd8e5mJrU60wTXI6U/jYtkfiM6ERj9b7EisH65yXANWRGJH6bmDPIvRjHVt
	AODBc3H77hz9+1DR9LqvD6EXFUuAL/TfLCus7Er/XYkO9GlIgVCtW+TIWI/psP9CXDy1isIuvv8
	bz5ZZW76vCYAR56neOV1Fidlb8OdCTBclsDj3Gf/xu83aIhn0Pb5zPjwZI8mnA1z7CQ==
X-Received: by 2002:a05:622a:178d:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f03fd84e4cmr94525131cf.3.1765207609730;
        Mon, 08 Dec 2025 07:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb/c+Q0gPbMa2WqDYhsjOxW2q0xMKDJQZIW7de9BAPcP7KHrnHksfHsrnu8aV9K+CNaiexOQ==
X-Received: by 2002:a05:622a:178d:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f03fd84e4cmr94524911cf.3.1765207609350;
        Mon, 08 Dec 2025 07:26:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b35991d4sm12541592a12.16.2025.12.08.07.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 07:26:47 -0800 (PST)
Message-ID: <8510a763-adfa-4f9c-9502-ca4787dd25a1@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Update model property
To: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jens Reidel <adrian@mainlining.org>, Bhushan Shah <bshah@kde.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208-msm8974-hammerhead-model-v1-1-88975f30cbaa@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208-msm8974-hammerhead-model-v1-1-88975f30cbaa@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzMSBTYWx0ZWRfX7AX6Xq1B5i2/
 fWIsOo5aiGIUNf0aSYSvjjmGP1q/RW8kxomeaaJi8koRUBNtzUtFjpDU+QdrH48RhJ/6EhIVHX1
 erH+2PoNDuKYx7XeH0JvV8daiPcFQLYdBK/OtT+NatQPWlyFIswK8mCcm3nMgP3F2dI1Ait8pd4
 AeNymll4/eigczUWf3Wm40nqtJcE+Ex6U7TvXQgZwQzYwEC+AINE3yZ71Eg8EGVjM4yEGZ2G6gR
 5TU/zhNg9FVE/V7hqpRvF4xREGT33EqeQbjDYXqFilyV6IqVm3MIcBTu1v3wcTUMweMmaRBKpeI
 qSqwEbI5aHdw+is3/k0nBVyasgzFEghNgSV1BbzGdGN2fDtp5s0/UyK556slFgoecw0EwrEz7Ee
 RwTWi8o/1bOT72U3jfZ34R2hZBPh9Q==
X-Proofpoint-GUID: X9g9_a1X1phjjN7vJO9D1iEumFgm0Kc7
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6936ee3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=fIcsWfTkcLGz-UVQgyoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: X9g9_a1X1phjjN7vJO9D1iEumFgm0Kc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080131

On 12/8/25 1:41 PM, Luca Weiss wrote:
> Many years have passed (more than 9 actually) since the introduction of
> the Nexus 5 dts to Linux and it's high time to update the model property
> to be a proper model name and thereby bringing it to the standards of
> the 2020s.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> The phone was manufactured by LG and sold by Google. Some sources call
> it LG Nexus 5, some Google Nexus 5. I think it was mostly marketed as
> just Nexus 5, but consensus in upstream dts seems to be to use the
> manufacturer, see Nexus 5X, Nexus 6P, Nexus 4.
> 
> Arguments could also easily be made to change the compatible to
> "lg,hammerhead" and rename the dts, since lge (LG Electronics) is not
> even documented in vendor-prefixes and doesn't really appear anywhere
> else in the kernel and lg, (for LG Corporation, the parent of LG
> Electronics from what I can tell) is used. But that's more invasive so
> I'm leaving this out in favor of this simple patch.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

