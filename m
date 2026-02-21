Return-Path: <linux-arm-msm+bounces-93546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDGgIwv4mWmSXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 19:23:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A1216D7E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 19:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C843304A6D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 18:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115230C368;
	Sat, 21 Feb 2026 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhAnhOdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL2g0Ao8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62A2C236B
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698177; cv=none; b=n7DpMDSdVcNt7W/KNxD09k/evbKwSnr35cX7WNh+FD/UXQAGU9+P02BdsCY/uNYy8CxkWMiZWA1wJg8zivhlUIY2NCkSZG2SmNsnzMbglPe8wilK3NSOsJGo6OLwXxFe41UpnORMwEys+8Bppy7nVXPRNHQcd2IDW/LPxu5ugbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698177; c=relaxed/simple;
	bh=j8YzehGleE4Bcxai9TU+Rb7l+5Rkd2EJJJhmu0Oe5hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tz4UF2e1Xn6LYd/tcddlT8QJAVPW4SPZlAvS22P1JlU5Q43dFG+NIjJsUUmYUr2bvtjVI3An/tZiX1J5//RQs9ELlNZOHmcTzBIAzS+JRqKLadat9F6WkOBFrFtI2ujzb+jH1A3duEap7V3REcj5wugdm4bFFPFkt7zQbxSsxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhAnhOdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL2g0Ao8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LEwldU1681256
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 18:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=; b=OhAnhOdtcg9OVMuN
	10Z6cQnhJohMbDoeia2T/TtOZDQhLsJDCs1zILzZ1EOnfPTQtisE72uF/DpXcqB6
	CUmR0qn/JATZUu44oDvGtGM1n864CF7yx+uvCG9apaMAVQu68ExQDh3p0BjociKO
	kTpTjfLyEth9nFqzvO07a97+m7xTcVVp9fEbzkHUUxAmRZkkgtZMoQSb64nqmfjO
	GyCPWRUF+h/7rn73+i+GmBrbqVm/sKcZ5mJVTeiALbi3EmF26aMTEAF5+WTR5g2X
	+6EjdG1AuyXMQiYYQbmwv7TsHst3fdfJwsMNWPxadjYDiNhPp7f41WnydTPJs2yw
	jNNiMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603h4b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 18:22:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so31964305ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771698167; x=1772302967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=;
        b=WL2g0Ao8bPp7OA/KhjJ6EjahujaCk+jQkWTzSe4hWPUUGXJFOWf0yCqhlC7v1JqVnt
         ZyHA7+21BEWPZbHqFUT7tbhVkPNgdDr13mYbU4iUVGSdN7HCsIMKppJDDZzdhQkqPu2g
         HujEgSfMaTyd5LnFBtG1wm7xuRDdbW2h4JSaiad/KZZjnXZWR7Srl5lRzDYW9+My7cDh
         pGX8dT1hMQZAgfBZXjaaGXIDnqLBz0pFt/lzV8H5ybK2lsmEEh1Y0oVbvw3kxdR8ybfA
         Wshht5V0ly9DUKQetIgNBaRqZinaDT7t+5O6qYES98Z7wADTdaAvyZJDRgiyj7GSnfr5
         aEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698167; x=1772302967;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=;
        b=YXWKC4e+6vXehODQvpr6fBLaR/3hCGYHydSdjYJ5wA42Oxy5a19Zr3BzP8UO3UX41Q
         uUsZsONBMybLUaaXL5mF6MwbpWvfufbec0epXRYDTzTqQJcRMshFmkweyirGSmaWRRIL
         OeYMmJYDgPkrST7lpJxPCI8Ziir+owOQtcFB728wZISlqbU5JpsDGC82hhSTNJL3spCY
         XhTn5Xo6b82OB32CFBHqOUuHxthDayqtiPAU1rzpUthxju1mm+aSrg16+t/qQw4rdllb
         HRhbsaQmtTHnHgC2cxMr0gb5fpO0ytULp914hjzwi0cHSUxUvTFL9/vqyBEf7+uLfkO4
         u6hA==
X-Forwarded-Encrypted: i=1; AJvYcCXVkj7p2icarRJUqGE8yPKkFhW+L4TV37niC/++ksjzYksJ5riBbJpHM2OsmBE0VnBl5yMzxqC9sCFOQpo1@vger.kernel.org
X-Gm-Message-State: AOJu0YygVdbxVKIayfTgn1tPS1A9IstnDgrWJY6NOBSY29cv5/Qo0Uv9
	eAUnZNKCbhXz07v0aFuJeNvyjV4UfRo4MexC5F3r3XzzcWl2ZgmYrTwbX13j8m0MYSOBRLlEF7W
	S5f9jhrEjn+svBYC15dy3MeCRzuwshzLqNgAeY4/NH7Tr4PSgPb4PGEZkdTGLE2DgCtHC
X-Gm-Gg: AZuq6aI8Pxsib3rAqYxRP4AdUVAGx8T8L9h4NrfGs/CZSWqjdTC7OWJmG8AfvJsJy5p
	AoxBtr1NvyO0Z2bU2MI4Uucy9BUozDRt9xP6G30nk5AaHmLBhvC0krVHGW1Hf1S0TAasdov/MPp
	fO1O4qtGVjtR1SnmASdJ7RiHhMSQULwnXC94cKaWHM3NeHZ9uVTFO/BBwLuxbBljDBtJqGJMAAL
	AIXdoD2VHWWosWF7+RejQ9DrR9GFU0gVUXvQgc6bQZWDEdcD24Rg8liWGRRBpKjMNbzBe+jDKq7
	Vj+uLXpFARpa7KbQSsrc2GKXnjqfYjj+nL1XFz6rafKGuV1IEjpQrcrKs1txba46WLKilXzX952
	5jWvkvRy1qUF/lJityXxoEqrksTDUnidEB4KlrzJ0ysj4uS8=
X-Received: by 2002:a17:902:e542:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ad744a0062mr42498775ad.21.1771698167457;
        Sat, 21 Feb 2026 10:22:47 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ad744a0062mr42498465ad.21.1771698166964;
        Sat, 21 Feb 2026 10:22:46 -0800 (PST)
Received: from [192.168.1.11] ([106.222.231.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7504379csm25510135ad.83.2026.02.21.10.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:22:46 -0800 (PST)
Message-ID: <7dbc0e99-cffb-403a-be7a-27d1b47712fd@oss.qualcomm.com>
Date: Sat, 21 Feb 2026 23:52:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=6999f7f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nGub0OD3bIp9TpioTFTxbA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_nDl3K6yXJEX041QHmYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDE3NSBTYWx0ZWRfX7unP2gA5qZRF
 ppc2hbJMK93P3RRo1OPreMFn5zZ4EMsfqkyi8Ix2B6PIrk1cYEQ3FjOOtGNInml45tFLkXxshND
 C4q6nTMWcuoxN2LTtVEpgQ4TZSKE98pGNeASm2km512wxvKwDWIBr9cLcDyvh1gI1o3VQjPUm+9
 Pk2Svz0XMgwMoio0VLYPxb+rsJDjEYg+ppkPJn2du97VOsTwkN+vB8WHUVl/aoYkK2H8PwM95ze
 mymTNkmFCzGhLLjnhVJQLlUeD/d5r3hVYY9BOEOUibYLWL933A4la2h6jscA5zXJ7I2mp3do5Ff
 old9pVEoC6M1FISvQzcsEHgRkYZo58iON7sEhK6+x5dOaSPVyz852PK9owK8quwoYW/yyvos+H9
 NSjcW5wLb8UYZ6uVuDdHYUiG65c727/UMxy3xLn14EiWcoR6rF7NLJXyK4bpgOKGjh1sDtMwR7U
 5WJwvwZskLVuaZvzOuQ==
X-Proofpoint-ORIG-GUID: LwX4kY0oQ4b80JsoT6vYdFOckVoszGFW
X-Proofpoint-GUID: LwX4kY0oQ4b80JsoT6vYdFOckVoszGFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602210175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93546-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d90000:email,3d64000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.228.225.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39A1216D7E9
X-Rspamd-Action: no action

On 2/20/2026 11:24 AM, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
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
> @@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
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
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;

On Pakala and newer GPUs, we need to scale GMU (which is connected to
the CX GDSC) freq. Is this DT description sufficient to allow scaling of
GMU OPP?

-Akhil.

> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> @@ -4515,6 +4541,44 @@ tpdm_swao_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
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


