Return-Path: <linux-arm-msm+bounces-51952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9982A68D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 13:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45FF426D52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A202561C3;
	Wed, 19 Mar 2025 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLtUt1Um"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9B208993
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742388909; cv=none; b=W7hbyvUEMSAcRRQivyUXkITfsQLAUoceyl+9681BWxSJbM/uk5s3xQXbod+wBKKFpGpxWupmrZKXwxSGIwLiwDztwsUClt6C/j1ECo5LsEUazDynfEGwXj+YmwCIqZxnhrlV1r9ZYa0LRFXA7MOU6LP//898vmG7vLQTytf3pT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742388909; c=relaxed/simple;
	bh=rSIL0khIm0ebl5amFqGxWLHn3SbAi8HYR2BZhgG9c4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQcw6vtpO3lUZkme7aTOuyP0aog2UHcQbNo/KFI6ISu8jcanQeZ8WT/g1GfKcwG5G8A5yhE5EiZuheb/mbpjSDlCK4AWa+CZhgzWVXcnZkeL0+AptBy8nsqMKZB3lW+6kSvc3EiA1jYn/sfHxd0vzKFb+M7jHDFndbuLzMYjKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLtUt1Um; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lkJE020409
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeEVDtRTtfm/mIgiKRKIxsL5mdTxcvp8WT7XXvQZHCo=; b=gLtUt1Um0VqJKelt
	rKcZrQxH/YA2N2VTrhRxeULs6eF7KgF39nBpBnY9iJF82u0XRJ0T1XskJ6l9/QYt
	qNPRxszawW6nDtPwrifjTwxcpocKbp3KrmhBRn93YnHbIjtIU2JbJ7uJkD1u4uzU
	Cxi9AFl/7gAmwpoul8V5Bc1BKVjA1xEDjNc+ukRGmkRoURNIJ7ROocCj3ijz9Pvg
	WZNQkVyi01NDqGDCWtC7Z+6bVVbdyZG3uvz0QtkhlU8UXSWuTUuuHf9X5DgbL6NF
	AyTkx/VJ8XNFo3jqHA7PSDryIEPSWpUcCxeoyj54ODFMzT45ADA/VVUD68qVYOli
	EcpmIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwtmur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 12:55:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso10949319a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 05:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388904; x=1742993704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeEVDtRTtfm/mIgiKRKIxsL5mdTxcvp8WT7XXvQZHCo=;
        b=CV2/xqrM5WIExw5m2eT/VGb7W8MRBKMlt44eafT7YELta3pf63q+dVrJwdDLBI+jgN
         VNgL5jXJ8j0eNILlOuhiRWWXbDx2FHxCooB26teBgv/6/qdCDaM3cOjoinDAo8gq+i7S
         URpJD2DpbO2yc6PA/zxSo9a0F589/pX4ib1Phcgyps9ppuFI1M6Szdfzx6F+wAgSTwvN
         C8onbhmxHVVPf9PScWRCPy2ZxPjj0C14dggKjspYzfmzB1U3PGv0r7CcC4rn6xmfCqiG
         DaP4BvFhdDAseXxJFRD5pgaLbieVqlx3Te1DsKcL7K3TJG7l5p8VRaLJbMcjcDSZkDDy
         x+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQdnllcY9jNV/c9J7RUm/MK8cj3/N754Y4zqbq9javzeeT3r4u4Ht21Snr6hWK3c/Mu007YsYrXELBUtyI@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOrBZ4cdD7BlNYvG/TvazhOCNZY1JfogXxgJ1+oi+63KJvbzZ
	jElV0ZGoYc+B63QFlXC1+aAHOCOTGw26Z8fDd6cH2xNRTIdzEmhcYz0VnR/kV+VfsjG/oFIz8e9
	2IvGG5nDONcm7/K8E1pirXWI9wQImcC6/DSsS4xZvYFlFoCBS8vmKHAYF+tpgQuF3
X-Gm-Gg: ASbGncuafEzpOKKzbi4kzykkHOpHPEjz7q2XnFN1DSdsqKKOG4nW2P33CImQWHSt/Fe
	vBNt57qeZrVyic98Qbb7XfjJkEEteatvKShGdCbWkNUZT7kE8VTtz7pnWQjTSTcUIBtizpVczxi
	2WtD1P5omd04f4juPSPSoAuJs6Od4ziN7MNoHDhSbn0Qg8OpIP25yMI5dxtkUKEU7uBQ71V43V6
	cspzGfJvpD8LCCOLu6HLXkaVn9brW6MiVU2+USJrsXzRMHAqf3+Q8Q9YhYIfl2sFbx5CggMzDEM
	McstQB3KQZsyPFK1EP1NjkhBSiwg17iE5DYYWaz20buklh3qP3kfPnvIYQ==
X-Received: by 2002:a17:90b:4e8f:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301bde51fc9mr4540484a91.7.1742388904531;
        Wed, 19 Mar 2025 05:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/2CAuo/R2eq5BzbQLNQBq0yPs22kdCE3hs/7Vq2U563faJ6/8KWodBXAfiVexNfvldQlfDA==
X-Received: by 2002:a17:90b:4e8f:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301bde51fc9mr4540440a91.7.1742388904132;
        Wed, 19 Mar 2025 05:55:04 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576be5sm1463455a91.6.2025.03.19.05.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:55:03 -0700 (PDT)
Message-ID: <c6e3b0c1-18fe-a9fa-0e72-d955809144e3@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 18:24:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
 <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3pyS8WIUPWghB1tE4LiynBDm9o5cUGK6
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67dabea9 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=cXwcXxlD48ZRgq5pOxwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3pyS8WIUPWghB1tE4LiynBDm9o5cUGK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190088



On 3/19/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>>> ---
>>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>>>> NAK since this will break QCN
>>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>>
>>>>> ???
>>>>>
>>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>>
>>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>>> Setting the mlo capability flag without having required driver changes
>>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>>> (in development, public posting in near future) are in place.
>>> Really, these are your answers? There is regression and first reply is
>>> upstream should wait for whatever you do internally. Second answer is
>>> the same - public posting in near future?
>>>
>>
>> May be I was not clear in my response. I was not telling MLO bug fixes were
>> in the development. Actually the MLO feature itself is not enabled
>> yet with WCN chip sets. Any code changes enabling it without full feature
>> support would result in firmware crashes with the existing firmware binaries
>> available in upstream.
> 
> Is there an undocumented change of the behaviour in the commit
> 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> single_chip_mlo_supp")?
> 

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c

-       if (resp.single_chip_mlo_support_valid) {
-               if (resp.single_chip_mlo_support)
-                       ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-               else
-                       ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-       }

The above logic seems to keep the initialized intra MLO support even when
single_chip_mlo_support_valid is not set. The above code removal is correct as
MLO support can not be enabled in host when firmware does not advertise it.

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c

+       ab->single_chip_mlo_supp = false;


diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c

+       if (resp.single_chip_mlo_support_valid &&
+           resp.single_chip_mlo_support)
+               ab->single_chip_mlo_supp = true;

The above code does it in right way. Overriding firmware MLO capability as done
in the submitted patch under review is obviously wrong. The firmware used to report
the issue seems to have an odd behavior: 1. it does not seem to advertise MLO
capability in single_chip_mlo_support bit and 2. expects configurations to enable
MLO from host. None of the WCN firmware available in upstream either advertises
MLO capability or expects configurations to enable MLO from host.

Vasanth

