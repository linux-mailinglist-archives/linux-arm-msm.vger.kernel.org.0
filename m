Return-Path: <linux-arm-msm+bounces-111931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Yw8DlTwJmqinwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:39:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADD658CE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eAexW0Vl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gkc09QSK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEC273041255
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 16:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECE5332621;
	Mon,  8 Jun 2026 16:18:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29332B106
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 16:18:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935494; cv=none; b=Q864ngqRxX1qdhp//HBiAygLwVbRoi2n1c/HdNQSFLF+BcH2EUeaAnSZgfxZMC4evFW6o+Ffb/GG3jzBU/R7oJyhTU1RLdg0vVsWQHJwvjaLOuq4NWOyWhC3lfyPe6t9/Qlh/yRjdFCsZ8XmQ3d+F0AtHq9PdW69uxAtffbDcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935494; c=relaxed/simple;
	bh=eaFmuquwUqYMjCdmuCrnk+F6tGDSW0BaKZjT53vmxgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYWdhw1lB/pz8ObZ05LDnC4v/HFrowJkZXmBo3Fw498wlZ5cLNXTRxRKEfFidQyu5MalqeAqEH0PRlAeWdVI9wxgTG+GvQaKk6FqWMlHAsQK7cSvhSIvCtfu67LNj/Z3yvGB/K/OK6OJdmXOVtpsOW/+x4nigiLEIlqdmmI+yfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAexW0Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkc09QSK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFdRE3479258
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZ/ECAxfrtXAV4RHwviGKJYx
	Yk5iU7sPT9ceJc7dl0M=; b=eAexW0Vl0caBPsd3273R0mW10On1sXUSv0djGg+h
	qATij60/yzOfkIHsNHO0gbk0sObowm/6+JwRFYVYMjMrPqEKLEK9a2qq28lRY7tm
	HxZdPmZrUEZD1dN9OLUWF+D6s2SBesxzqUauAMfTl2E0G7DBsNIsWwYWWg1NZKfR
	y52Vr3im3yTPo+zlKhwYxz4omDiXaocUC3li98YJNwp/6cpFHMQ4Z0k8rQ67h/v/
	ksvfGjhlvc70C/2ztFnV75x0ocVI8pkVnr4HmOIHXounuTdwtA5gevgn+q5XR00f
	ZKR9xp+E+yPMeij3o1CbQHJeXNi7ojw1qKkNnBaZuiIHrw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx40s0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 16:18:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so2828444b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935492; x=1781540292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ/ECAxfrtXAV4RHwviGKJYxYk5iU7sPT9ceJc7dl0M=;
        b=gkc09QSKO4Q8PT0j+b/7Y1cnHCYPlMNWxJAYr1ezWItbKdiJbiuNvUn3YV3hnloVfL
         2X5hq5ESBUsMKnELK9lk1a0Yk7lb2e/oEVq1nIPvUVcpgQP8yIAWazZHdScJaqaifKvt
         M4JRrOFDFVc9SUv+Qm2SPlnVId7eGN0Tn/3bEGrVzpQKLQSdQxkQViHvKVrvVqN8j+AD
         PwSi31VQyl7SZ2tlfAevpLscI/xxK7aYVRMEPlJ3sspjeXGuyYhZ9mchIVeYoboy2r0Z
         8uD7RpFy1IysY9HhzBiVw0GmkwFPnXutp11yykePnn0JGzJVU/NnGKYov0tAHDHRB9x8
         HybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935492; x=1781540292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZ/ECAxfrtXAV4RHwviGKJYxYk5iU7sPT9ceJc7dl0M=;
        b=PR+Evp6J2VS3FT/2UMLKJCvrb0dDR/bseN1uR2ZAEL3wrqrey4w16Z8l8ttb4t44yp
         keOzzp0Mp5H4nQ/CaH6CNwhsxXHzwahY7J1KHjzA2E9d5F3ATu3Fa9WV/NloBdz5lVOM
         thFYus/bPo5uvY27+OwlBde7p7evPItdeZcejWFXidhpUpR+Eq4/avsEnPcW/EbJ7/g7
         G4iv6ZLdKqB0nsDxYCtrrlx0ipy3/d6xSytWrvFx3Fz6jl9s7SQ4EOvQgGN+7cpSZKWB
         uiCmYyJkp5uqarlhtn/+FiPPE0GEDDHgg3rt6vrI5QpdxWRBYBhEW3BLUE1m46OPaKbh
         8VsQ==
X-Gm-Message-State: AOJu0YwjcyQSl7PzLyFZMCPjwNcci6kezqFHmr57DB0R+NOBqQZ2uw9C
	0JXoygMSXpgZ/a21osaBuICQEPNe1s192302kXCea1OdjoVU9juiUemNyXARHjR31DZvQi8pAk1
	sXeMIiTEpgCRGixYYSYToj0o3up4CPc0FP1CU85g9S7+VHkALk7uWg4icWy/5rcxcY8UC
X-Gm-Gg: Acq92OFjLUCAqVHYPDEFEtfPqh+Uxi32hZ7Nofvz/nqy36Ziae9qH4S9EVIkUGySYuZ
	OA5wK8BlJ5CWrApJxaiDgkE+EvzRszgeLXa7eVZXaDCyX/QNdxB+V7wN10x+8HupEVR4UrCvGqf
	zUcZi/AV5xcUI9bXnSmPkAjhP893xALgBOB+dsJI2mf299ZfVjlkuUStsd5R/UhAX/b67nSPPod
	BO9cgQitznQb/4GaR1oIbHMWOdpT+qRJGfp+VKL6zot7/cdwV/5Wg8zSDIh+wtD06gTavxONR4d
	FCrF8ek4Dp7gZ5I/yOO78Bbg6BEqFwxd/6Peffaypz3gIMJ9g6nIznncqm9mhsYZSZPwOLqsaYl
	sKrKKLoByNGiKISs7vddM0hyG69wfceoIQWkq8imOnfdLwF8zkcuRIs3RnH0=
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-842b0e2f70emr15840053b3a.4.1780935492003;
        Mon, 08 Jun 2026 09:18:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-842b0e2f70emr15840014b3a.4.1780935491338;
        Mon, 08 Jun 2026 09:18:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17499311b3a.7.2026.06.08.09.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:18:10 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:48:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 0/6] remoteproc: qcom: pas: Misc fixes
Message-ID: <20260608161805.46kf7ktlpibvvxxh@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26eb44 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ugYh0M8TO3JB3k0A73AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uywOt9oWiBNLpb4kiO7IilQKWLFkON3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX3EXHvpkYXiCQ
 wNmYYJ/tRtxhEJXqoHn6Y/hQgTo4T0BLf7ZX00wVvmeG8NWaGRXXZdt+9YLSPbZkj0z0FigCxIq
 ZUNdOSMV+mh6n+5pvt0ukdlm1cL3Mkc2xz8rvEI+vu9ezh397rRriVMLvdhPjKhqqdOw2h/+d/n
 pk8TGKNayMCI/K9u6vg5D2BGSe4ijER+JCWA61zjH13dZH91vkBvtzLTTdscFzDdeOpCC2RkRG0
 jravtD42utng2mo65Gv42CDGyVCYmpwT/TGCmwCGfWm4HZhBcI563xAMtnl0Ssq/0rIf5o8ggpm
 VVQGCmn58PibwHkqGmBXxmd1qi1a8CwbLDuYE2K6XPf3pWb/qTNyOGmIDVsT98oPGi2FSUUcdYe
 u76Tw/Znq+aFZK4vYioiV4aX5HWSMO9RxHudmzEZLHo9YBy2KMVpbOnYo33LVu5KZxcHJp9Jrgl
 Fov4lu3NTS/CVQ/2jNg==
X-Proofpoint-GUID: uywOt9oWiBNLpb4kiO7IilQKWLFkON3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12ADD658CE3

On Fri, May 01, 2026 at 12:42:47AM +0530, Mukesh Ojha wrote:
> This series is a collection of misc fixes for the Qualcomm PAS remoteproc
> driver and its supporting SCM/MDT loader infrastructure.
> 
> - Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
>   annotating mem_region fields with __iomem and using __force at call sites.
> - Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
>   consistent with all other release sites in the driver.
> - Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
>   so the DTB context is only created for subsystems that actually use it.
> - Map/unmap the subsystem memory region on demand around firmware load and
>   coredump, avoiding potential XPU violations on EL2 platforms where the
>   region may be handed off to the remote side.
> - Drop the now-unused dtb_mem_region field from struct qcom_pas.
> - Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
>   buffer retention explicit rather than implicit.

Reminder for review and if they look fine, can this be picked up?

> 
> Changes in v4:
>  https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
>  https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/
> 
>  - Last series mistakenly divided two series cause laptop shutdown.
>  - Some minor refactor common code rest is same a rebased on latest
>    kernel.
>  - Added new 6/6 to the series.
> 
> Mukesh Ojha (6):
>   remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
>   remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
>     check
>   remoteproc: qcom: pas: Fix the PAS context creation placement
>   remoteproc: qcom: pas: Map/unmap subsystem region before
>     auth_and_reset
>   remoteproc: qcom: pas: Drop unused dtb_mem_region field
>   firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
> 
>  drivers/firmware/qcom/qcom_scm.c       | 21 +++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
>  drivers/remoteproc/qcom_q6v5_pas.c     | 99 +++++++++++++++-----------
>  drivers/remoteproc/qcom_wcnss.c        |  6 +-
>  drivers/soc/qcom/mdt_loader.c          | 18 +++--
>  include/linux/firmware/qcom/qcom_scm.h |  1 +
>  include/linux/soc/qcom/mdt_loader.h    |  4 +-
>  7 files changed, 99 insertions(+), 56 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha

