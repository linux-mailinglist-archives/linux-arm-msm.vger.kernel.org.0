Return-Path: <linux-arm-msm+bounces-66587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A83B10D8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43A93564AC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D4C2E2F05;
	Thu, 24 Jul 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTQlTXti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398822E03E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366976; cv=none; b=AQlUumJjzX1L1/5+PqHchU0rh4KLx7pOY15SPLqgz7LmX+mj0xxERBB8B1q5u3uoXEo9ItwWgLZwhuhyZ6fTI+1uDJ2K1fZjcLLdqiuDvgu4qiiNPzvFJV6gPRV+HadVtUd18IzNN95aTCKv5FpWY2CSUHaKTjD60l/RVCfslNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366976; c=relaxed/simple;
	bh=1x33KPEWr8P0rzqhURp9ysVQkhvrTi4Fminesw/AZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXgTfYd/Lwzc9tIHaPdrsseaGFx9sAKxWOcJ7yItNHupDcpBQI2W/1EleM/MsGssYx0YpUP7V7Bxjebtjf/3V4Zgx9PdJy8z59ZBm3D/Snl3AQh8Nl23scXNxTOjzhu0cTVTWiKQ2weFHQOvkX/S0migjwjApzSCX+ewBbu2smk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTQlTXti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9eYJc005774
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FrqC3/J/0jX5Djcxj6BpkANa
	qeAZVYVDIG1wzxTG5QQ=; b=BTQlTXtiws+5aEIPPgDYv+c7XG42ityBA64UI/cD
	XEn87j8pSrLhoYu3p6TkfPR9VKA31zpjiPoigJmIm7K7mN15PC5mpQQy8EzaZk5p
	qYdm3jiGKFtqur0tgYzDJzul9yfxuD0PleSeUy8crSJ+2OtVaCmj/J+m1tlBwnnX
	YLbvEF/Td/GWIWWTMkWNRpsYAwqR43+wx+t7jfx352gZiUMT6GX3kZAKjKtuU8w3
	V07b0VtF6TISk0VlhhhocfvDnRbuO6ohXRflnlRtleBZSS873KdugljOdYNsUS0m
	HqelNn7PGtyWac5TJl/ineNc2eP+1pB/mDKBPsVd/kwkJQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qh1eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4f178a95ad9so1035686137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366973; x=1753971773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrqC3/J/0jX5Djcxj6BpkANaqeAZVYVDIG1wzxTG5QQ=;
        b=dUkD0h5ZqaQCzGlgVzrBAqDBcnXNaHzfSesr859k3u0AfVoB/UuYjNuQ210NZaam7j
         jFd4pEMVLhfkEBHixRV3jyzuKy1XY3z+mAfpbgUO5FGVT5G+sARZwiEjiBGFnvhFVfoc
         I5lEsSz87oGWxAC8Wc/+VDzlmchFPlJOQIg16McdoQ66M0QWj0bFJ1dJEn/MOgtOc5zb
         iNVBbxVQ5w8YdnCDjSy/sJdo5lGfnb14fj5dc73tcdpSgLNcPtyrK3RQPXIHgH18AUGD
         yeG4jB6wJUl/MlxVLUviSTZI9DzrzsVwepPLpSSXk/Sxhb8y/3UQjx5Cbo+FH2Rn2uEl
         zESQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPPk9krC3KlUKaO70SbdaJ0307RTJQPZaHgRyIrrYre1HIklHmgBTj8g9I4w2vnt9A9qYGY+Fz9rRIhF6b@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBe3OodMkdBKsg8yeLUXIwKhdUeuSwL4JTV/1Z6LJdagLRWQa
	HNrw4UUxz9vwAhCay4z1fdcQgl+1IDA88caZn7yaFi0qFxtnPczHazkTyaXp6XkOnbVE9SUlLOk
	fItPzTMuZa+Uk4ydhG9suhDa7xp897Mtm+0J5S87zEX7qyD/nN+Ea1+ad1l94XzWFwrzI
X-Gm-Gg: ASbGncsBf6nKlPHcdOmbVW5z60aw2ttsF0uT+CQk0p1HOx3dRk+NcTECVj+uaXx6Ogt
	Iv4wUpWN83UNJWSg31baTCJHPGemuskeU4vTZwoq0sfKjWyWWvdbHn+2fQIAsIqEmvc2MV6/CNi
	6Alt1U/mACmx/GvINduS07xXwRv5j3F9IAAA2TMBYzfs8CZJ4xgOM3hy7BP7kMzD4DwdP+vLAHD
	5Lvzb1VCjoD3oiCzDwqW4bgGvzFjAh1DrITo49eiC6ia4ZpxtFHRB/8y0eP4Ws6op/AtZVkRIPo
	EqTO31A0DIy5G7dBW5pHt1Gp5hrcCtqPuHh/K7U8UaWKUb/DVUxn++4hh9dOpGTv3EkaUsbJDsO
	Yp7nbep40cnT/3Il/3HfoIYcpp184zp4OocBMLTs7gNn4ZGRnFpQm
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376534137.9.1753366972671;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJRpdPWtOGNZPazY3KH9hmRCknrLNOq5//Alq4jYTQJIKkqY+VBmq1ZeiOKV8obh1Keq8aFQ==
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376473137.9.1753366972140;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e0913b38sm3202801fa.79.2025.07.24.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:22:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used
 include
Message-ID: <crqc4pklbvykswdza7favsjszl5zqhfw5obee3pnfakwzzqot6@iuxugh6illx7>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX0TroWn941m0J
 JMVU6sAJOv8k4GsMVH2Up6FdUTK7DmyBdYwXg6EUWB/sigKqRvVnZXzjjTFQ1wv6N7r+eN202+Q
 9sXFyRSJelL7TS8O6iTlTyl3Xd+AJAi8RpN4wmYMaUxsloqR0S1yrjM6us+au4WfD0JZinaqeTm
 vFy/mops8v1zd9or0PYEHXkgEzX5c2mKXFw1VHnYKorHxI+wB5mSdWZ3K2CjsCsnx5VFbkBOVLs
 qpy/J+TdVwQe1zi4PoF8kDwKQfTaX0Zg96a1z5+a2Lkl0EKBtM/goKWu3Hz43y1INlPoWVQR3lk
 /54nWTaUYt+MSVWrIJCCmKmt92eUeG5zIT3MtTtilZ6onip9GSRZ8ORTQFdOEn1RensjM1mVV15
 3GEdsMz6fD2Mn9YJa0GTHqsTXYK1ZIdOeqb5gYS0usfwlODN6QrPj55TEcwQ/R0yRVglzhW0
X-Proofpoint-ORIG-GUID: 1AvdsUTI39abNY1dnJ0Io2An3OvLXym-
X-Proofpoint-GUID: 1AvdsUTI39abNY1dnJ0Io2An3OvLXym-
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688241be cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ShgW1BdH4RjToGz97RkA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=801 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:28PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
> removes it, this also enables us to cleanup some of the dead code in
> kernel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

