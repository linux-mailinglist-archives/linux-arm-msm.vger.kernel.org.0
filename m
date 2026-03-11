Return-Path: <linux-arm-msm+bounces-96797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHtuC+DGsGnTmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:35:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E425A614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA97318E52F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C65367F47;
	Wed, 11 Mar 2026 01:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9C82eBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSRWWAti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE321B191
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192851; cv=none; b=SMNm6UGT+6kj2hRc5kjigFetBFoJbR2ECulwyNaakShYRrCXblLfWaxRs5dO4pKBGWdLqWdqCNLY3zRe7hcxyTtVAscM1ALLULP5vStidbnp+OXrDvuxv/gexwGT4If7iayI6s+eA/gkV2AX8fpxdn36Na4Irqezub9CRizUUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192851; c=relaxed/simple;
	bh=Q8Hc9ooUxbVtdPnIEu0z5CIgsowGg7hwXBssOJd6aG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH8OVDM6O2VidKjsAdzSOWxTlS2oXedHVgh+7WG72PqIpTB9juVwRhnXtH41go+Rjv74JN+iA6beAZLg6KNhjWxnr7gCCMy9SQQ//MpPruqjBXgHrzogcQqa0GMKJP0INwxmjkDAq32UAM3TRLBTuUAqrggUdmrA+ubQCs83lRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9C82eBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSRWWAti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJIfrB3296544
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t/kScn5c1KsInTDkcb6FS1tb
	UgTxGiH/6Yim6dWg/T4=; b=H9C82eBsch15e9p1UJY0bBXn6Zfuk68BW3fkqHsX
	dsTpDl84zR49d9+ogXS/qkdeoJFOjFxPWCZEblSaE0VTOIfT1LCLeQY8evfVJbDd
	r7ythIWy4yj+1MFN5OVIwIvSbFlYRh5a2Ho0ZXqaQsaw1tqLLA8Ttji6E0jSnIUX
	xoJlFhaUNWeyno3nokGeXQTptVSxMLZBqrQZSOxtM5qz1fMo0SGDWD0kIwKOprv9
	bGJ8h9z3gDTFUgMOE3WnrlXM8gPElKPEyPRW9rZRyLHuM1eoqsJ3+A9onLnDc8hR
	+p2GSiaBeYTyvSN2E3A3Gsc90BKgbj8v89sNhwCsYMXISQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mufkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:34:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffe4912235so5777618137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192848; x=1773797648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/kScn5c1KsInTDkcb6FS1tbUgTxGiH/6Yim6dWg/T4=;
        b=PSRWWAtiBtezzETKGHecTKnGEMhRLFqOAf/hdzoF/bbrZWAQatE7PNvua6CZDMUE2i
         S7vob+8JTCqrBSU4DFvqcHJwAQbQHa5imvQ9j4+7lVj7nW4MX/En/eyU9JLUSnDNMhaV
         CTBXn64IKm4RyYbnJuDggnjz1cZuY0htsicJpr1BKs7NA7pG6+5Fk4+bQLY1V5Ob26Qx
         4MuB//d0Ee8DbrhgWtvwUVJcQ2jO9BbFTHShoAY1UEgHHIzagyU6MMm71tCAvOi/P0ca
         7PaQImznxCokXvRGqQMreF7LPFxMhw8sos8dL8GakMsUV1szF4jN1W5upafpQi4WUUWb
         ElSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192848; x=1773797648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/kScn5c1KsInTDkcb6FS1tbUgTxGiH/6Yim6dWg/T4=;
        b=P6OCuFx3EguZ8aeorzC8ox+c2y3wrZzyvCBc9J80Jkb//H016annUmtoMmma/FGPw2
         Tt4hA7vwetuLY3rrRJA4it6F8M1rdqy1abatqWNj6SWbYzcc6DMyvJqw0xU2Gd8O0KVI
         //+P6mH+kOTtdEU5Q+6W19hgbww/kElLELfCe/x6WirPS2ERYO1xiQIjV4xShWUM8+B3
         7ZjqkyHLR4RFsAZHEJ70/yCtTlmVahLlADoQz9lK9iuDVtoN4H6QPhsHvkgdMpDpejGG
         YjUh3UGLxsAj7L8+yfgLpvfxfV3ejVdMT6xbWxTy5sI+bj7utG7bcm32D7K/OUKfwak+
         ji4g==
X-Forwarded-Encrypted: i=1; AJvYcCWf/+pSokNynIy37TY1NZbdkQyKalE/8FjPrEN04/po4tn5u1mQ+oapf29sm5mvWGi7oEwlSZb0mArcqR2g@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnqr1+iPaqajP/HEl5ouDYW7EofyS/pp6LS79bJK6OgFTbh5W
	Vp7zNGhqMG7N8TqWhQoRBPydL3BATuNOXs1YMPKPZxLMFnETebu7vqRJODjMUkRBLzqpQqoQC1s
	Ws776Ud/jzcRoD74+zWDzAA9ztyY7Z1KBlgz7ApXFlgIa+gvFh5XExeQ17cA2X5wvxudD
X-Gm-Gg: ATEYQzyKtt/7waHhXENYUv4TZlUML9syd7K68rHtmgxaXqjPJsoLF6NVYNWLDGllDat
	O2dqczCfLJpIS01l7MeYyOG3Qp/lC/rWrOL5kbYADYPym6RBUVHXrgNDQrDpyNQJEZQiD04dt8y
	Fru1jiKFnlr8EYRp+JNrQFx9rxoujy+/S8w/7YjTxXvd5CmNZ7ixnF9KLCTCqtF2+DU2+ghHORu
	XWU4Uw5sHBnVlGLNF7QRIYB2VxQv6V2CDpBcxLED/VqPfRHPUy5O+j7knfMVGxpr2Hll/OsI6UT
	Nx/0hlPEwtg2jd0jy0rljLTih2I/ayEUIm7z3vm0GLnZKIfc7XaOPVZJFwWQZhXcEspruad21vW
	qzXhSsPj3q+L2fM6pFIRrIjAZu0hwP+VRE4ZsYq46Jt4Uas8XX+TiThcYJmlqE7dS7+qcXGCyHl
	NK8MA0m66raHeW1rcAY0ty814U5zyoGB0wn8Q=
X-Received: by 2002:a05:6102:4409:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-601debc1b95mr329018137.13.1773192848329;
        Tue, 10 Mar 2026 18:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:4409:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-601debc1b95mr329004137.13.1773192847869;
        Tue, 10 Mar 2026 18:34:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e70d66sm1267171fa.40.2026.03.10.18.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:34:06 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:34:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] slimbus: qcom-ngd-ctrl: Initialize controller
 resources in controller
Message-ID: <cnbyqrpmfgofeoybc6kehztsrtyfc5xhwdjhu6qanq4l5434jz@xllc7ichy3y2>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0c691 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eovvkHS26EnLs4EkxgwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: uf9QkYzFO1hpBqK4IM576onNUswuy5JE
X-Proofpoint-GUID: uf9QkYzFO1hpBqK4IM576onNUswuy5JE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMSBTYWx0ZWRfXz+gNVudJgEXr
 H0fvQK0o9dhkTryDIP92YBVbUDlKWnDK9p1VarQh66EWGarliaao3dyGMMIHI6F88VwiolVVEsz
 41wxK97DCYS7MWBIoLBACdxOjqTL2R33pPpu4S80Qw25qUmdrtThswikOf1VLJ1yWg4vJyjF/VI
 Aj++S8lqB6PYsKkyefT1NbwQa4POt37Xng+G+TI1LDGuvvTbz7b5c48xwqOApXY3W9d9PkLxrmM
 8Mvq9mv72zfQqdyNOoUOGy7uOJVgxLmwPe14dYalZsQNARPd4eQgK5HiQAPfZkKwElvP2epCA2f
 oWuWklv7mYBb3OtREBmvn4qNtc14x8z42b/o4WDf2goGMcI/BQWYSOFI5QTzo0c44AdBvBg3nwL
 +wC35AGeWIddF+/mzQ+orVdDzwXEbOsdVtD/2uiwIaXkHddabobMfTlCsMUiFQq+P6l8fPY4oXd
 TODdqMkDlsbvMqhXHxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110011
X-Rspamd-Queue-Id: 8A2E425A614
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96797-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:06PM -0500, Bjorn Andersson wrote:
> The work structs and work queue are controller resources, create and
> destroy them in the controller context. Creating them as part of the
> child device's probe path seems to be okay now that the controller's
> probe has been updated, but if for some reason the child does not probe
> successfully a SSR or PDR notification will schedule_work() on an
> uninitialized "ngd_up_work".
> 
> Move the initialization of these controller resources to the controller
> probe function to avoid any issues, and to clarify the ownership.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

