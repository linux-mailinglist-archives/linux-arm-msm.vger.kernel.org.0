Return-Path: <linux-arm-msm+bounces-86890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 121E9CE836E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 22:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10A03300AFCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B239A2E7BCA;
	Mon, 29 Dec 2025 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXTl7JbQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/LbnNvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA32E7657
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767043670; cv=none; b=PWqhAoIRv6wx8V76NT3oYCyupUbAn0WLZAx4Ild+E21UhCZlxtnSKIgBBPGW1AzEln7FWjcc6pwrTW00PgwviBTdXIzj8PVY3acdQ3Z+/Ex96T3jjWO5akVtD8Dc/cTX5aJJNxaLUmGFkQ3KBZyur+JPs9GJZxXy/BSh6WVjzZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767043670; c=relaxed/simple;
	bh=eUdX55keUH8UKS6n+tLhHngVgfQyF9CZ+kXJr1bVJeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDkalAvvzdby1IZtL2UMlMLC0weV62VSLicT6XZttEef+D890LIEbKIWx0uVK11/Ah2JFL3dnp4IxxGOQsPydlBtiU6rPwfZiGNUX5o1ZRf/N1QHGdjDNzXtosTqAiBbpAAoW0Mlyhd+DaKVp/XKu3pXJAMtGE6HAcpJg1Y3Sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXTl7JbQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/LbnNvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA51aS956323
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 21:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzGrE7p9r1QV217uvvuPUMlY4WKhwEyQznFD4rGyAB0=; b=aXTl7JbQd2JdVRG6
	nYXR8Xx6EeOWt/RMxMjtsbk4M3EfBZglXSzz5rVm62t435oBKiFcsxhii1Dha90R
	ugK2cFsh1hJQKXwv7eLHpygvfAqZYS+2qMMOW15NhpUjm9pEkLY1DW3CA0FxjjMa
	1dncpeoWv9xzAsRfXF2bNM9gz/NFvQcT6G/PoM/69r8+JDVZA78yLUWPq/I82/9J
	i8LHX8bev+gULtOs9qyh8tKeCTeCCzRPk/i3J7jkh0G8wEG9AVzW2lvvkJ8oO9mA
	O1jiSx/1clW1GGYbcUeZ7N1ooWLPabPk+K1MZLQKteBInm+J0zEvgQnjoegbOYeZ
	Ci3YOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk19cef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 21:27:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso27156984a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767043668; x=1767648468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzGrE7p9r1QV217uvvuPUMlY4WKhwEyQznFD4rGyAB0=;
        b=b/LbnNvq6BUOookO0WWNvlB4rwKKp/0nmftEGIkIvUSWMtoLZKpwiYq+QhwC3+qDcU
         HP8ky3P50YjeLdZxNJI5DAUaixEmQb6RwKr2g4AsHRh+jcRrDwwWyqh27eJ9hE55i4V1
         JHBWAdc8sAqQvgIZufje0B+KpHss3GETWFXFZ+zZNtLcpahAdr8WV8Zca/yKMeQWFGDW
         Y6l4uoADBCuxeSK/kJBnyiJZAad0+1/yQ/lN9Hjjqpe7JHFhh93rFhWwWtvMpGRF1rcE
         gj4EbIcXm6NYSuPmMcoGnW5niQ5ND/PGaHj3Wt2oq0uM2Z49nFHmln+s0X8y27FIQy9i
         gBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767043668; x=1767648468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzGrE7p9r1QV217uvvuPUMlY4WKhwEyQznFD4rGyAB0=;
        b=d00GBYVRBAO+U29HkRUMuyB/UA+TmdXweIAgNGX9nlKWbhgZjck/zXUzUs9ZiDLU9c
         a4yItOUzratUQ2RNG6+YTmg1rCD22AxAx1M9tU7Qn8q2SG2LhIH4RVpjxq4pX6yOKCEB
         07ra9sNxjOkbFcpPNiKG2ChdEInm2RdSi5eey04YyU5bjeHFXHulba/MUjQwtw6WfJFa
         nHJsmszvtnDRrbBnL9h+kllLnDJ1/ypaWpDAxBGW3oBP36GHzCsPaqRXUNnLx7uILV8g
         vamCbP9YZYVCJie/DvEWjMBlkargQcGssHy1A8x5JLVT3+FcSFVHtGuKz/ee0n5QHe3n
         DROQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsSChPkB4NwjbuJ5HtsNK49MKn+PPq2ChmaZ+Y/F4WmyPyqNDb3ePo2moj7USnb1ae7E7OBjCnvIO25q0R@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWsX0isNsgUmTe6LB6OFk/ytIj6Alnw9tVl0tmv+yxa85TjxX
	osE1vZpeMTou23oZYLeabV72nrKqB0u8kGz9zL0GBygD3+PPQS/9J/wHUjLGNuAjtQazfpBMOao
	qU/lsOBIF1fPPuJ6yzjIzaJjtLkhGx7XperzxuWWDZn4PwOLM33kHobDi2Q0mB7VVhg7Q
X-Gm-Gg: AY/fxX48NMo9G1Jso4f8WafH0yGaonTU3C8sat012qcsdgn5pwk1q26KHctkvTRyGjx
	3pfNAnAgEmSkIVU2hpr1JYerUtlaImFP37nBdIWx4DR/rhvXfUeTfhNMN2SNR5lNk3CdAPp1yEL
	Hsm71Ak3Nr1O/ynOpb7riR7qkY0rQ6rEz/pc8lK2jcHc+9my8BIMW9i0uWOiNLceIg+glBlC+Mc
	Nb2Kq81pW9c/F64wPeGQ0rBJhTlfIlSa1OT9dzlJuHa32Ag4SWVnRI1O1R18rW4v9wTmiZT5K3E
	Ts+NQDPnGEqHQiPlAQ6KwXnNHtgES2JfwJm75VBapcHaHC7hPC8ipF3gt/7Zb1QnB7JfRbpl29N
	CTHCSshV3LaobASTE6gwwrJnxH5u7z7ls2g==
X-Received: by 2002:a17:90b:590b:b0:34e:5aa2:cf61 with SMTP id 98e67ed59e1d1-34e921cc3b8mr25435504a91.28.1767043667822;
        Mon, 29 Dec 2025 13:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXHAhGnOuLepCXE//8KFeJOGRHA5F66kPmbj3lGSSvKyZBhz3mGmiK/YoI35dGeoRty8lD9g==
X-Received: by 2002:a17:90b:590b:b0:34e:5aa2:cf61 with SMTP id 98e67ed59e1d1-34e921cc3b8mr25435489a91.28.1767043667388;
        Mon, 29 Dec 2025 13:27:47 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76de1e41sm15800112a91.2.2025.12.29.13.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 13:27:47 -0800 (PST)
Message-ID: <8f6d4a58-ed28-481e-b7e8-8b119cf6cda4@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 02:57:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PUyEG4THlcQd_GgaAFllKeHyJ3O8QjmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE5NiBTYWx0ZWRfX7TPQF4s8AOds
 CAM3rMXd8Ar+KVlJO6DzoFjPTD218ocQa+VSMGajc/kztXGcY46widI0crB3MZj40OxS0p9wfLy
 +CCKbokpCOEG7uI3ueVPPQwvSOSnmpQXs77fJveQaixzM/dkPpOM+asU3pDpq0J8ww/uZbxaatv
 AWI9IaKUDej4+uUzMQzdk9C2r0QYNCiTSiRlTsNAAlHeCZSgO+WKLTpkiy+Kws0Ryhwl7KltKKR
 WZBYXfd5nZDiUsJRVl9KLxLQCmuWU/Ujsj5S/yaGwLCeHyHG4MvWEU6nD0wh8oJ+IrPXxNnlI+b
 zUJ1Kj6Kd/LDOO4JP16nPHrWdupSnChCaM8xRUvOikrklUAfMWXS6MX+VQoNT+2Q3HY3UX3Fl2A
 iDdDwYEM4Es8qvGFEFzE8vLYPTpxWynO7GMME9kYgPbKY21VItbT3OqjHh+uLn6K3MPTPn8lGev
 PLTQ/jZWR1xo7CPzMNQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6952f254 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=DNOyb6/IJtREwcjsjFyOSQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M-CakxJLJ1n_a3JhWpwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: PUyEG4THlcQd_GgaAFllKeHyJ3O8QjmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290196

On 12/29/2025 12:42 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.
> 
> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 8bf5c5583fc2..e705eb24160a 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
>  					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
>  			interconnect-names = "gfx-mem";
>  
> -			iommus = <&adreno_smmu 0 1>,
> -				 <&adreno_smmu 2 0>;
> +			iommus = <&adreno_smmu 0 1>;
>  			operating-points-v2 = <&gpu_opp_table>;
>  			power-domains = <&rpmpd QCM2290_VDDCX>;
>  			qcom,gmu = <&gmu_wrapper>;
> @@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
> -			iommus = <&apps_smmu 0x420 0x2>,
> -				 <&apps_smmu 0x421 0x0>;
> +			iommus = <&apps_smmu 0x420 0x2>;
>  			interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
>  					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>  					<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> @@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
>  
>  			memory-region = <&pil_video_mem>;
>  			iommus = <&apps_smmu 0x860 0x0>,
> -				 <&apps_smmu 0x880 0x0>,
> -				 <&apps_smmu 0x861 0x04>,
> -				 <&apps_smmu 0x863 0x0>,
> -				 <&apps_smmu 0x804 0xe0>;
> +				 <&apps_smmu 0x880 0x0>;
>  
>  			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>  					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,


