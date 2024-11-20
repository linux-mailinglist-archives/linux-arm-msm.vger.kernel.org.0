Return-Path: <linux-arm-msm+bounces-38458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D89D3931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31ADF1F229A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7CF18EFC1;
	Wed, 20 Nov 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iHpx0Oq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACC146D53
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101066; cv=none; b=TZiPufKRt/VFe/jsnI9NSThxjGKgVte/HyXaRNfByICFNqJARpkqim/xLxLsAGVePCCxNCCKxt2lXe7r024jgXDdHuIBsloZFrVo3NhfIZbS80JuIo1i+VNnYXYe5cXST9gbjYiBnMOCQ3ehUrpcfhlt5EyByAAVQyGHa7K11rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101066; c=relaxed/simple;
	bh=XdrrspmkBbVpoHf5pqOYcxJPFUtDEvjjhdBXzflLdCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qE7T95QX0Rk4VKF+XLbbE8Vtco8NZspNPWHjycKoOa5eIpARVL7yKgfMdlgqkitRdeJFwG0DEn6KOKZo7lbt75mr0QLfjFi9gp1WfrQOxgrXll5sIsxBS4f9I8qnFpJ3TDo1m9peWaBsXoSJRGwYCqR6FErZ3ZsmGzsDtEt7WZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iHpx0Oq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FUn5014417;
	Wed, 20 Nov 2024 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PHkCv6sM+C6frpmERuCxc8UIhNJxC/c7kKI3VkxXwk=; b=iHpx0Oq0/qtP0Mj1
	vh2jD6Z6jvXOhpwJIrl1Gf4lJWBzEwda+kHwCR4sxwSfmTrQ62AwSB3OmNjJxwKD
	CNJETT0OJiiGS3nVLY3S5k7Jm3QW4rjA1STx7Thn+nn+4aX7aGBVp6V7aSCACUqb
	LGo7YVTUYIh+Bd886nILpTGv/rcxcpKKYgHyW6W67ECAuT4zfiuZONkEEZGA/71m
	gX7CA9zTmQkG7sEtrvaCivSWt7eKQI7foJbSRUCRteJP77G4LL6xxChEwz2nOWOw
	LhGNKjMw1YFifkrwq29KrK/SVbBUNO6lsMLv8tTLj6p71++bSB8zWLlNQVTAATOv
	8bB7Kg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y95k62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:11:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKBAxqp003205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:10:59 GMT
Received: from [10.216.8.3] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 03:10:55 -0800
Message-ID: <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
Date: Wed, 20 Nov 2024 16:40:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: add venus firmware file for qcs615
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jx2LrD89lQhAo5SZ3hjVfXzOKD5gOLpY
X-Proofpoint-ORIG-GUID: jx2LrD89lQhAo5SZ3hjVfXzOKD5gOLpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411200077


On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>>>
>>>
>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
>>>>>
>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
>>>>>>> Hello
>>>>>>>
>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>>>>>>
>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
>>>>>>>
>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>>>>>>>
>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>> Renjiang Han (1):
>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
>>>>>>>
>>>>>>> WHENCE                      |   1 +
>>>>>>
>>>>>> Could you please be more specific, what is the difference between the
>>>>>> existing file and a new file? According to the soc_vers the new file
>>>>>> supports sdm845. Should it instead replace the old firmware?
>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
>>>>
>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
>>>> use v5 signatures?
>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
>>> far i have seen 2 categories in signing version for video bins, either default
>>> or v6 specific tool.
>>
>> Can firmware / security engineers actually advice us on using v5
>> firmware signatures with QCS615 _and_ with older platforms?
>> Existing venus-5.4/venus.mbn uses v3
> 
> Vikash, any updates on this topic? Would it be possible to have a single
> FW image with just v5 signatures?
Not yet Dmitry. Having a followup with relevant folks this friday to understand
the signing requirements across different SOCs, hopefully will be able to add
something on this by then.
Regards,
Vikash

