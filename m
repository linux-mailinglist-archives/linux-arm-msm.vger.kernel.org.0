Return-Path: <linux-arm-msm+bounces-78651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E526FC03A75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 00:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5D419C6BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 22:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD61B23C8CD;
	Thu, 23 Oct 2025 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUasmk3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F9C2E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761257860; cv=none; b=jppzFJD7te1wqr7Zi7N5bQ8eb8Cc0jC8G/OnXOTWJe/j408So6lOs+SUocFl0yOvYT52MMNjW7WTkfmYvyxIOtYDtQ9rBb+cmeXCkkD8OdMocEeUTgxoxONK6EWmtcR6oVc0AjJ8DBm+ZKDGK1wfPCmbA5AscLOSj71cONxY96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761257860; c=relaxed/simple;
	bh=0/6mOrOgE2v/EAXBWu5EaJbxvZ9DvIvrGkrUDTUVJBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRLfSVTpZzPPso06Rxb6gFfm0LjDAfUOqrvWwq8LMa+skHRxF8sGaAP5Y03JN8nJLcfkFfXD7dGsjPKaG9laizlKHIV4V6GCgxLHOVR9khGTdXD0waUBzsna1MltqhiV1Ri1OziaRnbCXbibxW87KY0AC5YeQfOH9viX/7/3X3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUasmk3g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEVGg4004614
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=; b=UUasmk3gf49mUvbJ
	7h9Zg0DoBYf71jSH/3zOhijwNaCgP2i+48GuW9H5qosi3VLTbxGHYWQUc/tBO0Om
	VoVHYzeK1ud3GNdPzLS2M+mEosafzK204m8C7oFEn8QyoCkp1Tv512dj/Ji10gMQ
	kO3YAjYEnAm6lakLFShMTXtXvLjFUnoHOZ2mb8tOHMi2qPhSuCcv14O22ZuoV04P
	1szQTcDb5kDMKNffEAzCSvHjrYqo+iBEouBsB3ODzDNLPiS0pA2BDlFFIPISg1dq
	4ECTvchqCaE7OFB7bhUlKuaDE5Wiuy7JVReKkZNV8qizgXCfdm107V4ItHwpTjQV
	5ULgJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k1af6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:17:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78105c10afdso1148382b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761257857; x=1761862657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=;
        b=pnKQqpKviGw7Pi/rKMHsuX1eupRiw1U7wyYfEc5O87/fXggRCr23UwnREv5zSLhLLb
         45TqtS1+6qS3WUxvjePA9tILfYggDKW9w6edDJXW7kPwPmLF4o5Skes06KhSV9gWiGVG
         L0hFpJ6zKBZv0ljylSOfynDd0hCz+7KNUNjhweBpfdx+DgiJAPq8KLOVkiY9UEtontuc
         bkv3vRp9gBL3ubj+nj082uSq+hgVHrhDE8pIcyEIU6VM3Vj6oH4sVg0ixlnp/au4an+p
         Hj9dY5Z4OBKP8b5qZRmOpQQHycuK9jE3I9RY7TPvtCVb9LJDB2fTdXUlbMcH29L+2ngz
         xw8A==
X-Gm-Message-State: AOJu0YwL+AiAKb8i42Y/28OF384BsmHO2R4MniLZGIxBkRz7gP1GJof4
	nDlIpn7sGOlR53+O6AwGkjlJjezqdpuxeqqmpmRJ9ATPqiiSPqt2izrfJ+43OqCJiCznPFmcWOg
	ap1tEJtwRuktr3JxUGaZ7VyftxTEUJN7FzzTOH0qR5O5T/SfDdGOMB86W9bkoibl2m1j4cdW25W
	hp
X-Gm-Gg: ASbGnctA8wSVINFCkpAUMNULWb3S+LvdJsq8m5QHJYiMAOdVoyN5IyBYBf/zaBKGI19
	R++CPjx7xajlM78b71S9U/Ji3W5t7fuO9j8GhCkqhUe9Idn1BAD9RmZPC1OyuMPJ/pEbdJ7wBmb
	y8bJPntXK14ZQ+GOH8riCtJqsBinkdIX5WSQzsMg1L4APfMAFvVNgrO/IPq/Re/871BTPc9f3jh
	g7ts9YRK8qxhGLZp8p3ihXvbotxgFt7yEkRSD9OHcRcrtsR917nAhAkoEoEH8CwgWwpMPr45X2g
	VsCvbWWMAtlhETlFIbXgz38N5ifC59efo/aEAr+QjKXHBilGsSFbgC8qXrHnF5ZN2eVkES1sSRz
	qrZxchqHBK7LlYwU4PyjPLAg=
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id d2e1a72fcca58-7a286765c70mr34286b3a.6.1761257857333;
        Thu, 23 Oct 2025 15:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXCip3lfFlFFHAfU+3zmg9cMpt0K19PwWmMQCOg96oi40mBOKNaVibdgO92QzHjjA63GTbQA==
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id d2e1a72fcca58-7a286765c70mr34262b3a.6.1761257856827;
        Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b32asm3691332b3a.43.2025.10.23.15.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Message-ID: <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 03:47:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
 <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX8yAklj6AaQoy
 abGNnnX080NC+Grr11B3t944rIDGHmPLbBrxpH89SQHB6KV2XTU+J6OpPC135hc1gJScJIr8jGq
 EMa9xUHE2pMSMoycoEmcQtPvwllT/xH2mFzjbDNbC64D1bpA+hGHvJB7qjuCjOZ9Hqho4fVbrAS
 t7BR8tZvwdbV1f9Qh7mH3M7bAgDNgIz9fSEaO4rvxk4iFE8dZdVCIX+/G02oTioy08vFGYzFkd8
 /oPoi9yPCAsFJ/bVtL7os04Z3E6+LqBc+/Yx4qvR0/PTJiJhEEl8vGnkOiynBYbBFDfn0DSjb8a
 ItRSi1hTVHU30QYst5NpQgZXASUBcjW+M0Ia6dMjcFhI0181FhO66Kf2CuYqayAcNic7lNIEOA5
 WQwxzZu38a6A0n89o/tlT82hixHScA==
X-Proofpoint-GUID: Vo9y7CoUXV9WHiMXqxfB2A8duLHEyYHR
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68faa982 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bgAURMIcSi5BoiUHQI0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Vo9y7CoUXV9WHiMXqxfB2A8duLHEyYHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

On 10/22/2025 8:57 PM, Konrad Dybcio wrote:
> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and rgmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-845000000 {
>> +					opp-hz = /bits/ 64 <845000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +					opp-peak-kBps = <7050000>;
> 
> Are there speed bins?

None I am aware of as of now.

> 
> [...]
> 
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "smmu_vote";
>> +
>> +			power-domains = <&gpucc CX_GDSC>,
>> +					<&gpucc GX_GDSC>,
>> +					<&rpmhpd RPMHPD_CX>;
>> +			power-domain-names = "cx", "gx", "vdd_cx";
> 
> I think the gpucc node should reference _CX directly instead,
> then genpd/opp should trickle the requirements up the chain

Do you mean the CX rail scaling here should be handled by gpucc clk driver?


> 
>> +
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "oob", "gmu";
> 
> 1 a line, please

Ack. Thanks

-Akhil

> 
> lgtm otherwise
> 
> Konrad



