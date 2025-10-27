Return-Path: <linux-arm-msm+bounces-78837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC8C0B945
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 02:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3AA188C2C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 01:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6168238150;
	Mon, 27 Oct 2025 01:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WS8vvP9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208CA23645D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761527586; cv=none; b=SVbGg0IYmUdqGbpBFHaf2VtVlbeEUHEf8N2FqwsWH8hB8FFkVZQ/1ojfmqXWjk/eYDGYRzZWd80FCFgRLbjwbpoHijC0jtwWOFjq4Lbm1ToOE1/ViVY1ZYMw5GULhKkx053uXIk5AWXpS6pXEgxRT5XzuglTBeWMXSJvmWn82ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761527586; c=relaxed/simple;
	bh=CTzZlH949URCUMHKj2Bx8yXAJayG9lNr8GvJaWnFk1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+PDHo+xflTHUpRgHwx4OYehFxH8JKVH2gTqDJn+qlPn/MUaivwRknLBEY14DVGQ0cXs0yn6Z0bZFsXS+VssonrTwNteIAZ/QA95xBt9T0dWC4QWPUZdiHj9dE8RkhUUxp8fFJtqGu0YXJG8MoipZ9Hlf4gWNghQ498LItU75iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WS8vvP9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNUpJe1151096
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hl5RIz7q5cZALdMW9jc9PqJdIo41tTzsV6gVA6splpw=; b=WS8vvP9Bc1YlEqf3
	ChxwhEcWbTurg9nofOX5nQjqlZ3oaHB+bkDmruL8+TDsVYgmzh7E0XuKHjHXUgUD
	mKfs4v0VVv5hcZdy4EyqsICtyMjDSNHqz2REN3zJJreb2T7wFXaBMDSW0VI/YkZY
	wNEsDFtA2yRyL4bQ61ze3Jo2sEXDZcKwJgZ+iG/aIgyyHFCVF5F0vBA15ez/SNJ+
	HFBegEHerRW0xwLDvvJ+h0R8pb9q1O8mqhi8EG9zaEz/cTYBPZ1LhroKhv4lTczh
	SDHE27ukmHkJ4WsFcpjiVTUcuMGIxYIx/6xLLaUPPCx1V7ELN4jpPk2YXordxEV+
	MxV9fw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxtury-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:13:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a26c0c057eso3609134b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 18:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527583; x=1762132383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl5RIz7q5cZALdMW9jc9PqJdIo41tTzsV6gVA6splpw=;
        b=BeX4JEANo7eZfgMSFrjd9RmmE9Ui3HWSUZqm9V+pYCVMlUqoxFq8RVzq75LGm4hvUV
         GJ4rzQSZQ126bShXBkxt6g3ZzYEuqqKZatP5U6AX2lpyCcy9SdrAkxjvkkLLTcaEQP8H
         8gbYOB0ELvothxOH/dpv5Z3i/eVM7oTp7lHc0z+ykayFftXDEUvmdv8TS1yoV13u/lXW
         9jK5A12bvlfvNql3JpHw1jM892yPzUKStT6YJ11B6IovnkkkqbxiWwYm9FpHg1MoCh6b
         WG9VhiXhBIYyRXOxD86W4Br/BBUMt6MwgjTUC3bsRxo+iaLu/T1IwkCji8twRegvmA27
         3M6Q==
X-Gm-Message-State: AOJu0YwI5lCotVL/+FH42SASn/He1FPALvKsp9EuLNxB3EphybH73bBG
	BN601+SiZ+7wpR8cf6vxqoQ5r4gDmrAlBMq5xH/HWb6Q4H87uKmfYx/7Dda+9Pi5GBaUmjQMpL+
	oMEB+Jw563Pzt/3KYgF+DUfh9306+cMlGpLoCiWGnQD0CJO/WAjRWcZmjuBi2oQcr2Nfs
X-Gm-Gg: ASbGncsKYi5P5NWT1STK1ZdmQTzpsuBYEMNeGS6MpV3ZR2h36z/LACfsb3SqwE9h6F1
	TvPhvhmkOzrwVWUuZ5ngl9ghQ+Hq+FbyRLEgEJKnDKH8ne+e40Mf5rC+O3BsGBwvRxJY4XuydgP
	GfV3UG+3q29bnN+gnZHRtxkFAu8cVMP4xj/CZVT4M+NpRlAkiUYicM2Pviqvahbzh58fSnsfRJe
	xaQCYn2H7ebpv35R0fx9+Som1Du/tgme7csXYVNCfPkBuo/vRGa330DB3+gFFdBednOnaI1uEt8
	MTVnlNZrlv3VLohYgI82DtAxRVyyJUhYhG050SQOct7BWES9CM6Dyo5ZnYQzlIotV8vMkWRFwGW
	PxS8qXF1MCwBkFUmYrQZwxArt5a6NpOZtBErgG4EQMFXPKnl2gfToeVBm/k6Xp/Kh
X-Received: by 2002:a05:6a00:2d8d:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7a220a0708emr39044382b3a.1.1761527583072;
        Sun, 26 Oct 2025 18:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwxHX6Hs7IIzNfXuuoyNVi+3+O+F9QhbHQR7TvPScD3PK80IKxaPMX716EmWsqNR7ZhdOo5w==
X-Received: by 2002:a05:6a00:2d8d:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7a220a0708emr39044351b3a.1.1761527582595;
        Sun, 26 Oct 2025 18:13:02 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404dddcsm6101318b3a.38.2025.10.26.18.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:13:02 -0700 (PDT)
Message-ID: <ea66f4a6-1918-4674-8aae-0903adf26bfd@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:12:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] coresight: add static TPDM support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fec720 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lW4bRxOBufLHntc5OVMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 92oUS1RC4ZfpUddfayeC_MVi_81fxnJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX2O9dBoEepk/2
 DgcXmt9NTvyh+xWrGwyDdPqg2e6trI0Yia//Xfpxeh+jDOl5G5wPlnhk4kbgiXp8KKatWFgiC/q
 X93jtIqLuxmgVzMisw+MTs8xWOis6KAllxGnL5IIujGZT2l6BGnIaW1ZA+utrB82zKK+UZM+fb8
 K3Wl6QAGFSq1P0WRP63QjZuOBiP6LFFTIGo13UH5r70wgz+38lAlh9KYsGmdmhRmDuXpoBMIpOa
 bwnpw6I7N+ECy98b23YuucTNncgpDDsHUULCjeJQRo+wTxqBhc0nCVCVidtvcvu0R6vkCHNzc3J
 TnhPoL/P3bkhmGL/HU0NR67Ks3mOTcj9zrMSZ8v2urvuy1c0jsGJ6AH+Hh3Cvr94JNqeGK7SJKg
 zJGvqOGr8o0klITI+L1XRdi64BGSSA==
X-Proofpoint-ORIG-GUID: 92oUS1RC4ZfpUddfayeC_MVi_81fxnJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270009



On 10/13/2025 2:11 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Meanwhile, a function has been introduced to determine whether the
> current csdev is a static TPDM. This check enables the TPDA device
> to correctly read the element size and activate its port accordingly.
> Otherwise the TPDA cannot receive the trace data from the TPDM device.
> 

Gentle reminder.

Thanks,
Jie

> Changes in V3:
> 1. rebased on next-20251010
> Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Remove the dependency.
> 2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
> Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (3):
>        dt-bindings: arm: document the static TPDM compatible
>        coresight: tpdm: add static tpdm support
>        arm64: dts: qcom: lemans: enable static TPDM
> 
>   .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 +++-
>   arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       |   9 ++
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 148 ++++++++++++++++-----
>   drivers/hwtracing/coresight/coresight-tpdm.h       |   8 ++
>   5 files changed, 256 insertions(+), 37 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-add-static-tpdm-support-330b71d6d0f8
> 
> Best regards,


