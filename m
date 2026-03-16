Return-Path: <linux-arm-msm+bounces-97842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGoHLu6gt2n9TgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A32950AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A4CE302AD00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CE734B410;
	Mon, 16 Mar 2026 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGg6nKO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoXAw9pR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689B221F0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641909; cv=none; b=skarENtHtcedx0jMcLXcB0PZq5mo6E54x028AXYDmB2yZ5sUoUJskGzA2FCzisW2hu7RbttQZfl99bGcS4MT14Ge/PD2XkiHhhficUJFGjhXfGAwDB6Cq6CwUAtyk8T9ePOtQiBeKc935D4r5prf0MyrZ8KNYPEkmrdbZ2NsgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641909; c=relaxed/simple;
	bh=k43xSNAFkBMBfYdpj/XGRwfgNTDen/YEW8r1Vexcvig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPUhKkV7SdJiVD7z9Pw0gxo65TdywMFumHTyyNhTRX10EEfkqu8G/v315tUE/xJrMoo/jQ0l2aiVUUpxSau9FRcn37ga2n47eeTPOIT6UdGsx36av/Br6tKgS6hqI5HhiOVCQ2Mu3ISGWpgGgKjkL+wLGX+lmnnYD7Iv9yBZxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGg6nKO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoXAw9pR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64f2j538850
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=; b=mGg6nKO7qEBHUtH/
	yV564iqD85xcdzp6c2n3Ru4SVlLHpczhbjzutW+KxR3R2/n5A/ErLaKPkeiX9Lan
	w4iKGkdcNMC9GL0J7JcsMLm/6A/Ivwn8JCYoElHljycrvSeKNCH0xC3cJUoqWB2Z
	QGW+9807xldlRAbRuWl72YUIMH31DWioyvdEQeTrryfja2JYcunL3kxeABbWKIrf
	YAtzqlr6sGIM0byxuTxlYY+fm9em4DQ5QyUlBvDdyRSg9/axga/0WrbOoaWuoJOJ
	ctEfok6c4weF2iPx1ATTBnmBq4mTic0nNOazADIy8pPhQFwBytBt/47nPKuD9LVI
	SeEQaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mbb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:18:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso37698174a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773641906; x=1774246706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=;
        b=AoXAw9pRX4yKL1OSfp0COTf3wl4TvMDv7jpAF96QJtmj9045jkxVmCn95eFHSfarRr
         fNNYLCP2nqF/JypPNl/Kv9n99G1pfZN0Pkx12WyCzwvJ70WoWLDgqidWwEPdHb1xHGTr
         vT3kdJDlvIpYRKJxvhUL3olr/UPwMiomUSTTLgEhWdZOGK8I3xCq3w5PH4GlgcBDTZK0
         76J4/pUXy1x+ZZ93J4hFOh4VjuXvm+Ih7OKQ/oUmrNCUR3x5ERp1RpPUFh9O+FuTmGt8
         YdgaaO7AVuyfRr0W2J2v5PrIM8438rkJU6ydUzoCF7YgxFfhikMdSpWn58Gv2t5wjO6K
         8Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641906; x=1774246706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwa7MczQdt7D2OJpyag2l+frngAA5BKmFqOiBEGme6g=;
        b=cqvBbJME9plEnIeKJTMy4hYpE+F+UpC+vjRwBMX1hTub8kwsXTJHtJIFCHUbpzaKbp
         0eqXaxQaQk9/EhBaVUUi0vh4V3YK0SyEG9gZEd9E+7BfgSZBlKNzvuqqKY3eD5bSh6qF
         SP6ceAysbn9yae4QK9eug7BXU/dgk4o6r2+Dd6X6cgC5QFmygCLKD2lhXK3v1Ib70o3G
         zApJmvH2XUeDD+7dQMGbt84jXRptjt2rtmU/stdlj0WOQMGuyTSxc6vTeBwDDJNQklxI
         jv+om81bI5h3IvXmVjHfX572VPhW1WsTm80h9EOiG8rp8gU5a/4VUZcCdBx3eOcCDIen
         ipxg==
X-Forwarded-Encrypted: i=1; AJvYcCVqVU740LdDUYZx8ASnEJjn+rcNE6jmxiNY+hLnMU7f+Ngic1XSDjmKYYiFTyKqYQJcPDElLiOXCN92KR/7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9fpD610i8PiIoerrqprx3nsM+9W+a1Ec4RQB8abhTzFzEvieW
	h+V4SFHcUbdQ8ICe5OjEFIa8l0Af/hQPbsUfs89fBO2Ar57Wb/OgdJrdgBd2pYAF7VH94G3tQEJ
	eoi2w/1CpOH23iKrRRv73WZIY5/3/RKb3dvko5KF2g/tUTt8J8ZfVpJeObGte8c1hFJ2q
X-Gm-Gg: ATEYQzymXooFEp32G0TDIaHQyyvQQqkviZ5Mu7aYfuC0uuYlLzGQylfFr4wnK/aE3dB
	TeVM7V5aHCltBmr5h2/b7g5FyZI9ycIVIxDDgwxh0aaIYmfrmgg1/N1qooqwiBahKJ2xWG2I8A2
	akC3EvTc7C1wl0kq7hTE6LToPEGvf+8fpV49s3yFY2xY6rZDTF1EqZ5pzgHlMLx1QUTotN3gO0v
	6bu1pxc8xo5fxyLrBjgoDdVxJkdLBFyiX7shrptfx4+XOCPVqYGDED0KDsVQE/urUNbFmO1II/i
	blvAUojqW4hke3RUmJhQ6NYL3WRWIiO9sd9jyYn5+VeQPmcC4dfc4cUUkX2ubYEGL8UGy8mRGqJ
	sRyE7UWQH75p67Tf5KnLRlcQxm5A8ppdA5XNXVFSklTFRVNFX
X-Received: by 2002:a17:902:d4c2:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b05a4c7d2cmr17194395ad.18.1773641905816;
        Sun, 15 Mar 2026 23:18:25 -0700 (PDT)
X-Received: by 2002:a17:902:d4c2:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b05a4c7d2cmr17194065ad.18.1773641905279;
        Sun, 15 Mar 2026 23:18:25 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05b4e6094sm12029265ad.77.2026.03.15.23.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:18:24 -0700 (PDT)
Message-ID: <a0b6a477-1229-46c1-8ae8-e970e1127c76@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:48:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
 <8ef7dc7d132143e144dc523ed72c25139fa36a28.camel@ndufresne.ca>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <8ef7dc7d132143e144dc523ed72c25139fa36a28.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: csL6l5HlUFwbOOquO59WWLFVb-u4EC0P
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7a0b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=W9TLWy2O60xLta0W1X8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: csL6l5HlUFwbOOquO59WWLFVb-u4EC0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NiBTYWx0ZWRfX6pRXWsJhTklG
 JCZSvDae9BfYtPRJXgCDe6C7YtKoyUGoeoHDNYtbQI2Ftp/RFCQF5JsBtFXcujLqeqpQ0OpHc8j
 fiYEOhfXuXY13LZvNMiIe41p5LD02z0OwMV96FibBaq7+8sgC+NDyRdDz7PeuvyK8sz1sOuqViy
 KeQZBgA4NOEfjMTdpCzoaH3J9ZOKiOSasszm5rOmamzywe25elYNga0JnMdpx4lqAzBpzBTHDPT
 UQFqoeP7r8voUtEy+hgiG4PwzSWxlVV/MNuyESBoX1MmGbr4hBzQjNXsWszHFj2Qezi9oUBeWj1
 DRQ5/l/JfS4vJRQdidqa0J+1ClJLB7k6Q+DO0hHaHI2yVVKO79+lAxnfegxB1yS6sqBIK3m4AHH
 g5AzDfEbQweuKeVtc7V4fjQTkmgx4aUyslcNnNTpw5hU790yzXk57+fjDiGeXi/keCaze8KmpVk
 5vVWA7dPESr28+bB9wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97842-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 451A32950AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/14/2026 12:59 AM, Nicolas Dufresne wrote:
> Le vendredi 13 février 2026 à 11:34 +0530, Sachin Kumar Garg a écrit :
>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control for Encoder.
>> Encoder will choose appropriate quantization parameter and do the
>> smart bit allocation to set the frame maximum bitrate level as per
>> the Bitrate value configured.
>>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 1 +
>>   include/uapi/linux/v4l2-controls.h                        | 1 +
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index c8890cb5e00a..6b2dfabfc4fd 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -577,6 +577,13 @@ enum v4l2_mpeg_video_bitrate_mode -
>>         - Constant bitrate
>>       * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
>>         - Constant quality
>> +    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_MBR``
>> +      MBR Rate Control is a VBR Rate Control mode optimized for
>> +      surveillance video contents which has high temporal correlation
>> +      due to static camera positions. This Rate Control smartly identifies
>> +      key-frames in the scene, and allocates more bits to them to improve
>> +      the coding efficiency by taking advantage of high temporal
>> +      correlation in surveillance videos.
> 
> This is a bit vague, and it sounds like how you'd describe a proprietary thing.
> Are you sure this is a generic mode that other vendors will support ? If not,
> perhaps it should be visible in the API ?
> 
> Nicolas

Hi Nicolas, sorry for the late reply — we were aligning internally on 
the exact behavior and naming. This is Qualcomm defined Rate control. 
This is mainly useful for very low bitrate / high temporal-correlation 
content (e.g., static camera).
If the consensus is that this is not generic enough across vendors, we 
can instead expose it as a driver-specific control rather than a new 
global V4L2 bitrate mode.

Thanks,
Sachin

> 
>>   
>>   
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-
>> core/v4l2-ctrls-defs.c
>> index 551426c4cd01..b336171539a7 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -154,6 +154,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		"Variable Bitrate",
>>   		"Constant Bitrate",
>>   		"Constant Quality",
>> +		"Maximum Bitrate",
>>   		NULL
>>   	};
>>   	static const char * const mpeg_stream_type[] = {
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
>> controls.h
>> index 68dd0c4e47b2..614fc2c4c81d 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -412,6 +412,7 @@ enum v4l2_mpeg_video_bitrate_mode {
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
>>   	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
>> +	V4L2_MPEG_VIDEO_BITRATE_MODE_MBR = 3,
>>   };
>>   #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_CODEC_BASE+207)
>>   #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_CODEC_BASE+208)


