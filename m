Return-Path: <linux-arm-msm+bounces-60744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF226AD3216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F8B3A203D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1DD27FD67;
	Tue, 10 Jun 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poUOP6Hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43A22172F;
	Tue, 10 Jun 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547904; cv=none; b=e5wuAC0+PplL/jmGKiD7UD5C8c8Ae2GYVhsNy4q49aIJbdcMuzPSkqFWwofRfUYzT0RhEV/bSxmIkAdIORnf6AdvTXHUT6V3RhjezTunF/VgbrcVwSCz0pqFz+2q2SBUJji7v1aaWclYDI1d1sdwCLM3zw8r7v8i5QH1j9vrfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547904; c=relaxed/simple;
	bh=nlxpi2PnQ5SZ9ogqAPF22K5CYjsnMtXK5uLglQbDjik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JrsDBtJyVyQSM8chpC7Mq3DM2r2yApgvwedpv8JRi4SQGV6ZEtn3LG3Huhc6Y4TdP7NzzaekNI5RkWUpkIPnRIuGASJybktSlS0QbhD/qV0qq3/hat+MsnmlI7VCAzbPLbyqXZtrTxRZQB8AD9zdRg/smA1ViUlAEg7W10w0Oso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poUOP6Hr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559LJJF1018309;
	Tue, 10 Jun 2025 09:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u6MCGBTFAlYeCDEcyikw3UbgJy3uFEnmfAeco5v0psQ=; b=poUOP6HrXkF+j25n
	3mXrWQnsyksvSPuOHAEukq8vni33BYL1zUb+qqXJpI4L9CIW00HxLSabboWLpZxe
	n7DL+3jlw9UypmhjgnZAwJ9bY6VCGAoSaF9pTvsrbRPtfX9ZdUrs3IOgUSnkm1kD
	xVrTa0p3Hm6L1VbIB8T/jRuYga/94Dk762ZDNl+iodHg9qQ4kSnwHUqAR3poAHsn
	z1Buj8omPdpVybkN3S92nUjBUl4qW7b8lAVjbnY0H6HYBOk0c4qDRwXziygUz/xe
	3WTSPn4TLFQVEp7ZhPk7AH7Odi7W3EpJ6u8Qxq0fFhW8NRuCAQBGoG9FA4/B/Y7r
	NvZWxA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9rx5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:31:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55A9UcQZ031994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:30:38 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 02:30:34 -0700
Message-ID: <8bd87328-3e60-4f5a-b8ef-1825b0e94511@quicinc.com>
Date: Tue, 10 Jun 2025 15:00:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-2-c46ab4080989@quicinc.com>
 <d34051c2-7b6a-4b33-af12-4bc6380afba8@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d34051c2-7b6a-4b33-af12-4bc6380afba8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RQqKFDTkdDPokuVX2DoyApLpyFky_c3d
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6847fb7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=p62qhQRY5rUVsZnOx4kA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RQqKFDTkdDPokuVX2DoyApLpyFky_c3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MiBTYWx0ZWRfXw3OPb8gGhD8Z
 LL2D9nO4SJhPudDpf63b8337c9Yo0a7+I4YHm9iydNrYlbM4V3222tyZXW9IGnJwi81UiFVJOGf
 JTMjVYh/DnQ6NMuqmhZqjV11EmQlSc/4ISRTMb1YPERXpMoZaeLM28PRCr2/iVYQkMydC5eKdot
 Zr+Q7j/dvBbdV4F1DJLY+wcNdzC5JdKeWdvHHhuVpzjDFzATVf2MEj53naFgK6C9Gu350LW2Boj
 JW/OLXsLSW1zmKAZcKgy3OIcSarpgPOyl19E2pN8OOxm3RHlC/DgMiXdS1NWQ99NVGsKe0of8bb
 O8q5FWCbfGuqz6F87ca/2hAVlvR/mxnT+zMbHQUIclARYW7FWoRHlLq2bfYBIGWtPfi5QdKHMAt
 FO/ScGjbnQk4z2eWhvkToIdTH3ZHlAwjoLKkVz1Lv4DBEC7f9NN9mEouLVBrghMk+hbn18zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=807 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100072



On 2/10/2025 11:28 PM, Konrad Dybcio wrote:
> On 19.01.2025 1:00 PM, Taniya Das wrote:
>> Add cpufreq-hw node to support CPU frequency scaling.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +	cpufreq_hw: cpufreq@18323000 {
>> +		compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
>> +		reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
>> +		reg-names = "freq-domain0", "freq-domain1";
>> +
>> +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>> +		clock-names = "xo", "alternate";
>> +
>> +		#freq-domain-cells = <1>;
>> +		#clock-cells = <1>;
>> +	};
> 
> This should be a child of the /soc node
> 

My bad, I will move it under /soc.

> Konrad


