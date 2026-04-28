Return-Path: <linux-arm-msm+bounces-104971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMVRIRif8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:50:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E74843B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883983051164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD2A28C037;
	Tue, 28 Apr 2026 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GezK6A7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2oAJ1dC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160674A07
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375939; cv=none; b=m1+Lys4cwgqxT6A4JBNkohXQLjvalABph76f90byfFTH+tBX35f8MWWh8NF1uHtw1z9XAB5OQoEHg5euqgWXStQngvcbCeqUv2jiCzkUt8qwILSZvObOBG5Tu+pUU+GzQRTJvrMDxfL0gV7gVqKdLrovwekovWB2FpIFBm7WZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375939; c=relaxed/simple;
	bh=hFjq6WTNWU0prdODmAlQYCPplAsiZEVU2JBiamhH9Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1C2d1GNhJCNMSonQKpdXmUSOFoNqOzjbVzfOkk2dmIa/N2MyOcWgm0PlZvxgLdumvOodq0r5x2/a8worxEA057BYI6qRa21xy4u0w0Bcn3zlsm+YFF8gSPdkMKi8zAZNLSLRu0tPazIGlvPToNw/e6o//g9VLSxFHLyindjk7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GezK6A7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2oAJ1dC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vneE1744889
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kneWNrGg8df0C14GIVpb/xc
	3dEydoRSqCYt9jI5CzM=; b=GezK6A7zRdMiozihV2C5gPMjmyGsahgEaroITplR
	pRyXTwnF5bdY+3AwI6eT9eqOqV96WrxnYB34d6SevQ+poLQbcoz515FoViHLaaqC
	MndYdUBMb6P9iJtM5Juy1Ns2sQExkUgXORJ0oj5Cm9NK2D58sWTT6cpEsx1lI3Xp
	XybwrVA1jYbpw0VQurcZlHgayuYkt8eJINLL7NmZIR4zYc8aygI6QxqksswZ8YYm
	UEdLBRWv/cYMzhlI+xpoMEsQKZMDbSgGBjhzmHdHBeTfrEAnLzwc29svQpHdGq4m
	hfBJk1osI8aezaZMYn2Pd631MryRamopXIOLOgQ0rITyVw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8tnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6130270a5f1so15478763137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375936; x=1777980736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kneWNrGg8df0C14GIVpb/xc3dEydoRSqCYt9jI5CzM=;
        b=h2oAJ1dCNNFaPjRTMdlQsnMRBZTYSpdHwxFdwQEgM1f1+s8gBsjry6HkVGqBA6FJro
         PbrBKmjAaQ4UuagomBSr5JOMpC7QMf5Io7lgLbdVll8Q1AbKg14b1tvovigKm5VXQ9uv
         6JV982PFEmD2zmr0PLt0rvCeg0PPC1dJO2TGWiNGyuJqvUwYxrHt7bCKuM1ycxtNiF11
         av+h2xpkWgf43nWr5qDbfCozYcT9X8OCSJd+q/khxUrdEvnf6ZARWeg7ernUVKmliKmi
         bw9DQauIragCI1j14ugMcVUH68fcmp67YPMDWKhhBwZa3IK8UQTwyzPTbqiqKWAfbNIc
         wkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375936; x=1777980736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kneWNrGg8df0C14GIVpb/xc3dEydoRSqCYt9jI5CzM=;
        b=KutU4tKhe43muLC0mxcIUjs34YNE9ZJYOAzNusYCu7bosOsNTWOPagUZMrVLuFf1jO
         7yRPAcS5/bVCYnrcPYh2+RadigBHNtHmi6vVUKHPB7O+gQTijm9cVXAlFSQRg0n7Trmx
         yJlpMB4+KKLtUpWkGfFjgI45qdYPspP6uKjPI7RAtqeNFq9bIVK8tll8JO3hgyGgqIEk
         JRKlvrYkne47y6fbSpw8YkpY2+zW9V+exj8fuM3J6mylMo4Y7aQGt58V3JRof8DfNM8o
         kBchoATln4AhRVR11b/UWj/4tFbXy6tB6+ojrOfmlTlbOWdhXRHY/1fzOOS5Vh6VHfuy
         rIdw==
X-Forwarded-Encrypted: i=1; AFNElJ8cG7v68BMco77/V/uP9ODkWdtg9XmLwgEFKJPxrF3D332IxlhvxDdjbjiIAWR9Y462cGHaqwbBh999qZRz@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiyEU5yO6blDK+HHaAjnmkbQyIIiOFY86lhGE43KROKf521mf
	2JSSL4ZNoafBgRm4SA6PlM7R8aLKX5GxsC2PTBmqYx1QqnRZMtSC4409uoLlpXSa5ZCLRqxw+G8
	M1VVXMVkavQO3p1Ipv4Z84nJJS+Z5dvxpCqeXcqRfpXMjE0dL2Yu3WEs2bNHial78B8lK
X-Gm-Gg: AeBDieubNF6g9ftWT8ahR5OKgE4KZQZ0BKhONg94NnhH2hSrvZD+V54K45p/+kxxsjN
	Nq3hTUSrkqJQj6j25R/OSn08nM+BDTzdOmWC4U8mTaCJ5nlhDZVapiGkrKFVeNCU9vnicgFeiDV
	5ZYWtZ+1VJy0QfNsbQCRFgakG2Z5zmjrhx/B1EgybSCvQhiyf4SVlfU1WW1FnM8qxDJb5yvcBBw
	Jl0SHTpfQsWEDlDIOEZpTYk8X/hocWy3YhkLKWSQMUY207lcMu3zwaN3wcad9lzSJ3/frXeeKkt
	DufDrxzEzDI014fXAzqz88/LNXE026eyl4PR/2DNC16wwCGRlguVQtFTduAlr9vRnJZVAIBno4n
	UsSEVnJXNiKzHGrLnv5k5BucnXd4s8yZ+hEEV1qymX0nt5mab99vVPXQUxMtKWU5E6sN75Pnhrj
	9FqirZ8n/8HJl2eXI+moNay7AdJET3uMIKLEi4IVDF7ppR0w==
X-Received: by 2002:a05:6102:149d:b0:602:ba51:5235 with SMTP id ada2fe7eead31-6280bce3630mr918485137.29.1777375936487;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:602:ba51:5235 with SMTP id ada2fe7eead31-6280bce3630mr918465137.29.1777375936001;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a746408102sm542985e87.70.2026.04.28.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:32:15 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <bwapq6qstctwapmp27t3wo72bzi5fluojzhye55i3fetv3odm3@dzt7336l6wb5>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: LWLJUXG-_El6wvXWd0jpstOGmiuMaD7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfXwxsKN2tBgQm7
 KEn65ZclVRYT+Vw0h5KQf2qMVTz3gwD8ISwPTshvIsL2xu62vzJaBxNUjsBvJ5LPEENSRUVoGnQ
 QqO+FlTE1GUxQAoOIjbeE8x5vR8EBhqAN43WoYNrt+9xURbEjylNaC4HFJD4eszl1DJkF/wvSy8
 SLEgJS96rK4bW2wJApS0qR7rNhhfnDsKGSwpfhMH7MGWTMzpAzH8wUheaHz6dKYrlmfuSQh04Cp
 DLulcleeJ5V5SjrnMFbKA9Ynwo+gZxDhETpO/Kk1BzBMCpmCrnKB0/xplYZbNO6P0zr886ExJII
 2hOkzxhIC1ZQNaMQjehzEXINEM+9V+LSZ6RiZZdML6g573F0FbCwkcInNn+Hf86psfXzTWsOUhH
 sGGkzpf4lbLuP8fpNLzNBdP4KHHUqlxFcITtVQhiYzRMyFR1QkhQJCi20cNEWj939UVGwliyVkL
 kOVQxYpFsZtpK90ysYg==
X-Proofpoint-ORIG-GUID: LWLJUXG-_El6wvXWd0jpstOGmiuMaD7N
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f09ac1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=QV8Ls2YxrGuH4NUGU1gA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280105
X-Rspamd-Queue-Id: 279E74843B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104971-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,bootlin.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:53AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

