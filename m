Return-Path: <linux-arm-msm+bounces-87071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 042AACEB812
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78C8B30285C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E643126C7;
	Wed, 31 Dec 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+oINOzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUn2HeNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDD21DFF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767168192; cv=none; b=Zpv3JRXqlX/kQGxwzpIhMVOWUbxDYXx2aR6Xq4xHgbk/HzHtdbeDdgyD3iviYamvNQP9GIbP39OYkbgRviJRqWkCb4OXLFY4huIAoC3NEt3/Ed/rAEGlZH8kUXb8LT6EWGVaDkSQBOb2iEZQX0hDJpTZZH05FaaRXDwPGu9PzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767168192; c=relaxed/simple;
	bh=zdicL5eeF6fmeR+8lVyODQbZZ9BtKk7mL/KD+HS1NCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h80h8gJUcSdeZBCiGdfe0WjdorO+ARwBMvMD2eN/Aau13D3f6clBAk798oanwnxiVg2ynWRQLaT6jfQ3lZ4J3Nn6mo+Vx7gD3xLqZLKuzU0Ir1uS5CWwRDMq1U4iJLEHOFJDCHSxcP2ckL2hMD2KuP6rQnz35O681A3m0vf2l8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+oINOzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUn2HeNX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78SoF2733277
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=; b=L+oINOzpIRCZOcl+
	3bfFW00LCSTog+3N1QYsMa+uOF63Z7XrDx090enhKEIdaU8A8cQEvvl7b6hnc3Hz
	PRLs44IHRCv8Ty5HjsHbWh1BkuYZWaIbiaQJyPvY06irLVLDLzrdDR7X9/MjWCXf
	U0DFR6ZxQ/K/kjRGxbfS8CP9JyGQPoZdz9ALojYVtZaJ4FBpIBibkAX8zjuMTITn
	ce/IWvZ4aJD2OGWsMg1Aq5PMn6iadzPsNXs1GxfI8BeoA3exdSsligQA5Mo3BrW7
	mCkX3g/y4Hd+lyozgHBL2bauGCKuPzRXcUXOKE1gXo4lhSAgeyn82I+PYqdRLPtl
	GuHkzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6ag395-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:03:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c240728e2aso22324880b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767168187; x=1767772987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=;
        b=ZUn2HeNXagMK0b4d11ZX7bv7EsZhejn05adwzJBCFdylskRudTHGmgucvHmq29oyoC
         eYnno7wVru8iZXVxunlhLUo8ep+YbO6TQ7v3Xep8f/jHyTA0QFJ0LgEsPk1cSJQKxS34
         3Ia1fE5+T8mrvvvPosvPp0uLH9t1oc6i46Qawy/Y1iq80WnA6BI7qyUUjVZM2uQTbaCS
         d/QDo2by7OArcGlhFvkTroccLURdoSnMPL0q6zeRKHrXbBiaTVIl+p6FEfw5sdMTwDps
         uo9MTrDn7GDTeM5BMfhJSjnkAH27sAp9OAvG3235Csw1ii9cINpo5KuFv6hAurZ3y5Ca
         y94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767168187; x=1767772987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=;
        b=tMyKDxq6NxSVs2VY9yxlCYfXjql3VtjFqoMUV6pVtv/EPULfbrwcGBvAXveOjgl5cd
         QeVO+cFMJId46wwl1RJaJfnrblZD9QFD6lm2tFb/xY7YOpC/I4vgCbhfEsILFIxVq5sf
         R86WPRInAEEE5L1RLBcXgke8squP242XunEt7JgA6Dz+xAiDfL6WiXakm4aK9vlNZynR
         2g3X8b2OHX1BcW2psjzrR4ZKY0Ru3HrtGzvfGQlOAfj63d1ZSXRA/UWaVx/QyQmjSUKF
         tJ29MQpok7JcVkTMI3yWWTiWc8r+JvdwRzw+GSpdopUKrlHIKFtT6PJ63R5OkKranxy1
         34bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYqczVWdIyjV+8jevxrH8D13QFSmD2XyCj0vau2n/2L0L7LJVjIGgGeY3RDfTdZAR+v2c5ms5gvyvEk1ef@vger.kernel.org
X-Gm-Message-State: AOJu0YyTyv5O4KxEYJ3mJ3HxedXhS4g6zI3OViODA7HfS3QzGxNd+q/T
	TqoiRUKc+JnJVCPJssp8tBXka4gshhXbVx3Qs8Zm0P8PicBXAEJEAt+5YTrJNzR8Rr/EyUIegC2
	8iyd5Ag/CEitaC4X1wi/2l+L1xugI6F7g0SCuZ8LgSCIdQ17TPaWHHv1aslKgqQpYDEr8
X-Gm-Gg: AY/fxX62OpEEDuhjU9TTc93o4QA9UfLsfkbRMGSjjZYfW205niADtFYthK0u36h+hn0
	VBoTcepMOplPim8AS2bFJy/JAkV4IjKrlA5wV/ir3fX9FM5LMknfbSkcOrcP9J5v0IRYw8x7Wp2
	PBeH4dAaiyjrdiveVQ29z9G53uiRraKH/45K34G1Pd/S/kxXM15mqAeUy1+UzbPwCC4r37/52Ox
	ZTVbjr/oe/phe1EPz0gu+9k0aVWr1XUZhWUsY3KA5RDRHvPI/za7hDNBG+OrDS6l2KbAxUpE7G5
	fGuQ89hGqKwHvUFePWW/jrcfI859dAsLtaT0oWk0Izo+rYexvL8spdDV/h2HCjEAX9PMaxjx0Rq
	ATw+2JlbgaXYKjgvqpjKnW+dykbW0mIYRWQ==
X-Received: by 2002:a05:6a20:394a:b0:34f:c83b:b3ea with SMTP id adf61e73a8af0-376a88c8e9amr33020897637.18.1767168186762;
        Wed, 31 Dec 2025 00:03:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRZbftv+BVOvEqHmgpz0Oia3X5rph07ga3tX7rOs+vckFH90okaAgJTuMUkWED5kuM0mO2gw==
X-Received: by 2002:a05:6a20:394a:b0:34f:c83b:b3ea with SMTP id adf61e73a8af0-376a88c8e9amr33020860637.18.1767168186234;
        Wed, 31 Dec 2025 00:03:06 -0800 (PST)
Received: from [192.168.1.8] ([106.222.228.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79620bd3sm29395354a12.4.2025.12.31.00.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 00:03:05 -0800 (PST)
Message-ID: <976006d5-e674-4fe7-9578-a46f6c325585@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:32:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JrJXSCKhVjJBhY_6uZ0Kui8tFW4NzCye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA2OCBTYWx0ZWRfX4JvXSCZ0HcX6
 og1Nrij1qF0D4BrsZ5GPO+z6hKZgwOSMHge6NwbVFMt4X98jknldc2ew4bXCtObeo1h1QeWedED
 VMvcp5mx6PvmgZBCyPJWPn3uJ62LNk3tjN8K5SyLxo+ZOV0Y6UXgfnLLt/SSugzNsY4F6Jr5bwc
 qBIzjmg8rWoa74hyA4XlpS+QaOrexWqPFXWQlcDTu3aGeJjiPKHT5KiJvBbboxMK61Phys1l+h/
 CAGlOfukAyzLDblIiXzorNYPkJLCzHAWgodwYJ21SI9RFhAqNYnQHpYcd4Mh6ZeUus7Bptc7zwm
 uSnGrkHdID8ITh++zNmsnurGTPEHrrMOGci7FCP2aZJ06ZiJ6YwCafkQ/MJlTHsq6q19EwOvnLw
 +qpHTf+Sw5N6iiqNS0B4ISvT8cnhKaivNp95l08u3CvbyGJlgv7idEujoGsG5cHtW8urmKQePZR
 HcApSnX7hszi42c9INw==
X-Proofpoint-GUID: JrJXSCKhVjJBhY_6uZ0Kui8tFW4NzCye
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954d8bb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=BOTrZCw/7mKnJJrTL4lQtw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nYU5dbzxO8IYIpRpci8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310068

On 12/26/2025 11:59 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index be67eb173046f9e4ac58157f282c3af41e53d374..33e33aa54691d38f96e5c76596719691e2596eb5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs615/a612_zap.mbn";
> +};
> +
>  &i2c2 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 7c2866122f9a13b8572fd9e6fa9d336176765000..606f5e234e4a02caaa03f1084336e137768dba1f 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1902,7 +1902,7 @@ opp-435000000 {
>  
>  		gmu: gmu@506a000 {
>  			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> -			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg = <0x0 0x0506d000 0x0 0x2c000>;
>  
>  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>  				 <&gpucc GPU_CC_CXO_CLK>,
> 

A case of fixup gone bad. This chunk should be in patch#6.

-Akhil.

