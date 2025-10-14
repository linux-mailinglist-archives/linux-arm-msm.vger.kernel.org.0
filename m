Return-Path: <linux-arm-msm+bounces-77212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39BBDA05A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 675E94E124E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195D02C17A8;
	Tue, 14 Oct 2025 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWTeXclo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555E1D7E4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452423; cv=none; b=Dymt+bSUbzfdZ6hLfRadrRwW+baDSgE47fUKeQGyc6oKtKhduAD8sPlbXqkpNoxnYYF8mmlGBlhP3Wm/bZmIwjNdC9ugthxqxX2wphmxQuJA9ESVp2aiTc53JeHDVTe6F0eaHKgUtGDOH6Zp4eAmTJ3hTVFcuLYwXg1lVAO2v7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452423; c=relaxed/simple;
	bh=4wuswNzB600J7UAiTusoiuO6/KQ5VzhjGz2I/Vgs4os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSEGCr5c19V7ZcVu49z7cEe5fb5Wh+H9c3Ydz/92PC4kUdmnSX5fVfJPvDa8SBvVz1Sf/fbaBC0uUS0Tk0/nrA5QP6j2/Xt2dJoZkCONwLWTqwTudvH1VFiPDaY0DnnsKlLJYxMimDyImHPcbVcHH0DDG5hSTONdS4GGIVQ8/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWTeXclo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87FRt018068
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qAzKzbxqDfzAkYWr9ZLxclptMlt9B8P0XjiWP/VJuk0=; b=PWTeXcloVkNryC4/
	S48HGe3TUdIIpgcTqaE/X3Md0nS0AKuwX6YfbRo597/BHaXaxBlKJMcUzfoj0I4O
	Sa0ZoN/VDMHmt+HQr3zHJgP/9YfDzViZ0uPcJDC6kwKwMJNV1H3kuZo82BUlC4vX
	rY1YMBhVATQHtVeXgdPR3bIvx911WRMSMEH/iYSmU/Cf7A6gMV1ynUkldXCqLbzB
	J3tqZE4yKWFN89GtP/o1ETW/QtaimVLfLprMbZzeVwwhtQVHOvuDWPilicuDcrjo
	dW6d7Z+VQ3j/IRk8uuaK8D2bz9Ai0rZNPEiviAVmdxINflRca8Gq2MGUJGhlVxWp
	UoHp4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfes0uny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:33:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so8992830a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760452419; x=1761057219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAzKzbxqDfzAkYWr9ZLxclptMlt9B8P0XjiWP/VJuk0=;
        b=uh6LDpQ8CLBh1CQMFxG7Nv2LIX4MT8I8ge2XniY+GZO1UU8R9MxUllrjfYLtGpz6E9
         HbyZbl/kTZAuxehoibIEUFG0jX0t970Z+qxLpNR7t6Dr47XW4+L4QHeCZJFyA7TrCeV3
         y6bh/sSVVMQwxVpmWe0VcHS0++JM/EdfhfDCDm7Tsz/BweYzqVCdS9YD4QCy2TRGnMRR
         ti8SQnBWttOOoz6L9m2Yb2tyonUf6/aAeIZxhGFn5YjRc0QffAbQNfeYJIue+6sEwFk0
         KtBnFlteMVMSBWsqHYyMxK1MhDosRCJf+HgN6guONY1rHabSBqj4qo+tsUJmkbvFg8OX
         cJGg==
X-Forwarded-Encrypted: i=1; AJvYcCWdkX+fXtGvPP59kPOSFqnmiJrnQs0KUXh/wD5gNtY2RhgEZZ15nAaPsLGPta1VBBUUbuuQ14IdnLSPLoKR@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIxTzbNzrjTo+zEqa7tz7PwdEDI1GVuo6R/ARIEXlnCHpTSCL
	HxHymMgsARTNVtFtQxcJc3RlU1Xzgy5DFlpz9sGi7Ki9DUB92bkFwnwS8jfjf/6rnoUy9TVfhCO
	6jRRCd8Dw929ebxjZdYS0Mvew0Fhv+N3vU0bHNJcUnc6xzYG6UXwVPvGtWvWUPxaKohrO
X-Gm-Gg: ASbGncv6PmFJ67ecpNiAuV1Qp3iBb/Qo4Dle1pjQ/K5Z1PmG+UmjsDbelHUHyKM2h/c
	XxJvfHgpCZCin1YYap0pPG1Z6oKHm7u/uI5ynwemYZ1vO2cDXJDHry9RHQ/B5Cgzlm9ydKxut9X
	OyVDsQ/qJA98m6uvLFgVZ7wpa2LR/gFeuv7XCss1DjQFxDL6tk0zs/s7qP86heLCtCuI6uS/xto
	vlkGrva4hr/lffbwZSKPnIumHZNDcLRtPMciWkqtJT8hLDDWHGBPnRhj1kkdlsbgm6zPGeyq9dK
	AA8DIg8b04s+fRt/AQQ2Cxb9TZG3WhwOhnyUHtnjFCTo0A6p9lznk0G1xynAviuVdzXvgSqgbVC
	NoPlHFR7JIYBhIA==
X-Received: by 2002:a17:90b:1d87:b0:32e:a54a:be53 with SMTP id 98e67ed59e1d1-33b51119064mr35989590a91.16.1760452418529;
        Tue, 14 Oct 2025 07:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMR1cZWKq3oXTUBikthfy+B64hVWltts966nj25RJLPKLNaduOsMk1kbBMWbVIZSLsww3vdw==
X-Received: by 2002:a17:90b:1d87:b0:32e:a54a:be53 with SMTP id 98e67ed59e1d1-33b51119064mr35989530a91.16.1760452417956;
        Tue, 14 Oct 2025 07:33:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16181220a91.2.2025.10.14.07.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:33:37 -0700 (PDT)
Message-ID: <a351fffd-997d-4ec8-b4bc-9279b79a489a@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:33:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee5f43 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GDF-DjAq7UK6PHicSENotGVe8of3z1ZW
X-Proofpoint-ORIG-GUID: GDF-DjAq7UK6PHicSENotGVe8of3z1ZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+XEKVfwNURB1
 J88nrjfBzHP0IAhEFovOiGVsjSx3neWXPI/C5r/iO5yzPeGuqSXxFzB4AAphqbtxHDMgbkhcFED
 qLBxOifqvVlseEQdEZFsA1rR1VZZY0RlVq4hy301ZdPKxOpY4SO1qjl+mQUDru5Lqd/Bx87lY5N
 XIG7cSniY66YBeRzzFNdfKXTPHujsdylYfe/eckPX4PMc0yhq7iEr2oaWoYXOdcr7SVmY9K25xn
 3hfOFefWBco//y+2malBs6ODJHne6IqLl4Swpe3ZlfDwry4ta1cDQF3+yp8/R19waihCf8WYUp4
 q4K08s3YmFUlFUFMVzd9kytqC7eyPu+F6A7Yt/McJ0Lb/Mls5Gwd0BeP5ddJ0hE1eR4K5I72Y5H
 +1BjA5inKoDaTPiE3lFXSMJZazyYYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/7/2025 5:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff

