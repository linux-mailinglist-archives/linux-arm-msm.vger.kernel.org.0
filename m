Return-Path: <linux-arm-msm+bounces-59691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD59AC68F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5AC51BC6BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382DA28466E;
	Wed, 28 May 2025 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRMEPjVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC544283FFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434506; cv=none; b=adtNwlhZw2l4Bbar2aLf7hegI5VqngFpufbYva+1BMdo7tWhZbeHnZkTpehWP96iowbSyRdgqqV2L8kuerLupDGf49GzCMgGPtNTg3rI2yZcDo33FdAJxVCJnciuA16E44uZ4z6hSAAtbOVfNeQ3SfGkraNtKnNwE6tEffsYPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434506; c=relaxed/simple;
	bh=B4Iy4GScb0lOZr3qXJcMXNhDcnRTr1zdGPMFxHZBWQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upp6NMW5550oK0Tv0HnscZDe6lmzuL2WDJmEpd1ZvtAffCSz4n7LaPyTyvqjhyAs+Y+ZdGw20udY/Ob3THOVCdIpdvbGU9Bb09GhDEMTglJNgjoGcEqcF39/Apnq/g7FZper3TyCa72FTBbdKoUps0zj2L4vIBhe8bzeaWonUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRMEPjVr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9YUpq012264
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kxSJrMywr9s+d3mPmL3Y3rsQ2dFUTAUlZhEMbytmdA=; b=oRMEPjVrCnOedfZI
	FTk+db0FQ9H+q3FFA1mBrcPBn6D3TZRIfCH1pTDhGc+QbtgRpfmzmXD0gdbuRnTd
	f1552dHaTa2uGvEhaBVbSIzt8vdOUSrE2jP7PTGfKeTvP03JrU/YrIwReS25sJpe
	uH6jGH2oDJf6g9DX7TdRQY/FNnvr/1PZeD2FarsV51SCNJmAHV9yf5cUJohyLvH9
	R/c9ArwXCxfx/dId6ZQQ3qfFtdi7szGGKglAlCcMnFXB2MbrXTap2m+hXpuReYKU
	ZqhfwDXvX+QX0LZkrMYqyvfJy0YOwKg4ATPmzWwA7jYKeyBWV8dOohrlFVg+YT41
	5rF0Hw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cn98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:15:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa443fb86so37919586d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 05:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434502; x=1749039302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kxSJrMywr9s+d3mPmL3Y3rsQ2dFUTAUlZhEMbytmdA=;
        b=Zfu18ry0WKahkpA+iA3Sp8+XiBiEGZC/yNJgx8TrdmiiNxJCdG8FAMhoTbFlpPM57T
         IEwIkM7TSEuKNb0SvOYq9fF98VLyB77IucaeQQKTT3qWYBwM4qzgT73cgzftlcgTgs1K
         rir7VeVhnGC3TTMVtyY9b1fiyOViD8dCDdRyUIJpl/opq/03lI0PYEvhyYAL8ZCKx6nb
         f9UBM9lfmFrAPJwmUJSr64Dy5066KUVA3/K79Cp2eU866tuaLLNkLm5sfYZgMp4XtjTA
         5SwDCYGdULooFm5LGffYjaIo+8vD4N5eah7dmJE2cQlQvZvoBjLZ18g6CGUDWlhxgW+T
         rO8w==
X-Forwarded-Encrypted: i=1; AJvYcCUfpXWIHF9OFoSbps+aRZAljsrrJVZsqrR6SxkDtuQuAYIBMaBKyJAw4Htfg9FWBbz9PULX00Z0+XV2adUi@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvRmVPup4q9mTldeTbyyD67NRJBs9KoN6EjVrc2SW3ciw7Hr4
	ncNbCoIJwV2O9+r8vynWZNnkejB7vcVEamydkrQKRjKogGyfatQ1sAzoSmo+nVkiDvmRbXAf31U
	eFXMwDjY2kBy/h0NcyAatmn39U2R+mH7ZpFXLSXrZGN7IuSl89fulDxQwOVqxuvbl9MSe
X-Gm-Gg: ASbGncs5vb/DCGIjpR338ZlohJlIDeWwloxI8Ozsq/NF9fwFctBTw8gHuvEvOIOGs/R
	DJ9Ub5IqW8+W+1pFUI58yW9BW2RXM73oljJTXtbE7sLW/rJzYsH813pez6itYZfv83UFu7ZuL6F
	ZH0EWFnMwO/hzWgb4BGiGkb4xbaeaaBqCYbER33hhj6tHAeP7mUyb4tygOalCunjhA8Y3M/UQbp
	EuEhJSdpObzd4XWUyHZ/K6NCAMLFroU771KoVQPf3JiLsG3H2NoeJLlxnx9UjtE2CpN42SQz08b
	E+qjThS527yoNrtWZkdzSqsuhIFkRRyX+xJjkRxaq5zbp4jPRnWrbkxwHgJbhTjsLrbq5JQjrwc
	=
X-Received: by 2002:a05:6214:1805:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fac0f84fb3mr19984666d6.37.1748434502618;
        Wed, 28 May 2025 05:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Xjdm32wkahk/ntIryyXQ0dV0UAu8jmCUZQcY0SDaEWnx0pvAxtAjn4+fgoBP7skc2unmMQ==
X-Received: by 2002:a05:6214:1805:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fac0f84fb3mr19984406d6.37.1748434502242;
        Wed, 28 May 2025 05:15:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3f02sm258525e87.236.2025.05.28.05.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:15:01 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <q6zxkzuvczjuewapb5jrk6bnp3t6lsvu5mgqb7gpq7bbdsgprd@ozgvgbtapdjw>
References: <20250528112328.1640743-2-korneld@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528112328.1640743-2-korneld@google.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836fe47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=zIzJRpkdUK6dvKgA1CAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: XHylEdC7qrtKDY2W8sshChqsyuM2xa3n
X-Proofpoint-ORIG-GUID: XHylEdC7qrtKDY2W8sshChqsyuM2xa3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfXyLWg3V1ljha8
 sQm5emaXc3bRW707Au70WhvZ+iHAKJMxx66TRi7mCJqmlCPurq8ZidwqaAEdGwArUR2YnIwycUo
 T0sMm1sXdFvSShIcwkhLruuTW9IezyvrhiR950O1WR/1V3imHthCtLORvzG6L06T2gNRG1+/HDn
 oX5VmPjQ0uYSCnK2eImBlLE9QiFDLPkkbM1eZNKu07UcBgQq4prG2eCgn1AnNjeIbFs08CAbBJe
 3rc8sqF0a5guLIEXhgwRVkUiN03dd55kI7gNQTOmFS1ORLwgIB8KLnlsk+NuQerWzRJ6+2/H7bj
 yLFxt/LBm0uA6YSGgJ7H5BVweZOvn8/USJtw1REinxs0e19rMqcx1aCGljj53kphqQgKW2WL8oq
 HxrH4nOnPGwD10lOXmvh6v1Nvp5Ipb7wESawkeEKVeXGXnITnNkOSAT03d6YI+caTRN4lUdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280106

On Wed, May 28, 2025 at 11:23:29AM +0000, Kornel Dulęba wrote:
> Battery charge can be reported in several different ways. One of them is
> is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> power supply API. Currently the driver reports the capacity in this way
> on SM8350, but not on the newer variants referred to as SC8280XP in the
> driver. Although this is not a bug in itself, not reporting the
> percentage can confuse some userspace consumers.
> Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> calculate the percentage capacity by dividing the current charge value
> by the full charge.
> 
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
> v2: Change the logic to avoid u64 division, which is problematic on
>     32bit platforms.
> 
>  drivers/power/supply/qcom_battmgr.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

