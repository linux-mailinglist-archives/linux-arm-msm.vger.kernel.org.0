Return-Path: <linux-arm-msm+bounces-61433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB99ADAF0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2622164990
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8872E7F08;
	Mon, 16 Jun 2025 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YifN1pJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596927FB34
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074539; cv=none; b=giAFfTxg/nuiFVFQsUil4MlXUg9xWXiQxl0g4WiP+bH1Jzs0ubNveFn7n0mTKb775OYVicjSSxO5Ng88NCvzHKKoIFMZYkB06YSVLlNdi+Yyf2UwsTc3ogHjUtDIVeSBRQ3Y1YMtYjD39S0DrsBQtzspgnjUZOpvnHit+PmO2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074539; c=relaxed/simple;
	bh=BkLu9G69YJ6aTmB+TBQoxLmyA6zp2jPwmkmcQrVRwso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLeBgKLW/pAbwrHiIeFifhVR49gJMaaRieT75RtiLPf9HyQ9zNhBgzZZiB+FIA5GPipQuoO7VWl9lS6aYJuomfS5Ea7lIfMRXSz/EfpqXjJo6uClSc1CeqqRkupVX+I/YO0KPV50MaZPwux9jytcXDP5tGvMA1D+ya7YFXPjzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YifN1pJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8xBb6015543
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6/D06xxCqY75P4dZWCXGqoyMfaO+umun8VIYzdcz4w=; b=YifN1pJ6HD1J/n9j
	AaPRvdBiQOFAboHrW3b2mXp8s+caPu5judd8SqIzBymH93AlvCMaoJIzRgC2frpV
	L/ZxD5crLjFJ8pMZ4XRxQgFZMoGaEDx0OqYgnx+1DdKmG7NebernRiW/ZPWjYqdQ
	e7QgUsyGEZdTsp5RYWQnnRmoCYMSBDv0GJlthscd/rLBwM88GgWR3jvIXOY9N9FJ
	86fIDKxLE3l8zI6exRPLdOY0psXLqHJ+zso00j1Kg2N2do3SZRroSeFVtf3IDYHN
	JnZvCYWjEf7dNXduNRcPmwbRws96LLi+HCnkv1YvAxYDT9NWEubNMfmGlTuPkbv2
	Ia8ppw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfcd1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso113099785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074534; x=1750679334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6/D06xxCqY75P4dZWCXGqoyMfaO+umun8VIYzdcz4w=;
        b=VCJFvIod78/CjrkHuZMH64pVUWJShZHoxvL/1AoWuy6AOtTGyAX9bEPo5oHSzjQVTy
         3hRu2GcgD6HMCpJTR+40kJux42cNxDSVzzOzXoumBClNER/wTcAvBuLFNvtAPF+cPRYx
         go5VYGufiivQJIc/Vv+RDobXAluPy+IsiTCVI5fTieH6QxF3ScqnDGGrCwCRGzF3qR6z
         Cyby7l3f3zCE0UmWkN0P4S9ywLKY+5He3z8T9wJcZTgAmK2XNSS0TxmvrfmqsxtQK35N
         cB1nHa98fzsKhCwN8xpsKPxU1SMKiGHpyJIgZGh+ZHhP3CiPb2pBwJ/SAZnAGOZ0TTEG
         Zy3Q==
X-Gm-Message-State: AOJu0YxuljyQGwzdPdn6DykHwpL94dI+epVYGFcDPapOhMXb5LDqwvDC
	fD5E94fWlzdsv4IG0xhl9WwmsX+QvrccPo5M9OKupIKuamgI4I0pkcO5ycgx3m3h2hibe/FtWiy
	m67+rKkxiyorLlNUy6Mbs2c8C6JraGN8nwiqlvqasIv9ENC3S+Tps8d/8NFWhSgROLS23
X-Gm-Gg: ASbGncvukLbRRSH3ULHnekwZv8+VPAQZY0SV8Vu5DQiel0rQYASifuq81igqTBpn8ZQ
	gdK9q14akz3EfEVeTv866GiecAFOVYbg20V7Ik5IgilenA8K/eY8IrWRTr0D+WBS7qZihNT67gh
	ZdCHsGnkUhsdmzS5pqQ+UqCRlHT0HAm4mJyLWQST7LgXix0WuJKbi8Uu9v2z8bq+zOQdEzKH/kz
	lbyKRvcAA6eOyj/U4hMmt9UdTA4E6FkKZ9RkESKPvE1X8RwTAUdKIYv/3lg+wvluGbe5FWisuvo
	JP29pqTtzjeIgG0NxSigBfVUYPay1+cdHOgvmRZfoX+BruMlJKbc1owyNlzmHwl5hNLIwlidHIf
	nJzY=
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr59375006d6.0.1750074534179;
        Mon, 16 Jun 2025 04:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/rMsOcLm7IFjSZLurpNjrZv8j9ZV89uGTTRbl2ahszQMIMiFTtrHi7mWnIkZP1XB0Jf3+w==
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr59374776d6.0.1750074533757;
        Mon, 16 Jun 2025 04:48:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5c3bsm651750366b.61.2025.06.16.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:48:53 -0700 (PDT)
Message-ID: <7335dead-da35-43ce-8338-8383db948768@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
 <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
 <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfX7F2qQNypCQLA
 f2GWEnd2GfxfTc941B3YTf7urPMbs2bSwyFKaiAnTsQLG7yEEnra82x2itRJUo3+G0YKSiQDp6b
 jQf0DCu7riVv/ebGCa5jmooQQlhcm6m851Ufgt/OCHZIjMLZwHbKJP1IwZNIyiVk1t2fP3hkisS
 eEuMiucXAq0nBXaggJYQU6LLv6wKoeNofq+6l9LpZST2yQY5ekJHl0zfrKGkRYWoG6JKqNXkZ1A
 Hk9XwePN2ylOG8vUECVenzXRi/adcbVDhIU042roOpu4aORnZqHdHbmLgs9R8Diaocj3dlOS7Rh
 0avdaT0cxxQ6HXTEb31S3sxJkQLOHJSEFLvbBchILGIAi0PwCcWZaDw8gZbKFBjL6hdLNpyzCGw
 6qyDNgIzPDRYrqhjp23VvnJttZkQZTIi2RTWKV5NSZwYeLVjLitz++bbMVH291Cqafhb5tBL
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=685004a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Gbw9aFdXAAAA:8 a=2t8RrQqO_CiJknku0qEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: nfg-SRnp0AWMQdzWL0rM2sa-xLOmoAJa
X-Proofpoint-ORIG-GUID: nfg-SRnp0AWMQdzWL0rM2sa-xLOmoAJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=985
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On 6/14/25 10:46 PM, Antony Kurniawan Soemardi wrote:
> On 6/15/2025 1:36 AM, Konrad Dybcio wrote:
>> IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
>> flow (some partitions were non-standard?) - could you please add a
>> paragraph about it in the commit message if that's the case, and maybe
>> include a short how-to on booting the thing?
> Is it acceptable to provide the pmOS wiki link in the commit message instead?
> https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)
> 
> Or should I include a paragraph explaining it? It might be lengthy since
> I'd need to add download links for the mkelf and the RPM blob.

A link is okay in this case - pmOS wiki has been with us for a while and
I don't expect it to go down anytime soon.

Konrad

