Return-Path: <linux-arm-msm+bounces-61001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1AAD59B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D22171614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91B91E1DE9;
	Wed, 11 Jun 2025 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku62Iyur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368B1E0E08
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654393; cv=none; b=pPMryAJb3ax6lqopKV0RbCdmKUSSGBEi0fXphgfPEmBAqcCsl/AkHpS9MmfLbuPwBYtGiv2EU4o1BNuJ3D/VmjEypX51vgi5N1NoY18Dlhv/Sr1L5g5PowOsPwHb/sOeDmyAAXsKfXgXYgNzQAW1st5IbAn6F0uCqs13Zk7HYo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654393; c=relaxed/simple;
	bh=ajchxbU7+AMklteL9pZzSBbNZx9h7w3GcNr0Mwics1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRMMQH4uQakmiTsMaV/cBzPN4Zsu7nImvPARejVdLYMgSmFG81iTb6OqTBUUGKY1WvS2o10bV75WyrBpcGTnl6zxBQyhy6aPc978C//HOazXn0vv0jYFhdzbZe//JXpMVthyuYTjn3xzglp0u84gLHV2kjeKecG9gYBJPyGIHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku62Iyur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGfs026050
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77fKbdkYmtPlwXrxnM32o82p7ovrXrSQy4ozw1UOaUo=; b=ku62IyurvRzF4bk4
	miTbSYf251eZWFjTfr6u4uUEDRIOVhUQFH131bvCOhz1uizHvyiGNOTU7ynprf+J
	kB0XZbCw6RrLi5v4IKpF/bZdpbMBVPNr5s2WvBa0q+IGaASUwiiVEWW7IewbJp83
	8EU3/2PTb6mKCS5Ox8dvEnI2EUaxsfGflGZeKcmO5kMR+ZgOIr2VkNEgYQZqYAui
	+C8MfH8+btFfrKcV1sXLxVplJGc1Kokb02gIB70OniLMyh11sezM9VLFpDb4IcEO
	BwZtcJcHRu4aZpXqT5auropA6UsThPHsU7KQsapqdhB7JX+h06NWKIFT+g7nEeHs
	7I1Sxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y87kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso20926985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654390; x=1750259190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77fKbdkYmtPlwXrxnM32o82p7ovrXrSQy4ozw1UOaUo=;
        b=IR08majJHBnA7iqTVuQDJasAfRBujvnOLgehk0BZ7eE57nhtGjHscsEupfFdYgS+aw
         XU/zOSxHkx7z/2GwJ1xt/8pNS6X1I4KlmoS2QRc6B828E31979IFgNlKuu4QgZ3Beazd
         x167D8C/8wrWkcQT1GMYPDvdKPkRb8EaQqusywehw14UKNX3HRpdyl0QuuxGEsfeWozi
         20lfQFabBwBxZNxFu1Bv4duQkwiUGPMBJR3XaUTctlyEksWimpvZlBCY8r4rVtA9+Udq
         HvtCf+Ypd8R6N7c+VWO2Bh8Pmvi/fEsqKK7LlvVUWWH0ThKY7i/l+gAAkNt/35+M1LId
         jz4Q==
X-Gm-Message-State: AOJu0Yx0ManFe62ki89uIWhBU49deXGgFOL449u5AYCIwLnO9qP3fM58
	h0YPy1afIF9I9MuzG5n5fs5f/limg8jD7/P3j2mKE3FLBnaxnCFzcSTE0y7sdxRR8w2Y6ognU+1
	8LcrcD1v4QjJoUHL++1jzzPn3Yeah9jWnyuVoIoBDQpJmyZvbjQOfCywzwgPg6/y3vDQE
X-Gm-Gg: ASbGncszBhuXvxqqn6Ob6t3j0ZzC37nC+bIOoHFYdpQId6BHH4/rESJWnZ+glENPrsQ
	9D6RaLr9jGbMeTSqpb9lyXjmu7vb8D15g0s+NpLCJG6nRg0U68j+9YxHiE1fUzVeicTKZV2XSrC
	khBd/XFKxQc+bMfcZXMMjJxsQ3aABsTGB+m2qZTFtzOWYvg9+ptNOIGGpgfilfHSl5GkrKnqwqh
	8gWcLSXGKaZ+xL1TohQuliuWOx8cI5Y5CSjD4mTKB7bprnN+bQUBI73lKVgwGT7fvSTLsDE/U9W
	IV+bpyw2gmbODkVvVtwnmESejVTqk08dBGvSdhXLDYACa0Ybg0C0xSsnCrlB8xIL0BpXeij3Da3
	1TDI=
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr208043385a.2.1749654389696;
        Wed, 11 Jun 2025 08:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFQcyeTIefOmtTUXQ/DK1/6HF+P0px0MJoBSIH1JUCYT215zZQycMHgB/rDMBR3Qjc3+Rx8g==
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr208041085a.2.1749654389233;
        Wed, 11 Jun 2025 08:06:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade31cc25b7sm832539666b.66.2025.06.11.08.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:06:27 -0700 (PDT)
Message-ID: <9d966b32-d5ce-4262-b99e-900085648230@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250611-ipq5018-tsens-v12-0-a61374a5517d@outlook.com>
 <20250611-ipq5018-tsens-v12-2-a61374a5517d@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611-ipq5018-tsens-v12-2-a61374a5517d@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNiBTYWx0ZWRfXyj7EPrpxTWGh
 inUAslag/4CwJa76r6LfAjg9aYt1UH5dJZuUoN/QRW2yEPYJZiM5MCdKkK+cshz6f3jpFkInqLW
 tc6KP8tLRjjgL6cSkwnt09vm8nprSR9kIZBtv7pF4a/NH8/KvK1yHJfLJUuphlRs7z+fFul4eCj
 +NF4ty02ZD1U++b6hJQi0s2gZsZkb5BQkzqWKkTl44np9QYbTyBZomXzcx4oRkAAlMdZh0rZJbM
 v22Fg16PW2q/mq3YerVSccQHgiy1L7ySQYO4tBE6ISTFw2037h5LIxNw6GWd5h54v3jkJsCtufO
 BOfKqtSUHg3zMLlkJg12CLpuPCkKZFs9e/sh6ELN8Gy5UhoGFUDQaUxKsobXOd5mDoqT5VsEpMj
 0JkDoCOt3H230WkYNP8hJ493Rwr5Ye3AoOgXPKsEi07zoAeQsraaov8J19NkHUkxUvjg/w1S
X-Proofpoint-GUID: b1hVqfacNl-se-dLRtXvOXoDh0zkdiuZ
X-Proofpoint-ORIG-GUID: b1hVqfacNl-se-dLRtXvOXoDh0zkdiuZ
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68499b77 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=TIMhQzKtEeIAjNMpRogA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110126

On 6/11/25 11:33 AM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). The critical trip
> temperature is set to 120'C with an action to reboot.
> 
> In addition, adding a cooling device to the CPU thermal zone which uses
> CPU frequency scaling.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +		cpu-thermal {
> +			polling-delay-passive = <0>;

0 is also the default value for polling-delay-passive


> +			thermal-sensors = <&tsens 2>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <120000>;
> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +
> +				cpu_alert: cpu-passive {
> +					temperature = <100000>;
> +					hysteresis = <2>;

that's 2 milicelcius, consider x1000

Konrad


