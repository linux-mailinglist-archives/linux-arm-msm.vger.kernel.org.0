Return-Path: <linux-arm-msm+bounces-109647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEvBBvo8FGq6LAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:13:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA15CA53A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9599D300B994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157FE2C028F;
	Mon, 25 May 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6wmD8ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzsH8Emo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83C2AE78
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711224; cv=none; b=PhzhPS+Yu/Xee1l+vRhRrqOifxoQH9CcY7UoX2z+dyHm0JOiGpHgI4LJsixrsrq9k/g9MkKyYpOph26Rs83BO5akeSIFdetD8mJcnaJKxhjZub6KMB+NBEnkeDpJp/UAdrjcW4o/cotx80azUfSmqXNXwdL8tEZK89eyliHXyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711224; c=relaxed/simple;
	bh=c51TU7Z8GhDln62NcDoXY2s5d3VG3h7K9HcK5CeBBQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YblTLPBm/KFURx1UeLDzi391f1+yWd/E7pW38qqrjuZlNNgORObNafimpDIwFVL1PMh+llwqdMLsj9xHt8L2RippPcBeHhDoW7v5MLwD0XW18iSOo19eJYF9zYPNQDmLWfgXJTELJ1QxAGnFyS6OjUsKbxNj14Lc3Rd04Is3fgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6wmD8ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzsH8Emo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EKgj079203
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGnlQ2jKtc9D3PI7eVoLHHW6xQCIYR/zEjXHMT+2Fvk=; b=i6wmD8ll0FDQBKuL
	YMZX0hnZSTu1zAG6ARTSmTYSR6/4EcpW2tY5pnqWxqdJNcWxhPeyxpyrxmVCGlaz
	8S2M3nvnyql4ijWnLuJjU+T4FElTwQ23Z62i8Ar3DXY9Ze9HdgV3uAv7vE3D9Rc+
	D7PDlENjf3avi8oCHJmH3c6TcEQ3I7sz9IQCtH51ydkj785B4EPVmuXB27kad5sh
	eH4TQqBwEfL+1z/rVdCUx6TM4/4kO/5Yrhi5C7r5L1x3Zgnmcfk7yQPQ3VntAN7O
	JhQRzoQ17WBKCqPTYSJUeXzFYw7VydfJtGzPELiQaqM/vEX2TEBh1Tx3hRHaHyLs
	MCrL+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8jne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:13:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso223338095ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779711221; x=1780316021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGnlQ2jKtc9D3PI7eVoLHHW6xQCIYR/zEjXHMT+2Fvk=;
        b=fzsH8EmoNacndkwS2VsPVRwopN8y7+kafS4HJZTisqNHdCsRvj+kfoI8JLmHnIg8ef
         uvtFPgu7Xzg8quRIcIs6hfh7kXfwPm0Gup8ZzG9s4fx7wG7U+JlraPcnbJeALCWxXQFP
         WmD58wAghPqqnwL6BjArxVo8MhAEBFLlMcxpLQyJdkurBCrkkPkYnEvP2CaefNiStpo1
         jFSE+5OZJ/XJjsEtuEYwjngwDbZsbiiUw5TzXPfEwjIMUAWoTJT3YmfGTZy0byVZ8Opf
         BRrTkGMkHzrlvVH1QgX6DRTIALsVTqEeWlwPe2dznndf/+rDchUCbzNs6uIi49YSjrYD
         zv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711221; x=1780316021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGnlQ2jKtc9D3PI7eVoLHHW6xQCIYR/zEjXHMT+2Fvk=;
        b=tVorfYkuLrtU8l6fiRdJL24SdIxaXCrrG1rwDbLtGpMW2AUp+gbcgmPSBCjrRWX+EF
         LmztudbiGYQq31wLo/LeS3/JZdumBj9zaanQMlD7oJ2v8rzxnI8irHu4ZYm2RjrXnbaR
         gJ2hOPYtEQ8Sy7NYLt/sUaeVvvpmquo1BVOeH04xVvhcvOwwYdxI0vXpBNgmZgG177J6
         UPtcQlLCpiBowMtI6Z22bwJb9ounPcU7PwzGTjbjl75dJIh110e7OEZcFiwqDkv2nkTg
         bnm8OpWpaJT5Q30wDBWU97P4dbRBc/l97VSMEt6pAnlgm4kUNZCGF/WJnkfxru0qc8p/
         mwCw==
X-Forwarded-Encrypted: i=1; AFNElJ/0YNnnDAs7OIvtDHRwNKe06gcn4VH4B2c55FQqZbGsAFMqtViSjixAK1SIlKgk4vig0epDWIsdJKUnh64E@vger.kernel.org
X-Gm-Message-State: AOJu0YzFF6vF3aItIm205shmF71RfuglQ0kVuHAyPiKbyV7MTj+zPgxi
	jj5Ih768xHDSvUdfd1HF6LqOEl3sbpIP9Hry+zYvmfWCY12Kb1jCOGWBsRt32VbG+iNHeB8OULX
	dq4OuFaNxvSbzlCYOB4FK6W/l9Uyf0Rz4E4vXUt9tbGVa2QRab6aJrY7ez1rkvN6B9U+kpw+SNx
	fM
X-Gm-Gg: Acq92OFe8XzuKilUzer+sWlbh28CcQZimhonEbvz3QSTtqn+rwQuTLXLlNeLYzGrl12
	TgAHWdtnj29PxqaBGTJFCMH9pjEAgdV7XFOVZktM2d2ejpU6WrZiH4OAGk3cUEYJc+Npz/ZbRB7
	L0zERsvSg76zSNYEMA1CR4dRvNX0AyIYNGtlyPztrCLlZrTR9oURmbtKdkwskrAmAiSAYJw+EiZ
	dLCOfIgcp3oUtJEbzqpuO8/xzOBphUP3s6Zd8xLyYqekGAR/vFSpfqNvWe/macZfCEsJLr/BM4c
	0OFyo4EXq5y53IT6+Fvvhs8Lhd1Qlr30a3QEYBd7qx7oe2Y/b737b2HtvAojz1WYlWdeFr5hg3H
	BGOi1K7zgSRraPgeEOd9BARDLP6LJFx7ue/2aGWGfDUgvGOMdj6rOEgyP4kWCV6JrULFxPq4bJ0
	f32gf3WMmWQGCIvYnM5k6LINXTafZ0
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr169286125ad.21.1779711221320;
        Mon, 25 May 2026 05:13:41 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr169285725ad.21.1779711220826;
        Mon, 25 May 2026 05:13:40 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beca535bc1sm48134085ad.56.2026.05.25.05.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:13:40 -0700 (PDT)
Message-ID: <db242035-8b03-48ad-b770-7c0d05480d6b@oss.qualcomm.com>
Date: Mon, 25 May 2026 20:13:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
 <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
 <753dde5f-9032-40ed-832b-0ecba7228d1a@oss.qualcomm.com>
 <zeuil2bs2qlqajen7edk5e5dveeyje3q7srxgfkkwrq6ylmzaf@smko5lyfrtnf>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <zeuil2bs2qlqajen7edk5e5dveeyje3q7srxgfkkwrq6ylmzaf@smko5lyfrtnf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a143cf5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6FVArigR0TE__iZ8T84A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Nu141BH-V4qtVNXoe4cCVYP4iC8mzKFR
X-Proofpoint-GUID: Nu141BH-V4qtVNXoe4cCVYP4iC8mzKFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyNiBTYWx0ZWRfX+Av/XSPd229Q
 GpRs43lp3uRrlk8NCe7q9pDrcOgRSF+j29LKekLEtqzQUY6eLxWZC+9O707djV9Rx1zTxRHFsiv
 K7ZWOtmMqGUlBYU7uZ9aevHTrlL4mZEeN6RWEN774hUm29pQ12TcbTkm+dYQnXk6hRPZZ/y7+Mx
 N0gbqAD3tNCKij2+FJSqCCNr8JyX+VrFKLf0Y/BjQQYBnFMPLniT0MeYf/F3gMIgO+Hg5+n41x8
 NvAG8t0roSOn2+3EHzJznEgrgV5Cty0q5TbtbcdCyqN9g2BCxyUzZrGqNOYRanrTIlhalnMxkR8
 hdIEawWswMOrtUlhFhl1rTeDo/RIFu4arqHZGXduqd3pO81W0X9MZRIgtPi9ldBP7QaxJwwCLFW
 YGQdP8npJT7Od4hKRlBSik3wZaWSxafV/4/Yt58fkQZbg6pKCH3K97W6WRpvrJf9tpkBNIrRY9k
 Vp23P3C6XkYhXaP8i8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109647-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89AA15CA53A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:21 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 04:06:08PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 2:12 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:51PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
>>>> be used for MST in the dp_catalog.
>>>
>>> Please start by describing the problem.
>>>
>> Got it, thanks.
>>>> Stream 1 share the same link clk with
>>>> stream 0 with different reg offset. Also add additional register defines
>>>> for stream 1.
>>>>
>>>> Streams 2 and 3 are not covered here, as they use separate link clocks and
>>>> require separate handling.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
>>>>    3 files changed, 81 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> index 3689642b7fc0..295c1161e6b7 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> @@ -332,6 +332,17 @@
>>>>    #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>>>>    #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>>>> +/* DP MST registers */
>>>
>>> Which register spaces are they from?
>>>
>> Here also from DPTX_*, what about this? /* DP_TX MST registers */
> 
> Why? don't separate them from the registers from the same space. Also,
> please, name them uniformly. Why some of those are REG_DP1 and others
> are MMSS_DP1?
> 
Hmm. So should I just delete this comments and sort them in ascending 
address order? Regarding REG_DP1_ and MMSS_DP1_, this is a historical 
naming convention inherited from the existing code.
>>>> +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
>>>> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
>>>> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
>>>> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>>>> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
>>>> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
>>>> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
>>>> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
>>>> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
>>>> +
>>>>    #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>>>>    #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
>>>>
> 


