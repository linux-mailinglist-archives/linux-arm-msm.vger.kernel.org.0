Return-Path: <linux-arm-msm+bounces-104125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gk+EaDL6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:22:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90C446A8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E812E3075E65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45D03EAC74;
	Wed, 22 Apr 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtHaKthA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PalvC5IC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474E3563D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863675; cv=none; b=kNfmSSvesMqf68SmHP5YGHW2ZwrXiUbOqlYZ0DLfw8u5UD2FreqqWG9XwBPhl/jsrVUnQC3C4dkYEx9gMrx6viA+3fHEYSGQVkXIZY5nS01NdInWGpVMV0Z9sfg3kEQhTdBoSvoFpaPK0mMhajqc5Fzfrc1Rn0vkiaOr7kae4ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863675; c=relaxed/simple;
	bh=UoUu92FyXr6yg4ClEfIyhY4hqueuIqXeXTiK8VW6+Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm8GUfQU8oL5tO/kph3mzqUUMxJpsuUcavrHxEjSYv7uh4Z/xEBzYYor8sjI1bgHtvMufzftTs1eNsST3FcZvEksyEx/hhTqjCFkoqWKoasltgJ4dFZ9ZCgGOwylJRS1tSZ7n4fiQU9j70iOj4wBfvRRwT41IZEJNGpSGHVut94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtHaKthA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PalvC5IC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAZmuY3377519
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dikduDjbgfHRGI8Bv6LMlFR6
	6ECdPNblFM4jH+7p4/s=; b=OtHaKthA85aZA1RSC0qyHB8L55KY9TR4VOjfxb1X
	Ktuuuq0oyl/a0XJB2NBR7by4YX//ebTJ8La+V8LY5DbJDcah0jUnxzQU8Z1w3pQs
	6F7L0hy414M+cniM6BL3Eq6KAwFtVLAbiRkJ7oy9g05nnAVN6zpUzMYahx4uuEsP
	zsjWAFc2fVSn6LiuRAGQ4zmx2pK8V3gstk6GaeCJ984kymju1JkAmBzB3iuj7moy
	izKRX6CL+EcFhAc+WkE9wcxCgfjQVD73cmHta7Ic2kS647ILMIbjvWHwBQe7BtP/
	p/MXG+S2JPffUGOhGuRzbGxSgX8CDBCWUGnXuo/cmcdkmA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng3hn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:14:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354490889b6so8192840a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863672; x=1777468472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dikduDjbgfHRGI8Bv6LMlFR66ECdPNblFM4jH+7p4/s=;
        b=PalvC5ICCdlzQxasJhKDL9YMvilblpHnz2rCBg1ru7KWA7zUNsyIw5Ck2y2aucFhgY
         /wril6gILtIXtKENO1TvI7D9eP8XlCwrYC5nPLDjYOAw6mcSB5AIMhZqqcQ4yIIbQK1O
         GSQIrdkT+vhxYovkJY75qWa5s61yELkplS88syN35xEsE95Qh9QBynWiqaZAsG5lSXOV
         5p1Yjyyv3t/78AHLgJSGgjmMxzKGQm+ysQsSCLgbpwPg+mpm868+6I7PXW/FX1le46re
         +WWy4JgEe/dxRVN+6bRShrXQEYgh+TxOsZY572BJadGZ2GCdIC4k8D414H130Pq2lokh
         03hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863672; x=1777468472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dikduDjbgfHRGI8Bv6LMlFR66ECdPNblFM4jH+7p4/s=;
        b=OyzLpSiodnZGSqUs3k3rxLfilJ+P/gXp0edRoy3SBv86SyQnZbC9alENQMuK8gpZOU
         WGfBNh+f3wsfFdQiMNZVbyBQ/Vkh9gdftI96nBQZZgrso1bsxz4mjyTzTxsZE6cYE8kn
         fOH3O3PzfMtieaIVoo5IHXUy+TUQBf/HUbiqh+6SfttBaYjpDLstMrqyow+lzpzxXQFe
         BcwRT78gxypmVdrQScsVsYy+HO/cQiLA01g2aqwlHSb93/1TLX9SCkKJmTShMM/7YP4X
         ggrsjVwt6n17vqtAIa2H1J1Lu4Y2ka7aMgTeOBNu6UY9sj3I1Jo0tqmwcthUoCLwWTb4
         F8ng==
X-Forwarded-Encrypted: i=1; AFNElJ/cAiUPX/7YQlxU0D+wzhvQKClgOPGUbr/wNA9UJHYMq3pPHL9kruCiqT9tMgC/A9kAJ9GsOOKAnDhXK0DP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhQ9L5MQU23h13VtqyfAzFr6BnzNBT3BEeWIEwmgXxwLMOqBu
	gQzrHm0uCeQA9DvN/Bxp1DE/AJEjC0wKm4a+7OttKHMUfTRQmxWKmOrUSUPX41MdtTMMFjuYGC+
	JhzVJkI9xHXADt7evAPRItfWQ9TSOtOezKvvx4OWxGHKqH6HltYO7/Jgx5YkRSyS3LM82
X-Gm-Gg: AeBDievhuqm2V1REs49i4a88ckUGtdA8AdMFXzsFkczFmxv8ysfrKIwO2SrGLlQc9Mw
	Eal+zn+1whnZXOTygquxfjyihJGlJa5M7AKoMtTEqdacR5PYTyvX7Nk98TG1dQad0/5I/T7saAD
	RTrg3TyuREg8wP1+SF98vBO0uBVVygzdjeldWsiOUXKACi5T9VOqGRWBBY79aZ3KLpBJKG9IJKH
	J2bJmuHj2sg/3aLNw70v8gUff2oRTqUV74Pn2Wk3Ws4xU39l+fCaS8pFIwhP4qhePsa0dR2uce+
	2FgGhEnbh6OBXo0asQiCG7BS628sma3pSPlX0qqS/LjrEupd2/wVv+E9Vbd4nrnC+9r/uyExxk2
	Q5MXs6IqBvkJQs/pWryHTpH/On3qGfN00kMNH3yO6aqZsg4ldACCpJBnEQzc=
X-Received: by 2002:a17:90b:5543:b0:35f:b227:db86 with SMTP id 98e67ed59e1d1-361403af6a5mr22926189a91.2.1776863671863;
        Wed, 22 Apr 2026 06:14:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:b227:db86 with SMTP id 98e67ed59e1d1-361403af6a5mr22926152a91.2.1776863671148;
        Wed, 22 Apr 2026 06:14:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm17540320a91.17.2026.04.22.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:14:30 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:44:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Fix NULL pointer dereference in rpmsg
 callback
Message-ID: <20260422131424.svgaj627xyfz3wkd@hu-mojha-hyd.qualcomm.com>
References: <20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com>
 <lqu6wykpvqpbm3boqjsy3tqqle75g2utumhsh6gha24xzeveda@7rwcsbwpkvua>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lqu6wykpvqpbm3boqjsy3tqqle75g2utumhsh6gha24xzeveda@7rwcsbwpkvua>
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8c9b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pmo7ErGbKGZq2siEmvIA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Qje8kasyTSt8h7SmmROZKAPGglXa5A09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNyBTYWx0ZWRfX3Zv/80Jc3SnK
 U/S7uSQaLoKXrvwicm+Cdr48TLP849trVamZTfsVDJ2D/hODVEje9bLOUvgr5vEvSMxmkmBv6R2
 m2nQtLXjebs+jG4jx2oqX9uNiT3LS3esCK7JQtE0SY2LB8KfKlT3jW3M9i3wfK3ps8Lk0pgH9JW
 +YyU6hrLZpAmx3tjtqumtkP8vFL3WlgMa57Ee8Kw78MGviXrTtl+gXcIoXEAm8b1wWWi6k/G4Gh
 rhLyuWtNlLC8U3uIRpRBvMBu2bApAXlKtcar02F22tBDE/G6o3JGFOLK12rIzhZ/XKc/QMJ4B/9
 WMxLiW9stjFDK7M3SJMVeSUPE2fvVpObinnkjnXgYhKlXol00S+dlPAZy/Y3hEs4f5ITedymQQ5
 3x7PfbYMONhOCfXN9CyLmBzmeRiR+7oft3SddEBYUcNT+WGhKXDxtBnND5AmMWTjwL256bulTr4
 ltJqdq2x/WgCQRRo5GQ==
X-Proofpoint-ORIG-GUID: Qje8kasyTSt8h7SmmROZKAPGglXa5A09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104125-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B90C446A8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 01:35:00AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 18, 2026 at 01:31:46AM +0530, Mukesh Ojha wrote:
> > A NULL pointer dereference was observed on Hawi at boot when the DSP
> > sends a glink message before fastrpc_rpmsg_probe() has completed
> > initialization:
> > 
> >   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
> >   pc : _raw_spin_lock_irqsave+0x34/0x8c
> >   lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
> >   ...
> >   Call trace:
> >    _raw_spin_lock_irqsave+0x34/0x8c (P)
> >    fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
> >    qcom_glink_native_rx+0x538/0x6a4
> >    qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> > 
> > The faulting address 0x178 corresponds to the lock variable inside
> > struct fastrpc_channel_ctx, confirming that cctx is NULL when
> > fastrpc_rpmsg_callback() attempts to take the spinlock.
> > 
> > There are two issues here. First, dev_set_drvdata() is called before
> > spin_lock_init() and idr_init(), leaving a window where the callback
> > can retrieve a valid cctx pointer but operate on an uninitialized
> > spinlock. Second, the rpmsg channel becomes live as soon as the driver
> > is bound, so fastrpc_rpmsg_callback() can fire before dev_set_drvdata()
> > is called at all, resulting in dev_get_drvdata() returning NULL.
> > 
> > Fix both issues by moving all cctx initialization ahead of
> > dev_set_drvdata() so the structure is fully initialized before it
> > becomes visible to the callback, and add a NULL check in
> > fastrpc_rpmsg_callback() as a guard against any remaining window.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Missing Fixes / cc:stable. Otherwise LGTM.

Will add in v2.

> 
> As a side note, we really should rewrite that part into loop over
> subnodes instead of the of_populate and depending on subdevices to
> probe.
> 

I get your point and worked on removing of_populate and removeing
probe/remove  while it can be simple init call from the parent probe.
Let me refactor it.

> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

