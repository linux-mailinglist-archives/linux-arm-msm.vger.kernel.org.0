Return-Path: <linux-arm-msm+bounces-77052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8ABD694B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 00:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA4364F585B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 22:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CC2FB968;
	Mon, 13 Oct 2025 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKo0uVM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F02FB994
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760393307; cv=none; b=o1V7qAk/U1eYUP0vfPAt4OXNaJT2D1ENLtWUc7SuPvEIaYrmdcS9qYaetcyxWI1ucqeILQ/IuglG7kk7xHP6ovTjmhn2bSTquYA4/ybZIzsP8x2zyEruxv9XTkFqc6xZbTVbLm3ReoDt0Q3SMuh6C/CbxL5xQmr/QIMkRx6ISb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760393307; c=relaxed/simple;
	bh=AVO7V2DjbajIbh1GiVeHzhCJ4XLh+ruiXzbUrkvUV/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/dTRHiyrURKDStdC8t8ZZhmQRwSJ1O70SiQWUZSU0COQfXGGO/fI9TgbWsy5hejGsljS18qpIXuDFO/FAoQNT47vHJx7fFoKPMJtFxe0JN1muXe2j4jo+GynL1XT8cw5wVM1cQQwbWCER2Fjgdb0wJRWt4zOSsLkx6la0J/JXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKo0uVM7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDGwm021068
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQmisN95IhtDaTX7ATkYQvb2B38Dk65Yb3yFjG2YkLQ=; b=fKo0uVM7AGoangO8
	pICUMs7RVa0VkZVEVOh5Rjeby2Mn18mAmAcugaag1mofjJ7zT/w2A1YYH7yRueOd
	klogwMYbvNaqu/Ao+Oa0b9WPJ+fgJTy/yx6k2V8ifcCig8kwp0xfKFTz67NNtfyJ
	Xy79arLHJbsJO7hKHACpKD8mWvz+KK5uZgOLukkc85m3v+iNtefvbF6NvCpLz3mr
	hpwvyDaSNLDsH0l73Ws706i7hAChcoK9pzqX35fqEY70Voo34xXPiQyzV9+boiKg
	Df4EtodDTZk0gGgMaSBJ3TaKUHRdrrYnjJ6m439iDbHGA3d8ZFUxuyCa/WwK641F
	ARu5Gg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bx9yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:08:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-268149e1c28so118602915ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393304; x=1760998104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQmisN95IhtDaTX7ATkYQvb2B38Dk65Yb3yFjG2YkLQ=;
        b=I9hVSHxK7kGacHHLI0elG8SdSYu6BDh7WYklx3x3oVKOuCSKjEVymiOBuOqVwh9lwj
         k2DjgxJH/kXt28reWaMqxS6YG1NwkF7VGV+8coDvADG2tk3iikM1YICwd1dF79Slfk9f
         pxgI53MeKQMF4SBYu6TWT6wpVCzt5OkioNTz/td+EnLaQlDzJfvkgpMoEpV+qrsc1rNc
         NBemL1UFG/2Is1IEnhL5kpOooioQOX4g8/d6HHJqyQj1G5ffS0yHY5blun2Bs53/oAc+
         zil6UDaU0ruQrPGEn0kOlXpvpN6XLB+iEm4QWy3hRX1prMeh8Ak3gRNfxiMtgOK66Ujn
         MGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA08Nln9FOoN2j0IbYnq1X3V+TJC40XJwmwvAd/euCcdlSItUrv5awbrk8370P7FLlFY1cUroym7jNO5oZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxySZt8LpisOvB5w5xr+d0yQAGRyV+VtLx8scSYRRpt2zzWSblL
	Cj+lNmDgFMsp4MCC4Q11UTxbc7wx+AAgVIGGkmGpt4k2ecrnQt1KPP757WSe24j8VJrcsSElPD8
	MAcR8EWSrCxPYSQVnjldybDP4Nx4wjvUeQXD4MBIU0hH77mB6guXw/X2jNYhKp+ffBAZt
X-Gm-Gg: ASbGncv2XDto0e3mH6lAaTYQPxZWwkCjzsC7OH5/EuugK08LMAoSJOuCjGHMI9waUpp
	NjmvWEPmltcMvLMGYXSciFgZE89zCs7RsDG8iS9RbeNIZPEbmRzIcmKOdmbX3SSeeZhzL697fjw
	xDTxcyqIyhz6K4oH2CNptjvqGuG6SRt7TQUn/fEkUYwBol28xORnbOKfE4QO+qy6z0qn36Zw+PJ
	dxejl1VI7Otj3+wMnGTGq8/dgHt9Aopp2nekBjhWQ9/dXhvQBnxSP7fVjog/+89TG98V9RpnHBT
	GQUe/+0HtR0arFy5AyFZaMNF5k88D7eSEq4oV0Mhpaxdif7HE0ueGjjPL5U30mfBi2l5vgcWuf1
	YgD/JKXMRVJtfsXpw9yMIrPXDEOA=
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id 98e67ed59e1d1-33b5138e3a7mr30229726a91.25.1760393303697;
        Mon, 13 Oct 2025 15:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyrLtsw9G5fBMOgfmCTBl9HjcLmQyx26V1efYNwwFnNqhpoN6PWwYRe0RBYeoWSqKmSiQBfA==
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id 98e67ed59e1d1-33b5138e3a7mr30229701a91.25.1760393303240;
        Mon, 13 Oct 2025 15:08:23 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288f84esm7851092a91.0.2025.10.13.15.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:08:22 -0700 (PDT)
Message-ID: <93288297-0c59-4fac-be2a-2adf088b75b3@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:08:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q6g0RyjoftTML_xaaMdnhRMp2j4sJci5
X-Proofpoint-ORIG-GUID: q6g0RyjoftTML_xaaMdnhRMp2j4sJci5
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ed7858 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5M1QQXuR4ke2
 fu7kn2qHTmRaAsMmkTx9fhSNvCBalel00d2AiZBu2FmVQ9YoS0aUSqXkiUcblwrHNns8D0hV9uB
 3BX6k/MwjLk3yeVoal3bPlaOSM96Z55Hrht1gqtwJa8b8zVpQsQ4hbqaMTwtGAapQsRbGQNvp8r
 /v2rg8xicmcq7yQbW6P0Al73wA11zUOh+OLxu7SHfU81nackSqCUzRkAl2YufcGL6EJpCRyxX+N
 VnL+h7jhSGrSSAc4Db2pGmzp2GxV6k+KTR9JQQwoKutiBRrQp3vpVeDLm+vhREri/VsBkMUtPV1
 mumrKr62jTaFLmS9ErOMdZq1tsGp48xNwaa0s+Po5/HLeqzFyT1AKK0vHOUmTiLd4ksiLhwtITr
 xKvuRu6uZeQCkDgfSUdy7NkFJ71CLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/7/2025 5:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

