Return-Path: <linux-arm-msm+bounces-43668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B79FE8F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5D3161DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983AF1AAA37;
	Mon, 30 Dec 2024 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCJiqH/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE81AB6E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575085; cv=none; b=fbSd6DwEEF5FaY/jJ95wVgfRePowFmzu+ZF9V8W+S12tKosryORkdsoEp+gD+QaOdjxC3lKwS+aTQyp3uN8WuItXu+YnSHyLCUp903sOPLED+Q5z3miCk9SWZ40OkSsUcEWdzRqq9dObipfk1fisw03d6N9XiuaObKERJznFNjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575085; c=relaxed/simple;
	bh=JtCmiPvBP5gUbpCS4zWrWQBq6FGEw68MNkxNFmHNPGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqk2rmsouQpunPz5BbUP6lAuQwSjM4Xu6zaMFc1GqJy6imloPVlbZs7rCxFBIrEXGfeY0ztAgPcXA6sOoSkeR4aixJ5LatYn386ko4g8LaUrRdwWbwHu3kjfpJ01RXkVMsPdCMEwrHo1qx9pdKt5OTAiCOTn6qh9Lag0x+qbs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCJiqH/9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUE3dVD004987
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=; b=UCJiqH/9DrhIv49T
	mUmjoEaeFrthywiCjP+inXx2NwwzMzhrvwS+q+qh+X5hr4w8wmyJzr+rC5QiAQfY
	v5whfMJGnMK56YcAQkdXfNOtw2V0Ka20YYHHc6wtkpP/kz/1clxkoF6fb0n5b0lX
	v8eOykQQNz1FqmCU+O0Jg21peImB6rXiKTtipgp8O+hFWdin+dIp6OVZXD5KAivu
	vLcypNTLfy400a+2O09jkSY2ejfY57NjNbmvny5HChIya/D4MkNkxELHEHh0Z13v
	ZpoovTj+2Cc1FAHL7Uhmwpx419N3eZVw75uGYzYHPFfRlXX/1vnE0Qw11nkbK9KE
	2II0dg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uvxxg9ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:11:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d88fe63f21so21834756d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 08:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575082; x=1736179882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=;
        b=xBUZ12bSiyFvEvnYwK9O/7trD0W2rdFwhyi2mQK0SbtZf8M4YVenYJqYx0CYox62TQ
         Tb3+pXow44GJGyfRICH0KqPYFAirmkJoUZMhhZ1TadTrWEjunkZRNrketieH/4tjFtXT
         Adb/dJ6noKxVSPtUQWtGf/1Kp4b1LoglX52zQ6oklN6TzKXLSv/a/tzU72Y3yaXePvDW
         YijG3LEa2JLd9tq2qXH0aF72Puo0z+bkCmwdpCFXzZWMs3JpEg46g+5ks2sQYLoIiGr8
         N9VqSp0whS8fC1XIRYx6+bi0b4K0FuHyZFDsLfrx7JlnOzwfGAeX3BpY6djn/jRZhiqm
         6guQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk/wHZNzqZjSz6olQYfDQosSsKAybed/E93s2gBRSJQOWRQ54HP3+vQZS123tHvEYgKQ3UXv0Rk3jZHe2x@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzqilrUFiFDLaFH6Qt9++/RaFH8ipq/gald6pNABFqi9wsztB
	3EJcyEnTwDMsSJJe/btWA4zJ+vyD645f4JTafavnRf2JGJqUkZ5XXkj2mEyEMo9KxKY8LLRGBe3
	dSqJPv58UeQj1cOjVAYzeUsu3OI+yrUy/PH8Z8ik1wp2XPiwb833j/bTyh4c4KLjL
X-Gm-Gg: ASbGncu5TP+rpt//Ubp13mMXwDvPZYhSkkDd20lmPe5sK/JUVM4g5MpNyx/F5wGP0rm
	JkRVRLLPE0WvT0TmcPXfHcJgtG9pARQYwnxC0Sy/zfTP+VQ0e2GQRBJE0W1CR2t33WDXlNpww9X
	/0KAKXKrnLPwPrDzp2XXn3BmcjBI7JdKMpt+pmlM/31IrEEkwkxVvgzxCY6MNR3afOxemtdJp0E
	fFpJzfF8IwWr3lTZ4NXDK621Cv8utt1qEn9JLJ4D8DRqMJMIMJKNh66z/Lu63CN01yPMU3l1Eft
	Pl9JPtxea0HhlmWp1TnfkN1zU7VxlAodkkk=
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976756185a.11.1735575081783;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2BVxJ+jl0wNFz54SkuMhcOIsWCBO+gH+vcL/CRqGxPgW44umlm1mhoWx6DWa8/uF2ZB/AfQ==
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976753585a.11.1735575081432;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm1493145766b.93.2024.12.30.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Message-ID: <8bea9d64-66f0-4923-8961-dbf06cae377e@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 17:11:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A9Y2uOjJreC3NpUg7riaioVV7wP0hmqJ
X-Proofpoint-GUID: A9Y2uOjJreC3NpUg7riaioVV7wP0hmqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=983
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300140

On 27.12.2024 2:11 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

