Return-Path: <linux-arm-msm+bounces-68985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BAB24A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 288447ADB52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526862E54DA;
	Wed, 13 Aug 2025 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icnrw6NI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D062E54D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755089981; cv=none; b=kRFsJayTeUDIXjY7tVLeLgd17doB5g5mTz4eF50oPSZGAx0ty51xUT5c9rw/FD7F6nBbo22fn45d6jTLreLy0VDO221m64E/ICj60SeXXmiUxZu0fYWGTJJAuri2lp9LDbXnBLw9HJmKgCLYbzMWn8Q6aOQ9IPZVOpAtZW7V3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755089981; c=relaxed/simple;
	bh=f/sy9Epmv6cLrpeHy0zJxZ/3Him4Xj3h0F/cywhbhT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeMevMQlgYmr8wewVDV6W0eVtnpjSWEcPEABv9W4u7NrcVe0hRWsrvvHxksu/l1hUU5Cdw6tWswzWeWuBT3DiRGtjKGRaKzCx8KWuOlnuHQJirA3PsfQ2EuBHtkJyvKU0JjueB2X3Sph3J3Zmx8LSUpLENjQO/U1NoQ/DdNnrcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Icnrw6NI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLhAB025691
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=89undOGSCm/t00epashw1SYp
	cyoRiHj2yOfvXPYa4Gc=; b=Icnrw6NI3VZBRsPQEIn3O/rHU03NXKW8iaSfsR+W
	xjm7lwQianwOHArGJIew0ymKsdw9+Zge40Fb4e8ZLrR8Q9RagIh4Od+Dv4Ft/Q/9
	Jfl9uTN3Wzx4Py6BSiOWqUv3FofupRi3rpIQLOJNalPZjAecOXpH4nw3nVm3Au60
	zsnrA1agm0TRClxCLwdBJKvoJ6cI3pDHm4FUbpX2XDSdz9+3Y8PObwl3JIxWkcjw
	du/Ctlu/TQiWN5yPHz1m6Jl2VY3caVdz28/kPIlJe1+RPcLNLRD9KWYBdvukpll7
	2UbWeqFFAY3a5zp7XdjzCDbIRSumaBVsYnix3ODCBnfB0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gbshj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06228c36aso86358021cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755089977; x=1755694777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89undOGSCm/t00epashw1SYpcyoRiHj2yOfvXPYa4Gc=;
        b=GFJN0+HT+BPTyrrIs+UbNWPbvob/LiVLzIBvb5kHUmSO/VoRaUuMOs2JfRqLZecyK3
         h2rO/CSTbUIb8ImuSHyWBWBKY2HxhhIHHURZAErnNyFvYN/jbGGpWClczS7pCFdH9AGN
         uU0egTtgwn5um3uHi1SEiR/T/pf4RKM1N559aGjRISTsdaXHp3ciMaHp5H6eurujRxiB
         76ilEN6xntoAnk7tOPIzfUojRhKi3EkqngE1Zk+Ua2X5EzOXGzc3eN6SzmBztJROUfdX
         ZcgV8omwuanufpjd69TnZapAIRKewOBFGZ0Nni8ybwzI28aessy0LO91lDWrFq/uuXUj
         ZaVA==
X-Forwarded-Encrypted: i=1; AJvYcCU6M50eIsnmXGi9eaoBdjXUAP89fetsvGluAo82ebzDkMRXgwOlJDEbZXs7de6XsudOx8quwqC0qohNkaeV@vger.kernel.org
X-Gm-Message-State: AOJu0YwprC4p4DBJFq28IYn5nMjxKqYklOD8PWN8Lwn3whj81qM6/XQ2
	oGLeYC0hfCBrqwcAFuTkaoaSGNx+VtN4pC4g2nSXhyGzsU71UmAzEEXIrdJdMrT0xAki08XbGVM
	lptfn4Kbj0awlAc8OZv6P9xMISSi83v9Ha3nQqv62/2JHdDkLDOy/oU9/2gwuXr9Nu8jI
X-Gm-Gg: ASbGncvISs+IJ3xthJ2ok9BY2NMr/Ut7z6l8sei2QxSeoCKqF7O6lK45As24sDfSBl7
	XmneCAMohv9RzdAfkWBD+4PqJ7EkHVj9rXrix4T9rpnWyeGJQyjCfimubUka9d/MteaPsqqEB+O
	AUrDhAObX5Snbx+SOGA8yFO94GUjv06fBLu9upAGFNslqKJxo/ab0vDzpxuAVNBDBmTJi4a5V8B
	+wAx6XKGAlnhVmSCPOMrDLAzfq8hkCYGMp1ArJk1AofmYv1lb0YO5ws0i+GHUaifWJvMK4AX1Vg
	R9ft2tafjoJOFbp4MseKTvJ4mMX7rMbuxLpz32s371DPt5C3D8RPpk3s8Gm1VfkA0EddO/og7q5
	KiZSldgF6jq+6tYbLPLOSGxg80eoJVo3iX2mgvHjqEaejekKVM1xj
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b0fc6f1fc4mr43132841cf.6.1755089977161;
        Wed, 13 Aug 2025 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYZUZcRFNXr1nwU79ordj5X3vkd99gbFsAKVm6AbEVLEEMy/o0VEZaEaiD7x9HvcpYcqpeHA==
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b0fc6f1fc4mr43132151cf.6.1755089976524;
        Wed, 13 Aug 2025 05:59:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fef31sm49861901fa.70.2025.08.13.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:59:35 -0700 (PDT)
Date: Wed, 13 Aug 2025 15:59:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <ftlaxwogzz72rg4plguaet4wi64pmdfmd62qve4xffamxq4fsu@ytd4edwv6ixm>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
 <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
 <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c8c3a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=bAkpl6uDeKY4ZaPGbNUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX6tjkm+w0QOUk
 wq8d3xXE58vE8Hvnxrx+KQIlJmfQ90a6rCVKQXn30H58y7OlUcZjinMe0m5xROLu4DOdfW8jMJo
 ToYLnw2lEHTEoVSr1FUpBwlE9gRt5aJolCgvU4hldSrDfAFn4gsfS7ZW8Cfw12BwARe2+nAqe7n
 RKg11yD7xiB/WMMW2Pyn1fZPSF4zIpuWgXNYtVVyhrpy9rexK5NugVqg9zdGVdWIoGELxqRC6I4
 ZD29FLeLn3In9Xp4T/QJ8XPPUnL8hkDInGkpyRURSmEnC/J2A7iGKh60+7n0OG63/z8BUEUo3Pz
 0E1tnlGLKJNu1X5KpNZwIbOCynrQ4+roqxiobNK7MZLscy3ocX5+2sTEdt23TTkPJ2KEl+flUcX
 M6pUb3ge
X-Proofpoint-GUID: H69dscKKPl8pV-TwrbJM-1jz6h-_ocvf
X-Proofpoint-ORIG-GUID: H69dscKKPl8pV-TwrbJM-1jz6h-_ocvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On Wed, Aug 13, 2025 at 05:36:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:59, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > dp_display_enable() currently re-trains the link if needed
> > > and then enables the pixel clock, programs the controller to
> > > start sending the pixel stream. Splite these two parts into
> > > prepare/enable APIs, to support MST bridges_enable inserte
> > 
> > typos
> > 
> > > the MST payloads funcs between enable stream_clks and programe
> > > register.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   4 files changed, 111 insertions(+), 49 deletions(-)
> > > 

> > > @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> > >   	return 0;
> > >   }
> > > -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> > > +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> > > +{
> > > +	int rc = 0;
> > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > +	bool force_link_train = false;
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> > > +	if (msm_dp_display->prepared) {
> > > +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> > > +		return 0;
> > > +	}
> > 
> > How can it be prepared here? It is called at the beginning of the
> > .atomic_enable() only, so there is no way this can be true.
> > 
> Emm, sorry for forget this case.. Whern MST enabled,
> msm_dp_display_prepare() will be called from mst_bridge_atomic_pre_enable,
> that means, when second stream called this func, it already prepared, so we
> should skip here. so this condition will really hit in MST case..

Then it should be refcounted. And, ideally, this should come later as a
part of one of MST-enablement patches, when it actually makes sense

> > > +
> > > +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
> > > +	if (rc) {
> > > +		DRM_ERROR("failed to pm_runtime_resume\n");
> > > +		return rc;
> > > +	}
> > > +
> > > +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
> > > +		msm_dp_display_host_phy_init(dp);
> > > +		force_link_train = true;
> > > +	}
> > > +

-- 
With best wishes
Dmitry

