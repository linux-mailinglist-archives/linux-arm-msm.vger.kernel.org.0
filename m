Return-Path: <linux-arm-msm+bounces-109723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kADFHZ4zFWqPTgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F35D0EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 809B530098BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DCC3B531A;
	Tue, 26 May 2026 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQcjNZ3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2vpREmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880B384244
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774362; cv=none; b=nzn5aw9+RDauI6+z3XsAJOhIkXGRpD4bdR3qijcbZR+qAA+TzHKxEqP9R0pMDZquqcDD0TLHILx/uiasx1qu2L7VfPnjxwfZT22w8SXWcPJ63bi+FywRK9sH3NtNE/ipFGXwxFvYmyLVNRoMEUrROiLLuKKX7oJTp0oqS2vz2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774362; c=relaxed/simple;
	bh=Nsb1s8J0QRX+WqrQsGYpcUlTpQ8qSu6bfB/ayFGBaL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1T5SuHoGpLHpVdx0wjn+6f+wzKH4X1xUNrxSTVaf2zXwHFX5JDNySIiTKL2lZtsAEKsHwF9ZQJVp4PBYtM72ljPbKpgWOVtM2eT+RrprU49RGZrrjFhOfPDic4a60mpCtEcivhMBqA1n6NCROpZcPqIK5N+I4xuYw/1jbpMsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQcjNZ3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2vpREmA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q3xHCm004508
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDy9vXC1Rd1tq49bIIsepsbF
	IYBji5z/KFPlG+PXtu4=; b=AQcjNZ3unsyUZEiT/Vv8mevSYCIgge/foyWgPge9
	g4MiGFrL0sCHfSSZkLK4BI3DpIq5/IW4U1GKjuejBtIjq7wD/cR6/U0nz0+SNTya
	CzKrIbs+SEXxaR7AkPX/XgzUHXQ8X4lsWcHNowxua+oX5jBMf/wBTS3gYw6e1Clx
	qRQfCv8mq8ldQyCxB9M5DL8diX2HcK3iiOAa7on3vkEy7VAZhp4MvxLA85Ca950t
	z+mOFwfTYIHvmn/myV8yAAKSj1WG/Tbk7+ngzhNfOrQjAqaAG5w6xeQEjdLT8hMm
	5r716ZJNDF0gSTv9dY/UN05mv7spGTYheYYc2T+NdT/4zw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm01utv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:46:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57525c1ed46so7828499e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779774359; x=1780379159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDy9vXC1Rd1tq49bIIsepsbFIYBji5z/KFPlG+PXtu4=;
        b=C2vpREmAbV+rPFRgzzlmmp+zlZt4QT0XHDsbptC74CnJ1lt4H+kNxlhnAowu1Yhu/R
         pqwJl+8thkzckAyS4+U54Vffs8PL7XHhwous3yiFgYqlSRB64nxonHWjvWFJDRscr+0i
         HZfGwkef0eIfS/mBKhSzQ4M07LfOtv05hjQfXgQ/RO4EdwmzZAOKuhggvUl97yvSyjcM
         qTFMsT2JLG9D9yjHuHQO9H1kdl8JxuPRYrAaprK9ws0b222DLArN2D9Fg9dWhm1YpNia
         CHOBtTerI7jcV150em/7mvvHFZD9ev1AzOjpKwZazPhzG4pAz9OyCHprGhYJpYuzVogw
         PIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774359; x=1780379159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDy9vXC1Rd1tq49bIIsepsbFIYBji5z/KFPlG+PXtu4=;
        b=s/GKEh9ZKNqTNpMv+indh4MIsH/RSHgN0QQFS4n0mNuUG2VVHC0r2+dTtzgh2mnd7N
         zRDW7FN0qj2pM/qCzKHdFLBH5zQcYlCQVYRKqs/RePW2MG5DRjJJu9MibhjSdzIt+nIK
         cJa4XrrJqXpBG+6C2gM/LwvuSMVvWYko3k8t3ez0jiQK1pt9ZmWUG8KiPBWeUQWYkojz
         6h/MIxKRExDXo2xlin5AQ/zik4wNKfHs0I9/pEMujMw4HjtEbc11fJbmtKKvNoZLYwD7
         g6Ypl3jgypCXZc4NR2i2rg7TZPjMQtkCiYLtvrHLYnoKWreKA4SQ2CFa2gtuty29xmx9
         qGdw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZdAkiWfb7Wtp0gzst6AhyeR3yNPfY/yF0yfGb7qezg0to00D9ce60Jf0MEoGJNsDmbAjQPWBZ2CCRf6aa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Bv7pI9ltBSVRsZlM8jhHaRZZnXJrqllAgWgOJOF/9vkGjhQ4
	jVBda5yfescL+bt34hPUNPe5QKFlk8uRFrmM2UHTPBHLhIaXQCGxD/rTj5a+ATIrzkMiUepL2eO
	KTsLRDzj8jXdOS26s1UmbwtFa+TO8bkDFJr1UmkADi0sQW+UAHS1A17KPcXeYU2uWBz+p
X-Gm-Gg: Acq92OHLQ03bBR9URQam9gG5FsGAOQKKXYq5+Pue/m2tT/zUN+j3twor4yAa1Z83DF1
	vudDP08F7ZNJRKJC2djB10Qv5FkgGgGve7YrmClhpZ35YIYbayYUYjp0O7oNIOY2NVg7UNaC6ky
	ay1MAiPXgYJ8xvvF0jdq5B3EZau8nXUZHDOqzmemqq32LoQfJhbETyTzPBNP+FoG7xqDAiXWEXG
	oFZNJRxC7vXrnHvBx4juLvr30NzmY/ewcV9x8I736e44/N4nDgqRQvdt8IPnghvMiXav/PHd4iM
	L7ay2iIZxfNBsO4ccnRFQ/0hdu1kCrC+dbRtc8xFIu97ZFvfOPqgvtc7il1bgcQUO6F7GRnjvKb
	HLmjlM5bYFoB6OAfs/aQxJPcco+KztQihcSX0qA8tbwfO8uMY+EyqLFTVZNRA4Nx4ogKQEO8vMh
	L5ALItHA7uPSLqGJVmRQ+qzekHPHRkJdrtIcw=
X-Received: by 2002:a05:6102:390f:b0:605:7a45:c7c5 with SMTP id ada2fe7eead31-67c8a0759eemr7094139137.14.1779774359383;
        Mon, 25 May 2026 22:45:59 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:605:7a45:c7c5 with SMTP id ada2fe7eead31-67c8a0759eemr7094126137.14.1779774358957;
        Mon, 25 May 2026 22:45:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4623be9asm200944e87.0.2026.05.25.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:45:57 -0700 (PDT)
Date: Tue, 26 May 2026 08:45:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v6 09/10] drm/msm/dp: turn link_ready into plugged
Message-ID: <3jezpw5umag5pfyn6gvzqhcea7kpdg666c657rofwu7wzgpj7b@suwc7wn3poex>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-9-cf3ab488dd7b@oss.qualcomm.com>
 <79fff2b4-d8c1-4225-a75a-f9c2dc6a85e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79fff2b4-d8c1-4225-a75a-f9c2dc6a85e4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a153398 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=brEAT6A2eyJCnXEto54A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: -HfmdCEvots14avhWMiRDkqcchewyNeL
X-Proofpoint-ORIG-GUID: -HfmdCEvots14avhWMiRDkqcchewyNeL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NyBTYWx0ZWRfX1262qSYatySG
 9NEX+tpWqBoHDQHVCLgKBWKmgQXBY4IpW+e8X9KOBGawmv8lcjjBGxIuoG5gxs4w92he7UCu9d6
 HZ4YeQwssMytfZs/aRS2M4OnrS7svUgsR3P68PRN7gnOj09Xd9XiYjCxG2iStmY/TmGBQ+Jl27D
 J2LqmsnWHaCWuMevDy3kRJNT/UVsROBikj97CjmOrdlrjLTtaFfp+xTNK7IIw7zeuoGnvbwTyWT
 rJfOiZ8HuCvnz0WTAwcOljLn4E8JzFAGszNJsFExLOX7DfpQd+MQliIZa96eFLoAXFFBmuruqIi
 npLCINm28Itmye1egBBOWRPA+JFnzIDUXWY3fxZQe2mpPksl1jDPA8o0JGp3KZ0x2mGgLoRXPCi
 QQc5R6eDUG+5nav9eaECQwOVCjRF6jqz1RqadRVmbMjzvJ7WAlOyEbyIiGWEdgLqSh6oZ3mNE26
 nV1wEVpgWoUbLFJROHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260047
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109723-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,packett.cool];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B2F35D0EF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:01:23PM +0200, Konrad Dybcio wrote:
> On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> > Tracking when the DP link is ready isn't that useful from the driver
> > point of view. It doesn't provide a direct information if the device
> > should be suspended, etc. Replace it with the 'plugged' boolean, which
> > is set when the driver knows that there is DPRX plugged.
> > 
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
> > +/**
> > + * msm_dp_display_host_phy_init() - start up DP PHY
> > + * @dp: main display data structure
> > + *
> > + * Prepare DP PHY for the AUX transactions to succeed.
> > + *
> > + * Returns: true if this call has initliazed the PHY and false if the PHY has
> > + * already been setup beforehand.
> 
> This assumes no failure. I hope adding various return-value checks across
> this driver is somewhere on the todolist..
> 
> [...]
> 
> >  end:
> > -	pm_runtime_put_sync(&dp->pdev->dev);
> > +	/*
> > +	 * If we detected the DPRX, leave the controller on so that it doesn't
> > +	 * loose the state.
> 
> "lose"
> 
> That is done.. presumably so that one could correct a coredump or similar?

No. It is exactly as written: to keep the DPTX state. Otherwise the HPD
state machine will be reset, DPTX won't be able to respond to the HPD
pulses from the branch device, when the anything gets plugged into it,
etc.

> 
> Konrad

-- 
With best wishes
Dmitry

