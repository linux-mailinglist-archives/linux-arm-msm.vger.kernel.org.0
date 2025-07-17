Return-Path: <linux-arm-msm+bounces-65495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383CB08F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5BCC17C226
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924052F7D00;
	Thu, 17 Jul 2025 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNM8qraK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45602F7CF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762380; cv=none; b=nagxsJbxRo/moLszZGZD5/0VN41+wRA+xbWvZeQuHlZ/gwPMTq8Orsi3UpfGhFzTqr16lWXtNm2pNUAOBvsObnjBCHy3U5OQY6HRpvU2OteBzgrm3k1wpR7liQ5jPzl1bpQcsnvFougLDLfZKGPJSi7qGfYqtzbsaldkzOxV08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762380; c=relaxed/simple;
	bh=A1VK+VUAYmGD2wv3tLZrYHNa/XhbNhwlQRV0o44VqeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pf7BzwFqD4SgbFM/J/fvikxUO10hgHo+xmPqpZgqnTcCFjQyvx7E1UCFQQaa37rVnRabt55Wu6GOypZotNE1GZA8OoH347mmXyuSBXJMIrsp95qAN4C/V6LtFcNOXNtjqWTvrUuNsdDf2lgK3GurjtnRstAsaPn4qT2dpQWdqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNM8qraK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCp09k025441
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UW0SHDq7HM8cFjQol3zMTWFN0cbf4VsE3FOoKzadPAw=; b=aNM8qraKFYw2c3Yx
	BmvuremjN1AniXLdkRm2PrR9i7lT0bjW1el8yTEt49UlpnZEErP/ypNkWsHhc1QS
	RR/gVFkUbGnI4jz42HBV/OXmUQzhpCfCIFy8n7Y0ZFe+zNpCk7MFaXbgWt4ahnal
	Oi09lZ5kVEc7XqGawOMPZjrLX7z9Jzz1qGrb4VhB26nxKXptHPCSCGJ7ojW/myeY
	0JY8QRTKIge8z2jlzKxyeUTJ6zh2bzarrIGkwNBsNn4esGdje/ojfO92/pTT2zyH
	zMpLauHgKfBLoP5pAWQ5GC+e1uZsS4CG9YEIAv/KxhEqc/BNvFnnikdgQ7QiIUeD
	a3ko2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqc5xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:26:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab7a01c38cso2181631cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762377; x=1753367177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW0SHDq7HM8cFjQol3zMTWFN0cbf4VsE3FOoKzadPAw=;
        b=h25nmxPjwWbELAQjLqy27Zxg5IXhD2ZbW6Uj1nPlI8FeCVNkWei+xM/8KbW1j0HfwL
         ksm1CCnWeNs1z1fAo+WSK8B97G1z7hqvtDTB9SB3prke5jFUYp7cSPfOfHLzKARWZ9A6
         U4K9fX0weKWa+29+FHuRu0WsWFo+MfP3CN4Qf+V/7K4rbioHRx67qbejwcJFaSexl9/p
         MMKrCKh3qShj+c8tz64XdlW+S6t65VTgHtrOsA6LWVWZmP3S082JFUPxEmMZs4yp4d0M
         6ONRA2K17urdr8aNL42Wcve0Kxley/4op95UQIrKnmhYBvcJWi40j3221u1BJ67A4JH7
         0KRg==
X-Gm-Message-State: AOJu0YyNpxY0SQG3MuFpyxptAWiRSXqhvcZu/yWrey44UoQbG5LqqbwF
	itJn+KTcwxLS1PHx/hPu+yla/Q4BqWrB8Di/XoPRK1I1JL31gdghzVfqNfLzvbuIgtmuhQCEHwn
	7Lp9gXLlySl8RTQOuvA8Oo+79BsBY5e74QzYv6R/YZUqE/qcEyM6rkFuhHD6y0Whw/r70
X-Gm-Gg: ASbGncv3N/mL4VMknI0L8DTMzvd+EWxhZZnVj3Xuvoane2xWjQN0B6aor5MMylojZoZ
	FH6Jx02NkmUJN6OUi0W8BeLzvAiDPblifMyQmPS3bLRH8aHoGQ59cYd1i9WIzZr8X+noYdxZSMc
	vBj0xmVhhUn+LVizArK7w5kknxCbwgPsslh1X+9bk1rbSzjC/2Rx3jv+caKsEp5fyugml/Fm1to
	BIEsbo6d8Mid2y9mbbv0lhztp2kE5xpPk6dkkORsL/m1mtBGx3cQHKz59keRtZ17CBZvSVglHAg
	LXuaheAY9CNXxSicpBhxj4DeZYo6vBNizD6PDkfFEGOiOfnEQDcf3VtX/pX2QLUY2n21F2CFOP9
	49Jc11PLEjuSVitDmiZCf
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr52125001cf.3.1752762376868;
        Thu, 17 Jul 2025 07:26:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMVUYbi7+xe6s9Goz1ayVoWHDR7708LV9kZl8tV1UuT+wHPjRTXIxBGxsH2MvlnarsySchIQ==
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr52124771cf.3.1752762376427;
        Thu, 17 Jul 2025 07:26:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c70sm1397031266b.13.2025.07.17.07.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:26:15 -0700 (PDT)
Message-ID: <c9d85f35-fb39-4b9b-84b1-c14827f55f51@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8550: stop using SoC-specific
 genpd indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
 <20250717-fix-rpmhpd-abi-v1-4-4c82e25e3280@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-4-4c82e25e3280@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=68790809 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=GvB40MCZoslDJ7jKBQgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BDlc8uFRAcdeXcBMO0V5QbGsKzDoxBVu
X-Proofpoint-GUID: BDlc8uFRAcdeXcBMO0V5QbGsKzDoxBVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNyBTYWx0ZWRfXxKnFK0bGz2PH
 oocmebx771rZmjVSprbpJfKLoq8ItCvPH795q1nWR8icN08/lBpbWNn8BVsOUT8fGGT5rxr6ZUN
 p4ng2HEfm0DChhVhgLfR2P5VsNC9pgWGRRofWZYUV9u4ORzmU8K530ZSR2SBLAii8wrz+u+rDoT
 L7YkHvWxKYELN/IbvEA+cUkwUOjmpMMPg2e0V08NZcvHLa0DHgTatRuDDrn75pe/5KMSocOYwIy
 Nu3EsXVpPRxPm2ow5fW0cI9sqrN37GtewiEqpAIgsrUTUm7FAC1et7/Ol6TuMQbkrkMmxNniGp/
 Daqp88PAA+OrRMk7jTalUmjuiw0wC9aZZJ7y2pWyGqVvwiWFqPpj/8w0/ois8ROixBv8yNh4EeT
 E6/b59WNcQmbMpg/56I6H/1F9Sym7X5+/AB6udgvPVLmQXRy4uFJDMtbvjJdD85DaW4iAyUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=755 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170127

On 7/17/25 2:48 PM, Dmitry Baryshkov wrote:
> The SM8550 has switched to RPMHPD_* indices for RPMh power domains,
> however commit e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock
> controller") brought some more old-style indices. Convert all of them to
> use common RPMh PD indices.
> 
> Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

