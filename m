Return-Path: <linux-arm-msm+bounces-65206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B780B0734B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825563A5598
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6292F2C40;
	Wed, 16 Jul 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljasKkbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2352309B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661618; cv=none; b=rvK909adq2fwob+rFSkKA01nhVaMlf5mIi4+2wh2VZZWOpfAKnwvIM4I63qTEyswBNABA23eAHMqrssPFNz9rrpn8tJX0g04CEyTX15QuemRmk52E1+O1c39RiqXZ7ufVOrRQxEFmAyUGf9Z1kur4M351ZGVFEQ6DiUdKYrcfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661618; c=relaxed/simple;
	bh=dkcnz2DvhVBraNdPkknEde5QEnIQI0sshBOKGYDq0/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXoWuK9VBU9E38cFUbcXABulyj64gIf0Iz6fuPPzKhmQRjdAb2YeV+0aA2RmKMcDTruqlbm/qbRB84gChdofSYvrlJyjW/HMfcL0VY2+PrP4++wyK455YYJtKj8X9CZH7um80Ph7Gk/+p/4q/N5tMlm37uUxT1FDngCy6FHXq1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljasKkbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6PuaS026146
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEIv5Q5pbfuoiy+cWUkNc8sRfBTll0fo56yYG/WZqis=; b=ljasKkbHOwB5hHZn
	chg7RZpzIk5HwOWIvCZBx0RRM3Wnr+WjffkaTPH/R6/BBz4O9KUUZUHbZlDh1NGn
	amZtYIGOIPkIQ+sD2cKWUBoiX9Ym/xdcSiL8KovIPk4HrOsDmRwX06Z7HlOupFtr
	YDUzfUuPPN+kamJOOCh7slUpXv9ayZvEas2CssZL4KD6NDGhmsAnyARTiQlbTrAu
	xgNEnpvMB4DVCd+5+ZiLSHtAykJFFAEAtHkCQ9CfiLf25y/DoXAf78WNo3MVv2D1
	7FvZYFoe5afRfYEHcMSZXIRKIBgb/MDVTyKyKcQj7apPi8sLUbRiFnk8Z6ozMSTP
	uTKk0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca4ryb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:26:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab77393308so10998701cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661614; x=1753266414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEIv5Q5pbfuoiy+cWUkNc8sRfBTll0fo56yYG/WZqis=;
        b=Rnp26EZ21YzB5yRI410bkcF7vx9MIPYpSC7gE6ogGHw9FoTh2wq9xvz3A93n0lflgb
         FbkGqtOh7RJk1pSkfGLLYFHpdqx/dFtf92z80QR5a9ZibF6as+c+GNUDsGvS70dO2cSc
         6GVc0hfRxBbaMwcVaRYngfLAzgJhKPoTluxVJhEAMYDx4ns4nKRVxOvNrsC84PKhIavp
         dHrDG+vKtLuui2rh2ZsnQIobTLmMA120buf4aF4p06Rua2228YF2FcHSi3CrSvk7hNxF
         XRLLfrK93HNmMc0wAe5m31uxwuD/3+TH/onUePkGKDl838/dcNBqg1lJqVD6I5JfuugT
         qPVQ==
X-Gm-Message-State: AOJu0Yw39orsGaNrP3BZ1sB/ZmjsaOZIOwh7ttNeDRT0KCCyuLyODrUG
	6/uVVrO2mQO9GRpZCprZn1GTtNjj2qUHb5CIIkABMSKbeFtEA36Au4Oa4ZZrScWAItV+Zd6ss+c
	KS+KBO43UKwLuQADyRflMOZnl1H18PCPDZvcE+oQLUnsg4bdPvdlodhh7m+beCb/PSmNS
X-Gm-Gg: ASbGncv3xdmnWtJaGCGIIEXxKyHGa6OEWGpv+1CMfLNhnAQ5/pohLwpCfsYNUmdrGD2
	6sIIleHre8k9xH80axE562bqqaaVD9YysqUdoRC7ojhsvlAF4UA+mMfEpy+19cxiWMnAQhi6cTW
	s4T4WIru9YwfiPmEqMzrZecGpz0lOeWPBddZBnii2kxni8OamasQsOoIa6Vszp6LDAaYPZDyQZO
	XsS+WJQ4oB17/5cv79oT68t+mJJb3JW7L+tQe5Gn6plVkYEfvzPVVk5ShpBH88Sucy+O4Q2kEVg
	NTcJFkhHiyWtvx2QM6i19mZDuSDVYTAGYoQJD3tvyh4SMStb+ssZNwWnmDm76alJNEHaZCdS8NM
	L+GLfQqPw/0EeJvkaP/1H
X-Received: by 2002:ac8:5942:0:b0:4ab:7a5c:fc9a with SMTP id d75a77b69052e-4ab90aa14camr16129391cf.8.1752661614046;
        Wed, 16 Jul 2025 03:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS/bx6dHr7YlW34OZ9B32jhEtnpkNZ3+stxyMSlcMbABfC0piVan4Nuc13I/veqJQKwZHKuA==
X-Received: by 2002:ac8:5942:0:b0:4ab:7a5c:fc9a with SMTP id d75a77b69052e-4ab90aa14camr16129141cf.8.1752661613342;
        Wed, 16 Jul 2025 03:26:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eeae5fsm1171801466b.64.2025.07.16.03.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:26:52 -0700 (PDT)
Message-ID: <e65c43fc-c188-4acf-a0ae-c34ad171fded@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 12:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-1-f6f5d0f9a163@oss.qualcomm.com>
 <604a5823-c563-4d37-ab14-e3164f3b1cd8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <604a5823-c563-4d37-ab14-e3164f3b1cd8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5MyBTYWx0ZWRfX8plPzNTdSaOC
 bfY7lRJ9zhfYi8pG506k74sJIAXOKohVTeJzswJ3/CfBWQXmzeNCtuHCSXoKSAp/GIhDAjdC0Ic
 LPfA5fztjj2swCCrh6GpGqWQKL7knB2wUM8mHflKWTwwqlHm//VtKOhgvyAfFyW9kaJ53rivWd3
 FIGyxpGvRT5CedRQHvLaSwSPTXjUTuo1TLHFRhS49CMCYySsXC554CfVsBKYlrdzGyMWAVyvjS/
 froDd19iQnwAshbz3XE8suLpOSDG7PI1Feq9RqCdcmty/yXvOz/KffPzkAfJPcE7SVUGTXCPKoF
 q8Cdbhbid350RY9K1xMBpkpJW2SvM7GiD4ja1YGP7XwIZkOg7PO3fBHP5sT0e4obDXt3eStciCj
 hEllu/BbllMVeuVk/tuaCn6aNuTgULy96bZdd0ZodNCCnz7Xr2QcjPwVwKCombYEXjREKRBb
X-Proofpoint-GUID: bn4cHY586E7jolAeoIeGNtxG0DHc_3lN
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68777e6f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VgApEbnXb6FI9c-La98A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bn4cHY586E7jolAeoIeGNtxG0DHc_3lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160093

On 7/16/25 11:30 AM, Krzysztof Kozlowski wrote:
> On 16/07/2025 11:08, Yijie Yang wrote:
>> Document the device tree binding for a new board named "EVK" based on
>> the Qualcomm Hamoa-IoT platform.
>>
>> The "hamoa" name refers to a family of SoCs that share the same silicon
>> die but are offered in multiple speed bins. The specific SoC used in
>> this board is the x1e80100, which represents one such bin within the
>> Hamoa family.
>>
>> Although "qcom,hamoa-iot-evk" is introduced as the board-specific
>> compatible, the fallback compatible remains "qcom,x1e80100" to preserve
>> compatibility with existing in-kernel drivers and software that already
>> depend on this identifier.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ae43b35565808ed27cd8354b9a342545c4a98ed6..83b09ec1100ca03044c832212a99e65cc1177985 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -100,8 +100,8 @@ description: |
>>          sm8550
>>          sm8650
>>          sm8750
>> -        x1e78100
>> -        x1e80100
>> +        x1e78100 # hamoa
>> +        x1e80100 # hamoa
> 
> 
> Huh? Why, no drop.

I suggested this, so that people who read this file for the first
time have an idea of which magic numbers correspond to what magic
name for existing platforms (where new DTs will be expected to include
the codename in the file name (just like this submission) to get away
from SKU/speedbin names).

We can drop it if you insist, but I'd rather keep it for newcomers.

Konrad


