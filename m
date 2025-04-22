Return-Path: <linux-arm-msm+bounces-54973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8AA97389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8482F1B61BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 17:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D589D2980D1;
	Tue, 22 Apr 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pienmoao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AF22980AF;
	Tue, 22 Apr 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342504; cv=none; b=Esdko3IDIWv+W8/t7ABwJJ9f7PXnaYzKpUxEx9C1rCmLM/ZayP+Y3STISxwo3b9kajX6p9tjrcsPo+BRky9Xo+5e6XEe716NZWq9RumEcKl5HZtwCcMJ0HlW3uHblK7gvrcdMkhuBVJz2uyUdqlvZDB7Gz6gV4dsXFFKblLQoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342504; c=relaxed/simple;
	bh=IgvwRwKmMxStQPCzqSXX8g+TWUOlYgWxsANgTE7vkaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YrX7DJB1c/Cvs0yabe7oGxDFlv4xatJQm4Ek1POVyF9uo6412Wn15s9MU4QvMroERt2SnmB+Q5m5b9LY/bIr6mFFUE8PxJHzgdmQq/nWUZ3EeufWpxxTVhD2aB586En5+DtNWUh3JHG99ke6asasMy4QuqQJ3qgimQwNyhjFx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pienmoao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MDOiGA006011;
	Tue, 22 Apr 2025 17:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMOZEw9Do8tAby787n7LeytMx51dBxfsnq2fbC/5k8s=; b=Pienmoao04sFoqWD
	WHR1dA3yXQJc6A2Rou+AWlOPlmu9OqewYDSe7A8YoaReuZsNlSMrCX7mUMV6951S
	mk+A/vZR4jHiXOEjJz9UAWYQuV9Rs7DwpL8JIyQC5wP8RxKbAvp24LOEPk8prGk8
	fYvwLFReLGy1NKsMX3YOxklSAQv+L+wa4Emdjaq3torQ5LphAphTSLi8dIePRi/r
	MzSAExTX+7GUhbaUJAMpED+Mee2Ah3OcC4FlGZxdyUTAFfR4wsyMAKWAsCjlZ36m
	E6OxZFZliOfRTIYsKILxj7OnKUP6VeI6YWhL96C3Nyl2ufCp66l4R9Mg0hZP2vB0
	X5a4ag==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jghhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:21:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MHLawb032448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:21:36 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 10:21:32 -0700
Message-ID: <bc69172d-1e7d-4aff-8c85-baeee587a771@quicinc.com>
Date: Tue, 22 Apr 2025 22:51:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <bmCbxi-K3naczb2RWmUcQbkKEJgSGyXXi7LGAlqE924ZfgXs-H6O_xhcHT-7pWOwA3eoZcxNOwvpuPQPA_DXUg==@protonmail.internalid>
 <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
 <2a9df021-72f7-4bcd-8c93-634c2b77dfe1@linaro.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <2a9df021-72f7-4bcd-8c93-634c2b77dfe1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6807d021 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3MV_XsGREBuVO1nK2OgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: MNser4huJoHJLkJRIzq3-mI-b2SNKptO
X-Proofpoint-ORIG-GUID: MNser4huJoHJLkJRIzq3-mI-b2SNKptO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=858 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220131



On 3/27/2025 4:42 AM, Bryan O'Donoghue wrote:
> On 17/03/2025 05:41, Prasad Kumpatla wrote:
>> Add the sound card node with tested playback over WSA8835 speakers,
>> msm mic along with wcd9370 headset playabck and record.
> 
> I think as a reviewer I'd like a better description.
> 
> "msm mic" doesn't mean much - please specify the number of MICs and 
> their type - "four digital mics"
> 
> MSM Mics are not a meaningful description.

ACK,
Will provide proper description in next patchset version.

Thanks,
Prasad>
> ---
> bod


