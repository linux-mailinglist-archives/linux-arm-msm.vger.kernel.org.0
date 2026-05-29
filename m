Return-Path: <linux-arm-msm+bounces-110265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCpsBsODGWobxQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:17:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A551602246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 502E630056C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057E63C3BED;
	Fri, 29 May 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmNsjEuW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkMt8l/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270E346AED
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056698; cv=none; b=gK9KlOpZ7nZjcRPnzDmfxvqNGcj9iZEI+drTj/Ru5WR6eLJHB5Zneym/ng4CBwpVrIWepb1xlPOUTpKi9MfotmzeuNmjYpCGNZxlUx7M7VqBVNPvoHWVsYzPhQEISELznjHpjNnx46afaB6bri+1lxMNhHTO3cacj/Ix1+oc6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056698; c=relaxed/simple;
	bh=DzaB2jdabzPZpoeGAzxUhDYLKpL/A9JHkaQDvUUNNmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1+L1fKQM4Q8r+a1Y6re6YqzDdFaDEp7pWEzbgmAwjYGJ1hpzyRmn/SWqxOSQUVsNcD3zgfVLJMujL2YjhLvc2lpJiAFKkOqxF+R0IvOAsyG8eFEviJ7NZA51q3hGqYP25LUvDp1lRU1Gy4wYHDodh5H7EAiWBX1FUiVtA4iWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmNsjEuW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkMt8l/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6ebns1386878
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=myZURdkrXDIz2L+zV0UOKR91
	eBxVLnWLIAPahE6PCKY=; b=EmNsjEuWnz8ABrbiQBBvdeoCtk8jEwcyhoGBycIa
	SW/sYVJsNtHW/wOHfEIXw6ctLZ4+h7lg9dOAytI/GtAfHX28fORHJW39HBxGZLNm
	MuddKd/a96vfqBtzBi7nUVREF/QCiAv4rtN1FdGE6cNub4UUJbQRJjOPAaINQeIB
	34EMauxDWj5DaFVWEhQU5TqxThHPnIM2r5Vr7pYWYvxgjDlT3RHPxg7OmfZ6arZL
	VD9scxa+T4L3VgaQ7DLOhJUEvUn/9+N1X0QecvH4aoiPm8O6Wiw+2qGLN2jEnEOF
	fx1FZK0zLey17AciRi4oNElFutY7pBffLCGFJX94R/PbIg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumud41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:11:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575ff9befe6so9526754e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780056696; x=1780661496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=myZURdkrXDIz2L+zV0UOKR91eBxVLnWLIAPahE6PCKY=;
        b=bkMt8l/vWcw64wOLWZneEFkxEAvmK9bFk46Z1FGXfOJXMFBCPn1IDyk+yOhzE67upv
         D3t1xLGqVB3+bnTITSY3JowlD6BqlY2anCzwDz5xqQnK6zW68G6Hl/C3MCtt4cRg6Krr
         5z0lTPEWn7iHJKBtQ/asOSa5oMywDkt4inrW20ypjBIqScXDkrz2KoBnEKPwiBUCG/C8
         0IMCt4chzHaGH/tF20rnjQ16pj1yH+xCQfP1ZEV8pEC4VRIbv+L/nWGhG6PkZMLe9Y98
         pjV3HNHa7cwQ3QG3gGoBEXk8cWFLnuiRcVnLwtbp7b1SgEIAcztdUXJh20+CYhCfg+mI
         K9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056696; x=1780661496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myZURdkrXDIz2L+zV0UOKR91eBxVLnWLIAPahE6PCKY=;
        b=Y0oU700RPWtMSAjqbMWrlsEJd8xhDVLpEioHgbEimOhdP/T6ez1mUyl0nVetbTFYny
         lon+/2jO2iWBKDWJhk92lurwH8U2HxJSz/6fljHQ21ZLhO1qzepZEqK2MKKRjRs+jZpL
         h0Ng4xhVCMC2BWF3k4ZGzou4OYqq/f8rJazUzATgveHhZDjPnm8WbVbvQkz5OYli+/+m
         3c8mBXHJxlytMqRPaA/W13huYhFOerrs9TcMkzyKrxOxcbt3dntolqzNVI4ABpDTgwK9
         4YzN8B2BUVKZ+I1Zb0MAEqJ2JvOtYKzelWnPcXZLfXNTjcPsXeMRe3rB8R47k0GRtQ5K
         SGOA==
X-Forwarded-Encrypted: i=1; AFNElJ8JmWU7cui4rdBbFGRX6+ofTR2nS9CdDR+d87suQKlN6rt8yrepmBSkXI6x3ZfHM7PeX8a2C0et753NUzfH@vger.kernel.org
X-Gm-Message-State: AOJu0YxjIb18XV1tEtxQrAD3RPf5q/Gki2c10i4wYaDbi4/zY3srAf+H
	Yiiiwj83De9Mjf3UmOsT1qMzM+/nQfPNBri0VvukeZ0/a3QtddccVg4zfAuc1aksx9EWhjqpxXq
	0G10ZtRnJI8oITgE4Mfijy3IHWmPhNawYyKCVKivHg9iXwZE9Ei1rl/XNQ89LLMUTFgrn
X-Gm-Gg: Acq92OE72YGt+VdXpsyPO6CdMUuNh0n2v2GucGZgfuoc3hCgYGIpVSV4Psg0p+gazsI
	QOGAxiSWFKA3jKHsMpeupWUo7VOdaek6lcY4S/UTu02vOzqr4JieVxpWTzCOF71Z7Cxy3TSk17z
	zKeUgyVj4fetd2qMFXg1DbP/lGnncDS17msKeN3STFBADGf7mMX4UZetI2PnyUHMPMdsMbSwGii
	fz7mZF8edENSiHpX9saUyg1ZVwNK+VrTkvaSNDBOop6WLWVX/cDpC3qvoW6YCIXgWo/rojUstB/
	2j9Ns+QRfTtMDNjooVQSftcD8XYi+KZw20xe1ib4XtrmHZzj6VmJrxWF6BpEtcCTSVPZAoJCidf
	D7Tlv6rnLuKIsYrcEGyYXDMIdCi9z6toEgRPWGUpOPKJoyGVgEgvTecgsqv6h7TOv5puy6j+MLn
	k9mbPAKlJAV2QGwUPEzauq4X4qijyT4jwM2G1QI8SsqpuKnA==
X-Received: by 2002:a05:6122:3390:b0:575:3b34:28b6 with SMTP id 71dfb90a1353d-599f7e54afcmr883173e0c.11.1780056696077;
        Fri, 29 May 2026 05:11:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3390:b0:575:3b34:28b6 with SMTP id 71dfb90a1353d-599f7e54afcmr883143e0c.11.1780056695578;
        Fri, 29 May 2026 05:11:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5ba625fasm225880e87.64.2026.05.29.05.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:11:34 -0700 (PDT)
Date: Fri, 29 May 2026 15:11:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/15] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Message-ID: <6g662olfylifrsx5dkifvz3dizs4xsum6gq62dwq5gu2ghgcbe@ouwaghilkkza>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-3-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-dp_mstclean-v5-3-a9221c1f1f3b@oss.qualcomm.com>
X-Proofpoint-GUID: p3oFejREtYsy8yMCaqwK-T5NtM6xKIhu
X-Proofpoint-ORIG-GUID: p3oFejREtYsy8yMCaqwK-T5NtM6xKIhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyMiBTYWx0ZWRfXweZbYdK48GCg
 /GxShnHUCPztEeIXZgQCCAL68CqheCQAfW4++ayfWXjPmod0vPEAZgOmWuJHlYEoUIkd1sRdZ92
 BQvK89r3QWX2QRxvb6ZUCJP6rvjvSh4OaaKAxFMqUEr3mwUxjH8si1l1Cs+mgse5/g1MyFf/YRM
 vBfOT54vry2SDqCyzRnpj+WfriJ9W8u4O9MkUGzDOlQd+jAb4oZkHGT8R3r37a635WX+ETmSMKn
 wzhj614XdqNSONo1e8Rn7QOdOEnSfZ5u6HFPqOrRhGshzrK/UU/F5k8NjwzlytDwvGhMIYktU6z
 ov6pHCS5DLQ3/vNYs2sNg06Upj7HMv0H8oEO9OjIhbMVmlJxC/+6yr5SzN/STY97zgh/wo5ZL+h
 oVkl23vrM6uAtkLHrf5TGw7MQCgvjbJfhvnnTAtD42HBTXIS9h4fOEsEU3UILOaRbOHEXXpUvR1
 gVq/bE1Px7x3MwPwp0A==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a198278 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=czEj8ZBfGQkZxxwQui4A:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290122
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110265-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A551602246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:40:24PM +0800, Yongxing Mou wrote:
> The display layer directly assigns msm_dp_panel mode fields (bpp,
> sync polarity, yuv420 flag) instead of letting the panel manage its
> own state. Pass adjusted_mode and bpp as parameters to
> msm_dp_panel_init_panel_info() and move the assignments inside it.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
>  3 files changed, 19 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

