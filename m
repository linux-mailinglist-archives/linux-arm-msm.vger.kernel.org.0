Return-Path: <linux-arm-msm+bounces-104179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KMpHB1W6Wk7XwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 01:13:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF444B6D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 01:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD6B3008741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 23:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46616370D72;
	Wed, 22 Apr 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihVF3q4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqevJ8nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F334A3A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776899568; cv=none; b=Jf8ZfaCCE10GdPIyvbVP8hqNCeQ05w40aVzjVZ6z9gxnMSHlGLvoOx+ixEUzB6TwKy3lFs/AN8iYiEhfyLtLRTs8O2apgnTsiaKrWmCdIDvOUZ7ygxeisAtqyIWAwMp+ITf58NyepurlIxWR6PF6hLACQ//5GlQ+qfL9iclKWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776899568; c=relaxed/simple;
	bh=wqVfJrH4Uhyp67zDnOha+RXPxXsq82YBvUqO5Yv8kck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/GQBcMkVV6U5N0kfL4wgtohMfAKkUb38N+wihwuicao/1qq+uLpiV+9cTFtpKZefInu10Bxk+PhBBg+c3o7tg/JXIJDuTEzlU3U3OPwA/hbUyDdYbPLlQ5Z7leYtlsxm+xzjHd3UH8B1XkMbRYw9RBRQQDaWSkH09UunQrFPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihVF3q4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqevJ8nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfkKb3528256
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ph7u1INcGMhgHK+sGQnUu27B
	CMlXKSM9xv8A9mrsM/E=; b=ihVF3q4c5Z+ycbKZNi/bDOfOILlBnCr7lPdpSaUS
	2h7JPUionDb/PdjPGmSXb3I0zH5BTT+LbhXDuKcgIyikxuythTERR5vwZFM9L7tg
	WoW0ewqf7Dj5sPhpOSMNidunPfyZaU80cGV3B0Mn90did8AQ8cIHI7OENuDMDTJK
	L4mFPaHtYooudIfJcyBUe4BMLm8Hqj1JmueDR4iFfpRH5a/+S/yXFYHxrPe8mVpL
	YtmXcJoWW3Y1q86ejUSgptRThkpY6YB+ysPTz0cWqsp8/C/oEuz/VRjTB4pnL22y
	iMphQqHEON+IYZYUd5Jll9zOZPUu/tGgSbt7oDD6fCw06Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wsf8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:12:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso61097021cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776899565; x=1777504365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ph7u1INcGMhgHK+sGQnUu27BCMlXKSM9xv8A9mrsM/E=;
        b=cqevJ8nfanoj7fagqxxUI+oub1IYmhot2zTPZYDEzbS9rxAJb6o9v9RDFk2titkXuo
         oZ5cEWBuQ4oqSD7VvzuZzyqCagzUeeji8qJUaFkmNOb1iBDsVfo3sGigYMi7txhqVPN/
         M1JWi3MIduu0muUvU0E+kYebQj5iFTx60D64VrG7ez1oddI/mwst+W/kN6Q5JI2t1pHU
         UZjlwbISM9iSqTOOW3bDTB2IpE7RhTfoCPvd+XlkCWlUjcoUVpTK5hyUYDX/oOUoNy5k
         mnVVu20GtrKuTrsDy70TGCjnmBgMWTV7C6RvOa/dhvvLSNzv8/Rudf1KxIS2MYA5d/WN
         FHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776899565; x=1777504365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph7u1INcGMhgHK+sGQnUu27BCMlXKSM9xv8A9mrsM/E=;
        b=T3waH8rSUr8Ve5bIzhkwNMMWjcMWKkjsEMSTJyIjMZe9UBVpP+jwgnpRjRMhodfCfk
         qzPJyloqFJu985urJmGyd05//kKylJwAzV3UKUAEMdMtCJA35lbM44zqnwB8BJ+4gzs1
         CUa0APbvdst+/ArjhL1tlh5FDkB5j+SQ25he5FSi93UZbyDEzGFgmMQ4qefLqt/DeIpl
         2OCf7ZVY7fEPZjmAXOOXgK9uJ5EsbJ0HjxUP1CfZPRsJrEHkyOX7EXMtyYNQq7Gjspj+
         CMiAVlBJ5Fq5VnXHpoop26UsDwU3DjWZATbOvPjwMNoZ2oPVpB8MzjWqZ3hR1wj1EmIK
         BX8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FuiwYgyZy9cLrszXQON1+jkU7rnElAQYLbNlfJWwcjna5yp8nbW2yfgOTv0x3hCcyO7u+5cHWUJYqVdYP@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJYpEYunCNWurOQZBDKKm2Ut7XCTDQeQC/d1VHinp85+dRXKq
	7+nte2++lesEZSX17PtVRK5Hu2ezaUtuLrIoadXm/spNuHmbPKhCsPyMCac8s9cK78+SE8/pM5+
	tZreI2ehF3dVISCAd5a+GQ7pDmt9tUitov9FE7Z7iKi3n1i4kbl/+Yrmo2/ZBHu1rIDrg
X-Gm-Gg: AeBDietgZZ0X9Fumy7btP289/yqc5nwrbEQg2AdhkspwCL6VLwva82cjtKLt9TZwx1M
	C5M9FqfbSX7kvJLUyXMPpbP5+TqLpNfcXHk/gVX0rctDkS9Lzj0/u5xzEZ+ZcFpbFFqSdmftQWS
	ZiSRHJ+8t+SMc+Ey5ow3WPJBftqEtEKU9nbVQhf//VJnGdzxm2sd+C2yldTaDrfJ8x8dkWhUncb
	f7mPZDWy0ss4jYffZsP6iv4UofaMeD3N2H9zPLJBYhsALqCBAdKWFtEXtsmkVrT5WsXHcf9ALuo
	fD4cG9fs+3bhNTg4ozPhQua0M1Qfa7P9Qp4JK0HY8tUMKZDm2Ky9swa/FnQS4WUAfXniHLkIAEp
	91mxqP7BUPEM8Km1Twv4tK+aXTyrVgzPn4l/5X+0BVXgNkwKMLvkoOmoW66ysGdG04IxiPiACKC
	PkjGc0XxtbciHxQOcregz9xGcPEJf3FZnV00tPZ2UTr06d9w==
X-Received: by 2002:a05:622a:4618:b0:50e:5a1c:d807 with SMTP id d75a77b69052e-50e5a1cdc7cmr145091801cf.27.1776899565099;
        Wed, 22 Apr 2026 16:12:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4618:b0:50e:5a1c:d807 with SMTP id d75a77b69052e-50e5a1cdc7cmr145091571cf.27.1776899564675;
        Wed, 22 Apr 2026 16:12:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm4795108e87.7.2026.04.22.16.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:12:43 -0700 (PDT)
Date: Thu, 23 Apr 2026 02:12:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
Message-ID: <2ptc5l7iycrglo4sm5nqksnfcaskrjbtp7zf44uyrtpeqm476a@gkep6s57lwa4>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
 <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDIyNyBTYWx0ZWRfX9csoeXVnwiPe
 e3JjYNHmOoA14DKjLYXIc/gvjmCm6TcyNt0ZaGnAd07jWAJl7JOqMHWrIRpnGGz5qs5pYFJH3EQ
 YJ0SCRMMElD+FVZc2H5fjg5C9xc473HlfLcRmA9sBASOUBVqEDqnmbINpNJpIwlgenuxVIzCTWV
 UK38avPuIC5++OmmQ2YOvr6tGdOoKZMxc5q82Ledwgy2aH55gcsH4oWjZ0sp8MFpmM3pf47+RNr
 iO4nBemOtPla4edYToj4Fj+nsMVGiiu0hTx9hyYtkKYF6vtajQ6od/mVZhEziLtF7ZV5lAQBDWy
 lPvyMoJznjPxy75gn60H466CNtJY7aJ5bezKbg+lpQXPVdF8jjZUIk8PNQCc1cj7xWGzsxa08eA
 4L99+XELJsdVSej65CSvMRFkBEY4A6Es92KMOw5qFQMT+8gwLyI01D7Q+Jktc3k+fPTZS7sDjTv
 G6G/bH+wcNSc9aENMCw==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e955ed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=2a3GcjfFp_zg-3xO9c4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: UePP9w2oahHDs_EH6RMa-wkQTEAYZK7-
X-Proofpoint-ORIG-GUID: UePP9w2oahHDs_EH6RMa-wkQTEAYZK7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220227
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104179-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCAF444B6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:13:17AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> This change implements the main board, the vision mezzanine
> will be supported in a follow up patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

