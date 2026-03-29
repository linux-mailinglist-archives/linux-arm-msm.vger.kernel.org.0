Return-Path: <linux-arm-msm+bounces-100593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK3GFXv5yGnfswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08E351854
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29470300B111
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3503043DE;
	Sun, 29 Mar 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9S8b4Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sg5DYr3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C822D1914
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778733; cv=none; b=ToSSyDQoVcejNAWojwk+6xWhSTQdFb/wqeD62/LfiVXel41puTJd6v5OZK9whoVFpvqrW3TgyHlZDIIz7fcPalA5rK5bBO/7v2PTOwctv2APn+YVJizmolwdwvK+xePhGSDT/ca6K877HQqAVGhcznuN5XXEQyixMilEsvXHxVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778733; c=relaxed/simple;
	bh=f76w4smlz+hTMhqq8j7EslmWV277pO2GsxXhCfGqo00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg7ul73Ld+/oz/OBnY8NabQ5VUcc+/w5dgQWpNRqhWHlP/iA0EaA84C/CeFSuY46gf1HZ2DgZDtPz+10UT4jhZxRIpMPbNcFHx8CH4CyuBOdy+sUCcBS2zaUiW273rmFkAMWe8ShJ0wheU+pidnkb78IYXKtBzsxY5Cma5vaqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9S8b4Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg5DYr3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T3eJS83085637
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaiqO1qH1s6Lg7602BQN0CxF
	8FKSe/qUocsXjuCSObg=; b=l9S8b4PqvOFQrX/E7BnEIuqqHeaY7rle1VyRjVzz
	0wTVMOj05Gy/uwdx6o3CEzM8DWeisasE/GRkfUGySj4dHUM7D0/a0tqMQFjwfR5p
	KRcJNK3NXlcgKlCmKs8WEjcfw9JwtJfK1hvhoiW4b9M61LGclJj4mvWZUUwY0i2e
	an1jpXEqh8h1PQWT68rDuiBNgocdiEukL2aYskBrORCO3N0Jw4s4/EIGadbw/g7m
	MNPcxFGRV1SEW7DYKOpCyyy3ZWxoxRTb6hy5l6VmdkpDy47FFkLPf4erPENYnAA3
	jXgY68BBbHlQ6yRdcvov/hBNPX1Jqd/OZ9l6lTtaxg5SqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdav38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so36430191cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778729; x=1775383529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=Sg5DYr3ygG9kJ88tPZ5hbm4EPkUXlrsTl0tlwL2LXsowaa0iS8sqdZvM9Cpy3Z9n0A
         R0sZjTKfK8uhTMTA+l/+E8/Vq2OHAT3RFXtqSG/LSNo1TCs7NQ6Pu7/IjQPUNb9e9lYy
         QjG2Ne9cAYllLrM/QKbnra69pkWFSBinURSXMAYVxkMmW7Qqjh7+XgAPar7gvEOs4oWT
         wZ5BqbltI9W8igLWJTrP+r7pO8qPwUqBFqMszCN2trynRasQNOmJhKyCAIPUlvGUxAzY
         dtbdir7E6UQocEEKvhdhpR8GMBay16HbGdgCcd3YWltCzTKe1eWCyKP81TFrFePerCuo
         90+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778729; x=1775383529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=fzyO4Al2Gi9bCzVPSWmn2lNM7ADbIAGS1uSkM4w1T/KPDICZWpmzNlMSaBSks33nI9
         GaR4Wof36RSa8LUUbVgG846ivG6O/5T/wJ+QYdzI+rwefO3tfysNCm11itgJ+kf774Iw
         KieQ894eJQVxvYO9GfA9Jb1D5TEYAxWfBTmpBMbW3XaWUpi67CnB9K9ALv3vpz4VI5b+
         li5bj9US1VEjl8UrQOrVoNtHD/9egHQvP+7RIzl1/4Uxh1fN4sSMbM9S9aqonw4GNfaB
         8qiws9khkPei+U2uNDoEBKIgDTDT36HfIuLI/iPXbm8NsnvJ/Q47j2dbjM/GHp/UZzuJ
         YHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWEpK/qD8jrmEggxsABjMSP1kOb69ocUodM0MiotoZTEuK11sd6csWeW0/B8j/+H3saI8Oct8oIu9MVF04@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RIkuEJ3Y8GSq3b5QkPG2PnWQ2vIrV1u3cc+oL59Msqc3BNFS
	fMaVLXnntbaKPWpBqByn3RlLayPEjYKAeR5AV0FVpr/CqvvYlMmQj2B2SrbgPs2SH8qNSxo46eM
	ZYx2nzQgV0bFV4mR3f8yfcjQAxJ/JCB/YdhVV8PMAROo2bWSzZLoLZc41igSThZQr7rKA
X-Gm-Gg: ATEYQzwKBb2oobgrWAfYkwUZZ2tJc57vdJ4CBkwfwc2H0Y0+OdETd11YqwJFK0BajuN
	orVBv8r8NrjQZraWwuJMMLa2SHgxY/9LS9Y86P9nY4eT/Hn1/yAQjghIIFnzXol+yr4fR+Ddvq6
	6L9JDbuuTbT+bvHJJ554S4nyNq14XF3BpZVwk6ol+Bqsmwy4YRHx0aJzfj6hwkM4eXxApxkSiFD
	yB1jMM+WLUfb+RIJNJ0cHPy5X047HPN7wALHjD2OqjMbY13hykH+FF8Ew/WT4v/Ph1KYhK79PaP
	mm+URbDrrg2xArpg7R6CtT+vZKkW5kOautBi2+aRl5W+GRPMd2gC/0TJMD5VTxEBYH6BIjJFlBE
	rzYC5vfQ7tYq09yLFxkorKs8sKyBp8RdRO5KZ4niXizC+NFsDqkYBjIrlUmD9QXHzFiVWxg3v3n
	cmkeBU9Gxf6+qDpc1pSSs2atJqOH3Rk/omwsQ=
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712761cf.21.1774778729078;
        Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712401cf.21.1774778728557;
        Sun, 29 Mar 2026 03:05:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8373096esm8697771fa.15.2026.03.29.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:05:27 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:05:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <3qsp7fawh3wtvpvb7zvupfjpio4dhg7po56gudrttb2jcatqz2@gqhdobwalhlg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
X-Proofpoint-ORIG-GUID: m-ZX-27bGqICD_VJ9GBLpOT3GncAAEP3
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c8f96a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=f_kZLxWr8KFBRA8n9fgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: m-ZX-27bGqICD_VJ9GBLpOT3GncAAEP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfX+ItjKCqDFbEy
 hwBBp/BVMZ71DDNd6wza62t3iqeAwxBtAZhXS+5NUy4bnH6W7n0uDxQM8lEyEUaWvB1ecpPEN7r
 iSb2jb7szkkDnY7sGnCOe2V71Hym211flWIPChdrBSFecb5KhuR/v4ynfLuWsifI8rvIXJ1gcxU
 87+OoeK6SrWzXkc6eSe9XXQ/M6/ffrRGC5R+oWk7rfXjsSdJDzIb+u/z/z07AHTAUCMhq/fEgZS
 QncIVU1SJPocG/CgeY0U6/3c7hV1SGeVOETqKVEFJuIdxot+cb1nOtHpixYjGgJaZuuk9HTo0Wn
 VZpVrcnOI3P7efvfvDibbwPdLDJ1CTy6hhgCEFth6RbEjKIlEoB0ZNH1ylwn6ggWNO6dEME6up9
 lhbnoT0pcySL5OQg0BOifKw6ygJFNofilaZ6d+lN2LHrUkhKKCY84f/KQxEKR1pH5vljPYPpEb4
 NN+g1w9+0S/RulJbKHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100593-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF08E351854
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:30:48PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 796 ++++++++++++++++++++++++++
>  4 files changed, 808 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

