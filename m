Return-Path: <linux-arm-msm+bounces-80055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D238BC2A3A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 07:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BA53AA5D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 06:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BED91D416E;
	Mon,  3 Nov 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNvsKfex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYmcuWWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B81111A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762152451; cv=none; b=ePJDPEG164yn19rY2dNdB9r09+mXksXjRad7UhYw8bA8peqThjZH5gBdUS34Wj7n7WRfhSnLNRdpxVbPAoQ4KiIwQmn6O+fk26lg8kd9D9P6LkiLuFrLa/osJmCD3nP5UOCsgUFzbdJxjVhb4AmaC5/ByrNoVe08twa6159px7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762152451; c=relaxed/simple;
	bh=K8N8tbeNdymmtF/uUrSXOUq3zpP/auTGLxwYC0DKoJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSKO8ruJnTsA2gzTb9ovuoW+8Q9oqTYRF1+k5TfolUscHPM0agnDdzUAnqTGdzBWabDe9VM1ehQrNH0080VxeUAXaUepmW8RLbvT46qT3GY+HtubFeCnDwhVEJpo3W0SdBt2JEfD2/kQ0NwhUCjhCVAIFbkv+/Mi61dX85EUu7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNvsKfex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYmcuWWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2MYS0m1320887
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 06:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUprMWB9f+U/dF/iWyMObNplnlmDPtZSAvvvIjHdoLg=; b=FNvsKfexnK7umLrm
	6rmxm0jsX41skorefYnK1rkEdxkVYynmSNMscUNYDIke/3EI99Bjo8AlSgKFT+af
	URtmmKyIJk61s0dZjgt4/IK/kBkkYNgi153IFCsMQ92BmDDDS+x1NlQhXLmS5CD0
	j7bpyLK87F+94xwTRhFDGeRD+Kz8rsXv8zNjVRi7D6Yt+KVkMTY2MnDy7rnE80wZ
	LDNv/GcLKwychYiH4SeWsIHcE/X1Gp9OIRXM1HLUbL/5u/S5cTECjn4IFgBFolVy
	xURvfluQX/ztRFP0WQmu5x4Ath+/RQK4U7+Jcwl3ZsnL+GVuLVQ0EsbtVIiqH+ca
	rx8vzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57webs4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 06:47:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c261fb38so1731238a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 22:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762152448; x=1762757248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUprMWB9f+U/dF/iWyMObNplnlmDPtZSAvvvIjHdoLg=;
        b=jYmcuWWB6kzjDyMbzrtIZd/uhAmuTGaIDCDmEJ7SMX8ZHD5eeXPFI4XQl3U9M0LJVl
         hTNoCfy67TjhRgJzwf6ltD1ECFz1+pJANVi4pcAs3s4eTFppeotQUwI7C53YQ2iXrRX0
         D4oAythzO4lxZWw+dEUIWL7DAmJc5UW0jJ4yexVy4vMM+O2Cr0Fk6nZfJ5OJKutfTvUb
         r6wvttkW5sopDqnX27OvUlGFkUYHZ6nvk+rf8tGcvPkrqMyc/L+DpCCjtTfHRfx5dvTO
         XvM+DGyz2/n2AKz489ImrjzhQyUqe4aW3J3XcYHtR4sawCFvFN2XAvO7ZYlKZjI4g+uZ
         1vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762152448; x=1762757248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUprMWB9f+U/dF/iWyMObNplnlmDPtZSAvvvIjHdoLg=;
        b=VFncjlRR4MiomiThs9gRPivzqFk0KnRdKTlZproKcset73hoWyeuqn+rjpc4TyZUCo
         fgI/9yVaDbbuVTpdXhBxMGRg7rrM1sl5pi12DIM8Y8u5RP4MdePwyoYmn7Gu2XU8m1Xd
         cr7lel2QGk4IJhJ0sb01VS9ubnnr7VMahzIwNoTItaygv7JSV+dRSqxzaL7kGLybCdoG
         Lf5kAy3LVx0eKPeLEuBfJcy/Hyk6bxMYPKKssInu2Fl29gkY/JNSMhEKk9eAEParI3KG
         kzF7JUZQwzQBatrFSFLaGTpNDdpDp3NQugRBYdf4VS2rq2KP7xr9bUdeSJXH3B+4QX+a
         RMNA==
X-Forwarded-Encrypted: i=1; AJvYcCVsKMiTCkCZVx54I0U8HEUBo1YAflop4ywprUvmOA/f3jEnder8sJpLXd5vJfFm43mX7qJPqTn9UhCKmzmX@vger.kernel.org
X-Gm-Message-State: AOJu0YyaazobKePjA9ChT/AukCPlJywp42jN2oLP8Tw00AFl0Zatvdq5
	YfZ6Txowh0WFSN07jfbt2JxEwYOj5gRMvrLZndVfQ4TVzia28JjwNW3+2lhJTi0pH4/gvRNHC5W
	OsNThyGCIHY4YJLL2H47y2Zhfyyc/gMb0J23rjRP3/yMP3y19dTT4Tq3AfeEMB8K76WgS
X-Gm-Gg: ASbGncuYmZH1rtOonzvdSfc1+CKSuEgw5j8aomJELJqp75cM8P25hV/EE8CfEiAJpFT
	2Z0TxN3SYDYDmccJJTpiMzLGOsbsGyQuvODNAuRsy01JAjSoIBj9+WRZwIBI6V8qE6dZAp8LfFX
	jKCuuYy6F6fLMjgGVxmQyLlX6BN8NBriDRxofxG5GW6pva74/bZbwduoqAV5/0jSJd10JL/yxLa
	5bED3Bd12DCWp3UfQEi8rJ+ZUCVjTe6euL6tKX/oefEOkbEgprK6+OVq4KzFDE/jT9+6XhmM6ud
	FjsvTNFg5fZCVqeVgoLqWHy9f31VZ7NSUmhX98VpFKXyTXY6xO4glVab20RpPL6Aap5JEcT+1IG
	3mfrThmCC/QlKYRGy5kX3GxhJCRA0fUk/Rfwedxl86IZ/98+7Pfvof8CiQi/uQIughPZBAg==
X-Received: by 2002:a17:90b:4a43:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-340e4fb1b03mr6037094a91.14.1762152447859;
        Sun, 02 Nov 2025 22:47:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy+kT8FuWYj763z0FG99urE2PvoS18tOAq5/lq09IZ1XFpuhFhefuhhfSzK462jQV4mZXcuw==
X-Received: by 2002:a17:90b:4a43:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-340e4fb1b03mr6037076a91.14.1762152447310;
        Sun, 02 Nov 2025 22:47:27 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992090sm13526918a91.5.2025.11.02.22.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 22:47:26 -0800 (PST)
Message-ID: <d3e4a3b1-4785-4b31-9db5-00ebb8704c01@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 14:47:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add header file for IPCC
 physical client IDs on Kaanapali platform
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-2-62ffb4168dff@oss.qualcomm.com>
 <hwrbtnxy2jy5wimgvr6s4de2iuu44njnefmxlgzn5onj47b7b3@l5nj3zhhgvc5>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <hwrbtnxy2jy5wimgvr6s4de2iuu44njnefmxlgzn5onj47b7b3@l5nj3zhhgvc5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69085000 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B7Gn7m6QUtlGWARR1OgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6jKt-9qsJ4PqQxxopdYW4qf5vhzu5tpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2MiBTYWx0ZWRfX/mWrxUskdgIn
 QTdViOsDqN0xepdkaH7c0/+EjJ0kYOrjeU5u6bWiFaZE7ZI+9T8KDNzkUXZO7RzmX9/HHedeH4Y
 gSJei0XAMEPIqr5BFjmVeFQ8x4fxYn5anpAF2bdFHsgzdph9a5NK54RHDqjn8ojntIA0yFEIVYn
 YaGpSg/Mjkf0u2q4z+Cp0l5F1O/wlFlorOhcGv1oKjaAAodDPvTSfyL9ANgpg6XgKJftqu2B23D
 Mj1DnHTQtasOc6mY2W+ECl+c6nrLQ8s7SjL2aReziNV18CoZ3yExE5ZhumUsL5jOC8RHfYIMIv7
 wUI+O0b1M6I87aWXI3vZThHnD95fzqO5JCWQBvAn6fRsVBzjS5qf48mxAaXj9TYX/1d+4y0X7Nv
 tznLNNCZH84jPxxYxgasH6l0jkDjgw==
X-Proofpoint-GUID: 6jKt-9qsJ4PqQxxopdYW4qf5vhzu5tpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030062



On 11/2/2025 3:07 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 12:41:45AM -0700, Jingyi Wang wrote:
> 
> Whenever you have a subject line that ends in "on <soc/platform>",
> that's a good indicator that you're missing something in the subject
> prefix.
> 
> Compare:
> arm64: dts: qcom: Add header file for IPCC physical client IDs on Kaanapali platform
> 
> with:
> arm64: dts: qcom: kaanapali: Add IPCC client IDs
> 
> 
> Also, now that this is "devicetree", it would make sense to merge them
> together with the users. Or at least after we've introduced
> kaanapali.dtsi...
> 
> 
> I don't think you need to resubmit this though, I can fix up the subject
> when I merge. But please get to the point where it makes sense to merge
> them as fast as possible.
> 
> Regards,
> Bjorn
> 

Got it.

Thanks,
Jingyi

>> On earlier platforms, Inter Process Communication Controller (IPCC) used
>> virtual client IDs and performed virtual-to-physical mapping in hardware,
>> so the IDs defined in dt-bindings/mailbox/qcom-ipcc.h are common across
>> platforms. Physical client IDs instead of virtual client IDs are used for
>> qcom new platforms like Kaanapali, which will be parsed by the devicetree
>> and passed to hardware to use Physical client IDs directly. Since physical
>> client IDs could vary across platforms, add a corresponding header file
>> for the Kaanapali platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali-ipcc.h | 58 +++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h b/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
>> new file mode 100644
>> index 000000000000..125375a4aac0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __DTS_KAANAPALI_MAILBOX_IPCC_H
>> +#define __DTS_KAANAPALI_MAILBOX_IPCC_H
>> +
>> +/* Physical client IDs */
>> +#define IPCC_MPROC_AOP			0
>> +#define IPCC_MPROC_TZ			1
>> +#define IPCC_MPROC_MPSS			2
>> +#define IPCC_MPROC_LPASS		3
>> +#define IPCC_MPROC_SDC			4
>> +#define IPCC_MPROC_CDSP			5
>> +#define IPCC_MPROC_APSS			6
>> +#define IPCC_MPROC_SOCCP		13
>> +#define IPCC_MPROC_DCP			14
>> +#define IPCC_MPROC_SPSS			15
>> +#define IPCC_MPROC_TME			16
>> +#define IPCC_MPROC_WPSS			17
>> +
>> +#define IPCC_COMPUTE_L0_CDSP		2
>> +#define IPCC_COMPUTE_L0_APSS		3
>> +#define IPCC_COMPUTE_L0_GPU		4
>> +#define IPCC_COMPUTE_L0_CVP		8
>> +#define IPCC_COMPUTE_L0_CAM		9
>> +#define IPCC_COMPUTE_L0_CAM1		10
>> +#define IPCC_COMPUTE_L0_DCP		11
>> +#define IPCC_COMPUTE_L0_VPU		12
>> +#define IPCC_COMPUTE_L0_SOCCP		16
>> +
>> +#define IPCC_COMPUTE_L1_CDSP		2
>> +#define IPCC_COMPUTE_L1_APSS		3
>> +#define IPCC_COMPUTE_L1_GPU		4
>> +#define IPCC_COMPUTE_L1_CVP		8
>> +#define IPCC_COMPUTE_L1_CAM		9
>> +#define IPCC_COMPUTE_L1_CAM1		10
>> +#define IPCC_COMPUTE_L1_DCP		11
>> +#define IPCC_COMPUTE_L1_VPU		12
>> +#define IPCC_COMPUTE_L1_SOCCP		16
>> +
>> +#define IPCC_PERIPH_CDSP		2
>> +#define IPCC_PERIPH_APSS		3
>> +#define IPCC_PERIPH_PCIE0		4
>> +#define IPCC_PERIPH_PCIE1		5
>> +
>> +#define IPCC_FENCE_CDSP			2
>> +#define IPCC_FENCE_APSS			3
>> +#define IPCC_FENCE_GPU			4
>> +#define IPCC_FENCE_CVP			8
>> +#define IPCC_FENCE_CAM			8
>> +#define IPCC_FENCE_CAM1			10
>> +#define IPCC_FENCE_DCP			11
>> +#define IPCC_FENCE_VPU			20
>> +#define IPCC_FENCE_SOCCP		24
>> +
>> +#endif
>>
>> -- 
>> 2.25.1
>>


