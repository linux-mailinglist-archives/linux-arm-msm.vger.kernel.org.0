Return-Path: <linux-arm-msm+bounces-108826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLjoInjZDWrE4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C65914DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86B2430E6EA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0402E3F2116;
	Wed, 20 May 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWkZaH8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo/NUyyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B93EFFB8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291872; cv=none; b=qsa7OmTkalKeKBDzXB999DQfpVg8es3K5CH7Mpdk9vNGmI3ipP6B4PLheLpEY3npZ1P/Mdfv/knZPznpAju1lrsUfAyWKQ/BaQrwebRGn8wZTeuhB1pTnJNh7TUzJme0iNE1ZShIziYoW5SisBLlo37BQILGrneTxPVCp4Jax4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291872; c=relaxed/simple;
	bh=hXYOo2KOdZ2RezxUpX+nYE6lfyapAWeCnwTUrPTZ4cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0z5bAwa9Y4Le85q/Vg6kR2SZQR1flGo+JlgDrFKDEw6gilLtcixjXj2GuJ103OV2FFS/B6cdgZoM4N55owC75Sf6CgmR1+vCRemiVm6WQlRl6gRxBcuJLmATjqr8sk53DAevAvdS7HHdRd23HSJyEidcFPVP0MsHSI7DtWUqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWkZaH8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo/NUyyh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6UPr119026
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=; b=FWkZaH8Q3eGw3zBs
	a9WY6NuemhnNDNJbTacpwXkQi5l47YYuFph2bmONnX2LFikLp9+cDJxn+GckTYSb
	om0ZEDcuR/ypP+B2balufsPL/l0/xMUbbVYrg3bSFdCemINHkalSqIMEf/dck3W3
	jl1BzevyVRHhL5om42xucssWD8o3EbL4oAfZ28srTiJRF9CPFShZZjARd0twIAm0
	RH9V5SDwL/ydAeDeLysZL0KyQHh77AJibVa0GM7fXOw16XSyFqsf0oNNut5TsDE1
	GRbgSw4utvNc7Oq/KuzvEnHMMzNmxdaZKudXRQmvxD7N2+XyBGz9o8figfjUugYi
	pTKasw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88e89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:44:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso9788911a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291870; x=1779896670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=;
        b=Fo/NUyyh0W5oOPGSbXPb0s9pltxpeggxI8UMPQAU5ki4DUZQalCYqq3xBG45panaQk
         uQO1wgXkkJTj1+TKZpVh6ZKQMM7VBxFBcGgknBGxK3tJvyfRck/Q/KoQICkyR/0WG6EG
         jTaqtT2p3i5LTx9VmypVIlrO+X0/Sk/HvAIBU/xKNAhFwiBDaB1E0vrj6u/IpiJ3jrXb
         rJXJdi9NFuKDsyt6oKDwT7UdfK6wrp/fyn5CovRlLpQPLkD982bXMPZ73rgl1LPpTsdE
         ky87MTtedHRzojs5PV+UH2LY+jxJRnFzc96yjlf7oXXjsnFD8MRFEPPlNNQKoFTdPNJ+
         3I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291870; x=1779896670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=;
        b=EJ0YciPprRdMvYTFqAFLyTB0jK7DY2CiXuHHHl07nBt+ZiuY4GA7eyMI0BRcenZzI1
         1VdZ5CPvyGRa0yCoAbCMIgpmM80R8hMhyAqnA90EXaGPwn7Uem6urj0lS7IhKV8dQpYg
         XTzK0Fh7GZ85Ee9F9ZcE0IN6TUifpVPhPmmJw+ofip4QIZIsILt5bHqa00g/hP99SMe3
         apsGljQ17uzNJafW6v0sztgrDF3f956R+qaRLihVYNkptlpSQM+2iq0VSa/5G28b42oK
         BvqqIzDDMHgU2a0pdi04aNaFVCsPfdW/Hf5z6yexnFbLND4KNCSB/2g8BJgjcN2c4Oy3
         Ff6g==
X-Forwarded-Encrypted: i=1; AFNElJ+FY4l/nErkizeAY089Fk6OKHDCWOaVULDpJELpeo1XP/Iu1TWw5If/kXW/5goGh1CYtxb0j33y6XaXMJ3I@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMX4LhwCA0llffcjXAANt/JthR5MajvkUwR79PWHmrWE/kjb1
	BhWPC0YqLfPq53i7isSaDEsWN89ocZguz+PsauihFldEJt0BROACLxlyrNekwjI6jMKzrMgLSZn
	LUbns28NFjUONxOe4o9KHm/R1or7AaVIxub3EQj13mRg3jG496nFn5VzNzOMlmyeK4hHX
X-Gm-Gg: Acq92OHLHexx0mQnRK/sYsdGm6kCeWn+zz9IAAAAnjeX/8tUv16BLbMp7qQEQHmH16F
	qlicyRD5MDW8zfKBzcs1x9sZmRFDvyLMZ3lsTFhVB2wpE+LJFVtN8RKoVi7zxbobLFQFiVEtt3j
	W9rEzi2yfYDnvbskTqKMatxpwPegVdMw7nRrHkbi/M17xaMxqNKAFt0Vv+I4Yjn7/WoCvHXBrxW
	3c9PySD/YT2YldhslfjV/TWXUQ5noyIfMb1zYiLgb942d0DQW+wkkTf5tGCyJf4quXjb71wgj2W
	6YBIVkVnmypr8huUU2cokfliyiem4/a67z4cnsrPMZFg5IuQUGbV2cMGELT82pPYRJZMb5NIDWM
	YUF/DWf9dW+aOq0ul74VH1F+u8u0US/rXCa1R08BigDXaQm2WxRCug10=
X-Received: by 2002:a05:6a20:3d8f:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3b22ec9b3d7mr27913069637.27.1779291870029;
        Wed, 20 May 2026 08:44:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8f:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3b22ec9b3d7mr27913034637.27.1779291869552;
        Wed, 20 May 2026 08:44:29 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm19731416a12.4.2026.05.20.08.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:44:29 -0700 (PDT)
Message-ID: <16581410-45e9-4311-a0e5-435dc5314ae6@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:14:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
 <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KlnmwY6cBeo58k3I3mkdQtVG8hubxrmo
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dd6de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=poQuPI4Y3rRwBnmNrTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MiBTYWx0ZWRfXyXuYsEhuxHw2
 SDru1fEIalOeeB2VnRzSD6myStLvasyXrZ1aLsVKG4wPOb0m+83/Gjqu2BdFAdM3WoKGTxpztIW
 h3Ra7NHziV9iKpsMLA/oz2GHV2LJkqJOqxYjOor7TDoIb6/8GpKqSZD4Z1CzL/7iREPYvh7R8sn
 Kzq7NbjFh5bkDroZNIgKcwgoAa0byQiriAJZS2eoS15WlGLN7fS7Q8eHdPrbt7hsk14ROKd21x3
 H3EPqQGXhLKRpC92LyszgiomAPGT71NLFQfOouDDqrBPcfHtOOza+YGkL6OA7H7UyKxMn9PuiCW
 Q10wsUs+KQfQbuTjbpxfXENh0yEmYwsJdic/myWgX2dpOdO76Jksok4/U3peysPBaKSwCKVxKlp
 WpxxKuHCyr0VmVChkFGAIb8wOc9oi+2CU2j4Mjjz7xwTIIchER3VkHSKxzdrZIgC2h4/imltoor
 NFyY0kYuFq9+Vzw2RFQ==
X-Proofpoint-GUID: KlnmwY6cBeo58k3I3mkdQtVG8hubxrmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108826-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3A8C65914DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:12 PM, Neil Armstrong wrote:
> On 5/13/26 19:33, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>> streams into 10bit pixel formats, linear and compressed.
>>>
>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>> buffer calculations and HFI messages.
>>>
>>> I was unable to get 10bit decoding working with ffmpeg since P010
>>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>> video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from- 
>>> hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>> video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from- 
>>> hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>
>>> The non-10bit decoding still works as before.
>>>
>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>> and tranformed in v4l2 header format with [1]:
>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v 
>>> libx265 -crf 28 -x265-params profile=main10 
>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw 
>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>
>>> Fluster HEVC results on SM8650:
>>>
>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
>>> 131/147
>>> The failing test case:
>>> - Pixel Format mismatch
>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but 
>>> decoder returns P010
>>> - Unsupported resolution
>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>> - CRC mismatch
>>>   - RAP_A_docomo_6
>>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>>>   - VPSSPSPPS_A_MainConcept_1
>>
>>  From earlier SOC reports, 10bit tests which were failing were
>> - DBLK_A_MAIN10_VIXS_4
>> - INITQP_B_Main10_Sony_1
>> - TSUNEQBD_A_MAIN10_Technicolor_2
>> - WP_A_MAIN10_Toshiba_3
>> - WP_MAIN10_B_Toshiba_3
>> - WPP_A_ericsson_MAIN10_2
>> - WPP_B_ericsson_MAIN10_2
>> - WPP_C_ericsson_MAIN10_2
>> - WPP_E_ericsson_MAIN10_2
>> - WPP_F_ericsson_MAIN10_2
>>
>> I was in the opinion that once we enable 10bit, these tests would 
>> pass. Though i do not see these in your failing tests, but the count 
>> of 131/147 have not improved. Could you check if these tests are 
>> passing and count is better than 131 pass ?
> 
> Sorry there's a copy paste error I'll fix on v4, here's the fluster log:
> 
> 
> |Test|GStreamer-H.265-V4L2|
> |-|-|
> |TOTAL|141/147|
> |TOTAL TIME|8.600s|
> |-|-|
> ...
> |PICSIZE_A_Bossen_1|☠|
> |PICSIZE_B_Bossen_1|☠|
> ...
> |RAP_A_docomo_6|❌|
> ...
> |TSUNEQBD_A_MAIN10_Technicolor_2|☠|
> ...
> |WPP_D_ericsson_MAIN10_2|☠|
> |WPP_D_ericsson_MAIN_2|☠|
> ...
> |-|-|
> |Test|GStreamer-H.265-V4L2|
> |TOTAL|140/147|
> |TOTAL TIME|8.600s|
> 
> |-|-|
> |Profile|GStreamer-H.265-V4L2|
> |MAIN|131/135|
> |MAIN_10|9/11|
> |MAIN_STILL_PICTURE|1/1|
> 
> So the failing cases:
> - Pixel Format mismatch
>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder 
> returns P010

Why would gstreamer expect NV12 for MAIN10 usecase ? Is this something 
to do with format negotiation ?

> - Unsupported resolution
>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
> - CRC mismatch
>   - RAP_A_docomo_6
> 
>>
>> Regards,
>> Vikash
> 


