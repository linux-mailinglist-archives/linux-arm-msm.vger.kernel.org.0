Return-Path: <linux-arm-msm+bounces-46992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02212A29ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D913F1889255
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 02:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C357517BA6;
	Thu,  6 Feb 2025 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjaoDVFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040C7485
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 02:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809086; cv=none; b=oqHlTonrYySh6qwa8MuHy7/NddUVgJLBM8s5DnEpaguH9/Yt4oP4mEguP8Lt+CZ4Dg/E6Oevzd9lO+wacjlnPwKvEEx1KVxQmvlUdGrOCZAT4XX23qGP30HjLSnw/xK2EISQEkwvtbLLode/DRL/EY1yp74s2rEtoV3C/Jw3Sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809086; c=relaxed/simple;
	bh=lmEKcneAN+wJbjVWlc2rzpPPdVoHN4WuzWpDJV53nGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsW/y7h3MT3/VMgKyYCr1VWOQ+STJdMXtmcM3MCX+fXAvYMvKPUyrLsrjvJOIAQJah42Xl53AU8EmEcBaOaqIBZmZj85FdK/QLv4/OuGsK4d3BR1fKrIRh+W2dO+uYvXwX5UWK+rMkAcovfdQSrZnqNqP7Bjsw+oqh98bBT/zns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjaoDVFY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5161j1rA029856
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Feb 2025 02:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNhw2J/xyjqjdOjUyPRQyMXcfK+2YhMUJcKSQsAuZXU=; b=BjaoDVFYAdFY3bf6
	FHM//M1LdgHS6uQEzdhUFLkFnLhcXo6PXubR+c0VHCq/ySva73H2wXVFSmjdAalV
	xCj9qAeZkmFcKvt7uRpgACOrdmW9xCKtcsu/+2CvjtmaVQftjhZW9IufzsYJBIJh
	SEdpZt5N1Dyj4A/VpeCkI7ngUHtViRiZx+2GZa5UIp+xXJASWwNrouhf8WdsZ7/z
	Niebf5jTi8ddQ7Ru4rdVBFTqj+f/9nOGJcMyTKegEB6xTL9+K0QGbAFQ/arGg/It
	4V6lULyPRlOI+TbnTG87GBofrmJq3F973ME1YnQhSFB9kvQfnS7+SYtIlVUAyAJe
	UgmlcQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mkpjr2su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 02:31:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so825947a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 18:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738809082; x=1739413882;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNhw2J/xyjqjdOjUyPRQyMXcfK+2YhMUJcKSQsAuZXU=;
        b=fHgSm0B1PrpdKq7fuvDDqNw4rXRwOOeIxYgGSYjXvGKOaKcFoVfnuC4PM7p/JfYXN7
         nzZWG2RGWLI1fC7oCWrf/OIZ0NYzqhcOMOWVhCdwons/5DkQwoA1Eqg0thxJlD3WXuJ7
         6LSlBnHpEhhSwUiuZATn4R+K8mfuPMHiu/lKZYnGGN135MkxqFIqbexpsruoUeifu6CA
         ggXNvt1hF53VWsHjyRDS1SZ4QZqhfWW20h4anizYz39hItY/4ErrO9SwYkYnacTK8AL2
         A21ac64bzykWQ/GpIQufBbFB+QOuAkuad4y9C9EN4g8p8J05cKUUAR6yJkwVvJFRfK8f
         KAEg==
X-Forwarded-Encrypted: i=1; AJvYcCUr89A82KSFHrzJABo/Yfkf6S5+SALbNSalU6J5JD05GU3WxDx+KwZaYtgO6DlIJZE/FY5yUQ5QvI7b6UR9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3NtEoEKj8uU2E8R1hCzPU/GrDywqOH14bznqUpGNdBMfcH/S
	m5zXKSG/xNO/+V9cJpnx7TUI+AM491ARySgPhZI6wnN8mgRbcGhBebyaEnx751Q2eB7idJ45+Ss
	0WcBXcR/YEzQQ7IB6q0NRRTOTJVD2wbG5xKa0FjH60NaKGyli3ZrLY/xwbTCwoYA371EKZZkL
X-Gm-Gg: ASbGncuTVFya8E2UswATwB87pjQ9pl7TzlUjl9Un0g6K1LNJ0AqSP9TWiWmZhtFCPz7
	yti8GOYXYxADDed5EuJ+j2a4GrizrGC/SfOdXw0zSjPlM4D0ghz/j6EtTvMWly+/hZLnfKaFbX6
	cWtVYILqg7fr4VcjcVJWxyLyt/LJY+BpyP9SG8eTeHOiOhjquamOkxboKwZRyFdTnYDbYUVrk1e
	MGllmDbfI6QzpD7J+KfgFjPqAfhYLBr1CZc6Hgy+Tz1DjYMEwJIpqkgQ5QAHyrR5rx8UMGi6d0N
	olsXPgdEJK6xtvqviSJqm/xvOhSrRm3Aa1wTZKDjWoHSn7hQqHtnjDbmOal8OVBvxQF6MNa7Tw=
	=
X-Received: by 2002:a17:90b:2786:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f9e083442fmr8233452a91.29.1738809081780;
        Wed, 05 Feb 2025 18:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWMPD7hnEHC91pQ2nu7ERpofi5s0j/vpsIN2CiwpyBtEg149vBO9L0UXMNuN6O09Qoy//y2g==
X-Received: by 2002:a17:90b:2786:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f9e083442fmr8233421a91.29.1738809081332;
        Wed, 05 Feb 2025 18:31:21 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3e8e9sm136155a91.37.2025.02.05.18.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 18:31:20 -0800 (PST)
Message-ID: <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 18:31:19 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF,
 v2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
 <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S5_-9-imqR9U2lwIY4X-sJZKXlB3csZP
X-Proofpoint-GUID: S5_-9-imqR9U2lwIY4X-sJZKXlB3csZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=961 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060018

On 2/5/2025 2:12 PM, Dmitry Baryshkov wrote:
> On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>>
>> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
>>> Hello,
>>>
>>> With the hopes of getting this into the February linux-firmware release:
>>> Please add the following BDF file to the archive.
>>>
>>> Changes since v1: added regdb from the same archive
>>>
>>> * description for what hardware this is
>>>   - Qualcomm Robotics RB3 gen2 platform
>>>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
>>> * origin of the board file
>>>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
>>> release, licenced under LICENSE.qcom
>>> * ids to be used with the board file
>>>   - WCN6750 / hw 1.0
>>>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
>>> * md5sum of each new board file to add
>>>
>>> 39b270f43cb6d733cde607bf2b23e2be
>>> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
>>> bfbd247fe961dffc4e7fb413703fb284
>>> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
>>>
>>>
>>
>> staged...
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b
> 
> It's proably not worth it now, but it might be nice to have a
> changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
> Foo Baz'. If that's not too troublesome ;-)
> 

The problem is that our workflow from CLO to our ath fork of linux-firmware
doesn't maintain any history, so any description in CLO would not show up in
linux-wireless. I actually had a descriptive commit message for the CLO patch,
but I was convinced to drop it in favor of the boilerplate messages that our
tooling produces.

I'm thinking that in the future for community-contributed patches that I'll
insert myself into the workflow and rewrite the commit text before pushing to
ath/linux-wireless.

/jeff

