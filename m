Return-Path: <linux-arm-msm+bounces-74864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B550B9D1C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 696D01BC5236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A8F2E1EE0;
	Thu, 25 Sep 2025 02:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKhpgsH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B22DCF61
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766487; cv=none; b=feK+W4wkTRi7/Fp//cYnLJQsveYH+eDajsdI94i0miFMnSrlpvClK5HpUT88TNN2Svpjf95XJyqKQXPB4WjsVyruSY09SArDtfEU9aD7y7IzV/I8hkZEyUaYwndTz7HTNtkuvUqy1vVICQ+W/tpl04E6E4MGy40hn0j5J4+X/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766487; c=relaxed/simple;
	bh=naJzm2+LZbO2Y4ZMy0R9T9gNZ+PyIaodhhZMYTmfbPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duv9DY/vJm5y/OzARNrziRjNz6T9qJI9yoyK183IEZmGpzlAlzgherUD5L0pVD+dbBUXe1rsIMcX6OYfidoRrDXgR1CvB5IF3FMXarQvO6R95+xTR0kB2OCXS3uBWHSGaXw1YjLjj5wTQnNB6PqYmGTT4wS3JoumMKbbWjrWKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKhpgsH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0vIQ8019952
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYb74ctst0DsXsUARWUIqV3xVpP3o9baTa7sSWce5hQ=; b=kKhpgsH75HlNeOxk
	JJu+Dp6XTSisBBn8B/4goRuEfU7cfMca3PCQCbxShW2KngxSRgOn1b8xjr/XRVeL
	DYS9pW9gt5fIuC33/ewU4hQ8RDGSL0QorY3dFngQDl7GAPtdrj3xq+xrOZf6x0BJ
	+g3iaggg9LQHiyF//c3vWCXNIyX29dOtykoQASiuKOgE8hwdKRYg+wZJeEZdLT5a
	1JUBIwlXZ1MmGhrfn/B/BKDW1/jS7cCpSPB332QXjxCw0m+dNIA9qTw2uEWkgSEw
	Tlis3v3S1c1spkGgUdJqD3tEZhhI1l/XBso6TIPdiLPZxGajhpF0Rx6iIGfZE0fB
	rbezBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdymg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:14:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec2211659so501041a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766484; x=1759371284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYb74ctst0DsXsUARWUIqV3xVpP3o9baTa7sSWce5hQ=;
        b=El3YZQPOE6UoPeN99/0ctgpXNXbcIJ7ElXuyyUIlUsMUUEqNprXS5PftMjP0CaAW+m
         UZa4QmfrUZw1BFTnfV7jBMDoIBdL9UVUcu0bOOn5nTDjxI5opUWdh4CcGGUd9mN0U+Lt
         xjNzELwNDxDtMPK4n6oanhY5yrTIGhtWjBAyttJFEtWA/jlY3FZUMluRh0zpCRtCVOGq
         hEYVsNPoPtgpeGBcB2kWeSlTfqoG3u18uoO0NuQEOOX28xAxGBq6QEt0IxbUGg1JO1Ld
         3TArVrNlqjGD806DlNWd3sOCVwa8EbWAvbPOFtZuSwvPvnN627ypbCf/7UZPAghi3XWw
         0+1A==
X-Forwarded-Encrypted: i=1; AJvYcCX/maLtS4BvGVdQ1HLwtbTVwIPYHO6G3JjqDKvphUDqCtuYrZmsMimTWYPlwbkYmBDyW1mEeSJVxYkJm03X@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAP7X+qFjCEsgyZ1/f5evWbFa6NuBe0xa3r0y7/iz38mluokI
	OdSs6qpJWshCm5baqW/VAPOEf/w66HzsC5yDLwHZ5/CztgSeXkuvSfehNPM7kHJ739sWY6FV4FS
	CYDtIs3FHYavoOdJ67cMuFG1zZodKsIWRuX32DQcs9LHkBi66je1CcgeSCzFCS9ceEy2v
X-Gm-Gg: ASbGncu+On0+x4pJ4C7xzFoOovKzZidhpf2NliHssh7Xv98a0mj9L8hIYbkLGf5Cr0c
	u/kdQ905yKmysI/Be2DF+3Gs5bosaKAHo3Cq58xRAFWN9l/vzU0MaA4IMdMnIHI9i3QI0TAT2Dv
	/1LjKhGrruM+yTIIBKdxARjP6AGvsAXVMTR61LrkynWLbbjNGwt1M5fR6mzhHQW9i4H2G0HXjXZ
	1ktEZwUY0kl5vji5zkVujllVqisHwmSnr4rQWvFKLAqkFnKSZdY3ACsSnl1GAB/86XZ55ABAZbv
	CCOFHunns4DMWaiK9DQPxHE6B6MXST2q8cloSJHCnnTHE/3g9EyWuPrOqbShQTpTuuHqh5eakLW
	cZ0Ii4Q==
X-Received: by 2002:a17:902:c94d:b0:272:dee1:c137 with SMTP id d9443c01a7336-27ed49d2c42mr16317125ad.13.1758766484491;
        Wed, 24 Sep 2025 19:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyxJuLNtLq/o0cb418AiMSRh+W0XoH4JxAaKBFGhkZ92bPDHbrLdzEVGWl23fcg0V3B8oWOQ==
X-Received: by 2002:a17:902:c94d:b0:272:dee1:c137 with SMTP id d9443c01a7336-27ed49d2c42mr16316785ad.13.1758766484006;
        Wed, 24 Sep 2025 19:14:44 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed688226asm6880855ad.65.2025.09.24.19.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 19:14:42 -0700 (PDT)
Message-ID: <5a6b3a3e-c6f6-ba39-9edf-eab3e1815862@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 19:14:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
 <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nffQEgNV12NCfFFYL2h04Pu51pKkwG8R
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a595 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GfICSpz_d4rxbVQ3OkEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nffQEgNV12NCfFFYL2h04Pu51pKkwG8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX8atBJCdoL6ZH
 8f0JoGMIvc5mKXXhakGdyznzbQfZMcTXqNnxzwFs/pNYpoJXg5oszgMmuMfJ5yw+u1xBOzubZ+n
 SpValoIzf/YOSu2q1ICMbEQ+D4JQAtxkU9oUAGFJZH/DKA6Cui3VmjJEGUtExwq9xHDOknY9Hsc
 mIwzh98YatpHYUTiD8HOaDJUUqueetiAPF6Ww+RZw4y0CvqiMvREXiKtxC4zgnQKOiVfZhh3R3Z
 P4Lh4GaDu/suOESaFmxzYBOJWM9Nw/tpOZRirXnWSFQqjar1pmJRFHLCf7JMCx6+lCql7UFEhrW
 U5X2WjTqVyCQJqDdoiWVNA+mfUMjPk/9AllyN3Wy19jiekfRhqpm1q+qjP1gy1SSUM9nb300vxs
 lIdYCeHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020



On 9/24/2025 6:30 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:52:25PM -0700, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> There are also some PHY init updates to modify the PCS MISC register space.
>> Without these, the QMP PHY PLL locking fails.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 311 ++++++++-
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
>>   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>>   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
> 
> I think yo've squashed too many changes here. V5 and V6 headers should
> be a part of the previous patch.
> 

Hmm, not sure what went wrong there, but I will fix it shortly and 
submit as v3.

>>   8 files changed, 1251 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
>>

