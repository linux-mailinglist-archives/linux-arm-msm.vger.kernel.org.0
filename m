Return-Path: <linux-arm-msm+bounces-111689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeh8OR5jJmrsVgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3276532AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QX9eyfRb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GFlra47f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F9133009B14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE6B38D019;
	Mon,  8 Jun 2026 06:36:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41037F721
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:36:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900614; cv=none; b=kROr/PY+RYIRYndLo0DDWwFcbYRpgCnkj8B6UkFube1NXQ34vPPXwqqzqjC8t2euKTbwtx7ei7cUP7m11JNtHVD3w9dWyrdBtV6UnpmU/VXu/8z1ypVEb1wkPnAfn9ceeGeotOIhfqAU0nbsEEBMGwRZJIezCrGPz5biWIItHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900614; c=relaxed/simple;
	bh=3GnuM4Wj29EhJDY4B2tW89H800XohRGeS5DitbRQfJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePGkJM3TrsAZnQHObBIaMTWK5f/lJdhy5yblCMOAYPb5CqQHRVHYrwa1zg9XIjbURfQA9iKkPAYZyHwKspSl5laR8tVaaoQx//nFqiAcWR0Uedgv1Uvw2K/H3Tuukmsg/6Ax5HLvoj6hQTTFpFlAUyzsGfXLfY85j8n+ik6Cvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QX9eyfRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFlra47f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PWi22808317
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u2b9AHBd7MZE3H2QcKXdMJY1
	Vv76xd7PoGCmj92nygs=; b=QX9eyfRbNc5PQT98U326cfPrdhG4wYFr/ivXOjfG
	xmeFlA+KjW/ggrnKj52q8VHbeiJJX/yEkHYjeaTKpGTfjCmLsTOeKkT2Hnxj9V8J
	lezk/zBcJ0ppNr6/D5DsDJ1nQHWa74ZNWrae+nzeVLGfabClTy4bVj/wkr4llsZ8
	OKKV0r+bgkbrAlRD0Uw72qyZRc+qefp9ZaYlnpci0aEk2gvRYTBicA5Y1/O76CEy
	Rkr3bjVB4ikPDNcaiCnmfYfwK6Q1eG94ERUaufZ5o7ydZwwoSLBTB42Vvu0ejj4K
	UYPHGwgdGo+SEvn24CWtWDjgcuo/qvfFLTBqw0mLCTlBJg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6bhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:36:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7670e38so5068126241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900609; x=1781505409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u2b9AHBd7MZE3H2QcKXdMJY1Vv76xd7PoGCmj92nygs=;
        b=GFlra47fkmV/AYcSXluENCvK0AEJ/l2fgw0VW9akGtYym7m0dUrce+bxifHx98+yvI
         4uHrwCM7Uac/CtyjdP5L04ot0Zh7Y7UL3VgfpcVaKo2mVDERfdmH68hoggV9i4AcU53Z
         yOxx5BzStob/H/Rm0qZhqcfQUMlKOyhGKLl4mnWfB3vgDRSwxBSjOgqp+F7lChMkiljG
         K2I8+QdKhTDkU3eleZS7VeCXI1mwsW/G9E1BC5CRorS0AJEZXcX+cPDIZq88lOgLje5H
         pwTyxQ3Komu6yyrpIQFbdKnfX+QeWE5LohLHX/jq+ocDTgL/izisvaXqJyXuJP3s5jIJ
         zPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900609; x=1781505409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2b9AHBd7MZE3H2QcKXdMJY1Vv76xd7PoGCmj92nygs=;
        b=hUQ04nJFVsIRFTZVG1I8LDkdXXG+GmGv6lws6i02wlTRDx4gOaPUHMemjbkQD5rQEZ
         eaO9NyK432l69ZPlDbjRokENvnsLkuAA5OC4pdCpFXN2Pkqd2C7XyNWm7iHCrAydBWhN
         AmW/0ccWswcb/IookWtB7HCMLgwEkoHOmr6M7AtZMQZuW40YW3ZTvPFDMlQtXopmZV/j
         qrQlZf9RshQR+/C1RZ1LvLI8We2CILBdz7pdsdyYI1YmyD62ADAHRytsFw0t8un/dRXY
         EuqyD3L0sUXTFUh+bOWWrVGKdmBlcDbMV7u2r33ZHkSp//B4CLZM72dPG8HIyi/4cnPM
         WvIg==
X-Forwarded-Encrypted: i=1; AFNElJ+SzVQKHw7rQuewRmSasEv1tgxE+oM5MUgCMhs1vUcQFNp+gNtrAsIjTq2VycPXMGBE4WiWp0ckm18H359T@vger.kernel.org
X-Gm-Message-State: AOJu0YxCq+w93ROJWGgU217C3VbMpdChRJ6zHGhYueO1p05FnEBotrSa
	dbF+gnf2CAkT9y2z6AX081zDqyiVCJ3AnXJmOWp6FxhmDbWhyO/NrnBqETZgDSwhK1yXJtJSMFA
	6ywf48Eex8PytAj1s1pwUrfv61OVU7YKH3O1esUA1EvbNdmGKLFX0MEtzkJtzvTfYBErc
X-Gm-Gg: Acq92OH8+pSCFdvyVeCh7O1YYyu9NLf6vwrVJDIxJCJiW/JUKafXDkfoFnGTn6XUAOG
	bnPHoX4J5aQSuyCzfxBt8n+d92qfw4fwlJePRxpi01IoS+k9cyLD8iyPrTbh/l8PZ8nHYwNGqtX
	RrVXEb+Nue1dqWf8JspHM3c0dGtSdTma5jfn221mpyysHUnBgP2EEi/uOZVji5ZZwtG3sjuWRmn
	CyxGIG4XKmzM/DuRQj7coZrFiEoNMddEyBWV48s1FxAq3osR9E05ND6c5LwJkMHGbwJ+XYVm1mE
	03JEgw3muLt+nne4APcwDTUhVTJQ51RX1MCSdZrJeZDFSpCGjs3EpGLd6xYwztGA43jYvYIb9Kz
	UZgzoOEsYtTYgvEDHXwcBb0kSNZJfAgJ4RO10Ut3pvbCVAPTmvFUC8Yq1So5GI6+kgQzO3gIcMQ
	1g9iY3JbhlctvO6qoPiCj0nawlSUIhFDMn22Nxht9e56sgXQ==
X-Received: by 2002:a05:6102:40ca:20b0:6cd:b43f:72fd with SMTP id ada2fe7eead31-70039aaf3bemr3147981137.22.1780900609615;
        Sun, 07 Jun 2026 23:36:49 -0700 (PDT)
X-Received: by 2002:a05:6102:40ca:20b0:6cd:b43f:72fd with SMTP id ada2fe7eead31-70039aaf3bemr3147978137.22.1780900609184;
        Sun, 07 Jun 2026 23:36:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8880basm3565026e87.0.2026.06.07.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:36:47 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:36:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] interconnect: qcom: simplify allocation
Message-ID: <czjwf4bstyhgekmilv6tgyzwrk3tkbglbjthzjf63t7uqbg47i@xxztth3jhiy5>
References: <20260608050429.5990-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608050429.5990-1-rosenp@gmail.com>
X-Proofpoint-ORIG-GUID: zGsIX9dK3O8d0eyXjxpbQKDq07AEOCe6
X-Proofpoint-GUID: zGsIX9dK3O8d0eyXjxpbQKDq07AEOCe6
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a266302 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=7l3-gkCRI4JLb9_0IUsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OCBTYWx0ZWRfX4cx1BAxvNyk3
 7jLoIJyI+m52/9O9QvoXi+78e261H75dw8sbvoxzg5GZUjGA1lEm1eGCnR/GqAvvzqE/iqDnVz+
 nKLFdE0NuSDE6QOA+gv8+5nGnSyo4zGmsVBIfbwb7o0W/w79UkV3GoxItS3cIz4lo0SrCrSpiDI
 c0C0ZiSsh0RHd7RN0zJ3lMTDMlrwWQq0mGYuCVYxlPc0187v1imdkthR9jTB2nMHPRCJYNgs8eV
 qP7osoSXYNOdheBM+k7B3efQKLttJmKkSK10KXYsRhV90LPDoJ7p54G3Sl1daBpI0DcRioRqhYJ
 foQM/GYwAIH8jfEVuMyQnpjgDJEsEmmsknfbDtovKnezm4Mnlwf+kF4fTatY4pwdcaRAeqw65ig
 ie6+tmntheszjpcNOVvdEaJ/CNGGztntPUZxpFUq9cdhChJy1Y7omDS2g5q8XULavza74eYH+vC
 H8GageJwilGmpGcClGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111689-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C3276532AA

On Sun, Jun 07, 2026 at 10:04:29PM -0700, Rosen Penev wrote:
> Use a flexible array member to reduce allocation by 1.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment after allocation before any array access,
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 7 ++-----
>  drivers/interconnect/qcom/icc-rpm.h | 2 +-
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

