Return-Path: <linux-arm-msm+bounces-61432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D026EADAF01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF3B3A54B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45EB2BEC28;
	Mon, 16 Jun 2025 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSls4azE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A604280A20
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074423; cv=none; b=cBVZad8f/ynDxePk3WmXeOBWjrm21Iblej2YyPpdksPYzpfBpalbftVHkkEkkuQu4N8WJAw+1Eih66zbUBV507oMLrCHqKsG8tnDRmK/J71Fwk/En0X1+pXOd1cMK+iOxEfC4OdlXGUSlExEzKr+zcOHzlkuBHMRLOXWu6FSd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074423; c=relaxed/simple;
	bh=xvLchH7ZetSbOXKQWka/fIa87mgHsBeuanRIcEntZKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0znAzICSFND0uiZnGy/6S5R3S65++kWzEMHOH2gpH6PNr0tbk2irgWYC22cZva415clGnQ0tEhTwYjGpFf11X8ni1DqFOFo+LomlpUXKH4AB4+ckG2jPMZXuAImvt7C99IgXi/zlSH8uiz7v95jEWn8xq6/jtJeM6CtJoZ854Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSls4azE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8uLr5028921
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=; b=ZSls4azEotiCruzt
	wxygWg6g3folqNwrjAcwi/leCje0HrwhXKagZzp4fizpOhrBfaCmqyBoqtD+Fz4o
	vxpI42qsVBBa+70L+xBfe/upeSjK7zetvcAKHW7Q8mvWU36js+Tw9ZH6ktYADoDf
	wxqELXZAztffF9nv2qcW9mnOn527aMtUesuj2G/rw/Q4h4lgiKoO3D8P/4hRjib8
	Bf+klAJSix3CkKqssxj6cIT/W9BBYxk8MNZ+q4XasztAsm2ioJtSZI1XffJUsLWb
	F6M6AHiVBGHcDQDvvSn1mxBLn/pI/kdlU7/mJ/6SelJND67IgwAtk5M0DfcPgzoT
	qW2bow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mca09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:47:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09b74dc4bso113056485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074420; x=1750679220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=;
        b=nfdY1o1ync3tLK0P04418RBp2IXS+Kv+DJSNE18RswsczQua68YjTBSEm8LGg0iq3A
         FNJlqpFUdKlswcX4MstfRf3qp/NspftQxu4vwdeXsOkdasU/7yIvD05H5aijP6edNW/H
         1Ix/UWKaKuIuTaq36TM9/+tsM7UTSpWavkCSBgb6Ab9CSW9OvKLE5/8dwcgIuPUsubeW
         SdlnVWAnuFhwXbNRM2nj4atXepMqLpHYTQEp8QnN5kxomQRB8gpsi7TQUmw6ev3K+m6F
         B69jSNnJiyTmlNeRAtreSZvsofqAcMuL0DOq0zLT7QVZi6suZZKzAakmFXCV0hX0utHy
         3Tyw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Cpk5hYYUdp4tZdHxXxs/7wp9867IId9otGMckZSUBvPD/F8y9flCm3daxCXt0BpSpuje8cFvH6s9IRNI@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJY3RmrBGCL1IC2RxtyTWAGKmdlfj7KnRQ2jGSai/EGhE2brB
	orryuFaK2Xky0LT25rfjrG5F2trH/7uZrwOcbtYj9mS6ezuv3j/9FlrAWsGf4zTItIks1/MXYka
	D4i73PSdEF7ffkC4AzEvE/95mdUjiBG6qlXIhUJA9PfhhwRGox9sNYSXy67VRhbQfj0av
X-Gm-Gg: ASbGncs3Amm2JwNbbg90WgxVyf2hHeJqGaIJ6WmVuFFqM8CEFEVu/JyIzjt50i4AjGf
	mNZMBGNXr2uO687lVFDF75W2DZQHxmCA7BhucHRxvpn4dQ6U2GYO8FLg9yexkHGThAGBhstH40H
	zxfzeFst4nuLDFUz091YDae8Eg5GYOEcc44ZRaSx6C/pFe9eMP0CDKPNPKUxkVChsmxeOlZo8ZO
	jZmA7k1iY9BZpfZ/RrfnkPUoh2dSCN5ssDteU/8aAuzFJACah0b7tg4ACZs21giwpUdFk+GHjKR
	KkUHUkLm85DjN55uOj57AQENjMXz5tFrW29e0M5VX9vH4r5M+k48lq/V0c76an0Of+ATpEv7Gm5
	kQLk=
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512720785a.6.1750074420339;
        Mon, 16 Jun 2025 04:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhRDv3gJWoivgwjrGSlbD6D+Z6A4Ncme2M1YfZQGjp7xs3qbRnm8+STTXh6nGwR0vLHAZjiw==
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512718485a.6.1750074419855;
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9ad8a155sm503073566b.84.2025.06.16.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Message-ID: <90be390b-d69f-4862-8f24-b692f41f9bf5@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MyBTYWx0ZWRfX3nEu8hX3NDun
 KVfYd0AWV15AZbN7GAISaeYDRYqyNbjsNdKtyij5f4MGHQCqGWwSsTbRbDM5JCYvRyLZ+klvxxL
 Huc1+4NheRjKLA/ZX30kY/2mGwmA7Rf73lr7NhINlMw5ESItlXF9w6h3vvZAnr4wb71jRwKhX80
 9nqQaKqmWCHMIn2j69AA0QpLQY2jcms8Lf1HKahYtGX5EThxdNtiYnLb6TDnUbC1S9FzC+q1YT9
 rMvMX5TORscM6v1GWkVxkNz5yKjjGWOveX4krqaVjcajvdS5YpMWUlSqxDMixqsyv9u12zPF0he
 y9QC2QUaWSobZwyiXoASIK54Zbiuaks23X6SFEH8EjS18lKOTSj6AVvdRBA+Tozv9XJKz8hYBOn
 q0pE9itNbmZ/Edq3OIZ7LJbYXHrC8xCActvfbKvdE9mT/AQ3dmAWZw9Yc731lx+3OPtrG+wd
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68500435 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=HDjIzE35AAAA:8 a=3LVZaTluhho0w2aZh4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: HWDxH_jvzdVkc2PHuUdvHx1YSyWQoWhi
X-Proofpoint-ORIG-GUID: HWDxH_jvzdVkc2PHuUdvHx1YSyWQoWhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160073

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Add Fixes and R-b tag
> - Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
> - Remove comments from rmi4 nodes
> - Don't touch tz-app memory region. Currently, the bigger size seems
>   not necessary.

You may want to run the kernel memtest, which accesses all non-reserved
regions. If the device doesn't kaboom, we're likely gtg

To do so, enable CONFIG_MEMTEST and boot with "memtest=1" in cmdline,
boot may take noticeably longer than usual.

Konrad

