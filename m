Return-Path: <linux-arm-msm+bounces-84442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CADCA7DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2C432546EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6219B31BCA3;
	Fri,  5 Dec 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ir6dk6M0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHLOLsZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449A313293
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930790; cv=none; b=aXkOgTEGjZoOwKKeip/PLWQybcONwMsvwN7CSzmhGL/F8s7EErq8YRwPtifT6ngxl0N9azSy5H3SH+s4bmwmaxt7u4O61KRGY2G5wQqjKuNfR5Espu5QTd8JVrQxNl34CYr6vB1ItecesMKS6z5ZlOg2O4wmewNFZhIk/LJd1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930790; c=relaxed/simple;
	bh=idMLmOICrPcDIMYiWn3R3aY6XiJobzNee7mxzq98YbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLNs+Kok2wn4tdFZ7ltf4WATPZug0f/wQDpA5AymyZ5AlJNo674FEZmLBVoqFjGslCHE5sx9zKIOtI+am9NtncN9pSmd3z0ONr03JnFdIj/D2zQker2BorGrw5nOVpQnZWnx8C9PCdIl4NdkU2cPdHfIlIX94TdYqTveNbHZt3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ir6dk6M0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHLOLsZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58Etgj2519892
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugoAT51597Z1qdSUskJpMWyCSA/05zjeSfNH84OH32s=; b=ir6dk6M02iux1mVW
	ONNhd4Y7nrWFH9CYRNkRGS3bV8hbnf1oY1pQ1dPakFGtl7MreHKR5dr4MhU3oHsa
	CHjzqu18bNzzfkh3N446/Inn+LxrM6UBth5d60640YJfW8LkKRtjmnMOsgk8NFaL
	NbKg8uK1j9nePnd+p/cseKhixC2/WArbKQf3bzeOFZcWxGHaMFlNF9Qe+1UX4uRg
	8sU4VjKzEdtZA2n0X+AYEJ6dt/doRrxKrBsi3HgVbNcCgDZJCdJk1JhCJw5HBU/5
	yn4yylvYWK8D2qfAvfOct0MN7e31kcV41tREjJ99TNVDZzbo08B/szouFBBelna8
	q9rbJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n1u5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:33:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea2b51cfso48176785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930780; x=1765535580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugoAT51597Z1qdSUskJpMWyCSA/05zjeSfNH84OH32s=;
        b=OHLOLsZCmHuryIKiL7nFLgdUYO0Huv8ZYASZDFIm8vazKKrnHPvP6QNUPi5mB5Pl4i
         7iTqru+0/gvTKd+bKgePgvSLSImDNl+bVGoU+ufTFNTA71RyEKTC5rLjfOTtSQpQxY/2
         tQXMhgeaaEJndPliPWdMW3sB/pGCTNvDPIaxq5sIkeowgb367IAj6ovCYJGp6ebKtT21
         aM9U0O5V58Y+7axA03IZmGC8PQ4f3IenALzrUo6RiNc3nRWkgApwBfoCN3BRx09moZsn
         u0030t9d4kRJqaQYEVOKlsCoyI0uDc5wVSLLO/3pqtaF9d4Zcy432tB8ynRLy7jVixSj
         u3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930780; x=1765535580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugoAT51597Z1qdSUskJpMWyCSA/05zjeSfNH84OH32s=;
        b=P7EEo5jI2dsuX7gMUEo8YRuV8vqhlJOnsIBvUxPsBtzO3QsoklUslW2J4ybLDp6u2u
         PW0cerLt0FbenloxgPDEYZlFFuRNAvGRCncMAC43XxayVXpW5AW1VfYycs/fYa3RgEAq
         YUkpGTNIcSDFoI5T2EZuDqLr0Q+SFp/TwToh2vOx/yP/C+5LaSxLp7dwJfSSWAImUJ/F
         KXuHPP13Tvy8fsCBDu+WdoaFH3Ya/oa3NEeVK1rBjsa56jpneAqvYe8CcQndE0K6Riqc
         m8lLe9yWxD7wNb105/r2ij9rga5P6S1gSUEWwnAZMPPR9FuUyWLOCt06kj4iLnvK6LXz
         iViQ==
X-Gm-Message-State: AOJu0Yw1ZXVMvRwWRm0khGJbjwVjxSYN9E2fwJcfVvOTIpX80F1pmIqP
	+qCrI4LfXTnHaVYmzXxohRzT/NmDNZ10qEIEiuRolwwsYYRqadn3AD4h71S+Ur6p+RWV8BcgYm5
	+4XLSuST9GY9BMmT0azJfMqG/oAFPT+xBhHX//FWnQTUmnpc9gHpbSPJumitmVdUKwN3a
X-Gm-Gg: ASbGnctZ9IdcN+zHO1KlxkvNk+J1EalHYaP6KPHnNtj5n1GgLJM6pZEvQQEiXDAZ6Pv
	MCux8z32vWeHCdBuN5Il0YGwplv/18l6O7kRzfY8yUZR2oIQgUJxv5BmXpnvsjzVZpv0ilg/cyQ
	kuC3pEWfoi13NnCEqKbrPUZMeIPHqolU+n9ysWixskojaWXXgcQmod2Saf1pSh39JkUKMGdWtrd
	B2AYmFI2ilIg9TgDg6dRY+39ykoOctFfQ/rdSz+fGqiIpnHwJfY8JYBFSEbtKoifvtMngwVrUS8
	KH04/VSePjyoHBYbHZmAZkM7RB2RtttY5b+bGgfrhZLEJ2fbscglBjqywfKvWLwtZj6qG6x+jXT
	pWDRabhlgERZ6wo1OU9NInUVklTRlSMWy40Ey7ay+MRcOoZncmDPUuQet587ZUAatIg==
X-Received: by 2002:ac8:7f08:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f01b3b1c39mr83308111cf.9.1764930779941;
        Fri, 05 Dec 2025 02:32:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOrWRamMFl6oYqXXHY4sG3dBkTgNbVzJXDE5kOOeceEZCCLvZMNJJmI3WJdbRzoWwi4qPqaQ==
X-Received: by 2002:ac8:7f08:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f01b3b1c39mr83307941cf.9.1764930779587;
        Fri, 05 Dec 2025 02:32:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445936dsm339845966b.9.2025.12.05.02.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:32:59 -0800 (PST)
Message-ID: <a6561d3a-87c8-4a1e-bf1d-f7ac390f8424@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com>
 <08284b5f-a6b4-42f7-95f5-28161ddcd356@oss.qualcomm.com>
 <31d09e5d-7dd7-407d-af25-c5d1e5c9c431@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31d09e5d-7dd7-407d-af25-c5d1e5c9c431@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932b4dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7Whr2EFx4CRF9O1MSvMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: HocPBTgPpF1en1sQNBn9JWJeuSuuX8BF
X-Proofpoint-GUID: HocPBTgPpF1en1sQNBn9JWJeuSuuX8BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NyBTYWx0ZWRfXwfwPnExZjY7c
 VPukxufRaKqDzCngssevrTL3PeeNzZ+GtHQwk1cN8Ml6+HA8m4iKzm6IMjiOc9eFB7MS0cF7M8c
 xfzAxQ2T7S7aueMl4nf/+C8LQlrlQDjwrTZ7BWqtiwQjH5gTxjvYvWHjdkFQ6ubpCfyq1QgiPrw
 pqrguAdPYlOQkhirJobWPUsv2AiteRxii+BVm7ch+4gWD3CALvvt/3877ds9Xc03DNH9IyPLbD5
 UlCXwa+nDObJ57WdCVhWTET7ZGvONr4j8z7Yfb20DxDStBuKY69Rg1hte4PSHPrZs/WMrIDCD47
 bH2WvE2Xy0c+nN9sWXM5GOpUgl4KUZ9ytnDVkdrgd0pZ/08YcABoqnnjapCGReIRmpijU+QSCgM
 6GVIpScGVjj4YfFnYwbPx1T/AwHPgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050077

On 12/5/25 11:28 AM, Harshal Dev wrote:
> Hi Konrad,
> 
> On 12/4/2025 7:14 PM, Konrad Dybcio wrote:
>> On 11/27/25 10:43 AM, Harshal Dev wrote:
>>> On X Elite, there is a crypto engine IP block similar to ones found on
>>> SM8x50 platforms.
>>>
>>> Describe the crypto engine and its BAM.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---

[...]

>>> +		crypto: crypto@1dfa000 {
>>> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
>>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>>> +			dma-names = "rx", "tx";
>>
>> one a line, please
> 
> I did not quite get this comment, could you please clarify a bit more? :)

dma-names = "rx",
	    "tx";

Konrad

