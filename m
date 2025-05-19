Return-Path: <linux-arm-msm+bounces-58421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE9ABBB77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DDF517B2BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7B1267B95;
	Mon, 19 May 2025 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJI+Wp0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50581FBC91
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651958; cv=none; b=q/lShf4nKPGAGYoJ8tiV8HY/OLB0PW9FEt2j03tAq6D7N5EfcsKMfrd9rHW7urSRuCQkoicrhCtF+nCIAJfdQp1yhO8Po9woB9j7a2qevm43mjESezSJqwA5eM5bWs12u9IF6G2fVDPWEfsTRk339HOIs0xuE7Pj0YQgI4tdXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651958; c=relaxed/simple;
	bh=oxYra/1ESn4MgY08N5Fw4mQtpFimAquhhdAbdKtG9VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6YWp2vYSe0HZoRWkvM4S/yIOG4FGMEBu+WCc6fziGkOPid3mfw5nacRONmGVlmdnKWFpqRICvUsrnrLfOEmpPtGRaf9hSREkdp8/dt4IKhkWBRSSYAk6koVWPE8hLbEFgyjwcrdhDRTotJNwCf6jKHyDTjkJhAak75P4laAf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJI+Wp0N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dXQA002845
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t90+Oj4ygdv8TRDYFavakWSk
	VDFa1fEk7fIwub/y9ig=; b=pJI+Wp0NB2RXPQQMxYMvRcG8eNxK/dg8hXp0e1mR
	TePrIJFwHzp+ZuUtpYTef9/43s9zX8U3U8p1RxX6NBrU51ZOjiBdBODbFlcBJstl
	pwMtanDA9/AwMBhMvWNDPLm/J5AmYWaNRbJl++iUwgsaJmw/1cudLVvOdGyuLFjv
	8AA50mMNeWGJ2oTONYvCXODpP24aK7j2Mj1kb48aOu26sPK47F4g3371DlHjNnqZ
	VbWcjztZkjvxg5+hfEuFil2hxJjrLQctqwLpBWZhcoxtV9Ub3YlBPXg+KQ+Luw3n
	c/Dn70zbbHv6JqaZuquq/rudZZJTAm+sSCbIrO0IhQurXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgcye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:52:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6eee4d7f8so110009146d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651954; x=1748256754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t90+Oj4ygdv8TRDYFavakWSkVDFa1fEk7fIwub/y9ig=;
        b=YKmsuXqvRJ2mgp+XK/ZKDkxX+xYLr0/XvtZsJZ8a4Tj2shf3kd1dyOmgvhE+XNtojO
         0zI9jnukqe+dVZirM2lI4Xii9mf0/BXF5vs3aQ2ia1nOBK1CljHhIa+/tuRzchBVs7VV
         z4YZoF9HEynBic83CsOHTqBpGRaTlqGwFKd9PkRWUpshrKWUXl9PGnETzzulmfiBZOCO
         9AnBySigEgS4BVOea9Xr0XB2NJIWj5+VHo76ruovzjBIq52HoDG0lPUtgpcBuTr4zVfr
         8EukwRfAtSz8kIvUuFVsT5alk+AuftGKWIRhAIEYEi9jFk137MsE436AS3WwhUyKheOd
         eDPg==
X-Forwarded-Encrypted: i=1; AJvYcCUMS+Zsna+gFHOnGPebBEZuXqX7NmyLjdFAHTjKtQOA4RHFhRBhFNllA7NzjvZMStOqSGf8i88t6MjAGp2D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbts3Eet05iLZLn/GoaMo4/+gz46tRf4ro5MFt63bE6dpsk+J7
	ywinDGWhPpJPHjr9X9d/Ez2SN1NXxD1NK0EtFjNIa8CtxyqyoYNz/h8DDXTH9Tgnsx5x07dbNJi
	7fJ0adK5ZprIC++3NBSyOAqSGK4gQaFyvzFqJXNJww4dh86Up5lu40KE/NjRlytf2y/xtU+xjcw
	w+
X-Gm-Gg: ASbGncsfrX0lX1BQlM37kqqgbozTOWpO69j4R0v2ou2DujtkSdBsRElc5yKsYDQJNqr
	NfLip+XDkEGtReFIIDGQ5qpvjt/6woIZ97StNcDidqlE2+LdAX8GfCD4+b1RXvPLxV8zGmXY8Ge
	FSHirk9+bX02inwqVdnw2iDthRgy72m19OOAOxdkn9iv0mCDza7TwLivbMRL7kw0g6q+5mIm3kS
	FmbDM6hgbRL7phEQtrINuaWnoSOMho+AAwDPOWBIAGDNfR2mPp62kc0wXzDuxuVMvUVpUACrwo6
	QIpADCSlSCuQQlX4eb3uCB9Dx4/7qQtqK87ZqOD3m0RB91dtFAsgVO7tCOgPNXJse7/5peeMu9s
	=
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f8b2c59a32mr186698546d6.14.1747651954039;
        Mon, 19 May 2025 03:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEMtoxSIBkpBXUBMHT3joJQj0p+S4dXD/Tq8czhaa/yp5Y0axY0mPhl92SRHhatoGQa6P2kQ==
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f8b2c59a32mr186698166d6.14.1747651953551;
        Mon, 19 May 2025 03:52:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f02sm1800343e87.149.2025.05.19.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:52:32 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0d73 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hTWhmv7ANGsBjBJhI4AA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: q0yMt9-atj_LTfHPcqTemNGo9Ze9En6t
X-Proofpoint-GUID: q0yMt9-atj_LTfHPcqTemNGo9Ze9En6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfXwK3c2F9nW1hK
 ZhYhZama3mOl0nXMXGOgMIhzgaQ5UslNoxHcIHHioywYg9jjFWratDqqa1gEp25AP2EaAJ1Upg5
 7LNP9xJpfL0ZWBH70u5RRFwUPT4yUx4qY6ecjtTeuW+gyYo2Ly6HGY4H+wtLtgJ8SylL1We88vm
 C7ZwhZ1kBm2YmJgcFtgMdHIR7gqkWvRH2U3UuWJDyAUfRUj8LEo+rg+THMUNkgaTMs5y49a5m/q
 6JUtmasfZizRSEI4XDfaUyw8d/G0VdvexHeJ7He/0tLr4UC1JVdZSxQBSZqAQ7ALgX/nzVJ6rIP
 3LDsQgN0xWUzKe24VgbybsxnPbPsaz0mpKfA+MxISexVCYadWPGP+zyFPD23Ai8cEiUfFa/IJls
 Mz3fwAkbtFQ2w3cej7JFP80uAqjI7rdl/qzp2gLgpOLCdFYdr3Jc24euKZ9d/1bJ/FflPWxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102

On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> User request for remote heap allocation is supported using ioctl
> interface but support for unmap is missing. This could result in
> memory leak issues. Add unmap user request support for remote heap.

Can this memory be in use by the remote proc?

> 
> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry

