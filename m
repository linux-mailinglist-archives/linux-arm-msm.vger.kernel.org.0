Return-Path: <linux-arm-msm+bounces-83955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F10C9739C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8731B3A507B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C211D30BF6D;
	Mon,  1 Dec 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3NJGuGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtGi2OZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D58430B525
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591630; cv=none; b=F6SFE8YFX9ENJuspuYXoagbRUX6r4GJYLICvvIISTr7D1htVnRQPWQilqc6rm8zrgapHAT0ppZEvLXIHK7wxQ0lVsiGkUdDJzHPpjfOj5hjj+uGlWP4KhbRsi4ZBcoPZBdXZ2AgCJQnZek4ALjdsZ+hqNQkrts8ZKu6zRDAjg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591630; c=relaxed/simple;
	bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMXdnhfHfytJQn5bZyoob7QSEBAPe9umZXlbLVP778Pz5c6Z7PQEzAWpo1iECiTztyM6KA5Tm48ROk4WtwpzQn3bA4fk3YiKXI11Cw3qMyJwG2ntYV0J89Goi4do3rpUYSujrCc67MtFH0KMT+zYnXuv/RPVQfESCv4Ik8MpEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3NJGuGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtGi2OZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1BK5FN106130
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=; b=M3NJGuGPgS5tRI7J
	+bWh5iXyWN5ciH8Mo15hMRm19CPDbq1bBkcpt1H2rXLjVMSzXZ8LX7OwbSUf8v+Y
	GfjSALoKlJ1adGV6+l1x3DaJn6YqtXLlRNUFI5cuRkFmn2TqYVsDftXDJfAM3dXv
	6Nr5VYWkg//PH8uOnHmgCw9kHb/pLJJppRTcelVCXN6iRI/dNkuGJC9CED7j7CwI
	2DfBGJXpB29hSAdpNk4S8t3SUUTsY0zSH1a6kTI0M7V/uomdPF02ArXu7k37sUnK
	kV7klO9iLIxVyTgXk2jqBxwQmVSKDSZcv/1OcO/dS5Of/vFzwSXRsu0iE5q8UW62
	CjRyBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asa2384s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:20:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso9693271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764591627; x=1765196427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
        b=CtGi2OZBQSSrN1+0g1Rcg2g6crUsUwdjZLoWmvIlO0XSAybN6u7d/ZmTFShOT9Oe2V
         kfGMaRgINQnUkj24i6ENhohahq19HLE/yrS+k4bLySAotVFCq8063mK5skUV2nfPdV+q
         XlafhGhMY9gkEk+pQUe7EF86BdB8AFDtIc1/UBUXDvMJme+sBbQVM8y+HNI9YNkQt9Xb
         v6hnOSBaCNfpD7Krofsblvt1cGp27mmMVvr5L71kNxe7tiab2YYjlLUYuPHkgrcZvpSM
         dPi1i0+6foMPT1SA5NyeMnecSV7e0CLRcBAsPboG9yd3lZNjEeAPWb1KHPR4v6hCIF+d
         nj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591627; x=1765196427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY2f/OQiXjvQ99EgQG+7NrC52FpWQ+O8IZO2TLGmBJw=;
        b=psx188DZIn2vwmBxqRTWHuNnic0yIMwzmHAj/tKkR1gGiKrkIjqK29uxu3I7ta3FWE
         A0yohrfVr2TJjMiluwyCb5LYkpF2qoh+stsAc9kqAj55uGvXqffIqk0eBKU/i27ImL9L
         37YZcZ605acDv6s4cvb/4BtFGy4uNt6E2fyJMaJxg1DZuTUw3GOU/GIuM5wWlJf/4v98
         sTAmTTCxrJnvlfW/ecxVMTOqeAK6889LAJEYwI429mCTvPuV+VGKYS5eyJ6/IdwDYxCY
         GYwGdRscGi72CYweY1oY4xF0+qdk9TbbAxYvk5KLC73viJmQoXzO6xwQ+cBJpyINgLrb
         /OFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWKClnGBy9ibZL7eNvsRkZ/1x0073amx2qWG+ZWRfb0O6HV2c8IXUQ0Mn4Hu1wvvJKvYfT88f3mOp7065t@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnsMqLyZLk6SzSjf2PNDrbxRDwPi5hg/46xMJSHWyaYzwQaM5
	C3DD/hRRwns/QofDW1/3uMecm1J0bbxbfS56uaktcxgu6TbucmfCnGqbqHo0Y3SYom2Fvoat1vN
	3IZQquYHHkobt/Ci2OlEA4iQP3GAsRWH6Qb3rmhU4FCLhp60WSXOgUpx32uqFNq8QEOGp
X-Gm-Gg: ASbGncudaoieugjUopgH3U4TSmKTf6omAfpmBBbIMIVOw8/IX7ehMkcYCK8sAH1FSPy
	/62ZZO0H971zmfikDTA6k2bdKqhJ7O/RzQAmfGc13eH+miDatEEjFXsb6tjib8IVV7gqx2r70Io
	7UqxL5caBKvuDGCITAdCO2lm4QG3lqdyne5pqGDuC/A2SBPsxgycODrVgQNoQwQ22dWnRd5L9HF
	RfpE37iL4S0cEe4C6di0gNFQc1ko7JBxh6pt8cD8Wb70hRqSgXbknEA2ENnhW+b6KZzLVP2JVfg
	jiQHtBvFXriiuxy+nNQOfCkJtZ/boLcFy/6MRjV328BTr7KmH+saL3XrVHuf0ekBQTXVuejKIME
	xPKg4Pnp8VMYhloZteYz6aHZ59nYiE5Vy/xKfc7yXN77XpTJhzVWFba5h2FLD87I4H1g=
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr392682051cf.8.1764591627370;
        Mon, 01 Dec 2025 04:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJKlfp8WVWHfI6G33XR+NIj+3I4kVuSnGH8T8BZFtRFo3N6WDtyo+7PMNn0O3wAizbedoOOA==
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr392681551cf.8.1764591626827;
        Mon, 01 Dec 2025 04:20:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e93acsm1186657866b.50.2025.12.01.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:20:26 -0800 (PST)
Message-ID: <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:20:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOurWeZb c=1 sm=1 tr=0 ts=692d880c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yCSNFImgYS9KtUgOuK0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NkSzRyk8GKiSERhwWoDNU0vfzBiJ12Ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMCBTYWx0ZWRfX8O9xgGW62nGf
 JNTaEvs6ZNbb7XRUsngf4XXJQKfh2+xID49+zVgj6FnGo0bdpV/j+58uXF/8VSoimKUeajLGPKD
 mrdp46dVmLBQb3mxQFZzdcfBH4iOtHnwmbgs/nX0s6SKTfUHbLwGOFI55FWUbQZ8O4riQluiwzi
 Z9/oQAJr+DTLkPAlLgpntMANZyb7ksAwJdkKD0lpo+9ST+2tAjQghAKA7vy4Pnj+EywyolP0NUX
 7d1aiexpb4ybmq4a5Ks62t2P7Ph8bD5M6M98M43kErj84AaRnonk9y8BWoPEix1maIDMamOBend
 XBBPEsieACLm0aS5MuSPqi9/z963+Mnn5sLU+oOZA4kD3J0bn1vuh+41HyYH66vb+eXnJPUeBvx
 piFQwTcijQ9IwLWEgrOABbPGNfKIdg==
X-Proofpoint-ORIG-GUID: NkSzRyk8GKiSERhwWoDNU0vfzBiJ12Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010100

On 12/1/25 7:25 AM, Hangxiang Ma wrote:
> The current value of '0xb0' that represents the offset to the status
> registers within the common registers of the CSIPHY has been changed on
> the newer SOCs and it requires generalizing the macro using a new
> variable 'common_status_offset'. This variable is initialized in the
> csiphy_init() function.

"offset" + "common_status_offset" is confusing

Let's maybe add some platform data where we store the actual offset of
the registers in question and pass a csiphy ptr as an argument

Konrad

