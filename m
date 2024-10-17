Return-Path: <linux-arm-msm+bounces-34818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8279A2E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22FC1C218B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDECC227BAE;
	Thu, 17 Oct 2024 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNE3G3Im"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD911DFE11
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195547; cv=none; b=l7LsW1IU03YsYrGeTW6iUJVYWetD8Y97fy2LA3NbLxDjbf24oiEU3BYWqPL+yfqugniHLWfpAJFbdqLdnHjC7NfGy7CkBbSX7UkJ+QLUiGYDEfGfmflM/EAOw5DE9vYo0YtXbTe+mZMEm7eV2uq1JmMzn+aq9VO8BHmX2bPw/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195547; c=relaxed/simple;
	bh=LaGaMTqfzdF6iOg+8vhaXpCSyMZN9zfhquPnsiTHqQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWXWQ1JH0iVAqzoODRsfqFB3f1gAkHEdjtDkJ3X6+igFeD91fzNUxj5EshjBDDf2dXaF3rfbFz7ROU8D++Adv8k9uNdESXZFm4iE10pfikQxMN5UdC0gHq64On00y657ym+ryVvAceqcn0zhekqXD41WNGfDSkZYNwm2d1Hlj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNE3G3Im; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HI1EtG001662
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 20:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvwyC8dOGCF8S7QQ188rKFjM8KEca1FW3jnVvRaYvko=; b=JNE3G3ImI6c5zYDV
	YhM4KALlvUWF6ZKVCB+FJjS8jTAmZKDoJgjsTAzfbxwZjHcP41WN9JbDHEgdCsQ2
	CljZaVhVZfwIQrIpAjtOEmhnPNUlMw0BCDX3yUOogrcF9SzA8bRB4VemGiZIKPP7
	yCyXNr2dvrky+lI0b3xi7IvcHW6fxzzjN74Fkfhzg7bPZFGXUtSQMFTlDJgNSAyI
	Q/n7T/zvsZaog0pAtYdyhemugONS3HbV5d8HFzfnE9GNOAcZT4cxqg9wjQvVHDgB
	LQve0HC1wlPm25+6RoK1tfrbstnmzbPFVWufKMcdiI8hLfdTgVKcD8XfDsooUxLh
	GMW7lg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5bubp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 20:05:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cda6fd171bso130126d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 13:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195539; x=1729800339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvwyC8dOGCF8S7QQ188rKFjM8KEca1FW3jnVvRaYvko=;
        b=tV35ieNwPJ12v/D/9N6cp0m/0GzkCBYO4W1dj1eii5Pc524V6YZLY4LQJ1/ZYukq+C
         tCxHv0ego/4z9nh92Ui48SmBO3CrlBs/vOk08AlKK7wstwrnb/tpRCx28dK0avz/8+QK
         8EfXHaIfwi+lZ6vY8+XSRd0aAMPSYzMVckpbkWAfSXyjsNaz/EB1FV3LKkCdVv1tuqK4
         8iBDvljjsbk5tRw569IGib1SPSRl1i07/xfyt0VWHvfuX04ySnQlyRgiNwdS1WpR/khY
         wOvSrPBPmbZoP++X0xpEN13eJSi6RZM22amFGV+XgNLuy2BinREyptVuJxgecoXyLZLO
         ZGTw==
X-Gm-Message-State: AOJu0YzSzNVO9o9V/KQqNROqUb2HaFZPb6DOYA5DPbGMI/hEo/VhgpSV
	t6YxT7h68CulpDzAghNI1yZgoRf8l2//wrFM/nHGVzFkn4AqGe5pF1ZfZC36FzwuyDZ3yencjoy
	2p+jty714j1KBfIhrz3ih1uLy2kxDwh7HU8MyNBjuAbZQhdgDK6yPxvBLmja/yR2H
X-Received: by 2002:a05:6214:ca8:b0:6c5:20da:485d with SMTP id 6a1803df08f44-6cde1147152mr249326d6.0.1729195539414;
        Thu, 17 Oct 2024 13:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9BrtmKIOMFUyNEo3QbQ5v4n8nBpSUUOthnuXDXlo/jQe012OWZJj/U0qZcluEL0/mJMTdAw==
X-Received: by 2002:a05:6214:ca8:b0:6c5:20da:485d with SMTP id 6a1803df08f44-6cde1147152mr249126d6.0.1729195539053;
        Thu, 17 Oct 2024 13:05:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bc4fedsm7220066b.117.2024.10.17.13.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 13:05:38 -0700 (PDT)
Message-ID: <ac5081ce-e2e4-4201-bd7c-eb4ec2cf7e2d@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 22:05:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
To: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
 <20241015081603.30643-5-quic_qqzhou@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015081603.30643-5-quic_qqzhou@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L-Y3oXP9eHdLBARvzHalWig93weAJenO
X-Proofpoint-ORIG-GUID: L-Y3oXP9eHdLBARvzHalWig93weAJenO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=991
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170134

On 15.10.2024 10:16 AM, Qingqing Zhou wrote:
> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
> to limit DMA address range to 36bit width to align with system
> architecture.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 74 ++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 027c5125f36b..fcba83fca7cf 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -379,6 +379,7 @@
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  
> @@ -524,6 +525,79 @@
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		apps_smmu: iommu@15000000 {
> +			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15000000 0x0 0x80000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,

The list seems perfectly sorted, which is suspicious.. if we set
i = n - #global-interrupts, interrupt[i] signifies an error in the i-th
context bank. If the order is wrong, we'll get bogus reports

Also, this is not aligned properly ('<' under '<')

Konrad

