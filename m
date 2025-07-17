Return-Path: <linux-arm-msm+bounces-65554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E506B09646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4289C16D63E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 21:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160712309BD;
	Thu, 17 Jul 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIMVvM1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FC222575
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752786407; cv=none; b=bRJ1FYlCq+55NrguwfNMZY1/590KZnYqW1WXNhATLddHPJ8tpbsu+qZ5BUdmzIripHgp6snE0xRjqN4E7YiXXaz/nEuIZqM+MdJTFCJuAG/sAJl3iHvqa2A9JRuz6tJzAa0PY/RKJuvnEmjN3W8kndY0kmpWGBqp97ZZYU6WLd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752786407; c=relaxed/simple;
	bh=uhfsvd6ujR5IiuRkGHiGSpUgRbJAikw6tYn5QgEz+VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJd0NVHrp6ioTd2Qhi7wlfoYI1K3jPRaJTr79bKIAtrN6Dfv1hEel+j9fYlbXrodk6cLnWgqZNA+1XBJY5KH31eRwzLYdwQ7n9NXw8CzElz+rFszIGhUyvs2TVwVRPDSrTL2cZ14Ex+5HHvZSgyqko5j4SikI9clMAgpgHLrjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIMVvM1b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJbW4o030459
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=; b=fIMVvM1bN1hE4eUK
	WGzlKQawrUeXo7QK+Ku6DfRkL9mijak+Krr7T78veaG/n+2cu3v93hVr3JsQ5ME3
	cXLeCvcFfBgaodGi5fGCWH6LSu6KmvUVMrvzmNI3+sn0hvy/6RF4XsxtvDzY51m+
	kjvLDcteG81VEZOwVTB5gkcp26i7buKXYdP3h4qqW9pDz67Wb1JaThOwzNAhVruR
	SWd7LGbo5HkjnpTs0FRDOSyuVu1fSs1L4OaHU6uz1gm1ABKhY0RyXq6ZTeKy/6Kz
	G3cl1nZNOWZ230vSSGE22EyN2fimf8eiLR1KADQOvSBbrwiZgqE/qaD2L5kdgJ5y
	04lUug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7p0u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7deca3ef277so32280085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752786403; x=1753391203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=;
        b=hh9k2iWuIB9f7+sMJe20X0Q5AtfNd8X7sBKPF6htFPZKV9w/2/Elvo75gsKsrYZJrJ
         MwEWQLtLI4/f+eIv8dJc/oZISeTCqSzII3Aw9cBOnwCdF37gwuRwxeGZa56ehWgcIxyZ
         K1NgdGJjPFF+Wtdi+LHMj6Kay9OfOuBkwgsMKII/hsHlqvvTSbSGshimMrHVgOrstogK
         7Tz1gmSphHuHvdv76YMGxMcKu0zYfuT1kkB+MM46MCKwEH8STGM9fmN5wdstcLcwrqBx
         guRpE71bbd46YNtPJUESOgfkrubIb28sVrNzASPMMcG2z3a/xLnta3RLiKOCXA5dpNOp
         tHWw==
X-Forwarded-Encrypted: i=1; AJvYcCWmJSX4FOUY3NucHuMIHeJJ0I7EqudCOOFqj3ltbO1/FLYUJ04PhKajs73dod7zhJrMfpLQCUSDCqUy0yvL@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ36Aji5xRTHMucHKrn9i5En6vWj2eIXZug/KpWqiFpwDi5ryE
	5t/148IHK+jbFWBQgJAsGTL9DM0dFT7qXcqfdeGeHK3xo+mhmHcv5k8ijud0K2oqPMmU4Y7lzWg
	IK0xBv3Ss9mUfWAH3ty3zSQhhy5xJGJ+Gx/HYf1cDghNMMS1rZ4TErCqVV1zVGf9MNQH3
X-Gm-Gg: ASbGncsHGrkfmPaBKAoeEeFJao+0FLOUxBtaFCaO4qfdYu0P0mUOlnoKFSySOuXs9PX
	QFgUQxadBGCOCxO7a82+q0b+S/mZRhiD00Ibf+wx1qpA9AHnIqZlOokutzUGPMqERtzi+eIuLsa
	ukP8/lt+UpSZOXf5J+ei7bKpM3zeBO5X9ZWhEgBwLno77s3acjI8MYVikr5YzTVdrk6CqEq7VKA
	mZJLYRn+QBcbJ0efNRuTyABnBR+4qTUGCxbZ8ZMQLzcc9K9/f5tCAVrigSGO0KiJLNnXoODzeX2
	b5hjh724PUC19HmWOhXW89kwAEBl3wNu3FpeoIh5s2FI3EiMxmM64hhE8ALLhS0MYjlTDNCGQU/
	8prYL+PCiR54Fn8LIPDXz
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451825285a.5.1752786402693;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuPa/yRCQICTQrA+jm+Q73xxpZUEJk2US/0cdFi63bdkyvw+FC7AgcXaKulKKmsTwOdsW8rg==
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451822985a.5.1752786402252;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826461esm1427290566b.100.2025.07.17.14.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:06:41 -0700 (PDT)
Message-ID: <653da558-9dff-442d-acc7-65a1c0f84494@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NiBTYWx0ZWRfX7uJ2beJxvTTo
 bnnNAc5LkCboOeW24s5Nyd14eUON4XmZffET4gLPI3OYMMqRdJP+HMlrog8WzDE5bpf/0ZxWcW2
 HIchX9xNv4so1G1SBTjd9GggqU/aZfmpa0HwHSjleUOGPVFVKx2t5Zrg9tNk00IEtswaXdfVE5u
 zAhbNwNjNkE9V/AG3YhT9sBn9tdqqnCt0jB0CorMesDdV3xvov0kFPnHRshajIxHCWE3OUNvbmM
 XDSDHRoeYGVseJe0x39m0Clhw5Irb2lKsN1TDZNJUbJSsavQjqYNWqWavdRmWgFY+PmLwsEXtP9
 FQeSHKnsfrme3c6buK212OR8M91UV+yhLLQsMehKvY/FpSSPNcU3+ItMYr6GcArA12ivM8nM1aY
 cUr0Y5qStkC14oLi8n0uaZc5/E2K8z+fKxNlMr46wyKHtI5L4494V38WhO+UQPw1LOy6giMv
X-Proofpoint-GUID: TYKeUQVwINmF7JA41i19eNQIzk9n469Z
X-Proofpoint-ORIG-GUID: TYKeUQVwINmF7JA41i19eNQIzk9n469Z
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687965e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=883 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170186

On 7/9/25 1:46 PM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with Milos SoC-based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

