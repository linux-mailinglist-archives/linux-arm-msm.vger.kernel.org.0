Return-Path: <linux-arm-msm+bounces-88458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1ED10F46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD5323019893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF1733372A;
	Mon, 12 Jan 2026 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqWbJ3oi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3vwuDIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D2334C08
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204108; cv=none; b=pQJxmuRZfVMEVxSSCYNJlqwjtAlfKWr8VZ989bYMRpElh/9tGrilkKoBrG4itIB/QP6jP6nxQzN3W3W+Tp4SqnYkzb8gpUvg7GGPTCRRXbM2ZDrqGbz3MLThTvYtcmD3UX2DpTUdR0MUqDBEbfeAtYEok9Jf/Y85VYxp/t3rxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204108; c=relaxed/simple;
	bh=K4/ONLlGQDJKotjYg2lBag92g8/QmL6MUtlbVgfhV30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNuvb+scM4C9Tr7HDpH/A9BlCCtsDYi+WdtoXR1SNSFlPXz3hZ2z6nlBDdBgABqKX3HnB7mAsg/0fQzLft2x0rc6c5n9E/3IQ1+Ssd/i5+XgAOioFHDG76Fu7Sn1+MgwmTR/Sty8BTBNEi4XVF5nKSdqfNcTYqgrUxEMVWSMt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqWbJ3oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3vwuDIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7EFJ8526784
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JuB3r/Y5lLhIuiZRcf7qYlhL
	UOF2SFsE6ltBh2xvbgw=; b=PqWbJ3oiqSwLgFWgLPX5+k/+hATqo5Tv2rHvu1Vo
	MOomrSXOvpDHoM3YEGa3XAUZXhFyfM4yylZ2lG1B8s2uAcikSN0NFOE+ega1MZVI
	0WwXqqyfnIJ78U1e+nxaLOiUqIlYimec8HeCWbElyUiwy/N03+3MGMksHrvqZFVF
	8xBevIB4Wb3cArqArhrJRVW5bZP41X85zuXTzDIkEpJKz/B+7ZL9iDb6HKJf+6lL
	t3vPQUr8vRs5mdAPN9XhvLGHSBfISQEnLfNP4KeipInww0f62ykOJcS+rs/5ZHn3
	MCCw1qTHlOpAz84YG78W8/DC42mEgx7/cIakULlS8Tj4RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfuy05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1650907885a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 23:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768204103; x=1768808903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuB3r/Y5lLhIuiZRcf7qYlhLUOF2SFsE6ltBh2xvbgw=;
        b=V3vwuDIxiaHi5G9np4TcFbk2WXmG2pZ3vmocNxNQ+zhZnHiL3am6vLSUc1R9zksy32
         RMvOv/r6PdUNMXjWekbCOsHBhWwGVWEKn4PwU1N/+4NVWxs8EuO37a0HjVPoXravsOJJ
         v4vuepEq04iMyKmVavvlK+tF7wQSKENyHOVw77pFnJasqGVIXkh8BQppsaW3G0+Ozoej
         1YUdO5eBq5PWIIqSA5WksHPkb8xWA+ai9QLV36AOniFLfoJnccsvBGikWbCvDnAv4dYo
         qAdM92Qll6IQwk+YIE6oQkbhAjPexK3ketg3kb+uz0Ac8+zaMb3drI01OvtuW0ynMpye
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204103; x=1768808903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuB3r/Y5lLhIuiZRcf7qYlhLUOF2SFsE6ltBh2xvbgw=;
        b=n+Y4ziws8RbwdV1Fhgz/VpRbS/Jd2MYNpL80FGgsfKN634MeGCpb8Ohudzcq25Kyfe
         hkveZd0gUX+2myNuILzhEAn6akXP6NF92Ks7NpIGaRRwegq/+yuq0tGT8y9uhv3eid2g
         pxaNY/JdEITYaFR2ugSlhg3wT8R84IWbkLbn9+JW5dWr4SKr8/rsO2lCrRHOotVM+Zuj
         EQ/+ayy7JIYLOnwfYTxBrpVX61UlhO5gJ6ViBXcLKnQWzXO6yqRS4Mq7uXas3fbhdm8g
         0KmGLF1URAQ5ONfKMsvnSBfl2LGsFzPNm/2g4j6rcga4XCKDhg1VpHBNEBraS5LvixUY
         U1ng==
X-Forwarded-Encrypted: i=1; AJvYcCWquDUCUlDeUE4Hp3kpF5DAf17ydXhaAJ56NLgxz1lWhchtuYE8iyaVOL48gD5022aDpHt5+Z9fYmoTAZYS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxde67t4ZklyCwwvNOMwwvjFBA2ap0ZXvpZtufFGD7LhtH8iJcH
	XGu6bFVjq/KOYc2xMWJi5ZHwUyagaV+FZcRO8zBFPoyw/PT6CR+jbKMd9EY8U192D+aabWJ1MVF
	Jc/8qRH5BCGgBXmIHCJRK3NadYQUASQhzqPWPezy1iiGZpe4/2d5fHvh9wVcK5bnbJj7s
X-Gm-Gg: AY/fxX6bh8KMWhfM12GCrIwBJFivFM/WAd69ExhpSI05dVdsz0TmjzamBZo7PA/k2b9
	INKght8xCV7OBlGbaZxkaCkI8TotQOagpxEh4Jz8XdFgWjzfzarQTsEivlD1VH5KMbNvo1XuEpA
	4dxEBG1msEIwzSfOfgl3p7/K05Y/XtJjngRKIIf6r/GxvtzNr5EA/hNzUXBYqn2ksMdK6fpC54s
	uDbyb6rWqjB9st6wEbKNVgsoQoqSEQFq1U8cpNzNVUundO9hazvMEeAadZC6VHyM/beRG9iOJMc
	Bi4aXIYQJ2ZAlbtV3Hw/0HbvGtgXCMVLpqSaHBzoZz03+qGu3tMJa9/mKYCGDO1q1QrUsXuGfFJ
	uF1pNuCbzIh+OcIaoHSN1cnipB3jzrtNARYk/pLkfr4js+p/ReQ6vP/UVdz2fKWlLdQlFrUwSgs
	cB1xlsUNoqTq5wPZo2O4fRBfc=
X-Received: by 2002:a05:620a:1726:b0:8c1:30f8:c881 with SMTP id af79cd13be357-8c389368ce8mr2086852185a.2.1768204103188;
        Sun, 11 Jan 2026 23:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIm6sCy6MeebdUj2pS5+5lHZ147IU3S7VxRwrRH4KUM7MSwcRLN7TgNgJMQ3KJQr0fyFtxYA==
X-Received: by 2002:a05:620a:1726:b0:8c1:30f8:c881 with SMTP id af79cd13be357-8c389368ce8mr2086850585a.2.1768204102714;
        Sun, 11 Jan 2026 23:48:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a0046sm38283681fa.8.2026.01.11.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:48:22 -0800 (PST)
Date: Mon, 12 Jan 2026 09:48:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
Message-ID: <lknvr4qwhsnkuaujuilapcpiykqu7n2bzo7dwimmz5gpfklr57@wod3hszretls>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
 <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
X-Proofpoint-ORIG-GUID: nMAH6P6zqOlFh_QqouQSIdEBQYx2tWH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OSBTYWx0ZWRfX71Pb6fBPVakH
 vpyBOqbGFy0rUEZBC8veGAB1HqZg/f6vxlUY7cXXdDn4FX8v3g+iwyd6kqR54PZ6xa2m6RwOhgT
 JIh7SU2yCSusWDCh4GrmcLI8Q22lpIsvYHsATTOpw7g/ewyU4lDnPueDUImj8oYiB4RZ4aWPYDx
 QSOg2yZaputbZZg4fETrPdNeWSoS7ksa95PpGs0T8uXShYxGRNdoGyyFq3mVfs4uaJLY0ZBn9s1
 kHAk97pskAJA2WWYQMyVZ6V6mhotK+yVzF1NJKEIjo8lesjeYit2Cjz3JUJQCMns65pHAiMqNgk
 mMR0v5vM9n3PABGSeKfozXxj6s67j0PooXN1D0RKzLid8qcKuGBgAVwTHD3vnU4VoasROza2z5g
 onoWNQA9Hq33FtXKPQqermHhPu62Ym0D5D5abNT+U61eHAJL/WKZNg0NKui7hbQHfUfvwvCdrr3
 TewJQfFBvJvhTYLjNvA==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964a748 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=5DgrgJxoGKuf3rDOEbEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: nMAH6P6zqOlFh_QqouQSIdEBQYx2tWH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120059

On Mon, Jan 12, 2026 at 03:25:05PM +0800, Xilin Wu wrote:
> On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> > encoders). As such, don't use ephemeral max_mixer_width and
> > MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> > buffer widths.
> > 
> > While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> > there is some additional logic that needs to be added to the resource
> > manager to specifically try and reserve PINGPONG_0 for modes that are
> > greater than 5k.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> > [DB: reworked to drop catalog changes, updated commit message]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Sorry for the late reply, my colleagues are still testing the new series on
> qcs6490.
> 
> However, this completely breaks 4K 120Hz display on SC8280XP CRD, which was
> previously functional (albeit with the clock check bypassed [1]). The
> display now shows a solid blue screen. Kernel logs indicate that only one
> layer mixer is being used, instead of the two that were used previously.

Could you please post debugfs/dri/0/state and debugfs/dri/0/debug/core_perf/*?

> 
> [1] https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/
> 
> -- 
> Best regards,
> Xilin Wu <sophon@radxa.com>

-- 
With best wishes
Dmitry

