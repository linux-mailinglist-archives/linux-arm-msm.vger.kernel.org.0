Return-Path: <linux-arm-msm+bounces-102496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fl9AASz12kORggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:09:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933013CBC61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D08563002326
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6C22D6409;
	Thu,  9 Apr 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm52allN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJQiQfjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506812D97BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743744; cv=none; b=lxR2A9IGl9NAOI83un5JiGYz+WmIkYIol65JtV3WejmUqI+REe20Nhn+OSr8wBFEx3kaSkctYSNLch/PY2TOanukvg7RTqNv+x7KiCv8UO+5MXQ1EfUISRb8VMGNmJu0OuaJv8sVVBSZL+2TNsB48jCywnRwewYyLtWCu9ij+Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743744; c=relaxed/simple;
	bh=Te+dAjgLm6WJ+fUJv1EZiSptfqMkwzI5lu+IHmAuKzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FA9K2ghJ8mgySrdZhQFnzHDulSt5Rh7/Ba8yAaQoCPkkxtaBhRzq1sGtun0ftjC/MV7iC6QJO/pBG+e/58ixXySMyZoKe4bNYiYc9xuvtNaIcvFogdijMkGNKSZ0tC981eZJYjZvtKK0nN/Q1PkRNZiW1VyOyb7Da5gs80sy1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm52allN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJQiQfjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1RjA1972539
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8SeYI2HH+TOcscby5yEMg4uX8MuiyiTC9YAhHh3YQw=; b=Mm52allNlQApo5fc
	xILXK984YiYpKW6k3ExklMpu7uOzIw2gZy7o71m/xUWtTfluJAmyTc6ETuJq6kE2
	VvfzJyavTmw22FXbY+qmiEYulQIhYH3EKAndBrSYR6vmqAuaJjrXdgNyzzoCgc4L
	K/lmNoEM45VD0zP7/WrL0PUEdxvN7scCszTcXPHWReVhmO97watMJ7JFGBp/Hjmm
	0Rh7cSalhtmVnRnLsvEwv8ybSMV53whdzYJLXZQd0DUtw81ZQNx1X09/S4T9dfFU
	n//j6oQn49VEvArSFUe2DzF6uIvQooMunc5CKa7xOChERuUpnmoQCbigdCTSQrqu
	H7FrEg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms07je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:09:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-471618e2082so594220b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775743742; x=1776348542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8SeYI2HH+TOcscby5yEMg4uX8MuiyiTC9YAhHh3YQw=;
        b=dJQiQfjPGQkE1t1E0X+lrG1OITQnM55U3zHm4mCqS6p0VD6LVoMTC3U3Kr3MSgzIJ1
         mTWDgmjH3iJ4eoqevZhFFP318xhyluFt8TFxeZux34yAIKICFg1Pd+IkeWIzbYeC5Z1w
         5YaEBI2UiZ3vqj+PxZF3M4fuyHrPjq+ePa2F1wJUAv36OeyFhbn+zKtlWH4U5dZ1CnUG
         IajxMrSi0GTmlJhjX7+tR4amqp9tSamJiW1gt+rilS+NfDyummGr3W7FWhD6gjMZbOyV
         z99sYgWDAUvW9Yxij+z3bJsPnJGXcgR0g1YEDzwoF/6CPdmx7r23YwJ/bteg2BX1tZ8+
         WQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743742; x=1776348542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8SeYI2HH+TOcscby5yEMg4uX8MuiyiTC9YAhHh3YQw=;
        b=buV2B3ZmwZ1g4wy6nnneyASpBey4aOxE2WLAMmqFEGiu2Pga+IP/mc1UQ9n4f2/D1D
         X565FNOejXkVa4ZSeYpM7U01VZFCi8qrx5g/uaTIXGEGySYTBW8DtupAWZGxLNI+Qn6B
         LJ7qAKB3yehNzgnUQ1MosjWyyA2MVdHyiJI+76+fp0kOBl1A2c+Ua9o5CM5GiLl3lb3U
         lafAeJhzAheoydDHgcpeJZ3hM+dtcC0O1jfL8k9wb03P0jURnIJjZsx6rMVri79X7ZtG
         blH1MC13QncCd/o+rZXZZYhFq3JCD4BOP5hkm1Gy/EzHjw3+jsymgSXYTKGQ0yS6b7Dy
         NVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZa9hA92/F127VC968bBNjn+sVXHfVFcwtmhhfQ9j2JMYXKsOCsd2PhiLqVjmezCvrmKaj9xfBbdjbwFF@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/s9LMqvfqrsLVktqVaOd8H/cF4l2wVoXT+eAL1R6CtWSALOX
	MxEoQlobZV9xzJYGXvLnsIhjHMyVQAPOIbhDw6z6QyTkTetQKnP8gS89/Vy96RqT5HzWuuNID7j
	ol1l+ev122TZAPL0MMQ5mgyW7G8FmTYTazI+k73NeW97tV3vue4x57zwlnXggbfpDc1cK
X-Gm-Gg: AeBDietDitwXxIc9FHOmpx+0efe8RiLUSwcZXt2Vvni/dUZUin/yhDlU2pnym/piNWc
	sOUioqjhTDERrTjwm3ZVPCZ6KCc5Dqw7Mz/cJACvoEcs5bhNvZEpRcZD1eYlgYRUrM4jf7TMEiG
	xv9mkpA1YpeTN9D2jbuBIk0wworEoSIvFkOLfF7SqWpybkr1NjNIX84ycmlo558KVaWQsDw3qea
	gJLxWDOKBiSotCWEWCK2XNfMU/h3jrQBZ0la5rJiFeC82RTtFm/Awowi6rB3n4cpobmSZRvTPUY
	+HMJdvtJmSQb7stv20xIBjQpa2u8AEkJunNVMxMZE/qPUEXpTBlyMjB7le33hXyf8tecrSw5axp
	Mio5H6r0L8tEIHlWuPognBpTiiK10pHhZu4SPHHDwYIM1EvGlnMvAMF6aTotG0DMOF16u2qOcrr
	RmihePheTXf0WgA3Rcgkk2UDs2Ccl9dhTFi1c=
X-Received: by 2002:a05:6808:c183:b0:45c:925b:5848 with SMTP id 5614622812f47-4772407f243mr2025435b6e.45.1775743741705;
        Thu, 09 Apr 2026 07:09:01 -0700 (PDT)
X-Received: by 2002:a05:6808:c183:b0:45c:925b:5848 with SMTP id 5614622812f47-4772407f243mr2025408b6e.45.1775743741214;
        Thu, 09 Apr 2026 07:09:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd216075fsm51556931fa.36.2026.04.09.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:09:00 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <uyc5kikryyuzzo2seyhqa4syi4co3oh6dxmljxzrvxftgd6pis@ktgdjb56erfv>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
 <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
 <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
 <4cb29e7a-9a75-4f8a-9036-c96e9190b7b0@oss.qualcomm.com>
 <fbca1547-d54d-4bab-89b9-404d97c3c08c@oss.qualcomm.com>
 <4rhd6qlj4jevrnj2zqctqrcbpkvcalk5qmr3ryuk6ewwa7e35p@o7xzhuzfsms2>
 <1e3e0fd7-742b-49cd-b432-da9bd2a0ba7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e3e0fd7-742b-49cd-b432-da9bd2a0ba7b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bY-pEhUF4spsTr4u1Hr5DCyFtVD3_WSz
X-Proofpoint-GUID: bY-pEhUF4spsTr4u1Hr5DCyFtVD3_WSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyOCBTYWx0ZWRfXw2zLqPMU+iU4
 OkXX7oPAhsDSEBoTg6AB0Wa5LlhFrosHcfw1atgSLm1EQ5idX9MtS0Vwri1q2+h3L/kQfbmYHMM
 7IkbdWJe0Pl1ZRKG5K3ivWCCzIQfec2AgqhEmrjZDSJXvsyIvcFBuXE2C4Kjjz9aD40nwKgdA3r
 NEuVpWUpbj9tWfv/9+SlOYbrq+IDe0tCjTweDCU3ad2s2Qkju1rsHwbQrbr3vk4r8a9am3UJ8uJ
 trINAYCUXDnlPcF9RbpxQU86PnrIORnwwZlE2fcYmhaVc7GAAEhv1dHrzZKPjzWy6Ow6NlAZ1qI
 OgN+Yhk4NnS/ZTZ092FxV/V8McFmucOQScY8FpE6RqTLNoQ2ummJqVRgPhPhQLtmwRfAETE10GU
 EmSI5ltCH1jWEk+iDfInRsX5whutj0KgBk0TnIHSszE1rqbL/Yfoq/uOyIoQKI8kl8P/FXll+u5
 HOQHkryLvQ94gOo16jg==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7b2fe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ZGsGAmxQezLH4FZcYqwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090128
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102496-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 933013CBC61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 07:33:12PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/1/2026 7:27 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 01, 2026 at 02:55:32PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/1/2026 2:47 PM, Dmitry Baryshkov wrote:
> > > > On 01/04/2026 09:44, Yongxing Mou wrote:
> > > > > 
> > > > > 
> > > > > On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
> > > > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > 
> > > > > > > Whenever virtual channel slot allocation changes, the DP
> > > > > > > source must send the action control trigger sequence to notify
> > > > > > > the sink about the same. This would be applicable during the
> > > > > > > start and stop of the pixel stream. Add the infrastructure
> > > > > > > to be able to send ACT packets for the DP controller when
> > > > > > > operating in MST mode.
> > > > > > > 
> > > > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39
> > > > > > > +++++++++++++++++++++++++ + +++++++++--
> > > > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
> > > > > > >    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > > > > > >    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > > > > > >    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> > > > > > >    5 files changed, 44 insertions(+), 5 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > > > b/drivers/gpu/drm/msm/ dp/dp_ctrl.c
> > > > > > > index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > > > @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
> > > > > > >        bool core_clks_on;
> > > > > > >        bool link_clks_on;
> > > > > > >        bool stream_clks_on[DP_STREAM_MAX];
> > > > > > > +    bool mst_active;
> > > > > > >    };
> > > > > > >    static inline u32 msm_dp_read_ahb(const struct
> > > > > > > msm_dp_ctrl_private *ctrl, u32 offset)
> > > > > > > @@ -227,6 +228,32 @@ static int
> > > > > > > msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > > > > >        return 0;
> > > > > > >    }
> > > > > > > +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > > > > +{
> > > > > > > +    struct msm_dp_ctrl_private *ctrl;
> > > > > > > +    bool act_complete;
> > > > > > > +
> > > > > > > +    ctrl = container_of(msm_dp_ctrl, struct
> > > > > > > msm_dp_ctrl_private, msm_dp_ctrl);
> > > > > > > +
> > > > > > > +    if (!ctrl->mst_active)
> > > > > > > +        return;
> > > > > > > +
> > > > > > > +    msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
> > > > > > > +    /* make sure ACT signal is performed */
> > > > > > > +    wmb();
> > > > > > > +
> > > > > > > +    msleep(20); /* needs 1 frame time */
> > > > > > > +
> > > > > > > +    act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
> > > > > > > +
> > > > > > > +    if (!act_complete)
> > > > > > > +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
> > > > > > > SUCCESS\n");
> > > > > > > +    else
> > > > > > > +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
> > > > > > > failed\n");
> > > > > > 
> > > > > > Shouldn't it return an error if the register dind't latch? Also,
> > > > > > shouldn't we set mst_active only if the write went through?
> > > > > > 
> > > > > In some cases, MST still works correctly even when the ACT trigger
> > > > > fails; here refer to the downstream implementation.
> > > > 
> > > > I don't think it is a good idea. It would be better to signal this to
> > > > the user and rollback the MST configuration (as in the case of any other
> > > > error).
> > > > 
> > > > I will change my mind if you point out i915, amdgpu or nouveau drivers
> > > > ignoring the ACT issues.
> > > > 
> > > Sure. Until I can find more convincing evidence, I will make the changes as
> > > requested.
> > 
> > Or you can point out the relevant part of the standard.
> > 
> Emm ,the DP HPG only specifies that an MST_ACT needs to be issued, and does
> not require validating its contents. This appears to be a Qualcomm‑specific
> hardware register, not a generic one.

It's more about 'how the standard describes ACT'. If it MUST be issued,
then you can't proceed with MST in case our Qc-specific register write
fails.

-- 
With best wishes
Dmitry

