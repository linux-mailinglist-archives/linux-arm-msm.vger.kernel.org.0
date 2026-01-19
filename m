Return-Path: <linux-arm-msm+bounces-89612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B1D3A591
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F5630946F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F6530F552;
	Mon, 19 Jan 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqBeP8gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/r1Hpbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBE30C601
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819403; cv=none; b=Dgn1ePoLnPLYFk0ix1h1eA47fv+zx/Is9F/K/flFJfnMU0foWipRPmeto3n7IGg2QtnAxpEkYrPQIY1lijeWw9D85anX9CyHG5s2ibSgjhudYvONw6jrrBPVKXORqmIWe7/h46L67OLa9AccFW8r+grFP4T8JjhHl9+L6kZrTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819403; c=relaxed/simple;
	bh=6OxtZyB8koZHoZGpfpeSmLCjEk9eBQtu3mIJXFn9e1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0W9c2yTRo1u2raZNdgzZxzmrWSKC3Zrxj8Pt0KqCmUXJqVSBiV9MnRGOpJvQg2AHnMVYtYxmB76Pr+o2d4abF6RgfRYY5mLj2P8boSmUQF+mPYr4MQw7QYQeJ3akhpJWEQANy9jl0IR1w2o73Jndld1UOsGsW85eTVHJdIC9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqBeP8gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/r1Hpbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91HhQ1561984
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDH4mIOLGAkMcY4keDYCK4RtAKE5wqC0mLvflrqx8Y=; b=OqBeP8gwXUUdY1AK
	QYeor3hyponAEqhWjsZBn9NXIMV0PZkYG0vh7AVqfct9fP+uYWjoY7hRRvIz/GHj
	Vx9DtR8KzEJ8Vxd8eul5C9pOqvLdYExG/LcTJtFO3gn/cPGrGSxgxBz24sbbCyGd
	f/TA86lQVDE3tDD+jscNuZE3TDw8cJWXla6NGAPU/6um5KCCl8EmIxTY3W0SXyWq
	A9YHtmPWt/AQSrVdySmPXKN8uj2hcXXnWXlJhPCcR06PFIGe76BfudeVZ9VVWcUp
	zff2uJ3oXeLlTDZ4u2WBepPSS/BWYOdtzA3ukepbhD494htvC4r2eWlK17pFfANi
	MqUEsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcrcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:43:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so108213285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819400; x=1769424200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeDH4mIOLGAkMcY4keDYCK4RtAKE5wqC0mLvflrqx8Y=;
        b=D/r1HpbevDCX6pfroF+mSmmJbi73IlWsr4NMxh6ViV+h3v6xUtV5TRMt8xY91V4MRz
         LPtKrAGsexScw9QSkFS0NpXqi5sNB+Z7yPFSs0OBq5QG4R+S8FvMSDO8mP+bsL8YJEaE
         IdZgzl0vnY8AWAidx79rP2xHj2diHMzVLaU7liKlwh9HQeIlmwOs9E4ye7s3KBFSofLp
         Ak+5ZkXa8jfO0pTRzZOP9pZeGmq2RNyTWjrRKsb/RV0TgR7iT9Unvjo23Jnj5LN0Ti22
         qhQhr0084fWZsR+ymtJ/T4MkLDPzvgvH2UYEWg2/zbuuMFWcl2+adWVjQIpnpc6YcRQV
         LZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819400; x=1769424200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeDH4mIOLGAkMcY4keDYCK4RtAKE5wqC0mLvflrqx8Y=;
        b=GSKffJapMLLN9SEr649cSzlocG62QbeFHQBOPruHfmgtdf5gy8XnoKumdwEiAaTJDK
         jo5+YQnimW/g0c6L6SClIqmlFvDUDpWoh1nnRFwRrnjzhxKgGYN74HHlReC7MaZX+4/N
         1m6CrPvKAL49XdP6Rbv3lJ6/6sviNxYFmUi/XVaWHSFnScnrTS1dGurDlKC1HkUEpUNl
         eACPdnAYaH9DFPk9sQ1EgQcbFWYxcB+RjUhDiu4fL7ApcXwqUswTieCpFLRCxz7+OOu9
         +8VxXKGMTTeQWBrAiOcABpAh9dNUTqdM9ShV/dzNCVgYYYs/Sj+HKfW3Mz8vO3LweCVA
         vxkw==
X-Forwarded-Encrypted: i=1; AJvYcCU4FkfvMPk1P68RJr+XYNAM+qJ8NL1bsV6uk/4RHXDp6WLkn/+zv0hB/KN3ulpV7jYgPHk+gVv4PnzFQqpA@vger.kernel.org
X-Gm-Message-State: AOJu0YyFuo2ENLVhULldeky9iYyNUzBCPAKdf0ruGqCB++1eKhFO+eLn
	QorbeGW1jLifeOUhN9QzonxUtNW9k9RsT6RASR/gHHMkb2M+bYYR17liZl5+z/s69SOPM1JNhgx
	/QFrP+2bsVLtjCWyeFlyj5OUGlEfw9mFtUXl/MWiraD/1Oi3CBmcYcUnoRFJ6dfOuVV9a
X-Gm-Gg: AY/fxX6Drvc2jo6sBJdYswLZhhSRW1R37IRpkfFHeuw8MvqLkNpEu/3Bw+owPdckXPV
	nYatFQZt7DUWtBb7dASZF8LIVEOK/R08B2WLylUlgg03u1X5X4pXDnSfF2At3v8r8uIo0SHlVZc
	NxG+GdeVlPVUsklUvmZjeXdkoREwJ08J5PWwi/dExzUlDKNxmNZuA2RC3aIxEBm7ghjn/faPQ6u
	Rmd8TdkAY2epGkv/pL4MTnWoeghENMh+18+bAJ0I46a6t/tcq5FYAe6MF4Mx/NpCAqQeRSpu2YE
	ADIU+M0mg2vivcpfb5cmXrWxRjQ1G9YNzvnxZHWRpkZXAL/pIBS/pPkJSyzd9hJ+8hQmxHvPWAv
	lrZEEUsY7L71OucGDiGkOSyQnmW8C2WLeHP4fetNlAM5E7mUrtp+4RnGCtbLcAnhOeZo=
X-Received: by 2002:a05:620a:191e:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6a66ee327mr1127308185a.1.1768819400486;
        Mon, 19 Jan 2026 02:43:20 -0800 (PST)
X-Received: by 2002:a05:620a:191e:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6a66ee327mr1127305885a.1.1768819400062;
        Mon, 19 Jan 2026 02:43:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879ae74639sm1057337466b.9.2026.01.19.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:43:19 -0800 (PST)
Message-ID: <919224e3-f28f-49f2-b84d-0ad87f58985d@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:43:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] interconnect: Add devm_of_icc_get_by_index() as
 exported API for users
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-1-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-1-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXxBvz+RZGe8eP
 hVNG3CIFRBByQlGoOgmsj2RRn1wb+UbNZcWLV5dRpAARbcf57toMPtzCL6YwQWMtTZTTZmxknjg
 0dmekwVFI4TA/mvDtb8M26jRj5mwLY8Zby+TQUC69GwGlc5mwksjUWF1rP/1EcFT0h1OZMn/h2l
 pyp9tIBaE2hdLqd8jnFuXDGIgBqyX4V//6Aw70/vP/TdfxUSpq65Uuj/3UJ6M6qsNyi8mR++d6w
 OEgM2sYor2PeSR0hWL+y+KWPGHofEc38PhK7ir3NuI4IdfbGhWLf3cHxxPwLFG2r4/d0szn/U8U
 VypKJZf1eg+srJtUBbOA6/TAeF4x8gpiGf75cl1sD/idt+vW1LELHuV0LdwYso2lJI7h8+y1YX0
 XgIc1vA/gyV5Z+N1Uhc5FmLO4S4V8MTHmF6u7YhbEoy7oxjIj3AGh3n92XbFdrc2VT18VQUotHD
 //gZ87p8Va+l+CZt/Nw==
X-Proofpoint-GUID: kZqxERxD4JoKeFVI5CJoFxc7WFwIwbuc
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0ac9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: kZqxERxD4JoKeFVI5CJoFxc7WFwIwbuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

On 1/16/26 2:17 PM, Luca Weiss wrote:
> Users can use devm version of of_icc_get_by_index() to benefit from
> automatic resource release.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


