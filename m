Return-Path: <linux-arm-msm+bounces-64844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D81B043D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F4387AF853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6038225A2C0;
	Mon, 14 Jul 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNhQqIjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44EA920
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506730; cv=none; b=olK3zCqpApDSTdGJYggNIds3GOQOmjsPguZRjNXxGhFE2moAJAWntnYl8dw9aAfeiI4fOzjTZEs//Grg8m1NJp7DrMajxG+58lrDAiqtahNJq8jS6htOdYDAg8tAP4tV9Md7SCwyFlskVoJrEsYGx7AXYKDoJorNPgJdsMF7KbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506730; c=relaxed/simple;
	bh=LX0PbzwtV+UgCJR/jUcWjRadb/XE4XitWxSuw/c1Bzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eae55B/c3FjGbdXF1wnvZc/phIbuguIrupPSye7GJ+aIJ+Wv5zWjZtO/hz2fCeHTmbM915+XVm2I7gWjvhYt6lKgyTmLcJm6KNWaEOxis0CcK69NwU3ZAZ/TkSZaocDlY2PeESxdomwnLf9Arq8D6Xh8D59z8EkbIKnar+GDnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNhQqIjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA6MC7021038
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=; b=kNhQqIjoc5cCmRQ7
	wdc6TlBQ7yruYBIu3W+dQihuwiFn+tK6s4LmFT0vP4gI2Q1PQWK9xiVEVvN1HFnf
	JBou7nxc43Fg3nl8pLI1ta7dTzm5nRspNy0P3KOlsD1nu9CpxIT+ZbWgKyCyYrMs
	fPRJlB5TOlY7F7uwC+4hoo4zT7ToA9BETKyikjMRlHoXc8DltnFt2lQmQ/m/zJbe
	DaZcNUVamVB+VoSCsr3Q4LdyQX3tXnbEyNIfej5VPAnSfd6ektwxfHwOxL+NOUKn
	92seAj5xxzqlrbIVpkhLpwbKfiJYbUTWnZCAwbuu5ZPZyBRq09Ktx4T8Pa8P6aTo
	kfZmEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmw34t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e190b977b9so227859185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506727; x=1753111527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=;
        b=oTZT1GvPqfrvXqYbIda0NQBaTnaPM2FkYWJGQ5erLHdqsEnRxpMy2nji1CUOFcZZgU
         LSlP0UUakyCPGS2Zz2tB/MUcNL2OhLOR3zbOMby2nNea23nNOfJehbCxIJKyxnLPnFrw
         Iv5XlrIFqETynE6ZfDcqy3wg3GJWqYI1t2H33GPUFbTqfyAOrYK/ov/OWIfe+30XsORq
         kL9I9IdGHTUQq8pP9DiRyw9kpGb/oHx3ixyVwWWA+kmNI0M6GpsCxSW+/gQNrTg6oLAW
         8EjBOOkmIyYHPToxt3hcs1qPADIVdh3zhS1yOjMTFuIKscvrTz57GtVzdtIkeYUjpVL2
         Ddjg==
X-Forwarded-Encrypted: i=1; AJvYcCWRMRG1SQtS1iqvKsKPtJbH7MjIQIKl4BwF728YKYSy52qMGl+reXZlCgZ7Ybj7lY09HYS0Qe2cy4JHMPDt@vger.kernel.org
X-Gm-Message-State: AOJu0YyoL3XpkGlChPCBQDw+bWpOM3KGlMEza/wqC/NSb3XkEuBKLYB4
	s+oRKbr7TdCacf0Gb5kIsAW+eOLfbk2d1rezpCepzbBwDjqw4VdZiuGCagFSFBq0uMxOKLxJuOO
	CmtWIaDW5aoUvQHjBGjx+BnEg0T2JuXtK6j3+2a2cOiMLYWIROOmzj7gSy+zAMQtrsEDN
X-Gm-Gg: ASbGncvp6QXwRZqLV1bQSZoGBVgjoL3YP7HGV6Jl+9Ib9aUj/v4Mfk2HNC54QSC6Qza
	XO0trZW5UM/uR1k7reIAPSZw0JyeqTzq64L4q64AUM7uUJ892/gRygeWgXxbyM3HXBmIyenhLmh
	p7LirAjIVI26n52f4SU0RQDpb6s9AYzUopKlFWfreB5vjYGQIFih7ccrfxC4Qqlo1N9c0fpCXHl
	MO5lqDMmLM9JM9eiVtCC1r+WvLbkKN3tKMTrmjD8E/xarfcONsb5HSQPxZyqoXmrQzmAWlNIWOv
	F6cN6KlcaDi+7vf0v8+hAbO7n/TvMyM0BC7Uq/G4XX8Eyd5RxiGYhr1DpFwDpR6xajRs79M+yMF
	IfVAUz4zvQtMuwG3sX9gV26n5oLhPOXVYl7IHLjxu/wl2zS4NScXd
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id af79cd13be357-7dcb8aad0d6mr2168476085a.20.1752506726644;
        Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwZ25/ylUQ3528GkME7MJF3ljBMaRtFCayAvIoA9pqD+T/SbwujgEb5PAw4osLJdBxZhSxNw==
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id af79cd13be357-7dcb8aad0d6mr2168470885a.20.1752506726150;
        Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b87bcasm1975359e87.250.2025.07.14.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:25:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Mon, 14 Jul 2025 18:25:24 +0300
Message-Id: <175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703125027.311109-1-andyshrk@163.com>
References: <20250703125027.311109-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gOPqTcy68_bi7ZofK7frnR86z2T6Qk4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfX9SXNUr2Y2b4x
 Yb9uk33+zPVkZIcRwn88TfHV5Mmh6ZRiLlnYV4Z52LJ2axCFZeABaAWqKz1sMalu+kESRSA+8CI
 dNWPquzdJYpuflQVL9XGXx8wVrM3Po5McnTGOHrQaIqIZL3SuLwdM+5D9Dm6c1kn0oe2ILghk1l
 +pZYppX9S4QW5NKL9xBTHogjQUc4Th0NRh0Z+j/f7BihJ0TVy0cdfR+ppwh0mt0HJm39jG5co+W
 0DTLqc/5DTbEgumNOoHwjQvt35y86mIKMSjxX1Tr8G0+JCMwjjlNMCVxq5Fz9OvD4mYc3cSBjhJ
 3EcgFfw0Ix+TyTL+P6EWzV7STvAgNHDR1AHrLcnDLnGVsUlfMxFV66yztu1BK758qbF3IztZW50
 qXiJ8+bwAcdiDi/KUaj7n1nTpxnBw1P2WkEx39DP6AVchI0VLkVXq5p2Yn/eFpSYCrf9BvNI
X-Proofpoint-ORIG-GUID: gOPqTcy68_bi7ZofK7frnR86z2T6Qk4Z
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68752168 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=0YRiGFPyvPvEouyWwLEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140092

On Thu, 03 Jul 2025 20:49:51 +0800, Andy Yan wrote:
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> For example, we may want to call drm_dp_read_sink_count_cap(which needs
> a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
> at it's connector's detetc_ctx/detect hook.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order with get_modes
      commit: 02bb63d1a59341032b8e7e4021e18d044bdb1786
[2/2] drm/bridge: Pass down connector to drm bridge detect hook
      commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1

I fixed the building of cdn-dp driver while applying.

Best regards,
-- 
With best wishes
Dmitry


