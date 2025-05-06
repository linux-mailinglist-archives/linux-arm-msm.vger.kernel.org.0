Return-Path: <linux-arm-msm+bounces-56887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CABAAB9F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBEA34666F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D252522B5B6;
	Tue,  6 May 2025 04:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a6GzREXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414328E583;
	Tue,  6 May 2025 04:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504640; cv=none; b=HAbDydoh8v8/tJAAHQX3js7pqNTHnqfcg8uAS+H9DoGszQDpnOiR+zStp9rbi8PVFtmx6thvEFTkHLJ17YXXeOrSSDJdjm7Yiqi3tcQElmtoQPSq65uHpoSOF6P7AI+IDCy23VnXegmaHs48gd90ZNy3WcqZlCFuYEI2zZQ+ooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504640; c=relaxed/simple;
	bh=OZEdENzm3HVqmxa8TSXNyAQmCE+p6t1zKOgMOUVpG2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eITz7CaGUxUy9wrSdBbxvf5EeT4mS/IE2x9TetaVJqyB9g2vmB0zgZWbwJXjMqrevx88lqtsSHVJzhBbhP/nCNPl1u/mkRU6eDcLq2AQjT5XzgsJIEuNHtPutR1m1Jy2hcAYdWLXIlPTPOaYT1Ts3iRovYmv8N58u4Do9okId6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a6GzREXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KU2lh030054;
	Tue, 6 May 2025 04:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bSi5YQTgnJtJtrFJLwdwRGtDeu8w7V4jX9NyihzOo4=; b=a6GzREXA4ZfxF2Gw
	aiB0ibWtQe+yttOMzq2ikQVhVTtwh1r/nteGG8LaruNT9YWAkqcthPF59+GuuhYb
	Ib/WLYz4Im64V/oHNCht40txUDzqQ+N0vCVx3pTnL8OWjtmHsUIpqrqZQzsMtPgc
	DbmcMYVJ3A7+rSyZjxnTzuPlRhK1nS7pPVPUvYwWUOI0fxhhyTEN4fDWz0Mcf5pS
	lRIFfZDXAMREf3Mxx1W3SfZ7LYkTNdHOwJxrja3r2FKGa3TDcLL/ynYldtsRfj0c
	Ro9cL+FMMqHnukaO09CNMtywszm1YwSvwmvA4+Fm14wOlgwsmT6ZO61Y3jcuEe+z
	qC0AkA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rx815-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:10:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5464ADhH007667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 04:10:13 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 21:10:08 -0700
Message-ID: <2e692dbf-4a2d-47e0-bf56-af794bf8068c@quicinc.com>
Date: Tue, 6 May 2025 12:10:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] scsi: ufs: qcom: Check gear against max gear in vop
 freq_to_gear()
To: Avri Altman <Avri.Altman@sandisk.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com"
	<beanhuo@micron.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
 <20250502042432.88434-2-quic_ziqichen@quicinc.com>
 <PH7PR16MB6196FCFC818B623C946BD5DAE58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <PH7PR16MB6196FCFC818B623C946BD5DAE58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: miW3gQrGILjrO6H3PBnXX50gKvw67GyS
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68198ba5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ufAJUjbdAAAA:8 a=FN3lEX5YA6Kur31ofxgA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-GUID: miW3gQrGILjrO6H3PBnXX50gKvw67GyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAzNiBTYWx0ZWRfX/F0HVKo75Riq
 IZKtEN9TywCYnM+eXCaW7Uj2tBK54f5Iy/VFOeHBZdR0XZ4BL3E1QJ3YjaRsQwRhSMqvamXsKCT
 R0LUqyLz6khDNlumtwxOAq8W3IqaaL3UXbf0VobvzW2aesSyu4LXkApNgyOsdaMlKHj/guneJrL
 8ZPE/48XifHxIF4ZS5USlGrFQFxpixh66tm7Efp9uVAOlDGGZbw8vd7cMpd7KVqkDF4TqvrGT/k
 LFNHSgfk2D8vXjIbILCYuMQBOayc7k4SJTC+s7lH+bEbqlOX7eoJwkM1jFfzhfuDyh+RKtorLAJ
 ptlRuTZTnJoiH93O1/XDMGBmL5CeWdxHCi+MCuCVzh8bzu1XWkTF8Ihlb0j58E/1g7Tc7emch91
 Vjr+spAR0LQKUjeggdJdfPC21DeK1UgDg0PYHHJDkPNdy7RtnUd+FGoOKKl8wyuncGgffgM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_02,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060036

Hi Avri,

On 5/2/2025 1:10 PM, Avri Altman wrote:
>> The vop freq_to_gear() may return a gear greater than the negotiated max
>> gear, return the negotiated max gear if the mapped gear is greater than it.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c index
>> 46cca52aa6f1..f5ea703d8ef5 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1938,9 +1938,11 @@ static u32 ufs_qcom_freq_to_gear_speed(struct
>> ufs_hba *hba, unsigned long freq)
>>   		break;
>>   	default:
>>   		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n",
>> __func__, freq);
>> -		break;
>> +		return gear;
> Mayby return 0 so it is clear that you are not returning a gear
> 
>>   	}
>>
>> +	gear = min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
> return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
> 

Thanks, the way you suggested is more concise. I will update and use 
this way.

Ziqi

> Thanks,
> Avri
>> +
>>   	return gear;
>>   }
>>
>> --
>> 2.34.1
>>
> 


