Return-Path: <linux-arm-msm+bounces-47479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D69A2F870
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39B23A33F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FEF25E475;
	Mon, 10 Feb 2025 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3onEnb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582111F4634
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215235; cv=none; b=WCN9eE3LO+n+E7FiO6Qc1b9mCdvTrtfrCHdY+j/gr7cF8019qLF1ZlISK7d/VM2TnS62ygnSdvyGXF6ti79v0sjC1BXfDuOJwOhLZ9TAa8oZDg9byae9/tRhde7gjlwjx8JVMYEex3gJJoHplbqBdXNb4ieuj0B0Rtpnkdwj6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215235; c=relaxed/simple;
	bh=2S8sds+FiM0QeleBbqPHslxZ1ylft5S/XBauMQ/noPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkAFE9vGJ3tJlNp4I30qZMT66AwbJt/aZUIYuS8A826q2Q+SK6sPw24XMVyqi+CftDV7J+ktJ04cRGL8BdsCX433WW+nap5eVbnPA7sAvwk7UJQTJlVk2YlmBB/tssUxxOUk9fBBBwofId8/tHrXYyJVEiyMA35tXjcIzlYVRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3onEnb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AEktCX023405
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHTGfvXpoiSary/QibcMXc8tUfGDgzwkgTomq3eCaA8=; b=d3onEnb7b6F2REdr
	agGZdVd0ylJuhAB5T1LsBZYP9jou9ZsTxCYsQ7jiqELxet6WR4g7AWTJSYia/CEK
	/RMJhKmHHDDQXVrrva4Y8rOHaecVIcZKY6AMRMw5Ah09H5aqsDNqA3PeRpxg87eV
	4JqHqbTpmwKCj9akV+m7yeBff2yF9YghM2gpAdwCATRTavOSp88Qq+ITX8a1MGCA
	3mp2HlSMglmFR2as9gZhW3cgU/NXxNfUrx6aOXT4mWlVXeLr4ZTIB+OxYCz97BxP
	xQ/VTcJD3DFrDVhrVeFWRyU2E8cvijdrO1AShoCrG5Yp+fGbHfZsqJBGgkk2iV3+
	oWOxsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyncy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:20:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46b3359e6deso13463471cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739215232; x=1739820032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHTGfvXpoiSary/QibcMXc8tUfGDgzwkgTomq3eCaA8=;
        b=qztzb7TRaDxZvXJ/ubT78F2Pz+c95k8FjgWYz4Ac54oFIpdYjSQsLE47AQxk5r2CLP
         VV21NqyQr5smPNaq8ndx/ocsJop04pQG1ARpWledYqZbF0OjMGI5Tj/Ll3Qm29LPqGEl
         xIBf4/4yq2I7x2AejfCITMXrK7aTdbjqHjjeql6Q4LLK9xsarC27PHIuoomWLsUugOTg
         fBiASBkA/qWA/q9FQeoJ9ak+mqXfNyBBjspIz1/V6gDqUx2Ql6rEfo2zoCCsUpLAnOj6
         gFgHvjglwHcQoRhmww/cVd193CGT0/OT0QCkChI8Z2TM14kULekU2fWdBfdIygYUe2pH
         HtKg==
X-Forwarded-Encrypted: i=1; AJvYcCU7hAw6b3YcJ9QksbKk4zxNcFTSkJcSZHpgOD3vCVjiHBT7MFqztQUoUv9z90GlyuTFxjkue19j09aGG7+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58/b9tQukJbqbxPFNtqf+UjkBZ6HkdNrct+l6KrUF3UFoGlOO
	2GjIuP0ixKhPv+Q38sIlznIS3u47KAkwzAXXb2j/d4wAKTHEf6TJRQca7EMhDbAej8cTWc7rCO2
	y4Vx+30RuXW30T+jSpkH3+ePggDBme/sxuahWz7B6gUUazkRZNW2gYvZK0rc648vm
X-Gm-Gg: ASbGncv/UUdYLybzLv4cbY26kQlWuYeAcCu9BDsip/adwAJV/ZynXddqVaNdT8BCC44
	mLtMMs3ojqjhvjbKsUS2bqFoCpKV37c7/G0G5u8f9lHqaBwJLpM7WXGdOxdF2DfMfhj9Wv3pT3Z
	kdpMuFlH0cbHIKfLZqit+2e7z5IVUGj1+InUE7sD04IfdBa6Un9cnV/hnM63qXJeGAlKuAWnTb1
	636fo3sSkbnlbPwyX8pgr32DEEJhJIjQGRaiU8cWZxAWz8cecE5IaVRb86OVjC2QdYKfwH7NNKK
	POdMv+RPUgBM9KUEaBavfYCGcO0Tdb6KMHGaxIB0wrzkMmCzEeXbvdzi0SY=
X-Received: by 2002:a05:622a:1c15:b0:471:8a2a:d9b3 with SMTP id d75a77b69052e-4718a2adb82mr41530501cf.3.1739215232125;
        Mon, 10 Feb 2025 11:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhPZhlsQZyrDwqBCWlfYeWNtHXkddUkvcf5DV4cGq6f1WRrWGhD5y1vSBMq6awgol6oyxogA==
X-Received: by 2002:a05:622a:1c15:b0:471:8a2a:d9b3 with SMTP id d75a77b69052e-4718a2adb82mr41530101cf.3.1739215231617;
        Mon, 10 Feb 2025 11:20:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a58abd76sm549411266b.26.2025.02.10.11.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:20:31 -0800 (PST)
Message-ID: <354f8710-a5ec-47b5-bcfa-bff75ac3ca71@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ferdaevlfrpf2ewzcct7mqyxltvmt6aaar4fujxfehrmizm3qw@aaroprnpwlxq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xjXzfg97_88LMopMPUmzJc_VoaijdI1G
X-Proofpoint-GUID: xjXzfg97_88LMopMPUmzJc_VoaijdI1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100155

On 8.02.2025 11:06 PM, Dmitry Baryshkov wrote:
> On Sun, Feb 09, 2025 at 12:47:56AM +0530, Nitin Rawat wrote:
>>
>>
>> On 1/14/2025 4:22 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 13, 2025 at 01:46:27PM -0800, Melody Olvera wrote:
>>>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>
>>>> Add UFS host controller and PHY nodes for SM8750 SoC.
>>>>
>>>> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
>>>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>> ---

[...]

>>> Use OPP table instead
>>
>> Currently, OPP is not enabled in the device tree for any previous targets. I
> 
> Excuse me? ufs_opp_table is present on SM8250, SM8550 and SDM845 (and
> QCS615). So this is not correct
> 
>> plan to enable OPP in a separate patch at a later stage. This is because
>> there is an ongoing patch in the upstream that aims to enable multiple-level
>> clock scaling using OPP, which may introduce changes to the device tree
>> entries. To avoid extra efforts, I intend to enable OPP once that patch is
>> merged.
> 
> Whatever changes are introduced, old DT must still continue to work.
> There is no reason to use legacy freq-table-hz if you can use OPP table.
> 
>> Please let me know if you have any concerns.

Go ahead with the OPP table. freq-table-hz is ancient and doesn't describe
e.g. the required RPMh levels for core clock frequencies.

You should then drop required-opps from the UFS node.

>>>> +
>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>>>> +			reset-names = "rst";
>>>> +
>>>> +
>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>>
>>> Shouldn't cpu-ufs be ACTIVE_ONLY?
>>
>> As per ufs driver implementation, Icc voting from ufs driver is removed as
>> part of low power mode (suspend or clock gating) and voted again in
>> resume/ungating path. Hence TAG_ALWAYS will have no power concern.
>> All previous targets have the same configuration.
> 
> arch/arm64/boot/dts/qcom/qcs615.dtsi:                                    &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> 
> It might be a mistake for that target though. Your explanation sounds
> fine to me.

Let's use QCOM_ICC_TAG_ACTIVE_ONLY for the CPU path to clear up confusion.

Toggling it from the driver makes sense for UFS-idling-while-CPUs-are-online
cases and accidentally also does what RPMh does internally in the other case.

Konrad

