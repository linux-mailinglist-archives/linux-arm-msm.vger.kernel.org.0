Return-Path: <linux-arm-msm+bounces-67625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742FB19ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270151719C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 04:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A8521A43C;
	Mon,  4 Aug 2025 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OXBIj0ra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8192E36ED;
	Mon,  4 Aug 2025 04:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754282444; cv=none; b=k29AF6QIkimWGra1aieF5YC1ldkWjB7TR44iEbw0fSCnSEUeIDwpVOVMPsmQU5bXe/a6N8C44vFlhe9TUgoo0eegH2s9Ylh/oxh/c0+z1Aun0j0CgHNYxYoE9AEikdMkQrBdrOO6FpqYvlHai0B4mVKcGT2RXUdLa4l/PryAZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754282444; c=relaxed/simple;
	bh=XNiMGbSrvclpuIXTLxGDz3BJB5n1polAumt6BxtqTT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dm5m9Cxhw3EcjH4CKCAYzXFp3eijVBBxfvXWDNo6Q+f5jettsNElSmoBszyuu/CuyTH4nH2xT+5VeIdN5I1qP4ZIrnie0o42rAOxH3zIEV1JNEUYfw2oIRi8X+YxRjQPf8DR7Q4WHLqT3DpPnuFvbD4xai9z4a/0HnXYKh7QAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OXBIj0ra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NpvX2004959;
	Mon, 4 Aug 2025 04:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLY3M9ZSCAM6vJ7uD3SUluNEvxscQ3GCzJGrMmmnrDc=; b=OXBIj0ra7D0lI2HX
	vKNrfyiKD2U3WKJUZEdJ7g9yXasvMqlABWVbwJMdG86SwkJ9TelpPBiMQI3ZSeqi
	T6yBxF3cEe1Nxklp1Kbu3AVlb1++BCPqf4g+OArtL95bOcJmApYYF7jV3BH7JqR0
	U/PIY4WpgD6LZnQ9/AZB9MGSVOiRymoLrKqe3NjSPe6zGen1JRVwKJkSz7/ausBb
	mK/KScjL5uyUxxgMpT7Scfa1YX92klyIT11i2A3hBo6SSGo1XwzGdQacdO9qMdxM
	ld/EDabm5XcQGR6HAbQ+Uvd/9uvymzSYupkzQ0+BHBmWAp8RwziJ/xi/bE4uZTX4
	SOgxYQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwkg1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 04:40:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5744ecuZ009933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Aug 2025 04:40:38 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 21:40:35 -0700
Message-ID: <6dc91174-7927-4918-b519-1fe806c184d3@quicinc.com>
Date: Mon, 4 Aug 2025 12:40:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display
 Port
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-2-5e2dd12ddf6d@quicinc.com>
 <2ca6af52-af35-4968-888f-390eee8b3bc3@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <2ca6af52-af35-4968-888f-390eee8b3bc3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMSBTYWx0ZWRfX1FwUXvoe1GJh
 9QEXWAM+GRtRHy8NeMxEh+CeoCcpO7EL91ewHyMUbSc8Gs+xqiAQBluWGcaRuFbC1qTbFH0Osx4
 oHo0YygdUSUmy8u0yA59R278m8gEPBoazeVj4FsGKlh2teJUB0ED7Jtg3ImEDb2HR89R1jLsn9L
 dfUgKLMS0NgWaoYSM2W8qk804ZuePKk2zedVbUffb6/ey1/zp8+e9m232S3U4nkthh0/8chG3lq
 cweMg7Lku3MovTGU5Iu+O+JereEghmRBgEP0WcM5n+UDwP6WhevcFjMcjBHEVur5t2+GCW2Puuu
 5NzIXC6HpfIrGr/qcNF7/3oxDct1rDstyM6pyC7232eMql6tUMxwamHQ4HkujZ88FWqM276rAbJ
 UCnqrXuYv29+/joANVpMkteceSlkMosTm8EggcHfycsj/XPpfie24oWJTvLNxOpm+vyrJP30
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=689039c7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=dJFXlG1jTBD6QyKDXXoA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6sbe6msXmRB6swE8xIoQDa78aLCek_2t
X-Proofpoint-ORIG-GUID: 6sbe6msXmRB6swE8xIoQDa78aLCek_2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=975 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040021



On 2025/7/30 20:55, Konrad Dybcio wrote:
> On 7/30/25 11:49 AM, Yongxing Mou wrote:
>> Enable DPTX0 along with their corresponding PHYs for
>> qcs8300-ride platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> [...]
> 
>>   &tlmm {
>> +	dp_hot_plug_det: dp-hot-plug-det-state {
>> +		pins = "gpio94";
> 
> Please sort TLMM entries by the pin index
> 
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> lgtm otherwise
> 
> Konrad
Acked, thanks.

