Return-Path: <linux-arm-msm+bounces-61290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8DAD9F02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6493B6FAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DB32D9ECA;
	Sat, 14 Jun 2025 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNhFgEV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09301DE2BA
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749925938; cv=none; b=b4sOr/uGDyh38oeL8rwtL03jCo82ilNi4oByJjvFYsqHDv0uCFpz1u+2o/go1VezFjLseLOAegZC+aiFwe8h74xRgWBfEqN9qgLsC3QPCVs2hdYSwJ38TEN7y+EegM26HwFyJkVkVwfS0SaX7NTpHlCPMslTqXEzpYosq1PcmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749925938; c=relaxed/simple;
	bh=0kLZe5y0ZyrzqmqIFyXSqU7kHqgyABQHfGDybgVEDg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E09RugoGkvnEBGkfcVlnL1ONZVOpvHaT+TjWHeqDzXiiepOTKp1s00uMFC7ZVEunegWDpWMLymDotj1oqNbM2VV4JkJcuuJNZCExoLEeegS5YY2CAlR+5muSg03y6+weuRK2iSpz/17ry6uaR8PrQ+lFVi6mv+OvrLZ9EJ3Irow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNhFgEV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E6lOIC013089
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zjr+jyjGQmEJbKPCSARJJf8FzsrLtcURjCMxa5yFJo=; b=BNhFgEV1DRuBuTHE
	6B1SV6A+h+z/H6wjjkg0th0K/jIYdABdyQV2ddJw0B+FE+F01XpffKkk+ExiCn/V
	xy4vQG1wbLsGWIkeLD4olS+TK+SSR1womDcXHPjceX399Ifc048+3Dhips1yrGfA
	+w29qrRfomzYljHYu3mAed7X8N2JSH0Ptsb8Rl4JCE7U6ow4Peu5VSf+n4HMycDH
	LXih52dXaTVu8OcGtHMDUYcp2R9fDeLQPHHJ4jpZnaBEnHqe26SJNCycpJAl6Ncx
	08MvyOjJaZPOxFQfERiw7bxvikHOvLfE5p39ZWcRjo8ZHg5slcmfFvZhzAwte/oG
	yvIStw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8w5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:32:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5832bdd8dso6714881cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 11:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749925934; x=1750530734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zjr+jyjGQmEJbKPCSARJJf8FzsrLtcURjCMxa5yFJo=;
        b=VBiAFc9SC131v7Y7SWsdFNXZEDzrW0wkgezLMz/HGQl4kaZS8++NVFlnDOHOVOZDjT
         sOgbMFg/WfnK2vfim26qeJ1boL0dzyQNSVkKlLOSGv7qfdbYu9WLT0M1zFwThb2oLJVL
         jfvYLZtOzFRWNzdMpw6CDynYz+h2h0ofO5ed2xzVO+r3dX9vnx8gD9UfRV4AUrwjx1Rj
         fkd+RfH3BBBqknQy6zKG36gp7jo5SelO9wvkbDx6Cm7lRvh5zPWdnerz567GLXtB5uCb
         epHfSXQXfzROo0Th89jBR8DgifeNRYZTE1plwfQgOJwoYyV4ncLkt/wfFP3iCbHDJ2Nd
         p7jw==
X-Gm-Message-State: AOJu0Yw2DCXBhEKqEEIpSpMUTIzgkf7y/dNSXerEWyoB0V+uLxOKHBLd
	b8BzpLGy2zxxvhIaAylGmq1zqw6MSIGgDYzN/8Xod1JD2jExhlAItBrkVKoM1CQL2SE/TQxMLmi
	VfoQ656+WI4ZsrcqmW+Xq89fVvKxO7W03D3OJjKq8Cg3NTuGMox6q7lD+RxtumeeOFczb
X-Gm-Gg: ASbGncuc16NnDRob68aA75Up3Pp5uZGCOZC/WwWBkLmYWdRCH+3L4EGQYtvG0xqKtc7
	0NVXi8xGFHGxIYSu42E3MhpBagJrIw7PAE+2BuSBH2qe0I4sUZEF2cIJ/DPTJmqh/k4mfVwp6yr
	kbCeucKcHZBN1vrV4Xn6ZiWi0uXCndePxBVmHqZrzcdkfXDTfvyjoYLS3DvA50ac2WUs1efHK2M
	mROBRSNFpTm3ScXdi/UIVUD2546WNdOLeNYqcVajFfWjE51S5lIClG2qCBZ7JijYLG29DXyy2Lx
	S+bqNJ6lnqRzzzeNaSUAHTSfd6QccPnxFa/PtxKQl0kW7+b6uZFA7v88Sfc3PDddhJc/pHbRIKA
	8/Nk=
X-Received: by 2002:ac8:5e53:0:b0:4a4:3087:6cee with SMTP id d75a77b69052e-4a73c6535fdmr22676081cf.15.1749925934431;
        Sat, 14 Jun 2025 11:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjnXi4LOAlGNITRHE+D0Vz0y+jMvb4gMS3dWcaYwtLxZUeHDyVtPykLidKSxscG3bnnLZpAQ==
X-Received: by 2002:ac8:5e53:0:b0:4a4:3087:6cee with SMTP id d75a77b69052e-4a73c6535fdmr22675891cf.15.1749925933787;
        Sat, 14 Jun 2025 11:32:13 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81bff9fsm350710166b.52.2025.06.14.11.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:32:13 -0700 (PDT)
Message-ID: <f2508b08-5a6b-4104-9da8-461e179421b9@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial
 configuration
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-2-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-2-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NSBTYWx0ZWRfXw+wcThfM/hmG
 u+kPQ5iMc9KTsclEAFd5lpjYMYGd+6aqu228a/rvwEMhXMhRs5Ycrl9IWpulEnDhdE0/4qBzBJP
 WLCLWwSSO3YIv1mnMaYIZVMhPzaWR9Eld2i7Gbdb2DfvMgTsSrZHf+XokMfjs8afb6slaUHkaRg
 /RosKrwPC4CFWGZpUsJILfENpFJwYRs727jlkF1uN7hFBJdzqGDfipEwtQBx+IWLjI/LVyGRMGf
 nA0ER5aCdBGu7HzTrnFK+s9TCu5vgBoGTyy+CE1nk0ePwg28oVSXkldN20eRJ+hUC2duEAS1+Se
 8Ush9YoOUo/FnuUUVHjIzhJpBjg8TVvGRxC0YsddCC7RVdwxiMgBhl8qQnyr6gjhJgTDHx5xGNs
 9bbN+Lijfm/OVg3sf1/1bRHPZ1475SwK4G2SwelQJo4EFgkLPFt60FNeix2QmiT/YlVZahWr
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dc02f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=EfQDsuKygrJdTQcVXAAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: hwQY6risiIfG3zp3ynA2u5gse8TlZ7ds
X-Proofpoint-GUID: hwQY6risiIfG3zp3ynA2u5gse8TlZ7ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140155

On 6/13/25 7:50 PM, Antony Kurniawan Soemardi wrote:
> The LTE variant of the MSM8960 SoC has a gsbi8 node used for the
> serial console.
> 
> That's if the downstream kernel is to be believed, as Xperia SP has
> a serial console on gsbi8 even on the non-LTE variant.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 4babd0bbe5d638b228e05cdfe6b068b4ea16335f..66071ad498e49c4f54ba105fa94640575fe08da6 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -333,6 +333,30 @@ gsbi5_serial: serial@16440000 {
>  			};
>  		};
>  
> +		gsbi8: gsbi@1a000000  {
> +			compatible = "qcom,gsbi-v1.0.0";
> +			cell-index = <8>;
> +			reg = <0x1a000000 0x100>;
> +			clocks = <&gcc GSBI8_H_CLK>;
> +			clock-names = "iface";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			syscon-tcsr = <&tcsr>;
> +			status = "disabled";
> +
> +			gsbi8_serial: serial@1a040000 {
> +				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
> +				reg = <0x1a040000 0x1000>,
> +							<0x1a000000 0x1000>;

This is way off - please make sure you editor's tab width is set to 8
and align the '<'s

> +				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GSBI8_UART_CLK>, <&gcc GSBI8_H_CLK>;
> +				clock-names = "core", "iface";

Please also keep one entry per line, '<'s and '"' aligned.
I know it's not how other nodes do it, but this is an old file

Konrad

