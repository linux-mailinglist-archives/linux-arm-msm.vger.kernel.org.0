Return-Path: <linux-arm-msm+bounces-77243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A4BDAAF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 297844F6717
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A599F30276A;
	Tue, 14 Oct 2025 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZiL0agv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A6302CCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460247; cv=none; b=mxnIldFAXOGEU2j0URj5Ir00dCUfQCqmchd8V4hjEzBEqbofV1tWw8Obaa5g1rryZOCTVZrV73qRCtpgDdzXFLPDyxOuKFP+4V+yA8MV3sOjS4WmSlWSnWq7cnpkcqIO/mBjuk1WLiSJrGW/jJhlhAroD5RUoAHceIoQrXaLPK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460247; c=relaxed/simple;
	bh=Yi4u1cEJ00kNWC8UqUDFz10sCkkjIySTrLVt5NXv2E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/qInEYjZ4WC/7Hl9kWG5G5z+5v2reDR91xKQ5uOxukaxgUEaDSgZx2ne4NxdMLpFbkThGgi7ojV6/405caQlEE2D5n4WW6iMOIc95K5Ww2VMnAxae/jfblUQ9X3DZWJVSTNnnm95pAcR6FEmC1uxuYe+WpKfxQH/Eld0dqjkhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZiL0agv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EGZkA5021172
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSFGvCoE5HNUgN3XKXThc+wiZj01432MioxbQ4jjWj4=; b=KZiL0agvuPhc9juH
	2QmEEvpdBJVSDlfbt83hvzNjGKPpC+wBKYPpQXUnJGD3NP0jN+muY6Y5VdlCfnCI
	r8Uupq32CZq8NCjZQvxyyTdcMYG089ooZ8VdZ5dRiF46XUh5IVrwUab6KslI936Q
	fOiJoUm1h2EnaeQaFhZocBCycoRLBbyld0jn6ezPqQ7lTDkbNvFf95AMrD9LEowU
	EEWkV8FLc5xRbDEdQGBaxQg6qC1oNnp0A9xSzeJHvgKUvyvC7bEgXhQ6tkT6To0e
	hsyyjkx71fI8v3JOv+hN8XPExnHpeKCPO0sM+cogUmlw5bt1UqRZ/ReTNSbz0ksN
	JktVog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwkk30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:44:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eca7298d9so245332405ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460243; x=1761065043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSFGvCoE5HNUgN3XKXThc+wiZj01432MioxbQ4jjWj4=;
        b=xDLlE8tXXyPsVQ4PEFT5ckdZcVeeaaEouXCrju6VYJREgnuVrNuE762O6hNhe/D4Uc
         XJY2MI7bQOI9HtLIUzaI6Bsr5f9Qy3OEoHUUI5enjooX6GiCsvlMMuowoK3jp4PGPJwW
         WkT73zOlFstu4yq/ujUVALtKmkGAQwZnDKA8ExyNJlSjHAtkpIhZ3SJdR7/gV9H+RzIA
         toUhKWb+0bV6MYM4YKpIyZ/PVHfm8JpTG0n2oOmUUCuTbGj7D8BQh5G87CZnhs1r76kJ
         n5hh/Y7NK0BdaQYCTA7P83h0DnnUmLB4v7718e452HA/3y/zcSZ9kksJHF3oyQyRQuln
         Vf0w==
X-Forwarded-Encrypted: i=1; AJvYcCWte4Edv4eGA/QjNCz6o507AQA8b2uWVMt1nmg5scTANajSN7vuaOmCaQeGqrK8F8Ns9VVy0j1JLwVXMYx5@vger.kernel.org
X-Gm-Message-State: AOJu0YwynNfh5AhYPf+HkAasgGX+evCJZzJr2tgd+P+kLPcWkoSLoxod
	ldZpTbv8RFPK8Xe36N0iUikjU07CLDb1T9bm5yC4rKM/ItpQNvNX4Px/VrvZWUoxeam9ZaSkrjT
	ZWsP6oU8GtxLB8t1VvnY5QSywR6cqjw8XO25NNKGYAsUfIeqaH4aaKlB7KglfSNvNsFxh
X-Gm-Gg: ASbGncvKmi7vT4kXE46BaYhHmbrWgnVJG2wkS9TLm6CUrxqhhXcSTFkMMt60iRVfhoh
	plQpE7ZPgcsVJR2iE5rsSJ1XiZ1jOmAN1bQ6NBfUIGsdlX5trs8MYt9RB+iSPwQLzSCFPLdqHme
	sdJ6o3nrBvMIMWEtpAukNKNHNDHClrsTQyMgxIzc4wZ/X5dZ4IEFLlbGKKFrQuAnUbLLakgZvf4
	rslP2ybbyf78xjKTLEu58TvofBqPpVtJu14EeDVMUzTz0U453R8GQSgAj/yHedSqDdq/y1ObBqT
	oSO16KD6QGl8pKXnTUYrSUu0esPaPAkiIExZI4YsHCQubCoA+7+kyLnUnJxJgoeZYD5A
X-Received: by 2002:a17:903:2c0d:b0:269:b2ff:5c0e with SMTP id d9443c01a7336-290273ffa54mr348766035ad.46.1760460243172;
        Tue, 14 Oct 2025 09:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAawkG/6RcfxRfHqkLYsh/KH24AGdBHUvSRtJU/JVoXD0EAwZnl6Htf7BxbBAFTMLZRB1zHA==
X-Received: by 2002:a17:903:2c0d:b0:269:b2ff:5c0e with SMTP id d9443c01a7336-290273ffa54mr348765615ad.46.1760460242701;
        Tue, 14 Oct 2025 09:44:02 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288043fsm11617122a91.0.2025.10.14.09.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:44:02 -0700 (PDT)
Message-ID: <305fb869-c35d-4de8-bdd8-175fccc26137@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 22:13:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <oitgxbjkjftsq6an6dbtqrb2vfwrpv7tybmo4zck24hzh7p6gr@4gochzskawnm>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <oitgxbjkjftsq6an6dbtqrb2vfwrpv7tybmo4zck24hzh7p6gr@4gochzskawnm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxyzoT5ys9Nqz
 vOOUiO0S9oo5mgOJ7gCv0IVvdvI3yLCKnsMN+KjnJuBdzc4e9Obh8LDb2pu1l78o/+PCXMNGIv2
 3uoPP9U/PsJrlwujC9O0TWXp/ZU1yDtAh7pITohfdMiJ6f18pyFn4d0MjRNSfuvH5aoUahmV1Y8
 x8VWlGI9W2ogNXuNMmrFKwJNyV1pfRQYsYFz7vrcM/ExhWznBVW0veo6cf6Stq/9Q6Ac7x2RS2B
 zwvMAR6mWtdaol2sxTvsdTIwz0Z7A47xQdcFjorc34o6BAnKdia2jWwwZW7LG60sNq0PHEeM9EX
 nmYQH3RK8/yApnfGpKxSOr+iWNPM1T6NV4a1mN9HUFK/raPUBprLkXKKkPQywY4j/vOwWxVqxl2
 uespVx5sPvtWJ06mQlQW5EdMpVbXpw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee7dd4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ptung1i0Z9Z1TijovGblew==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J-pUodDuUyh6byEKGFgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LTtE9GQNPyI5-Z2Vmqs9I89Fm-LAZVl4
X-Proofpoint-ORIG-GUID: LTtE9GQNPyI5-Z2Vmqs9I89Fm-LAZVl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 9/25/2025 8:52 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:19PM -0700, Jingyi Wang wrote:
>> Kaanapali is Snapdragon SoC from Qualcomm.
>>
>> Features added in this patch:
>> - CPUs with PSCI idle states and cpufreq
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect with CPU BWMONs
>> - QuP with uart
>> - SMMU
>> - RPMHPD
>> - UFS with Inline Crypto Engine
>> - LLCC
>> - Watchdog
>>
>> Written with help from Raviteja Laggyshetty(added interconnect nodes),
>> Taniya Das(added Clock Controllers and cpufreq), Jishnu Prakash
>> (added rpmhpd), Nitin Rawat(added ufs) and Gaurav Kashyap(added ICE).
>>
>> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1320 +++++++++++++++++++++++++++++++
>>  1 file changed, 1320 insertions(+)
>>
>> +
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		dma-ranges = <0 0 0 0 0x10 0>;
>> +		ranges = <0 0 0 0 0x10 0>;
>> +
>> +		gcc: clock-controller@100000 {
>> +			compatible = "qcom,kaanapali-gcc";
>> +			reg = <0x0 0x00100000 0x0 0x1f4200>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <0>,
>> +				 <&sleep_clk>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>;
> 
> You have UFS clocks. Why are they <0> here?

Yeah Dmitry, I will update the ufs_mem_phy clocks in the next patch.

> 
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
> 

-- 
Thanks,
Taniya Das


