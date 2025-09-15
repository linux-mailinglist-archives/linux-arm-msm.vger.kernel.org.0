Return-Path: <linux-arm-msm+bounces-73474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC532B56E28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 04:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E5B176E37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BD32165EA;
	Mon, 15 Sep 2025 02:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6NeE9NZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26721E98EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757902392; cv=none; b=USGnb03CE0knTUsufpxBtIZhNafC9ssYY3LbHjw2M8l5p8vgGhy43C5r+ROR4hsPjgts1sGyBOD2q26SFy+wpNSNDuOr0PS3p/mvDXUoXJdFADxxZAeQPMw63f3Ok4bMx9KUXUHaGNNRmKmSj8dPSnccIevY1S/M/+sYg4OAIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757902392; c=relaxed/simple;
	bh=ohUpipTMt4gASQi64UZFtyaRndLD5f1QK+vaH5E35dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo4AvEL4ybumDmUn+YbzQZG2tPt0T3NEjWKL5nX51ZbH83R8SnTMMz0cjvHxtmHy+UM7tRb+VPQcFABqZ4MjqGU3V2H3UwiryCLjmRIIlYCRoNDDFjdveWE4XxQ6qvpKMnx46zu8cx5M7bIyKzSilZKMIz2RmDgDAuaOf1ORvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6NeE9NZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELoYWY004264
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8U+/es2auF/UpL8wkEHJ/UTOBmDkqedpQR+r1cxVz0Q=; b=c6NeE9NZym9u3/Y1
	5GGelEyagUcFuSUPXxt0viCk06INZ5fs9W1IwIkbbpl7gEuI7Z0rQ4BROpupGSXj
	nRizF2zIY8vfBZOrUDrfoNHw2aXlHodU6m/UFN6hBpOMuY/NAuePKC74EUwEU5BF
	9IbVmUln3q/jJ0jJ2czalrzp/kyJ2CPQLLHUQIDgNePGKlzZ5bVFCpUElcB7Re99
	UD0G2BVJHQ1lXUed0yvgTRcWpt9nVl9HEBbHnv1QG3Mf7VVh2/ilrShdY/JFnfqq
	2DewBZKI8Wq1XlGKrt4zkqwXYSHbJrZLlFVhQahNUaaLuJFGOJd4NAu4txbrLsqd
	itqLxg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yxkb5x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:13:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77260b29516so7366216b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 19:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757902388; x=1758507188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U+/es2auF/UpL8wkEHJ/UTOBmDkqedpQR+r1cxVz0Q=;
        b=C4BdrUSjNcetS7NlfLQwu5lKXYXtPKJHuFtInUatgccsQrtaGPMTrz8x34klUEmMu8
         VYYugngnmI+Tf7XTt0qbbvvT8rqRilXCXnBvfbuaZteEy2PzIfdMVlJemUPFPsnbFcX5
         lGmtDkmxUHLy605E3G6g+On5AXCnMfMQahqi8bV0TJ7OUUCJprVPcjdYDJDqTNmwApha
         dzEhzLrKVr06H2owbwxlA696hzGjXmJYqKHDbYsWGe1kbNygdkBYH/414oflMi/m4UIm
         Pp49cozHJbViSKJKMzM+FiPVm1LhTk59aSSfA1zPneGCxeJyfSJS6NFUQ4JMvY5trD0G
         +ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU2I2sss8aHutP39Gf2+1kh7e8fD8/KPfKfQEggbmcwl56zG4VIybik16FRoC6LS0UtXbRTL2wyT7GhcM7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/2VGhyS6x4OBqiABzcoIDV5XLB6I3zHeU8bAJNoF65lAiN9n
	ETKkC65mEgIomi29SGuuCrjnreQM26rq8KbifVmfvMELWCdX0KHniIRSKhQJkEgTr3XLUY5eMjU
	o8QR87Sxe4zjYXUPE87U9PJg2wOHHA1eoiq4s92F4WH2wakOt3eyRC1hTOg2m5XIO+jW4jX2zdr
	IT
X-Gm-Gg: ASbGncuYp6ThuC4Q5FIVzChpWgoYNdu0KLDHhryvGcx8ANIc3oyQleIc4dKgPrHNMBV
	KpkYaBZdEIFt4jR4iTBG3lZGtgyR7LZEsoQe/3vds/uBFdhZ6fXIO1tx6yw5HbEBE1jgUmumE2O
	oVauEGGdBXD6yUPaUC7ZZxgD49Hll+cyG6itGcAEPZ85kwpa1KZ00ICbNyMx+n37i0CNAQ9Hmi4
	gxbOmmngQ3wTCmKpQL4TKtGq0+R1IhHjB7ZxXRrq6ZOhw/bbnVhqFvT8B5BLd5VwFjxMPyLMc32
	y3xm5sceEDIWDAfOQkHkGX0YdfE4woi4tqtAP+iS1CBqWFHgM5bkrutm0F6GG8AxiyW6JBdJ8FF
	sHZMq9GGcMCysRQabRCZ+3F4kG1JLXA==
X-Received: by 2002:a05:6a20:c40a:b0:262:23dd:2e8c with SMTP id adf61e73a8af0-26223dd314fmr5121179637.44.1757902388557;
        Sun, 14 Sep 2025 19:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNdmgeYdPGgEBBnW9LZnrDbOV/8e3BmXeugleNAIQXSUHtKSZ13d9gG/jmrPwhW3MoO6DJ+g==
X-Received: by 2002:a05:6a20:c40a:b0:262:23dd:2e8c with SMTP id adf61e73a8af0-26223dd314fmr5121157637.44.1757902388124;
        Sun, 14 Sep 2025 19:13:08 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa1a22sm10159814a12.52.2025.09.14.19.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 19:13:07 -0700 (PDT)
Message-ID: <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 10:12:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMiBTYWx0ZWRfX6godbBmHmoKu
 BhigvBfHqmN6lyX/JeDdsTmfbeFYwcOMyyEZ3da8tSCLa9LQzicamIHhwTUJME9S6aUnDxxHo6Z
 e+FMfBnKcz502VJIe7lGeCKd1PGJkuDi7eDdutb4w4lrESu7KCn1RL0Exw/7P2GwtnU7ae4vk6+
 6CaRmXwXOqgP54Rh0ZE0zy+iP+sP82I3WQAFPeZwX4VNQUsiunLCFYSrT2/3oDlbpkpPfQ/GvJH
 +auG55+F0N7EEXpHZnVOArrtplGKl+klfieIRGCrdLcq+VKfOU3f9iHPmy/qqLrCD5EFGVETkbh
 71hrAswqggiWKUtqbK0SZdKA3y5Vt7DbeSpOj+sU9EKEPxJxRAPYe9Gd4shyKJBwuG/8IWsxOX4
 z/eV03RG
X-Proofpoint-ORIG-GUID: 6712pHf3FslEuuryvYOwIbxeM80IIsTi
X-Authority-Analysis: v=2.4 cv=KfjSsRYD c=1 sm=1 tr=0 ts=68c77636 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=iF4Rue9Sqs3gHakc6bMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6712pHf3FslEuuryvYOwIbxeM80IIsTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130022



On 8/27/2025 7:59 PM, James Clark wrote:
> 
> 
> On 27/08/2025 11:55 am, Jie Gan wrote:
>> Patchset 1 introduces configuration of the cross-trigger registers with
>> appropriate values to enable proper generation of cross-trigger packets.
>>
>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>> which determines the frequency of ASYNC packet generation. These packets
>> assist userspace tools in accurately identifying each valid packet.
>>
>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>> specific port, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Changes in V3:
>> 1. Optimizing codes according to James's comment.
>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Changes in V2:
>> 1. Refactoring the code based on James's comment for optimization.
>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Tao Zhang (3):
>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>    coresight: tpda: add sysfs node to flush specific port
>>
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 

Gentle ping.

Thanks,
Jie


