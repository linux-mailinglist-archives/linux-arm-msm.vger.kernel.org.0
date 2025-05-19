Return-Path: <linux-arm-msm+bounces-58415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64603ABBAE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B03B1887562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594AB194098;
	Mon, 19 May 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3Vk66tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89126B2A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649823; cv=none; b=G/lcerithgimOQqKSsVxnRecAGzAoz2908BySkU5JNGgm1/iZ0BJUtmf89jd14tcu1PwA5E/nOzQdZCudLNHulRHB2KZnweGdSNPHsb/5MxPHXcgqrKBF23QyhssZ+grydKX9xi7TMGn13luBtBLDvdrEKkHUQHI4k1DuD/UK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649823; c=relaxed/simple;
	bh=/Iana3T40X9oEq+80UaIgm+Zgnii4IyVu0CKEuX4i+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m81LNnnTTVrmA/pdzqGWI1UusURN/X9/mGZkbBn4M5Vu4BykWwoZWG94p1Uako5XvMXuWHWUVocvN4W98z7Np8aThZBAhdwANrN6Iw7RGst/+NOalxyQ0ZWQmunOObosk10AhHm4Rk1F7RZ74imr9rGYuQXOKvkCQ6eCsjnMr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3Vk66tE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4EtlQ014120
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=38yFzxzLP7WsusMjcMJPjscf
	7gCZ50TIPoH3b8yCTvI=; b=f3Vk66tEMveDPmgf5+iiE5bbqSNBNmKzhHQLsJG4
	dBmkEHKjeJtGW7OrlNcPf5AayrEQOABgPVAgScYBUpK10FuH72/WCc5L889u9zm9
	H4SujaIn8/6eLeM0RQyF83SJ2IjSKN+wYhysPMQmD00qtItHI1Y1mi5jUQGczcm2
	F0/ZMNBe6LqIrvD+PM7RluaySQeOo/8RdjMg7WlzTD/cOjp3Ssj8P1raXOchwn8U
	REUY6Y4KRsWRx3eAtDf0uR4yhpT9sky48xP7Z14Kc6T76XE2N+/V1YoWYkTAp2nm
	zvtXan7l+7jc93Hnr4ralvO2u3gtJiaO3so8B3z5lA7HCw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh1t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so20794326d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649820; x=1748254620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38yFzxzLP7WsusMjcMJPjscf7gCZ50TIPoH3b8yCTvI=;
        b=hhFbjYvArT8EoRhDcEg9gxtIk0UjswieAjoiPOMgO7+KLD+OyrhpAbvVypziXPZ1u7
         XDyAmzoL4fslwIWFgJUk6+xxWeYTwX79EqO7KBizJATVAoj8k6H81d94mHuGLdGCYA1r
         NmKIWHH5Y4A1Wrsj14v6RTq1f4gaa+pRzzC0CFVeDczS0QQ5Qt/lW/aSM+eIOH4Yb+3e
         jL/Xlh2KQ9sJAWGJ+bUrtSxkJAN0TFs5aGGOmxQN1qLH9TfQq0HxxHRuaq77qy49qFdq
         fmHgB/vfUCTtM3YgfS6JCP45OtqRKQi4VRssMkVv6EnLmwbQgpgAiCN4zN0aixghNzN1
         4VBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDxNbMzfm7Z/1ShsNT3xp63bu/Pr8cp+RSeEe1fAW3G99wgJJHOCG51Ii1ooy4/zKhBZut4AaL+CC2Jyek@vger.kernel.org
X-Gm-Message-State: AOJu0YyokWORIGtowQBtOzVnMB9dexm3XufVZr+tbeCzqJvvzQ0jHS3w
	fmeC2Kif8Kre6UwxvH8pG4B+OGAFlc77FStGGhZnP7x+nob02BJHtt2QvzlZp0CvHEabI+JFZPv
	w6Ulnj39lIE/Cdul2KFZPrd5syt7OaMCQUsjHVle5GrjXO32j6i8kHXKNZoJdi2a2iqlG
X-Gm-Gg: ASbGncuI6p/ATz6AsnAblMum82GFTtHuQs+KBtvZZFNbyqvkBzX4Q/JfOgTgs+bbZY9
	BCY17T92G+20x6fqAXsfPEmqlZRVN7IGpzDEnkGtAd/MsLuaFo4p45UEriG7nbcWDj339iz/66+
	uXUh43eyMpopUlABaxV4T2nzyxrtmtGTArDnPrQEioXiVF/eeNPhUQtUgXAZ32eqW5NrLblQKRC
	T27Ha/3f62S7YkdQgwCQ2crmQ1IKOCC+CfsxuIJPa0B3rs6OElbfiREODtPFOupUZOYMMvoPKTW
	ErMnAzdGsLRDZ+Tn1PKcp2HqGPI41kisEqX8oab5K9RZXAomqWO0oPm8xaQqKoxmvSACA5jfnh0
	=
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id 6a1803df08f44-6f8b087c74emr194929906d6.12.1747649819752;
        Mon, 19 May 2025 03:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+oCZWiMuQKd0V0u/hu5x0ZrwQMkcvyy3CgWC8JSOWfYmSMsneaNA31X6/lkqwY/cjCvhyXA==
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id 6a1803df08f44-6f8b087c74emr194929606d6.12.1747649819411;
        Mon, 19 May 2025 03:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm1787219e87.43.2025.05.19.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:16:58 -0700 (PDT)
Date: Mon, 19 May 2025 13:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations
 to a new list
Message-ID: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: B2bwfFdiPLDPdiDaHsOnhekVB82GDmox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfXzOFgKz9Y2iMv
 okAOdSUMVHwj/05RohvXXfU4vNPg/a2kRkZ55AQsxCWSEOnx+d5y9MiNRgpXN26AY3h+ZgkHc84
 TrvxIusbYyq7fLdfgHuv4wjU27nekVUjm6C4P0WE13K57YzkfJmGqrUXojyRSF5keHx7Cg1emEO
 DMOCxAhWnQ91Wh961sEdw9r060MCzBa3PE5ZMi6bAsXNo9voS9aiOCShJfg3G7/sodDfyUJKqM9
 yIC8eFMwildI9WeGlh7zFHKm41hCeWyQb+xgoVzObfmakgXjRr4dvzJkqyAaaM+cd6BXHfly29w
 JVdZ9fivo77UxeCeKRJhIPTDjsdKELchtJMF2Q8AwEDoyaO06/jwbWNoyh3W6Wiew2SOpdbnwwV
 /+HGPkijXGHYA8vMOOsZmnYksPNtTOWj/hNi1ekpb+4J0v2AQTujWcbOrmOVJ2I35fX7daGj
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b051c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S1xa-9Qv24Ug1fQ2RIkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: B2bwfFdiPLDPdiDaHsOnhekVB82GDmox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> Remote heap allocations are not organized in a maintainable manner,
> leading to potential issues with memory management. As the remote

Which issues? I think I have been asking this question previously.
Please expand the commit message here.

> heap allocations are maintained in fl mmaps list, the allocations
> will go away if the audio daemon process is killed but there are

What is audio daemon process?

> chances that audio PD might still be using the memory. Move all
> remote heap allocations to a dedicated list where the entries are
> cleaned only for user requests and subsystem shutdown.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 

-- 
With best wishes
Dmitry

