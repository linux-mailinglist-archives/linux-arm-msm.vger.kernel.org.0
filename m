Return-Path: <linux-arm-msm+bounces-108996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBhXIdPVDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:52:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 826915A2B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29EFE308FD1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D93376A16;
	Thu, 21 May 2026 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9OAwy7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cV7kghE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C06376497
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356029; cv=none; b=kVW/nl2VvnEiNX+oSfgRQdh2ZvkbaQTba2DEk0Jacx0u2x0nImDJ7xUvO1mh9dJBcLeNEG0aY7dQMceTb/YfN6g6quh6RefUHjuj8nUbJT8jQEyj0VIGQl803APwdrkG6BA3ZnVMqIc4Lgt/fVC/0yjtyfQFAicKNoXu955YmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356029; c=relaxed/simple;
	bh=1+2V258qMHxER4P7YefgNfOd8dCIvs3oMrJ71GT1kJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScCIFW0YEc4pBLBKocRYi8v8C0IUxTdg02ZwAtLFRYSE5mgnDTJr6NxCf8BdaDLJ4ks8E8Zl0cS/vpjeiQvc7lx7yqBPgeMgqjfGr3xmzv2uKS4bF+uNsVju5umMt4Og4VumTKxF92yeMcHzkq/yfe5MdnaiUIxBlkTeka16EHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9OAwy7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cV7kghE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9ALb13555979
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	857aDQ0+TPASJjxLVyYfou3FP9Vp9qsEsjL1gYosjGU=; b=K9OAwy7VJyz2w9GI
	vhP6hRiBp0Oda4BGzsuqrdldGkHbdnzSAFrnyUmE0k6W7h9QUIvlUWjXRfk8NzN5
	0pF8DoNVgXv4gCPjdV/U4qP+O42b8RiWjN2/0GNn+CkgC9kbnT/00bdk2bML5Bu0
	Oc56rXhNGSPM909qD2vcn4zVKrnnA88iMePOeSYEIwd96H5s4+ISq09GRxsQhko9
	jP03q48BWV4XMkyXvrFlhZtX4pSn6lHiSYLUIo8V9jbeYHtl2/+KX7tgJe9x+KW3
	xVvUvScw6Rv8gpU+sspgUZEbC7OgqIj/iV7QzgDyw7uvluClWZh2gtcifoS6+Dko
	GuDq1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6ktq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:33:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82c935e048so4176257a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356026; x=1779960826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=857aDQ0+TPASJjxLVyYfou3FP9Vp9qsEsjL1gYosjGU=;
        b=cV7kghE8Psld532F1CRRNUSwEIfb84+4C2I6qVtKfbE6idIToTNVk0GpKC8iqKpDyr
         mPKqdy8zAJdk51Rh4lfrtYzZLuq3dj3tPDpKfrCeEXpdramq//zWoTMJX1I3+LgjHToG
         rmMaLd1Eia6i5YaDftZCPZ5y1f8y3o6moe2rr4P4Lk1SRVkul37mYS8GB0Jm8LmLrJJA
         zM+8Z19JEK5bYBJB6OKVmfW6ZBeI6EWGoxFOmyQGiRqNmf3hlAUy0UFlu+sqj49LSy5X
         x361g8FQO/J5eh8ksuef8FzRS11hkXDKbByldPzgSnFFpjqBnxyiGIfb9GsIk8fSmmgN
         sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356026; x=1779960826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=857aDQ0+TPASJjxLVyYfou3FP9Vp9qsEsjL1gYosjGU=;
        b=G9X4CIkd4TSWrQvDTb7FtUdaegIPS3SlNbDBoll2BBDKIQ2b2SaKz3t01YnNgXD7d8
         MIy516zMnLRmsVBGrhrQZcqXs0q8/ImgNk9I74q9KUX8RV4jMkqz6dDOqEocCAd0h1t2
         5LMadgXuurIzT+Tqp4xZqEkgRhcc7Ird9yVDm94JDyfbSsEY6XLdilv8+2S07b0bIPyB
         ySWfvJoOdWt2Q5rzFpWlHL0V5RKrCBJkQOKuGRDN1/rA788KTm+ZujNB8bRu1F0fdjg6
         sTohNDfEbGkaOPl1BRRDL/ksKTuUYWHUPaIsz8+hqBiD+i+tzxPKhFbhZgx1o65ELLx3
         RSEA==
X-Forwarded-Encrypted: i=1; AFNElJ+sBlisvOe0Pu0KplzFlCXRQjKadBD95Pu17hzcvRQto5Lc6N/I3LR5Vm35syeTG1XxVShkqpndeEZ0mxLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqDiYYkmVqVwSkq5GkvJ8LbShZUU2cmgbwPipY23eWEEw7G1+
	sgiZ1NDLQxYkhqigvTcnRKohjulG5UFsPPO4DN/WgbVK/ivlud+homWhDUXZCSmXIt4FfsMvhIq
	sHtQXdkoyZCHGP2lNfRNgqDolvm1kKIvQy91pI305w+SP+rO5+4rMdw5kgfg1gU1I0ebv
X-Gm-Gg: Acq92OG5FjRlt0eUqMgibaTfbBbZoBAXRBCP1++h7RqYEHyVqH8+zoMOuYSFcRFe+MV
	v0+ocXFXegD00iChBMC6HKn4iyrj+UPb/PYZKPd5nRd8lCIvddup7k4yRYODBXwSuI+wclkyqZJ
	w4IexRVmMs9cYLXq+jKKPlZAhEUM0ryzMbumRLIS/bv4rIU8awSAIFaDYmYMBvOPFrWR0QLvDq1
	X1KLCBogajDeC+oCFmXSDRU3A96eJfP7KLj5z9SJSUMuJXs7fVNPZ0/ZM61bAnevbArK03mQynZ
	OAULLGLUYFoYXxzPnzFpVbgZl/VTVHO7MzCpSx83Od6CuWssLbPH38DyRfPJFAhMChovO9QVVYk
	NJm96OajMeafSprxw1dqNrExNdYinOhilM+PkOvOr4tZRAiBf5Aqn/4o=
X-Received: by 2002:a05:6a20:4312:b0:3aa:c93b:625e with SMTP id adf61e73a8af0-3b307fa0254mr2196156637.36.1779356026159;
        Thu, 21 May 2026 02:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:4312:b0:3aa:c93b:625e with SMTP id adf61e73a8af0-3b307fa0254mr2196120637.36.1779356025641;
        Thu, 21 May 2026 02:33:45 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1231c7sm22598315a12.31.2026.05.21.02.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:33:45 -0700 (PDT)
Message-ID: <0e2b680c-aada-4b71-a7a0-b27795bfa4b3@oss.qualcomm.com>
Date: Thu, 21 May 2026 15:03:40 +0530
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
 <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
 <16581410-45e9-4311-a0e5-435dc5314ae6@oss.qualcomm.com>
 <18096ecd-3905-4d4c-960c-bf438178b4b1@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <18096ecd-3905-4d4c-960c-bf438178b4b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ed17b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=zyK3Bw9gWzJenBCOfSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: iMpVQ0N39EUaxSwZizBFAFeDG3PKgCvc
X-Proofpoint-GUID: iMpVQ0N39EUaxSwZizBFAFeDG3PKgCvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5MyBTYWx0ZWRfX622r6xvF8+KM
 0Yw4xO4ByBoMxSvB1tt3q6bYxkdLoPH981EjbKQqZPc1E9V4KMLyt4rbY7Uf26OoVe3MaANJbK5
 BT7kGu3fCJIr+cjH7AN1IWMyEE5+65aPzVVe0DSvv9odal7yI0TDPUVXRy5R7iUK3tlXR1P/XaG
 2CTvKzOd+RzArtyyetUKaSY6RFipvGBo591BZOR5OBzWdbeq+fm+8tFmjdhLveRQOeaE2wIFptK
 uFGSZleNEr3rr1KeWCQh9XvoC1QrpVU2JD96FcwwZBi3RCeQ7W66OgQeI5gQR/EwzsYGWowRYXb
 QGukUHmdkfbj7/jmlZPSSqVS4BwwkpBEk5n5hXp8t4ongqHNGn+rgK7qzrD9HI02FIMCpmPdOdL
 +5YSuxLdGa3+iKDhqY34xPGcBjooemk7nx/52FOJP/OB6R6DQ1aaJpC93AYugjanNl9ZB9+22qf
 BDcmlJy3qGbdr1ZlA4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108996-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 826915A2B1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/21/2026 12:54 PM, Neil Armstrong wrote:
> On 5/20/26 17:44, Vikash Garodia wrote:
>>
>> On 5/18/2026 1:12 PM, Neil Armstrong wrote:
>>> On 5/13/26 19:33, Vikash Garodia wrote:
>>>>
>>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>>>> streams into 10bit pixel formats, linear and compressed.
>>>>>
>>>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>>>> buffer calculations and HFI messages.
>>>>>
>>>>> I was unable to get 10bit decoding working with ffmpeg since P010
>>>>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>>>> video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream- 
>>>>> from- hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to 
>>>>> out.P010
>>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>>>> video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream- 
>>>>> from- hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to 
>>>>> out.QC10
>>>>>
>>>>> The non-10bit decoding still works as before.
>>>>>
>>>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>>>> and tranformed in v4l2 header format with [1]:
>>>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le - 
>>>>> c:v libx265 -crf 28 -x265-params profile=main10 
>>>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw 
>>>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>>>
>>>>> Fluster HEVC results on SM8650:
>>>>>
>>>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 
>>>>> - 131/147
>>>>> The failing test case:
>>>>> - Pixel Format mismatch
>>>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but 
>>>>> decoder returns P010
>>>>> - Unsupported resolution
>>>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>>>> - CRC mismatch
>>>>>   - RAP_A_docomo_6
>>>>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as 
>>>>> well
>>>>>   - VPSSPSPPS_A_MainConcept_1
>>>>
>>>>  From earlier SOC reports, 10bit tests which were failing were
>>>> - DBLK_A_MAIN10_VIXS_4
>>>> - INITQP_B_Main10_Sony_1
>>>> - TSUNEQBD_A_MAIN10_Technicolor_2
>>>> - WP_A_MAIN10_Toshiba_3
>>>> - WP_MAIN10_B_Toshiba_3
>>>> - WPP_A_ericsson_MAIN10_2
>>>> - WPP_B_ericsson_MAIN10_2
>>>> - WPP_C_ericsson_MAIN10_2
>>>> - WPP_E_ericsson_MAIN10_2
>>>> - WPP_F_ericsson_MAIN10_2
>>>>
>>>> I was in the opinion that once we enable 10bit, these tests would 
>>>> pass. Though i do not see these in your failing tests, but the count 
>>>> of 131/147 have not improved. Could you check if these tests are 
>>>> passing and count is better than 131 pass ?
>>>
>>> Sorry there's a copy paste error I'll fix on v4, here's the fluster log:
>>>
>>>
>>> |Test|GStreamer-H.265-V4L2|
>>> |-|-|
>>> |TOTAL|141/147|
>>> |TOTAL TIME|8.600s|
>>> |-|-|
>>> ...
>>> |PICSIZE_A_Bossen_1|☠|
>>> |PICSIZE_B_Bossen_1|☠|
>>> ...
>>> |RAP_A_docomo_6|❌|
>>> ...
>>> |TSUNEQBD_A_MAIN10_Technicolor_2|☠|
>>> ...
>>> |WPP_D_ericsson_MAIN10_2|☠|
>>> |WPP_D_ericsson_MAIN_2|☠|
>>> ...
>>> |-|-|
>>> |Test|GStreamer-H.265-V4L2|
>>> |TOTAL|140/147|
>>> |TOTAL TIME|8.600s|
>>>
>>> |-|-|
>>> |Profile|GStreamer-H.265-V4L2|
>>> |MAIN|131/135|
>>> |MAIN_10|9/11|
>>> |MAIN_STILL_PICTURE|1/1|
>>>
>>> So the failing cases:
>>> - Pixel Format mismatch
>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but 
>>> decoder returns P010
>>
>> Why would gstreamer expect NV12 for MAIN10 usecase ? Is this something 
>> to do with format negotiation ?
> 
>                          # Feature: Test unequal luma and chroma bitdepth
>                          # setting. The luma bitdepth is higher than the 
> chroma
>                          # bitdepth.
>                          # Luma is 10 bit, chroma is 9 bit
> 
> This particular test uses different bit depth for luma and chroma, and 
> the fw upscales all to 10bit
> while the sw decoder seems to downscale to 8bit. And it seems other HW 
> decoder does the same as iris.
> 
> I think the HW decoder is right here, but this use case will probably 
> never occur in real life.

Have not seen such case either, where luma and chrome have different 
bitdepth. We can mark them as not supported by VPU

+ing Nico if he has any comments on this test.

Regards,
Vikash


