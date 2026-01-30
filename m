Return-Path: <linux-arm-msm+bounces-91235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGEUK4I0fGmMLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:33:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C352FB71AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7F57300371B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFBD1CEAC2;
	Fri, 30 Jan 2026 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYQcsw7N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7gbKgfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4092B2030A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769747581; cv=none; b=msLTHSUDzaiszYEonsjhaUXX6fyCbXcNUzA7ZKuu3QuQP+Lwv0c+4R3u809bNMJ5xaxxOH+cT5KXa1D/RKuCTI6jfuHCI9Zlug/ULRAlkoFpdsu9q6o0B23oM7SpbY/VfmNpn7Uy4BUM5QJz0uWJdfHXrYKvt196zLo2Qi/2bi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769747581; c=relaxed/simple;
	bh=Dc5BKUlW+bMG9s3wioEUDgwNOvsfJZmICah0ONC8gM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5ISEDgne/glMF+Wnaov+Fhl6X8KaRgwBa7S9kozvDrkPmRgOR3EwSXwKpY7st101L/+NdEmIR9mgm//5qwL5XU6+hDDwkCP8j/gTaUqjr9Jja2VvrGJM4DcYJ4qC4BLrt/DeCLO3vJmZiBLB9N16pJMxO6ZzSi9U+9NpFTVd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYQcsw7N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7gbKgfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VXNO891567
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=; b=UYQcsw7NVJscgjNh
	VmQc3WHTOvz7UXOI5pzfVgdbzQ61uNPSvkG8rcsEJzDD0AlUPT2BlC0mda31x8Y+
	4WXKmwoch6v+0wzLNh/2e88+oabXIZfe6TZcN5Y8kXqd0jRXV5PT7+lfMPkJap7i
	tQnNrivbOftzVUlTmcKZGvOlGNi7oyvV08Ij3aV/sRUqvbW5qcnoqTwl1XhcYhJl
	eVGiJngUgEqwKdg7AO99sFYsEyC49bbBIjufKCkUd8Vd+HA0tw7JhwGcOzKHpChw
	urIVcY+4S/8i9SdvS1lLbk9ReIzfjDyCikNDKp1o6uHK7G/bCqTp3GqH5H7/6vTe
	L8jc7Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7rr6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:32:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9412512e9abso5564384241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 20:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769747578; x=1770352378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=;
        b=S7gbKgfJj6srUA0apVGCr0gPonZMeHaBnPDEAIn+hekM8KZHFtekNqXdFqLOCXKHby
         Vnwgu2PftMzUPLJzvDvs7x3dFSbhItoNqXo4Qd+qZ7bwis3MfaKuV2tAK3qXN8aw06dd
         A0mxgHfsATxD5Q2Db1EuP7GYvw8d2Ytb8LLXnZ6AdnUJeJa1ZItYAIEmZVrPDgqVrFii
         cc1NeU0/42N3BM9xbhE9PJLoGjGZvgLWlJHUDuohCg25u/umhCl+UhAlmvNY2rBVSApM
         QXleJm+/eixsae2VvD6psxzbhT9sPRxWMMtE55BcK9WDvLqBd8NJM8R+FQu9ps+GvPaG
         XdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769747578; x=1770352378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=;
        b=nVHOs7MLwAHdXJGfbhUz3oYeJzZNTG44wK7Efay0mXr5XjbvdWPbYecPxZ5lp15glp
         3t5jc+xf78uAy8eKMel7xarbvdapVS7E2o/H48OA1jm56YBxrhOc3ROXrHgbj3Ra1cjZ
         8bLziPsIWBFWa7zXsqzTyNVker7HTmfx5e2dwtFE7vqKih7AahPZmaKHQPRIB3rnZEwV
         xGHI+5YqGzp/HKT9xhREfP5PgBqV8ZGdWyM8bZJiu7RdYLKYUxcbufUllH76/pK/0XKy
         DQozXEujfP2cfEXF1rBR/txpUvpch01Aanfg521mEM1/BSlvE07Asx1iCo7CFhvrXY7V
         jSsw==
X-Forwarded-Encrypted: i=1; AJvYcCU/NsRzZo6BnZ+1W5ENo48PenT2ABhCgI5XJRHfje7q6fKvKD6FFG49YD/Qr5C6mDOdzmw7eGe2oVH0QYxp@vger.kernel.org
X-Gm-Message-State: AOJu0YylqgK5UDPbd+fM2drs0uCmfH+uwUehwe/YaZcEfeuU5UcYyByF
	3u9gI5L54AvGty0qbSQIK3TxIkSwvdzuOGUaNVICSgZRzgZOQf0cN2Oh4nrwuV908iLxgzuqh+g
	3BHx452evgzTUC1g55Y8nfABRja+dQk3tLaqPSyAzeeY/CzXPn9Yq+gitCLx1kSXMm0KZ
X-Gm-Gg: AZuq6aKHlq/AW6Bj/v77JXBwU8r78QUuE5UEyZ9DyUg8SiUVA+D1Kn4hMGwn+K25wbb
	wiSjI78P+ZEKvkyU6j4wOhC2Cmg97G1DnZorCQR6255MseqfUS4WbkHntpsbC2i+J9R+NQ+PrLg
	ApVNrDg73YUWG5suyoUjdSz39CCi9vD7N5t6yICshSnbdsDNZ73iG2is3WXiBt4+Ih0daB2gCCn
	F1e1iwMydX0TmLZKatGff+3VBXIB2th5Yv0SacPBtORpkAtL/43PoKiC6IJZHbr0D8KznhZJtM8
	JTvnjilHJsYMi+sb36Kcp34kq6dVLKQB0VOwC70bZOfZRjvqIXwpnM5mjkLsVnFt/sCfvm9AvPD
	LfBIGnOHQGVp5pJojLbpXWm50GNMOVY01lcbFAsVDJWv98XFI3VAicTWBkIdQUGpnOdX/bilkb3
	rXmSPG22dRTyyC/0uKNwu2U/I=
X-Received: by 2002:a05:6102:3913:b0:5f1:c519:9506 with SMTP id ada2fe7eead31-5f8e24e5ca1mr585368137.17.1769747577913;
        Thu, 29 Jan 2026 20:32:57 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:5f1:c519:9506 with SMTP id ada2fe7eead31-5f8e24e5ca1mr585364137.17.1769747577388;
        Thu, 29 Jan 2026 20:32:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074887fasm1520782e87.29.2026.01.29.20.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 20:32:56 -0800 (PST)
Date: Fri, 30 Jan 2026 06:32:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
 <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
 <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAzMyBTYWx0ZWRfX8aKeGn7fxfU4
 OaF/gyVWT1qslkdluPhtfHhPk1ZSxXurEj5XIhzHgHqNLceyLp/rNMfHnge77Z2+s6T4RvG2ZO/
 0c8sezr3jDP/DGFZJDUxuFMd1Mu049TX7V8vGTr1R869MrklhzNFnF3+IzvcfwETLUL9OiGDWIi
 6Gee+D4njzDg56w9g6oQ0nLO/RqZFrsD7nINGrec5vucDcPHOF2Q2qGxH6Mo7FisjkBuwcZAOZY
 GBgN/JmoiBmhQUF+iPVBpWH9cvGab2DpP2zK7CreYRyYr3Nfa1TVO80Gbm9Aw2EhL1kGukAMjnB
 snVyxkCLgBdmzcHnOvs+0hbUeoSylkzon2QujhDPJ2dW9fpIPRodASe3EiLZLksYSzy7TA3bWsT
 xwVV9oviOkJxbXb/wqk/+cD/f0mLau572kryuT8A6fE5xC7JlTj/Q9ZqPIRfdkPn86OJP81FZGU
 GT3z4T7UK5boPC81R8w==
X-Proofpoint-ORIG-GUID: bO7eXVZr2b8QgerAFiqAszrlGNtAU97p
X-Proofpoint-GUID: bO7eXVZr2b8QgerAFiqAszrlGNtAU97p
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c347b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cnsEfNzNr8A5FoBqwUkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,buaa.edu.cn:email,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C352FB71AA
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:07:38AM +0800, Xingjing Deng wrote:
> Yes, I found that.
> I will release patch v8.

You have been notified once already. Please stop top-posting (aka
responding at the top of the message).

> 
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月30日周五 10:38写道：
> >
> > On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > reserved memory to the configured VMIDs, but its return value was not checked.
> > >
> > > Fail the probe if the SCM call fails to avoid continuing with an
> > > unexpected/incorrect memory permission configuration.
> > >
> > > This issue was found by an in-house analysis workflow that extracts AST-based
> > > information and runs static checks, with LLM assistance for triage, and was
> > > confirmed by manual code review.
> > > No hardware testing was performed.
> > >
> > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > ---
> > > v7:
> > > - Add the detail description of how the tool detect.
> > > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/
> > >
> > > v6:
> > > - Add description of the detection tool.
> > > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u
> > >
> > > v5:
> > > - Squash the functional change and indentation fix into a single patch.
> > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t
> > >
> > > v4:
> > > - Format the indentation
> > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v3:
> > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > - Standarlize changelog placement/format.
> > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v2:
> > > - Add Fixes: and Cc: stable tags.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> > > ---
> > >  drivers/misc/fastrpc.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index ee652ef01534..8bac2216cb20 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > >               if (!err) {
> > >                       src_perms = BIT(QCOM_SCM_VMID_HLOS);
> > >
> > > -                     qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > > +                     err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > >                                   data->vmperms, data->vmcount);
> > > +                     if (err) {
> > > +                             goto err_free_data;
> > > +                     }
> >
> > I think, checkpatch should warn here about unnecessary braces.
> >
> > >               }
> > >
> > >       }
> > > --
> > > 2.25.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

