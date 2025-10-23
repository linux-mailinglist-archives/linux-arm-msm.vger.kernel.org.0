Return-Path: <linux-arm-msm+bounces-78584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC09C00F89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C459561689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C88C30F946;
	Thu, 23 Oct 2025 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkYZzssF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E174730F54C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220975; cv=none; b=FSR13Vuw2hiLjzGc8vMlETkJPmz+EVj6oLstbr/RBF4dLGvwzNzi6m3WsSXwFeUqRHzDM4mcEKNIalTjOOEF1OzCHDhscL1yerUDl+2/5qk0dtysbYy/Y0UVl1uPQ5lRdUxfmQQ0zV5xec+RIoE2Ox6NjWDVg4lRvagFez6yMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220975; c=relaxed/simple;
	bh=hfHWyxVNGaqao+R4E2QG9ynbPUKwYD7iwQ9NJmtkuN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTBagTPTUOrJTsa79P0/N18SoBUJq/iJEvmNN6DopqUdDYr27oQkFn+WMAhO2UWCspUS3Wh5z1GbeFAyBvqbndUMdVE5ozbrUmQa/Pc0+CMK8jAsdSjvDpwGe5V5eQ6eFQEJzUECZnb7HzPj+879n5bfvbeywJobTGV5PT5n5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkYZzssF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N85KDh019068
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=; b=hkYZzssFwV2Jk/VP
	Or1UkHDtl+OCssWsyMXSrss8YPIrs8IQNa/xSLaFxmZpL459R13jJTjsil/n4/gz
	qmDEFbNOVKHDFL0zZiduSekArgVsJVv7ingw2y1cM4EMdu8+8ziPdoNH6xKN6zP/
	1qKNWfZEcFQNtNKA1KDOaFxMbg5P9ke3YTC+tlWVVMyDQd7531vcA8Enxm2ElCwY
	8d/hsXzGHGtNMGvBtdGpzHqZjDUCj8TtGVvwUN8pFhcES70OEu6f+hgxgKWXb38Y
	0HK8lhn06ZCpJ7t1tqdsKB/6B4Cdosd6YQU55wSm3w/xWBjfeEBQ7O4n3LANeX2V
	+6F81g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qj8hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:02:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5db0944fb46so38660137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220972; x=1761825772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=;
        b=AJbPGHyUG4zk/mJXg6l+Sbp2zs3UL6ppJz+FyTWZQ2gbjSmqG09xYS42CzqpmU6c05
         4FIrQfNzXNYR8aM/VSUVzXzMSGJvB6rdGP3L5UArKuDM8iBVhLGUVOUJAFW4QS5eBxZm
         6bF4codRgLQPcQU2bs9AzM/jU4PraCQGL5xcXSIY3qQjCqQRjzxrLixD644RlghmxQes
         aD5efmbHziMZ2h0GnhcJjtsdKBTQZr4A/MRw3a71o8YHLC6vLkGAHHL8sEb5rp/uSMtC
         JaabddM6Bb3eGtzOS9Mae6J9Fm/Gm+MaeNj3CNiiKOQOJ+hywmx1vU6VFMwmuyMQbCX2
         w9AA==
X-Forwarded-Encrypted: i=1; AJvYcCXk21lRA3kWjVnoFKU3tCrzYbHv6TtV4hhtA495R66tcrZrLdR1t3x6jg8RNhBawedPHnfJR9Dk5e3qvxA5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8z+b/ofvJEuarfhvxqDR5WA/qu37TvQA+hIKiNqabeEWO+O22
	UYo+0Z48VobfgaVaEb0vdPUbX7+mVLdBurkClk1PX1RNdCf8MtZ6KrsRaSHGTSXrZ6eXHgmeDtG
	+HFhrwwTg+bT2c3bVovPIQxCNMQBLUo4afq89VjJp75jmr0chTsDokXCCBASRGM2myNyI
X-Gm-Gg: ASbGncsMlrkdoxN8RJy4um+yWGeW0tzaQ36pO1WflLQzAT2TQ9nGNlryGcH+krq4WRV
	Kzz5k2rOv/2Q208y1YHQ8HiBcCCJKb2BquYFvOMMB25r50oXXRhI+6aTTfM4zxlLzsoq/mMfooG
	Yqx05d83Go9AFFzHCrNDaVPUGvZvoZDuISkETC1UH/65AQaHbTeLvZjUYFMsTVOtNaqB8ANnI1t
	fhq7lwFZrBbJqb4I+5DbSo09Axm8dIFlhOcmhvZszzThDV3rI6SYCutFuZHzmRI7r1oQAA7uz6d
	AH9yxBiZHuvwz5eUqV28nrM+lSKniieliYbY1l1IpAM+UicmUcPqRPYqOlw9rqTTQBz2w+aHQxx
	PrM76v8zXQw/PMa9zblOtuL8oo8jvrpvG+yufBsIzOq/B2WpAbCmy8EyE
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id 71dfb90a1353d-5568d9b7b78mr1297675e0c.0.1761220971139;
        Thu, 23 Oct 2025 05:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI7NlxxiPR1mSCsIzjh6laRe8aVKmqjEwN4VIQypjOlNUn1ZJqRFIU7gS95HufUjGblo+7VQ==
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id 71dfb90a1353d-5568d9b7b78mr1297635e0c.0.1761220970676;
        Thu, 23 Oct 2025 05:02:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f322e30sm1526903a12.27.2025.10.23.05.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:02:49 -0700 (PDT)
Message-ID: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX12fs3IcEM1p/
 FtdQyF+tYHZwK+XML3FiQJBL0XcocyORYEIYbXCqjcJHPH2dNe9dodFemOXhuztzCEDeYw2F+uz
 D3oPWRQw7AENO+Dcx8xzjdwqpqRzy9nw2ohCDiPgE5y7rPmPfYRpNAuf1MPLTiXJAjPN9q01cZ5
 UFyDFY3bO1qCfd3rF2YXdJbmPwroA0DnHPFC7AKDG0lpcxnsd713T2wZaCaaPCDXdNHqrPi4UVp
 y8x19cK5lAPP0c21waLvfxZkyJf8otAjthJGxOvwGYM54XFRC+d2s3BALj+kzQo1VKfk3WfWm8w
 /uE4JmncSEog0drKYPDoXpf5GO9yOgbnQFBM7F45vKgVSiES6SeBOM9JzTsGpHUn8cL42sumcsH
 vRNUJOqhZFWgMqnM2aw6VM7J5WEhng==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa196d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dMqN5BQ3aGG_qev9F4sA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: gHOXwmM3l0Eiu3bI8DQjiuXaxhVHcRyp
X-Proofpoint-ORIG-GUID: gHOXwmM3l0Eiu3bI8DQjiuXaxhVHcRyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> Add DSI PHY support for the Kaanapali platform.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> ---

[...]

>> +	.io_start = { 0x9ac1000, 0xae97000 },
> 
> These two addresses are very strange. Would you care to explain? Other
> than that there is no difference from SM8750 entry.

They're correct.
Although they correspond to DSI_0 and DSI_2..

Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
new features. Please provide some more context and how that impacts
the hw description.

Konrad

