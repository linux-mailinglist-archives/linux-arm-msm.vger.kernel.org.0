Return-Path: <linux-arm-msm+bounces-80808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 86538C41435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 19:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7303C4E3E38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 18:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08FE156661;
	Fri,  7 Nov 2025 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgO1357d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF2ibFpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20B31A076
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539551; cv=none; b=jsr6jb5xHUYvp8eyGtNHlZSewrib/s7GEew3Zek0iux8xORiboaHMJywCvci5Q0GgbCc85kiK72BvYPfLOpM6xaZfyXgrE8bZdg0eFFwbfzGefd7XNw1rbMsb+6dwl5BNG7YQZR4EE3WfNd80ArJq7CR75wLaO7rxBfjHa11hn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539551; c=relaxed/simple;
	bh=fIClgoZ2FBVvKENkVJWhFih7lh76OgoXS0V0LqCk/ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aq8c0AXTafNkXKfb1j4Gzj3eDUKOzQ5zvkpDwBs9HFQ4sxlFQRdbbCbatBYAVFkNh2E6/HwMWWWiFWIrc1lQsTDS78Z3f+9QrvddpquK3f1Uhw11ubRO65+y+nbtpaznFjU7QmEGMO28fNqqWEvOj3tnifXvCvUhjQKKPHmxyXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgO1357d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF2ibFpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B2VLt3041281
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 18:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=; b=MgO1357d9IzxLLrf
	xCN2Tlx8X5da1tgWRoJTRVuY56YIfqh27JcRPJDn6PRMPojU0Ni2PPF2ITZQIdOW
	ykVJUengOjH5m//g66px0Cg3VBl+Y7zcToHp9cN5uDIBQ/NiPMPkIzfZsdOSFczY
	BJOzBL2pkbmkgN9+gxsUMQ6EcNKuOFjokj7Uvw8ZZPLlsVNxucK+rKz2CIg8EBA+
	jFhaCuYccXfII1hQArANQ9TtBL2O5alC7t9W14XU0KPLVsHl18/kNctV7bK+VkRQ
	BfXjJTnt+VL+rwqmrxVnhDM1EVUeFIRkyeVKPkgajOvy/KCK31CsiAbNgAEiI8hZ
	50yfjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fj096b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 18:19:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33da21394adso1192574a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762539548; x=1763144348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=;
        b=fF2ibFpQB1iDW8qdTfQAyZvc+ZeA/yP8/PykepHzTEDIZHhgYAggyVYkRkMT4E3gWP
         TQxcf/Tgix1WlefuE/Zq58SqgGAM3u+yAqXJ7cAI3kxPWr0xNkVMOOZK2ftjzToYkICc
         d0fWpD65OpErivppWfPl+LWtjucBIVO++eDRAYup4iFhMvMoQ44/9kwGF60837hX3Aak
         O0PVwK9SWCa+dBSeM24Juo31qsdHmAfWQ5m6SzEg//oc/HRCqkZFvw4IfNgxdzCUAC4a
         c49sABfKXMRg8rrrc1eN+eh+GjyZM0ULkCz0uit0g4JoMegRrWymrP7/RDe+Iyu3Qegv
         k5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762539548; x=1763144348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=;
        b=BCwhQaBS235m1vJLIsyjfRueHrjNDuqAS1Xk2NYUXwfVuDWnqf1j299+rUTRQxqWGQ
         xEJT754iRuzsZvj127n9C2D4bEfJnGDMGEyO+9WmoYy8Da1b87EOIyuvAhQNC5dRn9vE
         32Ari2UaQ0JqteE6zfKUljqv3hxOsVuKrO62MoMFMnpeP2p/xLF0f5a8N1XvY6fHXHGi
         nySTFpktwkXpaIpj/W9e3kroxb6qPDMy6Yc81G0sy0eKkmCDrwaew0PIElwTKqzCn0dT
         E7xC79rYfLfgkjg1BW6Ersbj8laZOhecW/58E/rcFKFH6xqXmC9Mxrqg/0arsPSTspBs
         6+SA==
X-Forwarded-Encrypted: i=1; AJvYcCX263bny82Y17OgicgDvtOEjJ815Ffk8O0eOcZmUEVdZirVgn8k9pTbw+VgIz7rjWBaUSpifhZgwa/wf4hL@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRz8Vu3o3UtCKTtYNaYUwy4V/uc4YK/Do6cRLgiapXOzJ3NKO
	V+OG2QN3L6Dg3pRE1Z4Mjx6WBBCSFIpyD0qD1xNg+1FvHFcr0breioD9z83mCG1hiKbI+lXP3+q
	J+AduDLGivMaj+iIl70HaKFyjy7wXyJc6B7CsybU4rvJKe9bT4R7Q7CNxRUUPN2JfSMA1O4P36m
	pm
X-Gm-Gg: ASbGnct3pMrmCSc22IvDD5sCBXy27VnAY2BVn/bgVDegmDahaHV4RFKrmKwxdK+99vI
	3abwZpkyVhdDrROmydY1aGqGgnysvxArCgJBZZ3i6DBHOUoMoTrZCDBlWeTHQrdV22GwvaWbVYZ
	qDZ0JziC9dnp34gM10h/pluBaRtdXU2g2kkaExzfTTTUssTZ5WF1SrU7CKYASz8P5ro/f6sn/oD
	mbKHoi8noHC6JiiVks3sonDN1q4mXIgeLPle6+rfNqZjuKQnkz+B8cpx6jPuiTs2ehL0Ovms2jp
	ZlNfSdPOYZULS6gzkomZbQ6zBJR/fmQz4055kbL3KSe6xVXaYVaqR/idBh9fvR+DXHPaTNCfoxs
	tA4X/iKM+YJ22H6MCbZWEX5iU495rurcSVidUfom8hwT8hVAPg3aZ
X-Received: by 2002:a17:90b:5245:b0:340:2f48:b51a with SMTP id 98e67ed59e1d1-3436cb9ec36mr93032a91.15.1762539547802;
        Fri, 07 Nov 2025 10:19:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/aPM7Fku/fLdv5H7g4SGu2ruwxhBFHeg/MhpCokILK1V0/5ddbWwnqaxOSxLb4vF4WcTk+A==
X-Received: by 2002:a17:90b:5245:b0:340:2f48:b51a with SMTP id 98e67ed59e1d1-3436cb9ec36mr93014a91.15.1762539547328;
        Fri, 07 Nov 2025 10:19:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d13a6031sm3168921a91.6.2025.11.07.10.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 10:19:06 -0800 (PST)
Message-ID: <b0d851eb-0889-4ec9-8c95-65f14877b878@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:19:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] accel/qaic: Add Sub-system restart (SSR)
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XZyEDY55 c=1 sm=1 tr=0 ts=690e381c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SR50krzvgNCArfR1BZEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4j2UEIWvTl2L6cGNkpd6JkEtieuG_mxj
X-Proofpoint-GUID: 4j2UEIWvTl2L6cGNkpd6JkEtieuG_mxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfX15QxOp43odtL
 GDVBBfuNrRc+P8KhYYfNO/ZixtG5Hbb8284oYwxYJm8XH8FHlh6I0g25FicyFjrUmNpzSN3P/8g
 vkpo+2LWNfBTWsnHKlCSy8SJdM4mFyT6BOzu6y5sh5ni2UHxZyTINg20fatX705JbIXvcWot+HD
 1QThYrQ2E5IcUZCUBqi/Mma+EmvauCM/hERYhUs52ZGUNAvGDBp0jHeKQR/rRk4ckzW/Hdh/8iO
 Xlfo09hc5TH70jllStpokboPVb945CYoBsI7y/ekrk/RptKAaFwQbtiwLWlZ9e7xYRcdDBqLmvD
 paHbUSGExkRYTq7g+ep9Bsb5ZsHR8SUZRqV8SCJBAyzSBRrzfYYrXM/Q8TogmMUB4QFBSQJyFIY
 hDGnrhh9N1Wz9Z1MFQqjWe4GhIqfAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070152

On 10/31/2025 11:40 AM, Zack McKevitt wrote:
> SSR is a feature that mitigates a crash in device sub-system. Usually,
> after a workload (using a sub-system) has crashed on the device, the
> entire device crashes affecting all the workloads on device.
> SSR is used to limit the damage only to that particular workload and
> releases the resources used by it, leaving the decision to the user.
> Applications are informed when SSR starts and ends via udev notifications.
> All ongoing requests for that particular workload will be lost.
> 
> During SSR the affected DBC changes state as follows:
> DBC_STATE_BEFORE_SHUTDOWN
> DBC_STATE_AFTER_SHUTDOWN
> DBC_STATE_BEFORE_POWER_UP
> DBC_STATE_AFTER_POWER_UP
> 
> In addition to supporting the sub-system to recover from a crash, the
> device can optionally use SSR to send a crashdump.
> 

Series pushed to drm-misc-next.

-Jeff

