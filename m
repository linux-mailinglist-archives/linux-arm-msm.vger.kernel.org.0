Return-Path: <linux-arm-msm+bounces-102830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOgRGbHg2mnA6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E233E200C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5242830254C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897962C235E;
	Sun, 12 Apr 2026 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT3y9Jhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1P+QSZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7625F984
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952041; cv=none; b=XNzb+W2cFj2npXle8bg+IhZ9ddt6I8RAZ8mhrE1/XmomqXtuS4EkS9YC3bhutp914IoEPuR5iXRgdPXqu54ZoC1OKwqX/lR7ijCci3jb/Ninc1+O3wFvntLZHab3igUMrTPrE9o+6QfRPDzUcrwl6HH1P5RDwd0G/tgSJkWU9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952041; c=relaxed/simple;
	bh=yfMaJUPJqbZH7JG3qPmTK1Mn8trK8MU4UtmuyuFODLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsR25HjuF5lv3TkHA+GNGMbxDerDO7sEik+5JEgeMHuLdGS747XgGGL6N1rACTlpHolmO62m44kSevZa1rn4q1MZFs+xMqLXDTxJt6m/8OBrZtLOP5yqdiyuymT1GvziGXaUWFmAldOfQorhvrv47hYkDZWp0BeTOQfDHgpGWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YT3y9Jhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1P+QSZD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BMmdOx697568
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RZ6SZmB7GxAMhUsegl55+JuW
	gBPAgi+FiM1cMMAS/dM=; b=YT3y9Jhm1g5tXCkYxQ/zSdWwM37iCWOmiBclvkK+
	Or0kkdMOmVbbvUpDlnUNReA4DlAd7sdeLKTWdfpYTE9O17NVeLS6ARmj5pGwmwzp
	76c5evMmfK4hWR58SBOumkxbIN5oFyQUn2sheMFSqrBNELoKqIqDdK1zHRQpiVYS
	SlxHkGY4Z9uAmVIItXk8r5qrGameAOn9E3U20+a6D00YmCljTFpl5JJkO71Wo141
	xZOBI+Z0Pur53f1slBp7eeaMo64fOurH4DmC2ick0rI4gxu/MLiwL9PCpM53ggXa
	iL7PQjYwGwFffH8FEXOF0ospq84TuGsbg6x7vivQ7Pa9WQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyyshve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:00:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so16921571cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952037; x=1776556837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ6SZmB7GxAMhUsegl55+JuWgBPAgi+FiM1cMMAS/dM=;
        b=b1P+QSZDigqsIRpxeQs5TAkcMHKEXFpmw68ZD3JkBL+c3OrqDie3F1uiwZ/ZjpUZlp
         W3pq8c3gLrAFepLdm0454ZMU1R/mIqDZoup6KZ+AjTvzD+WYFXpW0x3Bnghhh2VEP/sn
         Z2bU1wqLiUcGzaZ7dHnZZ5XGfRR97Fn8cuQON7bv8bJqGsUhIAvGvKKrcUSZvwx439mG
         4TvIS3ZnfqE10t7xJZAXNTXbl5zMv6tUp2ywV8dlv/5Os9+TnwPcmzO9iMpQSceO5w+K
         TjG1V3PhCSpE4tlZyz5IdnzAKfYgOr4HVacbqF6fmnlsXkftmee7nhf1xe5szEDu7zI2
         EQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952037; x=1776556837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZ6SZmB7GxAMhUsegl55+JuWgBPAgi+FiM1cMMAS/dM=;
        b=NdkkakK5U8wwzR3NrR8RKvKN+DwOssEaM8fY2OXwZwXtYQ8rnsBaPVIzj3rd4m+efH
         ckjgQZjbershFc9xY6sYOOqPc4o7Uen6KjkzwgClSsdJlLiP5xcfKq8mcJe5klisMFZR
         9pr4EdRkaW4Y3o6ACF9A9A/ZkssB1YblUV58i8P+M5c21odZxruTzru35cEBCRv4E+5D
         yjHslZm0ICrGo4kJ7k0t4fay4DNi8YY8ELMkGLW9dKcWgnnmeU5QVR1vWMf1eoQimife
         A2jWLJxmWlermy9J4o2I/0xIiZSgjvxk8oUv7UsfHmik4HTWtVYB9hjB3ciJitZ4X8b4
         ajLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXop5t6rHS4HvAvGJv5HpvlKM7YLIqS5EiO/dBvVNeXAJdZh7pWu433l7SIX0wwGGdtbjQC67yjd4UT9zqG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64bfrdVpsVd+Vb9MPTs/vc2jRlNZeACPBpoC/p8lSo4LmYo8x
	z3082I3fYGS9dlfsjulbbuany2FHSbFsu4IUHBbnH0jn9e9iq7q3o9MGyKxSLOC4E5htFe1YegU
	RCJBoGIQ62rhVYRYQbzaOg8gywwL9thFQIGlMh1+bMGZ5YQW+dEm4DS69aDyl6zXdkdYM
X-Gm-Gg: AeBDievkcGZNnaFZcMV6ulb76c/6ui2awkfQJkjrS1yob9kbntxd8GWjItxbZejkeG+
	fR+AbiL+Dcpqv039+2oOolona4+5o5a0R7ba8Jmyy/ZUTahbowIfpF6CjHZCspx/2sqFY1sHXof
	NLw0HcIpw2AaSWkwGfdEthEqV5xCjCq8JHHMWCELM2AF/gY69A+EXHYpesxaIADkKXqYGN5s+Eb
	p1f1kCQO7QZzRVL0tZ1ocN8yeCJDWjtYhZhK0/wxb5GvdRMKi6FnYm6QlxaSouQ6jvUrjl9y5ta
	cUFL3FzMArqyvJRqIffHS8UJfaEu1NNW7bhKaFdDXT505c/1KIOnp528cs0MbcwOrNGGG0kJVA8
	WJ2MaZp7bdU5qTtobrDpu/o+S3q6OkDcxPyuxAZsTlnLzF5uPCBN9Kx8rfNSjPKIkscy6XBNWYs
	4ZCYAqJBOtAmvX26wrhwUdidXw9bkRlk36I2Y=
X-Received: by 2002:a05:622a:1496:b0:50d:86cb:db80 with SMTP id d75a77b69052e-50dd5aac472mr124876441cf.8.1775952036926;
        Sat, 11 Apr 2026 17:00:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1496:b0:50d:86cb:db80 with SMTP id d75a77b69052e-50dd5aac472mr124875741cf.8.1775952036467;
        Sat, 11 Apr 2026 17:00:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeef3003sm1651884e87.55.2026.04.11.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:00:33 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:00:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 24/39] drm/msm/dp: simplify link and clock disable
 sequence
Message-ID: <klw35brevymi66f5o4acv5i7hu2yoc4boidtsojcpmnawbv3iy@oxpzhet3gjyk>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-24-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-24-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: jTRqRvTOXYua1zlyiRNvP8eOudmx8gtY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMCBTYWx0ZWRfX2KNbRObeOfVO
 n/TYwnkIG/F+dZsszckoFbwRM3xtA+OXAcD37Tv0WVylUIg60cVwumyIE6XxnBqxbaGTYPqvsQ1
 hONg4T6u6L3ReVxGf2bNquyJbvA5nlo2LiOXuP2Vgpn46aM2CsDFUh4EnF/OwAD2QUxtRSr0on2
 yuCz9F9uqMQyiyqc68m7s6cpeJjmj1YhrvhKN1dmMRI2yNQG2eDTdF/woroIswHPxJiwNeiWt0W
 efWm+yZ9h7qWNQbfIE9bvgQ+ghrXn0iGIL2BKciS69oIGlEWARjmMDtdG5dptXN4q+CWK4+w5fE
 O/pPGmhvLn7VmJStnXTwia/kLZkEAE5pVavT6ynDDRFjXY5kppav8hPbz8f6pS82psFITkxvbBG
 yL2dfCnhcm/KUWwMwlfYvBcMPiH2cmCdSsCguFzPwzQdkaDXbglofW6PdTVKOWzflyCNq/wv6yV
 Htn11u/RRA7oCZv7dhw==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dae0a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=j01KFDZj9uNjKbeLSeUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jTRqRvTOXYua1zlyiRNvP8eOudmx8gtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110220
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102830-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22E233E200C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:59PM +0800, Yongxing Mou wrote:
> Move the common disable steps out of the sink_count check to make the
> flow easier to follow.
> 
> No functional change intended.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

