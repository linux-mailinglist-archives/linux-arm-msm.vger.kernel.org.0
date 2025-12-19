Return-Path: <linux-arm-msm+bounces-85800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E5CCF14F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD873010CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653E02E11A6;
	Fri, 19 Dec 2025 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nalN/Mu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iukjX8PD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4592D94A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135331; cv=none; b=b3sCwsat7XuHtlQChk6rmQdLyZjfWBzzgUAsVGUdh9o2YmwqDADtzSm8qPFgJhsGpqSTqDgs5cmFT4/jVGAY9SJndhHgg7khS/N8agULqFg4BWdZ+9xH+Xs8m5aQqvW8+K1YdSE0YbfrE4w4DuLxJd20AnBYXdyobyD1aZw5m5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135331; c=relaxed/simple;
	bh=Q5bgZ4p8IAn7/5r9WlxxbjIoZogdEbCHjtIycxKfrbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pClThu9DWjXxxrftvI3wxzfjxvl79t6akl9yd0Hs3eKFKa0Qt70xYZJ9FhIdcMAvJ3VB1sPcJ2DzxzmyZJMaLzDbj4hUyQVzOuNfUjJ2BRqbZ7pqgaP/1TEj3ZKGq4v4uw98SRG4o4+Lnp5qI4hvzIp7L8p8Rji0sx7gqGVTqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nalN/Mu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iukjX8PD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cH1R4154669
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=; b=nalN/Mu38iLsFkws
	k774DhFtwi6qpkwlbTFCRVd9xWeErtajIC5nGkySTAGYZWAAFeO5GTyVF19e3nJn
	G/EUny5xF1+OhEEJmG3Yd2YWs0NHmepk+U3idNmu/CVZvjJJ0Y+WAzDWwElDdu6I
	sTES0euCRunW8Xpmmpsulbg/7fwrQ22u8iL9jmLmYn1D+XhXuJnZPIYMFc/XS1Ih
	664TGNyfzYNRXKHkbAxqzgmahXCPdX0duHoVdJBmcvmHEXiNMYisfBacu+js5xBU
	iFR2zhrDybjBeCoidKnGtneXVmP4UOigumM3JOGlnaXRaXm+mYrY8FON98OKBuBH
	y59XQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct1gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:08:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1903994b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766135328; x=1766740128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=;
        b=iukjX8PD1NbkL/+RaIEcvxxjONsZgB2HLEwXedqUjO8496OtVBPXrvWhDA1Wy9PxuF
         dEDwNt4X8WNb+T1DoS5ag0DMqpVVRYQwueML/0Kr9RGtTntvTY6Ynzrt/MOfGLcYkN++
         9jrTn9rIwTMtxWY4YWYJiZgG234d0qND/Yevh6LNyqwQfyyidlFxF+/QTFemQEQGXpUI
         8ZPbt02IG1ZD9X4pzJXIw2bLf9PVqwC5WM9Z8w7KvrcDRsufYUdWlDggia6QN25dgkJk
         3jq1DLIEN187PeOAKnmBzlnwRJHQwfAlButuYRASwuU+grlnrVIKB7MLurctStYIsaVc
         3vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135328; x=1766740128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=;
        b=V/gTNMPcj3E8nh7Q8eBhmPOnOOAmEhLkICeXcY5dCZF+s5k3jwPKGfaByTaJm6tygk
         1aOssouN4ZeZEPImMNiJ/BjV8diDQGThridOIYAIpr99vXKdt3cIs5cStNRvTMGVGKru
         bWNyh0s62PwZhLRPr1e+gIuqD2WK3jYBCaPbwOJD0Fz9hgvXs4t5ZYD+jbJldbqA8jbW
         zkAen88jmQARVYFDW7lcygsBwBYfXbWT0cm9GMlpB1MQjgQqwqPFooSSelK55HGhWjtY
         znEz1cyjWPQJSYjpRmiU5EkKPaoaC4e6k2iD/hCVuE2MLXWhU4eDJ0E9T0itgcNYE++Y
         qTwQ==
X-Gm-Message-State: AOJu0YxvNrJRc8OOZrIV+DuPh2K96Hx1PWh37IS2dldWMoN2B3RDXXMG
	Lhxx372h9QgD+Mg0n0lTxsqu9Om27p4z2wfxI8WFkCGqnkblx8+MlSskh4FgmiIGLo+1x7//fgi
	2cFqVnHu++Yxx8QNiRe3ZlBePLyZSM0jGghJ/wTg+O6qxzmM1YrHDlobtfs0fi9vzgTd7
X-Gm-Gg: AY/fxX6+wiYwRsqw6Bvgz77EtgjVTCW2qsAxTHz6WC80pshIO63UUO5G7+kwFNudU74
	WY9nsnRNuRjAcO5QWO3XesIevfgFGmtcV+f8z43jF6bMreEKE6Y59ymZZ8eD04g4VuT8veJmAhz
	k86aEQYyq1WvUmQWJwx6ZUief62UnuX9MYkrZTyWW31jbEV/XpEp4jaFMH9pdZf295p/1NPs3xs
	Z+AqbkKdiASg1lIu2tDV/Za3eyywwEaQcc3co5xQ86QLSN312fc/6HpYbiqjRSNMdJRoNcf2+7+
	2zpECZlAdmQ1K/+xqWf0NRoDRfzwBMrGAgWvZ3Av/aRwN13uh5RDQQVIijlwH1/HaT3PwRjTOAD
	LMedwcfuyHRZeZ5HcykdDZPqwMl/eKatmyp7PjIQjb5JJ/bQXMMEXGaHzTU46Iq5SjoLmLEIpP3
	w=
X-Received: by 2002:a05:6a00:90a9:b0:7e8:43f5:bd53 with SMTP id d2e1a72fcca58-7ff6775a108mr2031742b3a.63.1766135328306;
        Fri, 19 Dec 2025 01:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYhdhSA25dW78AxDFhfOSqctQebu3ghrLU5jc5WmQr/SGJkXWUVcnKcjF7zT0SVfuW/UmMSg==
X-Received: by 2002:a05:6a00:90a9:b0:7e8:43f5:bd53 with SMTP id d2e1a72fcca58-7ff6775a108mr2031714b3a.63.1766135327725;
        Fri, 19 Dec 2025 01:08:47 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm1753931b3a.64.2025.12.19.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:08:47 -0800 (PST)
Message-ID: <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:08:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: If4JDw_mxMeX-GwrgSLStiiUKIGQHQi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NCBTYWx0ZWRfXzL/7qoS9T+jh
 pyqzGRkfbQgKYmgWxDkzG3epdFfB957NkQKY3649Vr2LWvmILh6P6sDsbbwNaV0z+BROMx7gyaU
 OoVKXCc+5IM+ks01FfYlInozoc+r+32F/93LqxYLI7juHxPoeTaN9MqJMWOCgali6H+Atjv1cND
 PMkIx6v+drSplHLSTVUyXs0Jy47ZqhVRhwLkqiUw3BaRuklq5KHHpHXTVCxV2GQiktbtxk51eiP
 LrldIGrUjPC3vsJPrzXLd7K1SLB62csWaapUOo1P5ODnm6/FCo/I/x3vNWY8zeQMikcaxB0TCkE
 P/j2POQjC+i/qWC5Vjv2js8MqKctd54elwu55LwoYCiJtIen0xlleekMXKb0d1LODDXI3HLaosh
 HLIMCQkxW1cslfba7xh0WD1LQC9gvfGAxeGuWu9cY7vluIMH0WA9lHICsP77eqtbWZHely0Nu50
 9/EBJTLT4MKUOMZVpsg==
X-Proofpoint-ORIG-GUID: If4JDw_mxMeX-GwrgSLStiiUKIGQHQi2
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69451621 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190074



On 11/3/2025 3:06 PM, Jie Gan wrote:
> The CTCU device for monaco shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for monaco to utilize the compitable of the
> SA8775p.
> 

Gentle reminder.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>   
>     reg:
>       maxItems: 1
> 


