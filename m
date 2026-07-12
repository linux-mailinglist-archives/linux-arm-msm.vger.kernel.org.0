Return-Path: <linux-arm-msm+bounces-118608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CzE0C2InVGpoiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B5746429
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S3Q8MKfS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fDIBgiDi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DCB300C00A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2765338D400;
	Sun, 12 Jul 2026 23:46:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4D367F5E
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783899999; cv=none; b=tU2Clb9lAqu4lFt9JI546pA1bdekKy6YJB91dyqmk3c+7Ir6yXBwULq3Dd9u1XU0Q8qzhsaQzU150Px97MFaxX3UOSqbbWEak1BoB+E9tEUhyqhzyjbRgxFFt3J6OAMPj/AJ/Yjb4VXHyZ3bleUbswBQ3/AmkyjDGn17eTnhSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783899999; c=relaxed/simple;
	bh=XYqHq+Xa4SMxCAC21QH1AHjkEwtKhQf/3Pr05AQkLd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+kzT94JCvxEBSMjjesl6QLNUa9fcHVARrvms1KHMcE4V53lQ7pvWRgUWHPMs6i9fFXzgq57lIIayquWWk99NYkGKs3FwhcGPr45mR9NeaNpo14iuBpq/+BT24/EbQwDf/RXTR6ICiUdzJXMopqC2acZ2oVnlPZEDEQsSjinlA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3Q8MKfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDIBgiDi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNU3nO3961078
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7OH0dMJbAYsX/NxCZpvO87/XNimscPPU2oAe0uYMNYQ=; b=S3Q8MKfSlYue5KQy
	ySvNzmcjHKbff/VTAALKI/HxbTC2LlaR6vyYojV9x1OA7JLPnVKX9ryf4e2b6SKH
	HQJjVjXWMKpUqMOrWyQyMmaXoNsuUaMJ0f3o72IetjDRM5mmffB1EtVly+ZPiAKS
	Sqn5XZcnYuoD1TxGqY4dJmVfTnafqDYDitCe7dd8F7dc5bdjmqpj3CQ/aMoYxAwQ
	FTG4DCVzRHSevUwvbfoPzaOimgMHj/qyFp/nRnIC0YVO9p/y4KmZiJR7C5qBcM7F
	L6upAOmslnx6Bo+L3pd87i3uHWVh2FIy75YkOVFpZyghRQyhTSW9PJo2OQ7jy6D9
	o0cKgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm05yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso44963821cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783899996; x=1784504796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OH0dMJbAYsX/NxCZpvO87/XNimscPPU2oAe0uYMNYQ=;
        b=fDIBgiDiNMiaoawgy1KjpZBX/a50B6ou7eCsvo/8H7HCW48L8cayZuW7Sn5KWYVTAZ
         kk9ZRRlYn7HT1z4zv9HxKTf2Op5oFCY7RREwAcY1Zbj7XiQa488r2iZR5M57ypOTSNlh
         KKQkEUc9TPhl3bJsfYnM82m55cdM7UoVpwtPIAeNfoSbNlYSkaBirJ2eQ9T3nxmEmDAG
         IFMHzX9GSabx2JUhk9hcetMHRFPNAwoBFCgiRJHqF0leacjS5BEpbtZImaEyzGW1bMGf
         3ppfrLj/xP8ncHbSR4IPoHFQmU4oBpYU4jm8yBS3+zSY+lne56J/UvBapZGp6642cIFw
         795w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783899996; x=1784504796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7OH0dMJbAYsX/NxCZpvO87/XNimscPPU2oAe0uYMNYQ=;
        b=iQ8Sru0Ve79XiDs13nw3xq9TiZ0xDpeO9YsPvUZsXMCnySndGoRPyNg3Mnil6u0Tr0
         E0pQz99/qqA3PtVxEuvdPI33/HJ7sVdO+XyyLvZuAuXLiuRTvsRuk27100Ibtc/2VVgA
         CEomiM6LAEb58mgk8gv/iz5m4t4GQZ3Blei802YNLkE1D2pR/E/9TpcEkcHqBeIgnbsu
         11Jb2sVv6nAqQdPWmUJ+wMoe9U+arVMrrayKX9MK0cX60pVw8NKGf3HmB5RIp+WBrUIK
         aNkE86Omf4qn0EMBANmnbpNZ2aMT3cBxZ9AToqjemjc2VJOkNVmU2AMTfBpUpIhNuICK
         iREw==
X-Forwarded-Encrypted: i=1; AHgh+RpaM0RGae+RJFnvA7WthXKLqOtzS6g5R2nM81VydSTFzrrMQKPop2RJMfdjCbXbIfUy2icbl0R+oheRjBab@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0jTpXVcrCtwy2dcQ+YVnxQEMbuWD/SnnH/IVvZhCnDomn0RN
	buiJCtx58d2g2JDcdV591w9A4iFnjz4YVg4caE+2Chob2Rg3VBGiGcG0RKvGD4+h3ayvVEvV/uW
	Od/OZKIBHsSJYzyXd2pPLVp4Aon/pA6re+EGTypQJCN6eNgNZ1T/T0nNXRyaQD3+yjYjW5Ht8uX
	Fx
X-Gm-Gg: AfdE7cnwTD4ZPO9GsFmURA+g5MftqBAiMp702QVRhIICZA7IpovwDax18BacctAkfy3
	25JBmXrIM4eeViIQYqE3iglfogMUi/ySHRTggikJhKRWz/NLcskinF4Y1zGk6y1tpVlcWuydjU8
	igN8W9y+4bksvPSAKvj5ppAI33cfnxN6Ga9b2MiuVIn8EwF/cJ6p/d+5MMGaLI1qTJKWPBqX0cv
	HTM4eehbZxovDAvmNMh0odmfEiVCrtusi20QnCy5NsNWVYhkhsW6L1+u0NmxZygePt4AgXeQhl1
	1SL7rcEqtySCdeM0EAyjp0FNlUB9t/kqRgVKTkM8SEv5yNrXungMUt1sdUMvlIOYvjQhEHrE/MB
	m/y+WKt9yV+AnZMInxgTF+vS2VFnu+QsoLdpFVjPGEyAW2oLdOY4Dd1XHMvhzT7e7wuT+SUUAcw
	0vgp37NM+4DySudTDNRkmuXQQR
X-Received: by 2002:ac8:5a51:0:b0:517:96f0:5658 with SMTP id d75a77b69052e-51cbf0ab5admr69702831cf.14.1783899996049;
        Sun, 12 Jul 2026 16:46:36 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:517:96f0:5658 with SMTP id d75a77b69052e-51cbf0ab5admr69702731cf.14.1783899995542;
        Sun, 12 Jul 2026 16:46:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca54e25sm2368093e87.30.2026.07.12.16.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:33 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:46:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: fix parameter name in
 dpu_core_perf_adjusted_mode_clk kernel-doc
Message-ID: <hzu2yj4b7xgedp7kf7zadg6wd5okkjsxjxwevy5m7asatghe45@ehyf3qffb5u4>
References: <20260530201342.10538-1-rosenp@gmail.com>
 <u5ozkmhq3ll4pfhvxl63ezf5dtgz25lvrwmpk6u7ofccnjicw7@skim2jft2cyp>
 <CAKxU2N9tizK6xbzscbeLHs4noLj5X1Dk8SRog5yHkLnkFBW0zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9tizK6xbzscbeLHs4noLj5X1Dk8SRog5yHkLnkFBW0zA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: x2rAKMpzZKXItnWQml8tcFT_HaBIZ5v1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX1SwSQeLH/w3H
 Jy6jWMpLB0zgy3CVXLEfftKMU64KYpuKhTTOqYoXGdT8TTqlwHe70vfM7Bq8CoeoS+5MSKnOO82
 1C7qp3MGjWvtbzCea9UBmlvuVBM/aXVLFG227oOhQcf34Z/nmccD+CWSaryxChPngeAp2CPmYi3
 sCTXsl3E9K4KegoNVyQN4dzN8nDA5itU7+OPHrbQJhBBFPLKa9la3nHS49pxs3bfiBagPLF0kUs
 pYWDhoAfiy+wG7pTi6uroTx0+K2lfuSSsycTigxQnhtEEOMA5WO2aMfMvlwHuPJFU2YRQZ5UOO7
 Wan1Q5MMlmGXRTIvWFaU0VqA8KOr+Y57nILigOR+WURxA2I4oAYnjO5/zH9CIg2uWAedc0Rjk6a
 iTpt8XIaQefrv5X/TiLUOt0TazLVdyRJG8jKwz9f8GoOdP1HXKB0/YGMp5++BkfeSTLxmOq5YUk
 hSZuCq2w3Sku04m+N+g==
X-Proofpoint-GUID: x2rAKMpzZKXItnWQml8tcFT_HaBIZ5v1
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54275d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=6b2mnDnH5lO7q6rXjrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX5/GpNCn4SCFb
 ffrJdUJPx0GtDa1NhTZkv4tya1DFwFahi2Kb0ama0eprexVMunm+ZYnusJA2bUY9BgYb7UAy1R0
 c4bSF8zHS+RjJaqUDRdhOUzsG4jKaM0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120257
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:dri-devel@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 854B5746429

On Sun, Jul 12, 2026 at 12:19:59PM -0700, Rosen Penev wrote:
> On Sun, Jul 12, 2026 at 2:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 30, 2026 at 01:13:42PM -0700, Rosen Penev wrote:
> > > The kernel-doc referred to @crtc_clk_rate but the actual parameter is @mode_clk_rate.
> > >
> > > Assisted-by: Opencode:Big-pickle
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Is a v2 needed?

No

> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

