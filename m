Return-Path: <linux-arm-msm+bounces-77111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64EBD829E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED92B18A32A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4C430F939;
	Tue, 14 Oct 2025 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMxMHk67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84730F55C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430342; cv=none; b=UkIUXKRZMOrHcINURWngbq5qP2Dt5opTq6K8jcXgp0WozbYfuNQtajgdm85pMjjqcodEO/CtqRe7KhLAxeZBN2fhX72hmhYwgElaXtt1EFVQcP9IgHgdMw9qHXq4d2bDHV3JwjiWaWzI3gZbSpk/Xk0kRiQ1fvoVpOPGv1A3O5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430342; c=relaxed/simple;
	bh=bqbERKIw/xSy0mRLmRp7Ht1mMntEfecsoPf4+hpZs28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKuSts0xlT+uiiW53dCrtkewmPQN/GtYkdeuyR6wME0GdsRAzxR25rxX+qz5iBtL7i7D/WlcNa1HH9aLtESRMoPIYqkVmH9rNbVQu0IRiWxA3kpvNEcTqNH6Wa9fuiFGq+orFxO7yQ/NfEIrHp3GgAdJY+eHzvtJXyV8YK63hOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMxMHk67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87L2k008500
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSJMVS9Iibrg0L/GDCLFrpAEBfnCWQ9ZrgtUzwHovaY=; b=OMxMHk67D3m9lmG5
	Qf8GII7VbXgpfaWizxdDv01iXoR/6+gFo+ZR7tOvAdYpVhvP/y69DhXEP9IhtuJh
	uay55rqs0XUa6dSTTbSZA5DmpkLt/c5lQciICJuD8Fv2B1LgFJQ3URN3XldN4oYA
	mWZVFkSXy3DrTGuk/8/Z16ap/OnZI56kpxmn3T5txDeWolz124EvxYAHDfaxzeA0
	Ot5720xnQxuMpu7xB9HqylYC7Gqm3pDr5q9d9HnQzsOf3bXGiUXs9L1Epe9oF2CB
	0/J6i4i8y+kfJ2hxTuC7lCWASo3AOrK4ug1d/MvM7YenVeaggNqRc2G581Gptv/R
	yxxcSA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4htv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:25:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b60992e3b27so8464760a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430338; x=1761035138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSJMVS9Iibrg0L/GDCLFrpAEBfnCWQ9ZrgtUzwHovaY=;
        b=hlUVpOUf0PClLsAtINilTx1xk0bvH01YeEB7ScGcN70B9L+8CZ2Ab7U16vhPFOjLik
         y+1trSOxG+UyLOIQW1QNzr6WogsMlHchQcreQcEe49pXzIbkc2DXfF5oQS73LLQ/gTGk
         gATSK3pwP3dVU/5IJiI8BzZT/9Zrc4b6WXKFjBcozDDVmbKKE5fO6Gi2F8/CFAN6ugkK
         xkQuH86yXwqOUHUd0RHQZYWdbjiKC1g6hh35UKITHBNW9wmcT2f1H5jcs/9BzMpNuiIf
         90k/aimH9+8rfLvIkejghMcnMHDw3uTVpdDguZZQ96nJV5iaI6EcfnTG5kX2+BHKIiIX
         b+7A==
X-Forwarded-Encrypted: i=1; AJvYcCUMWOqR23RMp/DIgIdkb0NQJRsar5phtsVv+YTh4JqXYoMwm3WZg7KORJcYSBIhM6675L5uE75bnSRfGsCM@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBTVugtWm/do9H1DqhfbAnvIPHsNdHM+nzPcHvZizqR40BWdm
	5sWyPN+y7BJ2GcmYuOejBzvtxgPUoEUoTnt+F/1v0V/16F/5WensbgwoAn38TSYnSeGtpXO0SDP
	hfykdgeHY7oVRy0VAbPWJXjPtHIhBANiWrPuuAeW2/qXLvu655yIv2KX2WPgagDfBk6JY
X-Gm-Gg: ASbGncuyMZN7SeXdP0Xe4KiO0LSEiX/wOzz2D6TcOYfFl/qTQJhJYyF3GMXSr8F8hAA
	YBuP0SvP8ORKTr0cBYZ+4dEob/C/kg9/XcKJSAE8nnaFFq918hsQAc5gy/z80c7KfBe58FxaqwR
	fzMNJUbrf+McW9WN6NBVn0geoCh3lMArx/GUlQzVrrYrt4+hiw6bPrDC/t9rUGQFmnSzwDzK90K
	tZK1PWf9O1am2BN2/j1yJ7+gJcjdxIQMeKZD9IhLkKduHawvY3i1HEY3YUgNc0shJ1Tnm1CEuiu
	rPBY1UfE8NXl4/kR8PkDwzR+7SA3DnV1OyEmS0YEzCrpMCh+n5NMmMy/NdOWHXl66Qm9jZNy
X-Received: by 2002:a17:90b:2889:b0:33b:6e60:b846 with SMTP id 98e67ed59e1d1-33b6e60b8d1mr14896205a91.11.1760430338203;
        Tue, 14 Oct 2025 01:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx77WB8/5wRwZJxz+GXjiMEsSbHz+VvV1kplZrzsrb2qudf5GAaryBEY0nknZndSGOnrfo7Q==
X-Received: by 2002:a17:90b:2889:b0:33b:6e60:b846 with SMTP id 98e67ed59e1d1-33b6e60b8d1mr14896178a91.11.1760430337709;
        Tue, 14 Oct 2025 01:25:37 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab514sm15042035a91.16.2025.10.14.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:25:37 -0700 (PDT)
Message-ID: <d8d26b77-ef20-7c09-147b-5b8f54f50483@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/8] media: iris: rename sm8250 platform file to gen1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A3wiNqiryybm6nLuHXmXqY7hA2-G8jdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/DsSiwZO+H8d
 2/cw4ccR8YrFnJ/xyEcuoPtTJh7szbn3EvIIalLbsNzZCil+vu8P+B0fqjujTfKWy/G61s9Saqh
 3kjlK3AhBUc7f1xbor01J2lXR18PPDKsnnjta9H375EWMMrhzi6B30GMJ1hl+a7PQ4DBBufjBmG
 53xh/7Vz/z2qcZO3hH2HyGy/aKvmft/q7D1akdfKYwVt+KaSzZhND4R3drGQZVfIbYfJMn+KmMX
 DnCibidDMRD8wDbjfXgMYbSr1nChPqPtUR5/1oxWG2P4adI6FGvh3fqTiUTetBuWyA7pUNY6w+p
 YJvZVz5mRvHylo9jzZFZspM3SL8l0z+N3IHWFFOy8ShpAFsC8rhjoSxKfUUdlWV8BCdtqGguxOo
 xyfsg1aEzc5E+2PhVdfJfatyjiOWkQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee0903 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tkggsdbV04ru4vqEU2sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: A3wiNqiryybm6nLuHXmXqY7hA2-G8jdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022


On 10/13/2025 7:39 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>  .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

