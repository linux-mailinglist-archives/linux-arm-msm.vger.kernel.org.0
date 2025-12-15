Return-Path: <linux-arm-msm+bounces-85210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDACBD0E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D90C93019FFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BEC330B30;
	Mon, 15 Dec 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aY4yzvGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB65HaI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128F330B2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788399; cv=none; b=VGM/4AcjPaLL7wA36QcQ4sy+JFrVmcviSbW5yrjWlQCHsecWNzK4m2nk1dqnm5VC4uxFO/u7t/72KTYXgLyjfGyMQHNJ1Hlo5KPzPCcsaj9p0ZqRwEWowtW1eD/RJ9gW+juhFqpCGwHC6S1N9KpGc8XQzyEkNdVaLU/C2y8BsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788399; c=relaxed/simple;
	bh=cKAEsK48bDRFpViwYxsjJ68kXBq8TkFsz29AP3Kezr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7MK5XlIdZ0mZ1gZ7jvfW6ha3uexBz7fWf6k+2P/cmF0Bg0u5T0Jpznp2sm6CKLqwWQ9a4JP3GfNEj4nSPCRB1pQ/ASbXYb5OexP0hgmst8wCjCw4PXOP1rVlD1SzbZkFOCk8PvquRN3QZxO6wzy6hOx/GE4Coo6vGZ+RNOo6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aY4yzvGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB65HaI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMe1XA3001640
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nasJWiOCXZ4UCfAyh8BGptI80GTfQPS8qRNgCchLfE=; b=aY4yzvGhOqbQW3Wa
	+BDUFCJTNOp9634liqnLnHZRJtd1JBCdB5G9vJ8jeJLPoppuiJh3tpQPdRztFX4B
	8WqDAfq89eq1nSW+EEAkOK+axCuNlub90scKFG6uoGJ4RiwG7zl96hJkMrj73lI1
	7+f+11JzI5mWWPYBFq9Hw1iS7VYNcGySbdVbE4xSczW32YwYFuK79CGPbIamPdrZ
	pP2HWri5zn8dw7p3zB0QdFmSBpMY9Tx5NOWiVjoh9bfwvt0FovCQMSxA6a1BQUsH
	2qkRIrQBPkmpnR1DpqnaLUNg8o0Uq5OKR1qSnZbE9O/suO9a71MP0mg+0UiYq2JI
	VBMuXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119aks9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:46:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29e6b269686so72893535ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788396; x=1766393196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nasJWiOCXZ4UCfAyh8BGptI80GTfQPS8qRNgCchLfE=;
        b=SB65HaI4zlplkUbYDnRmQLI0w5eI+FNUq28w1UpzryaoivD6hS28VtWCl2tRSWZjPS
         pN6brpFZDFfj8QrFM/F+AinUWUARrNm+C4fSiAIrZ6b7/k2gK45TxbQlKQvd9DrWYVS/
         /wYboKS095a7hhSOlY+iTOl47Q88O7CC75xNiHYQEZL/XpkUrfOlsuNBdFhL2V2Pny/W
         f3BB9DMGZCHEFNojyuaLSbisKV+uACCmv5ceHLJzXbkJYwIVUe6i6cL0L+OdEps3vxt4
         5uy+Ig3yaxCU8wbjLlFbzNdH03hj0DvYnd6uHp5Cwrp/cgq4u1jWnQni+apnZA+lw5CX
         pHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788396; x=1766393196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nasJWiOCXZ4UCfAyh8BGptI80GTfQPS8qRNgCchLfE=;
        b=INbUTqeI69dRO+x6a4wmmHLS91YcSTeVpGKns7gKpe4QDCChAxQ5g5Mo2NqO65E6iw
         WAKEY3wXlo9dwDWxkUXjYQOfR1j5vaAkBgxwhKWT2hGBlnRb91CBvYKeRYjIWgbRyVPh
         gTHr4b/8DZy8fhbryR9k6ZcxTN5iz51s2aPNRakmZUUWPwxYBi5F0Xih1t9MNazdfJBy
         i6Scqr3IVZJoMjbgQiZq5Zc3ivAXaoRC0ojN7iCJoUjQhm+te2lW3MSntQuQzoBwE/8G
         SSAn1mdZ0RKVW266+qCgZd8REy4uGMnBLA5xvQ2drMJqZQzdd1L0NZ0gdP3V5zEZvYLY
         O95A==
X-Forwarded-Encrypted: i=1; AJvYcCW+QVcXgFVn5bTQOMK3eVoFRv3RclUZ8roDtrDoahSSXrCU2qwpMakCvMFraHa8XFuViKUM7QPS6lHutPpI@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuKsbm93mseMreZjXfs091AQgn29L7R4G4ELl9GKvn8QMsKHo
	zaG5r7T7EZJXwuYc7psNN4jkacor4OXdM3QDoIlo93vRDk59qZcKiuFvJc34V8GQ1gONGt7S03k
	JIZ8DdW7qiMX8bw+rFyIsLNGPDv2UHsiOwqrTz5NSS3cISr43kUAauRZbybNyztOV46rp
X-Gm-Gg: AY/fxX5BYMSHmjrbYVw05TASEduwkFfRuREUqio9MRRvhlNilbDkcRrTWVyKGYWV9Ct
	t90cL5Ph8pOBo58gkt3IGhyryfAXewfJYPH75qr7Fbg7KtLqyH9pmXHJ2WtWq8O0/5W71QIqs27
	0LJDunvdeBCKV9VadqJylasGe74YpU56YCItSS427RQvX5+nu/TpG2qFtqD3lqOstaKtlV1r9ri
	8vVBOUCp4/eQwmG2SrOBnaCrZSOGMTxkcFN2rOrPR0FHZeBjR36Rb2P0EGphbusN5318r0MRCiM
	DMhdRa/h2FvOJdhi4Ms7ve1RjhJhyoZMwUYkEFatmF0rF/GSBUB2/sjiP6Sqbw2dgcOzkpZhPgU
	a1NJ5+Bc+5Qpnxpe9hgV5IfVgg6//zaRrvkCfk8AS0gQvyTn3mYJXOxVEZVSaNbVc+oOWvgaFLf
	/ksG/z
X-Received: by 2002:a17:902:f686:b0:2a0:b3d5:5c3b with SMTP id d9443c01a7336-2a0b3d55dbcmr58510935ad.29.1765788396424;
        Mon, 15 Dec 2025 00:46:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyaonQjRAAETGUlUftUWs1YWXY8oUneQFILIlocDNYdN7AGVAOAZT/ZTLxDnmB9vtV58uNaQ==
X-Received: by 2002:a17:902:f686:b0:2a0:b3d5:5c3b with SMTP id d9443c01a7336-2a0b3d55dbcmr58510615ad.29.1765788395952;
        Mon, 15 Dec 2025 00:46:35 -0800 (PST)
Received: from [10.133.33.233] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea03fcd8sm126602295ad.74.2025.12.15.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 00:46:35 -0800 (PST)
Message-ID: <7ebe3796-0bbb-449a-9c74-50f6907dec49@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:46:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
 <20251210-knp-dts-v3-3-8dcd52f055c2@oss.qualcomm.com>
 <drbc2hb5hv36s2bzxaalfnr6lcer7zfyexnya3xpi6ltlhw6et@6gu5s7wfwm26>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <drbc2hb5hv36s2bzxaalfnr6lcer7zfyexnya3xpi6ltlhw6et@6gu5s7wfwm26>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693fcaed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MUZ2Odo8yfMIcZAiS_IA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MyBTYWx0ZWRfX7GNPcnHX/3PL
 9XKnr94Ce2GzoSKprcNVq0BgX8Z6uYZNQVHAK2cB8rlPsPEN1HLly+1hHbwIkAnytCPfR6CCgr0
 fOi8Vp8/awMi8DtgMEQV+Tn1EmRLkHHAD2a157HX3fQD4uW/RNfcfjnno/fB+K+sHWoBqAUgwj2
 7HYDiXSY1RJsKhy838yj1vk/KKYPA0chYSfyoEGOk9w6Bc5LtBRQnYD2mQEX21wajZSINaJSFrX
 dmdxF+tq2KKrcUB6u7XLjv3hTvw9mMLGnG1wXq6gyTHchb2dhxlvy5oxgV33SlcL5itdFgC0SZv
 E1piA4w6xfy8EIyIRIgJO2//fJPOAdIM8Aywyxc4g8OTq5sF/WbxawLNvVZWpqtsmgflyly1V1L
 EiB37WH/kXstkolUN4p3FnMixFnm3w==
X-Proofpoint-ORIG-GUID: 8oGNLKpthS8It9oe-O9Mp12y-tSQUifK
X-Proofpoint-GUID: 8oGNLKpthS8It9oe-O9Mp12y-tSQUifK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150073



On 12/11/2025 1:44 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 10, 2025 at 07:05:04PM -0800, Jingyi Wang wrote:
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
>> - QuP with UART
>> - SMMU
>> - RPMhPD
>> - UFS with Inline Crypto Engine
>> - LLCC
>> - Watchdog
>> - SD Card
>> - PCIe
>>
>> Written with help from Raviteja Laggyshetty (added interconnect nodes),
>> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
>> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
>> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
>>
>> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>>  1 file changed, 1606 insertions(+)
>>
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		pdp_mem: pdp-region@81300000 {
> 
> please drop -region, please be consistent
> 
>> +			reg = <0x0 0x81300000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
>> +			compatible = "qcom,cmd-db";
>> +			reg = <0x0 0x81c60000 0x0 0x20000>;
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem@81d00000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x81d00000 0x0 0x200000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		pdp_ns_shared_mem: pdp-ns-shared-region@81f00000 {
> 
> please drop -region
> 
>> +			reg = <0x0 0x81f00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
> 
>> +
>> +		pcie0: pcie@1c00000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,kaanapali-pcie", "qcom,pcie-sm8550";
>> +			reg = <0 0x01c00000 0 0x3000>,
> 
> 0x0 instead of 0 (here and in other reg entries).
> 
>> +			      <0 0x40000000 0 0xf1d>,
>> +			      <0 0x40000f20 0 0xa8>,
>> +			      <0 0x40001000 0 0x1000>,
>> +			      <0 0x40100000 0 0x100000>,
>> +			      <0 0x01c03000 0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> 
> Also 0x0 here
> 

thx, will fix these

Thanks,
Jingyi

>> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x23d00000>;
>> +
> 


