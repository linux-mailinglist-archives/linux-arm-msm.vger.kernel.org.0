Return-Path: <linux-arm-msm+bounces-102837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J8vEo3k2mn26wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:17:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A11123E21C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F5D301BC0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32F28469B;
	Sun, 12 Apr 2026 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyTQ8j0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hfy+4ub2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D7284682
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775953029; cv=none; b=iMoBZ4SQxl/buKoFH41nv3ObGitiASvCzzqNGcrZtPL5xpYHnQRuJmGxrMCAs2/CrtMjB/ZliVN+qCUYL9OFD6cNseSI+v7nFt6soEo8K1yBOhuTkYQwEyhZPbrU10LvqMISM4BGD2ZM78BtPVSr8h4+e3LavM25iqDuQhRBe7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775953029; c=relaxed/simple;
	bh=OdRkUiNin5WZ1ZEYi9XXrSVNOJwpbQLOk+d9G80Cc20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uE+7UKODgVUahODhWQZ67+/FgInNySffA92zynO8kQ6JermTKNGzNBHsyUdx38oaDNYValUT+nffYgEUTjoZXcG/f29l02+aPwaLGoodoE42zE17JTTWA2jUg2/tiH7JKkz1BWs6wOF88JHUZBJgTV8ooWNu8+JW08VqVY7c21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyTQ8j0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hfy+4ub2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNquBY2920051
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WXjCqbuN9pqs5WEJmNSYlwbp
	Q0RPyvt53och6jW+MFk=; b=UyTQ8j0hiM7Sjpao7kOU6JU+rka09dgk/Fc9zQQ2
	D0iYsjhX5EkxyZRxLrJnYDS7lmxZvak7kMMa9yfY/0YK6hYGGnw5euVZOUI9zCD7
	rRk0NZOZi3l6i/BK71e9u1u8ZpF9ppXA29NEnl+Wx4eODspwTRHxPrLVgMKOzqn0
	WOQDh3avPBGBllJA4ViZHjlyk0+X1jLwYKrfWlwbYT4HG6uAVoFpMtlWbQIWGhq2
	x9jQBc/7X/sGePi/AYd7dVqDjza4B2IRUOwfLxFu6158JaUT+wHvPllq3T1tGUZT
	NQT5p1XTazPqy+huu8GqCiXcVNhxtHcmEXKfJJ3711IdOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthjha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:17:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so65112511cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775953026; x=1776557826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXjCqbuN9pqs5WEJmNSYlwbpQ0RPyvt53och6jW+MFk=;
        b=Hfy+4ub2Dgi1rP71soAJvh8xWjKG9gsjv5QIRYyBsXC+gG2ewlKO4qvuamC5PDx8gC
         iYFQcJbx7ezhX2ccgBl1Q3LlzhmLE43x0Bcxv1C+G5Kz6lnORDsRbDraoiW43Mtb+D5c
         0IGFLSbwLtszEpfd0E85EOGzjfIj/DaohiLZkZ8mo/yq7PNBFyGVSM/sQKL9GbE0CyAx
         bLgxI4iDwhMlINeaElDze/dwHVQ0YMHCuQ2N36MIhtyBF/nIQWz+5v4VR3JTNKm4krVh
         eiwQ6AtjkqTvzZZzeoaH6AEgeIvIJim7AprImmi8IEx+ni+adwaYVvcq28a+B13iY6lL
         FQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775953026; x=1776557826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXjCqbuN9pqs5WEJmNSYlwbpQ0RPyvt53och6jW+MFk=;
        b=Lva2EG7gv4e1eU96+sXIN0C0zHecJ+OcogFge1hbKzy8D6+EKHYw0v2Baseh6+DUK2
         EOd6WmaDfRlOdG1IadZ+/bhtiiBgfTzWHB4S1lVOrmaXS3MaeEaJhVEzHkRAJnqgOwqO
         z/o9RCY1jB2mYO0P3/AfM7eyWA+4ksJHc+88ZZceawzFS3eJ/iNXoVQX+fz4bnu8O0oi
         EknDWCu1CYgNHFQltchsV2lqjeZx5hNVkcXACfWWRFazjwSYjl4xKE9o0k01iKRSpTjn
         EHPi/2300IvXDNj5DHzb7NnoYWPyBrl6pOTglvbdsMZUJX2lQFPQj1YzXjuzunhdVkTO
         X6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwbd4SVo305LaiqmeT27wjSASiN6UBsOOUSFDroAKeblbTZlknuNcaq6TqFzHIo+4AgPRmuaK+78ZfV9RR@vger.kernel.org
X-Gm-Message-State: AOJu0YzMi1w3dJqO1qvGX5TgFLEWbUgsI2Mn7KOvFN/Q/lfjeguNzJWH
	Vm42FJPmpt9jr+XGtdL67+dWCb2UQfkWCXJ9uqDf9PmijYKkuXLkPA4BXFVPm9/tYLHjaS+EvYL
	A0Xni2rRjvvvwK/AwDaFm9ae5SH/rfstNbcOrzZo6hp32fDjjozrCQPr2MKQOTkwO7N6r
X-Gm-Gg: AeBDiesr1PRoQQZLgo1Wz4JzUqCn1jdYKPPggCDdGKm1aOelqeeEdjpLvUwgWoqfkUX
	KYS9zOaLqnB0nB2faUqo1xKzXufJIte0GpJCGsjDh8s5bVU48LmGf8PcAFyBblEUZbmaW4v/Jui
	UiVNq8D8Uos4xZPjLF2vnp5R0+MxLzFvEMreNyi3o7vssL4rgtyU9u8edeJiwFNmADtRuccXApj
	ielDjC++MSJzk/jcNBSdpG1X2HBL+5Dh2Yu3jP9Oo46KYDjkSWGWQHdUkfvwDdkvdmk8dPAjLut
	S1H/bxQTPPI/FprxS6CEJ/syGQcSO1zNxrDw309r02xPMOIRVaSFMG0PQnpvkmzcRY7xc3bVnqR
	FMTnPDgI8HvtGfZX5kphcRJ8Q5YLEfMmESNsuQpwu8V61eXOyK31qxV55AwEoUgeqJGP4ceU8rt
	8S+W0sLKFHIA3sbHkSSpnicQtRFqWNexivp8g=
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr123412961cf.16.1775953025718;
        Sat, 11 Apr 2026 17:17:05 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr123412621cf.16.1775953025299;
        Sat, 11 Apr 2026 17:17:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb1esm14855951fa.35.2026.04.11.17.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:17:02 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:17:01 +0300
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
Subject: Re: [PATCH v4 30/39] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <ukfrn22w6y5z77c4cirreyotzvuhmt554ebz2cfgtqav4yqbqj@e6rquwbabdtz>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-30-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-30-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dae482 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lPuuIjzOXlNeMCy1gH4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zRxa8A_S20O5xqDddAaeDx_Oc3IIKEPG
X-Proofpoint-ORIG-GUID: zRxa8A_S20O5xqDddAaeDx_Oc3IIKEPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMCBTYWx0ZWRfXyuszDH/C0x5v
 kHU3vImcvdtp/jsy9J6bF0WV/qhxqTpL1PCyLYrDBM5IbvWlG0PK16xbUN9m33cb4WuVjfse7k6
 GDIRsVAmwrXyydEgmsN1NZ0YtzigW9+K5OMKqaYqwtpEGi7vy1BXj6jLThMkBzE57alwNBJ4Ujw
 n/0Eq2E9Ys5pd/NwRERR5vUc9In5p4Gm9qUAmsBIuwvBa8E0rqUozcemWOPSfzLgNtTbHnygrgn
 KCGMM/BE1g+yBd4crQzzA9KdtzjC2ofAYsjYDchLM/v00FMAuvyLMBxVt5VqPpPBRqcnhQVbx1V
 xc+enjdTa7wTct3QHQ0wgTEQ+Hi5hCnPTx4N+0LjB3Dd9iveia9eqq0OLv84QpbI/jV1s3HzMmc
 +X3PMweJZyZF5XdofecvrBRmev5nBFHacnb1l6JILiejxRX5ucsEnUoFSGSD2tkQmlFzAEJAF5l
 DAzUp6oneqJbHbBdSQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102837-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A11123E21C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:05PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add an API dp_display_get_panel() to initialize and return a DP

The commit message wasn't updated.

> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 25 insertions(+)
> 

-- 
With best wishes
Dmitry

