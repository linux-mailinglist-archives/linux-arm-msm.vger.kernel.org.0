Return-Path: <linux-arm-msm+bounces-74117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FAB87854
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 02:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFA91B22CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 00:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8317122069A;
	Fri, 19 Sep 2025 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbwM6KZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767E1DF24F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 00:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758242523; cv=none; b=BsYg1irImh1Dt8VHf4GtB8xg16ez6d9unzz8NK0Rq9+fY8nK6SIvXr3qJD/ys7gowxESOP4sHdsjolXPcwgYYKQQTXv5he79C5yLQeHYpeqrq1s3tlge0qdH/HsMDB5N6nStkiXUswWtMtg7asV20sLFgGlbBcodpWrVqBgv/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758242523; c=relaxed/simple;
	bh=0EAGajf2cJrbljMoqgZ0FXpF5ehXm2h77xZc+bIilEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqeHGwrwUVf4BDXjtnYJBYO46D+kxlz/VKhMkalo5hF3xVwOkPhk4cxRA0UI/EvST0oMqU6l+Ft+En+KEbTNSeZ1JwJq00syQSZRh11pNbSowqfo2sif1AATMqC2eok5CzfRBlMEA6RSN/w5H0fY0Nm/UO2qjtjJiga4MNtiRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbwM6KZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IMxvKF011113
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 00:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7p3i6sjQr+k5zoECzCA+ef/
	jRyUe4RBthVRq4DMzXI=; b=XbwM6KZOqXzyEz8KzdDURzw2BB7Vu91bxft5NFC7
	x9zLq5LP2nmwrXoz80c1wonccflMEroPzX0qDuWKgegirFU/fri/lHri9hNxIN4z
	F5jGzy/BvQGaUulzCYLbZ9p2qsnuRiq299ObLf6hhzP90mGlSzlusGMGQNR7fUty
	d/rNh95cDabvbOEc42qYYwBva4YqgQh2gTpnUaRsDDmP96XV7MxytIP/dpr7EO9/
	zUSzhY/olZJlzomaKnecIHPGTlxcsYrAXPiJ2ZgdyU49X1b25As5tT8xZX3XpmuY
	uewp+VpwHCOz8wnP9nKc5h3icSQETxBMHkRlIr8BfKKkfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx4fft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 00:42:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-792f273fd58so25108526d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 17:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242520; x=1758847320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7p3i6sjQr+k5zoECzCA+ef/jRyUe4RBthVRq4DMzXI=;
        b=g6ldIwD1kxlnSlSZkFrE1FDF3w1jihowVxsF1qMQXb5m6zrzT7uw17GJBKceezV1Nb
         9g7TWgclwSUclMBOx7vLMhWc7ewo5eyr+oyf7H7c2hFb1gMOgCRsR0dOOPxqWVZ1MbVb
         HHj8qBqWdBSFjjw8qgQOfdnaUzo3f615JuNnhqhPOa5toeqL2+JVx/KX3TTOEuJJXCyu
         ldI0+EVCgmIkfwwXJ5czAtSmoMt3fsJKbwv6FjwCNj6/lHKaKJSGgVYmdyU2rW/xwHDi
         8rewZwdpWAN02uHrcwFUnFRl3BwIBl79gtBX7sjYruvf4esfMu6WquaJY5ApZsLzMVMW
         5AEA==
X-Forwarded-Encrypted: i=1; AJvYcCUcKUS6QX+3fy5P3uk6bsl3VfMhI8oa27ltOHXNwsrbFPENOjpRYnMPlSy62ZwpLBsk99A+X6uIS/HY05a8@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSkmZhmDashXXV8f8sFXD6AlpRzKcba8bqPFC2rBeKw5m9qTa
	WMtVr3VCB0Tlu1AHbhK+Es94sDUxc1ShSxNdgqS1h6mp22+Pjr5jGhcR3423wv81kELc8p14xrH
	oIbNl2igreGsk++7XfdD1KrM5I8ZRstq8SLZdghfD4k+Vf4QB0GRZkEZPyuYPbup5h7Gl
X-Gm-Gg: ASbGncuwgyQksqC9nmmb0xrsJNTIwl64QW+ajBaMUFTdmUABzeNr/pwfBN7KhEjaU2j
	tG7X8zMU9vCzQaqwF7lcpuFFrgOjGzEOMc9Et5K9LCki/wZ8RZN9Lp60yH/b0RpEm+UaiVBv9j9
	LxCWCaBd5WhtFn9xxRTFR6FNoFDdE2aNPdfVTZcIv9hlyBiaaH5NhqtruimdGW7leNEHQxZyfwP
	IR7r0FqH356VaEicaMd6gy7DKMwqldC1QfeQtRGXMb/+KhJR1LYENVGfCvXZBiT58IE0+Z1x2Eu
	LbCeJIfuJ+AlOWalfV18Y7UD7JS+/1JhttY6HKwJ0aCAPuHk3hW9GBWjaOxCN79SVvF0zbwI1fs
	+cD6h5MrU17quksBkXAsrYgktFqgTSh+xry20JjWzcUaf06sNdoDE
X-Received: by 2002:a05:6214:248b:b0:721:7749:5a1a with SMTP id 6a1803df08f44-79912a779a9mr17102356d6.20.1758242519554;
        Thu, 18 Sep 2025 17:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHw7U/FdFUi2wArZIvt0T4wFtimMyyezA0YZtnzCSrMFgWPiguKlZZ7p/fkDAhwAWXS6MQZA==
X-Received: by 2002:a05:6214:248b:b0:721:7749:5a1a with SMTP id 6a1803df08f44-79912a779a9mr17102086d6.20.1758242519072;
        Thu, 18 Sep 2025 17:41:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a6507462sm1052227e87.46.2025.09.18.17.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 17:41:58 -0700 (PDT)
Date: Fri, 19 Sep 2025 03:41:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
X-Proofpoint-ORIG-GUID: J_NJtIE70_TtGryL7Qu7LLQMv_q_E_Pl
X-Proofpoint-GUID: J_NJtIE70_TtGryL7Qu7LLQMv_q_E_Pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX7hBErykzzDVO
 98tYOwzZLmLmqElfA/pkcajR3AOBeo2W2uSpsC21VvCmQV6uvHU/NXHeDMejESg2Z2xhoHWe9Uv
 O9sVQ5ChDsTLu4275jFrv8Rg+jCQrAuVY2U5PT9So0tSgplNUzoBEkKc4oo+w8rLYcVuO/PyrWD
 llL5qQ8Y2svZGCpkJBA73sBpP5YqDT7eEiFwcMr9EQMk/LMJCZsLyEzYKZ5qSFVGihwJxsWBPbH
 w9HAeSE+lg7xT0517Afdizxj3Yh9YDFAoKkAuR3X+X3KJJXyc5YAQi4QEchZWaGkUVSI9Uoqh/E
 9RoAR/n+HwSGwlP5uyvGrX6OyOIIlr3urSRdShGejbgpdGqVLZCmaw6DAFPHfHMvCb8nM61QVqs
 QsnQFFUv
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cca6d8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=SLu1AeIDhlxv97n4O6gA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219

On Thu, Sep 18, 2025 at 09:28:52PM +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>     
>     Changes in v16:
>     - Rebase to latest branch msm-next-lumag.
>     - Fix IGT test failures.
>     - Drop patches that have been merged.
>     - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org

Thanks. It's too invasive and too late for 6.18, but I've started the
test run at https://gitlab.freedesktop.org/drm/msm/-/merge_requests/191


-- 
With best wishes
Dmitry

