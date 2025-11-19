Return-Path: <linux-arm-msm+bounces-82458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6586C6DA17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B35114F255B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD62E3346B2;
	Wed, 19 Nov 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9bwyRrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyLuLXFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CBD33439B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543125; cv=none; b=qkxZJ8w+qyNT6OitxO6ujam38UkHQuLjhd+IbHIZPwlAydWv1Fvta7ZXUsEYvb+D+aT9s/FjOy9Wei+CBuba/khZHrGZbuiMZZozk0egJPTge6ABJaL1kigfFHZfj7AUUTIKt/EXKBAjO/3KV/zwwArvUKTHfJTLATUtLS4ZIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543125; c=relaxed/simple;
	bh=ezXtnxmmy4nKLRLUirnPsKAzx/wRLwitVXJfmH83Lpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vrzzx4EZuRpI5QIpj9fYxvmovnmdGDAnzKDSkzk0zPAIj16YU/yj2ZOdu/Lz9+zMtnP4WcjcEDlQAgMbkkwIDcI5u2jjIZxQKC16O7lKpWNhZjfyRbcj2Zua5hUMchdprjO9Eg1HVz6lA12AKTI0nF2Pcb9S8ywMujnrfTyaU6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9bwyRrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyLuLXFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4YTtp887244
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oBAgJBWC5PELt9dF08F2H0pq
	iR9jG9unSRTCNbWqiMQ=; b=A9bwyRrIZe3RrEjd8qyp+x1YZQWMnIYRRv8haD/p
	laQQTqRN7yWDRWLLpw05m5f0N3B6is1xlVs7ivtt/sdpXDHNE9G/eHH4OSwiZ3BL
	ID8Xz/hMfJjSjbxBJwMZS+8tagDEgp/AhrIpz9y+93eSGqGIGuSGiUhwt0/78c6e
	Udor9GbxW9j6l8D9pY2JymUNyHLVVDll1JLL59tcHTaVnkBEZu+h7EYMd+zYzCz3
	I6cHXf4e/VFTLEYDRc3YSST8JpCC84Wlvs0VsB3brC4+HhEEBjVjsfqgPjtYdPJx
	/x/NXKgPAvgt3jaRNjQmdGurXxSmQ7HJJ0zCuLzFlmbUfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8r8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:05:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e4b78e35so946114085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543122; x=1764147922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBAgJBWC5PELt9dF08F2H0pqiR9jG9unSRTCNbWqiMQ=;
        b=TyLuLXFNuriy/6zQR1EskTHJ9Hy/oRQPE16jTYRkzHg7GDFZGwFFTUwqCqRlKBNpNH
         dUS4+d3YCUujw6tHr7QiUz8RK3a5KqHyCLHOLyKFy/FiLR+s94nEMpwXD+Iiz0RQroe6
         fsIJrFGHz7d6wD08yBLED9owUlgu4O+RxI4IbrDx431MWeJnWiZEfCEnjYgQ2bKIbywJ
         OQjg3axV4RwgDh9PrvedDe5pDVKzrJhyUtrYu/ESRITHpyLgQ0+An+ACCLL0tqZQ3ypI
         lVoI3lTy422moIDiF9qJ1ltkGs8xzYtYMwsNguzDmhq8rLLRKEWMdUvpUA2vCYTPW/uo
         pV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543122; x=1764147922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBAgJBWC5PELt9dF08F2H0pqiR9jG9unSRTCNbWqiMQ=;
        b=SIGwl8BUcvDnS2OdXO47y39TavhoiFGAUJVdri75uPHgO4Mec2Iu9ISH1VNcgvorFq
         0cuYgRzm8WPCThA/x1MRVxTNGDjxRLx/1/7qlXHMWwDaZOryh9JbDJnXQijB46c6yJKF
         kabXvJYajSr11Ym6/xznvXZrGBcA06h8caft+HJFEMx+CJ9+gCzjQ/C5kNXkcd2+DLkn
         xwggR5ipJzVqEtuCDaeyJB/QktBqfX63tBDkrcKG+TTFuPmMkklkHtqXIM4eJJt4CiNU
         17bys33coZmPlA6tIBP5tGbB06FAIEsnDjM9E/vcXbHX7JTodM4aBKP0VDdD+bIFRYUX
         vbcw==
X-Forwarded-Encrypted: i=1; AJvYcCUSv239sApGYuRd+6OUl8Fv5bw9zrdGBs2ow8I8eMABj+UXbPuIWcER/diJd3EbPlhY13qq1tcEVPTzjGdB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsze2S2EAfkWZP/MujvEZ5rl4oGBMLny2CvhTQZfHOMq+5C0RE
	/IoizMw+hZDcgcE2kukUUWhsYSOgrk7VJhIwreqIMh+528l6nHeVqgmjVct3RcnuIPNvuhOrcIg
	xPUObWoUWBeH6TNcit7tCExe8T4ZLRHBytlw7lO2yKnE9q5PbvZm04x4+danUYyqmb5wi
X-Gm-Gg: ASbGncuVOrsHnK2DqnVwJlsFwQXJ1CW8UZolLJKSCaeDvAmPHap3qNGDztJsidXpILd
	K4xUrTvB953uuKokbkL8TUy6OQfeaZWNsJrgXANoMTDBidyMXPqxOkmXqVfJI9wveeUwxo16N56
	XnsKrqSDAZv8q8/gcbXE5upKlpMsEOP5Zq56uYv80Fgp9crNkcT/OT+gjfXzLCuzJZvAKqU6Mos
	gEI8UH7lku/+sWLHpfEceR/hIqnb8DP00CVIFlc8yeVg4ZILgp+jxgoAo5lzBHjvPtdf8P3wV0z
	VizivaFwoZID4iSmRH4Ufcl5p6issex8TQBJVAZSFcYdJ8v6ZsV+mLDDo9LjHEi7ZKT9lG9gqvA
	N3J4qHbhcpUasAU1xXYLUnLZCEDDMjLA3iVz2sRryPVb8+ZcwBGMOoR5ckAkVLJCbRPypAY2lnz
	91x3PeHvxkhbu6Kt3qtC5SAUk=
X-Received: by 2002:a05:620a:5ec6:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b2d26f15fcmr1482718585a.9.1763543121654;
        Wed, 19 Nov 2025 01:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl0tVP0nruUET6azg14pcDZMW+9RwVCKQSB0MA+hirvaAaTc5VWCKGXZJPH/eYVd8nYtboXQ==
X-Received: by 2002:a05:620a:5ec6:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b2d26f15fcmr1482715585a.9.1763543121100;
        Wed, 19 Nov 2025 01:05:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce25408sm39192991fa.20.2025.11.19.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:05:20 -0800 (PST)
Date: Wed, 19 Nov 2025 11:05:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
Message-ID: <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
References: <20251119084537.34303-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119084537.34303-1-slark_xiao@163.com>
X-Proofpoint-ORIG-GUID: WpZUsZVQnoqpturN6WUgHVtHDml98sv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MCBTYWx0ZWRfXwYSAKUOvvTIp
 CQci/N6oqCAbL145yopxmZxQwi+ZZzkIkBmnok2mZPw4/Rq9EvmTj8Q+7kOZMAuFCKsbncWEx1m
 3UcgkxvUetD5uoOw1LO6Giqz2ALzyjsxiFSnn3dIeKp+9dWCRZbwpaVAwngNSRapDJhSwae5k8w
 NOEyAQt3U7etNPvBzhpdT1OLntRaBg6kfqhEAG8vubox4QoJga/vBJFpeSX2CPP8eBgo3CEvwz3
 U4hZ21QjoZ1EIUDWK8rFNNo9Ae9ORwQP7oLAbQDwsTPGwl6jZa7wG1cToq+D0VJ75L9T+UlN5qc
 8FGMca/gMsXNYUsULuZW8AtkdsYgW/UP3LSrj/L0aElIPIyMD2lzt/x0z+n+zu71QNkxr9neVih
 DkVSvAZCEWM7/spjkLeui08EfPGOPQ==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d8852 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Byx-y9mGAAAA:8 a=Zbds-apdPVEvrNjdMCwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WpZUsZVQnoqpturN6WUgHVtHDml98sv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190070

On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
> T99W760 modem is based on Qualcomm SDX35 chipset.
> It use the same channel settings with Foxconn SDX61.
> edl file has been committed to linux-firmware.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: Add net and MHI maintainer together
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
any kind of an error while sending the patches?

-- 
With best wishes
Dmitry

