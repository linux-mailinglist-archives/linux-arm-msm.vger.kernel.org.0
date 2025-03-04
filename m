Return-Path: <linux-arm-msm+bounces-50140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 684A4A4D8BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587373B5818
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846A61FDE27;
	Tue,  4 Mar 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L56dBXf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FD1FDE1B;
	Tue,  4 Mar 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080658; cv=none; b=Y3vu+8sOy3jtWsQbvLwt3RrE9jIFsrzyFXRtg0MmqLZPvxE62H91FDu8JrK2T+2v3kVMt0Jd1apPT4axrMMMP4+w24G4MdhOsfGCsGmyJH0qeCpYx2scgy//wEV9gsDs1RI9c9wdjlvnLSglhF3Oki7VfTEVNdCaR1DOHOymOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080658; c=relaxed/simple;
	bh=azR/n+ME0OmekE2Xm4FRbD4LwYTYZKxi63PxlSTZAi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JKpf8DS7/73n5HoGjueg9J01SsYR/lu4xRE6hPcuQ0NJgbP0eByHcxeZiMilJ78Kfjybkjysm/GtMk582zsbg8wLOca46djSUkKbcYvQ2vXzDNGnWD6OrugtAIxJLY6kEofCPfAOWOPVuRGG5njRGY8RsIx5u63OvDXH6K+MBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L56dBXf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX4HG027319;
	Tue, 4 Mar 2025 09:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8a1MoI/DSxQaVM5wDw1IAkuYTIlsrqYIzpG40JKed8=; b=L56dBXf5yPBG4No1
	rqXnA4Lx02tbLzkucYYJsXKN4PvM92u6jI6rf7Wx8vWQRma1nG70rhO080zMkvjU
	XmLMXP+Mar4/RZ5vliroe1qgVZfLzMxqZGdkeuGRdto4Tmkm8acFAEolSRwXMblu
	BIlT45UWJ9bRQkdQefpT/1gOGty/xlBhZA9955L2DOXzkL9aTBsbj3pUX9+XPr0P
	jjLZy4XkM2eU+vKf6c8V/EDXOofctX0KDIqDZt+I1TN1NTfcN5LRtAHi07yAV/bN
	FV6/EYlb7JfZsiw0PN4L3DFqO3xngk3l6ibfdVSAT0ps+wl4OSrud1PGjRerWtjt
	iLkxNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6uhbq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:30:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249UZhU011921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:30:35 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 01:30:28 -0800
Message-ID: <91934960-c9fc-4442-88f3-ba1371470d05@quicinc.com>
Date: Tue, 4 Mar 2025 15:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/msm/dsi: add DSI support for SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-6-quic_amakhija@quicinc.com>
 <hl352hhpv6imtilpw554njkpod4nycjlls4gg75barlugc2e42@okw2snj2bqm3>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <hl352hhpv6imtilpw554njkpod4nycjlls4gg75barlugc2e42@okw2snj2bqm3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YAGyFw0Vmnxo5OEXqgHet3JwugnAXHCB
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c6c83b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=SqrKEsC-_tjMY2b0tDgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YAGyFw0Vmnxo5OEXqgHet3JwugnAXHCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040080

On 2/25/2025 10:48 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 05:48:18PM +0530, Ayushi Makhija wrote:
>> Add DSI Controller v2.5.1 support for SA8775P SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 18 ++++++++++++++++++
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 7754dcec33d0..71881d9370af 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -221,6 +221,22 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>  	},
>>  };
>>  
>> +static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
>> +	{ .supply = "vdda", .init_load_uA = 30100 },    /* 1.2 V */
>> +	{ .supply = "refgen" },
>> +};
> 
> sc7280 has 8350 uA here. I'd say, having those two next to each other is
> suspicious. Could you please doublecheck it?
> 
> LGTM otherwise
> 

Hi Dmitry,
Thanks, for the review.

This chipset is being used in Auto, and I have taken the init load values from the downstream code.
After you raised the doubt, I checked in the power grid for the DSI ctrl 1p2 supply (mdss0_dsi0 && mdss0_dsi1) and found the load is 8300 uA. 
I also checked DSI PHY 0p9 supply (mdss0_dsi0_phy & mdss0_dsi1_phy) load and it seems the downstream SW values are incorrect for the PHY as well.
Correct value for 0p9 supply as per the Power grid is 48000 uA. 
I have tested using update load and it's working fine. I will update the both in my next patchset.

Thanks,
Ayushi


