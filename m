Return-Path: <linux-arm-msm+bounces-42222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F69F1CAF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 06:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FE16188CEFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 05:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D360383A2;
	Sat, 14 Dec 2024 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lp7yjKU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D67462;
	Sat, 14 Dec 2024 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734154307; cv=none; b=CU7Wpopl5/6qBDqJBelBB1Mycokia5WqH9OvZmSO38UZvWzXLvurKfJ4LGHNNyZRMVLWU0j5bLfl6hlWAZrkH+4p3sF9VNlzPt3dWl3mXyG/q/5JFxAKPZJBIzM7t50nUKr8GknuHy9fws+77tFJUgGOih/OrqgKSrloYNzPuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734154307; c=relaxed/simple;
	bh=PFyqYIl50ePoUXNgWpbIhnin5m4eHMgjTgOJUkYB4cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DE1qLfth/6igGsJfE53lSR+31gn3dF7D43eS4Mp8T0XIaDuGykoznNAu4IQEvyvKybVObGjJX6IFo+IYdO8d2g87y1/Zjit2h3JdAudK6EwrIlXfsPKzO0tGckZ9WfmH8ljnfi6z4ZukZ7E0cB1U5kkFu+3D5oeub+oJcY9ZpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lp7yjKU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BE50YOD018941;
	Sat, 14 Dec 2024 05:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aA9p1VtOcOs8xIVMJboiS1J717QE4SdWWMDwXuOTHCs=; b=Lp7yjKU6LE4HT/fd
	IBq5t+tvaY7niOiSJJxHlSiOMMFMdVR+jPbtovWGsAlFN6zKs/QV0iyZA+bE4Sxb
	paUr09geJBIeFp3jAQnvGK5TBxlEgPJ+ktGKt5gsg0f2HAvvU9KJzpSqYSbHT/9q
	pREv3YpuEluNIdDFQ4hMQJnJ5duE1sWpQMpf28hwBfHZOsL0ME6jLS6UzdKEeJKE
	awQD/mVjusYvN1ru+2SMQrVbuwfFyUdRG7FLJUP02qZnyo1bXja2pKdvC68eDDoT
	kZEEeAjkEXV+vqhA2CvreHWMB+nGqVqx4GIyGazDV8qqM0tCBMXXMsgh2z/SktI6
	YIWf5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h309g23k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Dec 2024 05:31:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BE5VeYc002324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Dec 2024 05:31:40 GMT
Received: from [10.216.21.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 21:31:35 -0800
Message-ID: <1fd62c05-36fe-4059-9277-0946e1e3a933@quicinc.com>
Date: Sat, 14 Dec 2024 11:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for
 SA8775P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>
References: <20241213095237.1409174-1-quic_prashk@quicinc.com>
 <20241213095237.1409174-9-quic_prashk@quicinc.com>
 <6e9c4ebc-c52e-47ee-b3a5-570e84125e42@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <6e9c4ebc-c52e-47ee-b3a5-570e84125e42@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: whPLY3dvWHcih_X6-buNXCbAVmytZAFT
X-Proofpoint-GUID: whPLY3dvWHcih_X6-buNXCbAVmytZAFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=320 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140044



On 14-12-24 05:36 am, Konrad Dybcio wrote:
> On 13.12.2024 10:52 AM, Prashanth K wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Disable U1 and U2 power-saving states to improve stability of USB.
>> These low-power link states, designed to reduce power consumption
>> during idle periods, can cause issues in latency-sensitive or high
>> throughput use cases. Over the years, some of the issues seen are
>> as follows:
>>
>> 1. In device mode of operation, when UVC is active, enabling U1/U2
>> is sometimes causing packets drops due to delay in entry/exit of
>> intermittent these low power states. These packet drops are often
>> reflected as missed isochronous transfers, as the controller wasn't
>> able to send packet in that microframe interval and hence glitches
>> are seen on the final transmitted video output.
>>
>> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
>> when U1/U2 is enabled. Often when link enters U2, there is a re-
>> enumeration seen and device is unusable for many use cases.
>>
>> 3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
>> the cable is disconnected and reconnected to host PC in HS, there
>> is no link status change interrupt seen and the plug-in in HS doesn't
>> show up a bus reset and enumeration failure happens.
>>
>> Disabling these intermittent power states enhances device stability
>> without affecting power usage.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
>> ---
> 
> [...]
> 
>>  
>> @@ -3570,6 +3576,8 @@ tcsr_mutex: hwlock@1f40000 {
>>  			compatible = "qcom,tcsr-mutex";
>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>  			#hwlock-cells = <1>;
>> +				snps,dis-u1-entry-quirk;
>> +				snps,dis-u2-entry-quirk;
> 
> Oh?
> 
Thanks for pointing. I messed up, will update and send next version.

Regards,
Prashanth K

