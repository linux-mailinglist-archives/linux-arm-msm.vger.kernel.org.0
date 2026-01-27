Return-Path: <linux-arm-msm+bounces-90750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK94DaaoeGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:59:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78593F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64BAB30247C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8D934B42B;
	Tue, 27 Jan 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVNhGpNr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWBUl6fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8D34AAEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515171; cv=none; b=X6CEJjSqilvUqe7tqLlLX5T/bTbEwXTstC3h76lMyqdqVCg1WsQiFoHtzLwXtiQ0MNqQOJNriV5y2i19ZYZk4YxtR5/nnh4Q4BDPE7cgVp48pUGLDhIpJ08SZV/Hu5H0fdXxkd58r0kW5PU/ml3LbaIq3uOAhqT/CpAN3V6b0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515171; c=relaxed/simple;
	bh=TT3w/jk/EFkT860y8oMzI2c+ShIJoj/8pd/wGeH7yqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcbiDh2EJjI0Rryol1OJ77rd0dwTBZUhceUfrj53wE5coGyMhjdp+gupBRDdQyts1b4u53Mn3NyRkhQfrMQRRC26rSNHgzcTVrnXnfxEcs0Qf3XqRyIfGGohGM3D6BuyUDtJk+vGOSVpJdmxc49VUseXA2Odfk5/13SHIaVyoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVNhGpNr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWBUl6fm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBxRm41795413
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eo3XBVAezIW+Pl/mv1qSYsEu
	Y0LGy16QnUk9fgbCnfE=; b=fVNhGpNrT6yoHjf0HMpLShURopOlMc1CbPZpLkDF
	249mO6SYCMjBk0/fz0C2lV0d1nENDDVwDn9bJHpwqLf9B9qzW5PiVfq8dglV8ybk
	MEyqQvpc+H243PHUfm+zMRVNhfPd8PMb3dLitrXy6wQhThipQOjB1DkJPm2LFLqs
	ZSay4NePjEaiLsoO2Vt7ZoObkphLWuDYl7CDx7P7c3NWhFjTkdaqDzo2OhGhdiTP
	pkl+o9AqJqexsmFEgaPyK9lkqk4U+cfXVMGjMADzoERW4FgG3TALTNwiyWvYpkln
	5+zC0UDL4DdzyXAFNtoglXjHlxIkYKAavGzBHB7yvXyn9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93jesb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a7fb4421so1411864885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515168; x=1770119968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
        b=eWBUl6fmjadGaSiKLs3OlvIGjIfrtIagRMIo+8JNgb6F2JgarRpqxqyFxUkqN5RIdf
         Wgxn5WI1JJlmgi+XxdzpPgXjGIseKpGrmeBjw9m3PIrSK9GlJ9LJt99eN1qjXw//pHzj
         33EBVGjTK4QZ1WagVMMuECwhOkG7lQH0QsoLkrif+DR+Ix+AzCBdiQKT5e9uv822Tb8/
         TO3GJnrd8eoqvINxppi/ceA9xO8mI5XZ6v5WWUyiYZAtd2lt1ECA/Q7OSkTIhWMTGTtf
         GeCyCKxRQf7epYi8HEvvphxLsZ4rwlBbHcZlGtNqUSTvqm9pd+u8rOkaMons4tuGzTYa
         PqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515168; x=1770119968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
        b=IQmjZlYiz0t2iwdRxU5M6Mz5KbnzNWd5VsEEXbaF49SMA9fotY7Jx8vWeW/9O8+Ury
         SMslRubjKjtmXxZdJnJrsNTwsuqQyEZF95IP2DLXenpGctcSXVbSo8gWlwxZ7BhrcBRh
         s1CACgWBexkD7qDKpj+DENFz3g2UrvXzY08N02JW8uHU8NqX24dxaE6xE/6yQu6swkO6
         kaAx0GBE6hDLZAdF894Zb8uoq0+dL++295zCXY15E/bO/vWANO23mgaBSoLNo+Pd3hJ+
         cgW0BsthSpgwVBxXdNEq8It/tB0rqfyzc3EGdud8HLlEi98zu+CJV2+0Il98vJXjL3Lo
         E1dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXnUi8SsGv31JhCVXuBirdZRrNbtHGiRtiibPae8P2hZnGY3ulj/S3FA3NzaACuvrRmDs7QZMS0MPjaNnU@vger.kernel.org
X-Gm-Message-State: AOJu0YyDdAR6Cr+heY3E2q1G56coaSBUfxEa6cnuqwBPBrij2gbe3tu8
	7fFoXP1CVj+QHN5bsr/6rrF1kut9QfrSsABKZymW9qTLWubZlCcLjt5Qqo0jiJdo60Wg55pAvEX
	NQe0xexRGhb6w7wGoAUByD8BXLONQw5kQM+zLCy/9iM90+au8xS7lEZymU/5AtAtj8h86a0kclE
	5V
X-Gm-Gg: AZuq6aJuTLt6XiOuxA8drBmHAbVGdNUSekfOPLeDfFJ6ykj9I60LUKMxwj+2KknzQdv
	aUEpBMMnkAmhf8SCgDpOhXDBYkjnjlEaGBRiPcKefF+i73oC/bUQEEZnqpCqecZdcSSbDw/PEOC
	ZNjbQpLQMgmmlcZErOyKQNfTiYpsBN8ATl9+CqwqgpWC134VhF/YUqv0jWCHvC+DMrmPyQkZUCh
	dYhN2+pYeS5X6VfaxnU/bPvghAjqjL96KETEh3CDh4Cb2pzquYH8lf+fkxUvFCiAyVc8giI/P8I
	h0is5zX1j7w6tpIgik4bSMmohmS+x6tLYOiqlMzJcgEKFDf200NmRQyQZDD5Jvq2jD/CU0jQlHu
	3WdiJ4qYHoK+z5eWFnuvqH2RdGiNHhZHHB923yqSAyIPwW2bFtGCHdMxbsplxPx/drjcCnYJF86
	EHEHDI6zV4tf+xPO06lrBqlPo=
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c70b8411a5mr147107385a.5.1769515168449;
        Tue, 27 Jan 2026 03:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c70b8411a5mr147105785a.5.1769515167989;
        Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1705f7sm31844261fa.26.2026.01.27.03.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Date: Tue, 27 Jan 2026 13:59:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Message-ID: <5sb4agmjs2xemn6m4zetab6qvf2xatwkkwesayywvm4zx76bt3@4myarlti3jku>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX+ly41bAs4jfI
 6/omRE7Gu0B5Dw09s/EGG7QVuicNuRJ6l781h8ndMMfMjISSRUDKWBzsWXyF3AyjyaLfycDGXLR
 NqRq5HeZLF8WbcWtrrzuRODLGyBCfGWhIAvwjm16lzXxOHuEOrawR66+6a+kd32VSu1G1I9xPRB
 TeZocqFWEGbME6gAICfBzNKO8D/QzA7Z8XSaaQxd5OVshS+95S+gtpxsiAh73ElCBZQJQ7Pnu5I
 njnUPCdktO0YWARw72ybjMbsgHch8wb/AVHknvzYeLST6k55hSF7p57MrHA7BuOhCo2z6prXDnQ
 oRBJoCQWbFpc6/88xEa93CV68tqfs7JdExML7QakAUsp/RIzp65p/GqjtnCFa1G9B6iY0rvrxL1
 N1uV2B0TgcB6LE+3ZpLeuy374hjs3Gbb1d6ub2xfYV0D4kxXMRgqXFS3cAZE5DwGwUrGbYsvUs4
 8Lhdx03ixpE/Qp+t+dQ==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978a8a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4POtUoziGYp5d_2QLlgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UVLbSJIPRG6H0ooVvWX_lUK6g-DeiXXX
X-Proofpoint-GUID: UVLbSJIPRG6H0ooVvWX_lUK6g-DeiXXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90750-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: AA78593F04
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:58:49AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> compile-tested only
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>  5 files changed, 30 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

