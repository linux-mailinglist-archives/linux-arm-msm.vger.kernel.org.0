Return-Path: <linux-arm-msm+bounces-51954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9ACA68DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32841B60299
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 13:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4148255E44;
	Wed, 19 Mar 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpX10aXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15618DB01
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391193; cv=none; b=fx6wxkeuR+Q+OOpe6aqOiEvssQBeMf6BLiEqhNQL2SsV0ELnVNLhIdhZi7bhTsm6Xb9IJWYog1kAN39IQBFCy256QqAK8jzcKIy/2aOwlKZ0zeWHLE9GqeQOPJdTSHQFsd2a/L6GvFZOzMmqrkYU4sSqNrdNBStoCtZkxo+FtPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391193; c=relaxed/simple;
	bh=/sES4k8UjISgp/gWMbe6DvmWKaPMB3gKiTxA7xMQG0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crgJwjW28NpDHDAJydu8yFPpq/oXHKiq+0GBMINN9KfjbhLSgEE/uFGJL6bpvJ0dsFYP5UOGCeLYaSbDIvrAhoqXnqYALd1tMeymqN1Y/H1N6Bj01ZsmkUtsZjXBaAlUeZ2ClcClj0X83jh9YyLyNYg2B3ryeJsH5oWqOiHbqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpX10aXo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDV6dk009848
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 13:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L1cwU2n8bj0ukeSke0nD730u
	0joPNeYwiC6zq9RTN4I=; b=gpX10aXoXXMdN4Dy65Ua8Q/EcKiLPWP48XU62keu
	y+b0D38HKwlw7ynKK+lVSNGCV6IZXoEalHSwd/lu9hL69xnoAaAv9iSBvbweYHXx
	YhnLnwiGdek41PlnutY0k4Y2EMW79fzy5JioAIO6tNz3ughggdtX07CpCQYUxKJt
	APeeJ+Dq3ny5tkJrGAPd4Gunx87J4ed3UwOy+AqrAVjG+FogQixCmtnSHApoGSi7
	DpKlA3iYrnGjb82HLpYc5rkQ2ZUafXmo9WTmstGLtWQIekZ6InT3daYEX9HN0lX1
	iFMacHYEjNxVRsUU5jX0MyGakiljq2zx8Yeew3tWRoRSbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxjp31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 13:33:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c17f91dbso1172962485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 06:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742391190; x=1742995990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1cwU2n8bj0ukeSke0nD730u0joPNeYwiC6zq9RTN4I=;
        b=ws1e1hVOsUrpn5omdDOPF5TfU6LmTZJ0nAr8rcpveMOyCEU6p+tC2kjgm57pcPwS+H
         p83Ljm9kA1mvGMmZ8VrrtGMP4DPm1wA3sy/DrpPMQVaa3mmEPvH6BmgRbWEzgInI6H+i
         RDZPTmhQ0PtxqCWeGdffxig1MbBE5zJTeIjvpjgnm3tW4x+o/g0jNcGmO+8c+DmJYMFz
         /1BZbcy7IB8hl5s0If7nchH93//CyiTtBAzqTWhSAoOYDLxCiDLvi0ZldYysvXcPRgus
         WDJiiDlvN9eL8wljaNJdtVdFiz3Yf4S3MG40FUxFxD+uAWZyOPu/Er1ah/tj+5GIUUQp
         HHvA==
X-Forwarded-Encrypted: i=1; AJvYcCVAzT9pnSFUyFh3WG6b0299BS35jo+X64eeAM9z3RYwbhdoDpUuLtRJivh8oOzxBuCsEGSFmXSk+hcyJZec@vger.kernel.org
X-Gm-Message-State: AOJu0YykXhUOuUy1j/aBN+dpl56uH25VDWV38brEHYNvi4BBXay7pcxv
	mxjTBI3Gr/Y0jnA/2uO7/RXAaYwOZsw4OcuOtdMxofuc+f9nwZmLsYEtdWFlc4krO+gVHGGByUI
	UYu+wRte/WeM6ghs+CXtChYWAmUgs/kRvNWhCfKWxTsxxAja3/GHq1eVp4YniHZbF
X-Gm-Gg: ASbGnctYELToNrvqw/yYqJ6whj7UORPAnhA+yiv97bgTTOqcuEtC3gJcvjmuX/74jQB
	WfsFugtV/ttMGUD3KbBceAK2qcAIuPYtdP2s13VWLBNYwrxOYKa10una2+elS6GkaqNerCXXcxV
	b7HA++AbqxmS2VqmDlOsotJBN0HNjYThYceQek3qDftYZQSZHPlgsFw8zStSpylbBcy44sdiEAY
	6w+dnWIkLvnyn38WbCwyMkMRFUEH8lK8rWKJWrlyHmTAvLYrbhXTMl3R65DNFoGg/lMrLTAXrcP
	/THEE99r5WWtMLkYgmp0qQPpkUe73MdagwTfgdwL+HYHAEXhmECnZOwdUom+x5qM4zp5tjLduoI
	Kzu4=
X-Received: by 2002:a05:620a:469e:b0:7c5:6ba5:dd40 with SMTP id af79cd13be357-7c5a83967e9mr360446585a.17.1742391189586;
        Wed, 19 Mar 2025 06:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMWEksZ3Z3ZSMIW+M3tVuDno6if0d5H3pY93bE3ZIDzh2MaZN8fU+f97WH5ZcHA6WCgI16Nw==
X-Received: by 2002:a05:620a:469e:b0:7c5:6ba5:dd40 with SMTP id af79cd13be357-7c5a83967e9mr360441685a.17.1742391189080;
        Wed, 19 Mar 2025 06:33:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba888069sm1932991e87.193.2025.03.19.06.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 06:33:08 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:33:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <hmfvyajygmjoeaaashmddu4rg6ttzn7es4sjls5qvnemykkx2l@zuzixrzkmkgx>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
 <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
 <c6e3b0c1-18fe-a9fa-0e72-d955809144e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6e3b0c1-18fe-a9fa-0e72-d955809144e3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67dac796 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=yba1ihJKBxQaQydNyIEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vXTutoMRDdNtpY_eqPZfacWNNcAc9Lts
X-Proofpoint-GUID: vXTutoMRDdNtpY_eqPZfacWNNcAc9Lts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190093

On Wed, Mar 19, 2025 at 06:24:57PM +0530, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/19/2025 5:21 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
> > > 
> > > 
> > > On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
> > > > On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> > > > > > > > ---
> > > > > > > > base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> > > > > > > > change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
> > > > > > > > 
> > > > > > > > Best regards,
> > > > > > > 
> > > > > > > NAK since this will break QCN
> > > > > > > There is a series under internal review to address MLO issues for WCN chipsets
> > > > > > 
> > > > > > ???
> > > > > > 
> > > > > > The original commit is wrong, this fixes the conversion, nothing else.
> > > > > 
> > > > > Nope. Driver changes to enable MLO with WCN chipset are not there yet.
> > > > > Setting the mlo capability flag without having required driver changes
> > > > > for WCN chipset will likely result in firmware crash. So the recommendation
> > > > > is to enable MLO (in WCN) only when all the necessary driver changes
> > > > > (in development, public posting in near future) are in place.
> > > > Really, these are your answers? There is regression and first reply is
> > > > upstream should wait for whatever you do internally. Second answer is
> > > > the same - public posting in near future?
> > > > 
> > > 
> > > May be I was not clear in my response. I was not telling MLO bug fixes were
> > > in the development. Actually the MLO feature itself is not enabled
> > > yet with WCN chip sets. Any code changes enabling it without full feature
> > > support would result in firmware crashes with the existing firmware binaries
> > > available in upstream.
> > 
> > Is there an undocumented change of the behaviour in the commit
> > 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> > single_chip_mlo_supp")?
> > 
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> -       if (resp.single_chip_mlo_support_valid) {
> -               if (resp.single_chip_mlo_support)
> -                       ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> -               else
> -                       ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> -       }
> 
> The above logic seems to keep the initialized intra MLO support even when
> single_chip_mlo_support_valid is not set. The above code removal is correct as
> MLO support can not be enabled in host when firmware does not advertise it.

Ack

> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> 

You skipped an important chunk:

-	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> +       ab->single_chip_mlo_supp = false;

Is this an _undocumented_ change? I think it is. If the developer has
described that the commit disables MLO, there would be no such
questions.

> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> +       if (resp.single_chip_mlo_support_valid &&
> +           resp.single_chip_mlo_support)
> +               ab->single_chip_mlo_supp = true;
> 
> The above code does it in right way. Overriding firmware MLO capability as done
> in the submitted patch under review is obviously wrong. The firmware used to report
> the issue seems to have an odd behavior: 1. it does not seem to advertise MLO
> capability in single_chip_mlo_support bit and 2. expects configurations to enable
> MLO from host. None of the WCN firmware available in upstream either advertises
> MLO capability or expects configurations to enable MLO from host.

Additionally, from the commit message:

    For the WCN7850 family of chipsets, since the event is not supported,
    assumption is made that single chip MLO is supported.

However the code doesn't contain that change. Instead single chip MLO is
unconditionally disabled.

I guess, Neil's change should be reworked to be limited to WCN7850 only,
however it must be done as it is what was expected from the commit
message.

-- 
With best wishes
Dmitry

