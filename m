Return-Path: <linux-arm-msm+bounces-48990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E0A40011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1400C3BE367
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F2D252907;
	Fri, 21 Feb 2025 19:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBIciXhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B11FF1D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167753; cv=none; b=sEnAV29t8VBBIaL3UMjRcIiU32uHu/UlUQ4c9jTeRgbTBqahsVtQlRLfAN4isgfYypEmLXnX9fuyHKsQGqsJn46Ft2zZphee+PDEZPs9DKO8UPguhbrOPaJbTBZG2WyTN8N9ybhvoxDHYR+ii6Kt4VUuqIGAd+E94FK5P8DQOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167753; c=relaxed/simple;
	bh=r3vp4MOiw5PdaVSDdFOlW6Db94ZsFIRUn1IwFTioiaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hE1UZgkbUzyga45dxBVGInrFg/0iMIvM2bOtZou5lb7ESbms0cmetyIXhBbxWCAa1QgyokulwgAnXxXh8HLbGLf32tbwMIBuyrcvRZhJIUMu+hqqLRZ1aUaH0IABC6b9HVnx40QgaK7APOQO245NEhs536JoGi8/ZUxxded1eT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBIciXhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDDCkR031746
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9CI4ewUgEyzTJqAzQB6Mt8Kix2RX6oXH+KrXwXC90s=; b=RBIciXhZn90kPric
	hEW+cQMjH2EOYIKX7givOraXeRdCUfpi6uA2WaeJz3ToIKYhe0qyI+MTJHKvOsrB
	/F7XF4t3XHVc9ursYVISRENJwo/V5Z09jV3deCR5dPuDUFeO3Al9vxoFpfgrkXYm
	pOraMOQrZceF1sqmQ+LCgFKV/syTMpSDtIn+zBXjRRI5efW48mgoxF//PkYAGqRF
	Zp4R/+aI8lOeWMam8GHbuP43Z+WdlPSuuyRNS+JlVbMQfO9KDUaymFT+Yhyknprg
	CAQ37fakzASxuBgD29a2pnsL0c2tpn8lDqgKFqtNqZ4N/UaBiNI5qr7MhYCiMxWA
	wrwUDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5k14k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:55:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471f4687399so5362171cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740167749; x=1740772549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9CI4ewUgEyzTJqAzQB6Mt8Kix2RX6oXH+KrXwXC90s=;
        b=IDMKxurKC6gPpydMAYZXD+lcInHzyiG4CFJNKM6fF0B6BqaIKDqTFHNbdkq0dGztiD
         vZGjRWVxccBvhEFlNy6G5/XkN9+KAqQK+HTtwDZnFnhEBR5EgWQr4JqKyScA8okhH5op
         eucdjIpPpQEgQHPcPRI0RZ9WhZkelLlWiMRghP4wphZoFPbBIbs4Jv1HvIdLZJCkDZ+5
         v3cuzM0fxeP9k3L4nXgTJYD7rFHzTWCaLlEuvHX9gfoOV/a1OVNS2JEpY3FfBx7w6NiL
         hXhqyCdhQfcOlgE6RsICFZKJxkc1enC/azhjGAmjysWZQdqdaaNM/hlCn3liaVP52+R5
         Zx3A==
X-Forwarded-Encrypted: i=1; AJvYcCX8l4UMeOG0NdJKjCnCtFwh+1rPzCpYGPqDTMuG/6I9cKeoE0KIVCxv8K1nRfamoJU4/6FLgHrSUJMFq2o+@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpxNcv9I/RhU8RewOBu5VBTpOJBCUmyJ9yYcuowEO7y79/d1t
	NzsG9s2Fu4RAIEuVp22gUbLoP5mdhHwGRocDUDajI9HJXWIYH13n9ZGGzp9p313Iln//+2DM3bS
	9RWyo/SjaBZ8GZwezXvqInDZ6Sw7f9rq/PlOxqheFRpwSFVJ/CjbgTe/wdlo7S8ne
X-Gm-Gg: ASbGncsiw6W6NXtRC4WYq5t6OY0bPD4GFb1PHaFgmaacvwLjE9hR6aFG7bsw2CWa/Oa
	94cmhMVJ4XJWrmE4KzX1ijtrvK/gxBlgCuK4+YEwBEp0Jk/eBDCgCZdnDIjmFJIxS2ghjDw1s2K
	WtrIqTOUnRolTv0qO84ZDoBHkO2AWvQ7RQHI+B21+dF7uuPkxpRyqMRwPONhE1Nb26fzT2I3End
	kLj0OCv9wAvcEKTrCIVzIMq5Mi0YvueBWpblEdOUEHlAq188oFxuMcZJyDlgO7WH6KLk3MwJ7L+
	tYF3kkGV4eHLhbrQQMVF0QgNkFPmHbtjOVdipUCdGw6bYhlSFlnYp5gvmxBWKKgcqjI6jQ==
X-Received: by 2002:a05:622a:1827:b0:472:1743:80e4 with SMTP id d75a77b69052e-4722294ffd4mr24953851cf.11.1740167749414;
        Fri, 21 Feb 2025 11:55:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBB57oOz/RtjhV08q10omNd3Gy4LKkAO1OPSNKN9Bm6dX5sHl8k2S65DJngPpO75nLzKw93A==
X-Received: by 2002:a05:622a:1827:b0:472:1743:80e4 with SMTP id d75a77b69052e-4722294ffd4mr24953551cf.11.1740167749089;
        Fri, 21 Feb 2025 11:55:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba0ab1457sm974823066b.73.2025.02.21.11.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:55:48 -0800 (PST)
Message-ID: <ebff1ea6-e4ae-4b3a-9f51-4fb9bae50222@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 20:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-4-b3774120eb8c@quicinc.com>
 <vifyx2lcaq3lhani5ovmxxqsknhkx24ggbu7sxnulrxv4gxzsk@bvmk3znm2ivl>
 <be8a4f65-3b36-4740-a4f7-312126cfd547@quicinc.com>
 <ferdaevlfrpf2ewzcct7mqyxltvmt6aaar4fujxfehrmizm3qw@aaroprnpwlxq>
 <354f8710-a5ec-47b5-bcfa-bff75ac3ca71@oss.qualcomm.com>
 <20250214065009.w4rmrbbejnywh6nt@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250214065009.w4rmrbbejnywh6nt@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cBZovSd_jDUWMXZ4Y5DXrTpKF4w42R78
X-Proofpoint-GUID: cBZovSd_jDUWMXZ4Y5DXrTpKF4w42R78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210135

On 14.02.2025 7:50 AM, Manivannan Sadhasivam wrote:
> On Mon, Feb 10, 2025 at 08:20:27PM +0100, Konrad Dybcio wrote:
>> On 8.02.2025 11:06 PM, Dmitry Baryshkov wrote:
>>> On Sun, Feb 09, 2025 at 12:47:56AM +0530, Nitin Rawat wrote:
>>>>
>>>>
>>>> On 1/14/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 13, 2025 at 01:46:27PM -0800, Melody Olvera wrote:
>>>>>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>>
>>>>>> Add UFS host controller and PHY nodes for SM8750 SoC.
>>>>>>
>>>>>> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
>>>>>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>>>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>>>> ---
>>
>> [...]
>>
>>>>> Use OPP table instead
>>>>
>>>> Currently, OPP is not enabled in the device tree for any previous targets. I
>>>
>>> Excuse me? ufs_opp_table is present on SM8250, SM8550 and SDM845 (and
>>> QCS615). So this is not correct
>>>
>>>> plan to enable OPP in a separate patch at a later stage. This is because
>>>> there is an ongoing patch in the upstream that aims to enable multiple-level
>>>> clock scaling using OPP, which may introduce changes to the device tree
>>>> entries. To avoid extra efforts, I intend to enable OPP once that patch is
>>>> merged.
>>>
>>> Whatever changes are introduced, old DT must still continue to work.
>>> There is no reason to use legacy freq-table-hz if you can use OPP table.
>>>
>>>> Please let me know if you have any concerns.
>>
>> Go ahead with the OPP table. freq-table-hz is ancient and doesn't describe
>> e.g. the required RPMh levels for core clock frequencies.
>>
>> You should then drop required-opps from the UFS node.
>>
>>>>>> +
>>>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>>>>>> +			reset-names = "rst";
>>>>>> +
>>>>>> +
>>>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>>>>
>>>>> Shouldn't cpu-ufs be ACTIVE_ONLY?
>>>>
>>>> As per ufs driver implementation, Icc voting from ufs driver is removed as
>>>> part of low power mode (suspend or clock gating) and voted again in
>>>> resume/ungating path. Hence TAG_ALWAYS will have no power concern.
>>>> All previous targets have the same configuration.
>>>
>>> arch/arm64/boot/dts/qcom/qcs615.dtsi:                                    &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>>>
>>> It might be a mistake for that target though. Your explanation sounds
>>> fine to me.
>>
>> Let's use QCOM_ICC_TAG_ACTIVE_ONLY for the CPU path to clear up confusion.
>>
>> Toggling it from the driver makes sense for UFS-idling-while-CPUs-are-online
>> cases and accidentally also does what RPMh does internally in the other case.
>>
> 
> Shouldn't it be applied to config path of all peripherals then? If
> QCOM_ICC_TAG_ACTIVE_ONLY translates to 'resource getting voted only if the CPUSS
> is active', then the same constraint should apply to all peripherals, isn't it?

Yes and lately we've been trying to catch that in review

Konrad


> I'm not sure who is accessing the config path other than the CPUs.

>>hopefully<, no one

Konrad

