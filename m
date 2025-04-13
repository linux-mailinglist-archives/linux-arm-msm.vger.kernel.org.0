Return-Path: <linux-arm-msm+bounces-54122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BBA870E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 09:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205D44C1190
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 07:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781E21487D1;
	Sun, 13 Apr 2025 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pjeyJO30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BB17D2;
	Sun, 13 Apr 2025 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529324; cv=none; b=HS8tkE7cyUr23H3Z2czRjpAWzU+shzzBI+JV0TzJ8+oLavaVusbXgnvHLVe1gB3SzZ3nOE6bTfOTrk9dceB4cB0BzVx6JSz8w5TOrhosRFFyDX2mMenlb/uysOukc5f8FhP/E0pW+XagQ15pzEG/XxwOLVVvyhMQflODERv/mlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529324; c=relaxed/simple;
	bh=NXEKLHaF1+KLRLshoTNV0FzfFjglVHdsJ6t8SiAalZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=txcRvoHC6xMUb9vl3dmLhX/qvadrSMTAgpI5CFbjlQdWBCRa+KykzIUTWLluvnnRyP2KqYTAb4pqU8ijos8Alnq973ufHOJMvN9QzJHxx3yImCjsH5/8qvup+fHOSZPhUDuexJnkbbC06a5TXjoE18wTt9Ov4hZpAhmm1lBo0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pjeyJO30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53D6SlYZ015804;
	Sun, 13 Apr 2025 07:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV2G4ayNZVH6RqUh4cLu5U8chB+M0HOeW5civVHVLGg=; b=pjeyJO30qxqfQog/
	H7oXOMK3DbE5b9edKknrmPnxOwXjtRZqXRJBE6T+wVcs0osT/E66mk7VYCKQrihk
	iUsDgIrJM+Zq2+snSASWBbxLIWhCIz1gVJKDnGjWUB9SduQdkYD+a4gzvi2EHt78
	aw9V/EVX/VyiC72CfWDcmqyGZ8yFjlmc8HZPw02CtEJQlkTVYscHur0YSrBglBOi
	u4ybLS5kvm/+8+9ZDaNEHBL2ja13zD7/tARkEvrqN2TIKFDTPmRuBEYd4F8xVzeU
	2JSo30fN++IXWZ5S/hAc3WRgXNl4ZNz+AvMKN9h3gouF/940SlJqLppwwOGNmWqz
	g2Uc5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbphnt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 07:28:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53D7SKaY026486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 07:28:20 GMT
Received: from [10.216.54.67] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Apr
 2025 00:28:16 -0700
Message-ID: <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
Date: Sun, 13 Apr 2025 12:58:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gbn7J30uD-AVqgBfqPkb7-XXvDrK1OTu
X-Proofpoint-GUID: Gbn7J30uD-AVqgBfqPkb7-XXvDrK1OTu
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fb6794 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=0rxOekHK3ONI6NxZAb0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130056



On 4/12/2025 4:50 AM, Konrad Dybcio wrote:
> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>> This patchset adds i3c controller support for the qualcomm's QUPV3 based
>> Serial engine (SE) hardware controller.
>>
>> The I3C SE(Serial Engine) controller implements I3C master functionality
>> as defined in the MIPI Specifications for I3C, Version 1.0.
>>
>> This patchset was tested on Kailua SM8550 MTP device and data transfer
>> has been tested in I3C SDR mode.
>>
>> Features tested and supported :
>>    Standard CCC commands.
>>    I3C SDR mode private transfers in PIO mode.
>>    I2C transfers in PIO mode.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ----
>> Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
>> v3->v4:
>>   - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
>>   - Makefile: Correct order sequence for i3c-qcom-geni.c.
>>   - Indentation corrected around print statement.
>>   - geni_i3c_probe() : Exit with return 0 instead of ret for success.
>>   - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().
> 
> So this is the third time I got this revision in my inbox, previous were
> <20250410084813.3594436-1-quic_msavaliy@quicinc.com> 10.04
> <20250331164648.2321899-1-quic_msavaliy@quicinc.com> 31.03
> 
> b4 should be automatically upticking the revision counter, please don't mess
> with it manually
Sorry Konrad, i could not understand what's the problem or what you are 
trying to say.

Do you suspect something (Which i didnt get) is seen as manually changed ?

> 
> Konrad
> 
> 


