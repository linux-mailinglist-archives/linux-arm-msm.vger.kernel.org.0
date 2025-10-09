Return-Path: <linux-arm-msm+bounces-76649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6BBC924E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 023264FB44B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9052A2E62DC;
	Thu,  9 Oct 2025 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLRg7YqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0952E5B1E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014501; cv=none; b=K03H8Mhslpem3/V3Nh3+vnrMlzelz7+89YWzfcH34fn7m4eSnKWDsHKhfMHFtOBscBcx7Scqh9bHi8SLB8zr8qX7JXxy/tvQBNMNvxYJ6OLoSsCzN7rX0eHpQ1JnCQnKs6D4pwjNP9l1o199FNdJuBMG49EatEzuheTATIAlcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014501; c=relaxed/simple;
	bh=L48gd4bUY0iY0RmLNqg8Qnr65EJUPqeXnSrEl3McFgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTa7amuUAY9ADK1zt1+b4c3j/PQDE60Hxyn2l34jBwSK9rAqlQrWA/VPW4OnxzT2xtszgQqKTT5y/F28zaZtW2Gu/dT9d1WKTHX5ZixfzLbgkINU2VEsair1Gma0m7SjoDRXWcbeP4Df/PipuRXiogzwF08eAmhCpfuq/4vevyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLRg7YqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EKFo019202
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 12:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=; b=SLRg7YqFiIrQ1lPE
	HxPLUZq3yZZj8Q5DeiJi5m6x4PXLMRRhEwrZcCpl3ttbOdGECbfQMJBE5QE3VsxA
	iCKo8lcK/4cCCC3y4P8yBOC3F5VE7F+IIjWaJhGMAH5jv/QPyiXaAerm6HXkVuh1
	51leb8oUthYCfIVHO+Ez6G5i1qwMotkesJOZ/kHyJ0RAZ0h6dirMFKBIetPLCzQj
	yqbwqUsDpgGf8i5CE9/wRO/5ozxn6IYAHlSnhRLr1kd8WEutwtv0LeJWFpZRV6Yx
	Ca1dQOsm9kB90uHfgq0OjPp0mOQCy2d9EoHtYft5SprMcN8iYvJ04CAkOy8vdOlv
	JkRBcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntsxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 12:54:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd729008d7so3501391cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014497; x=1760619297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=;
        b=eVb1E/8fD7mYSjbfMa4AHh40tBmA0bY19h4lf8rhJpDO50OdTGVyZdrr1Z0C43G94t
         VYu+6Q88ytxz8tEIUjpx0EXsva1sZBuwQ7df3q0qguefjWezRJ+pY7ajQKrDg29kGFRN
         kUjpD+X2Ul1doXKhYrGszaPURZIWXW9mflZH6x6m9sSa+/yE0LMH0Qxdpz72WZ4KR2jG
         //iK14aAn/oCgv2VwuKNQeqvpI7XEVfjNUIs7beOjAWplk8cv76iXF6PykyNfFgMlvpF
         1YFkvJZWN3LTBGRE2moqn0W1/PCaXW9W8UQGPGgbOofViddHvOtGYXFV2EKVYmMpHkZk
         mqLA==
X-Forwarded-Encrypted: i=1; AJvYcCVb6pIJnQagnU7+Dk1xMIrVPwkMke8EdblKF+SyZoIRtObmi0N3pRSb5GzNgdvP8AsPltXc25DmxKmUxhYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMnAAo/fDxFKEpd0pXNUbAHbQ4kWurMXxT3YsEeBHAGf35oRg
	ZMZvmZ19if7d+xMNBniLVOOQh8EtEj7oJ8188hMY3kd0SXYkOkGoJGvHlhTILGLOH472fl46OSj
	80bUxd4knLvT8ozyCyvilU/rkCHMVfuP+XBeFFTcTWvdNPoQ9JzWXmjSdFrBtQdJ50xoy
X-Gm-Gg: ASbGncvcYn7CBkKPifqezlgbMcnzJv3ywFo8Jobyhz0mm0T//rFI4SNv+ypn2ldWO5X
	qBbl689qMz5teIfJaPaab8rLmvA732EOGomebQJUfrxkRD3pVssr//N/k3XbSTLyn+tZZi37ppW
	YF9+2ZLP7Yg/JmU/jmpcNnNMNdXPHaS+VhKRjx0erQErWYboMimSO1cSGjGLDR5gf/rGgy1RV6+
	W+oGEhOwcIZTldJY71Usu7vgFY9iHOSycc+X9qIJlvA9HPquL699ri6wIQwbs8j+sJ6YnxdbnqG
	1h7rLIapUhrhCIl53v+5EK/u9f5FsFYOrF0lqduY+kddc/Edw8QRUN7qnix9YcagJ0xXpMKPyoc
	W/n7DOId8pXx3X5f7SqUTZR6JcRE=
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id d75a77b69052e-4e7046278bbmr3443521cf.4.1760014496720;
        Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5/sWgll0CtsSoWnbnw8OuK/4gzjMQpFI0vobMt8d6Sm2EXkMS+OFvldQCCANHXNk1w5jSA==
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id d75a77b69052e-4e7046278bbmr3443201cf.4.1760014496195;
        Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1926375966b.2.2025.10.09.05.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:54:55 -0700 (PDT)
Message-ID: <6b9ae65c-08f0-4b13-94cb-b899764bfc8c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HJGdz3ZpCmjwyKYeP4PKk6UKzVYW8ZjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3FR1dK3sUjSr
 0ch0nNiNSrlWy0Vpb1xCxcdEbXVU+KpWld8+lCxfrWrpE5ULdA4TYlwo4gw9FOUBLJXHcBUzNaP
 ymONHtBDZnUx2DJq7GDBRDtIFiei4VLyo2LRwVmMOqmsDc6LkF1mN6epqKFVA6N/VBbfiVAeGC4
 0z+JtkB2f4g0yVSpISf1YHRlqVwx44bGi291XMLXJisi29757AFM8RRErDpyUetKewjEvIM4B5I
 9K1RlT0jBS3GBm3DTQmPvpnnad48zX0aaXZ3xci2IwIO4vkiqakzNesmTipkUR5ZqRBdGvbSShK
 fRBQ2uwhTKT9VtOaiMb743TbCIy/CcRJq8cI+5syr/3a1CKhRgNUK79oU1JZeODNlQZVgUao5N2
 YVJBZzqYabi5l6GVACNENVEDyC7f2g==
X-Proofpoint-GUID: HJGdz3ZpCmjwyKYeP4PKk6UKzVYW8ZjN
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7b0a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qaMgwUmbLaqo04ox7REA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe panel Tearing Effect (TE) GPIO line.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 1cf03047dd7ae..75989b377f8bc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Wait, I just noticed nothing consumes this..

Konrad

