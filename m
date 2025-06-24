Return-Path: <linux-arm-msm+bounces-62136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A5AE5A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB3B1B62263
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02563209F43;
	Tue, 24 Jun 2025 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUIKAo9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03317A2F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750732688; cv=none; b=dr4ZpJ6bXcBwlG54t0D8nN7dtRRMqgjY7H9z2cU7OykBY2/OEazI5M9lzGxqguMQHWAMKQezTXZbxEGLbJ5i9TiLzVH8/xp/GZhpyxIE10AIFUMl3P+wML55YQ5HLd/PZIQ0jFRBMNHsHY9VFutb9tKHIJz6uncTkkmDcQact4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750732688; c=relaxed/simple;
	bh=X+F8/Va5MaJsDqMhZEjM18XX25g+AgZMnj5NbJTY2e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYkCiLGVVHXlfKXTPvbjdXUT+OFqK8sVomusAc+OxL5TWddioguUVl/39VRyULoXx+uKBXEmS79G2FfE5BhYeIzEozJC0XAmxB3spSLoOQZEp0wAw4aAAoNFTQW3b+OJN7s18nXBnA3S+X0hSwOrr+dLkg0XYKNk8W/ZFojP7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUIKAo9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHfxH2021620
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdLg2oNfmHMNU0HKZgkFa6Rb
	PHtVFDrUey/Iu/89Txo=; b=QUIKAo9JhqBLFYJdadDzaBuEw3kSDIRoyTKFQhw/
	OxPlMFW5QQF/JYiWfDoSd9X817w3ECKTSYNUZ8urNSfkx/90Jxm+qRcxy7cVODa1
	dW+mpGggyirZqYjOqarrHd36BU3SXXHyV9CQ3rz+06MAiWOAYO9UXRDo2lvv1Sfo
	YNGm74ER7QzTAr76FFrGmtutTjszYSpVn9th5gsuZEs978WMzx28j9p7oN7qfQhT
	fq60WAEhfy6E8hbm5WeazeW5F5mu8/RBAbUvvC7FkQ1zN6AB6Hai8dj7WyeWjJFt
	NPmgEJF4H7KZnlgW94Im7wo+zIV+TSL08rVWCmP5DHXNWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec264s6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:38:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399070cecso891519085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750732684; x=1751337484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdLg2oNfmHMNU0HKZgkFa6RbPHtVFDrUey/Iu/89Txo=;
        b=urLINh6rAODEKzsEr+TBL13OtYF0qki2TXup2fkosbk9RPj9NiCmRRaLtd+NWkut3T
         F/KDjMYHlWkpC/y96o+rGazQI1uAB++V2V/I2eRrRoJ3plyt05quQBDtXFymcnFso7vG
         4hu+qi0OxHtTSfjK9CBcTmGmnOT4J+Bg8+gF8/wdnmYJVJ2V47gEcRn/dzvF5YE+96zk
         SRTGRQeertxDnY1R3sclkLELMtCeYiXf31cuLarZCyds7jCOvj3hWqrHOGOk8tIn9sKz
         W7Fw0S7qeH1VPom5K5IvGiLN8+ZQb/noezwDHMVb+1qHanfPjrTr+QM7JIJAq03fHg7j
         +H0A==
X-Forwarded-Encrypted: i=1; AJvYcCXMiOqgYhXdRBI5MjVTdwIfB4FbsYQ+5jH5NahkVXe/EWXG2fO6hpUNDAUwwDX6Xjg6kh6GOm0BxHOQBID6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxim+I2+NJRfNr39ujDGKOmZXV4kT2stPo/wF9PkjHU2FXG1dBf
	c0iNV42BYp2KbetYiC/+9VyO6URfIg8rGSjLSEkPVBahxH1Jw8PRs45U1qUjaILv0Jz0iQ7kfGV
	ceVlQ1ismsNK1DDdtd6lY7ClI+Mdrx0kqFu1RNpYDEmN4E79N7jFuEAWd8D79Cbp9rhVR
X-Gm-Gg: ASbGnctzZGbq6I2TX2dUAt3ppfR7ekb61UQYvLQzYc36Y7d+1lf7itaJn1lduh19NE0
	dRymuI3yYAqiHVcM9nOGE2fxmjJIDeBuCpAhIDOh6YpEn6bFyNWVtbO0qN0chFw2Eig3waEpX2E
	5fA4WpSk7aCLtoLbJAmriIWFP2T1aavKf+LbxrxHZX2uIwiA5SyZeRgOrR7iKxyJcrjxbgnfNOi
	FQyudnb+8gtJAmNaeK3pdO16aGnpxEB8hZSfuMCiNxK9Sr0C3F3hH0ZopLO3mR0zGrREDV8bpJn
	7s28jSAfL45tTp6aqptDzWGKccSVh2ryGd16EywiHxEdblReliTgDXBfDSkn5tkI1J3Emu5Dw8a
	+rCzIwlytZ4dbcnYNZa9k5xbjYTSrAAakOBQ=
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id af79cd13be357-7d3f995655bmr2433476585a.48.1750732684190;
        Mon, 23 Jun 2025 19:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmk4ossS3aDlAyhYOxoxigRRcdh8Pf6rHbt2jlN0L4Pq1FMD/jGPhHO0PoS7VAEr/X0dOG3Q==
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id af79cd13be357-7d3f995655bmr2433473785a.48.1750732683796;
        Mon, 23 Jun 2025 19:38:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1070601e87.114.2025.06.23.19.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:38:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:37:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <loeqgkxkep54mrxwchvypqr3omogwpdukgvfc2dwuhp3ilxkhr@vtgxbgdoy2gu>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622133820.18369-4-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyMSBTYWx0ZWRfX+tC8qgoR8EUv
 tz/nqkbVysBBQV5T0y/TSpejRmFtH5AUcK9il4PQ7I2esItsy4Oj/mUMl025vYiY6z4gf0WB6Cr
 0OvqBgHjgdCLkq/GesQy27Lx34PA5kZqW06/enfPZBFCYV8DnXbRDoPoZBdhVTzl5da2rpOY7wv
 Eix5Wkv58qvwK79iCnFBhNPFY/oXEA9eB7bphfUtdCtFazb8D/F8RoMLiKAlNnpZsKcVtBu9/7k
 y3H33OG4Vyx4lziClGtn+Xw61GIS8RH5Y0MBjHjP9UCaATsxkeOLzbhc0vDzpxp3sa04BBGAHEv
 NL/p9x/rTn4egU4Jwu0mGPXMz16QYq7pwXuQ4jknh7c5o28AyRmBAQeU5zITUJcBRS6uw6XwrEf
 s7Sh+fL4bcHxdmuTvH9O5dE2w75qrS3d9RJCZTQ+ebyr8gflzo3xKllqWA4sTgNt0Uz1/ezr
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685a0f8d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aJx1-Smh2adsBofQKdWmABY6fSLLQiRk
X-Proofpoint-ORIG-GUID: aJx1-Smh2adsBofQKdWmABY6fSLLQiRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=917 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240021

On Sun, Jun 22, 2025 at 07:08:20PM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. Add changes to support
> GDSP remoteprocs.

Please don't mix code refactoring with adding new features. Split this
patch accordingly.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 57 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h | 11 +++++--
>  2 files changed, 33 insertions(+), 35 deletions(-)
> 

-- 
With best wishes
Dmitry

