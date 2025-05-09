Return-Path: <linux-arm-msm+bounces-57343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD60AB09BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009951BA241B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3D422D9F4;
	Fri,  9 May 2025 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sx5qy/Pj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24F20E315;
	Fri,  9 May 2025 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768853; cv=none; b=Qqw4cvskTs8Z8IsUxKVObzhwLRznDxmJfN0ENSA913vHSDW9Ay8A8ihf+WKpzsXD0HXkwsBkOXZFErmTBfAQY9/462TrMg0e6NHh82oQ43erj4qkRZLxbuNdQYJhgU3xiHQ+KCJBP+xAW4dMXaElFGVpmq6H5YyOlhv6wQm49ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768853; c=relaxed/simple;
	bh=lV6qN20pLad+cm9mpExutnziNoWU2PexhuAq8LDbEhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R5sfOATDUiYo4NfqJdCoPtJtc/Bh+BDEmUEN36moYCPGaeP9m9AjGBao57P6TY5BFOTVwzD2wAQrmT6+/TScItRu0zIODgFnDyV5dgVjslhyFIU+EAbJ59VAyIPdE5sTxMdVq0QM9qqqit1ShE5ixAJKQAJL8BLxWof3odq6lWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sx5qy/Pj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54926dVW010313;
	Fri, 9 May 2025 05:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jcVICLH4uQlxeBQ6ksUX5aJGGjtnC7mMv6d27x6SsY=; b=Sx5qy/PjhxeGKE6g
	OHUgAo0t9ptMtFqYaMdJSgbUDxuxANfn0c1RXQlXy1C9XhQ1A4kXKWXUexho9MCu
	gRm2qJv2keIHkRAmE/BZGm6AOTM0LoFIWCg0IZvpXvHXOQzmKZ8gQ/G/VheYWf9X
	4xstCWb7WwA448vEQHEmaiRGlGjN8LJawyPEqxyy5ibYmnSxrPy/atAOtjEgmzqX
	VH3GhXIwistUP6AyDewxU2TMQa/KzI/25QQSmJ8T4vNb2FAgOvBpgPdmG2mRCMbb
	DKr6fnHc14vcsWN+XxWikHazIdNvXqLCWEdhxiK+d5mRccJH5vY6sZjg76iJpI0/
	0+iwDw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7bj48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 05:33:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5495XlG1007836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 05:33:47 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 22:33:43 -0700
Message-ID: <7f0f1526-bae4-429c-977c-6c20ed443225@quicinc.com>
Date: Fri, 9 May 2025 13:33:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <neil.armstrong@linaro.org>, <luca.weiss@fairphone.com>,
        <konrad.dybcio@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
 <4575f37d5221048bfd061c561e42389ae569ca39.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <4575f37d5221048bfd061c561e42389ae569ca39.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1MSBTYWx0ZWRfX1EWi31PsprNk
 5Bk74kBi7qD8bP3FLp6vOQy9PdaDuWyH+0gOaHKYFcLSKC7iMlkEhHqGEZLb48SPacjFHdswgZt
 4Wd1fS304TBsEOYW5WI9Ue4tpCA0LzWBHP61VN+oyp6uM6mDHeKK36zx9BxyD3Rs13XKSkBLUAN
 fFUqYOTJpj3/Mcyc2kGc0N3ndCGkEkheafBN5OC/hVHsfLvNRfB6UKAfldTSqpfpK/V6WfwpjEP
 RU9oOOdOK9JGZnaDOYqYPxV66d/83OdanmuVTxAbm6Naq9yTRITWhYD7XrRCe/rDwl/CA0pHh8N
 biWerdjkV5heP/9jH+twyopn/hckXcLTOqYQa5dUV2WXdOaNcVkN3AiXZdI/ES1SFT9w4fTnGL8
 9pSVshW/9e1ftEV+rr1q2r4wkeD0+WzlCbQutxuMGRvP/hwxujoMggH5ssbxhMjsciKgM8ns
X-Proofpoint-GUID: affFuECpaKcv-1JmpUaDn1Y1cZ3Bs7qd
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681d93bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=tK7kR3B1CNhtWZaus9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: affFuECpaKcv-1JmpUaDn1Y1cZ3Bs7qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090051



On 5/8/2025 5:21 PM, Bean Huo wrote:
> On Wed, 2025-05-07 at 15:44 +0800, Ziqi Chen wrote:
>> -       return ufs_qcom_set_core_clk_ctrl(hba, freq);
>> +       return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
>>   }
>>   
>>   static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>> @@ -2081,11 +2100,53 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>>          return ret;
>>   }
>>   
>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>> +                                                                                                  unsigned long freq, char *name)
> 
> 
> This tab indentation is strange!
> 
Thanks Bean, it is my fault , I didn't change My IDE Tab indentation
size to 8 characters, it is still 4 . let me update.

BRs,
Ziqi
> 
>> +{
>> +       struct ufs_clk_info *clki
> 


