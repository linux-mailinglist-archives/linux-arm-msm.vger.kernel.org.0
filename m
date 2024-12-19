Return-Path: <linux-arm-msm+bounces-42841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AC9F85F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0D31890797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611181B6541;
	Thu, 19 Dec 2024 20:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzWe1wT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FD11A0AFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640331; cv=none; b=Y2PbSYxmBsE+JMvmab7ihbqftywS0M/l5dHcrXFIrD/Q/WETH7jbc73E/piunj6F5cWfzRcVEn7lXFlYLL1Fx54vlEL230oepeg5r57WYrxPD5avECewI4Fmuecn5rhV65a+FLdfqAkbM62tJb9e90UpIKaCxRMlV+ltoeJCuYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640331; c=relaxed/simple;
	bh=JnZNj5dN0tWdrd513ocZNlH6XAPltMOpkJb0WAxxZOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULRG0y+0HVajDGXKbESTSNzifEp31YgYK/MxcegcF6aIz2Vfe87h52D1mvaf9gnqzs4ahBdAq2TZrMvCF52b9jA/kBObBG1EFHBE5hpJ4Ax16W+Nlix9mAz6mA5qvXcq/t6JPlkRyJ0Pu41EIkq53tbxTH4JE5pd82nXxKRTRGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzWe1wT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGGxc2011166
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2r7lqqykJ1mlR1GtRm0303qtSS1CFFJFT8nV8QAgwew=; b=pzWe1wT72a0scn0z
	qrzglq04EHHLXi0JXkNuqbZTY/3Bf7aF59RwNTqxaPaLOFOAYScOLmdruyowGSlu
	cJJ0NJ5qwOabr61dRO0hadTlKDYtlbgWV/BCKZqDvch6R+f3dAIE10c0Jq/hWp25
	o7gbhWVHHvdiA0A16DmB8Ngj96TI8JxADKXMXIZVxpNeAAfL1DV/EhUYY2ZSHB1q
	7K+kSPwbLwGkhe2uqQDWf3PdBQhgfkko6CxctJ4SaK4FGfdAb2NSWz1VM2Ob9qu6
	OVFXSWCGJjk2K7rpRvbEW/DtSclvVDyeyeSwsGegmfvRJYhJvgugEHJlgCPioC+4
	wb81cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpvagjum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:32:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6e43ed084so23221985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640328; x=1735245128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r7lqqykJ1mlR1GtRm0303qtSS1CFFJFT8nV8QAgwew=;
        b=PuhozHFrkUAdTYBkhsgLEBcLt/ho9Q7Q6iaS2j9/CmNL74f7BrEEAoT3vyW53M68Mj
         kmYn9PdmRW0rZ7Ih9lRtI/Zn5hkYZL10OCH/HRjiTKpRp1NU6KAj2UuWxla+0BqC/GLX
         0zsaagAacNFvgEIzzUwk5TUvmBEqbO+xKCn5JoGg4aWzwtZ8oUNNJ2+TkoAH2ePW9kXD
         ZLtCHcwP140P4clJ/bVw/9Qc+DWtGKbSKZo+UBtdQLQnL4thW9G8ZsJRIaqFkQh1Fxe/
         cpZbSTR03QCKrYigJAXKjFacdTiLas9FnbJ16K0FmxFQwDupjLi3py27xG+fuaR5KjOR
         MhcA==
X-Gm-Message-State: AOJu0Yyf71UitpU+FROntSeRDp1cv2deec+/YDbkn7FnY7iD0VMGQz5n
	YAW5KCfuM3uO8+NqzvA0uFqog0hV8qTR1BWPEDxg6z0NnIxKUDUDw2yk0nWWKHDOhjpCCShwksl
	B7U4Kg9FDcRL1TiUnoXq7+dBmP47XopKLNo01nPl4IdD9vrqd1jiyvuSK8q+IZRgf
X-Gm-Gg: ASbGncsDrPabEh4j+/xoGijn6pU0hPXU88CNZVSzJUel57dXNf5HXNadXMrn2uzoDG2
	2i+/qqL5BppdIHpAXNuViZXxMlPi4mKRmXYEAyunZeBc50vnAf3rWXUHqXaM2s2AAMiDfW1hUDE
	zKbBBiGHFeZZVfncav9wLJSkFYPJ7y4CqXgIZFSOfKWdZdW7wcRJbS2wQwkPUnkYL6eBWQ6e5SA
	m5zcAYF58zF5J8w/51wIuJTs8tiq8V4nNhVLMonThbdeLK7QYkjlHDEq00mA29Cm5k2I3i06k6+
	iDvPBeoJu0K9K/lrCta2n0GgDdqubHtOytM=
X-Received: by 2002:a05:620a:880a:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7b9ba735bb1mr16171685a.5.1734640327975;
        Thu, 19 Dec 2024 12:32:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr/BT/C0gq2A4C7Zfdib60XQyH836ye8DaMiERcbura2uCr7PYf7vwLn06b5xZzgBUocus+Q==
X-Received: by 2002:a05:620a:880a:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7b9ba735bb1mr16170185a.5.1734640327679;
        Thu, 19 Dec 2024 12:32:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm101069466b.127.2024.12.19.12.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:32:06 -0800 (PST)
Message-ID: <5c1d7aef-6148-4881-844a-23e859fa3d11@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 19/23] arm64: dts: qcom: sm6375: Fix MPSS memory
 base and length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-19-2e0036fccd8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-19-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5crclA897ShH8wwu7EN8Lzdhnv4p-hww
X-Proofpoint-GUID: 5crclA897ShH8wwu7EN8Lzdhnv4p-hww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=865 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0608_0000 with length of 0x10000.
> 
> 0x0600_0000, value used so far, is the main region of Modem.
> 
> Correct the base address and length, which should have no functional
> impact on Linux users, because PAS loader does not use this address
> space at all.
> 
> Fixes: 31cc61104f68 ("arm64: dts: qcom: sm6375: Add modem nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

