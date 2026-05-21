Return-Path: <linux-arm-msm+bounces-109000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKAMAm3VDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:50:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C45A2AD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6400730A5D14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC41E37F738;
	Thu, 21 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e89tlKG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEWE8z9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E815E37DEBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356673; cv=none; b=QOADGFm/KnU2DoOcMLcPi8xfix1H8Z7B0TYXuHAyls/BGpsSlftGOKEijzedRL6JAxt4oSnUagEjUAgIAVukUl842h49FFyq/oRdN/mrgV/PvvX0W6dILUDQjVvtfkcWN7YP5Jbwjfx/RgzkZf4yYXvz0tov8ck+I1Mn06rIvKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356673; c=relaxed/simple;
	bh=vx8UXlor1Q+mZBEMuasnpVJ17YTJIUQy7oD2wpSPt9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KT337AAX+NIK921AXReQ3bN9/rM3BVRa8ck4Shfy6Vh3HT5S2M76InzwT3bjwXoPIms32Go0nCJxIUdHqErtoT9P9i/+cCT8d+ntMehBpASXv/fY5fnK8y/rP/q5rrXNfaespiDKbc/dBiHf/q5VSkzqthhDVUsbr+QhBzNI1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e89tlKG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEWE8z9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A3Dr2633671
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=; b=e89tlKG2ldRZLMgx
	ZROd5bzhmXQ5wAsHKr99UO36vWiJIQeLI7XLkwAClZJh6MaiyUIiSL5cwfuYPa/p
	EVi4MM0L32qSmqAEFoppGGbhaTP3k7xHSmZsaDdlL2IsyQluVwKdhwb/AbT5YFWl
	u5UyLo1C4aueueP1hc0ByxH/8rwmJL1QPOYLxAAiNcbsNRSBnbBw8Xwnz0kAj4yh
	wLcLRWB5bTeoKbLvVzlU6KeuhEPEw04QFSeB+NZlywnl3OrSuQD6VDGQc7mFI7QZ
	QOkA4mIcmXPFL0Ul8y7XA4dz5XJUFbHLF3x2zRu2uLx3BAnFoGTCNt1O7gyExSNu
	YDNO/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8caxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:44:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso62947675ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356668; x=1779961468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=;
        b=hEWE8z9ejFXC/IgNaUGsbo0EHfTqVEKwViMW7vTp7zBL2tnE9t8D/WG9hh5DE5zhu9
         m2H6j68Q5ObBVB2Z+93aoBGSWDnAmIl2JlfBzPnMGMS0zmzdIPjLDjhXYZ4BBta38F9a
         XwUcIj50h1pAIZA1E4bdmny8IDBgXgpje7QrpBr5gzOVDx9vtJPL1QrsY+1qVg5QbaRc
         Zgxe2/nBweHGQP6rFoa++5OzFusfWpfPNK2KYZdEkXfcQTloR1f//UoBp2qbiqao+p8V
         l8Sv4IwC1KRc/nmvsKIrlwLYNwzZmGVnYBFiUV9ZR0xZlX4JaR0p//7+p+uPMFm9pifs
         sFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356668; x=1779961468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=;
        b=LMFSI0a69JwJ7bRnlvSou1hEvnev/6TWaye5DB20A7GTu1UL9AaS/XO63AWKr46bk/
         VZaLECusjM8rlVEuPjUqMPQSPwjk+iyRdLFCed3D/Oo2qVDqswktsBrvJGpeFDtKSuqm
         febpMsNsj9m35uvKGd04DvO2wOO8U6km3lIxqN0o+UcmC6wcidknQ5TYza39bpphcfkH
         EYCCWsR+Agu1uGLpiEMcCqi+E8n6XZKeOozwee9Ykw+FLN4TfjtBib513GC/2gCZY4Lf
         DpaG/RfoT+WTbElLAFw5JxZ9v+ZX9kbSw14PJIDWzv/8cQBfTBmZcV0ZmA2L72G1YeR7
         0POQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5SZc2QAKE/k7LQDnfoPRJttzplYYiZIw3H0DzkU9CDHi5+GoAUswP6Uxn0nBwsQmIbejcz2xM2mwKRv6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxXsRe01sa8uhxsT6JoXaamx/0lTjyuoG4G8uHiVDgS5tsdMpLg
	5KCzBmdSX6MBeo+B+71AC0y/72H8R/wKmV1h18L4B/UfNVi+n5uSR6SF2lVHQ22GzoXN1ZBtNBo
	5z+nyR7ZT4FWy/bkymjJYey+EWe5wlkDw8mlG6N3mfnNL872kOvFiXrPf5n2tkAS4EMA4
X-Gm-Gg: Acq92OFHaFcEu8qNno1jPVqn0XAPrpDl025htmSJ3KojUtvORtf85kTpvgbcr6u92ex
	VtcXBT3rFD72YdtmoIPZGZxP6lc7Q9h9sXE4SLRDvinPcWgMb3eX624Vb5YeF65S91rESdZV81t
	naKZdXbaX2UoxN5ao5M7a8NSGAo0A1GFrBNci7D4aADZq1qNgXkRZUf3+irV7JagtrxperwwJ/G
	pWXayqsleF2Wr8/kxrxsjvahSj5MqCTrBeRlsBPY498F7Pjc6W43oD/a2e80nltd+VBXN1upxSe
	PpRxbjgxXfXT4fHhls4V8VT31pxuMU0xwI1wTAvzDhYaj9NSb9CBYj+3VrH2ki+EqFuqxL78eoE
	J3XIjOmhoMxubisPI46HfNK33jnyl8J2b5urwQD02GfTT1fQffK/TxBA=
X-Received: by 2002:a17:902:f786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bea32fd20fmr21522415ad.19.1779356667891;
        Thu, 21 May 2026 02:44:27 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bea32fd20fmr21522145ad.19.1779356667407;
        Thu, 21 May 2026 02:44:27 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea99112basm5206415ad.64.2026.05.21.02.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:44:26 -0700 (PDT)
Message-ID: <c770444d-be66-47e3-83bc-be477d4e07cd@oss.qualcomm.com>
Date: Thu, 21 May 2026 15:14:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
 <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
 <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DNb4YU6etdNPqaaWPjYqHdxPlTJ6bYpZ
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ed3fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=iptcRLJNIGpdCXh1_3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfXxweupcS0yT6S
 SGWoQB6aMX66/UBotAXMT1f984pk3p/erNyXNNt3+ux/DNewDM5YmEgjSnnzzKV1yhxET6JIQ/O
 Pp0aDrfoe6m7BxPMlB5AUHW1dDUwNUKFvUT+B8iTCS2uw7+C9tPY66x2DZlz5j1cRL+XU0WtYZ1
 ynJ7W79dlUfPodtj+EIOm27u46tLRCsTeQRdYXwe1WEhZoo7lj3EyP5COG3ANe/J+InH2AkSCQv
 R2s6Q1cW6r3CIc521PisvFQVAd3opWW7tQKD+o1ZVabJnCGmltXaqRFgfvJ4Ahe/kHIVui3jVbr
 V1ikmWFe1BVaE3acXFgyT1oVdTrsQ1SfDn5O+mLFsTS465WXOKAer/XraG3cZ31wmWm6XpPck8n
 wJWT4JcndWSTP6q2CUN2U7CVcS4SbqcY7jSRwDA06i9DdGnic3ntI9CNPE3ZIdot2fQOxFFtjte
 TMqMyfuCUR0ki1ji+Cg==
X-Proofpoint-GUID: DNb4YU6etdNPqaaWPjYqHdxPlTJ6bYpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109000-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 712C45A2AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:02 PM, Neil Armstrong wrote:
> On 5/13/26 20:50, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>> the right 10bit pixel format and stride when in compressed mode.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++ 
>>> ++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>   3 files changed, 76 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c 
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index 30bfd90d423b..89de8c366836 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct 
>>> iris_inst *inst, u32 plane)
>>>       if (inst->domain == DECODER) {
>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>> +        switch (pixelformat) {
>>> +        case V4L2_PIX_FMT_NV12:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>> +            break;
>>> +        case V4L2_PIX_FMT_P010:
>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>> +            break;
>>> +        };
>>
>> semicolon ?
> 
> Ack
> 
>>
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> @@ -517,7 +529,8 @@ static int 
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>       stride_uv = stride_y;
>>>       scanline_uv = scanline_y / 2;
>>> -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>           return 0;
>>>       payload[0] = stride_y << 16 | scanline_y;
>>> @@ -532,6 +545,61 @@ static int 
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>                             sizeof(u64));
>>>   }
>>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst 
>>> *inst, u32 plane)
>>> +{
>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, 
>>> meta_scanline_uv;
>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>> +    u32 pixelformat, width, height;
>>> +    u32 payload[4];
>>> +
>>> +    if (inst->domain != DECODER ||
>>> +        inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)
>>
>> whats the restriction with AV1 here ?
> 
> This restriction is used in downstream driver and Dikshita reported we 
> shouldn't
> call HFI_PROP_UBWC_STRIDE_SCANLINE except for AV1.
> 
> Could you please check if it's necessary ?
> 
I discussed this with firmware folks. As per them, this interface is 
effective for AV1, and for others, it might lead to higher size due to 
host demanded alignment.

As per firmware team,
"While the documentation states it is applicable "for AV1 ONLY", sending 
it for HEVC, VP9, or H.264 will physically work—forcing the UBWC output 
buffers into the Host's fixed stride layout. However, because older 
codecs handle resolution changes natively by triggering a standard Port 
Settings Change (PSC) to reallocate buffers, using this property for 
them is largely unnecessary and will persist statically, potentially 
leading to wasted memory due to over-allocated padding"

Regards,
Vikash

