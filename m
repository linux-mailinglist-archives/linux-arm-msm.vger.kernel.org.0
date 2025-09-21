Return-Path: <linux-arm-msm+bounces-74344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93BB8DC65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564343A6811
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3734A1A;
	Sun, 21 Sep 2025 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZS3y5ns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D3C2D6E72
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758461876; cv=none; b=LgWLYiE/Tt/VoYtuSJR94RqkURUuPLstTQZ/GR+9PIpVbLoKWNBAFjzfsnOFED22PVH61ZtetMwsNjfE7EJPFTfx/95P+rOyFVHVywfJYmXG3WgFXQdmFMqSaFIf/69wZAezs+uSYcYFfQF1+R70capM4GxnUIBO4trFOLPXoZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758461876; c=relaxed/simple;
	bh=bTGQnIgYPimWy6ZQcJxblWRwhrXSB7WQm/kR4eJDmBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpeSCw5ciEAsP8wCSehZeOcWFJ1gEN7/9dXVyWOx34KGocMdg/vtfC7iss6skxl9LfvXfZ16OmAk2l5SZXAyqDkyXp3tE3wstRdqLA8uPxS4LyRCMkgxTND1MyHqGSYUS+t4iQN3cHelZyZrzJUmAcUY0/NK5HTM6reaUtyu6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZS3y5ns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L9hBkd012936
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MzXDdGjClmWDCq78VMRf8Xa6
	hegZ79/TEvqX/J8Bv5A=; b=DZS3y5nsizOB5pxrdpKaflssDRFVly/7W11LXBzH
	2l3INfkE4Ip0+6hj1QzqS8MDsa/IofeS1Oln107rpL6lPf6QUqwbq0ugYUud/W48
	XGq1z8MhD8CajhT2ZHhCl7qsv0nvAG+jVAbIwAfe7ETHpRAhuBP11sPpGCdqA2XF
	Qx9afXcEtS6DrbYO1w5Iks5cWCQE09DCT14YVXS55PgbhJGDK1hZFTJ4hvs1gOMV
	JO4fU+PW39be+9+vMTocD+5LapHl+rbe2UhbDZBiQAxLoRkFYKd5QfAtxO6+cau7
	s/8+OXfFGC0Vj/DSJnUBVgw8WkXCINwgNqo4b6Vb1rGnFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyejf3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:37:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8271bdaccf9so369900085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758461873; x=1759066673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzXDdGjClmWDCq78VMRf8Xa6hegZ79/TEvqX/J8Bv5A=;
        b=EOEfRR7l4g8LGJhWafpZNi8tbIoJQElMU37SRiNP9diwp7QqID7WqkUQ8zQ2UL7VNB
         PSvEvnHxGcxMKPex9EMNfifkCsXC9pDrP1ZDZm3eYAww7+/9uk5TkGhfkOB8DvSCaJlR
         /L/Lo3hnucMV4D0Xil64tRAsLyMbIM398DZi8bKUJ16veuqf1LxHmwxctgfwBk+hAGOq
         Mr4V2jxOJvF6ZAPlozMw/omGbEk3E+YVBMXImkGb5EPG4Tm9/B7CIfO6is90XVvnsjYZ
         U6/5zPnQBinJNHZnTEZG++SlWRHgrsIBrNsIsbqrg9oNWjGUQtwe9Bg6moGNWQR2matp
         KFJg==
X-Forwarded-Encrypted: i=1; AJvYcCVnNXcWoHqxzv2+t2e8a62XAKC+mKpkpwbfrLf8IJkTzj5kLCrXiWalU/XGPUtaYKAs8rq4jh/4b9EtazW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8F09HqXN9anIDPhwfEkVL/HpAhaOzO3Ki1b7naod4BwDsOYbV
	niI1FwbEtCgVVdXLwZJEOnV+D3O8ZYINkalNZnCahYxoYpY4vUNbefq34VG+x88pT8Kxeq1cFWM
	27tR5nmu3/vBGVrsKzltxBYvL2pWfp7mF6tz50jtP4gDD86LM5XFGFN3G5t2+Li/zGaVc
X-Gm-Gg: ASbGnctbz0O7rV9XiIce3vG2bKc5gbXZi8Fu9RCgb0wG+tHXL6oj+PbsUQ+bCcKL7IX
	3jgn/Itnc2UgBhmj0x+KmU3et2gLDJ7rkbV1VNPEz3hsc3cBHxkDm+zsNG+qjHGzD7kDAD3DqP5
	9Mv1yK/yuyL0fQMRz6Ulto5CcR7MRATVhh9kLNFpM9zxm36VHXYnfKoGiIdQjTrJLeKsBlJCTEq
	Zb9U91Dv+TAwvwAROmgt5OhkpWZ3jicyi8Oawfu8RDLQR6zb3DwYEb3P8KmcXnpI2H2y8SRTD1u
	Ci3b4ZHXaooxD+Yt/vAT74gstnoVbeBuJ/FnmA9629rG7osuyA2BXgC2I5YQgswt4m5aHhp4SLf
	wvEO1a0JndZajBQo/f3CXpRoBgvJdesN8FyQUu9F0q6IKOURfsW0L
X-Received: by 2002:a05:6214:2124:b0:766:30e3:eb9e with SMTP id 6a1803df08f44-7991c125311mr97078626d6.37.1758461872639;
        Sun, 21 Sep 2025 06:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI/3RP1aL5xclEUNdYTTvjt1cYU+s9KR5Uv6gEonYiwIU2diK28Vza0Zx3QnkVg9d6/k4Tdw==
X-Received: by 2002:a05:6214:2124:b0:766:30e3:eb9e with SMTP id 6a1803df08f44-7991c125311mr97078436d6.37.1758461872102;
        Sun, 21 Sep 2025 06:37:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9668090sm2560948e87.109.2025.09.21.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:37:51 -0700 (PDT)
Date: Sun, 21 Sep 2025 16:37:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: dts: qcom: msm8960: reorder nodes and
 properties
Message-ID: <5ecw4onppgefojlzpwmc4dmahe63pl64om2wkjjt4zwg3d5lrd@wg5b66x6g2s2>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
 <20250921-msm8960-reorder-v2-1-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-reorder-v2-1-26c478366d21@smankusors.com>
X-Proofpoint-GUID: b6Rdv3kftCs7ob_-LY6JuDum04Cqfzlg
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cfffb2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=kbTPNbk5bq0GMcXo2L8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX8B1enrlXR5Y5
 Fk9VjVzUzbEidQ/jQVNBjxt28p1yREUSFuaqWRWIYxvnCONoewXcLuDsy36F4vyeXZ3rlFhnkBX
 0R/v8MjHjk5Q4wHoxIr4rDJH7n0rT/R55O9VxMKooL2Bhj3XCzWgo2kfCkHLZz2bjjoWLMXVVkf
 89ffX4OWEnHxHfU4VwYGmObSvk55fHAZ1rOSzPCZbJ+9uIzS+2akTB8C5KA97lNTIZ2F15nGMwW
 nuDc+q0Ven2tUcW10WbVuKRynNybgrBuDzxE8fXfgpr8D328K6QjyN5XjEhsPFgFr29M3iE8CVN
 fQ6jpe7XWS9Utnrdj0A9mSV1zxf7IFjLN1Kld/+7CZcICf9k9KMiAK2d0iqNo/1r9qBd29FdiO+
 GPbvYW4x
X-Proofpoint-ORIG-GUID: b6Rdv3kftCs7ob_-LY6JuDum04Cqfzlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Sun, Sep 21, 2025 at 03:08:01AM +0000, Antony Kurniawan Soemardi wrote:
> Reorder the nodes in qcom-msm8960.dtsi by unit address and sort
> properties, as recommended in the Devicetree style guide. This is a
> cosmetic change only, with no functional impact.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Tested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 545 ++++++++++++++++---------------
>  1 file changed, 280 insertions(+), 265 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

