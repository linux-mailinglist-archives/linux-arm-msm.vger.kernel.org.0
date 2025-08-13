Return-Path: <linux-arm-msm+bounces-68974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EEB2487F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA39165F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957EB2F3C2B;
	Wed, 13 Aug 2025 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMyzAkIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4D2DA760
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084780; cv=none; b=MfswGV/jucbkYxYfkvPeb7CtJHLWczEQy+rV2B/+Gd/dYZ0LvieF9X66kOEucUbPEO0hx+BTHMKTEpb5L4fux5XK+Y04+mukG4ngaM1b1AZEflj1PFejMq21fQLRFP8y+QNNemFcOJs07LST7WU7rW0NGlSDmYet7cbtdOsgVRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084780; c=relaxed/simple;
	bh=/DK8EjIStFJVMNf85xjTr56IMYlO/g4hrr904vleQb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSE3JfbdXm66j+P3tBRJjv/5sffkgBjm0vRCT1T5pz2On/SMUKV+W8iZzszdoo6uBPcV/60+X37iyNZlISZgTr9EG0wSfxC8oGNROHBskM7Qhos68Q6Hi8dKFc5MfV83f1dQwfASdh2x2CKZzRyhMrHRWxwR+Jbyhgomsg9xkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMyzAkIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM2fJ024302
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+WCWb0xAT3kZeVfcQ25akRiZu79Igey9h0WmKab37w=; b=MMyzAkIFPircYJEM
	sTI2DM/GzzpmtqjMC3pcW3Khns7BGhAE0qoyNiZyQRVAiDuOmxevb2Wjuihcc8Bo
	sT9DDkKxv/9YnP0ClNVkqmA/Kge7ITIvROSxRaGuHBjx57BclZA98BI2vtcdh+Al
	D6GecvNN97sv/gt6p+9uiFn5haAEUmU1uW1Bf72oAhpnPnfrZj6QgwOUGBqYYBt8
	WzVJ5vvXlzHuWLs3eWBuoDacfmbvZ73Y552QcvziWxdzyeeuGAR+W8G0fb5IwCjR
	E1wJNmGSE2QEiPgoQEjNd/45Ig0IsXh/wJ/SmEpPeKZtrtjhiP7hnxNvvDpCvY6F
	TBvMGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rr9n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08f6edcedso18832731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 04:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084777; x=1755689577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+WCWb0xAT3kZeVfcQ25akRiZu79Igey9h0WmKab37w=;
        b=MnjC2xAF+rBV+2Mtw7yOzQU8reLWH2ryQr52byWiGIjx91B+uquP+/vesRAjyqbWtm
         S3bXS20YRdwmrWQrjSmcwOFjt1cHLPkQEx558xPVfYIAkPB1HcaQTLwg5QC/JtEKXoQg
         sm9WMy0lbZX6HFfyoxQZYEKUeFzg/iWx8l/UAN1T70tc0Wgog+ssEuMsedh8qXoiUT0j
         6AQROZ51ymjxVZQHlhAToIwsLMeg3+UoSME8MmT5XbzSfc/VX2lOlSL4rkUYfbmz5pPE
         CVkquGWs2VDVGJzOSDQKR7b8CoyjjsRDKx9riwu56dF5rwd1f3kpgKNKgNJG8DGtHh6g
         nXCA==
X-Forwarded-Encrypted: i=1; AJvYcCVR4H3TnBLq3m0sSXHPnHeVBdOjLUJWSoE7SRxaMQa+Ce1VCrK8vDsxk5T0/rIdajjrX2ktO/zsRsgo0tqX@vger.kernel.org
X-Gm-Message-State: AOJu0YzGL56RCUAGoN07rvoYzEtXu2rlJFO/ttjQtcK8h1so8EBfv7RE
	Gh6UA7RvJJOL4aKDa5Loo4X/LuvryD/EuzDn0S1CfO8pthBT4fRXsmFXTSKVr1N2Sc8PMdSbi/P
	TvpqwUVKRqu1JLEs5ZMOrpWF34wry3/vdXpbK219VBD7EBod4Qk4z9+fiW1mQjnMGWauh
X-Gm-Gg: ASbGncsdvxXnFqcpnJt0ySfMNn5nLw/D5/U7xS73XH5x5yOnrdW5/fJKlI2xky+Ffv7
	ozvp084igEuzBxhMT3ZXaS63p9bi1PuIe+UKi0s01nhcbfk0/cEbsKL+eAdY+5NVNLCYq3TMV/G
	OBvO1tZQebhOtaOR8+Ii92sJyjLiW/kjTSjAwhg1yg/p9NtPYMhrWCjcZei68ZMVTBbig6E2mKG
	2rbxUvAEJ2e57Z1lJFqaOMBlxo5Lpbpz5/9G6dMtMZkGghPn4sJhzsq3jDP4ZTDiZb6kZycwM+f
	uhLSmKs8IrEk72io914qiXgB3PW7v1awGbhRKXWET+HK4Vie60GEwm0JKf5jMf5Q2hNraFjFKx9
	vjGRv43z1z7q+UeA7NQ==
X-Received: by 2002:ac8:5816:0:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4b0fc68e540mr16953251cf.3.1755084776801;
        Wed, 13 Aug 2025 04:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL7Gt+vlJwdtBhKpm+LovS/uNMV3gu7X/kPBN7TkUPHIGctsx82OloJMBlgBn7gBMnWyXNyg==
X-Received: by 2002:ac8:5816:0:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4b0fc68e540mr16953011cf.3.1755084776263;
        Wed, 13 Aug 2025 04:32:56 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3bd2sm2365143966b.54.2025.08.13.04.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:32:55 -0700 (PDT)
Message-ID: <c2493fca-dd5f-4721-b2e6-17fdcd8ebe81@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:32:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-2-quic_shuaz@quicinc.com>
 <77881d50-c044-4aae-bd0a-5265e0db51cc@oss.qualcomm.com>
 <532d8aa9-34be-486b-b477-dd72389d8703@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <532d8aa9-34be-486b-b477-dd72389d8703@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX7sKyv8meywxl
 N8WXplCwdF+q+9qrJcSIkzvvJPOrHJfWvVVJbjvA5DZRknIhsN1ENj9geQpbb+94xmGKdfpRiHh
 2UYRYYKgv+zC8pYNVJdDsZR5yhopzFenMukLO/sLnrlAEMlJwRXHAEBFcE23i8kbpit1siqmcYD
 iZ8hxB/kF1N1WJC1VNd1zCCR5JqoYL0AP4lfg0BuE2rURr1/pQEUcG/jB+15/2cz+13QmQ6mrAx
 ndEroXh3jzeCtrw7U0zHv3tc6MjUUKfnMyrpVVuPQ0vQJ5JdIEujZDtaE46+2qiST93V4ED6Z3r
 DUbh0KjDjRnFPOIcXo76KMgqyAqqE1FZv8km0yGSeKRsDmWXaVuTD3+Jfkkqwvjevyv3WjosTXs
 38/75hTp
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689c77ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=kcVZ-7Km3AzTPoQvaRQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vPHWfIlZVCU6RvgalxH0ylY8ZKVfuOjZ
X-Proofpoint-GUID: vPHWfIlZVCU6RvgalxH0ylY8ZKVfuOjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On 8/13/25 1:28 PM, Shuai Zhang wrote:
> Hi, Konrad
> 
> On 8/13/2025 7:05 PM, Konrad Dybcio wrote:
>> On 8/13/25 5:35 AM, Shuai Zhang wrote:
>>> When the host actively triggers SSR and collects coredump data,
>>> the Bluetooth stack sends a reset command to the controller. However,due
>>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>>> the reset command times out.
>>>
>>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>>> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
>>>
>>> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
>>> because this quirk is associated with BT_EN, and can be used to
>>> determine whether BT_EN is present in the device tree (DTS).
>>>
>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>> ---
>>>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>> index 4e56782b0..14b2d1bee 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>>  		skb_queue_purge(&qca->rx_memdump_q);
>>>  	}
>>>  
>>> +	/* If the BT chip's bt_en pin is always pulled high by a dedicated 3.3V
>>> +	 * power supply via hardware the driver
>>
>> weird line break
>>
>>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>>
>> "System on a Chip chip"
> 
> I will modify.
> 
>>
>>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>> +	 * This leads to a reset command timeout failure.
>>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>>
>> 50 is a random value, I also see 300, 100 across the driver.. where does it
>> come from?
>>
> The controller requires 50ms to stabilize after power-on,
> so we wait 50ms after the coredump completes

Is that common for all controllers supported by this driver?

Please #define this value somewhere

Konrad

