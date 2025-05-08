Return-Path: <linux-arm-msm+bounces-57251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B1AAFAEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0736188E844
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B1622A805;
	Thu,  8 May 2025 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZbZC116"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC9EEAA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709812; cv=none; b=hBHbTLvpnCqGQoKsFtTeAzVbuses135eOvzj3bG5udzYNpeqKpPjlQTxB9TSpLjrk/y6g1LF2Ge6wuofiUbPZocN2tqopReReFmxl5bythLtyPiIOYl/Y1/76vjV4ycNewqeFLZ+2hHOPvZ5YcaDqNSHdu6Es7waEiDZGNgwh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709812; c=relaxed/simple;
	bh=NSnmCCrbTjfcVOSvFX0kD9i/VfDeG5tt4nFeEBWNPD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL3dnWTyGL3lNFsLjc22g75brjZJAq7AmMJtFPyCe/uleNJWCAJSxX/xLnavf668Kn/LbLVekOmqO80Fq3r0XxxWzE+4r0sjgJU0j1e+uMAsvXvPchR//z7LMyWs+fVBrAiFh/r6KcX/0ukMJeu2PCzU4pbKfkt3Shz1N8ysqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZbZC116; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cs3Gx010313
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w/O4EtEjKK+qxbkmtbfvbyAd
	Ep6/N7mvPIzRsQHghBE=; b=FZbZC116dEhg/lCpeG0WMcIP6bTCI1H1YrNIJ19s
	uFrkXgxtEeo/HjdKpWVycc7EuAyNoyML70FQLGC/kjpRpIIthFxRuASfJmIphsqd
	1PXzzmv24l5s505c6AL5teBZm3xJS5Zmk6XgdOAiHojt6VPskIG8i7E8ZVTjU5VH
	P0AxxDhV4D5b0gdbDDP40FWoJEEVGlwDfxYyDzpPthuKVOIKL4kalgQEgkN8Qaxm
	IUn6tbgybzb2bpl7gfK8vrFbElTSAmAxDbywD/Q1boLS5Vhg3vcNc6u/HRs1S6HQ
	vrLxa5pbwYaNSR/xoHN2427k+iTryH0hsKona/Ts8UiYsw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79dsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:10:08 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d81b9bb1b3so7266155ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709808; x=1747314608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/O4EtEjKK+qxbkmtbfvbyAdEp6/N7mvPIzRsQHghBE=;
        b=Mq4V6y9fGltfrANeN/GmWv34nTpcNkmd/UWY4S8yrVQY4bXLMKSS/fAPhy/d5+Lyos
         fVmzz7EeHlePAOigxG4ifiGsnTSGRyv6cKv1jUNY6XARDPi6ughmiTQbfhXTHTixl6n/
         0JQhvVM3Ks2pUnRzPIEQMP0uWVlNZbXXq3IhhuqzZm5XwVdQEdoWIl21EV8bwpd4oJVc
         XD7lP8BDe7xvY7UTSYOxMftDlOgt2PD6CLSgB7nEoYo1UnTkeaH173ncyBjRWBOwU4tP
         0aQhWO7ZAQymG2+hfRCUN2ZjeyINWSxUnFlicp5qhkFcatO/mZ8cuoYu3hY9Mk3f1nkg
         tTWA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ByVm0TOLQvhwLyDTWwjVxeywJd5dxdXlzZHFb3eBHVYEW9C96BVIF1FYFSNbHMnjPKjTuVhgKLHKUH74@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd61EA1x0KzCdaR51jUXNyiXKXYq5WhpnUtJprL5YBT0D14eyx
	BMyWNIJv/azo3njJfHRXKyzRF7FBRNWdRMGLfQsBq7n4I+WkPeQeY3V+MNQhraq0iDqk0DhZIqM
	QrBrRGY29tMJiK6nJhIaEkN3FE+bY9bqVhXtv0t5ZeMRx4eE7h0oXY2kRX6Lpy2M5
X-Gm-Gg: ASbGncs6OfDw0rbx4BfHVqv95kAgANla9rfCXzY1poBwG0iWvZSjyrpdVuh/lKBELJR
	2oNvr8GRuirHePtc0u8n4mnX6erlyfV1zE0CO8yDmMoSymC459pjlUIO4QvBMP8bFSVi3teiCYZ
	up3DJajA0zE8+hXZUuq/70HpqHWyEPPAlIKV6NOz+tkMzDPFwmrG6M3AekPiAidNVuXA749eX/B
	A0t4+ww6om16eKL3KiTUWSjcGMqwKdsfIpqTtxIUETmTpqGxa3D1duoz0CwWf3ywZ63s8jCxKKr
	AG9ChXnzdWpf4teguSfVGdVff3kV4KDgMCyt2Mr0iMPaUinWKDXlhgU+0xLxGfnB+96t5jiFtEA
	=
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id e9e14a558f8ab-3da73930025mr87333585ab.20.1746709808047;
        Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB314junkzcSWTlXKpliaMGOOcVxB2b9W3HBxoMLJhqRFuk3kZ19/VfaMA3FAuObQqYvaDaw==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id e9e14a558f8ab-3da73930025mr87333165ab.20.1746709807695;
        Thu, 08 May 2025 06:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c2d937b1sm71441fa.55.2025.05.08.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:10:05 -0700 (PDT)
Date: Thu, 8 May 2025 16:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
Message-ID: <b4e6kiaxlsth6ix6gxlfgfzracx6sogv6fnm6yu42rbvrbprp4@ih2cgxtyuwpd>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfXwIDi9uHzn+BE
 o/DALbR1uzi/rWu+8UR4aGx90PwTSvaHScueLC6f7SMYhlrxhdGsvSj2tYwi6XjQdVjPOBhtR6m
 EtD/unTyTs0y4QZyQm/0uGPuvolFHNqmf8l9aw82joDV3hIDgGAdC72GxUnRK1cljRRmGjfct8P
 U6tBu5y+OhkEmIZawkb7DtI7KtXSRFSbTR1yL+JLJ9VT6Wrr2aXlYC0jhdSeS0kDlc8MwlvyZNT
 p03jMc9BB+P9MFo8cqUV39FyermBIhpLo7ioGrgHznzY0r6hKzbaNol5Vl4G/3AKyzKAzaYa29G
 LhKlfIFdEdgmhcUXjtIy3MUuMW6hAE4Ex3EEAKCh+4R0jB4yRE43G6pltwLvCkpFhTmKlQLGaXE
 x8CGEfdm/EN3F3HNYjGw0B9rUini9mvdsWr79hDK+93+7cYNxs2nxESmE9OhTl9dZ8k7rfKb
X-Proofpoint-GUID: 5mgGo7SK7PhbphCWz7Ctv4S9baYf1eXq
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681cad31 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMUmxHA0tSjQgQxMAzsA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=8vIIu0IPYQVSORyX1RVL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5mgGo7SK7PhbphCWz7Ctv4S9baYf1eXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=740 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080110

On Tue, May 06, 2025 at 11:47:40PM +0800, Jun Nie wrote:
> Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
> supported at most in one encoder. The case of 4 channels per encoder is
> to be added. To avoid breaking current WB usage case, use dedicated WB
> definition before 4 WB usage case is supported in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

