Return-Path: <linux-arm-msm+bounces-59719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B981BAC6DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3F1167F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C5C28C859;
	Wed, 28 May 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmCwf+/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD82882DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448868; cv=none; b=mrB+vnRZr8inUyZjQuRjPA31z4psbAZzedxQO1025eaKX6h3j6vC0NKIEN+TZ9ryY+nBymUCCF1AiI6jG6kiHq1ZdXHAzZZQGwZQclkp4JOKoI2LAhgV43jBT3WFr8lV5S2BEktYplXTOzRMOP9Ls9rQEruoIzSFX81++uYAjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448868; c=relaxed/simple;
	bh=QJdyxYVj5zDlcJECQEtZD08vxWZcLAjaOvhtB+EnjXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhaHw83adSZ9F/mOp8/Yp58fh7espg2PrAmkrdVHQMjKpS1hqoSYVQlLQJD9lltsY+9yGOa5eRam9Obm59B6QSB6XBjMsABEmw+daov7dM0DopWVd6LL3w9lo2CEuBeMjr38FyIOdhsqUTLYpN0+lhg9n1Cx7cSsWT7oDhdtK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmCwf+/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDsioU013944
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LB6CBliD4k5uqB9EniBQVYzk
	+cEcLB4aVJE1tbd9jHk=; b=TmCwf+/Y8y/kX9iYSyiIi2OD2S9H3JG4G47xZjuH
	ERb/bUjy5JF2WBz6EctGhG8VUpcCBpPFcbSCOvtDeLEFlm90TrdeJbpE0UNnRtBP
	3GmBIZsgU0/KnELrcWWWR1yU3Y8GqOnrvBAiNe76iohXDKVKhoWGgt4arjKEMQFD
	nWLc1xWOOe7ZlBCcVoKXRvOVg3cKV9RfUQPZpO2sb76eA9AQXGpJjgpA1rebdpZW
	z7NiidGLcnd/9zeKsUYg8KqJD1PI7QoZQauFY02doAbepxSbOhwumau+dCvBJmeA
	I7G1RR8lAqJLb1ACsZ2NW3YsKw2x2obsy+kW92xJA9eMXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549js3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:14:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so1470864785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448864; x=1749053664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB6CBliD4k5uqB9EniBQVYzk+cEcLB4aVJE1tbd9jHk=;
        b=OxZ3/nYxXTn8bwuzNrgjuiz4OiNvY+NJLSqcbaz6bLLOLgrJByQbSiM3OoLfLkTveP
         plVmGFxx6rSVBnQQapnpJ79WNSV0IxPPfX8YIRDCsvDDmbNTsvzhtHIqNekfce4/ymrR
         xhymWEQuz2xzcTnV7xOqy6ATnvcWMQtXVwewbf09O4hamb/8bMZxF4YKRYvb4h8LxbW+
         gIim0jcB5ibxJbmdotAbrwYLpsY8N+4xv90GThC9jddUBeC00512txw/OjixLWAGcGlY
         TZg+z4WHaRE/50SrzxBixhOd1jq45XFlHq6S7ZQqSH3w7X0Q70GjxefNmk6jhogNEC/F
         eLig==
X-Forwarded-Encrypted: i=1; AJvYcCW9/mcWv4J4aK3s9hQ5ovq7KksAx6HwWdDAuTrPEqWoZ9QaiEQabDeur6ocGvqfB6yd6oLiw+0Im5UHOqLR@vger.kernel.org
X-Gm-Message-State: AOJu0YyG41VoEmFI80snWPWsGDYBigiRzeb4pP6qdVX+7UHjFX1JEqEP
	+PTCcCKfnDqsNQ8FWTLOfi6xudPFo1GDofjtKfALTHWnv0MkJqR5Z1AjOX9cZPJCvS/3ZDMAuaI
	SvuXo6xUgsk+zYLbCzkV9gugLVJ8DI6ObPE5a35U8j3IJZA8e0D7am0yrzLLaoKm5ijB8
X-Gm-Gg: ASbGncuKHwBAhH4U9FMVjA91tf0hyewpOTpfQ6ACiRoCy7sJP3SZc2AeGeLRyu3Us4l
	c/i79lBCxpetpu84Cwlyd2n3GJL1SY8x0wratKHXKDpAAWkHACPi6g3q2v2SJPcNsNG3QQ5o0Ph
	CxHbzRp+xJA3M88CWd4pzBqxDsglsdi/ON3gc37HHeQUO+1rwHPHVL9VsFqb/qUlxvdxCQOHR+Z
	OELtKpqAl4W9Dqr9WgHL3tYJOseVMdUIvLJeg90pguiCKM44nB6B8wdH1nqfiFmRY0NMLGDM7U+
	ca6YaXfUfzbtr6E7mzau8ZRjDsBVKu5PH4qyKxIr9ryrcSqavzQWgF1HDnDbWfXxRQF4/nnHDA0
	=
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728804885a.9.1748448864329;
        Wed, 28 May 2025 09:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCyIX+70l5Hzm07IkuljfZ0EHSRrY4+nEO5CwtACrM9CunKN6HGzblCxhM/txRHf4Vv+kpQ==
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728800985a.9.1748448863915;
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a89b8sm339772e87.210.2025.05.28.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Date: Wed, 28 May 2025 19:14:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
Message-ID: <5yfyabb7h2xode53xdqowuwfzuml4ytjjzi6tlvzj7htconwtf@456qh5trwijk>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-GUID: gdNuA7P1wrLaIE8R8PA5nFNz43UGLBmR
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68373661 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MkCF4ZN9ME8HeUR9PkwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX/KjZ8Q0uBVeS
 K/iex2dpgbHzvsKLYIxt3e6M+16VsR4XSzajUsunBd439apO6dMP9KiM00g5LTXm35YXt+uX4S2
 j1FERJnNUYFJQhIPG3rsVWD7x1oc1XjGZO15JV1eBzdtgOncE63ymL2yosGRTAFhwLaZYRozxEf
 H9Zqp382BQT0/VqSf3+0zDFlMRXmkBL8mpO8vOffB9nM9qfZR+S5+7jdXZvovFoC9ezHxVwYtto
 CHpIA6Mrr79eI/gnL2y92hfF1IIoT6WVjq5NXXmwtLDX/zQQaaAqU4JQ24L46GaJFLO2hiclFcy
 69J3oV2XoQV44huNe/GssNUxxdkgP6xMn6PhLShkGBtxZ+LOTjny/LBZyVy9MsHK8FhyVs8IL2f
 FFJfEg/d5SKJNF6AauqwJQ+2CRlr+ntG3unFVXmGO38UW+uCYLgNhxT16KupkZLU+XKXC71h
X-Proofpoint-ORIG-GUID: gdNuA7P1wrLaIE8R8PA5nFNz43UGLBmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=678 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141

On Wed, May 28, 2025 at 08:37:16PM +0530, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.

Could you please provide an example of such scenarios?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

