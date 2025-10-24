Return-Path: <linux-arm-msm+bounces-78696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94AC04FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8D219A86CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F20C302159;
	Fri, 24 Oct 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+9kQP6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88ED302148
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293643; cv=none; b=jKixz72BL5mJPIuHSLlbaBrnK0tvvRoUfqXVj9K8XP7O571qXIHvZM3uPIwNCziVx4Wlat1vZN736wMfk/ZnWvP/mI78WHsCBbC69zZ3jNoWvjlNd4PWLFAZm8mNarrF6GSmeQ2y2+J7KZruX6hO7VRv5nu7oT5B4Rm9CYe1zaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293643; c=relaxed/simple;
	bh=4LQY3pdZ96rnqQXgBIRUHW9rIPYIt55eL9zhEIQ1qs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjBs//grU8vhHCcxLyR4xrkffuOzvh5cRljp9KqxObMVFhVXqDWseq5JkSgPotfltHkLu28J6t0+EO79KMfqGgY+AA0uFtMGOlcBa9qva/AqTeaE6HsQ2Y5Tul//FiNtyDnDCagTUsuIA/kgD8Jt0OPfzslJWVnrwnZpXcuOoR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+9kQP6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MHX2021671
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzKZx0KdaXQPdMY8n8YdZTFhqr+6LBjxgD7f+bSFhX4=; b=N+9kQP6K3q05ylN0
	1rj4qkXLo/nbcCi5iNDpsxHs0aJDWzafnV9TR8HUdGIiZzSeVFnpX61zQG7IaHUT
	lgLYgCT+6kYqlDuiIRckPEpMyCn7a12cFprp9xdtroCp+raUfRQ0KRDsL1auHQB6
	I4XeysUiaXwzs7ffctWnvmJzBPhhCqHwRLVEivh5sOkSDgflaTQuHPp2AAmMvlic
	0EYamGSrvt8dneXsHlB3HqbW9OCLSBtEARN+i5USPMJiFqyPaG6r/DudQOVvdSje
	GMML/ErnCvRY6jZEBJAPgaY/mEEjJkqYDdDNddiDdyVwa+jdj2BBo2xJmCZcS6ga
	/A740w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8ng6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:14:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87bd2dececeso6050026d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293640; x=1761898440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzKZx0KdaXQPdMY8n8YdZTFhqr+6LBjxgD7f+bSFhX4=;
        b=wHT+nQ9IrZTV3x7UZ1dKCzvyxNvfveoardkTMyxfjh53RtjXDjWWBj9w7zSAEq5QOm
         3o0iECU6SXHW/f6GOa9UhtpgUZQGZXIH+OBEeHl5F5/J7jH48TDph5bxav1ePtcSu5j+
         rdixj6ToI9CIkhWnetXsJ3zq0omns3FSC4Qjbt3I0znRJH9+9j58dSLmusUy74lCrkUk
         a2bz6Fm0FJKLBEl3KW9gvZtfXN0l7e020u6LInWqZsYYniVkGR2k7DoYyXZUoWW74OzE
         23fwbL40jwKp3BDAlZNtm0RTNd6esE2NMHYMk+XeP3XknCGYpHtmG49/qnCMEYkpAPKP
         tEtA==
X-Gm-Message-State: AOJu0YwxGxVP1M/DFNScv5qIgDnSZi9v0Yqw3K08mq+nV8W7T+8MFaPl
	DcF9na2MfS5r5xi5lm21wjBYX0C65LnHfHKeTJD5WsVYaH+wGb4k+ImmagkHgOkASohSWdml7v0
	94nce4MrG6vG7LIKA4FHngL4an59Q3/sXN/yhhmYQYMqJETzBueSXDQ0O2mw4v7z9wCj/
X-Gm-Gg: ASbGnctTpWPW3pvd6yKX0c5ELeKaVxlRaIUqexWdWTl4DqlI20V/LkWx0wxNI7PMNVC
	OIBjB4U66QT8176YIvaVLijLnbz273siEp24mhA4jOpp3ydPSr2jwYees3a7b+dTVUFj9LPcQ0I
	Sis17368sXVoScNQbajUGSjkNKlRWsdKcEu6GzDxsL6j1TFPHHSt+aB7A5Qc8G/2ewUuK/JPikb
	BZEIBSYeVAH6MYcEH1PcHwdNCAMj0VyPqhuAcyk0TffNfeZ6Y4mMGRfJ1Me5fkXF8RETDR9g/ck
	5vH7enHTrr7eVVLoMSdh9rtEDoEYNtBGdpAVsIPu6rAvIsvPzfiqhuQP8dflcKEaFmgjD9EK/Sn
	GmAPcpuQwkAV118hAbnS1H+5hM46i1kNDwB4HM7LJd+yDNQjIgwH8whsP
X-Received: by 2002:a05:6214:1ccd:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87de70be59fmr111017276d6.2.1761293639876;
        Fri, 24 Oct 2025 01:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkuQteOXxBMGqxcPQtHgaZ3r3sh4noI2NNA0gmaTaiHoQCDysA26yJKDtBnRE/gNxqBULdog==
X-Received: by 2002:a05:6214:1ccd:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87de70be59fmr111017056d6.2.1761293639396;
        Fri, 24 Oct 2025 01:13:59 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f316cccsm3683716a12.24.2025.10.24.01.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:13:58 -0700 (PDT)
Message-ID: <cc7399ed-db57-42cf-a944-6213a8df8491@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:13:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sm6150: Add gpr node
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
 <20251024023720.3928547-2-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024023720.3928547-2-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CcqHSwodbk_mD_u6vB8XvK0CetKb6gAf
X-Proofpoint-GUID: CcqHSwodbk_mD_u6vB8XvK0CetKb6gAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX7qufZCoJSTfZ
 X3Mtf9KfssaYriaNBhPD04mm1ZRxOPxvDteHSYf2ysx3CRAAVYzWeZV18MhGyMx9R7d29DxTuJG
 Euc8H4KSdcQsy0/wo4ueSXrGyZ3Xb7Cjt+z0U0mStzb/Ytuk4q0bvWa89WY0IB2v5Nnos2m4GKi
 mk7gC1PA4VvhNc7qjFXBO8xWw2c+dzvdaBEpt6fUr/K3BsUXIC/nBiwtBGCboYlMLYRmmzKlwto
 nH/4HzJTDlPS+PBVbPjlbVsce9dDYacD655ZIipFeMYPUOeonsGgyRwShEWNpfYO3RyT1/329Vk
 eRm3QWaspEZviNgdt5I2+0by38pzaQovr2jawoHhSDSTH95bu3PCLtWFoG0tsscX4CICIHtOydv
 bBbgrgTao4X0NpX96u1UyNc+8cr/Ww==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb3548 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GhKeX4-ZSDom7ex7ThkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On 10/24/25 4:37 AM, Le Qi wrote:
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.

This is a really weird
way of breaking your message that makes
it difficult to read

(stick to something more like 72 characters, please)

> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 3d2a1cb02b62..ec244c47983e 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -4246,6 +4247,41 @@ compute-cb@6 {
>  						dma-coherent;
>  					};
>  				};
> +
> +				gpr: gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x1721 0x0>;

I see that the documentation mentions a mask of 0x0 (like you did
here), but downstream does something funny here:

iommus = <&apps_smmu 0x1721 0x0>;
qcom,smmu-sid-mask = /bits/ 64 <0xf>;

with the latter value being consumed by the driver manually and when
it binds some sort of DMA_BUFs, the effective SID (ID & mask -- notice
there's no bitflipping of the mask part here unlike in the SMMU driver)
is prepended to the address:

smmu->pa |= ((sid & mask) << 32);

We can then check that the SMMU driver reads the SMR mask as a 16b field,
meaning the result is (sid & 0xffff) and not (sid & 0xf).. 

If we take the hardcoded-downstream mask and compare it with the HSR,
we can notice that all the streams in the 0x172X range correspond to
LPASS_ADSP, so perhaps it's a design choice that the DSP end only cares
about the least significant digit

TLDR this seems to be all OK

Konrad

