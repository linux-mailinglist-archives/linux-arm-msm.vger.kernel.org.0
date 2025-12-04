Return-Path: <linux-arm-msm+bounces-84383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E1CA3E9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E50C3038986
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8F92DAFBA;
	Thu,  4 Dec 2025 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmytyAl9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiDsPvTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E832A3E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855861; cv=none; b=sUDLjTChfhQmVp8QqcOXem4g3BrP/hXtWOknTqaVigWPNvM0ZugPOJHZ0vm5H7/SqLxzNzaXEhGpg27He3LRkdrK/r/9CxS2e0HAWsB5iTC3sO1zp185ESwB8b0vDWp1pYwJngM7u3HeoyetnoOqlVoE7mh1n2EgWAKU249RvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855861; c=relaxed/simple;
	bh=q4KD4cVSlDuAzfBKa3zsAeOfLVydQ9sqir8iVPgX04g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlwY4vNkq0Eh+oZWwAc/zrzBpMnQXNv6J1KToWt9KUw3h80joY/LJS3wABz48b2LRHVn93QkWPpbUZbR6Hto2xJ7FX1l0Mo3MgTp95ATKR7IA+dhDNYH2jS3c6c2R1SaKcjqOFbBuv/7VeCFkd90uKz5JU+HNH/biIE18t2ReJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmytyAl9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiDsPvTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErNp1042887
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VuMjoJf7Z7/FAefGCxvNyyNJqAtfU0jYooIK27A9/6E=; b=KmytyAl9UN8cj5M6
	H6TU4PMNsTmbYnd5BmQLz2XN1BIHG5ByA2uyZ61/ozO6ZWoCdXfqyMkyvecgeb6O
	aSKNDLfe/N4WlxQDpNko7N/nCMDuxZnqT5OGJUOIwGQgtKtaXydk8UISR7J95OVQ
	OPdwJ23g5E43rBwA6FhXAjrmFm/dttJ27v7b1A4kTSSCDpakzAxJ+YqvYlQ4E4KA
	JAcrT4taMYttL7Dtq3luew1Hb0cg3oIyNtv9/yD3OJFKFAHtb4PzfSzGQWax/N3e
	s/gea5KPr1qrgky003T5NazzcCMLrA18AFgShnGsm6I+xkJukqxzq0KJ4Fn3czZe
	baIsaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp0x51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:44:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b184fa3ffbso30339785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764855858; x=1765460658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuMjoJf7Z7/FAefGCxvNyyNJqAtfU0jYooIK27A9/6E=;
        b=EiDsPvTDsPlLj4rUgO977NBTJopoRUuhW5/VPpgjpms1vqs1xK2kKoDwDJ3UnFdIxW
         9vA2FSY6HOU8m/bEuRBy/1ygyRCO+I/DxKgLEJM+JyWTllNYX3Qx08Bziz/PtUqQn/OS
         zJVThle1rE4q/nDCAl/PXmzlTOJ4fO4iACqywayJXT7VrfHsI6qtfqqZDvkStFNvnnbl
         IVi2+Z+PHVEbQ7MKES0HMxXuQmRS/Ip03GKU9dZLb/z89bygGYkcJYGXT1A7F6sQU0oa
         hAUA1inXTtylXJyDxyzXeq+xGv3v22OWsLTbSxcKu4dypSrOOIN6JbaomCMhzNY0HIOk
         KmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855858; x=1765460658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuMjoJf7Z7/FAefGCxvNyyNJqAtfU0jYooIK27A9/6E=;
        b=I7M2uuyi1/UOFOTGARTQ2zkXMqrQYK6nvRG5slGPvfZOqUdrgLXU6urAc1U7sGxaRJ
         avtCDZDsfWxB6lO2ZTWKXH2nxaDg0wp2Ul72g/5KI7wyLa+/5T7peJqThXJ7bdWaroFL
         yf4QnhzWVUFSnAcI5B4d5wxlEYZ1LJbUcaQmtD3DuPKsbPDC+NfPtE1hWhq9+1zpIReS
         UMEO880KJpwEH2hrRaPP0hXG+Hy0YRfHtCix2x9uFxmXi+aWokw79PhA64TFBSPwO2rW
         Yjp4YPv6trWGDW2YWRy9NK9MqypKgEUkkbGjx9uzSGfK5imuYpt0WabsZq+LS7JuvSCu
         BwRw==
X-Gm-Message-State: AOJu0YwuPtr/R5dUTCxd+7564k417EH+Nr5FNM3sgWf8XleECEyg72Fk
	gm20q13vn/qkHzrbNJyIZwyxBaJN0CH7QnL1hzPGYrcM8mMtRRQnHFFHTf+yofFewCv6deKDlgG
	oH01KRM23BkH5MyaheR36V5TsLPRTYxkTYdh5gnUHWNd6M3A6IAdDZ1nyZaI1kKmQEiv9
X-Gm-Gg: ASbGncvBWujceotKW0wrb63oKQI4x+3YLMucmR+OkBqVZ+wbfLHDJMJqMMqoJ9QiVqH
	SmWFrJBRDJZFcdAW+SoUXhjzO+JLm7k3oK1kO4yqNJckyF8rqbMD/2KN/ToVPZrKO2/oa5ynrx5
	U2wy5O1+FyhZ0Fp1lQfWZF24CWPspz9ucrU+UHbGMm3kwKhsl4YGL6JIDv1c0AwK1I1Nxan4XUM
	gS4dxPVBOMjH/q/t5N1e+JpdU3FKy3ysLp2HGXt/vWGnYl8uJBUNKC/b8AR7HIpZXEBqV/iSE1L
	bdSJm4Nt20gApiKlD6aEWSQf5r7GoKunnZgciUGHA/G2+kx5Jy8Arlad7k2t2es4e++m+PzUYpc
	MteVRuX9gIhA5M9pcjaXNi1y7NNtmIJ/vNM9ijhZ8Pn9vS7F87XxS9kui3VSPpwR1FA==
X-Received: by 2002:ac8:7f08:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f01b3b1c39mr50940981cf.9.1764855857055;
        Thu, 04 Dec 2025 05:44:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN1M6ngwpDjpQ/VGMuF6KhV8RlrRP2PMlq/4migCBT4ot8bulRik2QPjfWg+5vcud2ZLBeZw==
X-Received: by 2002:ac8:7f08:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f01b3b1c39mr50940731cf.9.1764855856536;
        Thu, 04 Dec 2025 05:44:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c88sm130358366b.35.2025.12.04.05.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:44:15 -0800 (PST)
Message-ID: <08284b5f-a6b4-42f7-95f5-28161ddcd356@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:44:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=69319032 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hGZLfD6879LPmVnhkrMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UATNGVQ1W1JEuHHuozRr2tHi-v9i_Bcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMSBTYWx0ZWRfX1nTH0gK0YNDY
 /wDDwvv6DUUCDQ/AqkrpVlddd88Ufyn/opGcUJxVK6o9XiyvcMMSns4Rb0r4S2EHxhC7oz6hARp
 KhsfbaDGCGFvPzdmiJb4fT+dpSNtO8Sh9gU0+pZpnpLP+JVdxRUlD8ICDbWCB0LLr04hBrHaqd/
 n0gWkc5YP2jrR6E4XZVtdh6YrdiYozGoSHgapFJmHxdG+SsQyvxWdnzg07Kg+juuy94k/89oKwO
 v1XIDJPrR91L1iKE/j6FQMT7gPTGrIhl8XsXohtE+rzd0HjhSI2IGZA+Dh6DmQjxj5KdQU1Oumt
 HBXZcn4BX96x2lytZWskqifb9R22TqbAwuo+PqGAgmGrhRNL5EAvjGpy90BwpzzEgqcioY21GqJ
 RzbuRfARs+BkkH4Nqo5L8phNCsi+ZA==
X-Proofpoint-ORIG-GUID: UATNGVQ1W1JEuHHuozRr2tHi-v9i_Bcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040111

On 11/27/25 10:43 AM, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already merged):
> 
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v3:
> - Fixed num-channels and qcom,num-ees properties by updating them to 20 and 4 respectively.
> - Link to v2: https://lore.kernel.org/all/20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org
> Changes in v2:
> - Added EE and channels numbers in BAM node, like Stephan suggested.
> - Added v1.7.4 compatible as well.
> - Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 51576d9c935d..a1cadcce98e1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3033,6 +3033,30 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
>  			};
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x480 0x0000>,
> +				 <&apps_smmu 0x481 0x0000>;

Just 0x0 is good

> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";

one a line, please

> +			iommus = <&apps_smmu 0x480 0x0000>,
> +				 <&apps_smmu 0x481 0x0000>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;

0 -> QCOM_ICC_TAG_ALWAYS

Konrad

