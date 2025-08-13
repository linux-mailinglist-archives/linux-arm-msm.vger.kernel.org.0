Return-Path: <linux-arm-msm+bounces-69061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A387B255B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316D81BC2F88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416803009D1;
	Wed, 13 Aug 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcAurwXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706A3009D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121202; cv=none; b=eVq9ux+O2D8GxBpY18tDHjPt3yAhuHy0kOZzyttZ/KW7adEYn8ffZQQ7R2g5kxFTKxj2l0xivR4qx9RYWnk0066ezXMljwSEARdqDcJbQOdwjOewB3p2o2PRpwdi1HBZDA7TOCrHgrBipS1hGgLxAs+qaOlb5BFzqEeDE0+in5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121202; c=relaxed/simple;
	bh=823prMjoJg1j0sL2l7SI77tJcgvJxm1hdEbc8+qPckg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYvjpvNrUDfsJ+ZLeguAboguMtMID1072yxSzRBdCZCMwNFRTyrA0ARsmjwThdOVi3H3Koe4xiOhpIMjU86o6KUU5L/JkvgydQaMv2YkCHdMi5sWutiZYLkAyCz9wjIqIcBYeNLjaIWno0Ek5KekHy/2JpU7/I3UrfbFo6WqahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcAurwXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfQk028712
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=; b=RcAurwXzpAKXEdOG
	TRd+OlbzSSziHs0RursQXpp6noZ1157tRtAJB1a5hc9wHvfkGroPDG5dHp6Ljypn
	0aGqE0F1t/d4Dd/mfibRk26WeUDnSxgtKX7y79C0/MDYNtUcq3TDGcV16JO8hlh3
	EENDO3rjpsi6Fv4IkkzTUAbvjJFcSsf3esTAVx3EujYoEznwzY0vrFdvvyYIM3fF
	hp20v9KwXZodHbcdfQgLfrzVbfsHbsUYycnGxFau+RMrcBfutST5fj8gPHEt+BcQ
	c3KdObkbzELN7QXHZYBC1VwYb+avioqwBX3p7DKrFP7aFYobmjX3ivPskkahobja
	vmWFOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9vdr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:40:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806b18aso2079365ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121199; x=1755725999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=;
        b=O2kvjBECIbe8AqqNKySOc8Ks6BJ6Hulr6f7SmmkTraOBA1AW7cH1r0pgSnk7KqDcRE
         NabzkRGrfZhc1gAKGi8QZwXzcLqck8Ov5tHeV+bNZ03vAT5WEcqFrgFw2gtIOBI/l1wf
         ADoKliv0w63RvmOwJjZEvan3zD+OkKKzixhC0uK2Acc69Y79c0NVTK6eorTOmQ70PVL+
         N3EBx39XzbE6I24Ic7U0Z3LFnLbALakTdq1ckrNDblRAag3gwOx9T24mh/jirk+dDQEK
         29u4fjzSE0l3bx7ljxuJRcrL08vIFvk3TzrR5n5Q3okjVsD+dVijIR7BpI6uAKP99Tgr
         S8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUFIKijpyQ1XpRRLwPsPxpscHDSXlyJxJT72/DI3bt2yol4zRdRzxAN0jQE8+zmQZ4+F4YJ7JgZim3+O2yU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3JZQ6gaRU3+Vl50eAhfNq57p+BzgS9fO7rARblrHExbtD6Ne
	xRySb5kAJTulBLZ17qGPxnMxwDi70JTWdRMxiUz110NJ3eaww6JqSgi6YeZL95pZTt4Pm6jW7T4
	kJSh75ihpZG+G6V4cr/+RUIJ68ZX3hdkgvNOmY6+wNPLWCIhXLuSO7ouwv9MAMJctdAM=
X-Gm-Gg: ASbGnctWglNnTdFzjNE0TPTi3fCGh/yB4jMCGPBNigXpdPpxYtXl+uJBe9VdYVl5SCM
	6EDdCkB14kbJ6eSzhLnfE093XOMLR0AN6yz7vx1KOlQCCIn4rOZsAR8ze0m0gC5NoZZY3XyYBHD
	9Kishl3tpsnB1z+1zXvxydfOy+mXs2a0bc6ePt347hbmJ3l+tidpcnm/mx9DdUPnt6skWWfHWJF
	nHdhIG7eF8Aw15dxHpw+Hcgcu25Q6TiMeWrjMnK1yTihkvenxKABx8ZrJxQCMaNNWeRzr7JP2oR
	+T6xMW0hk6Uhi16T8S+tii4kIBFT5FCyd6eyW7H+STTSVk6Pq9upaT5hB/xQUZ7D6lKYOQ6K56E
	ymj+BOQBFjUXf4HDIBYk5PRUlIsZhE8fcXJeXIw==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id d9443c01a7336-2445867ec8emr8191435ad.26.1755121199170;
        Wed, 13 Aug 2025 14:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxnQfRjpH03Kj/5q/5ynChdc9Gz8ERDFxOMx6F+r9zzLYTor/b2ISAK2vcBWx9FA/ouTeDg==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id d9443c01a7336-2445867ec8emr8190975ad.26.1755121198721;
        Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa9055sm336495925ad.150.2025.08.13.14.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Message-ID: <d1009d7a-b675-4af0-a149-4856bca29140@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:39:50 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689d0630 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=21D8NHQQAAAA:8 a=EUspDBNiAAAA:8
 a=tfL3YIuboUik3C6ywHYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=aE7_2WBlPvBBVsBbSUWX:22
X-Proofpoint-GUID: 8kkhQtSDpbZGFs4fZ245KHD2p-4uC-TP
X-Proofpoint-ORIG-GUID: 8kkhQtSDpbZGFs4fZ245KHD2p-4uC-TP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX5MlxjV4BuavR
 LP7MP1bI7KaWzbJY7dKR0kwUalx/zYuJ9AKCHZMDXZLFnRk7KcPkUnMtv/amBiOXpmRRAdOoVcF
 mTlyQ39Ho0hk+0ihKxypbOQvknZQQOTY6EQQ82qEJsbENTUVdn4D7UemAj6/CX4xKyf70WpAa0E
 Fxq4NRBiFVSbgsPv9qQ0xlnq35YNNs+vAxMe8a1F4KZf533tf5crllNBlARcpjLPcy5LjgCSnUs
 exO2cJnE/laab1Wilu1/uH3J5tCslMqVm+BSuooylr1aykj1MY6x/eZWHWU6ERBek2SEkZhY0N6
 1lespNkMZQGDLsO2aejG64fD+id7zh82KmZMNlyuvG6f6Wd5i6xV0KER2Byr9QvNdPDOqxTrQ1+
 a5p87F66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

Hi Jens,

On 8/13/2025 5:49 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Wed, Aug 13, 2025 at 2:37 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
>>
> 
> There are some build errors/warnings for arm and x86_64, see
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF2JGVDk3otBOXOL6kV
> 

I'll fix it.

Regards,
Amir

> Thanks,
> Jens


