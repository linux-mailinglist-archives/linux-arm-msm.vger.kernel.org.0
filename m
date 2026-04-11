Return-Path: <linux-arm-msm+bounces-102806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFQ7FuqH2mkO3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE53E1197
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E29B030193AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608FE3B95FF;
	Sat, 11 Apr 2026 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="endvdPcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3QfUYG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7123BD1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775929315; cv=none; b=QDxeU2vJwK6XoeFhfVi0kzdBFdDgdPstEhNp+QafXTIgTH0jgsz1xy96hNp/einuE3XmeG77UMYiRvkM4nwnnNYJSM3S9xOtp34akWgWPPBV9jauC+CqJat0k93lS3TLYkQiR4vsBFdEeJZ+24JPFvZMniIcjMWqKQ+vZELi2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775929315; c=relaxed/simple;
	bh=DWCja2olfjX3pNId9rCtVxdXlNrwr/iMvJjq3023rk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksLazHZVpT8qwaW6L+fe2XNn1UIfcqCz5CU4j/+YUlZS7UTL9wVAJ7/OoTviodX5URxBgTpuT3v06bcEeCOvk+Lsc5axcYh2A5JroanlqEPGNfCWegx/hX4lNfDS5jIfpupM7+AI3DFjLAlPQy+5nptdy5Gco7EHrKywWNlIHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=endvdPcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3QfUYG9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BDk6ta370272
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VbrysGHXrOK0inQpm0qqZpit
	aC/Alanu0rIpTGm18oE=; b=endvdPcAJwHVmdw3GoPRMCcpfFSUZh96hcB20hFj
	RYplqFyJBBPY8E1bxdAMRGdfo5J+Hd4oQ/kSuyi9Ww9JoZPknaPkZnfl329kKcgh
	W0226fEBjfxzUwPxAGq3iGYJzIUZAweXSMlA6m6wpUHepqcvq8wwOt7K3AKK9nPL
	OQrZ6QSjlQh6j3+OSBBB3kh1rvGptrELEdTz/wdglO09dnhzT9pVnLgAt5vP5tCd
	eBWXNxw1BPNzoyKFtTbKFqXvXnSJVbFU59IRI1z6NYq7Ub2o/KNXZnOGZJpTHxPI
	xYcU0y449yGIW0aacVvUWkZFc/BG+MgSz2R5skOXa5ZBiw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewks5bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:41:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso35135801cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775929311; x=1776534111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VbrysGHXrOK0inQpm0qqZpitaC/Alanu0rIpTGm18oE=;
        b=O3QfUYG923X5VOH6hPJlkfGyAnJiZJNKwS4wtq0d56jxfehp+bsUqF7+w4S9+MTktk
         s7aZpV8rwWwv6M21urkmTouA7AdP7P4wAg8RroeZbeN/0tBUacnu00FbLLQlEk6F2VE3
         ce/0dC7DJxkytrX4TTg9pjrOFjtkr007d4LVkaBSopbsxSxf4IKGtXfKCFdhSXcZfo6E
         NswrahelLld7aNFPDyGlD1yN5zDYZsdkX0Y8jQXwZHVj7suN4h5Dz2aslAfzGb9yYkRN
         vlM9+lQxnm7XlZwVZBhMoFcEEGpOvJHssvaHFFnK64jtlYTXrgg847Bdt6VR04DmoXWM
         d8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775929311; x=1776534111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbrysGHXrOK0inQpm0qqZpitaC/Alanu0rIpTGm18oE=;
        b=jg7blzixJcOX7p4JJuutdEok8xvmZ5Nm4H5WlYHGWIzWp2PhhP0+lr7yLzq9XS569C
         GjXSYmCCVKbaao9RNU2MAocLkHkp8WJdsdjbBr2qz6UohhvW+bokz0cnljEDZnOSTb6D
         MzABkD/Ff0JRxgDqnLsQuwek9R6h6ey6y+jc0hdCywdoweSxKmm8xcWe8r6trAOnx/kg
         x3bjnf+q5WDSXN4aBnyGDOM/tsQoS5s63EJ0ROEPyNI4LzTu/GVIRsbGgOyceJbguEQZ
         rVRW+ENYYtcLL0zjOC8wEvR8jtsiZWo5cV/SAgQ0xcGO3e0WabopZt484nHwF6aFkMjh
         pctA==
X-Forwarded-Encrypted: i=1; AJvYcCWJm0IbL7A7mzLchCOFjX9AqgdJwPw/kKxVY1y7qRuyJeTDiw4GTXZbZrZL1EXVE6zR4pa85xaxeLdkcCzu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrVLHPbGAryqJHxMfv5Po2D182E7ioL0lT/0SpgUGXrEp0+Um
	z4j4fZdERmfzPTSH+Tw4E8SRVUnoWilIQzoUYI63jcOE03gido7Kw9OwXasCM4tT+lk2b14xGVs
	S03/ToIQSW7h9BLEGd3X8OiIWZs1EBSg5Ywmx1vO2CC0ZkyMJMx+UnkhmGwD0yTsBiNcm
X-Gm-Gg: AeBDievqaQoLNqwi3NWExnna1o/Z0WIx+rglcOGMPc75LYXZKQHKUKErZk1Iv7PI+GU
	aOuBN83wn2mruVjzMb0jPqNryWGqKcXnbtei05LInetsc3ZaA3ERARs/sh+p4z+RH6yRCPF3mKH
	vh48K59GGmzEL9LTdFKysa/wYCYcsK/LQzUMVIrnIZmhlfj0l1c3e+C8BsgWSxMKkg72aDkXd3Y
	IMIpSiXXbRxC4ZnWvlAEsS+Ia+5tJQMo74auh53yIEx6v3tzitbtRuFqhV/R0cGrgg7QGI9D28h
	b5kSmernS18b1nHesiMzpczPpS1uVws5lW6WIndIIQQ6BQoxOrepl1XNX2wBmlTF+nYsutp59Zk
	2ogEBz/moWEiUDBp4yRAYqAqm8wBwvH0wahvI1YVkdJxkXZ6BRpy/hY0PAVOA5a/esoYHbzJycE
	5p6+bsKhA00Mi0zYvP2VrZ6zetUFqUPJCtRLo=
X-Received: by 2002:a05:622a:13d3:b0:50d:edcd:4f36 with SMTP id d75a77b69052e-50dedcd86f4mr24564711cf.14.1775929311345;
        Sat, 11 Apr 2026 10:41:51 -0700 (PDT)
X-Received: by 2002:a05:622a:13d3:b0:50d:edcd:4f36 with SMTP id d75a77b69052e-50dedcd86f4mr24564431cf.14.1775929310909;
        Sat, 11 Apr 2026 10:41:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49a4a6f9sm12825521fa.31.2026.04.11.10.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:41:49 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:41:48 +0300
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
Subject: Re: [PATCH v4 11/39] drm/msm/dp: make bridge helpers use dp_display
 to allow re-use
Message-ID: <pekd6eojgv2oayct2kwegrswnqs6aa77huyphhfjrsljueim7a@zaicpcuilruq>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-11-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-11-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69da87e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ImuchgXjfNytqii5F_sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NSBTYWx0ZWRfX4mW66cuD5nMU
 fzLb+burIoVDi+Joc+MTM2yeKt8Fo20C8QgAKjIvKy/a5rPZEq1QOksWEeA0EXZteruEjzzv8dG
 MvtLepodtMTM49fPIE9iM7XOYOkuU1mjol5C5XSCuqqc/oJNc2F+2MHByg4w/iGPJoTiMEHWoKt
 JG2VcFJqrc+FWlCcgac+gTn6gkEo9XJdoXs9F2ukd0jGkpXCcier1opMUc/fH51DkMbx/RRpV3C
 geswTb6tmSXiHGVc6fW2OCGCm4hFCNzZfJcSyrv3T4wKebMjiJ5t4ew4iP4TOvqgL4N7Bs9ef9S
 yvOi5DZpdLsISiKA13A4EEIb+CfDbgCLE7ogPxxB7MvukPuF245vVRxh3vemkRTnTTP1mAspJB3
 79YKZZamK642kE/ogBwoDcQePfwiJduyibJelI3cmF2Movp7ShnD1W8rCAZbwU4PMTkATA/DQrC
 Jbn7nZKUnAxrLw8VRZA==
X-Proofpoint-ORIG-GUID: qnMhRNPxf_MEZuyIgoyq2CAH60T0u6MZ
X-Proofpoint-GUID: qnMhRNPxf_MEZuyIgoyq2CAH60T0u6MZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102806-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18CE53E1197
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:46PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_bridge helpers take drm_bridge as an input and extract the
> dp_display object to be used in the dp_display module. Rather than
> doing it in a roundabout way, directly pass the dp_display object
> to these helpers so that the MST bridge can also re-use the same
> helpers.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 39 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ---------
>  4 files changed, 54 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

