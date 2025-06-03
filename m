Return-Path: <linux-arm-msm+bounces-60157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FBBACC970
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FD43A2D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14E117A2EA;
	Tue,  3 Jun 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcPhxPnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B61822FE0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961850; cv=none; b=MOLm2m6GUqY436AtAhZqnauK8LcEiJTg/W/E/1mEJKo/ztUInnVlBE46pMEi2fCnF7Qi/YEHSzkpV+HpbXEgDVRymAi8HY/mKSYMmcLzxYb1TrmbLv5W/d3J9KEN2SN7mm6OipKMmzreQ7gHCjZLrEo+jT8nRmRu21am/PURCgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961850; c=relaxed/simple;
	bh=5NoqliisFeDMpuzsVJEBd1vtht7cDyRDoLM/aMlNbQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAYKv5ivM4IP6eq9EsT7BXs+F5pr8F1bxHLcWurt9IVGo8IquxIdYP7Ve2zVY8uOW4p1qQVm7ll9P8LDpl8dhc+L4g/L25ym0LVFApw83iub4FQ9Sr2hK6g3msCOru7PmZ1nlIUF+yFscYWMcRZ8xeVgtiTvejkcRQ864I+4SaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcPhxPnl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JIPB013514
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=; b=CcPhxPnlpzXchT0W
	rYpRiNGmoUXzztdK05haJ65s3m72XJKjoLc+gYE2LGHbQC8QvNb2ESa6erWDTmfg
	RKFWBOyFhX/vsFZ6blP8WaDxYopvSA7kOm7nThIMU6MY1BKvtT9FVbXhrxd20yDs
	PjlWNm6eEH/LM3epvdBwLNNqLI51Gf4srrP39cZwR7KzQFVCe7AD80FPIfqf7+kg
	o12HJNPY0bXX9WtQBY2p4j+DUOl8i226inNMllUH4FlxeYHxTpSpeKDDNdpBfSe2
	Ru0V18h2Tg3Kocd0gZJxFEhPuscRr0pvlg6ZFgfpLQR8DN/PuruOXsy7jjq5K0RD
	Xrb2Lw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8njwmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 14:44:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73bfc657aefso4109221b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961830; x=1749566630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=;
        b=H7YOAeXPRuS5MrZ0CGmnSU4tyMrHQYoBAUevpAKQU0FW+lgPWV7/psfgbh7CxdjDXu
         hvQWv78Z3F7qy8VE4fPIZ09ZUdWzidPVmClHbnF2aB0oekhRUO3jSXnuSDGlNIqThEnm
         JgEVklh75RmYBqkO/hmAZX0YyFa/OQC2TONj95SbdbMVeGlpVSIqAPZ6IvNdPE/cRc3h
         NtNOWZDzrctuPiKMaAWtT0JFlDQLEGKRmU8HA1sfuGFKXcCfj2MrLupoR+xnTO/c2hup
         JprqWrifEW7J+vu/UYvTBMxnERVCxDZrPHd57TUKZyFZvj8BkFfOkmO/sNpe5QeTF/PM
         BHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqVsJ4ZoNNPVGFt43shfP83R1IT6sMuimoxFMXFLJW7ahIzeWlQm/j94BbfdSgVoQJb0t45G/flpWTuVAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6rajx5SKaToox6urHj35ZKWW3UieIh0IiytCg/0JWvbDwdkiR
	uz2IGxUaV+WC54r86X7TIfmm9ozcYwW81NlPvA/6IiRV4p4PQcUGina9o6WvhvrcCWrDMMM/Gze
	aFj/XoBPBSx2ghlYpzxZM//lRoXfgDuw1ooLih+Euly5v8csVRssBGH6eQOmT70LC43LbKvYxce
	Ol
X-Gm-Gg: ASbGncuUf+OuouZD44VWOOoa1uvFuf/7hhzRgVBy8yVbcqbxwfmncypfvXQC/OQOneF
	8QPYS9I8Lk7CoFFz8qKGnzm98nCJi7ukI/espJvFpP8Wkj9wKpdLBhLe7ZGSHSpTNwljAwoqlH6
	V9AQ4CoupstGHuSGWoWfoD4XnUcbTg4pkwdU3Vot6hZRzmOL6c9ghAzIRSr29qoqBWZGdZQociS
	aUGcJr6CF4wLtSPAmydfy7rZpi8w7T7S9mxM9TMJeiohpdccOzXTyD89t8+ueouH/2rXgm7aMs4
	urEGxjUE2moF7ps4y6R+b2sIJCunHeld6sQ6B3f1KecWwwEcy8EkKxqbE0FNFg==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-747d1831e8amr14616271b3a.6.1748961830338;
        Tue, 03 Jun 2025 07:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmmTTOunEhNpY+I/AcenfSNyAkGLYDYgRj9GMjeyspcUOa3FEYxalBx5CvxbM2n1P45xvWg==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-747d1831e8amr14616237b3a.6.1748961829866;
        Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41c3sm9788976b3a.149.2025.06.03.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Message-ID: <40c64ab3-ac6d-4844-bc40-95c895df534c@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 08:43:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        intel-xe@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
 <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
 <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wbSDKOuPg3Fu4CKykibAQ8iNQP0kvcnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyOCBTYWx0ZWRfX87/aXnMBWOqm
 gjOpP2/ouulf2va+opkw57KGnYJ6Z0ze/YOgnjoW9WlFG+W1EXN73aBwIusAsYR+BEo1TIPw5AZ
 YCkPbURnytrvbHClPlOc18hLs345Tqz9B7wM2J4sCgRZFq6afRtQx5jLqyw3cflekLbmZHR3DwZ
 BFPlvAMPNx8iN9LgPSTbVbo256SHDyW1KbQWz+yPrIMxmbSM5F4i39Uy/qTP0ThIm5zK+V43uQu
 ChfnofJU4OhRffej5v0n1HH+bKffyuPm+Bd89EodzFqcJGiZ7U2Fou45HxHvmyCS+j6g77RhYTY
 rrqPKRDcl/8kN5C1jrUDSA0W3pZR/61Cp0AxIL2qJekkaBstKx6DZ794k4Wt+X8DcPKhJy9EIjy
 m7Yp7kOExjR1L7/3DntAicOXIGa27T0QLxp+NYs4/DgltMINAWsPemmr2iN3x6tYpaXAWCOn
X-Proofpoint-ORIG-GUID: wbSDKOuPg3Fu4CKykibAQ8iNQP0kvcnk
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=683f0a34 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=He-YNEgCv3n_4aK0K0sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030128

On 6/2/2025 8:43 AM, Simona Vetter wrote:
> On Wed, May 28, 2025 at 09:15:22AM -0600, Jeff Hugo wrote:
>> On 5/28/2025 3:13 AM, Simona Vetter wrote:
>>> Handles are per-file, not global, so this makes no sense. Plus it's
>>> set only after calling drm_gem_handle_create(), and drivers are not
>>> allowed to further intialize a bo after that function has published it
>>> already.
>>
>> intialize -> initialize
>>
>>> It is also entirely unused, which helps enormously with removing it
>>> :-)
>>
>> There is a downstream reference to it which hasn't quite made it upstream
>> yet, but tweaking that should be fine. This is clearly a problem anyways, so
>> we'll need to find a solution regardless. Thank you very much for the audit.
>>
>>> Since we're still holding a reference to the bo nothing bad can
>>> happen, hence not cc: stable material.
>>>
>>> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
>>
>> SOB chain seems weird to me. I got this email from @ffwll.ch, which would be
>> the author. Where is @intel.com contributing to the handoff of the patch?
> 
> I work for intel, so I just whack both of my emails on there for sob
> purposes. The intel email tends to be a blackhole for public mail, which
> is why I don't use it as From: for anything public.>
>> Overall, looks good to me. Seems like either I can ack this, and you can
>> merge, or I can just take it forward. I have no preference.  Do you?
> 
> Whatever you like most, I'll resend the series with the wrong patches
> dropped soon anyway.

I think I'll apply it this week, with the typo fixed. Then I can 
mentally check it off my list as closed.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

-Jeff


