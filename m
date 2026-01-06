Return-Path: <linux-arm-msm+bounces-87611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C5CF6854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4ADD3005BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2921723958A;
	Tue,  6 Jan 2026 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LINgXc7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zam5Y2cL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515BC229B2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667992; cv=none; b=FxQyjgm3JEJUFogKNTW7C4H7k3YIZIuSFy8QXRr+Ahck31y2ZBGdFrnQKOaaggjeYn4AvodUCAl99o8x+JOcDs4kkNOWQvd4FY9i8nePe5/+BG/e1BGNlH/5M8skFFJt7GZ+v7yq/+PyKyF/3/erMfn0U5d7Z+rGcJ+ha0Jv/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667992; c=relaxed/simple;
	bh=YGMglA4r8JhE4OsXOOi+x5bqRiTp5WzYLANLxPPQdZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bE2WHVyNTsO3finzDEQ/WvTgcEfRm6SGX5bwjZN8MeNKCD9i8RyLw292JkMQZEawBv3OjeKvTkcZPxNCSeerSTbcQnpsHYhyZvfb+16NGGfk7RNA2e8V9rXGfcl8fwLHOVVwEySk45859v7g8iYtvmycj0Z+23y2lWQ8Jjcp8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LINgXc7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zam5Y2cL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nTgN2528167
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SOu5DLSnrkviv50Szpc1hrCU
	9hPJWswJ4K5mRwRHLQg=; b=LINgXc7E05GEr595pUELCgDfVJ+Pr2+/szt14Zd/
	wvrfhY1EAgT7mKTB4oX+X+Z/vCEYI8Yi36ylQsH51Rh5TkIrem8I2pT2rGszlh0d
	V+sYsG+RMen+gZkdngIUvDONMpnJYIYN/9pZPXrJ3TCkEnwmY65BtEc7o90fCBj5
	W9Ic+mATXeL0gMBlVZYfPXkZbrFJ45ro4oLkl2HsnTPV7NCvOJwRmc/rhoQ2Q2F7
	OcwhpppMzJQpErMW+1ESFvmKr8bbItR23PBm/0YeFqr4egZMyudkWrTcSgiDGV+w
	55p6UVvx0TP1/if6ntW1jEVHCaMzfTk2HBMhSvfDffJuJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2kba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:53:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1dea13d34so12220151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767667988; x=1768272788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOu5DLSnrkviv50Szpc1hrCU9hPJWswJ4K5mRwRHLQg=;
        b=Zam5Y2cL/MtH7FPjRjLrTZdD9J9U5jMRbwzXm0XLpDZ+5+kNueVNAAr17F1+8Ax6VE
         KfmEgMpJ1eFLw3t3Mirw247BkcLE7KA+Joxt8nosZZlkV5K+kizGKpfTIWWoEJoNV9dz
         X0xSYTHdXn6ohXBrh0c2ppDFIZKzV42azJPDMcWTmcGYYb/p8ME4F4JAvJiHbzlZQRUE
         bLhOR14l8IMDAhno40PAxdo8K6Dsfb3vkus5xL9aJc4bVnrbUeRcSVSvjRooUOTovq3h
         taygyASHKPTb4gHleCDpFEEBxRVZ1LAajxb5P9/oyfBE8o2HmBXU2QIf11HQBUjqOxzN
         OEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667988; x=1768272788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOu5DLSnrkviv50Szpc1hrCU9hPJWswJ4K5mRwRHLQg=;
        b=CnBlYdDc2EoUlHwSmRztcbA6bBtSf2cT6vkFY+rdqGJIolLbhn3OrXvLGvofr2A0VM
         I1EztGE7APcyE+zHdoRa/zMv89x0NIBaCogSN1J1e4ljIxjN9OaPPJLm+3TzNdPwWgw3
         809kws23Ah/FNCpuZnMkWR0NadHfZFuyDm8yY5WEcMmECabi/yB4z/c3fvppa9gG0UKs
         ceel6/w4T9OHMyvPT7SPMQf+OlXMJfZmT4x0YiyceUDN3fuvrV8HDKXsOwXOTwF/bN4H
         JlvOg0LCXfuIGaMCPUScp60s/uAXKHLKXFtCD5vQO5d27DDsnvLa1O14mAhkqRtE4oxY
         HcCg==
X-Forwarded-Encrypted: i=1; AJvYcCW4+qPZHE6qcWWK4DCTjntGVsxYYA63O1Gm6pP/FDBsLvL3O73gU7nzjSOrTJ3yhQE5pRdEDXVDs3qazw10@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPmyz0Z2fVsFhu9HBrwWtxm/Lzdl/7AycopzUdMRp3cvmmhQS
	lb4vK8z0Oog3JHvc40cuN3kwKwwHFgYi2/I2SYZdLAvuVcqEkkZgTGBrP9qaL68OvDCGQThViDq
	OPFxgjZnCqJK1Z2afvEp7NOSdbitQ8y4WXlAO0bNJifS6vh283sF5QWzPDfxkdlytUqz6
X-Gm-Gg: AY/fxX7TQ4zegQ3K1iXPK/4N4dLGcs05H3wmFSwsUbCscNatdvn750Yevmkyq8YH6PK
	w4uy8DODnY9iHXZGy9z4D0AcHt1fJyS+2zbUyGIWrkJHANZAPaN9vlPzctMlC6K5NlPGBNoKX84
	YHZyGbzfoaEOIIyl5/epLR2VhcA5kHGZMV5J89jl8qFNBmnF/Myu3mhlKZj1GB0xEGRAvlikcNy
	ZHwxM8kZtkNO06VjGqFvdXYZTuh5o1/bcHremysN4gjZtqrlVHqPCD9qraj8PNzRmxTReF4v9cf
	B2BAZaYSFQbI8Khe17tmYYpZy4WiGiBBBFvQuLTUl0KE8sc4vkT/4KBCORhF/TK3+oqFM718Zoy
	NDP2PcmDnt13DUkRi14OLC+1jYwZeAwbWMp6uKGs42+nw2ba7qAsUqSrQB/YfVOSdQ3pOsboBuS
	0W8o0pjjgjp9BVGLPwpMFdgv4=
X-Received: by 2002:a05:622a:4209:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4ffa77a7978mr21035891cf.39.1767667987799;
        Mon, 05 Jan 2026 18:53:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvb9amrAibMxsOwQoVVZcpkjPxk8oGyOSxOfVPt6qVKOF/X1FnXoGpSJghOo10X+fxSzJu9w==
X-Received: by 2002:a05:622a:4209:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4ffa77a7978mr21035641cf.39.1767667987091;
        Mon, 05 Jan 2026 18:53:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d1c8sm228848e87.22.2026.01.05.18.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:53:06 -0800 (PST)
Date: Tue, 6 Jan 2026 04:53:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
Message-ID: <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oWKMZpkjqt9vy3tceqvERNBWNj4nRkUy
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c7915 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lGv_y-9tEziHtbIbmlEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oWKMZpkjqt9vy3tceqvERNBWNj4nRkUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfX9EZwdyWsuVoI
 x6N36XB9nErkXF33w+TQzP69q1v/M1ZaTpMMYYPxftV+YUCaaHHq52wlazkseh744TeP/lC2HSo
 1e5j3VLCC+e4Y+Voc+JBDNxO/g/8UgiTazvYhW367xN0jJfydQcIQd8Lof6hkYv3NuMVjqNwk1j
 DywEpFMKXA8/bGqgewlIv1uJtAsAg3DZvknDeQK1+9ay0XqAmHGljyN7LfgHTEOHPU0iaBdp6c+
 lvLpJyWkj0hzJ9AvhvhcyFI/yt2vDA8CGfJCbtP7nHXO2w+xo/YQj/6mjL9AY4JwxH6n3UzpL+z
 rCWD82+5ZmfOyUB7EJIxmcmK4SJBkwekfi7Jrl7IRVKNJMsJiQOS5IGtfON43nYVEGnKmuq6rah
 TRzzBgAIxHLL8gNmfQzum1LodGQzniI3RI3QHPGltFGXKj4VEgBXZtrPRJ6G1ovyXzrEyV5Kehr
 Q/t4unk3yHGIYC1pQEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060023

On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
> Current FastRPC context uses a 12-bit mask:
>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

Is it Linux-only representation or is it also used by the DSP? Will it
work with MSM8916?

> 
> This works for normal calls but fails for DSP polling mode.
> Polling mode expects a 16-bit layout:
>   [15:8] = context ID (8 bits)
>   [7:5]  = reserved
>   [4]    = async mode bit
>   [3:0]  = PD type (4 bits)
> 
> If async bit (bit 4) is set, DSP disables polling. With current
> mask, odd IDs can set this bit, causing DSP to skip poll updates.
> 
> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
> byte and lower byte is left for DSP flags and PD type.
> 
> Reserved bits remain unused. This change is compatible with
> polling mode and does not break non-polling behavior.
> 
> Bit layout:
>   [15:8] = CCCCCCCC (context ID)
>   [7:5]  = xxx (reserved)
>   [4]    = A (async mode)
>   [3:0]  = PPPP (PD type)
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

