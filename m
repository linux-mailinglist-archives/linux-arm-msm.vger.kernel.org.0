Return-Path: <linux-arm-msm+bounces-101107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFYzHgIKzGn+NQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DEA36F6D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4937B311E648
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C9041B371;
	Tue, 31 Mar 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1JXZVqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtZcaw0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B443DA4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979061; cv=none; b=l4I5lD3+Y6tPr7DF7Hqf3UZlsk0zeBHgY8KjQoOkecXKgIkMxMJTstZAVfizPPfDjVODa/5X7uJJtvsFIIEYQSL2mVxyGppAyVJHVQI0qOJmrAaF2hYWWR857rwxvmAXkonrD6Od64T6hyGGBA+yuuWI2o3DXZhusaTBuLfsxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979061; c=relaxed/simple;
	bh=+fqFlcR40sZtN708uUz7P1xaxS5MzwDcqyUwaRkawuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfwjG2Tf8Mb0rcHpknlN+0sKo/fruJKB1CczmI72cxzAxsT1Ge0jqM48NsBy7q/YlZ6niCOU+AwlTEyRGM2imasDtNgPI93Kk3C9epsvCyrDFS8UegUKocX4Em2tZfLQnK9j0Jo8CkQMPlC3WQeU7YcAVO5lqxbNI4dzKctoH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1JXZVqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtZcaw0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdd6S3240171
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+yGuI/cnn9s0aXH93O9cB1RiK/gxeg7flRhGmZ3lRE=; b=S1JXZVqirPIsnDKO
	eNlI8hu0j1OVYc+QTtfzhIir27jFgYQehRjJjQA0ZwyZKkD8XBhtiZH707YlaNQ6
	CZwDOScICExmkufo6Rek9e5Y/XZQvbyy9+xvVQvIqXSPcmb3TUn9UvfZVRl8Ey4G
	63jWwFpzI7iTMpMB0+vEbPjl218yvzBwzJ+RbrhRPlx1cf2pDfiJ30G2DjtT+Y3i
	pafCLu5tNErS9Tlhj6LhO2O4RL195lZP959c+knhEG9QdEy7oCZ/KDQe7RI/PHCZ
	O9jI7S4xcvNxAOlukEyWFzT1I0IylPI6pgQbrwlmn+np7OjySI2B3t5lNyGatc9A
	t0RReQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yta9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:44:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso35505695ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979056; x=1775583856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+yGuI/cnn9s0aXH93O9cB1RiK/gxeg7flRhGmZ3lRE=;
        b=BtZcaw0CPB+vZACuPu92NNQRxfo9bbYYWfDH8khfP8tAR69fBRpZJC7IiN/rtGPwxK
         bJt1gqEkduJ1zLTP5VsR62+pnIt99XXgKof6lsvVhEHDuA/I09lBxSBmaqNQ016jGaCE
         /OAwKQsHYBxXulPDpdcDD6dKTMQ4rFMXBsITHT8KX+Oe+Occk0H/V+WSePh8qzrxPxVF
         L0VLGaNa0VO95nhAlKfkUIg1G/DuvinTgRComysQMftoWcfWEOoK1ZEGvEj6OJFLp5EY
         yNYMFnvXTfxlD+GoXqAalSIWfSxVhw0paCPkT82b9yFYIIOCofLIaQCdeiH3MlwlSBdH
         5DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979056; x=1775583856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+yGuI/cnn9s0aXH93O9cB1RiK/gxeg7flRhGmZ3lRE=;
        b=hsURcsc3t7PONqJcAkaMSE6wBh6FDrLA7GYV8ek8TejLJ6JXUt3ETcxWRiViQDgdT6
         DZHemVLCpsOd92uBpgouVS4PuyZ93NGLChGv3affQzkP5eHKFxt80VGSI9ytvBQuS7PJ
         cchDrpuDimqI0ep0LIicApPkFV1pGAyliXkbHYANB5dJIhf+Zaa/zff4sMqYJ9njlxGW
         yxJzNxlPlz5SVM5+ls7bxNviA4dPqoIgofBrm5BaIaiKuanuo/MpUkaFELR8/Orm63Q7
         xsZkD4GB8PncBRzz55I2FFyASvDqvsM6aTyP/nXxH9VVzBdkHcbm5qdcwKB++WHCotgF
         X5uQ==
X-Gm-Message-State: AOJu0YzKRwJV5WhM12cgKeGbZH6EB3owISvL4Cl+H6sA7KFse3+wq47q
	SbTsSRmLT8hRwcUUv3euAOM5FanAB7re6vu0ER+iPmvuf01nQ3Z/LjV1oHok3OThuIyuAR/Q3ey
	ZWGR5bNaNaGk/n39Y3IBABCwQvDtp9Rx37FxMXb6ufobOp2kKREYByFwygATtcF6bqdSr
X-Gm-Gg: ATEYQzzHYYJRv/jCg/+xCyQ1QXOOyirobpz8BHDjKwaMbBWBSll0F405vUoZYNQjcQz
	14JHYjLZoa6G+KGy86lvWcRWdOEKzqLvA+LLxm7LYwZ93i6Km21QQMNnLxgyWgHQTOG7DXgfztf
	xVt1lrAbWdT088JjxrOHBfoXby6PKTcJOxSNhUUDkEAoSuXSVQkzeZG61UV0IfJiSGKRKdiOJMl
	gzXnnkn/Q2idkPCNsuqg0LfW/pbpDTSYNtbnixNuqgdQXksaGd0nnuus8imy3GK5uH1sJwJzqIx
	pY4qcctWINDWRjYSysvLCaUO0463XSFPiZ0/y3ftkXuimthz2ufYRyHcQom9G2gr8k/VYF0BpBw
	leX5qweq3wxGsdz6I3eCfOVyexLkxa1EY1+nHKFdyQ0Wc
X-Received: by 2002:a17:903:2acc:b0:2b2:5515:661c with SMTP id d9443c01a7336-2b269c9c7f9mr922245ad.31.1774979055677;
        Tue, 31 Mar 2026 10:44:15 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2b2:5515:661c with SMTP id d9443c01a7336-2b269c9c7f9mr921875ad.31.1774979055071;
        Tue, 31 Mar 2026 10:44:15 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.233.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765be9sm159057465ad.39.2026.03.31.10.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:44:14 -0700 (PDT)
Message-ID: <43a76705-bad2-4b17-9dd8-86721b80ea76@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:14:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] drm/msm/a6xx: Update HFI definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-10-2b53c38d2101@oss.qualcomm.com>
 <3465929e-262f-407e-bc3d-7564787bce3d@oss.qualcomm.com>
 <67cca0c6-669c-4dcf-be3f-76fc46d1e59f@oss.qualcomm.com>
 <2108dfe4-bbe9-48b8-b77f-e7d2904f18b4@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2108dfe4-bbe9-48b8-b77f-e7d2904f18b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TdhFSHG1cks-UUvYDQpOjrTO9tV8thga
X-Proofpoint-ORIG-GUID: TdhFSHG1cks-UUvYDQpOjrTO9tV8thga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OSBTYWx0ZWRfX0KdJsjlCE8D9
 laQYwClJ5Tz8Ah1tYRyNvJsZW9DLiLi8nkTGz5QWdx2MAbpOA6aZTaAA69vIYDBiaGc1PHIIfYo
 3Y4ZuYbiP4rdYiOWM2jxkh5PcdxPGXWZ94Bx2fHjBtzaBcyT05JPlIk4AJCg9KpxAZXqX/2fHMj
 s/TmPQMbR7VYzPsQZBurZm5v043AKYSDV1QaZBNZHVnzq/ast6IFov0w7mboGBIzg8+wTmNktdZ
 VgPWUjX4IGrnz094p+BF5ms7CxGux34UlWzBuTKdaQvDs9tA/ZNqDF76tn7nMDtkygBtvRUdo8s
 oyQpADJSjf/m7kbBaC7GhiD2ic0NuJLPssmjqThh3W5IA2OF+cho9fbaFrSedwRxi6ybdb1o4Dm
 a1AwysBTONwEsvbnrCM1meJj/jR4jMZR91uOZ6LTd9vgi9i68AENEqXSmtaMi5iQwvmVRflClt9
 xLCarQ93y25S2kysQHA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc07f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LIJ1G+IszuYCLGPi0MaIKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FyolfZIV0nzXbpKuJ4EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310169
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3DEA36F6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/2026 1:52 PM, Konrad Dybcio wrote:
> On 3/30/26 10:27 PM, Akhil P Oommen wrote:
>> On 3/30/2026 4:45 PM, Konrad Dybcio wrote:
>>> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>>>> Update the HFI definitions to support additional GMU based power
>>>> features.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> Whether you want to proceed with bitfields or not:
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Thanks. I still feel it is bitfield layout is a 'bit' complicated.
>>
>> I did an experiment:
>>
>> #include <stdio.h>
>> #include <stdint.h>
>> #include <stddef.h>
>>
>> struct packed_u8 {
>>         uint16_t mitigation_time;
>>         uint8_t current_rating    : 6;
>>         uint8_t num_phases        : 6;
>>         uint8_t path_notification : 1;
>>         uint8_t extra_features    : 3;
>> } __packed;
>>
>>
>> void main() {
>>
>>         struct packed_u8 data = {
>>                  .mitigation_time  = 0xffff,
>>                  .current_rating   = 0x3f,  /* all 6 bits set */
>>                  .num_phases       = 0x3f,
>>                  .path_notification = 1,
>>                  .extra_features   = 0x7,
>>          };
>>
>>         printf("Akhil 0x%x\n", *((uint32_t *) &data));
>> }
>>
>> The output I got in Kaanapali is: Akhil 0x7f3fffff
>>
>> This means that the compiler inserted a padding between current_rating
>> and num_phases.
> 
> That's because __packed doesn't work outside the kernel - you're just
> creating a variable named __packed, so this is effectively the same as:
> 
> struct foo {
>         int a;
>         int b;
>         unsigned char c : 2;
> } __hotdog;
> 
> int main () {
>         printf("Akhil 0x%x\n", *((uint32_t *) &__hotdog));
> }
> 
> Outside the kernel tree, you need to use the full annoying __attribute__((foo))
> syntax:
> 
> include/linux/compiler_attributes.h:#define __packed                        __attribute__((__packed__))
> 
> with that changed, we get:
> 
> Akhil 0xffffffff
> 
> which is the expected behavior

Yeah, I can confirm this. The AAPCS doc which describes this is a bit
difficult to decipher for the case where a bitfield straddles between 2
storage units. Anyway the experiment confirms that your assumption is
correct.

Will address this separately when I post the CLX patches.

-Akhil.

> 
> Konrad


