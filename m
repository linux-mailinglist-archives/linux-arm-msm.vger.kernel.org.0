Return-Path: <linux-arm-msm+bounces-49547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B5A46862
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 18:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 511647A1BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 17:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB4F229B10;
	Wed, 26 Feb 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpRBqUll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0E229B0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592051; cv=none; b=RjeBT6uY2jiUOUGSHYJRc2Ww2OUUID3jkXpnOXIHPB0JX1HKztKVNmrnhfBMzKqoUPZxa5DYsNzK9vx+vsmGdD+WDcX77XmDLZTzkWDY6m4ChW7P7Oo66labRPh1StQ3J6tzEi5aXHB75eqwAhkZAY0cs6WJ0pZl+62r24MQLWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592051; c=relaxed/simple;
	bh=yx9HBoyTT64Je0uq82lxBgoaFRfHMn+wHZXRSMyTEQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIYCIVateamwEZAXBIv2Ui+u7+sv/AQmXOmhX0N/K78JUBZDlt4zFPJ4xkIIV4S+nlm4DVHK3g9Yto8eqEruhsHtqQfxAtyz7xVUcYwe67S/M3Hr25IBAiAA1WinKf92AsogpmojaJpeOaXBq0WOZLwBDgmXRW4q/nO63SR8JOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpRBqUll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QA1LcL017600
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oY1wcKisWOl4v+aKxLtrgUHCu5Y3zouC5bBt02O79o=; b=KpRBqUlldn12lwci
	Yl/kedKoLKajqP1yXSK8mg/Qwv6/xuzS0eZx/gg6cn60a9PbELaNGRWlqojs2oOu
	6rhCYYT4pu4OCdBFHMBFE7kxNQ0lcwKtd4Zz1kwy3S92Q17n9FFK5Vx7E3zUqhxB
	yZEQWGn3vuiv4BG+yPVS/OEc3UjinnQIMbUmwiind+KKP1zESXnunLypNpIRqq+3
	26+Hti3sdlYK7hsBEgIAG+Gdp2ud1zf3hHuT4zrhxHBzAk8QgYRmHzdxsnFHPr8X
	XNXxrbhOt7E8K2IwdHSuh/NoqW07J6b3+4xf6RnI62Q1yzSR51Lq2Ne6yRw+ArRT
	We/mbA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn2u8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:47:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e249d117b7so155476d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 09:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592048; x=1741196848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oY1wcKisWOl4v+aKxLtrgUHCu5Y3zouC5bBt02O79o=;
        b=gwsucpdb1FdFqU1JaTcvdU3XXm/uniH3rzbijGS9+6RpTHU6qnjjcItW6LAGyZETR2
         9qoxV/vvTmgs6HLbtNQLhfduSAHM2nPsSFH7rt+SMyK7ahYcAW/TJzqsm261zZiSG/K1
         Nax6HS9/Ic+pBbefiiag3ihumnZq9/BbjsP9TFvouot08HbiqK2mtgUMUQLejHLbDMYx
         X63zjRbHlefuqg5+G73awWcyBopI5eRslMx8O1Sx4f+tSR5oDL7H88vGSyRB59ZsB7U4
         CwGGBwp2YXHDbfGqfQZpXz5rVipjTdHyTJb75FghhNf6dxMioCrOAqWRWu87m1AY6aKq
         FUZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdlgz2g9/dY5Ebl7u/i0kD+Z/TTA0+AL6rBt1kHkC1XNnCA/+JnHKtK1SGvXafSByPNls2IjcS23kZw9ur@vger.kernel.org
X-Gm-Message-State: AOJu0YykgmvmER0y4kFLjMMlhKb/SGto884Iqz9PGSXMLHeD113a05Mc
	I9g6Ffym2yntRtE9KvwbnNPXJCnag9g1xKE5UG7PbFPXiMBV6uGRHndG0CfVdszUONmV2XuhhSH
	kB5cyqsnCd7gxl4ZqbIudh5FxIQH84qDzlrkltYvci1qG4LekBrzQSX+C5tU1HvCj
X-Gm-Gg: ASbGnctUDWqjld9FCTc4UfyIp8H2o7llaiglFdogysEX/v+ugCbShO3U6Wl8sGh8ZYR
	2tI/oLDooGf84w5/aFEeDwmLlbWRNnJ8/Wfs+uQd9vMIr1Ws4/TJxzeXb6I7mtbX+yzUNz5qCIo
	hw9kAjtjMIQGdn832tTRRK6BVzodUC/emWWpJAMZvKDjCMNiMY16dNgIntgsGdPhRDHzxweV2q+
	sHnK+i5CtsyW9e8J0Z//K0QMYcowzlSJl+jkYkXQotlePWZU8KSczBM9ZGCzvpueOghOrc70Wph
	DEDRSHbGWh/Z9Qf6xL+2lIp/4OVJ2jgwhK8lB76cI90LOqOXbua4LBajQCgIec4mRvvnog==
X-Received: by 2002:ad4:576a:0:b0:6d8:98a4:cc5c with SMTP id 6a1803df08f44-6e6ae5f3142mr113399106d6.0.1740592048143;
        Wed, 26 Feb 2025 09:47:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3IU3MTjaiVctOk855G6e4ouS0ZCxqdD/RFoz0LzUHhEO0BvR1rzcfjcWWFGlZ+8n3by4XZQ==
X-Received: by 2002:ad4:576a:0:b0:6d8:98a4:cc5c with SMTP id 6a1803df08f44-6e6ae5f3142mr113398956d6.0.1740592047859;
        Wed, 26 Feb 2025 09:47:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20122b0sm370019166b.107.2025.02.26.09.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:47:27 -0800 (PST)
Message-ID: <e2351938-6def-412d-b22b-6f7a7810ce46@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502
 redriver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <20250226-fp5-pmic-glink-dp-v1-1-e6661d38652c@fairphone.com>
 <696aed52-7519-4351-a3f6-7b86778b18c3@oss.qualcomm.com>
 <99ed4a61-6e0c-4743-91a1-2312152ccf6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <99ed4a61-6e0c-4743-91a1-2312152ccf6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _uwj0wCJpYs3byFUeayZPjY9ckk6BvKz
X-Proofpoint-GUID: _uwj0wCJpYs3byFUeayZPjY9ckk6BvKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=828
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260140

On 26.02.2025 6:45 PM, Konrad Dybcio wrote:
> On 26.02.2025 6:40 PM, Konrad Dybcio wrote:
>> On 26.02.2025 3:10 PM, Luca Weiss wrote:
>>> Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
>>> redriver" found on this device.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Actually, please also rename the redriver node to redriver@

Scratch it, that seems to be used for dumber redrivers, I can't decide
today..

Konrad

