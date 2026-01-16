Return-Path: <linux-arm-msm+bounces-89344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFFD2E20C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1EA3083C7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E1F3064B3;
	Fri, 16 Jan 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2W9GDa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJxHhJtT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553713054EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552669; cv=none; b=EjOvSNZMLpA6rAp4RD+q+KdDURbQ+LzUjL5PxmX+dIhZqZYoR1azXszCH/FH0yhBGoWqkaemMzCzoRL6N4+lQ72/LKtGuXyyCBQZa2xx79Zd58VNkmB+CqN6vSm6l2EvihytC/YPYWSeqLq/Q6QX4ANv+DgY56d/Rn0vhK26rJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552669; c=relaxed/simple;
	bh=Wo0v98NiwwZoSBSu0hG52PGuT4mY5zh+Mz7G8mPyo+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzOxqcIvakS/YtFS0HbDeN5aP3fOH3OeUmSjQlmVwPygATY8DzwMXy/ibxFpXcAh1+Xcwrt7ThRMcH24dtk7FsZEK2MZ/BXi0JaqJWORlTIljgb7ASEppmZ9k2Qu9nu5g0Zdu3ECZlpggOMqsATK/mL1u9IQgs+ytoekO20FsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2W9GDa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJxHhJtT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8BYan4015687
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hJoviBhSRrSTkedhGgyaweIZF5DTqpfR6ntajZwZr0=; b=f2W9GDa9nDM0RJbe
	Q0HrUeqz1RvzkqSlxdGfr/z+5eXUUHCetjI5Jhut3sGNmhCRUQovUnzCAG8Yroz7
	Tucevm9id5wXkjKgzhEaRt2OFKWsV9+UytPsiFkUblzVgZ4zP6Ln0Ny52yrZuKLU
	Ckwl+7x715Yqixmod9i5Aa7RXk44d8b9JcjIYo7kjEvnHBjmS+JF8ze7hq0q0ZFa
	uBEOwZCHcQyv1UTpZXWABeIFlJeretWNwJPzJLcIfREPhVVxzOy3lXrv6i0QA/df
	FDBKQNPvEmK0bCHhYSVTnNXfT6aPIAUw7n7/fjeWF6yYQUOuOQCJuWRwsVzEiPQw
	fGu64Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y9dh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:37:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f13989cd3so32904325ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 00:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552666; x=1769157466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hJoviBhSRrSTkedhGgyaweIZF5DTqpfR6ntajZwZr0=;
        b=RJxHhJtTkIrZORkMdzNFx7n5REOaEW1fM5ZOoNymOJLRafecAsAWmMW90yWN+7ug0W
         LiW0kOocgneMoFaFjbPCvMk9tDJzp/TZxk1FGhi5rgyr+0cVOVT1BgdJUKrsRUUGaBKG
         eoA4Kd7aRW3XjbzZ2Svhlw3cZW+NURS8JajYC6T/J1DhhhhOuGVeMc4c5/4vQx5XlNAj
         hX80WVc5DfDByXKr0OnWpmwp0n+7hdrB9f9V4BxFri2pmJDFx2N+AcHlNlB/qZpkSpA8
         pw7GIU0VBnq6Xfuu6zTD74fZEwx3RwTI5RQPYKg1TCRmaAHGbLpKsseIf5cKwO/QPDaY
         CKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552666; x=1769157466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hJoviBhSRrSTkedhGgyaweIZF5DTqpfR6ntajZwZr0=;
        b=Nd1KC9NFqb8JDatnA7t6WN58wfpSOPRze9c7MYtRsNYvgk1QvDAfrYSlWPE20jkujo
         zjzV816Vs+StJni0Voz895sgtSSmOSfJTvss9bNDiKMZHXjwUWQQDQ9kTbZCLhgW+m/m
         B7ORW/HGeTuKOW7MxYBtzqIHEJ+z5eN7xuU0Rifl3vtlShWKmCkBBNT60Rjf5GbLBNEx
         niBr664rBHIC7mqHFjOBv/xo4mDGNW2tVa/nXdDn2WuptccM90s/0bNXzx0fsp8TjkIM
         aS9kRj8UhJqJoxMjsOQCFtLhN1WqLxtCATtZdsqamN8Wdsy1PjCxFgx0/zVRXMaDKbyE
         8kWw==
X-Gm-Message-State: AOJu0Yx9sTUUeqxestkm+RyEyRkFxGoW/0pRugCe79ZCivIlWOKq2yAY
	ahwkceOMe+cHP16lJ7Ef37k4Dkvqt+qYSdlNh+mKiF3aUHYWvY3aE3lFo+jYVpa1o2n8EEL+j49
	y959VU0zIKa8n7L2iQJKeSVoR61xknufXnB7H7PCEVQi3tC4ceBe7kTiBQkNVGsA5Wdl0
X-Gm-Gg: AY/fxX53FmPIBf+54O3nXd29oTk2TxXETNQ76FYzGuEruomncfkgfU0vqnvLNxF2rDn
	u5qIj7+PSsMHbJr+6zZp1OZBC6suqsY4CQF6Um5FQgiekHrS7Z7cu/r5LoTXRWeh5uI5EttpRCz
	XEwwDCZT37zNblKxcB5W604DP0Nm4wZcpGzfRuJcEcrStUAKW7k7PLyIIR5+hJD6IgUq6hPJ4tM
	yl5QNatlVmfb5mz7Zzjlmtd2nOSincDtXOckRqJ/VzD2EM4ypQ7noXzeuSOKlqS0Z1T/QjHtavv
	GScpSFAirRbUJNAhDcQstk77v0FM6SO4x8RbqYI0cDIl438L6BAMbVTbv4G2MWHhzy3dHjY2kM+
	H9BLuJy97JdsgS5CTr8MCiXsX8u9BCGs+bXCn
X-Received: by 2002:a17:903:2a8b:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a7175cbc55mr24997125ad.36.1768552666024;
        Fri, 16 Jan 2026 00:37:46 -0800 (PST)
X-Received: by 2002:a17:903:2a8b:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a7175cbc55mr24997005ad.36.1768552665550;
        Fri, 16 Jan 2026 00:37:45 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fbf8fsm14495975ad.78.2026.01.16.00.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:37:45 -0800 (PST)
Message-ID: <212ec89d-0acd-4759-a793-3f25a5fbe778@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:37:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix SSR unable to wake up bug
To: Bartosz Golaszewski <brgl@bgdev.pl>, Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
 <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=6969f8db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=tt7pwmok8yNgGN8oZKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YjmGHHv4ra-c3h9JKzwy7dzanSam870p
X-Proofpoint-GUID: YjmGHHv4ra-c3h9JKzwy7dzanSam870p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MiBTYWx0ZWRfX9jl/NYT4CK9r
 yYIkEERyppK9RCLNYGzVqTTAqvHk/GqS7qBL1Yr6e0INANeoWLgEL+MYYsQ6kFzjN8YI65h3MuO
 +68QnFOFAdaJzeE2GQCxTzEBpFq9bEKOqEYMfy2gRDxx/pN1oXj77HndRer/h0+PjmEFo6LksSf
 3zoLnWkw4ITfXL0c5uAtG68Oiz71l1zLWmjoagA+mm+YeLbsggZ/PCtRE/OVrTquKLUhoZZBEpi
 HB0d2YUbk59KNwb0I1lnQqNl1DP0sWGFn1hwnh+yZM7XN98mi53+jmqdAAMhSE3mxtg9lHsfelG
 lWXLQ9NtBUvhl7wtYZ9IHC/hIx3tlPkeRWNYPMHoRIZcw1foTOdxqAJTeYr3bKRPPaHXr7Tw2+L
 TqPtmrx44OqXg3/6Qk3rmLW5mNsXo0b04MpLjvOpurmZoVf1nKxEL2xSgOif22xor3SqDZf+KI5
 /typY5vTiae/1XQH40Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160062

Hi Bartosz

On 11/7/2025 11:37 PM, Bartosz Golaszewski wrote:
> On Fri, 7 Nov 2025 04:39:22 +0100, Shuai Zhang <quic_shuaz@quicinc.com> said:
>> This patch series fixes delayed hw_error handling during SSR.
>>
>> Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
>> Patch 2 corrects the timeout unit from jiffies to ms.
>>
>> Changes v3:
>> - patch2 add Fixes tag
>> - Link to v2
>>    https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>
>> Changes v2:
>> - Split timeout conversion into a separate patch.
>> - Clarified commit messages and added test case description.
>> - Link to v1
>>    https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>>
>> Shuai Zhang (2):
>>    Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup
>>      during SSR
>>    Bluetooth: hci_qca: Convert timeout from jiffies to ms
>>
>>   drivers/bluetooth/hci_qca.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

  Just a gentle ping. This patch series has been Acked but I haven’t 
seen it picked up by linux-next.

Do you need anything else from me?

Thanks,

Shuai


