Return-Path: <linux-arm-msm+bounces-80099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9636C2B8CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474633A8422
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC40306D2A;
	Mon,  3 Nov 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPUQZ8sW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3MCHhvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698362FE04A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170898; cv=none; b=E3JlRZWfvttMcSfFdPBde7IUJa9n7Jgl76IKTOVBriz1Tk7OBkonQJak7IOEIFo3zVmZz1MBPSJ/w8xbkXjJROJVjE+AoxIelpw7SxCnxFthICxQwifme2BRA7gNeRRN9ADYEn0JZ4t8LXhkTHrxJDGVKk9YbapPLMLFKekMS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170898; c=relaxed/simple;
	bh=kymNW3xvi1sY3bz8PVTKGKJ8R9T74mxEzswK6AeZ+oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4zjsXWr79gJfDqLLXoiy+wKFvPshuMQkmm7S32VnVDCMvBQlZcIxggYfELHZuq2xRNELGaMN6I9L/c6RU1h1lgIeiJwdUnGZOWuUcXDXsWMFYWF8mSTs7S6ztptWK1P7V4Fu2hQMF1/v6B3GdUGs0IGuS17ftRe3sy45FoDVJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPUQZ8sW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3MCHhvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36IkY12247306
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=; b=LPUQZ8sWqOiyTluv
	YCLmfyLYcLyPYJ/m8b9jvJF9GvfzefAZYZNx2oN5QxqjNMopkNS4nCsGOFix6KWT
	cG63U01NJ0MEwNLMEi+u/rzf4EYrKTKj8JSXxIskmfkJtw3rdMcH/HTFR/FbvyEw
	GxIqK9se5Y1IM/bBO/OZqsYpsvjkf48kRPlyD4T5AzzHV4rHG1MoIU9evzXqUi84
	8SxCZuyUOXex35AAkuBJFgOdmWDMgXyP1pYZ276BPfakRdGBrVDh56JHEJe/UG2N
	kvrm0+aNLW6R2VdYx6hL2M4W0xC3lFNImNt+gMa1DwbmQob5jTjdjjgE1wvz2ycb
	9FwiXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6q0yh0uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:54:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88057e35c5bso320326d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762170895; x=1762775695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
        b=J3MCHhvYMsNaWycXWruWNmoZB7VcW0i52GJpKjOhyVShOVz0kD+TKqWN8xOmpL9K4k
         WwIlMZJqqjWH8meNzeGPGbjor7J3E/k36eHuYCnmCMbYu8twljyLIIoL8IKv1sqepIzg
         DTxaakA/Uf6ZodBNSu/Sr5OXr8kChFWlRMGbchoN36yQGjP2pBNGNzL/lvbV3QLXevRB
         iJIe4uBGSw4wbVU5rwfB5WF4Dc7RDFBwL9tr6jxK1OAOxPH/LMKmyJNMemefq0fFY1cl
         nws02TeZ+U369H3WYsnF71aqk/5PeN9Czip+J6enpv9aPOPqBEpFcTljg9vKvIGi/JFZ
         3ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170895; x=1762775695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
        b=vqi1b4WGFfaxO0d5iB3Xm+b0/X1OfuEc7z8e8rYTAw+v3pVHQVNEWTUsIDlttPfa90
         sW4wcyjbvkiKJQZ3856vZw05MgVy9ZrKv3ILkJQEeLXwJ8ZQrWYD/4ve6YTIaPOSK4ah
         ugAd0op91B/4PypufqfULyDx4/2PkWkv99YeJnbm/IpG9waQL/c5l/meiuZ8j0rNz2xx
         aMR/AKcYGuAytyf4mJnBuJgWZHPEaAGOAF80V+3QM5jARNsQuysqthkkiGI/JWrqcZEp
         bsOJ+KbrqnSYLRI/4h+j6xY++hjZU53ulIj8PsqP+ULnElo7pG6vmYI9Mf81D09Tbyt8
         Krnw==
X-Gm-Message-State: AOJu0YzdCBys9yoRlOBLJfNzJv6l8IrCgPN+MjzaBN1P2cG3W2s/P2s/
	fOefuxz+ixKKkqN9qn9v/BcOamf3JNOQmO7xujJGW3T6nJZfi0JRC/1ZDdRV/mKwQECox+TeHu6
	bXe1Pr7Aj5NG2V6WvzyitQMTedKomKeF0aa/3MF4EajLJUG5h0ab03mwq2/nNVNrdKiNWWQFov+
	l+
X-Gm-Gg: ASbGnctx4cOocJGQLEHH5gHKhwA9yl5kkHkjNG5VrzsjZWyB2+EGTyPdJ19G3UM3pY8
	QoYbFXJbIg1ygGpdkPSyKGIkEOknlB83p97jE0dMnXJa3nlCIBGvpYHyG2whVjtZGvsB0hJr3oD
	vGVi3HnyT3Q+ErgaHEsW9ZjyPJvPIYfxDq3cdtQhS2VbASSHeBqtuASuNw+a8F0EoXYYXThdY+f
	ls94U1sHF6MA2WuqZWE6x0QDUSgUJ0/Ku0T7wd0O+BhPzQ8Pvp3Q/lgTTlRkF3Kt5HfoBTuKUIr
	fxqkhbMumrztWUr6tSiWuoLjaErTiirO1u1Ws9VN0CeJ3YqbFsiOzjREHkqIUIQUjHqJf4SUM4O
	owzytu/MwNJZy8NcFdCcGZg0003b2eDJT/pKSq6uJO1yob1IdsU8SFcAu
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id 6a1803df08f44-88051f062e8mr39427406d6.1.1762170895359;
        Mon, 03 Nov 2025 03:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMiDz+lDCli9dZFeqHisvcD0Vrq2kRQUKbIV6KqRS7V1M4g3Nb4MKb8S5qdZwNotx5iYmXow==
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id 6a1803df08f44-88051f062e8mr39427096d6.1.1762170894821;
        Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b8191679sm376641866b.39.2025.11.03.03.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Message-ID: <c58dd9d3-2689-4a73-a854-04cff5b44216@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NYbrFmD4 c=1 sm=1 tr=0 ts=69089810 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iFl-POHFLS5oe-sZTncA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TAP8Y_RfAG6CdUwzMvrFuheVH7FHsDe3
X-Proofpoint-ORIG-GUID: TAP8Y_RfAG6CdUwzMvrFuheVH7FHsDe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwOCBTYWx0ZWRfX0AuSH3ZAtkz2
 MA9Di61E14zMo7GTiAdM1eCyXUmeiL6XxVf34dozL8jdBi5DGCT03z7y8hUWqeQv27yUd4N2kGu
 n3bmckT0/qap0xMcwP/0tI5ew2Np8ne/njBdsv+8tnKUTCeO9aqjupzsKJxUmJ/OxwhrRaaFQae
 uc17es9sfXb2P2PUcNEzUT/QkuEaGOu+5HUQyBS1MoOnjfRzCykjN5FYl/hdt4xgAi/R7eWTJnm
 LBxFRKq/xO3q6GKmJdnloeyTZG7+QG6ACpRGrzh4D/VJ34btsBR2Pa+51YrNaBrkCGj2OiQjfs1
 eo6ahEWM4TwdkfpZoOpRMyebXzqEIw0bOTpeN3E/ZveqOfQQfL7r8zxc58fz+o5R6y323B7fvk/
 kt6KHDNu0DRXQn960BhovOAHE3Dv4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030108

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@50a0000 {
> +			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x50a0000 0x0 0x10000>;

sz = 0x40000> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;

please adjust the property order to match x1e80100/hamoa.dtsi

the values look OK

Konrad

