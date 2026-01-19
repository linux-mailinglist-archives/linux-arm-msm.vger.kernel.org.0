Return-Path: <linux-arm-msm+bounces-89616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10060D3A618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8248B30028A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB32358D39;
	Mon, 19 Jan 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3IlmLkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLr4PIye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7C3587A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820615; cv=none; b=ZPONOMU6cpDMixAQFYiH3dCf5FwVFLFmfiuaUpB4DZTRlTIGuDg1bFJTCsz8Y9chFm/0AbMUzhh/UGHtRPnOK9JxjYskB8rxtTAHa3udSoaclGyFprQ8i64KJMU67fUZkKvsAhzzFqEyCKJNToCjAhujW+I7Qwpg4loCNzf34s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820615; c=relaxed/simple;
	bh=qdZow0iIRdgkfYhOnDo9Dex4GvP/UuCwNCPNEWFUyoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGpV0hWef9cNckH35e4YpZ8pKFNQj6/u0AQE5LCAY+FfnP/jLGYe692iduQsGDky57Ry8/ppRWW/GHrTOdTlIlw063c3UU5InTD/n/SkUtH8BblgYR/4owb5vAj//D95SK53NLUtXUyB4HQkqsWPPT+B6LUoZs6UvSKRRtA2KuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3IlmLkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLr4PIye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJhnn1531246
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1LOQNTiDOuTEop/KvOGER6fTNN+/DBF3R/IDkhgQ6s=; b=Q3IlmLkLDuPFJOKm
	FLbMRjbOPhn9e1QoktulrDirOtvqsbdpWfNaLu+/O/69+Gk1G/RcX1bQr8hCg/zJ
	WK4yUxsr/JLv6jx6jDreP2Fzj9Dg/JEF2w78eAgMJlOZhDpZIF12oBtW9xV380PN
	ePXFr8RwaE77HuOuljKhBjVu7NGIFdXotwQI4yOtBj1r8wLgPv74tDP6cw5TJo/o
	a8xyCvoGryQsFJ+3ULphI7r0cNZRF02APM0wgxo9SU1mubP9Ld7f456nQEZ8u0Z9
	m0SASsS/SkzvzWYBrn9jkO4GmBIHriV4u/vQPQGxw4eQaq0AxJ2w73djQVWPdBBv
	ZRRPkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr498-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:03:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso3299150b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820612; x=1769425412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1LOQNTiDOuTEop/KvOGER6fTNN+/DBF3R/IDkhgQ6s=;
        b=cLr4PIyeWziOH8tzB6nrkGZM65x2pmKrfc+YJ8aYmKEoJJA4mHp6eQ5k1TVrN6S3Mz
         48XfsP1Q+yrnORM0GIzKD7BJ3TSeOPOW+YkF7pRXd/AVTOudkt/Mibcj8ASPAPnYWR/i
         /aVwNpgwTFBUTgBrCWRJv+3mUpPIuJjTGDACen7RdX2xVLtg1lbYYuL8aZBH/CoJY1DQ
         iwL1y+2Z0TWeFNtO3WPwvbAnj9SRiU6fKTv5nG7wizCkuPLbz+WnbxiYiIDYQ440waFP
         pXyOm+3+MoZkeTPP98w9UHPvZWtIgAsrFgrYRnnUssS5dXIdkSsTEhY2njSdSHX1ZxmQ
         +3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820612; x=1769425412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1LOQNTiDOuTEop/KvOGER6fTNN+/DBF3R/IDkhgQ6s=;
        b=wUmFNjzrmz6C1kkdT20u171eOR2rpmSFiWlScrk8kLR5ULnqTauMzvgO89Wm8Ikkq9
         t06Zr2hpt5hDyJ/X0zAgkpntdEy+8+dFMJ8ApSP1fHtSPK/iqQaRpx3+7yndO7yUV6Ll
         Ami5qTA8qeQiOpNxcB+MQ5YXVczK9VwQpsn6LepVdscCPlS47tDy2sT5WigQV9NnBmbU
         nDyAZHeyssy3Eb62PqGeqYcwmGLkYt2BjHIuCTJ/eV6vCisGFQs9lbS84UIUZDDYtKgg
         BqBErRjE6JFgFjYlqpON2fBoOfb/j0QU/YOWgzxzhWJD5THJnvbksDJrQ3D98sUwbaKJ
         Otog==
X-Forwarded-Encrypted: i=1; AJvYcCUdoXt5WD6ELjT4DVJQO+H76lwVOQ1q14zZoNdoExyexPw/Oxh95jgzIlDw23ayMuCyM7RyOPZxrROXxysp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrs2JekSG2wfkGbSF74NTC+Y/O3NGkpQ9EAzgKD0H2j2v0PhFc
	BGw0AStrRVW5jzkHujp5/gIudnFUdkPRiUkSlUXlVTCIXqW2+PQ6F0EIm0zj6OD9hj/ueWM+0rJ
	E1BGL1CHpJy3MAR4Esj+pi7fABJePaIsnhE0EZcN1uv1FZrjPPBA6/oNJKVzhy/ztO3KA
X-Gm-Gg: AY/fxX6ZviXY22WEmJCaDaL6+KFwlNrb7GJ47oxPxFcLZyhb0KEgcYbAE7RtoYWGocE
	cIGPDevIP3rzgjm8a3wty7IXwq+wUMi5OVeSmohn8tlYnxCZoeISelEBjtUrGAVNREYfDekeCYa
	A6EBKVtQyH4o9D31DxlnoKVQjFS15raNiqEm9aSmo/6Neq4M088YbnB70VIjij5zuvZ2AQj9XlE
	NgOUwU50MuaQCyowcEEI+kp9eomFnfGeW5icfbcNJTJW7vfVa+QXi6+uEeHlcLgxGAf5nKN5GOz
	dQr23JrXvN+9Vq7IM1KZpXbn5/2qclxcWKet1HwIysw+XoZ4dASslFJalIZp6GE08amd1Tx7O8C
	NdlfGHzAmp/e2BtMBavxrZXJK73z8bcDYQpo=
X-Received: by 2002:a05:6a00:440d:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-81fa030fcabmr8923188b3a.46.1768820611465;
        Mon, 19 Jan 2026 03:03:31 -0800 (PST)
X-Received: by 2002:a05:6a00:440d:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-81fa030fcabmr8923164b3a.46.1768820610869;
        Mon, 19 Jan 2026 03:03:30 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277a15sm8994060b3a.42.2026.01.19.03.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:03:30 -0800 (PST)
Message-ID: <148f8566-2d99-4fc4-a934-5b7d1bcd5a20@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:03:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix SSR unable to wake up bug
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Shuai Zhang <quic_shuaz@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, cheng.jiang@oss.qualcomm.com
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
 <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
 <212ec89d-0acd-4759-a793-3f25a5fbe778@oss.qualcomm.com>
 <CAMRc=MdoUvcMrMga6nNYt8d-o8P-r3M_xY_JHznP3ffmZv8vkQ@mail.gmail.com>
 <96472b7c-9288-4f81-9673-d91376189a18@oss.qualcomm.com>
 <CABBYNZ+5ry0FWFSgOskw60jja9mE6WG5AwOi2pKxrkzqMn9bkQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZ+5ry0FWFSgOskw60jja9mE6WG5AwOi2pKxrkzqMn9bkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MSBTYWx0ZWRfX3npLoMDWUaHM
 YG4jYxzIL3iSgv9myz7SMczaJb1XM3F8XbvbKjCvfPq/tIk6PSgFxDEIsMryFvjCMjHxXwNjqqG
 muqM3vpEaHuL0hOBpgui5wwTpZrFRV71XnUT5qAW44zHkHft44xq9k0XRnhTx59BcHHtMRVsRwJ
 T+fPrfSqtdD2uYAB/iM1AzvsqR+AEOJxC+MNoP3H9oF9XwY3fFN8Y87Am35qGada/8+Dni+axW7
 vPL048m/jyx2Q1LsLtQRXk4Ehs9ikwqnZ8k8b244+mps8N+/89UIMr80GvIP+crgqbcbjHSsbgM
 Yw1j8zkCLKUlsAUFY9cyzX/fQ8NJ6Uv58K/Loz3fj8U+YgYohofGzfNaBQjUnLkAeGwcGRw6FM4
 BcsmMQbKdxzpnW6GufgjR8vCE9SnlYpUXQNaT2EEH1tB26ai90aIk+Au+H6PubuYySJ7dNEpB5q
 D9DcaMNI/qUW/Bjki+w==
X-Proofpoint-GUID: VWHVJ5pwE344J2iGDoC4WQ2OORSwChsi
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e0f84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oRiKqNWV6AETYgLPPlIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VWHVJ5pwE344J2iGDoC4WQ2OORSwChsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190091

Hi  Luiz

On 1/16/2026 10:42 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Fri, Jan 16, 2026 at 4:48 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> Hi Luiz, Marcel
>>
>> On 1/16/2026 5:20 PM, Bartosz Golaszewski wrote:
>>> On Fri, Jan 16, 2026 at 9:37 AM Shuai Zhang
>>> <shuai.zhang@oss.qualcomm.com> wrote:
>>>> Hi Bartosz
>>>>
>>>> On 11/7/2025 11:37 PM, Bartosz Golaszewski wrote:
>>>>> On Fri, 7 Nov 2025 04:39:22 +0100, Shuai Zhang <quic_shuaz@quicinc.com> said:
>>>>>> This patch series fixes delayed hw_error handling during SSR.
>>>>>>
>>>>>> Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
>>>>>> Patch 2 corrects the timeout unit from jiffies to ms.
>>>>>>
>>>>>> Changes v3:
>>>>>> - patch2 add Fixes tag
>>>>>> - Link to v2
>>>>>>      https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>>>>>
>>>>>> Changes v2:
>>>>>> - Split timeout conversion into a separate patch.
>>>>>> - Clarified commit messages and added test case description.
>>>>>> - Link to v1
>>>>>>      https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>>>>>>
>>>>>> Shuai Zhang (2):
>>>>>>      Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup
>>>>>>        during SSR
>>>>>>      Bluetooth: hci_qca: Convert timeout from jiffies to ms
>>>>>>
>>>>>>     drivers/bluetooth/hci_qca.c | 6 +++---
>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> --
>>>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>     Just a gentle ping. This patch series has been Acked but I haven’t
>>>> seen it picked up by linux-next.
>>>>
>>>> Do you need anything else from me?
>>> I don't pick up bluetooth patches, Luiz or Marcel do.
>>>
>>> Thanks,
>>> Bartosz
>> Could you please help clarify this?
> There were no Fixes: or Cc: Stable in your changes to indicate they
> need to be applied to the currently RC and stable trees, in which case
> it will only be merged to next-next at a later stage.
>
> If that is not correct then lets us know if that needs either a Fixes
> or stable tag so I can send a pull request immediately.

I saw that it has already been acked-by, but I don’t see this change in 
linux-next.

>> Thanks，
>>
>> Shuai
>>
>

