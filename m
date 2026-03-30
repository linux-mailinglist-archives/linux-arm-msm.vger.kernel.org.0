Return-Path: <linux-arm-msm+bounces-100901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI5IAObcymkQAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:28:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D831360F5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4973E304874D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95C739EF23;
	Mon, 30 Mar 2026 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXvOf1TI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q33THhyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F022396B76
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902457; cv=none; b=bXRFxhKBbobujRclWKmzbf9QXYapdPm7ekTBRET53JWSutIhkj47UfD1NiQDd2PxU57UxYd/K3WZNQCmIZpz0RAZz/YKUSIppm6++420dzhImNW8VDdrdLJuunnrvOFLe4A4dL0uG32Phhnn0IR1F8xdzGFY9q8VbFCfvexuB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902457; c=relaxed/simple;
	bh=XVd4Tu5zgwr/8hebhHmeN+IF8tn0T9cQG8Ak92ZG+g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUm6h3tswZDsOcCRR/XphA3OEvxpFKkskGAtr7U/jmF3wW0pp93JDapcB167yEiK6TIvxLENcbiCZR8AZE5/mQj9g25D33NFC2rubkc3T71bynk9MFaSv3B/lsazV/AGB8N8Vm5YIxOm63cV7wO0cAfo0f4RS3oYUeNgLOivZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXvOf1TI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q33THhyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKPXRQ2458297
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzrJyb1gVN/4tm0vA1K96mY4OKgfW/vr9tGl8NUqDQI=; b=eXvOf1TI6dbzFYA7
	YvK2ZIq5YV0inm+hOZ0OjAyLbPu6mPpzwqro5GloE+xCQGJtfWn8pB3B1NXHFLbA
	OQJVVF8zIKl1k3/MAmHSulaBXMeMyPVMW4mp0psAEPkHjpHLl398mK+xxzFBdi18
	8113PMT2N7PtZXjPDVVksytgroqYpl1Xh/2Gt/CCxaIymz/y73ymn5lC3WZXT7eO
	n3pS+6F6wF5r+Uiiefzmo4t9mvTQNYqhtxCMcHSfz6KugKzwxN+KVZetb+IO7rns
	ZqZKnVz11vNkGnFU7DQ8ZQVcbaYjVp+5/zIKjDSMuLWf1JTaawQXi2Bht4CBn0tt
	E4HbdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmtwsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:27:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso91771155ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774902455; x=1775507255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzrJyb1gVN/4tm0vA1K96mY4OKgfW/vr9tGl8NUqDQI=;
        b=Q33THhyGlfTpTIazHfmbzfecMgSlLFWdeE/D0JKspaMpvcmTaeXIccI2iI4YOi7Ijh
         P2BdB5tP1yrh1lfLIWySiyoZswNuoEJRqMQSERkDGbFkoHZY+oshGOfGrKmrQpWseVD8
         g69Uon9YhVHbpeeUecpTJ557HiSPg4+ssHUitOylwMmU8MrjjkF4CNvcq0vKlehrJh/c
         46S+dVfYfc6MGZN2wH0a8XEvUs2yX8Nhz5Px5nK3KclOtW8Xo0P7bMNWKVCiBa5kDCor
         Zli5dwrmELbnA05JJBPWpVW14Mrj7BNPe9nfRDN2JOqKROX87XUREE6KnmBP0slm3aLk
         T/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902455; x=1775507255;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzrJyb1gVN/4tm0vA1K96mY4OKgfW/vr9tGl8NUqDQI=;
        b=tMIy7SDSGTpaUVhEKW4ZfgpymwWxKnXkdjUqSgm0uUj8nhIwwR7YHMNsL4OxEBqdaM
         aOrczZfFfbwndPb+woDUJC3zUQ0No9BPrKDMWhgZ+8lY0LIMvHiR3b433d3LyMCMb+jR
         ny6EvO1PcUj0vBnjcIQoilGy9sWjVJzYbY+tAL4ULmF9EK7KvL/1zRDA+QdP7tFZDRhV
         93l+bHIsUwUqy0aCGCEBjlSpuKsnXf3/Tg07dXZARHIGj18L2FRVU1Yhp9+dA2XwXPrB
         5kE+gfpummLeY3gmipj+s6an9nPpf6CBaskBUy97iXRcZcJ1awT0Rxs8QMsY4ES+2wM0
         3pGw==
X-Gm-Message-State: AOJu0YzmnMiVDBRvQTHQjh/1UtquNypTJReb9RkT96BUbGevF+rEkL5Q
	jzabfjYHNfi0oq0SB1NRr3gT0hD203GnF4P33b4h/A9dcmEcyCyW0hkR7pSyA4sCeE6CbFMxu9H
	d38Q7dDNFJ8xGyL/amfDp0cv34JHKivgq0hm2Vq1eaBqO6iaCoETYnc267+AMqPx2vd7y
X-Gm-Gg: ATEYQzzNoBWRf6W9zoGK51gIRz9CzQkQWe5djN5SLKX6v6AGzMtZ+UInCeIb9WeVtlc
	HZty5HFJwH9rjOFe3pcsLf+NqTWfimovQmICEwJ22qGIkqwLGnnW3RLxE74S/EBCiy+EBoZSOfo
	cE6lXo3amBrlTewc2Zd45mtOYkUoAFj3qfLO+A2pTvVKjINclGmlnWrIQU8k48bKW1Cp9dSSaCQ
	NwotHKqtu24zS234/KSBMzOzCMcQd0/sYJp588TT6lXZlQDcJIqVsws5vdXQ+lR+xZsYl8d+o4A
	I4sq8pCyIBhofnRIxEGaXOBA2sNMgQEQ0seKc65Dr7EZ98gtttw4KY0ueqvjLFaOpUSiLXbUkTB
	tYPocCbt56Vbo2znw/JmZDHGmzMX5SNwIfigy8nffhDpQ
X-Received: by 2002:a17:902:ef0c:b0:2b2:5637:149f with SMTP id d9443c01a7336-2b2563717b6mr43048735ad.23.1774902454924;
        Mon, 30 Mar 2026 13:27:34 -0700 (PDT)
X-Received: by 2002:a17:902:ef0c:b0:2b2:5637:149f with SMTP id d9443c01a7336-2b2563717b6mr43048495ad.23.1774902454453;
        Mon, 30 Mar 2026 13:27:34 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24266e487sm88192835ad.24.2026.03.30.13.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:27:34 -0700 (PDT)
Message-ID: <67cca0c6-669c-4dcf-be3f-76fc46d1e59f@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 01:57:26 +0530
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3465929e-262f-407e-bc3d-7564787bce3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3MiBTYWx0ZWRfX4WBbYEU9yABz
 qbdyBaJihnIi0EoY6PgzXhB4JSew7ZiPGuxYnnPRhguBgUz7ye9JEmq5wb6N6Nc/BHIykJyfjYh
 6p1t//gWGg087x1ZF/o926Lv13bfkr/IolBWwthw5ApnahWkLqTpyzTin0aiC0Lg5yaEkT0thYL
 n8TKs71ToP6ftWbHTREdNMds642dg/nUm8Qdy8Ce71aE3R4W9GGJZitXWTwu0nWAaiN5kssGxVC
 DeCjghSD9Ep5REvXcD1p5WMqDWjPZ2iFD1V1r7ydEFDUsa8/pT2z9XBp5W/gKKxRaG/SuhGuowL
 hdLy6s00qGru45EdBUr//BpIzw2FdhgdkdKnlPzprPS+5sXOE/Lxng6MaZbswRfvsSDGeMlMmwv
 D2BVGJcGb5N7/0b4lSfwXJMvyfC4pAVXx1MZUCWBXrSPB7krappwm61rGmuq47j/Lja7UgAXgNM
 U4pbSZxyFHTfvfiP6Fg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cadcb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IYtLGEtn8_M1e06QnFgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fRSMvNQV1MvLlVIRgYJIkEbuHYis2u_m
X-Proofpoint-ORIG-GUID: fRSMvNQV1MvLlVIRgYJIkEbuHYis2u_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300172
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
	TAGGED_FROM(0.00)[bounces-100901-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D831360F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/2026 4:45 PM, Konrad Dybcio wrote:
> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>> Update the HFI definitions to support additional GMU based power
>> features.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Whether you want to proceed with bitfields or not:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks. I still feel it is bitfield layout is a 'bit' complicated.

I did an experiment:

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

struct packed_u8 {
        uint16_t mitigation_time;
        uint8_t current_rating    : 6;
        uint8_t num_phases        : 6;
        uint8_t path_notification : 1;
        uint8_t extra_features    : 3;
} __packed;


void main() {

        struct packed_u8 data = {
                 .mitigation_time  = 0xffff,
                 .current_rating   = 0x3f,  /* all 6 bits set */
                 .num_phases       = 0x3f,
                 .path_notification = 1,
                 .extra_features   = 0x7,
         };

        printf("Akhil 0x%x\n", *((uint32_t *) &data));
}

The output I got in Kaanapali is: Akhil 0x7f3fffff

This means that the compiler inserted a padding between current_rating
and num_phases.

-Akhil.

> 
> Konrad


