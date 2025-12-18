Return-Path: <linux-arm-msm+bounces-85740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B8CCD2DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 19:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F220A30056D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512151FC101;
	Thu, 18 Dec 2025 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2qlX4lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6E4aK2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D91212552
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766082682; cv=none; b=g/YGhlz3C5JI6zZiv9Y/ZgAvUZsHcgzdliekje3zEdH/UMB/4mu7QTJJE4NzX4WnXhXgDlGemySCVZ0Gii1XcOb/2R4ztE6K2bTA2flbexwjedq5vQd1rPfJ+BzGj02Fq6jE2o0A0LyM3cSs5R8/6IVilMH6kFw77AV/s3Ln8UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766082682; c=relaxed/simple;
	bh=Ijc5Z5HWHuvCfxym8nKQ8+iwr11xgjKO1sfrcDU+QaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MH73hFClZME42F52ZKGrUnuGPNmWSaYJ2lk9ZRFh7gYD1y4WggDTJOMqk8CP1tl2SyjZzpTNkFEVeDt2GqofMFrdMdI8QB8Ghll2Gks7288jnw8zP0KJIZ+ZvI6JZbAHM4NRCTvnDrk7XU6DTu2JyRF1SQi9VyStsOA+D0szTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2qlX4lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6E4aK2H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5QxK1334905
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 18:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=; b=m2qlX4lACQLhnVvE
	kkHEPfkNT2tCTX/SeoaqaXH8u5wSeJB7aAMBaOOIhyFznWiT5RZ6MoeuDKBZD1mp
	woqrOkVMho8fiF65Jznt4O/OM7q2j+DJdDMi3ZWZJoC8p/JppQFCc0ZtTk6OWyFP
	05U+3VfL9o+UWfD5loAzpN2ApgOrNCqCcYnDg3WXJfFONQoepFAD6MgBMFzqu3wW
	p4bEtjunBbgiDFdp0h6HiWVJOt3azx0JtP7NSvW1VJR4EQRxWgYvupfDk8Dsd+fr
	FsDP2vIlAokpNOPxppucDVi8JoM1OfF0GxFG5siCm0FhnOPcHseobYmtjJbt/Lpf
	FwQXrg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec1ead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 18:31:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29da1ea0b97so22586485ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766082679; x=1766687479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=;
        b=c6E4aK2H0NyRV75dHQWCszaQxDlK3RNlvPV3Viv/3aRqHSmDGQUfXMFN9A6sw+A6w+
         pw/0gik6o6KUrUVdYFaxhZ3UFK9XFq/kMmda+xWodRWWsDnYbVRL30kt1u8MeVTDvRNL
         3DPHWXGVKpAao1k9Jb4C51+XMzocJcoa7xR84q3MnXv3fbs5EShiTovXKCVrPvMUATV4
         u1g74D5V3cvzjHwO+eH9IX9tXKqiY4ckvfidnbjyOu2T7AqIslIgmSR1qMxosR5km5AR
         Nl9hSsfaXgyWa9eYR60Smw7y+/BnZVrWkHLeeMVr6arG/P6SsPhYLu0I6xuF5AIu9eB3
         3OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766082679; x=1766687479;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=;
        b=WK29VbWs6fN15m7OoO1QnJXNI3cXeOtkoTUXLn8ESr/4ijyGk2xMhCyRP5EEzSs/ce
         8G07r+Sus5rybhQywDbOERveFSIUQtVeGcW9w9qwFpIa5qw/d0i/LmMgwVBX9gaaO1HA
         NVo0g59Jan6OcLlrgPTmoISOrdqH8DcSfD2wfiBC9Q86guk3Ox02Dn6qD5CRccJISXrv
         Kdt16OiEayc1jHyl8dXiX5gJJlWJfYvy3EdHgh9ZTeX45oz5yYxf6i0AsJASvHqkLkTo
         Tqkx43sVvQFtT84V5e1D0OGySB1K1/jdRasktznam0JBF73mMGahlL4uPmWGAcAnVdV2
         y2lw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXuBx/YsNKJxMa8SmmhYS5wWa7CLC+C4qr6XMMSFM1FgUZDsTLEbP3/f8zI3aMNW+8gLvGx1DnZMqdFgD@vger.kernel.org
X-Gm-Message-State: AOJu0YyVecJWEdO/QC8SfMZBWc4nyiP+veF8XrTZQrl6L+BJ1NygWWMb
	HY1FAT5c9yCIz5980Qqyw/Vbi2ZDlwj5OKSzhWGLHfinO1olo7nIQ9m2t7bRN8UnSManIyF3Tc9
	SYR5iBllSZaDdZYdtAfufK2eMWE5/tXmc0nN+FoarQwGckW/ZLQhU+fAL3lbp3pUhpwy2
X-Gm-Gg: AY/fxX75AeUIh7HgSGAOAMhtxQhoPgB3rIG+cNt0PGq6AWfY39FPzTk65uNtyAUmxeE
	6NH7uzaOLji1yLORYpm9sub3LzV7AI1trgNbW2RGXjKSI3db11maLTiQPi1SJw5otMjV6JrKxDH
	0kI0xAElP+pQd7yuJU9oCUXo4CDnUzi3nSmian7t9tDMEUJ1CDOkpZcuZmlcgydbob2KoCg80/M
	Y5yNplXqpWgaGv3wSSzhOrNy37ZxRx0YDzxKSNKshd9HPP5hwmvgBwptBkjawrxrI7bHvsUYNb/
	Jsit/X+G1xtJpA+vCDQx9Ecz3tRo4x5QE9Rv/Pzg3UEiXrBm1U/At+i7TS79BmHTJib05R+KMyt
	ne7OlVLfgo2ubsQkQnYdNlT4EMuCf1gsOxl30l6GrghXCps6yH16QLHdAJcUWdfIFPfQcTM3d3Y
	Ix
X-Received: by 2002:a05:701b:240f:b0:119:e569:f60d with SMTP id a92af1059eb24-121721ac0a6mr179732c88.6.1766082678615;
        Thu, 18 Dec 2025 10:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHOI3G1xkkhHSMBDjk/WgWlcfCBPb17ltbO/RhnXPiHqP8lwsGFivgQv7NyWc1JhaHgWHRpA==
X-Received: by 2002:a05:701b:240f:b0:119:e569:f60d with SMTP id a92af1059eb24-121721ac0a6mr179701c88.6.1766082677918;
        Thu, 18 Dec 2025 10:31:17 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm185460c88.5.2025.12.18.10.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 10:31:17 -0800 (PST)
Message-ID: <590f6b8a-02a2-4ec7-ae43-27b267f0cbff@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 10:31:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w0uKaY2Sfb89B6q6TFZlYbG8lhvouHSI
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=69444877 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RiReJqOkU6IqVSJkrfMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1MyBTYWx0ZWRfX+ylZzAGmEtCy
 ACGIVpCbeR5/aw3jf+NAjbeiQImDIq5Q92J7xwqhl1xiD6t+9N4SzDiLMYzfPGWN4ncq02Vt9wR
 muYskulvFpmmOIzBQhNki+bWWmpznkNvvG6itjDpeojfqIee7iYE3qSIsNgPP0foicno5X6TBy2
 RY3tIcjN+uGvrNxzkS8LvWoJbp2O2KBaSscoIVEhTMh0MGUoVQdlePxNM6uDakg+pQupDIqJaBT
 NN3T+yCLjMnQu2OjhqlxzOuy7tUmmPTzkNt+4XeclwpLDuqp2gkFrU6WCcARPs7pyYhL1MQVcWv
 ekN7CRfudUgjiZYyuaBopdE4KokCZd4OZEwjhMhUABWVaE+/hAX0Ztl0je0DQK6bvmBZJ2iQRI0
 tKKaljKPDAYN+BTqoctPCsiL6JeT2g==
X-Proofpoint-GUID: w0uKaY2Sfb89B6q6TFZlYbG8lhvouHSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180153

On 12/1/2025 6:33 PM, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> authentication requirement.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments
> 
> The TME-L supported image format contains two sections with two elf
> headers in a single binary:
> - First 512KB: First ELF header + SBL segments
> - Remaining: Second ELF header + WLAN FW segments
> 
> Download behavior:
> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
>           2. Full image via BHIe
> 
> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> 
> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> supported image format. When set, MHI skips the first 512KB during WLAN FW
> download over BHIe as it is loaded in BHI phase.

FYI the consumer of this functionality is now available:

series:
https://lore.kernel.org/all/20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com

specific patch:
https://lore.kernel.org/all/20251218-ath12k-support-qcc2072-v1-11-87928cf8e547@oss.qualcomm.com/

