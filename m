Return-Path: <linux-arm-msm+bounces-58609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B668BABCFF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384EA3BD6F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B2B25CC6A;
	Tue, 20 May 2025 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Up/dP/2V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9614D1F180C;
	Tue, 20 May 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724367; cv=none; b=CeykRKMRgYbWSSs+Ge0CvUHqPBExEgb1xV5g5k5SDXUgGJ5CDQICsxuuoF4z/mUNiUANXx63w2oVdpoIBrkbJq3DgZWsLn3t3wlyx9CjzIdME3kHP9ohxQicszTrRt+JkoqycNOlcoO+wEkijUC4d3yOsCTzEaZIjG3bbiC6eeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724367; c=relaxed/simple;
	bh=bqYZ7T/9suHQZaZ4R0aeyRpKlmyiMVbfjFONbFWoI8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kKOFf9D/RWBhkUgxWdE8WDxnZAm9yXOg9L9pmLoi/rafE4j6lLgZXzZzl4U/fI9/syN4W9do1mc3Lk+wKfgNgTloaQI0aNc896Fm7Eva21U6cFYWatNw2d8iuvFchFhmVvAuguDqo33y+Ng+CtC3phfMNStiMxL8oZsVnT5w8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Up/dP/2V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLZdmV024198;
	Tue, 20 May 2025 06:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OVFtIrWHbFdt4C4D8bsu8L0/K5+JlK/CZx7rzpWnnk=; b=Up/dP/2VDNemJIrX
	lHiS53tfBFvqFOLNNGZAcHZWu16NtM9I4/JVCy+jPGOYHhnBwHH9veqDsULpEhke
	WrdEep7gliHZhcij4P9IqShbES4wo+DWyIxBeMj7E4Hc7i6Ii1yx41Df1w/Lbb5u
	wSOeHBj1+oK3xA1gpjgL9AlClZjf7T7a6uxwj14bEG3vEu4klQHi40NzwJqUztb8
	DiSLFR+LlfQTwgbN0tFu+bx26sP9vrc0SxRiAm+3vbhGK9E9S3cTIYx1j3jOnD3p
	UuYf6HUlZ5XXUzCaxao2z9/CURxemWjkVThOh42FHtisIl0BDC942t6LWVmbwWRv
	5+3iTA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d2y7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:59:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K6xK9S018303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:59:20 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 23:59:11 -0700
Message-ID: <ba49151a-e32d-438d-8a2a-50840368a87c@quicinc.com>
Date: Tue, 20 May 2025 12:28:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter
 flag for SD card
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-2-quic_sartgarg@quicinc.com>
 <qffggh2ld2cw7d3eqwaerzicerhvdqojwsasherx7dgoda42b7@bigsjxr6vtao>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <qffggh2ld2cw7d3eqwaerzicerhvdqojwsasherx7dgoda42b7@bigsjxr6vtao>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1NiBTYWx0ZWRfX5E+ciXPZrHBq
 5tsyVPFJZHCYMxC/GzEPz9HIC1gEpCs1ioi7IPRihm3B17OG8/1Yx1ZqrSJjFpVTSGBgehUVx0T
 wbNiDSzLSEnsomY9iOxS7KRPr/Y7kqHPikEHmAhc2zHl19qz3BAtP2I2GDM6Tb+N6PnCU6T1fjN
 KMxsRGVKukCijjja/+tRPPwNr894ynQrAnL0fEn/WmVqEEfP5Uf4xZdP3fYfk+xLfWxWg6ZGP6V
 +Pz4T3vglmf93RrAtUX0lnaaFsRm/3rPdQ4+Jx8DkhDlFEDpQ8uQSeehVoNoAKvUKaEXOKXvi+Y
 RlxL08iLEReNPT+101xUSrs/vP4GyFCnNNY2unZiwpendNLFzVx3ZeLh3nhCRjcDas6zV1mJ4yy
 9hEHYMZy8v9f3LoFKrESTUblgQhmAzUKV2DQnKmLnEsAL47LKnsslpuS2q+mga4R0NjnDsuK
X-Proofpoint-GUID: Ng3kVuY7soPTt-PFvaE7CHw6evt6jh_i
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c2848 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=QqEx9Kr01YSCPKPpjFAA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ng3kVuY7soPTt-PFvaE7CHw6evt6jh_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=763 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200056



On 11/7/2024 3:29 PM, Krzysztof Kozlowski wrote:
> On Thu, Nov 07, 2024 at 01:35:03PM +0530, Sarthak Garg wrote:
>> Introduce a flag to indicate if the Qualcomm platform has a level
>> shifter for SD cards. With level shifter addition some extra delay is
>> seen on RX data path leading to CRC errors. To compensate these delays
>> and avoid CRC errors below things needs to be done:
>>
>> 1) Enable tuning for SDR50 mode
>> 2) Limit HS mode frequency to 37.5MHz from 50MHz
>>
>> Add this flag for all targets with a level shifter to handle these
>> issues for SD card.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
> 
> This wasn't tested, so just short review - platform means SoC usually,
> so this looks SoC specific, thus implied by compatible.
>  > Best regards,
> Krzysztof
>

Sure will redesign this logic and use compatible in patch V2.


