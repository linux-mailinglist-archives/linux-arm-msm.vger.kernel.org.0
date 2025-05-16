Return-Path: <linux-arm-msm+bounces-58228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D808DAB9F5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 17:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCF3617E48D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A891C84C4;
	Fri, 16 May 2025 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsMV7N3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CC1C700C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407559; cv=none; b=utqvqRKEpLFA7MKhmSQnYfTPifbm3VnccP0qt2WqlFiYS6G3PczsWqFYaux4teQYlbwrEC0PyrWUF77w1Opvth57SJbCH6Zj7EZVue5fvGmYeswNIVrx3hhBVGC8oIz5mMUh8HeBTEPNiqA3uReFtI1XTtDEc5Jxdo8OAgVpexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407559; c=relaxed/simple;
	bh=cXNyu6wGlniSomvsFvAqW5/72I3yBkBq5fuIF92Y3cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZun9mX3LGKdnEQy/fkjFNUOynhVkmYER9MmWCYSPET2ek3fJVx6ACogpXmwfPcFBntmfl2PTfCsFZkCZP0kZ2ODydjOtxJ4ZO3wYxEFa1fD7SowqOav+wqtXOybzyWy6b/InYuJrKr47UcoE41DzeofdM1lPdgzEOrkkRR9H04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsMV7N3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBIDm3026131
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=; b=HsMV7N3MCu1q1T5B
	bKezIwRscC1Nqfr/1En56HB5XBQ4yewcbBMUReoLYHSo+THMPx0Vkn92M9rUvFW9
	LUGgb694+Rr7LhG2Bb+D8V50MsjtpoWOk56mqu8vjvda9RbP06dsYEOPyxjAJHbl
	iemC4vM9SgP7Fg5C8EpGM8gZJWyh7Fbr1qKF2+6W+PgDU4Zo0cDplueiSTw8WQBo
	BEAzhGDyO0YI/N0AFFYInCS/p9W9B3Xo85JlfueNraQkgGkuTS50Ey0diHI3f6/O
	8Y/A6xQDcMjggGZ+Ugz1BjJa2Db8bj7iaZGkMbJnib+tcKSNyXofBPs2Vlxxweij
	kdthvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcytgs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:59:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2318043effaso24893355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407555; x=1748012355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=;
        b=W/AzLazpSz3uB6CG2TGECQBQwX+zVRz0jTLkPUxT1JVmlnIgXdPHCslkUNvfwPj7st
         K+UnMvkSwdmvDauGiQ47u7CSYtFTWnzJJPnabdlt9SFEaNAcRUOxeYDp4KiW3IHR5v+r
         i+ucVaUYa7s/b/Ph8a2i9AhCyoFpwC7BkLImHILreGOjOG9KauX8hGlsmdtixsgqB22s
         mEjC39utv2pJkDOI1wJf7PxqHu6Wvi2kjEFeMPkbd+znfvoWYJX2/YMFnIMOV0s+SMfN
         2zqjjLmfyj5c/oqzIeVI5FSEARZpY/9btyclwdHkyQZOTYSXB2Gk9oVyI/+aLdYEA9bp
         KQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGEL94vqGmfu8dlv8u8faKC92EB2OMvHaumbIB0wh8YEdqS+Q930s6eZEjmh6Kj3+A2ajrvncYlUF3JNLd@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAW1Z/X7BalRSuXO07sabbh5IMpTlD6RgENuls6XczVHLUwK4
	KO8OzWJ+sgYkXHaZbtM/IrHRdazbVa3jnewMdylxv0wEW+tJrqdvUf2gsbL3jN4mX+O98HQbi48
	zyrTOqB/DjoWi6ufLQJ7YWpQ9ETzq2p4F49WYDY2gaT1Qn4KABsmILHMs/NBN8eWe1zN5
X-Gm-Gg: ASbGncvI9YSbBpmcxNeisPw3SLunqfKh8PSCvthuWPltMs2xcGDizEDxJbeNGHizJ0p
	SlTPOcqpdDHzz4pZs6m9XS51LX/gkE4h51AMH0AH5rZdv1Z7a3L7ka2ePI1WqZf8926HPKGkhav
	/gpnniuThNmXO6rGTTGUWegXSSTWzzRfuodptP63HihiXWcZtUf7gl1/SmICUqoBM52Xc0foVq5
	cj+3B4F/PkqRPXnWq6JcqrbTDuSsPmXuleVcWRsub5Foslw0hSqspqpbqowUcpzfmlI2Sg7Aqlh
	FtmpbfIr65udRRqeAtxPDDIxquXU0F0aLb1fCaukckGklJ74jOCW+IKAeLs/8Q==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889435ad.27.1747407555407;
        Fri, 16 May 2025 07:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9QUuer/H2zXnlCjjwWpwBnKAXckxeSB/Cp2w6YMZtX7hgsrBVAG8oDxbzoZZTSRVT91y46w==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889065ad.27.1747407554961;
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm15328575ad.147.2025.05.16.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Message-ID: <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:59:11 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AhpI81rtspDJL538yujdvrULtz9vsz57
X-Proofpoint-ORIG-GUID: AhpI81rtspDJL538yujdvrULtz9vsz57
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682752c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=rJ0JV_LFfDDBQ4JBDEYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0NSBTYWx0ZWRfX7V/kzvteMTfz
 JQ4M1olnq4okmnExFZ1oRmGLvTK9/y4BQ9AiHWBkbMbUrNb1UEsHO2ctnaRbaEsXBGEZryxSJHw
 tYeqIUqMmVrvqASI+zn3BDT2qs8qkqGpG1vlfBN52jODwSbbIR7zFKHxrRzH+kJLT8YXJ+UxPi8
 kFRed5Rkdd4pDIffqSb2fwTN1xpq/cDEi0oPoOrUO3F+iAis3PZzEeEWx4TLR+FxM3lsYCJG5N/
 Gu+Eyxcuj/ER+Z55eByhLbfd1Wf2z5DLOUqQio26rZKjDXcWGytl2NYLBDPogfPEhrZp7vygLUM
 Pip4tart3mdoCjwMYJbV/6Tx5wuT2Xj+rNiZMmyk8YETMjqUvEUVqMfDhFM4pooUUs8uQaXNeaH
 PxuTohtSLDp9EjIXqWOqNFE9vN7k08D498dmOwxTBP0IgSMjxztQiVIjbd7657Zkt9FlV77E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160145

On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> There are two allocations of bhie; rddm and fbc. Optimize both of those

There are 3, but you touch 2.  I just commented on this in v4.  Only 
touching two is fine (the device for the 3rd one doesn't need this), but 
the documentation must be accurate.

> allocations. The rddm is of constant size for a given hardware. While
> the fbc_image size depends on the firmware. If the firmware changes,
> we'll free and allocate new memory for it. This patch is moticated from

moticated?  Motivated maybe?

> the ath12k [1] and ath11k [2] patches. They don't free the memory and
> reuse the same memory if new size is same. The firmware caching hasn't
> been implemented for the drivers other than the nouveau. (The changing
> of firmware isn't tested/supported for wireless drivers. But let's
> follow the example patches here.)
> 
> [1] https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2] https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Don't free bhie tables during suspend/hibernation only
> - Handle fbc_image changed size correctly
> - Remove fbc_image getting set to NULL in *free_bhie_table()
> 
> Changes since v2:
> - Remove the new mhi_partial_unprepare_after_power_down() and instead
>    update mhi_power_down_keep_dev() to use
>    mhi_power_down_unprepare_keep_dev() as suggested by Mani
> - Update all users of this API such as ath12k (previously only ath11k
>    was updated)
> - Define prev_fw_sz in docs
> - Do better alignment of comments
> 
> Changes since v3:
> - Fix state machine of ath12k by setting ATH12K_MHI_DEINIT with
>    ATH12K_MHI_POWER_OFF_KEEP_DEV state (Thanks Sebastian for testing and
>    finding the problem)
> - Use static with mhi_power_down_unprepare_keep_dev()
> - Remove crash log as it was showing that kworker wasn't able to
>    allocate memory.
> 
> Changes since v4:
> - Update desctiption

While I'm commenting on spelling, "description"


Code looks ok to me. I think we just need to hash out some of the 
documentation and this will be good to go.

