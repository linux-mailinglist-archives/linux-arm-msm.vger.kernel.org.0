Return-Path: <linux-arm-msm+bounces-77226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59409BDA282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCD0188864D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554202FF653;
	Tue, 14 Oct 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSePEpHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F3D2FE04B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453446; cv=none; b=hQMiNStDkkXc5pQkS2p+7uBWu4fQCtzYLcfSVSgn4XTKSMmMJveQiJxCH13PT5SFQyCsdRQAhU9hZc5lq0eMzlhmfktzDqZ7iLJNpoUcgSc67odBbhhAKulcREsUjoJAWQpmpNq4B55aNCYNiyZr7pRqHX40OYHS9uUb9J9dzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453446; c=relaxed/simple;
	bh=ml+1qv+s5vczhgWEVdSlJitLd5nrn2BAcBSApaoD72Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzATWPuidHGECqcMZGgKmfm6Mqfb4LJKbSSIZfTzLnVmYQb8HVxCgT2Kar13XCl5ADKdd+0DycsYCklnHOPguTVdwC9JyONlbsCFEuYF2NI0f24ml4xm84KEVflTlcjJQ2kZFbjt4rG4zvwHsxqiY878kIvGjzsggbwyA4CiEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSePEpHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Lm0016457
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhXnSPGit+112GJEwZoQx6wccumTbJbB5TJl7XMtPAs=; b=MSePEpHjbJt0/l8f
	BDX9UEw3RAwelpea5nIx1jktZmcGQRzYqmrs3PsuTTFsGb4j1/WCl6TnITGjaAlF
	8YnRkK4ojTwP/KXrplkls8Yfs6wDxM5uYpFPK82AeBN7hsB6D4X0wq4ud274naWQ
	y2c8zggI6MRNyn+rUB13GmiYV/dBkfzQV3nDdT2RpzNo66MlowbAKjMgsg0yqo87
	AYXibXuaUTDKHXT5of1ubWR8Bs6XUzR3u8fm7g0N2pv8PQLBoGucCtFy9qi/CfpQ
	tJI7lMQiiuDK8HK2cP6RjwDuiAK+5FA80a7STY/2GdeUsJSD8CV+k7zrKJ7p4l0L
	Qw6cuw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd90yeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:50:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so9010327a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453443; x=1761058243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhXnSPGit+112GJEwZoQx6wccumTbJbB5TJl7XMtPAs=;
        b=afm6RzOjXt8IfOM256JCZ2pJhDEp9RcnLRL6etRy7Tw8iDw7BNo2Iw5ggQnl/hyAd4
         8a6n5BomhfgmszP/kZhbUVLFK4qegdYnZyMyLRvnG4l/QoFNIvn2AumlDlTAiFoixwUT
         0UN0mmKbp/9vsYMInuEOWgLVODKW4EQXTjosVEmWVUvPsjU2L9mqrr1HV0orJti5Fm2Q
         TnmdthsahdT4A2H5QFfz+aiQ8FaWqYY1MY5eKqJnuCSu2kctYzKe5XPJCJfplrV9JMMn
         qlFHqfdIGXNCjI64S39G2r6aB9wSe1refqbt9hiyUxDeT/uz1P2dcb8fXN5CKZUeBuW5
         KhIg==
X-Forwarded-Encrypted: i=1; AJvYcCVitqrioPxRMFPrPE4b6K9py0T396F4hA6Bpfuhto9Nt9TmwZoTG0mvhjXsAnWWo9os98juesgbOFTyL6G9@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYPYw3kWJ8KxvWQzfL12Me+HuFc0o83MO9oqU9M1T2e5QXeCQ
	Q8lGTYv2CXPdDCrm2X9X4jBHtCIRb2cEYDFMULOhrCRxzHJV9LsTeeCpyeLEaBQLDgPxbfsEiCb
	UOouHCqVnjfZUvrcocUhQjt//zBK8qxBoD9ivAgFIpAd699dwdNySJuWN1mkViVbuzq6p
X-Gm-Gg: ASbGncvCC0+K6BH7V8B73fggEk402LJf0TGu1S5fT3tzuEJVm6wWRoMClQGIt/DrYP6
	f0q8Fp6/nRLpg5OmlWiZMCFFhL1Lv8rbXSJk6hc73Z9RixDJwglLumC0ndSlCvczA9UfLTr5p4t
	erobnnJJLHisThMcVHWrSfXHgBCeleYKX9/TOHPN3f52Lmul2xlX+tZqRBfTTVnhcf89iwIGy6t
	JsNRCyWVFBNgUGsNgpXxBH3YM6COOrxti8Ak5AL3fEI8EXfuqFDPoBVEQzPY5xU4Qq+Ss2cgXfO
	AWjYsMHo0YB5pTr3hSrMNQeefg1IZJkPu116UxVIHU2gPUOGUnY5vjIibq8tmURRvPDX/a57TQT
	5PNhiLaYwvOqrmg==
X-Received: by 2002:a17:902:ecc9:b0:262:2ae8:2517 with SMTP id d9443c01a7336-290272135e0mr360425905ad.5.1760453443057;
        Tue, 14 Oct 2025 07:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhkdCLYsNsOsOUVInOfZGz3fqKKFhPTKgYTrxsxL+iwuLjEd7V9hpHOYpbkzzJXOHlFjT7hQ==
X-Received: by 2002:a17:902:ecc9:b0:262:2ae8:2517 with SMTP id d9443c01a7336-290272135e0mr360425655ad.5.1760453442638;
        Tue, 14 Oct 2025 07:50:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df4ba7fsm12000959a12.32.2025.10.14.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:50:42 -0700 (PDT)
Message-ID: <31623bb8-2dd9-4382-9d8e-19441d06dbc3@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:50:40 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y4zpg03RMk3bE5u5d-eIeBd0m4ez2IQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5/WgAsEguTyG
 JOqMTv1WiaH1yPpPGDqJKeHSYtl7tzqUuAIC5lySkmQsgpU8afpaw3YLLRkTqmlweziSualqWCd
 SjpbCs04kH3aBwVLOHnuKhMaJFJbnqt954YngygjNd1pAyjks69qsTsnPV5doygjXYNjsNOvr2N
 5L2APNpbwUMiKYu9QiqgIOeHghM3n0x4YAB4Wm7azFSM4yPplARICevJGhqDQkFoLuKzt2fepCI
 LCJaOJtinKIcWidFYkk5e2or1xwPYOiCdI3On3wRssVFZZaIrzxXM3cqY+LUWTBo8GroYzhC2BX
 skntwdD4niD6ot/IxEcoxG8jV4OzPF9ybHv8mE3VegcSHIkBiJjWgXOKgJlE9ycG4EmqTpILLQq
 ATmtsQy/WFIZCM648qNIZ1AxGI48fg==
X-Proofpoint-GUID: Y4zpg03RMk3bE5u5d-eIeBd0m4ez2IQl
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee6344 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/7/2025 9:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

