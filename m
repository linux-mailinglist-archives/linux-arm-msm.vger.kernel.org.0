Return-Path: <linux-arm-msm+bounces-89904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI1qALkDcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:37:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A70284D142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1D7652F027
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85315478875;
	Tue, 20 Jan 2026 22:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsUejZ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNc94Oqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D543DA7EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947725; cv=none; b=Kvr8EdtZjQbWU+gdUUaDJyBGV0k+QPwLJ8eeMPDxRoEEst/XHSjVkeh94WPg9hrwaJhtZ5zEH2IcuGG2E+ADe5rWYGL7QfvW/6rLypFowsR6Le61JRSjTRsHcD6M/ZXjX0j0Y+4NOXwSZjXAJBRM59O/zITGLM9a2z8AZJ7eAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947725; c=relaxed/simple;
	bh=LDJknakhI9RPhb4mkOKY1y0f4vRKOaIlEbApl8Ozsg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVaEEYJteHv1cayzyBVaSWQKqQR9sxcsCeFjy70UJKut59cc5CdieWA1kHJ/gWxqe368CP32mA+IrJhmf7LBylqMxTGU6Qq2c53/fWQCrZVjFZhWqBV8gFHrH1IeuPjieS5oVSTCXmTBku7Y/vms7IYWMxCj94915yktcRmuTtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsUejZ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNc94Oqo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKeZUD390165
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FkAl24lMCdE91Ego+e9T17/N
	Gpg0l6WGYQKczoaqDdw=; b=DsUejZ99X5NIF1jf8g/KGCMi/Ahfzfap6i2GY4NX
	dAus6XHo/TL3Szgf1tx6Cx3ReicXNFerOmNBxi8wA9127H+6YSCdPEYkCEhrvSAh
	RWF6B0JGF8h97hIITfulYXwtEdlxI+bGh6DJIXzdmInTlyUtIsWGJhiGBgug7YNu
	83EmtnchzxwGsaLslxTlegOMwl2egmmVPWJ6YLRGJ5ulCr0LSuBv/EpXVvSQbp8q
	UaVMTRWgn1iv2yXiLSMQqkTdzh6DbfErvxeW7y/RfemlO7az5Q5UPQW3/EBrEpQf
	1pWCMQKQ43QGDfZFZ7ybxPk5mbvRAJO3NLe8W+JACGg/iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7q9uta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:21:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52bb3ac7bso978739885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947711; x=1769552511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkAl24lMCdE91Ego+e9T17/NGpg0l6WGYQKczoaqDdw=;
        b=NNc94OqoWfwfcGOPvubPUP39qcZvUjbA8OPiJ08qe9l32z+9SI3mMQYlAJCsNgBTwb
         b/MU1KsxpeXBwICz+kcUXEJXbUbIsSGKNdlGjXk61/TzvLsgtcjeFnXmkCH0BLftDSJh
         4i/Nw6M92bdHCedZ+DD4SPUL81k+R9CfDNAUjE+VcmFTbRlJy3PPUtETSUHUpOUC/d55
         M4OuoOQSuTBsJIYeGdtcgd69J/JgMvY7b2kY80F/nEsZBT/mzjw3Tdge2+8xBKbixWdT
         EEhKvVKo1qqvSv+tyo1qeeK+PpSv7Kv8UeIqyh84GqsiUKboEgfBjEKVkuDqSQaM6+yE
         xv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947711; x=1769552511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkAl24lMCdE91Ego+e9T17/NGpg0l6WGYQKczoaqDdw=;
        b=wfwInDVZk1Rc+pD+gLw40cQNhYRUNhtm+gEakCi/2nH51QQiTy2Vq/IbA+awPnbMhb
         HpVRdDEQUXA45tjhsIGbqH+t5rIqMTUhEVCctMGU4/Kd3HDqmS4qL4MpLIZ7xFrrP9+U
         6f0ksnZIHH7SvDwmsBqnEsq0NNjtKlPWSRJWsYV3GD1OuegG7M6Twz/yBhr5sv5/cSPC
         ESvsfqxdVpogHTjgAQdH8GqOSfTz8Pa1bnrQMWXjWIod8iPDTbsAMbT4h7m7xilJylG3
         tsOr0H/Y0Id/Tw57i+5sBXHEWUyQLxqKi9amnVo7U3R+oqf2bMnPO0V64Vw4M4Oe9/jE
         ziYg==
X-Forwarded-Encrypted: i=1; AJvYcCXHTvqycvhfjTWWOggBKlr21Vd/zdUt1CNJp7frms1nHCp8mh+UCB/CH4i76D2BggX1ZXkgcrJ1+xVsLfNo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+L9OC0m8njsdY6FJHCkvZoOx6vXljra94dQ9CB3zjrlCQF5o
	1BRVqTcm42JJVwQKJLCsQqK/nCc7TF9fUOA5FafmwokYxIDiU75uhPxpLOGlCkATpUuiz/QF4vO
	2nBGBTPb8PGJrYA/Xh4JSbR+PlQciYU9urOVGHl4tyWzpNaqWHvkyQib1s1PjBNZqLM18
X-Gm-Gg: AY/fxX757vu+mYxSSETjX1OHR4TQuEA7d/r6YUmPKYOLuzbBZPtYL2CQP3PF8cc20K8
	sAErzB+ilEvnaFmt371ui0XAFhZKAmNR01ofbKqOKn6PI44u7A3IJ+PEmz6KSXNUaAqh4QFIbVO
	hXlIE7PFjKBIVunPOKEXOWpKtuk0jvAYSwwYlUxA70qdXUoq9tpLRtL+vWivGV+FW22yErx72y3
	Sgcyx7DBAFCWE6dsVzHwXQRiRIi6GpF/IFHrKQ+APQfrsJ9efEXe5bt3JwX9G/MZo5EnMvBIfOQ
	BUGGugCjBAr4e3A23y+7zIfi4B595e/Tt677NC+ZsXaY32sxVo0xDX+HRdZZfj7iLQjV/TARnbA
	OuD92cPpuKIejUmNYRNL3hwJgCCAvjTWjznPrb3C8KFhIhY5agt702uheVog4VJF0BXLv1XdQWr
	2vxqprMffMQ9NxnHtiOonUtMw=
X-Received: by 2002:a05:620a:4091:b0:8b1:728f:952e with SMTP id af79cd13be357-8c6ccdc0ac8mr423694585a.31.1768947711010;
        Tue, 20 Jan 2026 14:21:51 -0800 (PST)
X-Received: by 2002:a05:620a:4091:b0:8b1:728f:952e with SMTP id af79cd13be357-8c6ccdc0ac8mr423692585a.31.1768947710548;
        Tue, 20 Jan 2026 14:21:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb873dsm42121551fa.44.2026.01.20.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:21:49 -0800 (PST)
Date: Wed, 21 Jan 2026 00:21:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: add SPI7 interface
Message-ID: <ud4fuoam7bqugleqqkrupbqjt3guhg3rkzabknebjfg74rytt5@oxkuidf5zabn>
References: <20260120193634.1089688-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120193634.1089688-1-morf3089@gmail.com>
X-Proofpoint-GUID: u9xi1DuKw1ituto0VJZbbbiQGTlcR8Br
X-Proofpoint-ORIG-GUID: u9xi1DuKw1ituto0VJZbbbiQGTlcR8Br
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69700000 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_lRTF5PQ1Mj0csV5J3QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfX695YGRbiNVcE
 6L8y6jQwvBzDKMi1PotQCB+ol8oe+TcRE8BFd3FCS2WTnEBUdC9ZdeJ5Nqh1Yzc/DOL70xCLxQv
 ++hB1FkjE/w3BUF9ojeJGXghNggu78WEMxNXvXAzM8J8VeAyHanE15dx+psN/EHF23pVb8kGyt5
 m+DWzWEhERtO1ONn5gUInTZj4WcgUVSdTaNIf/OXL6zcu8xL7VChJXM6hVlw2Vp+m+lN0/BY/at
 LwBNjE/WMJndZCQS5WxQDyAxVSY66AWJSZZYd2tIByDC+XsonExCH8VmUsEtQi7QKMo7yKXZ/Lo
 dBGK4qMqN1+oSlshu1UdIOUvBOfTyZAArrlAgCJlxLWOqeKq2ieYfKq3syiPQS0N4qCj6e+JE9H
 CBAHeyKKPtfi8BlJJeQNZT/P3jpgpBHMo0CY+6zfDEO7tOgtAQbjSULUkUzzl3Lhr7tsMg64STF
 4DNSGYp1ECQLUr2ugyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200186
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89904-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A70284D142
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:36:34PM +0100, Gianluca Boiano wrote:
> Add spi7 interface to SDM630 device tree.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

