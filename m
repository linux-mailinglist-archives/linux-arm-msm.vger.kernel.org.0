Return-Path: <linux-arm-msm+bounces-89569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07254D39F74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36043300748D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8082DA775;
	Mon, 19 Jan 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5bcQ3Bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOtTYEBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB0261593
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806888; cv=none; b=nGzpq6RlKa8H8sNZ4SSC5Ab0VnnZ1uT3eo0LX4JQTESCo9v9LHRvKKJFwDudFl4DCOUtfhA1RjL9F2TzvfJNh6TBX3AymTT8nnWCBjyu9jjTWdWeetmpGG18JXRKNV32TZVJz9gu0F3xmjRNxX6fGQmMY7yeakuLpUolZ8y+tdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806888; c=relaxed/simple;
	bh=5fPllbsOf7sccFo5RXhDhCDsCKJFQkF8T9XtQ7NNf2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAkMIiL5Bt4YAT8uJVmyWwrBbE+SWgfXkNAHUlkRWV0CxTQgnMyRQxlGzCj2qZeRgnVjv53tL7MgyuoZe1cOWtVfQYFM4P6eg+V8H0W8SOlUbdtW29QtZ+qDxxQAZ0H5LMeWVzX782qJyDhsWQPoVdyEf3YhjVBD5rQBlTRxZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5bcQ3Bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOtTYEBq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILQWuB3177181
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WfZUJN+4yyrEknLJ+I9YLz3L5ZjIyay+AUARwvRzZw=; b=B5bcQ3BghjX7/XIL
	kHDxyfbB4oy+Hn29hjlD1MQUkE0orp0YfSnWgJxAL0yFPEsGPs8wOrhKKu1J70hD
	p8a4AOIogHfI281bK4qrnL3ABK42Gowf5pcIzoc1HoMjRkaFghSL4cHFVBWZpW3k
	BjD+2XfRBJuIuhiEkcgC1Z/ruoO/ooMi+nh80jXCBGoLLunSgrRPC691QqUs4TsJ
	Jqhzhg3teFMcYnDN0gNpCtXW+3lkNxBShCJa++6iMBOswRmJsDTvcPfRRnZzQ+O6
	QYRFF8j4/D4GclDY/8KnW0D662F2ZoiZSIQ3j3DcCRwhwqAV5b9V70ulMC62c8Yz
	slEXrQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs788135p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:14:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2381ea85so90764305ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 23:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768806885; x=1769411685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WfZUJN+4yyrEknLJ+I9YLz3L5ZjIyay+AUARwvRzZw=;
        b=NOtTYEBql61bpuxuM3VikKcrqZXdEBdakj8U+74QU6Gul8dKfq5mBvGwhoIaeKIDH8
         G4xSr3jeXnJS4uUpQFZx4zl+9/5zTWiuw20yBWQyNWZHHnbdRN83Dyay35NwB7Q8iRmq
         abOZiEMirp/67o8MaMhwnBrOdXYdnWSBoRhG3kDz0EXFIcMiaDuuzQpHIiX5ji4zWhG5
         jPozlUlR6ReZdHgVmBMhLe2ohQHZoI+7or+HCfZRbLYtk70ZXLEHqoJRTSraPgL10b0J
         z8YAHFNP4w0raErWKwGr7WWgebMmX9tr596WxdoLShhmGGY0lC4QctqA1iIPhQNhid1L
         oPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806885; x=1769411685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WfZUJN+4yyrEknLJ+I9YLz3L5ZjIyay+AUARwvRzZw=;
        b=PUdvU86vU/8H8VxEeiNooAO+DoAVASOX/GE4zLXJTglRTfe/Aw1nRoNBPWI/gJLAGo
         kW1fSYQkOPjcbWKlxBlw3+lC8w21Lq5COpwzCVu+SjEIlIttocqwbERaeyht33ffq4if
         I7jZZlMVAAYkmvDD0/6P+pGQ/6r9KmrtUoBrfXjRd6FTsr4pbyLHoy7Zauk8KsUi6tG5
         Z31/HGfjBfe50lxBPQlShGnoQiuPKahocjfz3mM9REaQm9723KSUXefncdI52Tr4tQo6
         IVpoLsMkcP/GPO3JNCcwPURhX99TnHB6hKYnZHI7lm7esGW4LbKJBNBsXkd3so/ho3yD
         Av0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM4VllpjQt3DrTTyEL8aqAeTFqVVZKutyQVRL7YaspgMW9Mf99QYxpKcM/3ulsSdIPU/l2NPjyj/TA0npi@vger.kernel.org
X-Gm-Message-State: AOJu0YyZI0vSbNWTpn9ijuO5i2cmahsfB9QldptxMkek6qTxEwro1aEB
	3ph5V/NxRftFnldefLiSCGB06nrPt7HXtmB6H9Ie5lXCAU/wIiZfBOV8kJslPR2mmi+NYqFAzsi
	KZnhYeqjVwq7DcyUKujBaCG5ZHoxLZhfxDKvsz/mrm+ClsS1wk18ZQjz3nO5yGzPiBLGW
X-Gm-Gg: AZuq6aI6/R6fQoZXhezzozfxk185QYh7aBD1Z8hx6G1EN3OF01JHmhxkwO3sO1jDy5O
	MUQxoBanJy036xGd0pSWfDLGESZbm6VeZQjBUzbyIeynV4S0AhB1YmR0hZkVlsG5wGqgdZtPrCW
	J2RmxDPI3WEC1sQNCqSYoo/LnrlNJduxRkQLK2HxRQ2CbiIbzzszNpq+BF/AyRFbEVBpdOGLSEz
	cD2PG5pesbo5WgXMKSK9Ug8vwynF69HmxwUjp9zs6xTWcsvcq2vb+rt8sl7enGt09S/j7xtfiNo
	sNT+hKQx2El222HFGY3Lvx92V/Ltm4ER6WYLk5DenQ1M0sLimq0AnfLMBqCq2KKTUrMjNEgyp7c
	18n/+aODNTY8xuhilDaGuGMaPWHVoj6aUjTM=
X-Received: by 2002:a17:902:d549:b0:297:e69d:86ac with SMTP id d9443c01a7336-2a718914867mr106392635ad.39.1768806885179;
        Sun, 18 Jan 2026 23:14:45 -0800 (PST)
X-Received: by 2002:a17:902:d549:b0:297:e69d:86ac with SMTP id d9443c01a7336-2a718914867mr106392405ad.39.1768806884680;
        Sun, 18 Jan 2026 23:14:44 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193df75bsm67919475ad.54.2026.01.18.23.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:14:44 -0800 (PST)
Message-ID: <cdd9dd67-5281-472e-8e84-65a578f999a4@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:14:38 +0800
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
        stable@vger.kernel.org
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
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696dd9e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oRiKqNWV6AETYgLPPlIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1OCBTYWx0ZWRfX8J5YB9IDIJ9u
 S93ZQ3JpxbOYFsNZjV3DtwmhrbwOkUzPJ5hzU3wH8vplGzh9bG/Gvc3lca2LgrxWEq7+cB+tgb3
 QG5mRNJQP35NDkZ2jPnycrkRfHwcNvN8QWYfrjfiaMI8kQfDTCCFR/qyo4otyGcRcvyCj5xtt3U
 yi+IWjq+do412s3jbVhhI5Xw9Iz7hRw+jnKVHHeS1RiPW1/hYHOqlphgN3AAZTT+M9NlNVnAihy
 6igZOW4607gzE3H9baFPibCii2OP/RlCWbA6fUQCNNpelw6X552M/4gzS61FX2JT2sphF8tzMMx
 6cww+1C+b88PvbcDCvG3aRCOdrLgKuWhumB1opppqY5UhYVArxXtcj/k3vt5TUpcyC2M3g2w+P1
 fWW9BHkK9shsEj4ZnrTG6Yw4r8QyFlus6rxIbUAb45+LVSZvWzbO2NTLCVR5v+vKcu7x5oU6H2Q
 TOll9veRCzrBplQ6GGg==
X-Proofpoint-GUID: PVnXTSEKUOGpqMtmfEvzr-VbH4_bj1kf
X-Proofpoint-ORIG-GUID: PVnXTSEKUOGpqMtmfEvzr-VbH4_bj1kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190058

Hi Luiz

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


I will add Fix tags then update patch.


>> Thanks，
>>
>> Shuai
>>
>

