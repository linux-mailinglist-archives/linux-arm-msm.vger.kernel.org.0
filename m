Return-Path: <linux-arm-msm+bounces-52527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9EEA717BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D70397A4236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B1B1F131C;
	Wed, 26 Mar 2025 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGfyAtId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59151F09B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742996878; cv=none; b=tETERE4SSHSYzyK4Y1W0FOtlslN3K+0helGaIwHp0Lfpm7gk7/5/wEjmoRc2gD0+63n67pL47ck904JiL+F2nb4gPtrJt5szMdoXGEjPPjdKL2Vdr8unk+0F6j9tCajljqat/K07UpekQSnCLuh36HarnF4IGsYDawWmMaogTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742996878; c=relaxed/simple;
	bh=HM1XM3OSq4yEVZb5m5XmPCyWxGqw8sZDWhXSOtE8AWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CI0Hi7S2qAkXiLK1+JtL/dY8rSo1P4Eq8gys9ymfuK3bMDbUvPeNZ/6wIhSB9oQpNBD/za18242KN+9yjTGeh1vqEhNFqEtwVo6QjcYxFMHtI5BqhYiY8cm+3293LlOeyAZfmyc8LirW37b5PrA+7DCyMaYpdLSySRrgicjP+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGfyAtId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q739wV006167
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oAnsNYobYXGQyVT8GaIUO6lv6WY6ogscB1FdUtiA198=; b=AGfyAtIdcyTF6b44
	fjEmGfNn4kKFyBMbqgA1Khyhcjr7fUj8R8/6dxgDuD+5RcZEcrHwtEJW5J61YmSE
	PaUNe4URcczVGRQAwdomQ/nXXdV1uPu+PKvTXm88dj9f6rGrZ3hUHguZqC37ThNp
	4aPim4Oq9nN3EQdlO9/Qaj4hFCE8JpEDfYpR+yLRe+Hep7772WkfeFtNc2t673+l
	02+t91hPhUWLi9I8Dne7YcpqCzjzoQCz6IIxqeakDtx/wWd15kX+NbiMyAaxpPX7
	sqplzw+F5gdIs5ywuegZUjzR++Nkv7zAlE8f6JJQ4vNHNMwwT2DUeXSfNdT8/7gT
	YjG2IA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj1gkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:47:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso13678786d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996875; x=1743601675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAnsNYobYXGQyVT8GaIUO6lv6WY6ogscB1FdUtiA198=;
        b=mUvHNdEnIZXaoOjFRGTk4Flrqg18/vkVcP91Je2NSQ7PRY+5frYDa9E3ZPTmv+D83d
         HnqYpy99uSJx8l/7PceBlcOWhO6Y1Xy8XfXtH/Bb9ZHdhh0H+y1jCi/3WeR27HHCU3Vj
         05HNASgDwResSX27thdukHQBR10WKXe/ykwdEN2180piAeMAnvZppSLTk2YFPcf/TOZr
         k8hkspb5AGdHiam2VKPZicEk8A6Inx4wnqWr730Ydu6eS8SenWZvbq5eBs1zmF5q/154
         j8AL6VrM6aJEZ0dIjiAW29fyJ4nOWsGjuVBANj77chXEzxq4OPqfA0hBNw9jLQpfhgz6
         07IQ==
X-Gm-Message-State: AOJu0YyqJZZm024gp7EH8bQk8hFEbHRwVh6gAd9wnEtzTYebaYsGfe0+
	Gj5qWagMeMa6og9tPo3pvu+beEXsQPX7lFzy5OdCeyCYXFwg6s25MYgkTNL95BPdBTYvCnD33o5
	X0zLcWPAiyWnaBlLTy7zPIuY1fZCfEg1jj+TbWnPkDQq5nrPD5mRdzsqNVv4EsQxS
X-Gm-Gg: ASbGncslEMsTmd38pjSM8zqnjJkiL2u8SpESe8Vs6r89f0N3L+xFsYc6NMjOTXwRqTq
	UNHala6+cXHR7GD4apR7ExVAXAvR0yv23328wGTC3fRg4F/O6Sqz19nZpgnUjUnIu99duvulf5C
	nCx7N6zfD5AKY8QVM+etLm1Rho+54SkMLvcwH76+UCIPUZHog9IApwV+3jg6kI1OjpPutS5+EYs
	HVdWatdbEzxEaT0w2O8Vp1mpyueIQaSg+awfVKaq9LrV7e5DLtXPArNfayoE5Ww8V7fUW4fiTAJ
	mDQQF1/fggCC4M4XDaSDKzo71Jf4KQVLZf9jIKAba1p/OsJS2DosVdshLeuVCklriRilhA==
X-Received: by 2002:a05:6214:e6d:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eb3f31f775mr103660566d6.9.1742996874792;
        Wed, 26 Mar 2025 06:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFd5B6zyRzYrno4RuXc9G89CRxgNBc2jAwg6fxiQ+Jm/et41PRpGY6sCmOIsIZwNP0HOEUxA==
X-Received: by 2002:a05:6214:e6d:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eb3f31f775mr103660306d6.9.1742996874282;
        Wed, 26 Mar 2025 06:47:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e5128sm1034146766b.59.2025.03.26.06.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:47:53 -0700 (PDT)
Message-ID: <8b7151d6-e2e0-4561-954d-4a74126b4265@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
 <20250324-sm8750_usb_master-v3-7-13e096dc88fd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_usb_master-v3-7-13e096dc88fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7iS05mbyrzO2b_-SjE5V3OckpBG8bza0
X-Proofpoint-ORIG-GUID: 7iS05mbyrzO2b_-SjE5V3OckpBG8bza0
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e4058b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=x9b32qiywL4GtknhJMwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=798
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260084

On 3/24/25 9:18 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;

I believe this belongs to the PHY, but the documentation doesn't make that
very clear..

With that squared out whichever way is correct:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

