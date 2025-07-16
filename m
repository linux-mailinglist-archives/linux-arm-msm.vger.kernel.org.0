Return-Path: <linux-arm-msm+bounces-65122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E0B06C54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11354E5D74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 03:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE8C1F7580;
	Wed, 16 Jul 2025 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njHT6tqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEE1D47B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637014; cv=none; b=s3xhxIdB7+545YAbHAjqLtgXoUZPKMsh2aA9LsfGS/gDW+vW8DwTOcOMAzfVOQqXqohe/Ag+d6BPYMjhUjd+IqbtMHv/Jm90LuJbQHOQIJ44HeXwWJ1Ff2YdEG/wvWSO78kbM4R6qqs7O6LLjtKXX6g3+OaMFKZZIRL6QGErSuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637014; c=relaxed/simple;
	bh=5uBxKQcRMq7FuUbLA04O+2zy9ZBIDYXotnLF7dcFbFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqaLoHmrSlpsVORji5FcrmP4XCaWoGSoMlkmjO9ULZ0eV4l17gWyhDO4tnpvyHbwgWymNbyodpjG8gFM50vSZc3wEB05L/SooHr1c1bR0hldqu9M00zrpcfb3J6vJlZqT01Btrcu3eVwAeYI24L4dPIIkfmZVkyjIcX1pOxwpKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njHT6tqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDUYi026002
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G77P3BAiQ9+JrIzTbcmKzyn82sbdg2M/vOIxw3VV4ec=; b=njHT6tqO0EHmcmux
	KDBWMbGIrbwUvGnj5uFNYPrNvqLM/rB6/s3cxutv7adJaINKRR4scDwInhAMBMZL
	YspqgDZiD4GGFFQ5FwyddnvNLSwOyv/2bnAfwl1dUwf13YCW7ifG7NH2A+tormxp
	LQC+NUGyoSjpgx1NqBPr+yFxiig9UwchmT41eXmZymJYkVxjjAFr4Dp9GV1In6In
	+z2/Zgz013RLwpyINmQtCDSKa3hBMp3POFgf9WrHgulJDfU0e6rOw4AZjgz3+STz
	DHfUT7CQX9ukZ56AVEMMoZlPqadcQYYpjC+ckFRReLp1U04irItrTqyCfmfWr3oH
	9pDdYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy24e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:36:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-237f8d64263so63476105ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637011; x=1753241811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G77P3BAiQ9+JrIzTbcmKzyn82sbdg2M/vOIxw3VV4ec=;
        b=htw6kQWJsQ6Tu5chmYI54K/YpA3MtrcOf0BTgEeb0WxyRR+NiViKaWw27D6eDOOk3/
         Puh9Kk9et7OuOZ5Cev+ddmUZqObX+ZIiUCmxrHhFAkOnjHS+bIU381ww6As11RPC5yZa
         mpMiY84ICGw8E5n7GRSZE3RbyKcsPB2UEyAE/d4T6ttTHPyNkGJD1Z3bsDNXkgOq+x6t
         FtD0X62QNIKrEHj7NU7s/F4cO1UQjh1scwqRyGEfug9VDVbpG6UXzD7yaBFh1sUVQALG
         v2T+wwv0Xbw4NyVrPZvds/GOhVvy5yykp8VOSxQtRHAsa9cjBLssNNkR+SiUZw/a8J3g
         Ospw==
X-Forwarded-Encrypted: i=1; AJvYcCVgKvJezeWMSOQcgrxLupMh3QlNiJEDCYa+OGQ6eZliXt+0KxEboy+ELz5R6GLBquPMgzkZ8o15sFpEwBnj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0g74WOfnszghY9YVx3XxRDXAoOWVRrBARLxbSqihZ/u8b5z0h
	T/CQbXi9ca+gDqoa/VKY8dRe/lt8IC9dI+HzmtwIh9psrBhh5+tRciDLbxd8zGWemORQFHljQGk
	ElLAA3bfld+w6EF5azEVPWDYvkRj7xkZJ1n1ocAuTK2WWWP3Wg1JsuA6e+qp6fjq/lyHS
X-Gm-Gg: ASbGncvHe6OXOZ7g0YR6U8tkylujIdK+Dh4KLVSk2xNKQuMvds9iEoUk5HIOO+9KieI
	16dgw+p2FWlmqdQZUF+CB6dMxyb+oZM7PUUlzs6M7ezuD0J7aqBuIKzKOhHaIYKWiZOhaLHpX23
	cyc0tm3yS6v9GAUssIQgOE1zrxzA11XBINNBrxirlLEA3B3aiX6mAvv8CM2T7orV9GLWWFZdjkt
	tmv7GIokjEVFKn5zR/H+c40K1jAOS7tR2qKxs9B27kBc9i1BBLmGXW/6/pNTuVBJLWZYuNTP6iX
	gC4b2sE3aav658MwGaGV8wV0YiTV9jveVika5B7OdnKAjTVnr+bh1bCTClVbWoKWinVdwphhWSE
	vfGwLAb+1j9qf6ubZ9hMEyuO3KURNZboN
X-Received: by 2002:a17:902:e74a:b0:223:653e:eb09 with SMTP id d9443c01a7336-23e24f363demr19174555ad.7.1752637011357;
        Tue, 15 Jul 2025 20:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ZtNZV8XXqxRue5LR/rmeqC3k8eKrkmqjtuyqxnAf1b6vc2jc5Wwz/7sBQDCUzZ7rGc91qg==
X-Received: by 2002:a17:902:e74a:b0:223:653e:eb09 with SMTP id d9443c01a7336-23e24f363demr19174085ad.7.1752637010830;
        Tue, 15 Jul 2025 20:36:50 -0700 (PDT)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4289274sm116045285ad.43.2025.07.15.20.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 20:36:50 -0700 (PDT)
Message-ID: <bb1a5f3a-5ac0-434b-8da4-e43c996cfa30@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:36:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] bus: mhi: keep dma buffers through
 suspend/hibernation cycles
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250715132509.2643305-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAzMCBTYWx0ZWRfX23a9KWq6q4zc
 5dEwHF4biQt3AS3ckxAKWc9OpvRKEpD71dbtk5Dnc5sGKTf05ETvidzNZ8U75OuXQTms4Z+5ira
 zd3aVVdR0TYxTgqdSJsOc0U9Ty00/+U1TsOY1p1x6pk6sJbAXzwp1Qa3RJ8B2qxiDLzIFeiEbTz
 RHY9gQgqCbRQMLFnuUCYEvVn8N0mjWI0DNmyk9swrHvjI1D0vK7PeTUfFK9GttKGXpBEuD6AbwB
 rZLkrjc7fOkhe/S5ztb878b/SQmVCHEt8cAXD+XG6ssoejm/zmoxvPYm4HuxFsTbssxCgVvQo3c
 Iqt64Wzulvh4e7KPgeU5rlGwpB1yJ4xCHx5uNTnwme7ayn0W6DNPMF66wXnklt1j1qrNZwwk5K/
 f+Ap3Y+n/v/VE0zAo7wjs5OVyNwiEg0g8KGlgf8efdXBRfBHQimMNUblYUkK85kEFG+InzhP
X-Proofpoint-GUID: m2Tg3kjhR85GNb1LJVFTgtxdkmIcD4jI
X-Proofpoint-ORIG-GUID: m2Tg3kjhR85GNb1LJVFTgtxdkmIcD4jI
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68771e54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=hUY_jMkgKMZyhPis8EMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=762 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160030



On 7/15/2025 9:25 PM, Muhammad Usama Anjum wrote:
> When there is memory pressure during resume and no DMA memory is
> available, the ath11k driver fails to resume. The driver currently
> frees its DMA memory during suspend or hibernate, and attempts to
> re-allocate it during resume. However, if the DMA memory has been
> consumed by other software in the meantime, these allocations can
> fail, leading to critical failures in the WiFi driver. It has been
> reported [1].
> 
> Although I have recently fixed several instances [2] [3] to ensure
> DMA memory is not freed once allocated, we continue to receive
> reports of new failures.
> 
> In this series, 3 more such cases are being fixed. There are still
> some cases which I'm trying to fix. They can be discussed separately.
> 
> [1] https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
> [2] https://lore.kernel.org/all/20250428080242.466901-1-usama.anjum@collabora.com
> [3] https://lore.kernel.org/all/20250516184952.878726-1-usama.anjum@collabora.com
> 
> Muhammad Usama Anjum (3):
>   bus: mhi: host: keep bhi buffer through suspend cycle
>   bus: mhi: host: keep bhie buffer through suspend cycle
>   bus: mhi: keep device context through suspend cycles
> 
>  drivers/bus/mhi/host/boot.c     | 44 ++++++++++++++++++++-------------
>  drivers/bus/mhi/host/init.c     | 41 ++++++++++++++++++++++++++----
>  drivers/bus/mhi/host/internal.h |  2 ++
>  include/linux/mhi.h             |  2 ++
>  4 files changed, 67 insertions(+), 22 deletions(-)
> 

changelog missing


