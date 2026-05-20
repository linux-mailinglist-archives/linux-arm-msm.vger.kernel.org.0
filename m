Return-Path: <linux-arm-msm+bounces-108659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMZOMIuBDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:40:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2D58AF1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E093C3037DCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5E33C140E;
	Wed, 20 May 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CguKW0f1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ3Eowu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493963BFAD4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269241; cv=none; b=hD5FgAKIzXt2n3FXT0T8CzOoLJ7kBqYUR+aGJtSo55BmTW0i34KZqq/pmiOjgCvunHgxUmpUDWklTX9YmUdp+V9kwVB7IU74Z4yKO9ImqclmV1Ya5h2PKOMaxUJ9U7cNJT8UcMp3dCrddP5oEqG+i+BoBtGAXT8EFJV0Xa62NRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269241; c=relaxed/simple;
	bh=ehDt83YeGQ7qnBVKAIytM3YNKxT8CKZ+DOBX0CGM+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbMDrUAItRGUKoDnqjqfHwtjuzmc4TTJ50XgFUxgyuzRC555euiwdRb6E/Y49+NdwJYIqz9FiMb7dOSKKQRtOPZz6AJuS+PFM6LxsZNSWhuLyOJDO51tOZaxgec9edQH3VgC4Ow1B5IVe4A89ZKNYFibFMEv/OGFLAvb/iZ0UgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CguKW0f1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ3Eowu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K731Yk1725453
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hwFSqLR4fpm13sa0D0efQGvW
	DEFilp39Rn2bMzFZjXI=; b=CguKW0f1/oa9iLjLJAnIvNnrhQ6hSHfeMxIKQ+EG
	/Wz6nw2E2WCVqC/mprBsug77BOw6k8WTP5SlSK4TMcCA5F+DaUp/sXNH3oOdWVDr
	1xqyVTrJoOb+yj1iLjCVO+aawdVvaj4HHBERil50voclaypsElS3cHjnaVsvDWPP
	qzX5P9u06MzPF8U+58EgMJ6PGSbT+EdVFk8UOAFe67Kcn8jSIHwwKjHcM4km405f
	bgXtDBd0ICAW7VwLjH6sBHJiuLxxCE9dj3bmzsBbrADEqGvyKGJZcd3W9uaPpeIl
	j0yahgnCfxLcEuR/BmQPRmKTlG68BcxsNsQH+Mkip6MJQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qm25a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:27:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so135801121cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269232; x=1779874032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwFSqLR4fpm13sa0D0efQGvWDEFilp39Rn2bMzFZjXI=;
        b=NQ3Eowu4vDL8Qy/ZZS34WTGLO/j2Os/DYRQ9H5m2gn+6QRDdSU5nt4MZSwwTVj7UBC
         qoIs7feZcC7i7jesAu97jr02AXRj0AASyFPesZ2JFfhEjjjYP8szAJwSowK+cgi0vVJE
         ce69HSQC8+mnouwmi9oWhT89ePLAPSCfXHMpnM2EyknHcupDbCbu03HvZ/QezRabCrRR
         7WXFOxemk0iOadGdTRjfZzZjRaiXSJZI9eDrIwdqNEM6dxi3f2SOyxHPth9Ee1S86fLE
         qrkcuhKgRtNTPMGyTXvUrILq8SPrHtp1dZn0Af8FekE3dEu/7fzgwHxDoZOeOTyVhzSU
         wP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269232; x=1779874032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwFSqLR4fpm13sa0D0efQGvWDEFilp39Rn2bMzFZjXI=;
        b=C9N7Zyxwvog37sTE9x0oocg1tiBVrlH7zdiATPXAR/76yjw9aiEQ95cq5536FN5c4f
         JeZASTUsPHaqE6z0LmfMGI/xXj4kdTanI/Y+4woCWicYuZj+4N6acyoVHfkYGHOx51yR
         4k+Tlbx8ELYQXr7dtNgZGr3y+7oLx8wyZUvnOC7ZA0si10sm8zU0wAix/6wiLWcbrvxv
         dU5m6NeQVvOeiRyVEdQbFKKBNcrDiQv3MePxp117EhAxR9OAuzC9x1Byq1+mErweuLgI
         p6HqE6xiZJJun3ZzGJvSZG1sVMmzYa/zwrEpOm+WBZzwtzZUOZk9JozppK7OG1D8MkSW
         k5GA==
X-Forwarded-Encrypted: i=1; AFNElJ9jrNJJtjHCVK/xB0od0Z5N9kUjxA5pkb6IntHd32iqRiN/yGV+dPc+kagaAe6mBVjP8eBfvexSvuMj18JR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HoNRt6Tsva1xxkJx7LcZjecaRpfVE0d3HBsKPJDfN3IsFnnI
	7WrWnUd1hccD5RWr/hJsD9LM5PGqQAAPrmMgmdDiBaRhodYsVWYNAQgHpUIP+23AMYO4BIqDEZ+
	L/Pp8A9kr/Qa53UQ5AVRPuvp1PJyKr/IxXkACD1EphbRPL4ajJHRwtZSmJTxG9WRlUjw6
X-Gm-Gg: Acq92OH9vaU0c9E+U/a7PZGSlwl1ZGXbQqt9LI+GEHfIYSSVDfXYJRSu98GekNTaQio
	H0GCkJuV0NHkUv8kLn7QlibutYAk/ZAWPANMwFYawf/lB1jQR/KDBvb27GDqYMLZ5SkK+vbRCNh
	05Pb0iBi3ziSfwSO1P2AI1VVzfxBOSfzNVi6bgKSfJJl5o3swa0dw18ADviAn7TAjUlwbSD+R/T
	ZiLe1AStduy7e/wlgc9RMqt+OsGZGwVHrOD9xM6dojlGwb4skD59kNPEGB+mZReI/AlIQ7SBiSX
	o+Np/45QU7rCvRB0j14kMiBMqpuTrj6eRN4o9JBKqwIMgM5zxat/DvFUWDFPY1tp8TWsyK/Lriq
	oVqBIDuZSPIzx8FN1tS5l3Jw1YYiyIPpl5xT/ooIIvS5qU+ufLYgJZ01LkehTCQYolT7910/mI4
	EqVnlU3GBbAQdjPQs+nAmqi9bxnSl9rjhwNTM=
X-Received: by 2002:ac8:57cd:0:b0:50e:614c:661f with SMTP id d75a77b69052e-5165a040625mr318760141cf.20.1779269232526;
        Wed, 20 May 2026 02:27:12 -0700 (PDT)
X-Received: by 2002:ac8:57cd:0:b0:50e:614c:661f with SMTP id d75a77b69052e-5165a040625mr318759761cf.20.1779269231992;
        Wed, 20 May 2026 02:27:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10ca5esm4783245e87.16.2026.05.20.02.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:27:10 -0700 (PDT)
Date: Wed, 20 May 2026 12:27:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 13/39] drm/msm/dp: introduce stream_id for each DP
 panel
Message-ID: <qv4ytuoojd34ls3mstj7jdb6kqptooavhbnidbnvqtodwfr6kb@qfvqsgs5vqb5>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
 <nzouhzeoimf32nwbm2qjecopildvmlay4t4xxshufsjaydmwlc@bnfom377r5b2>
 <a018705f-13c9-4e96-995e-b358778b0996@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a018705f-13c9-4e96-995e-b358778b0996@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MCBTYWx0ZWRfXwKnsGU03mAFf
 3wP8mt5P9LNDPZZlYgaIg7iaFK7XVdrI8lWCVwMUwbrZKaG/QEXVL5xXpWAsWNX2D9O4/hnx8b5
 pS8CplYcmAnegiaQev33o04fcoUl4Doa52RifmepOK+NMKPre0IOVUimH6etddjNYxzgdiSr4l2
 uMKjnasDfWsfyr0URISUrv2W6bvLSMNPnYVGqxQsxG8irnI5J3M4lS56suyakz/RvI/WRG3/5mU
 JRIWaNRNmxOhClY0e4qthilC4RsmMiKOh7K6yWFIsVW2cgGz6bya30EoaIEHTaEAzqeyb81pMTz
 i7ZqSmghruT6NED3I0CPjEbnpkGkbHScXlpVD/Zgj2FTiBgfmLQUylY5e5LeAjAD1qbVfMQU1rP
 Vqltg72ChYGvrSHfdUIgGgMcWyfeskG3zOI8bdC0NeOkOXni5ZbGl1QeMuHEYl+SCKr2v7QDD4H
 VlSY5hiJFqTQnrCt/Rw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d7e72 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=5QDKDTwAGq_DmF9AEKQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JZcrVm4bm46fYJY0CzfnyNntHfDoGPzE
X-Proofpoint-ORIG-GUID: JZcrVm4bm46fYJY0CzfnyNntHfDoGPzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200090
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108659-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EA2D58AF1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 04:26:21PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 1:55 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:48PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > With MST, each DP controller can handle multiple streams.
> > > There shall be one dp_panel for each stream but the dp_display
> > > object shall be shared among them. To represent this abstraction,
> > > create a stream_id for each DP panel which shall be set by the
> > > MST stream. For SST, default this to stream 0.
> > > 
> > > Use the stream ID to control the pixel clock of that respective
> > > stream by extending the clock handles and state tracking of the
> > > DP pixel clock to an array of max supported streams. The maximum
> > > streams currently is 4.
> > 
> > Please mention that panels are going to be dynamically assigned to
> > actual stream IDs.
> > 
> Got it. will update next patch.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++--------------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++--
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
> > >   5 files changed, 71 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 120ec00884e5..fb6396727628 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -127,7 +127,7 @@ struct msm_dp_ctrl_private {
> > >   	unsigned int num_link_clks;
> > >   	struct clk_bulk_data *link_clks;
> > > -	struct clk *pixel_clk;
> > > +	struct clk *pixel_clk[DP_STREAM_MAX];
> > >   	union phy_configure_opts phy_opts;
> > > @@ -139,7 +139,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > > -	bool stream_clks_on;
> > > +	bool stream_clks_on[DP_STREAM_MAX];
> > >   };
> > >   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> > > @@ -2176,39 +2176,40 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> > >   	return success;
> > >   }
> > > -static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> > > +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
> > > +				    enum msm_dp_stream_id stream_id)
> > >   {
> > >   	int ret;
> > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
> > >   	if (ret) {
> > >   		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > >   		return ret;
> > >   	}
> > > -	if (ctrl->stream_clks_on) {
> > > +	if (ctrl->stream_clks_on[stream_id]) {
> > >   		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > >   	} else {
> > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > +		ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
> > >   		if (ret) {
> > >   			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > >   			return ret;
> > >   		}
> > > -		ctrl->stream_clks_on = true;
> > > +		ctrl->stream_clks_on[stream_id] = true;
> > >   	}
> > >   	return ret;
> > >   }
> > > -void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > >   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > -	if (ctrl->stream_clks_on) {
> > > -		clk_disable_unprepare(ctrl->pixel_clk);
> > > -		ctrl->stream_clks_on = false;
> > > +	if (ctrl->stream_clks_on[stream_id]) {
> > > +		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
> > > +		ctrl->stream_clks_on[stream_id] = false;
> > >   	}
> > >   }
> > > @@ -2228,7 +2229,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	 * running. Add the global reset just before disabling the
> > >   	 * link clocks and core clocks.
> > >   	 */
> > > -	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
> > 
> > Why are we using ctrl->panel again here for the stream-related
> > functions? Didn't you got rid of its usage few patches ago?
> > 
> For MST path, we pass panel to the func. For SST case, we still need to pass
> the sst panel to func, in here it is ctrl->panel.. in dp_display, it is
> dp_display->panel.

This doesn't sound correct. How do we differ between MST and SST in
dp_ctrl functions? I'd really store the panel only in
dp_display_private, passing it as required.

> > >   	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
> > >   	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> > > @@ -2238,7 +2239,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	}
> > >   	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> > > -	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, ctrl->panel->stream_id);
> > 
> > And here...
> > 
> > >   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> > > @@ -1451,6 +1469,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
> > >   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> > > +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0);
> > 
> > DP_STREAM_0
> > 
> > > +
> > >   	rc = msm_dp_display_enable(dp);
> > >   	if (rc)
> > >   		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> > 
> 

-- 
With best wishes
Dmitry

