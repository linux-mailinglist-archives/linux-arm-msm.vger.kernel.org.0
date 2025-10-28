Return-Path: <linux-arm-msm+bounces-79295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE5C17024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5813AD8B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA22C2C029E;
	Tue, 28 Oct 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d76T49Lb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHSLx5yc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908D350D50
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686831; cv=none; b=aeBmWaOrnmYDhzQvQi7EwandxNrygxsqg1bNQw3qAiA+KAWmLtBYbfYs+OVClBXuGZW2IQ6SU7g3dDD/5iDe5MAdtx+yTDosDNk2zZArOTkQZuXvJy/Lgnpp/Qa/xg7PndISqFEcq3G0fdva+AS9ACchBqnzXnhEmRK/YZ0oaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686831; c=relaxed/simple;
	bh=p1DTnB/Qq1JuQuJ0RZYh9WyxTwwLG4s8EMgB71qlhYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQPZT6jU+5+XC+z9Ray6xUSAoyvvC23pTNq6PCNvgUQXEv+m+xqrjNGCF7cqBGVX5jl5QoT3n+xHVIiaq7rf6Ok9x1h9DYzjBtzGq9k5btq9uwVkcNLWw+SQ/+ODysJqXcOw1oXhqji61/gkYj9+PVobEKdxLmDOPhy7Uxn2RcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d76T49Lb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHSLx5yc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJmAxl2576426
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DdP5TbkC149GA0FALd9E/e3/
	ojBpNA/aYkFJbl++16A=; b=d76T49LbrMTmJhm9EVksq+X3aJ8sP19kIwpRgBbk
	BB0EtVFUF1z0BGTOsp5l0S4eMyBwJ/IHUxuqAMrxyyzuy5eKrIT6FAgLuf6PGaDm
	uL82HuKSZnhWArjRbvU9OSaBUpAFs/5hn1smQ4tVEbdXeeo3/cu4tFjkOC1AlfpC
	coIehlmHJ45V/xeR8upzSgKrn3nrvDUx29oYfDLRxJCrBtq+8uZdqiC5JD1RSrcX
	XiPttyFU/hIQurwPgePCEXZcHbDOIpNW0iri56JwHAyj+dx58ZdyDI+Q0IC5K4qZ
	zrrgT6GQihp4y51FBoBtE4SwfSFnOuaNcEJHEm4QiNu45A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:27:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8916e8d4aso140560391cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686828; x=1762291628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
        b=eHSLx5ycYQtZCmn04pfRrr4fLYuvmi2vVLSpnmTu3+zrrF8HvkDfI/x8ekl6+gjF7r
         RTMxcZPcQCDk7vSO0OPMOWkeMYpaeb+CN9wtK1895WvZN9ryiUa6HICAJfQtSfIccjII
         6G/xpGYMOBA/35l4lPigeW3EB0blisdJXlxksTIlpLuqiG0UCzRxL9nwO+tyeJN5tGbr
         +9x4jloH0cBOeYds/v5AsME3ctIiDQ2aNnhXldTj8f/1nCxXOVEUj3inK2KF1SUEI+cY
         R1O7s/QzpsWg2C1LzqEhDdMf90ICq5fjQnDzzfEr/qRbrTWMf6tzuNOaRzaTt6qHIF4y
         Q10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686828; x=1762291628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
        b=bXTQKUgWvKfDG2dC+rDlespg25OG5lQZSgWyrftsiDzF4yGYYRpjy2KKnpvuOpsrkG
         LE2OW4lqg7DvHaxMM3KIQvIAGl4PQ2Q9fRJzWOMb1YNZ9mdkE5X3w4BCecP7tqmPDyPe
         58MnBeFVbn84p3Axb/dhqcunc1iN4yHLsU7+sY3H7ATVE2Jv9+bR0MckzUHRoepE34+7
         pciRtYnZtIAtu3yrOSagrmiHfRP7OidUg+I1yPeXHMRJqzYZ9YONNnu6yP2sdiCochrP
         MNX3QD87juDM4Zt/AMxq4+YxtQX+ywZBPBaYTAzz0u7txGYJZiC0eSGIGZj1erXQVybD
         SGZg==
X-Forwarded-Encrypted: i=1; AJvYcCW6tHJ0PrT3PmfrvPbj62b+X4Mepe6DwLUCdl+cUsy9Vrnw3kRtV8jETnbVQ2HqrDQu1O8tlrN5vwTO1769@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZHONfB6w4GHkiB9arta7/Z4E/HxqcO3eWkZwNPjiX46SOLV2
	8jWrCkBAt1GCiuUXUJP4XHHNxKNq6QiA6VTS7NY8rcaPsI3Pe72jU1hph4GwlY/BCRu8HyUhlnj
	d5syAlH391NMlIqakbbuStcEzJcX7RhEsHxJDehcOEr+nJq5Ua1/cktCXO+B63/0UDElr
X-Gm-Gg: ASbGncvaV4FUwFTcnOMkgIkrqHkYiB3I5KgXQXj2T2bvQ6UFzz8Pyih/YRK70YGcbtb
	Kxn/L/2ne5bo9hGNWWTkMYxf9l9tESgU5KKXqKxqKLkIgvJdHDnH3bxvzAcfUNVp1Y+I0ib60AV
	v1h+xPDU4VjkbG9YGfeTdfIwAYEbwrLRHIHMOkJKXuOhGFEZfXHkY76V4tnpmG490qcCjoOMeiO
	azbvVBTecBx+lP6ih+vVZmsyUFG8AtpKPJY9EzZ1pj2Tve4nH3OtDBmvfEao+d41yGivNiyTZ2e
	S3QPfYDVpC/GKaOCVBXs0qhgOShM06VAXym9EfeAn0y3ypKq+u1y5HRGyI8eMEFAtg14hUTYua/
	SEZhjFbM/eeTVWvj8aJzxB+aBYQ+r2u4WCb1b51do8ckyEfQRx+4kVO/9KH43BmWksVaL5rNywH
	UxhCeLJtJVNDC1
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4ed15a23867mr9720761cf.0.1761686828558;
        Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxR98KH4P1HlcjcBcumSx72Dky53bKX5MRwlk/e4bOdqpkMOYKmt8VJoGyRxf3ikIXyDRIA==
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4ed15a23867mr9720451cf.0.1761686828124;
        Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41c3csm3332734e87.15.2025.10.28.14.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:27:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <jbf52sfh7vpefhla3vonerfu7jyvja3erlpf6qgq6pa4htxtrp@7qxlchr2phyc>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MSBTYWx0ZWRfXx8wf/eIqC+E0
 L4lvAgBoy5zL+ADV4V+gMVmGcIWJMheLslSDvCBfPBMarjnooyizk364vcKxPdROSeZMFSnrPtv
 znwSBKTbuSTjOYoLGWur8YZLZrE7pAT0MwdiqCwu+N3GJSxbhPJeDuk3NE0vUNRyuLD4YaRdAiK
 8R6FTIq+IN4R6JI+otL19ZV3RaRabjU9w31+sZzupUP3wiWGbCCsaCRDe9LXpk8aQrz58FSf0FO
 xoEHO16/GDwWnnoRYd9lZAVzypFjN/Jb7kiJj5fadTBGJ2PVSu+weH+BF17uwGdP7jr4F11FKwh
 yzVfetkJpRP7P0hM9SmS8CpppF4+cY78ZCMMkCZ33I+XnrZV/g+ZQdG1rYUnpmxe/rKZyxRmK6x
 mVn/cCwzxMvhJ0iKbHaRRcWUGSoDdA==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901352d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pZynYnP1OLevh1U8Zuey_itxFC8BnImJ
X-Proofpoint-ORIG-GUID: pZynYnP1OLevh1U8Zuey_itxFC8BnImJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280181

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Does it apply to all QSEED2 platforms or just some of them?

-- 
With best wishes
Dmitry

