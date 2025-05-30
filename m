Return-Path: <linux-arm-msm+bounces-59915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1779AC92F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 18:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848A11BC307D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 16:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA38123535F;
	Fri, 30 May 2025 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmOUYNTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27429235054
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621159; cv=none; b=iv76CCW/l1SwCpxxdnjak8OMJsSA3eQxu/sQVjf9HfEizTJeLFF+wWu65mwMRhtqBhF4DA6jFNbtMmPmyJNGpZJgwGVR82ZdBO917aIW0wwZcjZ+0qcFX1bI3x6SjfToTgyYaTGrAt0fJOYrlC0FRZPSAwGbZv1XKfOoatrnhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621159; c=relaxed/simple;
	bh=JkcSIO6iHR33NZe9IPVii2Kn/Hg2spT5JFFbd9tDQ8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTN293M6xE+Cdykgvgfs/jfyX+Xl3KFsk6NM6xMRnX6WoezeLQUsdAA6tA4fdTbJIUXMDOv5Z+6Ccght+//cJbQbX9vRS3fb9RGUIEGE6fTLzh0GwkL+dB9JmQmMtybY30p9uM0HbbjLQuYBdbYwvjd9b3xfjQhJqZiUa3rOZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmOUYNTC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAG2uA028261
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vyhfcYM3BM8AastlNTmqLFAI
	L5ZyT7xVQ/AliYgV9Ag=; b=MmOUYNTCJOYPwWx3XRLWoM7fXalT2FpW3Qc+Y9nX
	Uq2nD8WWOEql39GzE+gn4o02/qIkoK1KTalNhszHBY5ZcRIbRSIJvdF2y9SRErnj
	nxAUNrmQA/UAxFO/Dy4R4BSWUYgM5H9lz61Uayf0rmRmk0yWkRh+Aja95aTvrEw0
	XpkDQ1PszgUCkcqTotXSXEO+MST0Q08D8ESCDlzhagGAHqI2P+tyNsMOyCVaTGYM
	ktos41Yz0KV83Za99mfqiHUfIMpYtJp8UeKUIwEcFKhh9tkx945W51TMQ3IH4mNe
	9IseNwhQ6pD21p9Uu+FAvYIWjuWxIlRNe6Zw4kS7TNmHDA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yarh11fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:05:56 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2d0a70344c1so1303496fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621155; x=1749225955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyhfcYM3BM8AastlNTmqLFAIL5ZyT7xVQ/AliYgV9Ag=;
        b=hZWQxJBrz1MwwunEzzhskByIPx97ZZTcbH34ZsA4T8t9sKz/p1M8lR1zI9mwdznO29
         z4dDlQ6XMp/H0oYXm4kjZP9JywN63b0q6IpOijdV/9eGxjknGki0K4sCAkRGmt+UpbHO
         0EzkSK8AX/9VJWtzNl/yj4AHBidA2tBTTDnCs7dL5evLJofz4drttdbosjw8d1Ib7wlL
         xH3o9ewRZjGxwIPyCoNPOjBigCsNI+BkYxeFVBmtrJq0DtKhJXmI1U3WXlLMO2wZFmlK
         4y7/cpDqflRl9DsfdfNmmiU5SzLH6hewd+2cWqSjzjJJBWzMmzn0wYbgSm8KiAb6Cfb4
         AnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv9bid4rI5D9uJHmTGEwhwfrVJ87OVFOFEQ33Hme/qt/f2g9tuF9xnlLLUyKQqLZ+pEzA3a49E6gsV8MxU@vger.kernel.org
X-Gm-Message-State: AOJu0YxK553Q8pQeDTMFRGftsKS0bXiaQfkyW7fUGeYqMpegiryAICqT
	zHsld+/uOl2J0+QdwwFEmCG/VbysQvkmMJez8PlsbUdFaJpKI7SxYp4xuqRP3EJed0cjyNUY05G
	TMZLevU+uJD2lIzgDM8ihfM3gJUnx0Sw9ia/j2fw86ZsQnLuS/bOzSoBIXOs7XmU+4S4JYKoQrl
	FlJf4YSt2XkC0ojSMc/8xcO4NjbmKrjML65hKp2zbKUiMEG4LnYs8=
X-Gm-Gg: ASbGncu7nKc42hlntgfHNqK5jOK5Bpidl68frlVwHbtgJkDdlV91t5uttARGQyCU5GJ
	X9thWQ4sTGDLUPyJjkgPrERdJBDDIYJnV2WZ/+YHO9dFzRdd/K18HeXigxKCTRkPXSDrDvGJRhj
	3JrfwS0CPYwH9o/rO8HQAHXq1a0w==
X-Received: by 2002:a05:687c:2ba2:b0:2e4:9c8e:f59c with SMTP id 586e51a60fabf-2e8fce259ffmr3996593fac.19.1748621154819;
        Fri, 30 May 2025 09:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkV+wYfOcdBbbGjqmaahLgRt731ef7AwmWEuaLDL/DIg0abAlw/5A3m2MgJme4BEGi3KUVodwjTjbUCkAjd/Y=
X-Received: by 2002:a17:90b:4c8c:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-312464539fbmr5323780a91.12.1748621144113; Fri, 30 May 2025
 09:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:05:32 +0300
X-Gm-Features: AX0GCFv90vzmgIOYELPB5bdyh5tcPCamKQylpnA6_OeHU5ehZhBHvtxjwgstaSo
Message-ID: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MiBTYWx0ZWRfXyazBqTdUvs2r
 3EPh4rLECAvQTxfv0e4xHfF2X8BkqkP7b79/62EpFzGMASiMmn5GftSPsLy0+I/8E+8Xmoi8cyl
 woc30w5ZvVyccEmPJTgu2XYUQrPOSC1QFH/BUiWoqfLUH0srddOcNcTpubXdJARqPZQmrwad0U+
 wF4HNQ0UgXrKzPkTuuxHt8hJRpoW40m62OCK/YmyojAS5s3aceguN6ERx5q8bP7BbIU1oggtTwE
 eVJZ1AH7uCGTzKKR9R3eihMEeK/lsHubgdba7I7OgTrrskyTvHSagmD+JBe0AFc2DLoWcWP7iuY
 hviOS9SgSW9Juy3cuSgbSNGl39uMRE1wsQCIHOtd5BAgIM+8sg01A0UdUnMBoWZThSW4adLrPws
 Mv0fPMONbsqx3sYKPBP8RfZX70xB9MyV5Ife0fVqEVP9C3RSGAQR7r8e9vfQo/PrL66j5c6v
X-Authority-Analysis: v=2.4 cv=EfHIQOmC c=1 sm=1 tr=0 ts=6839d764 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=EXqCMmvbh7VItr34RoAA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: HChV8c81XsfEc0aXEpDdPEKtwb6tmIQ2
X-Proofpoint-ORIG-GUID: HChV8c81XsfEc0aXEpDdPEKtwb6tmIQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300142

On Fri, 30 May 2025 at 02:15, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
>
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
>
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
>
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
>
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.
>
> ---
> Changes in v2:

The series is not marked as v2 though.

> - Rebased on top of next-20250523
> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>   instead of completely dropping the
>   if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> ---
> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
> change-id: 20241202-hpd_display_off-6051aa510f23
>
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>


--
With best wishes

Dmitry

