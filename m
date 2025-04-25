Return-Path: <linux-arm-msm+bounces-55733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E99A9D13B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 498253A61A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C746192B6D;
	Fri, 25 Apr 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVRulpmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CF21A427
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608248; cv=none; b=sc18Cm3lvsHv3s44z3jGt6WloMdbcVts0wyOuSPWl3WAHwCVbN6dMf1D/XxhTyZ+jBzh67mTP+DGoSAmFvH40tVN0b4iiwo72K6eM0QZOaQZ95GdP3KkTMRhxt0JCIYbibP+BqtT/WiuCQc7QLBLa9yp7opM1T7ebRuJ4a5/p3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608248; c=relaxed/simple;
	bh=a4rBarla8/hOO7uy6LRhAvTU7DW8bfODgiliMWDQ8Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQkA+vRJZ3gDBCdsT8z+0ceoXziDNCOcr0zUA25h+TYhgo2Q4kEFQ+JC9OLVv835hunoosfhuT2A1PG6QpuUGQ7U6QsArfJUxnGazTaWFWq5ZckjLEUtiHN4k2KeRf+tmeu8vz2C0pspkDIuyL9shR22F5xo2mjrvNwzSQSODWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVRulpmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJurR000410
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SK52ISjMMPAwyYoKNjOnDdT8
	tXPIN0birzElu7YYr84=; b=VVRulpmPP9Rz357ZIYahGqWXDWnoImjedTsJaoL3
	guwDpfGCAY28V5D95reMgP7bnrJpO98xH/XBtzQQoSQVX7bgea6NUjedHo5xDrV0
	cDXbOcmQvJR2SEkWlviPbJZhZMyb0XgaPc+oWF2fFplpMmo+FkMLAygPtMPFifa7
	cxPfx+evQc7xgDbIIY2vhI7px8H4N3wMrfwrrTQY+g9GjzFucn2MaU7MMuia7mL7
	65rhdQzeyqDogaYLmhbjfKap6Yr8IzLuCOCodhn4mrVnzxSZzX2yYLdn3/81f6HJ
	fxBr651m7bAAWHkIadXn/xvwPBV18tD+OPpL0dGsCJGh0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j1nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:10:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so468550085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608237; x=1746213037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK52ISjMMPAwyYoKNjOnDdT8tXPIN0birzElu7YYr84=;
        b=BJUyN/IPs0YR+XPJK9ugDUtMvbvdciv0+vtpdz2LhgbokfKyY655aSuXlG8jr0ZJXx
         UKU0ksKQfwrMZ+qx79z+rwh3YsrYqpeiR7WhEaZG9s6Xni33quwQ2VquBwcZ+8De+5wY
         7Zec66HesnlXx7umI4s64Pwq1bOUa8jKwtVt9ww7Nti5SdLrzD3Z7ZqfTlkWi2NjtqSC
         3UemOlqqNvkrQ5vl71vncrk7UpHx69jMODwaAjNa2q9wGhx9wPqsFumSEX8b3ao0BcXE
         XRI6hCgdpytwk6r2EEGibDh7BiLhzLi35URyOKXp4gB5c+LTDfE0ELqoyGY/rhHnd/96
         1JRw==
X-Forwarded-Encrypted: i=1; AJvYcCXYfjEd7jS0r++bKT95Vq5k+Uftn1vajO2SPL2ti2T6867+3/RDtD3FLVrgeNtr60KI8HZcUotGitpKVkg1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RDjI1FrFUL+4SkU+WRdxgl42PulIl4OCtAwIn8WHhMKDGSe3
	ESl9w61Jb1JVz19zczxzWp4A0jmZZJX8a+nKXiOD8TbNKwZzekNHB7gBMV5/Y/+Roo8PPfXDuu0
	DFJKUEW2ynqjxZevTazYmqEpYKXHX0Gee7nab08ENdn63G5qj/RMuD/L/ONgsjxdH
X-Gm-Gg: ASbGncv2HLbPYvJXeKVopqfah1ovCAg8Pke1E5HMQXCPXfVMrkDAJfzkY/ESU8yhV1M
	5ZAeC6k4ietbLFPgVZz8AgQzx+jSCwEnav9q8LAO7Nfgjbj2nyRB8c+iFLCa2oDR+ownk1b0+Rf
	SouXU1S7s4KBtqJx+Tfj64h7Anh+7Vz1UxZruZWadsaScRtp1HNbt20RpBoSU4eIV+Cxfe5oPh6
	bndOvYJzPeVPKYD9yaEjWQF+gnZtWLC7xaDXyayyNa3GSg7Y7mpaELXLuPrXOnbhhpDAWVrFxyR
	kO0QOAeYowoYOdKFHQxp9W+sUqMGX2pyjN0uhFU8noBT1rE1GyLfaUWxQfuvTRgPFXMBQRbdET4
	=
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id af79cd13be357-7c9585c43a9mr1080782285a.10.1745608237567;
        Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7y2gVQYWKUcd3rSgI4jl/cjj7VjTLLTsX7uyEAt1iz8D5sKZWsC2LPXaLmIw0Vpqi8vjwLA==
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id af79cd13be357-7c9585c43a9mr1080777785a.10.1745608237194;
        Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e921sm706334e87.152.2025.04.25.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:10:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:10:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <4isbdbp5z2kr4pnkp5gstridtwv2pyceqfea6lhkxaa7s3epvw@7s3qtp7m6ovl>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
X-Proofpoint-ORIG-GUID: Klb8FSIxzHUDQymDxKF-yZtDyai9QJIi
X-Proofpoint-GUID: Klb8FSIxzHUDQymDxKF-yZtDyai9QJIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX8N0U62L5h8W+ PX/KfxQSExC0eCUASito0qRdd8V45LkWZuUmq44nmJ5EoRKcbcg8HeD+x9mECLm+y1+VMI3bpGs H3lHpfp4wgpWgJr+X2869R0C7HbEFSElx/AqrvW5SJPAheu+9dJB6I6dRR2FmjimmN+0rSr1YJ8
 0uOYTUcYYAVa2q634VJwCS9OuArj9YkQwedAjcLQj/rRpblwQRa/m3Ldvn2mu17wTZsIjX70Qq5 GWCpwkrssTjExOpiahE3YKp6ahE8phzAhL8DuNWy2V6/zkFusp3Lp7PlZZOS7sroC5SAZ/CaZ3q zCEWscMnnGsLBDouXTIPpgY5fK2cxbp1h71sjKEtMpm+pgX6qc31LAVcSLAXmcQsMJNJYEVen+J
 Tv6gMbbJE8VJYreeSIvG+FdBx83jfpNXw6oGaJbcAZqlvZG4fwFieIj5MxFg9u4y2COcpAFL
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bde35 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=M9OHNA7gU70stU2frQkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=661 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On Thu, Apr 24, 2025 at 06:55:50PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/23/2025 10:52 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> Looks fine to me, just one question, please confirm if DP audio was
> re-verified after this change.

Yes

-- 
With best wishes
Dmitry

