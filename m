Return-Path: <linux-arm-msm+bounces-82428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DECC6D38E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 671D92A6C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A6927F736;
	Wed, 19 Nov 2025 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QF6UHhWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJATJvBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211022CBC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538394; cv=none; b=hIvtAJZRAtksdkTV+suB/B0NG7hjB0fFJDok/FnMJ6qRONl76yAoB5OWbG1cZf7zV+/+NtREecn7a/sVUorwAxR//rRgjxm0nkwr+p1c2p9mS8jO8Wcwk4xChYCzKtlVJVaiuROoVP4qmADGvIQP6dbLWtxahHk0UePZrg92JY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538394; c=relaxed/simple;
	bh=/asFQ7tnv/0+Cab8k3xgEcTrL40C3wg5dtcfjq+hmcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYb9BLCf4O6juJtAxv/OolX1FlFmLkRZHZlLfFrtMn82VnNM6I79QyUsIl6WnZr48eaLv82f7sCdXsBVgsmikPrCaAOV0fLZgHRybEiYTxm1m4w5jU+Trnuv3B+ha59FFx2WgfyfSHp7xqpUMx3YkAnHRprrOPX9Pmh+zM6PjKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QF6UHhWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJATJvBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XdbK884902
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IBAqYgoC3NcK12CXgRQqeftd
	fh5IwqH1tQpsD0TalPs=; b=QF6UHhWCcN+aqCmp+7GGR4RkddWfnoaHU/QiqDXr
	t/7ypYsPxmOcS/0jY3++STggvrQ0E3nyukWbl1H82WVaTVcEJ1GdIJQ+wCiWHCbI
	gHL6uGKurZmweMeXPhNMxhX6wu8DgPf4bfElMvqibt1nCtPGXNcjyYvzY74zlSrX
	lBZ2+jSajX/lGCXs5ch65TuP2r5Xq9oUIA0Pbq0g9YdEaGzOqPYP5gfJMUK/0Rj+
	7FQE/By52rH82zCHURcafIJfWoEXBwMNfgB1tzHjQJEGMO2kqkkGme2n4wbn3luM
	FYKEwWeUEA7lazWEQInRGDJdARS4mI5RHlX4qBMxuplzow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8gd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:46:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so1061493285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763538391; x=1764143191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
        b=ZJATJvBa91gyI659bvMhjjEjdahQGTs6GLtqY1fJUC/VPCVqvug8aYGgbamlNxRHLs
         xK+LeANPiSC2a6DedHYG6+1h+T4ePD7tsWpfcw1xw6BQVzBsG2qJLWI4642oHSkPX8KR
         GEF9vPG/0zjxPmYCe9A1xM8ORk3aEGrO58LJeWCaU5eQwwKCsGGGG/iam6aZgpQLiBUC
         gywnyxpcZZ+ClF31Gqpt5gPSAWC9YFJLFHcjSg3AA3qZaFgm3oQ4IOEPPrlh1Yr2QIzO
         b4vuQcjpCln206Byb/oKT09bj5JMuu8J4gqziSy1SyJTPdXCbeDG2nOPTQWP6XcLIyXE
         C5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538391; x=1764143191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
        b=ZgPOGNaGJQfvel1gssQmLRK3Cr08mNuPY4wOjR9CD+cVKi6Xwtd+mz3IZIXOPxLtEJ
         Woeyp3h4G5N1NUnT/FDL8xwY0v4Jh7x52hw/EEG+9B/0It/ZeTj7cdJXyvJkR13+gjWk
         SyHUKyn7ydSV11V7wdxs46+cDFvCSu13mgrkWhHlY4jbro6HmtN/r24H7qhLoesjxjQ2
         UcWJgDncEXJY/cVnazVGnpbxkbw0u+1oMKIJFeaIomaSrrCICIKa+mEYiRuX7vhXbxWf
         RHwx6dtd17B3zkgqOXKCPoDhuHBw79cjZv2sFubopL1j/ipiAq44DLF6TE2RE66sEGKU
         NL4A==
X-Forwarded-Encrypted: i=1; AJvYcCVg5H+poqbf7Fva/fBIMxvb8O4APvG7K/vguOfJgdBtE3W3dYt+PylFFUg13lEAouQbmPlsfJPdcekFkXko@vger.kernel.org
X-Gm-Message-State: AOJu0YxrF5vYqY/DrRJiSuKc4ZeUemlzIRaYMY07iS4vFyk3oY/Pjfx6
	o9dYDiCpU4Iqvp/A1dESQMRMaZU1uNLrNM/yLfUlTbiZrydT6eorsWfjoWvC3SnRKCbYYWosGU+
	EzCcRSfybPuschiJGQoHxasJ9OTLpY5Ftgs/KCMC6DUEgcfXE/qPs9AIOngNkJhjwZqnd
X-Gm-Gg: ASbGnctL3x8MEt6H/ZfKxpYlXNjouDNIlTherKuK1cuJDIPy9qUT5ktIXWSbg5KAItP
	6WL5MeBrEbMTugX9SRBkt/lORNdVJi8+6gelQ11gx4qTVhFXZB+tYHzi1Yft4apLWvTZCZ6MtVP
	7nvQFAQJmDlP9lfy15m+60YxsuDIzHvTvBjSUW+RZL/hTo5KqK2BRnl/nHP7P6bt5Ty9Cjvrld6
	cpr26mtG/5H8HJZoEYfjIppBRq9Ap19Yg6mq8cnYtHyMB3ladMjp9j8Z2PSFbjlHlumH24aIPF0
	xbnrSAsqK2Z4wd8jWBPdCBQuVfrgK2tbZtA0suRq2qVLu0O+Eo50AJpcftgjz/UgCWd8EOnYMFx
	1kswOlJ0hIZZ2sPCujwY/9Z5ET45fZuNGb0jEdnJf/qWgKO/6eVhPaN9pupnahWtfF1XGW43liL
	Opv/b2m/IE8LeqEc3EgVWXDBU=
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id af79cd13be357-8b2c315e7a5mr2293268885a.31.1763538391310;
        Tue, 18 Nov 2025 23:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4wmrNSuhZVNftMGwtfc7b79ei9agDO14Bwd4qs6lnZ5oWOxk0tzIjAsylJOdfgDSOk3CUw==
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id af79cd13be357-8b2c315e7a5mr2293266085a.31.1763538390794;
        Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803aca3csm4498327e87.5.2025.11.18.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Date: Wed, 19 Nov 2025 09:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/registers: Fix encoding fields in 64b registers
Message-ID: <jzbpw7arty5zlisrd2m2na3x6birmyrjxc6l2agimagdgq5m2a@2rltprm5bbcb>
References: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2Uc1gb7Pxe8zaGXv9pnjMNtrFk1dgyOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX97Lp3jnWV7Pw
 7JOm2qj8MZcTQGuTpnMEf7UZgoUi4GZwyGDSkRc2OIa7xSi2JFFFDHcVwsIIF3EWsJn2kUl4TQU
 JcC7L9Tsi0715SVSH3HyGacEVWURpd8fhOwMJVo+jnOxZl7Pkwa0a7a5tdzo+B7aULMrlJjZ41O
 2Wz7Wn252yhe1M56gk52mx6Mui96gZFpWWyXO/9DjK7fCz996iIQQ/817zUn6H5kLA9pqlaygrS
 k9d/Aknx4WDAXvPcoTnx2iKCtqdjlHTsJ0VBxz3aRlb0Cezrt4d9GOZguYNT5JppkI0yzbcK/bv
 nsNFtEpoejdZw0vgVZu9xG1rJD3RSBx1MxORZkjYbUXq+wEr2IKR14v3RZD5hNxpi0kcNqNjzp8
 BgzAG8ROiNpquKLTAQmbU6eO4lW6nQ==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d75d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y2wA3AESBAQWwZuG1xEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2Uc1gb7Pxe8zaGXv9pnjMNtrFk1dgyOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060

On Tue, Nov 18, 2025 at 07:07:12AM -0800, Rob Clark wrote:
> Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
> fields in 64b registers"), but with some fixes to not skip emitting
> interrupt enum values.
> 
> Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

