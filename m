Return-Path: <linux-arm-msm+bounces-86180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17497CD550F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F9C300CBAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E6830E821;
	Mon, 22 Dec 2025 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUZGjDmq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmY1ktcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D532494D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395600; cv=none; b=rFpLS196xfHxJrlddXm7IDGxoW64L0HE95Y2Fgs4cztD+rFtBgnqYs3KdAxRsxcpV7Zf/C8idFcSM1F90JBF1cN5byPNtKyEpR3xI7nGlgJGJhF4kSR7Jj+Xu4/e+ZUhDE33NbB+AZdlQdCyh3f1UnQCJMb4RIYqz/k/a9b3Y04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395600; c=relaxed/simple;
	bh=wE9kQM7tNoX3TXNhPn3X7DIrr3XYeZoCHItfCcftgwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeQxgrhlQmGJ1vNTrHZxPkCj4i9s7RwzOqEE/jWW6Xg8RU3hcLEzGTczk4GOrwm9jbBbCuekNvEm8gfEeRQXxzJMxdxxkCCpDlFOPNBEGFKxxHtMVNm18rXZjkxBzdeAvc80RqN0UtzoZIXWaDaSRVLFC7fsrmn1zZG24SCZqoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUZGjDmq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmY1ktcb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM6Zvmq4117894
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=; b=nUZGjDmqSU6JkJDi
	ujae4w0B3PZeHAcmPkNlZPvaDdh/I0aFTXYHUMd094pA5J+V014PFQYqLlYXtRiI
	BGhU/8NmAVN/pG2q+Huf6nCxIVOfsSwMqv0a/FHFLcf/K2QNIf+ekEgDwKpLyA7T
	IFAsJqDiLqA8T9H7HP/jitiW33j5gjH8mgxacQeYQjc/HRIBOFxRl8xklc1F9L7O
	8vPvg/JFIwA6A6YcQMXHJ/uzLKcZedZEUL90jgz5jfETKEGLX9kRnmhkjy1e8qZW
	W5IRBi2Alq8RhYoUN2lLOksSSq4GkLCU3ldiKw7ady1/9szRM1FXJT5O3Gci3Mec
	Cufzbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b70v28gg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:26:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so20677291cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395598; x=1767000398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=;
        b=NmY1ktcbedudofzNQP+TlixKJZRvrFRRRFksSHOs6Q16EMbwkTIMbCoogb5W8uSxlc
         c64wT9PxOd+wUptiXQAE1dc06A4GjLTIoDm8c/9S5iZ9lHGCR1pERo/vssTlBe8hCgkD
         kkjh/JkeNnjdtmvbwIM1IoMiB+JfHKzNn+BIiXIsZ8CnKGfHIMMr3yl2Xcv/ylHQd7pp
         fzji0uAS2HFs2rfiJWHIykA8hXm836XtrPO44BIYvzrdvzEMIj2aitrCB/OkvyruRsTc
         0QqVsrED6vuGdZFNME/Z2J8LmgUFKBFnoFkyzbZJBBwhPcYdddopTV6MifTHGkqMj/Qy
         gHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395598; x=1767000398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wo8DxuCQVwaQ+O6OGBHHbUAaSkVwS6bkESopiCcsyUI=;
        b=gYWv7FJWEouWpoo7Rgf7wmaOW0xUpFAcriRsXDhHXyAZJ6RxXFDesAKrXL82ZQ/+lK
         o9RSIoU/aOOXTAahe0LcHqpK+Vq3i8ekLEcrE14UrSIoO26cclm30B47js4L2hOHj9yZ
         0UFionwz5u2e84Lv8yIQnMs8Zu9UjRextand358psU0TKKkM4IJ0CHysTb16m2FOKTIF
         5p3LTtXJ8JQGhM6thvT2y3nfwrUTLFX9BXxAyOjFSB6o/eww5CIUdI6D77fUUsMTVBrk
         6N8PZWH6WAX+hpPrzn+7Q3hCSrjPET1zz5KrBhzGvDgzBcQ4SJwa9lqgpuw77KalQ550
         n08w==
X-Forwarded-Encrypted: i=1; AJvYcCXSJDsvYhQG3cQzJOLWW2iUgEudHBpwhTOPLv64D3NjC22UzyMAe62TjBvFMk0XiOOapJHeJ2deNxY+M6dj@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNATrqfL5gVX5XI0ildzegcA1PelFnEZ3YLZY6gXFh1Qfj6Es
	NEjYKt0sm8UZH1ywHr0yfXF8cu6OhsHx9ITAO75wgMi1+OJWLMxOgY5i4tn56t9F3bRwsbcolEq
	5cbzvjKShFrlRs9KYULiRIRlFEDga9RwWEv+PxHcCojfK80svyTiP1hvoBsTf+SrbU2X4
X-Gm-Gg: AY/fxX4zAQGZMpH/VHyQBK2IyXiWksptILysDvpo2vWGt7BqgRc9Vz3/be6F+IIKzVP
	lbylIIJ+1czRqBGThRDoPua7XhA2GssgXNblY6goScSN4TUQHSHXluBRujjmcVNigGlxEUzqdES
	Db9n1H5k4fdnQOWsrGtcXQe8sVw/h7xiC11PtGF5pl6P5SEQZivRdq1KnzWen+P7aCeOfv6na5r
	QngiRJNkqNDooQRpKmREfn2Ukauv53gLqhe4rv6RLav6YbHytW4l6NNyuSqZ+fNxgMLpE2wQEsn
	UpxLB2ERInXNINDM7pP2QtNojHOFiGNvEYnCbIMOQotUfqTcBN0LZn3hi9t/TR4d2WzMAgmqExH
	BUaUggDdI5XzKxCL5pW5KTP9/IrAWf5avMWAw7R2yqfjNWe7vDidEJxlLHNoqtkfRjQ==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f4abced018mr116971421cf.4.1766395597784;
        Mon, 22 Dec 2025 01:26:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE05+S01gejT0XaDp2gizkJwFo7qbPLqzLq0CkAGwGWo2KI7w32IWpAUg4eMXCEAn3mtQh/wg==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f4abced018mr116971271cf.4.1766395597306;
        Mon, 22 Dec 2025 01:26:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm590671266b.31.2025.12.22.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:26:36 -0800 (PST)
Message-ID: <b6ecada9-c3be-4c94-bba6-be16f253f151@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:26:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
 <aUWqtbpldOG-dqIy@SoMainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aUWqtbpldOG-dqIy@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o4-46WKuKmtyN6GCxgwBI3d6YqNve33B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NSBTYWx0ZWRfX+lPREhbTxUyP
 rw7yzPk6pjK11EFiTEz2JYhzymRiZulih848xuIZgEjdlqIyXCTByEN++LrWQOj73pCVJU293Su
 rfEIbya1A/BGtDIPmzn8mwJk8Raq9VdVyIRtWSg3gZ/SCppn4MwyAlPUp9PRWexJviTGVUSHpY7
 bv7BWo8TPjidXChlevl9rkk7y5+CbcYcQcjfSii3yAECXPi36uV/jYs3G9Gc5gyqgwknK586Sm0
 o0zd8DggEJDqULt6qvrR/qT1KrHIpec8LCqSfpIBOMpOvYSeNV+Zcbe+s69uxMHqIUDxwH4ZQht
 AWTn7JZYFTkb7w5gfvlU7lxsh39rbD0PA2uG846fOz4rljX5j/izVtI4gx38uSYR0S2aAde3BXP
 IqHrarcTQD8MH3It/uM0LlPoYi32oC801WFIS8a0uy6ePb1YJf/uNBgOqVfhCABkB767TUFUEsQ
 93KY5lYsbT/AkiNFaEA==
X-Authority-Analysis: v=2.4 cv=YOKSCBGx c=1 sm=1 tr=0 ts=69490ece cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cD7NnaPcIOXBppSYsfEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: o4-46WKuKmtyN6GCxgwBI3d6YqNve33B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220085

On 12/19/25 8:55 PM, Marijn Suijten wrote:
> On 2025-12-19 12:39:01, Abel Vesa wrote:
>> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
>>
>> At least on Hamoa based devices, there are IOMMU faults:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
>> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]
> 
> I thought that this was normal, and that I was always seeing these on startup
> (something to do with framebuffer), but indeed by reverting this patch these
> are gone on at least the Xperia XZ2 (regular CMD-mode panel) and XZ3 (CMD-mode
> panel, 2:2:1 DSC-merge topology), both sdm845-based phones.

This is very close to what you've seen, but note this one comes with
iova = 0, meaning we're likely passing some garbage somewhere

Konrad

