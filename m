Return-Path: <linux-arm-msm+bounces-62468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0735AE845A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8633A662E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607002641F9;
	Wed, 25 Jun 2025 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leSlgYCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3149263F44
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857559; cv=none; b=paxlTYgZNXJ4aUoXPD+NmLpP4r4wocNhdlc649dxW+FcYX9W4Oa095Htf2OkkC/dfgjyk8mYRuiNgRPWaP+8JqW6C6YgalnnCUAs64eZ/XMlBKphxqyeC7zEnoQhVOtr9q51Fvp8V6fTqAIfg4ZmtMFgSXsMPsT6d7+nvtBbSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857559; c=relaxed/simple;
	bh=OLbZLCeEIh/QhsKvBR05z93Lz887to7p39N5x/NgpCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omOzCVopBBl1wuATNIbSdU5hxf3OBpSzbd14m+Lgtzl7cy5fVEWZXq+oeihsAA+nxCaCCz2BUMDj3xxi3nXxXeHou5KRN5xWQD1wPzWrvusvU5RL6DpVLcijcOHdLLAvUQP/oF8cxwKvEHm1Up3OW4deOqEDhjFW4Q+5UbdGpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leSlgYCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB7QrX022133
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=; b=leSlgYCU4S2q3GBB
	1lbhTVp292Jsbnzfu0mSgY8HM9o8ujQDXR2hA0Lr4FXdf1xNMALD5mzetNA+vDkc
	ymcLd2JH60xEunoIq19CPr02YjJgwkxcCdMy6HUtmBXUv2GEr5JFDwR8XG0iaiiB
	XWrw2I0lN3ZJHcg8MLfqhdk+QpWN3gk/vxZhYvrfv+7u+0HCK2NOZPNx0RS9vt8T
	5o7CFjYS4psQ1pzk01QmWvB38mo8lNG651C612lyekzXDTNq8wD3d+OLQEKcXObU
	FB5qcVE3hteNuy6OfEL3hG2RgLEpZP3/sVjJ3bk58UwNwvqKL4LdBEqEddJntp7k
	pl3bKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwx9eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:19:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb030f541bso14518016d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 06:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857556; x=1751462356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=;
        b=OjHsZ0mcXClYY3hgyC6S19KOQBZjZIDSRwFi28QjuygBFQljeW3N/E5DDuNSGAN21p
         Tb1Wj2hewy5XWqkoP7cmc84z/h+ZS3bkD42gLl40szE/QUxnG6TTcdyOk1gfCGXH5Wwy
         gfedo4hkqFKt95egky0kxDpyokhlBLYJRbLV32dGBJKaUC+JYUHmUyrSfmDatnrQAUUT
         zk2W/TlGZXOnGifAhBu+e2qyGitEIaOuD45MLvQoQhAPJqZX1lAbvHZ5EqRfh5KgGeMA
         yu/XkfPqalgUoaKkXHDnz1Yl+if8lCw76Jk264Y3K327Ix0xCsTUSE3XkKZPVk0cti7t
         z6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCV2n4UMCopb/HrySSUto9Nj5Z/P/bE5E2G+Ick5o20A9fV+fBmxZ7fScr0NkAEuue4A6OWfcV5KRctpbrHE@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJz8DDpLOVcUAsbQeWvpaVb8zeqfxkAcAjlwvK6y7WgcAWavm
	70DZL3e8NHIy/l6T/AnqXeRmRqe5BQo/fOm0HCV6ivlmlRZ5ENHQhe0+7uo5z/i7kl24xaZvzcM
	xsMJ+4NplWFUhIDVam1VrrVoyAZZIJfu03UR5Lqc9HsXKIE/L34SLd+1ip+dlvFwnPNt+
X-Gm-Gg: ASbGncs6CohaTNPe1ExZOKz/ugWSNV3z8whspoRpmOzmTg733ib0P3RtmGvnQrxIcry
	k5inAgYRTQoOMAE/vOvUyFGJrSZMRlCyTblqilpAbiTvjZC9laJk99YhDXKFboKDAVmztwYxRpU
	XHT8k3iYw/gDPgAlk+hnVGqJMCHsRUX27hukfT9woQl1mTeeJKIVNT054haLWwMvFy9QkECbbJ5
	7Vu+05wupQ4fwyb8LYqJghkswEYzhZgMmGD+XETsFqVpVWTo4vNMrAM8RPODon85cvBKjwlrWgH
	7zozlutdnVx4MYDEbCFBe2tFyr1iTEU79mwnM7pl8fLj7PYWTszRjQqnuKgbOp+bQ/edEiBxuqS
	s8D8=
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154363885a.5.1750857555855;
        Wed, 25 Jun 2025 06:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqGtKUmkLUVvMQx5KRJ0CRLAplizpPsb2y5iNrRAnX06UrCQE5yCFeuIbo7mZ8pru90VrR1g==
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154344985a.5.1750857550072;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c3ca7b8cbsm1919553a12.5.2025.06.25.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:19:09 -0700 (PDT)
Message-ID: <50fd7271-5311-475d-91ff-03c3c593866f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uLYCflC87dhpzM3ss81wXm63GU-zZGMd
X-Proofpoint-ORIG-GUID: uLYCflC87dhpzM3ss81wXm63GU-zZGMd
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685bf754 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gG0EGFSrpznu9jIhvzsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NyBTYWx0ZWRfX0paDNdpyfWOY
 4if7wWd7yOEqsnm8uSUnhKPXEsE8f8tUd8pxbYGnghFHaU91QmGaq+sap/FOMmhnQJDGLoOVvK8
 v1mP8BUxUvZ15ML4t7niaKnOppZRqra/qVi/mDHfZxSol44NXfTQ/c+ToTt0LADUVrr59tmle8g
 v81mHk+LHApQOjamdBTqx/4Gqs+v+cBfAaB9dWLwvL43MhyfV1dsasGOQCXvnFj9mN6b9TT/FqT
 vmKUKSwri6nla265trLom5lrO+iwAzjUibsKiNPaenOsw4nijaNQmGZEuiBZlGgwI1zCzDa48KP
 IWJZgMC9UrB2nqxbsx5kq/Va6iFHMBnW0E9dAMCmoyk1gTeNWY1KldQ3cS9I7op7rw7XZlTdK9A
 vcgHmRu+51i/glEi4z9NzVh6yI5CwzMg4sxvd59DYbiEAMO3OXoa+JEQH8Sj04XOaeKpLZBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250097

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmiv0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmiv0104_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};

Please also include a 145C critical trip, which is probably the
most important one

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

