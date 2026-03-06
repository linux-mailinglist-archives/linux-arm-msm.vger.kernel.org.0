Return-Path: <linux-arm-msm+bounces-95754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIEiNv6gqmlLUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:40:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 586BF21E17C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A728030330FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C913346A08;
	Fri,  6 Mar 2026 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDXhyCG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7WVxLqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3F345754
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790013; cv=none; b=DByzRMecmp9XAVbtNWp8pua9Fghbtb5e03+4eENUHZNhGqunw5aAp43s7ksP+s0ztnWsWBJ+S2/jCyaeLfAKUxKUwSpqwLn35C9ltsnvnpeuTWJzIv9LUH0OOiFZxP92G9F1P5tItt1KIpyXRFiePVqGjeABsMPfNP6Dwukfu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790013; c=relaxed/simple;
	bh=IzXkdgOWiX29Hm2zkfcIN1kjKGfv1xXvIghfIqEjn1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=al27ez4SJdTM0ah7wM40rhmlwHQ+IGP07ZJ0TsEtY+u0flJZV116wBe+NLDgISBqNRdRg0HNdEC4AsFpzZwZuCCHgeQsAdH58rbYimdJlOjU6g98Cz9ty6u/rS4HPdr1auPQTjCo8GE5Rv1zvlUT5KcIHTi2BvogPLHmi93+kr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDXhyCG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7WVxLqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aHVk2802240
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jqci5JQidsnEDYWeHGeVcYwTCpIfnCmWQlNzXvQVLEI=; b=dDXhyCG7tdUPuqVq
	oE79h+bvawu9yx492JEz+WcCNophPa5qraY74+u9lGuJgpZe+gzJal3Q/9atzQRX
	iHSfX8VHo7QlYoXsj31Pz6o7akbtlcyIyzwH3deO8SPO0R5m157FDXalo+mVQD1J
	XnOjZObUw7uNDKO8O8mqH4/IGVMt65muGlorI5JmCLFqt/mNa69qaTVs8jF8Wf4C
	pLEPWx0g5OKCCOo11kYZ2EqU10BPDKWTQIar5gB8bm6MZpw4/bvxzlkyQU2nrum2
	gGLjYV5ayJJwiHw7x1877BuMSNF2elYO+fnf5dyAkAVPCURy1F9SBoLN0/Hpfra+
	1H781g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp428sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:40:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so62726625ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772790008; x=1773394808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jqci5JQidsnEDYWeHGeVcYwTCpIfnCmWQlNzXvQVLEI=;
        b=U7WVxLqZjKg8N8RTcNbmrjbu51n7dCEkGmlsZo/9vahQMSORfXXgXj9iaYqldHv007
         OcJZT78gxuVtzKs4pGByzbeKgUVJGvjeppU7KRhVfbhsCr5L6LQYuTqM8RNm3RvnSN+9
         rEblWrCQPTkPr6RS+ZljnJJDOBmgX0XsMjcYdrlibBAXAuFJSR6TENFmUZJ8YJ5WXT6P
         i1VUSd4NzrDI4wsi0CWmkyv6vK1OGvD/ztueLD3M/O8Bw8gNbffyPVtqzkV/Eb9nz67o
         8sG4IItYfZ7osrVcgrhCiysqMTY8XdMhU6gtqNoqp0eyh/MRSWSV96WHY3r3ZBaSIRji
         sknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772790008; x=1773394808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jqci5JQidsnEDYWeHGeVcYwTCpIfnCmWQlNzXvQVLEI=;
        b=OJr94GXZEKu9XoORJplmu6HXEcruy4YlzWyztU/TNDE8A8q26JFCIiSP1QEzGZFTen
         g/WNI0zCGBegwPMWgNzz93os7khX0obwnulFf58aW/kITZXEEU5Jm2PL07JxAmdtqME7
         KYET0zSq45eehY2VNVKihaXZvf0j3A9CZWBNZ3JvCHcFv0j3sx02cMjX+Abc+bG4ybF9
         N/8i07n+DJNlYdu5+4UPW93NUxMElPCO4P3z5pkxB+qadGk7ll45AdLqoFwRbpriUW9a
         OVImWtsrhSSezPsiKvjn4LYtirupMG1NT5hDkLgmumLD1Ug4nDwip/igb1lTLMRPuYsw
         HQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ug+9FrBIww/otJios6abn+Z7ikKuoCpUkEvh01RvS9yDyAwETGrRsONFJbF3R1lMTH8N9FFNgn5tBF61@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KgKrRJ9zFWjF+0+4LhCYa4URuVTGP0GqLcIXP/+3mF/9AUVQ
	RmyQxBrZQAD5ElwTkpQm6VJNPlzjAdmYSx4flM06GpZ2GuQEEM3EvOApQNNi1T21fUzm12G5gB0
	soAmSXkr6+e3c7jNsO1wBu5qPDNusKxnzxD+DgsLBEMZLH22Yl6BZa9NSHLC3L1JnvJOW
X-Gm-Gg: ATEYQzzl7B2uN3Uuiqau8QZf3pk52BCmS2DXOFTUHUXds+uqGwKM2ms0fsCPJLrEjkc
	iuv7eI4sHAIRB4eXGjZsGZmPrCkZM2rernfy47TQ4eGUdVQc8SPrd4FUSMw+1KQ9/ZvG1/wn7J+
	MpiTPVbTO4jgEFI5fJEMVi8haVE8romcTI5wI2lopdHCoG/V32sYtk1ZbDTzWZ6Km5BcAERSU8f
	H4RKlpsBb//B9XwFMVIJi2TJvNF17DKW/pOUy7tO4omkev2lx/YzKcX5X/80SawaC0WLVHhqmNg
	OnzcE56d6Wx79lXdwql5Mwk6UmSduDN3JdCZ0odxfrk4WEORNGX9yOLnM3yAVouVFmdJUz/6vGg
	gEF1YAb6gslMZaRClkNpkb/JG3sH6aLBdLAEzikUgXodldA==
X-Received: by 2002:a17:903:3bac:b0:2ae:4ac7:bcb9 with SMTP id d9443c01a7336-2ae75b49d80mr47916105ad.9.1772790008397;
        Fri, 06 Mar 2026 01:40:08 -0800 (PST)
X-Received: by 2002:a17:903:3bac:b0:2ae:4ac7:bcb9 with SMTP id d9443c01a7336-2ae75b49d80mr47915845ad.9.1772790007870;
        Fri, 06 Mar 2026 01:40:07 -0800 (PST)
Received: from [192.168.1.11] ([106.222.228.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f752bfsm19179615ad.60.2026.03.06.01.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:40:07 -0800 (PST)
Message-ID: <67922413-af8d-4e75-aa49-079889576a73@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 15:10:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
 <20260305-gpucc_sm8750_v2-v5-3-78292b40b053@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260305-gpucc_sm8750_v2-v5-3-78292b40b053@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QP7qNxIC6Y6waK0H8_LABY-XqZ3q1VkR
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aaa0f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=uL+hpB4jSAN/g3a/thif0w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_nDl3K6yXJEX041QHmYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5MSBTYWx0ZWRfX3/HlHnL8LDRA
 ISe4el3gNnL/IsPybAg894Lt4nuYX9o9GfVhT/mcsGGk1rfSQjXeXwX7rnBQ14nkmcs0CrtT2YI
 6dFhqsVJ+QDPjFHSeC89/0AsHxOnXAQchS/gXn8JUXmbvaJcTfPF921E+Ed32kqyE0fcw3VAm4Z
 RrbnrjOzn34BGLvLHB6CxUbNQrI25TM3VJ+mN8rBFZdAEaF5qwo6WNGvtQ88C9prWLaBX2+SjJe
 rT6aZsxFhCfiGCst2P6mXIplbGdvoxPbzuaPREic7JyXCyDx8dZsNMAytaNok0aIO6w0wY8TDXb
 3qvqvAFdHtjwNqs2Y4qrF7XQfCBqNZah7YFs9Tgy0eB/9RHqw2Hf2bW5DvjAq31ibC8vWsJ91E/
 dd8fJyGN6hQf0b+WPQU4r9ddgBDXyIEQLAyzh+zyDGRu0QR+izpF77EVaS5CgN7Vy1/xqD3aSgE
 ma0vXyUsz7A1/MW65AA==
X-Proofpoint-GUID: QP7qNxIC6Y6waK0H8_LABY-XqZ3q1VkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060091
X-Rspamd-Queue-Id: 586BF21E17C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-95754-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,3d64000:email,3da0000:email,aaf0000:email,0.228.225.192:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/2026 4:10 PM, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b857a28859910f5c4465c8ce3473b00..0e7a343297e3f5d7a8189f50726dc6279078c21c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -4,7 +4,9 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -3001,6 +3003,34 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,sm8750-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&rpmhpd RPMHPD_GMXC>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sm8750-gpucc";
> +			reg = <0x0 0x03d90000 0x0 0x9800>;
> +
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +
> +			power-domains = <&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_CX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> @@ -4515,6 +4545,44 @@ tpdm_swao_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {

Should we move this node right after the gpucc node to sort based on
address?

-Akhil.

> +			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "hlos";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> 


