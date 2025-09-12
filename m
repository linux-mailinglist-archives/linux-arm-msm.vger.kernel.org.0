Return-Path: <linux-arm-msm+bounces-73302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E776DB549F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC7D16858C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AAA2EB873;
	Fri, 12 Sep 2025 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAaTSjso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE822EB5B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673333; cv=none; b=ZAq7hAArLT1ZZlwlfCYLBr1SlYZ9YeiqIWVJOAlIiaO0KP2AiABAZOzlegIOeCnSKHvnL7HuqfjUM1faO03U3rSQUDgZVaY/p0fU62lKMP4QAnh2sBgDnXlB7BKsIrrBox5gK5Iizr3Ag4cgLEzhd7yj+oN7w3745eJ+7Q7UjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673333; c=relaxed/simple;
	bh=F2J/WOMUIDKt0odwsujIr9y4bdRgOyT0k3wbiJ4PmnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/9hEpJ3ns4T2/BIJbxmrbLtH6c1cC+aXXr1kWPigC3GGijBNA7e/EBYvs/BAIxYJBIEvdPPs29VZEwCpLzMZctWwzDokxXPxdhoWpP6H9LfEs1s7Z/R/MizB79Z/D2DVoMLIuapuxfiZuKX/5ToQcMfsWsrFvIV4gWIDf25uy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAaTSjso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNfR023361
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eO/e+l/CKShPfSEcMaT0/WcOzQwZszBr5+oyAnsYffU=; b=iAaTSjsoQl2M7MbT
	x+OZy9YORdZ1DTrBo7kMyQVQUDWHAsM9D64LbmKYdQb5E2K8f7lUG3B8YTzBeJ8E
	lpAfzaS7TvnFIGSOcco6XSPUaZ7d2lgH1ApIJiuoRmyZt4nC+Ijz/NYNJBEEB9zH
	fncLyDnSSsgYr7ADor3XpDr/6e/EvhXap6SYT4xKNyOu+5XlerV+qHDhy+e8Uoyh
	tpfgmx4cQ+YQyAeKxR//RPBFL7Mv7CWXX7V9bGP8WLgLEfu1hS6FFpfe8Q51QOvN
	BDhhZT8L9vToyfTywV+abR844WnI9Qnr86BslZSgEpTzWEr5lD8hvJjUAhEma0dw
	2Fa9Wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2f97p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81621e5b962so44575485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673329; x=1758278129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eO/e+l/CKShPfSEcMaT0/WcOzQwZszBr5+oyAnsYffU=;
        b=iXv2zkWh0UQq3NiZ2TXDoBX77tGispD1SNM6n2hjpUSmFFHdaV1h0sjkuOGYvxPh60
         PRJ2KTcPiuMI0dSRx1eNbzFZfbWAoCvhx3RETknDxElb0wTQVTp6iRA8MS1DcfJmfq9y
         S+KHL70H0VeU2wtDhB5YloxeG0xTp3eOdAnxmvTCaD0uPpZVL/0GYTHO/iDN1AivavL+
         MpKIAhI7/zkB31X2cJr025aTNcscx9Zi7xED4Q3zaJ9I/Za0rNIR1d+M6fbeiXBgKG/x
         G1iEeffNR97VXRwTMlf8rYhR9Oqp/13+yYLoB4nlOthi0QTnPLV7/XGWHUWirv17209b
         hi1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0ffNhLuopbq+XPKzoArHFPNa42/kPE+wFFpfMDDn5bWr7WTEXWlTjAML6d43/jE8Mq/6jzVFh9EhQbTRW@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpLnIsY2hXm0FxKOKJz9SLTl3Moudopshm98zSGzgMBDmDjbJ
	hoaVVVNYhTiHYW6DW7+t+SVrOtGbH6hfP+TgofBGC9uENyReZc9UvhT75C7PnI0fcW0p2i/Kll6
	bcFscH1myFEOjm7TGNH51stG2bFo9o1D2++RzxWzE5p9j/nXJ+WHoXP8k92JjUxPPkdaJ
X-Gm-Gg: ASbGnct0mZt7EuIAsSBNIeZHgXU7PTNzYFRK5GIA+rsTLyhsv/PmNGrzAo2yTHFmhsX
	6X+crmDsomrzOq7i1jwWiq4bri++l0bH1mEdTLhahr5IeFASjqUEOrMccOFgrSK8tenKEEx9Hu6
	qEoTl8d2ROBAlDhol3FvJE9M49qtEeblRioXL92mB2TGrF/JN/fxhTgv9OdKX+3fP9nOFNlERf/
	3I7NTnGc1MO2EbpkO/7OSzRUgsBRjI0dg8Ofh+T9L9bXZJ8X1/v0gySdJmc2kDq2YQck0tCMvr8
	RBwVXztgRn805VrNt5ZaYcA5wbX7ecgfiURy1QjRosbvMAYcdkp3WDOp8TNgPYQPd1VFO/9ekQ1
	Z714t1CFdVs8rH57utkeDHw==
X-Received: by 2002:ac8:5f8f:0:b0:4b4:907a:f4dc with SMTP id d75a77b69052e-4b77d0663admr18554441cf.8.1757673329620;
        Fri, 12 Sep 2025 03:35:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfE9aSX5jRYmSD+qAkDx8+iMqyOs0HY4gOzw34wCBSpdGtsMNfwQNLGwNQ2O+3yFtZ66JIKQ==
X-Received: by 2002:ac8:5f8f:0:b0:4b4:907a:f4dc with SMTP id d75a77b69052e-4b77d0663admr18554201cf.8.1757673329103;
        Fri, 12 Sep 2025 03:35:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da388sm344070166b.22.2025.09.12.03.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:35:28 -0700 (PDT)
Message-ID: <0f8caa5e-7d3e-43cc-9ada-612f5839b407@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 12:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm845-starqltechn: remove
 (address|size)-cells
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
 <20250909-starqltechn-correct_max77705_nodes-v2-2-e4174d374074@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-starqltechn-correct_max77705_nodes-v2-2-e4174d374074@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3f772 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=v0bTi9dDIlVGPmSQrtoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TsVuvtRfDydTQKAQ4hnbFfUB6B8bbeZM
X-Proofpoint-GUID: TsVuvtRfDydTQKAQ4hnbFfUB6B8bbeZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXzUlpIKgwSO/H
 dQG86WlBE0gcTFcmxX7Zf+ZrjSM5ZyjWRRs3fJCHHlkZN9PP/h+kLK6aSSEvoxZj8uhoCt/YjBH
 Wn3WYqeLpUNjTlHnKej1mOB+J75CmPuPjTy5x/PfhcPg46C9+V3GBJUf9NmhMQNqPxV3/cgGxs8
 ksBSB7Pmdp//PlfH3Pg5e+PQVlAkivPHlBqjw/NmZD3s/Jz82mldDvvMxuBP4/TZIXlBDWVaWnS
 rHcGXN+nAQlSN4cY2sXa+Uh4+CsWoK0dd3KEniRw4gNulMM54b9TnSsf1T2DnK4mW/guG9gxpKf
 GbzeOQ9+tbReKKjf5qz0ictrL2KdJfqaL0gmmTihnQVZ86mG0k/tGtbpaGah2ONNeVgrFraiUV3
 S+b0fu3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/9/25 9:22 PM, Dzmitry Sankouski wrote:
> Remove address-cells and size-cells because unused.

"""
Drop the unused address/size-cells properties to silence the DT
checker warning:

pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not
match any of the regexes: '^pinctrl-[0-9]+$'
"""

Konrad

> 
> Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 9eeb4b807465..8a1e4c76914c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -591,8 +591,6 @@ pmic@66 {
>  		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&pmic_int_default>;
>  		pinctrl-names = "default";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>  
>  		leds {
>  			compatible = "maxim,max77705-rgb";
> 

