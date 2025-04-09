Return-Path: <linux-arm-msm+bounces-53703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F423A8309D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 21:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5015B1B63CD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 19:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D3A143748;
	Wed,  9 Apr 2025 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlfA5Ahw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD81E25F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 19:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227369; cv=none; b=HxKRe9qS20tmfhF94wBuwotkbUuo8JOclwxMeZU4qD4eP2RZkqBmdKJvz08cyqwXmqlqAQlsNvzPd4IjpyFf+6VsrI3ie+07XjTXgpSjZEy7kUfXaOmzqTxojfOtvqhfIZQFltgT8HXdRkoSktMCdHFtj+t5VdKfAyAEcakmtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227369; c=relaxed/simple;
	bh=q+lcMiYiF4Zs/DmAL2Oi3dHMksS541Zh66fS3kn2pt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAIKDztqWt7foPMCYRElO3Ftg5LibtzZ8lk2og7N6npQSSJKgiySs0r9cjYwKgEAWUe+6biAiCNJVqSmBWnOHTUA/A66Y4giT+C5Mp/lHRZjEjW37BtwuJMj84gZoEsu5W+FKhvpz5UAZkNcjrhB1w5vza7QdgkvkEKNHBqJsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlfA5Ahw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDpNv030960
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 19:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xg4gglFlMSPH8uroLUFeSE+mo3fY13vXdlUAOYaQXvk=; b=hlfA5AhwKTmJXo0u
	U8YuMAnf+pNTTeXMTNXeL4Kk1UYTN926vTAUtXmpSHA+O7m44iEj2W3WCsNY3iVm
	Md4clGHIPsLqD7yL1IkFw7aputJtk0Oi/ckyKjleE6az1wyxzlD4yUYo2BpIKqS9
	Lf+pFHobsK+PC+LImKHFkVIIA9mkPQkcqbJskRpsijKOxeuzfDmVjMi0bdrUp1HE
	jWUv4O/XGBugyDUzNZTgfj1VXTTyRBjD8etc0iI2dXpWkvzxeWKlgh62fDNvA0Tq
	yDlZqFH9FQ7Z+9JYABgekKMB0nsIlwj7aMfdQrbrIIF47GrRG1L48Kf3Jr2jUcbB
	YjpDCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbumkfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 19:36:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767ca7a333so14650601cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 12:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744227364; x=1744832164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg4gglFlMSPH8uroLUFeSE+mo3fY13vXdlUAOYaQXvk=;
        b=H6EhgOgwiwrhAWxder0M9Omu5lJsuaIpn4XFNBXSDTTdTxBp3YE05Kn4whZGA6z2to
         1LhFy98ruRQHvSjvILGT8bqG0lUpim6WXV3rGb68aDscM9kz+vg8sSb+boPM9SUwC0yE
         pEQ51bV6FlBdorSdGBZeXHsBkuCVNPKiJSCR6MGXR52QbKxAT3D7XFZ4XAMsWxAEFkyp
         wXYJJ5Y7qiTD4JoegNHVSHgmGJ/f3haofdRcLGmRsaVn1fgS2wW7nG7To2cXixW3mw36
         hnXHE9s3EYp33PNMG+DrOKY+s0Aox0KAH6BUKECQigGO3eDEobbtAOAImZSEHx1numnb
         3yPg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y50hUP7DuuYDoU7gCM6zD78e0vFxoBDHPRiBLniYPVgsYFkjAKnST7GEVOGDEZpH6et1sxlYw1YkOA1R@vger.kernel.org
X-Gm-Message-State: AOJu0YyVX6W7B0v9Gn818hvLH9DFoBYhtE0aNax8jnFDswpEtjwP9AeH
	XqNpp28Di/RBqa1WqtFPSy5zZmyLQL4BPQd1JOBij6k16OWeFQGCfiXaSqAnyQIy23XX3avUAgI
	UxOLcqafR1XYIrWEFoDfSo5ZhG2nekBxvOkgq1NhYpRX2Nzv3dbEJ5Lmmc5w83eMQ
X-Gm-Gg: ASbGncsvn6tkPNDNq+uAo1XL+HFhqCPxgZfG1cJORNCicC6fNXu57b25R4kROlOOQoG
	TQ/rhO0JzjFEyuT04S7c+EkA9Ju7iccJKrrcoD3/q4qQ/I9eqjOs+mmI0wA9wDM8njUXJ/RJ1Wd
	GU/WA1Ip7KOQotBxTHNNA/EWigYlKu311DUqEmbSHlM9sZJVIkqVFAB4zfNdw678PcYcEahbPMi
	U5IhStMjYpKZxyA1S5vn7ho4OKCQeW32MarymNnGPCrSB/7KcyCB8zKfejAzS9mU7mgk5wkl7z9
	tbO+04OK//luEdP8LiVsD/AfFRqYNRFlh+NVImBuqCsD0JbIUzUKjJ6PSGWUf9/nHg==
X-Received: by 2002:ac8:7f54:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-4795f2a707amr21338191cf.2.1744227364301;
        Wed, 09 Apr 2025 12:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzay3VZZepsmM9A4vI/1F99F4nMG5OrhfefQ5BDrrfDP/vK8YWyTspjDGjy7hXNzM/DFRvaw==
X-Received: by 2002:ac8:7f54:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-4795f2a707amr21338101cf.2.1744227363890;
        Wed, 09 Apr 2025 12:36:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc08667sm1184993a12.25.2025.04.09.12.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:36:02 -0700 (PDT)
Message-ID: <a80b5d0c-8e45-4b48-a160-3dce84479601@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:36:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: fix and relocate uart1 gpio
 configurations
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20250318064939.3638381-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318064939.3638381-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oXQdbapegxdPb7UQPCJFyPdDNZEGTA_o
X-Proofpoint-ORIG-GUID: oXQdbapegxdPb7UQPCJFyPdDNZEGTA_o
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6cc25 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=F70ovye7vTPOdvq2yL0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=841 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090131

On 3/18/25 7:49 AM, Manikanta Mylavarapu wrote:
> Update the bias configuration for UART1 TX and RX pins to ensure correct
> settings for RDP466.
> 
> Additionally, move the UART1 GPIO configurations from the common .dtsi
> file to the RDP-specific .dts files to account for differing bias
> configurations across RDPs of IPQ5424.
> 
> Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V2:
> 	- Consolidated uart1_tx_state and uart1_rx_state nodes into a
> 	  single qup_uart1_default_state node, which includes the
> 	  configuration for both UART1 TX and RX pins.
> 	- Inserted a blank line before the status property in the UART1
> 	  node.
> 	- Fixed review comments from Kathiravan Thirumoorthy.
> 
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  7 -------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index b9752e8d579e..f0cba6b2be70 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -102,6 +102,22 @@ &ssphy_0 {
>  };
>  
>  &tlmm {
> +	qup_uart1_default_state: qup-uart1-default-state {
> +		uart1-tx-pins {
> +			pins = "gpio44";
> +			function = "uart1";
> +			drive-strength = <8>;
> +			bias-pull-down;

Pull*down* on TX? Are there noise issues or similar?

Konrad

