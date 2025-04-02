Return-Path: <linux-arm-msm+bounces-53045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A50A790F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41D8D7A5144
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1998823AE6D;
	Wed,  2 Apr 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzKwPnSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51223875A
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603552; cv=none; b=cI6io/O8z80Twb3Bb5Nivw0PkhLulCTrhZ6+8xHM2ormICNBN45v/hPhYPVfPNEi86UF6SfbYTQ0AfGdXTYOFeiW4Tdci+4JrhIXltSIeZ/c6G95tDaD4+CQ7QqIs6JSSjUM7es2TKFFvCe7WLkh40y4P/14YomsCk+OiyCsfok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603552; c=relaxed/simple;
	bh=Iv9KIspycsPpFIrjdjpQH7rMBYKoABLZDBLXX8Pi1m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEsD3NuAjqzN1rXWjdGFpWyWf7FYXSlffe3TfZhPRrZuQjF/fvRB52jWcYKeqZcA8v09wPtFIs4RSIMVTzGb6Ui2vBIVkHgeBpq1XE/tRPj9WTYi+dP3N78c7v21jzV0yBgAO8O+HuALI2P0TMjp9zpEoRISHY155eC2Sf86CqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzKwPnSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532C1hBs024534
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 14:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lg2SSIflWKzsNjHH0yMEoyV
	MVATrSnMyc3UcY37Ync=; b=XzKwPnSkuXaN5BjDpe29/7huBfGAIzL5jrqN9ObG
	JcWeZk9TIDjV292XawvH0RYQ4w1vIxpg0YWqOem2bdtQdwFpvxeZiU3fgvMU061I
	p3zlMFVgwVhhMnluu2Yq4UgcFHqYBWWp10mZcJtAf27niaS1RpV9wvCfwsK6szVH
	K9HIst9aDXcJGWPo76GkLtcN1G9nEes6HWGlEs1zjEpa4U2gR3F+fWr7BhKqpW33
	PP0EQBvdUQs5MnUREI12S78fodeBZZaQeZnE4Nd+dZsr8BZNPicIAYbXjSJdiTgL
	7FI3uJZNLI6xRzn03bExIrFF4c9EUA+rz7PhwNa0DNsYwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvqda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 14:19:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54a6b0c70so638660585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603547; x=1744208347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lg2SSIflWKzsNjHH0yMEoyVMVATrSnMyc3UcY37Ync=;
        b=YWFc/AnNKY9BNbbBO5nD9x+KoWN3yKIiVpB487uJVT1NJisaEm3XP6zjNxbxzzyfs0
         yB6aj6DVcgGoWIMSx2eLl5wJdWXPJSkmnpOyBQkFNTB83OWpuXAg0/hYAX8FHgkzcoGD
         a82ewG1jY1B4bFakXywqdOTme/bdV6KRmYuez06MvGffygHXVy6RtwxSpRYKAlNqrUTa
         4o42fs32DAHct0gEhSDoiDXJZXG9oRxML2MTSLjSyYxgJfaECNy3tyH7Y6MD2fQo2/ZB
         aK43yUuFXl5FQrjVfN7fZMGkr3adcNXzFMey2N7havhx1kehYePoINt05syOooAsa+iJ
         JDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEGtHx8u4NxXaqK0t6btaUqEm0v8uJlUUpnANAu8lJxXJhGFmZgxcMiJwHC6Pmh6DR69IFLzgUFzm4hd3H@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmOQzc4ZhM9C1oBR+bm1bUuJSh/hcU5ZAn1UUefG75aQ4aUxl
	+W0em0JxRZu0k4E4Ybx0nDMwDdNpAQHzpHK9hkQbgsRdbDl9hiw3CWbpQ+MIQtE9ASTwTXAdbpM
	P/nAe+3NMeWeeshl79sNkCKnB0fQEuau/gd/kYDaOR2wGj1qyEGF3NJvK8JMhEaT9
X-Gm-Gg: ASbGncvf7b0UpkpwDZXgJCNWO43NhrzxexoMiT/WmUHLikM7NPDdojpYJr7dDSgXrSg
	Fg/y0FL8JXaXlaksi84HxFlt28wjhfr6BPMjmor/C6uD95/K2tGWUFeF++/UcmNfnuDrLYdUkpj
	hx/92XD6Q+vlvQ0OZvHoBVZJqserpz/UAFuSoH2o7p63dsJIndgToE5tJ4kXLaLqrpdhLIBvoEl
	czRjieKgKte9OOio3M+0+VWn9InMMciAw0zIVe1HESivxc+wTefcje2j5YvaoaaGzRJKPmlcXnC
	9alb0A/+9nGPKzhqF7shWtZvkaXdabAFmsfMTVJSj8uVHmvOEV4S8LR7dbAxvdRfn+tIvXI0jbG
	g0cI=
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076317885a.0.1743603546808;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGf8XoxRo6CiED/IRIBY/zHf/t+XSXGEYpSCXW0hOzZD/FhK/1SyGdm2DXSeef2sMqiG/5kQ==
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076314785a.0.1743603546418;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0e951a1fsm1428704e87.245.2025.04.02.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:19:05 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:19:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: shao.mingyin@zte.com.cn
Cc: vkoul@kernel.org, robert.marko@sartura.hr, kishon@kernel.org,
        wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
        linux-arm-msm@vger.kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn,
        xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next 3/5] phy: qualcomm: =?utf-8?Q?phy-qcom-ipq4?=
 =?utf-8?B?MDE5LXVzYjogVXNlwqBkZXZfZXJyX3Byb2JlKCk=?=
Message-ID: <2s6gmwdlv5i6uqqrkxve6wiug7g3u54aqpycjftwbpars5poz4@nkb62c4yc522>
References: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
 <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
X-Proofpoint-GUID: zJgFgL-iodIjE_VVBYOOc3uNelTUILO2
X-Proofpoint-ORIG-GUID: zJgFgL-iodIjE_VVBYOOc3uNelTUILO2
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed475c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=5KLPUuaC_9wA:10 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=qROKWDKVmaoWvDy_uEsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=741
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020090

On Wed, Apr 02, 2025 at 07:43:57PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

