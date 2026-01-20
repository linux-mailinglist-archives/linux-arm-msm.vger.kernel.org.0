Return-Path: <linux-arm-msm+bounces-89917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMNnMtgRcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:38:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3084DEEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 491D1A00F48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42ED33F8B4;
	Tue, 20 Jan 2026 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgR75AlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbuApsOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74E364EA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952111; cv=none; b=nw1UzD4bOemeC8QAvs0Mr8SOQ5Fz1lf2fx5XWysDz/Cu6/usdkLWL8teyFlI/u6AA5HhKAI7puPya6A0Lzt/q68R414APkIQITB8ROeUyFX3IDXgTf5vKpuS1Xzlf0bOT4n6lLaydz3PHJr/ml8RR2l50UxU/mrU6v3aZes/rZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952111; c=relaxed/simple;
	bh=XU5elMv4uS+fHPEIL1tortkvaB1Ybp815zAA1v7bRao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzZpuNiWWSTJs5X8fWp1Gk3x0M7784qB6MeovLU3j4J+Ee9u4XNamcSjih2eqX51pwa5Ao5spD/SEdau7IH35Oj1mawecqu7nEUUFxmjthdCjUghzqtNsV/WTlwFbg84sPlq06DNUD2HjZU3fDB6aBBvtQiTkCEHzdEm2coGRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgR75AlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbuApsOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL2MwM782007
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ia+XF08rhniSi/K/yTQ0EhSJ
	ZH5l2O8Cp8+zkPmZzTU=; b=NgR75AlMtAFYBDqsN+8fqPEBuBZLqTCx45HsdGDs
	I8txGupXXTbu78Jat2XNEWbepMQrz5jo7huv2JU2VIuP0/0hUSV5oWEzeHSbCiJc
	/TrkLh/uv0usiRKKPGX9cVPSwD8QxispkHNVvdPuo7+fBrVPFeYExKm6dsHmSG9y
	LsgOkrvZLmgI3BvbMXCHcrEbntWke+vDZrlvZVkj5BbngGlm/ActkrB+blCUXIcB
	f1JWeTfejztSXn5KEQvKmfy5upV2RpyqtdJJL7Jjbf/NqIgj5luhFiVc0PdPBTHk
	jWLdgJjiTGEs1KY9JDMVGn021knt8DSlAzwgm/9cWe/DWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatysxvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:35:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50299d2e742so243749231cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768952108; x=1769556908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ia+XF08rhniSi/K/yTQ0EhSJZH5l2O8Cp8+zkPmZzTU=;
        b=hbuApsOQ5KlYi/BkwBs//YMrV1gCbjW+W4PgPXuEyWNqjTmCYhjk94Tkr613AsKy56
         4osi97AG2OuJS4s4/P7iHTFpC5KsarRkXQYwY7vD4+RwSnDZv21bP94mZkkm98XplM5q
         mEXhw92lc7Q+ggQpTyVjs4PqIJ3WxzbWNcvFQd51KzOktjlP6NbdjbHR6jy9oG/Jdwir
         xwMQ7ChAatnOqJ87iIqtiFrBSx/VPFUNkNvMl/SYG1c+hx4yq4Uml2MmOSw2QL6zvn0K
         /M9Oj9nop4sCScqyb69uroQnhQgzwzrdb/PXCKBGZechS9Y9XPsxQxV/hdwmQox4OruQ
         +OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768952108; x=1769556908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia+XF08rhniSi/K/yTQ0EhSJZH5l2O8Cp8+zkPmZzTU=;
        b=xVJX5u+DdK+icA4V8Kl4bBTQo46yr6BVvX66VP1tZZw939awMKqnzNPb5ll2cL672w
         ifW5MWEFE7xI7V6q6IMj7kGyVsLgCkksIIPbZt0dEpRwSB+Z8hFMqwgKaj8cHQOxcZIR
         8nJe+6PWQ/o6Ju4bSn0nV1WY6IByDGMoL6xpaSdvUY6NH7arhcgV9rvKSGYBF/obwuLU
         wbsDg6EW7hg236LL9VvhaFwoYHC1TvEXsYeUMOs0VT7R/szK+kC6wcZJUbkf0LPWHh4N
         vvi1bk8Hxr95nk931W7T2OlAU51BOSGwB26AS0erqrJftDL/C1/hpmMXiupaPayZ/yWD
         GYGg==
X-Forwarded-Encrypted: i=1; AJvYcCWoOqAcqAjYLOl8tnGbecOodn8xPilS1uK+Mx2dWAQo85uNiwvvdBPCSSIRRGKMd8PLg1kCJmAAAjwdRIHV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9dwE5rFpOI2fWv9hcjp36ZBXKQCt/cGMqj39kAcnK1qDBg4Um
	AXF/5XTekD/+pV7maSpNYkyDwkxLkwoj/cOHH1i+vLz8euX6ODpUtv+Rd96FCM4qL1fa57wHIti
	AV3dZDNvBlh12BO0e23sTChpFH+k3/Jt+5d5NCj+miCjjeH2LVIxlOmHCKJC2t8ARbjNU
X-Gm-Gg: AZuq6aKrndGo1osY7kLFzvdTI51ypFsYRMWlJHsfFfq5Zknhgks7yMvYG7oMgVKIMdi
	KENQ5K6HDxGSzv0TcUv4ffsrFKfT9Pj/MAf1N9MOK5Soyy+I5VeD7pAWzgiuiOWw+xVIE0N9Sqp
	1rIe8ZUippzIBQrmoLI2Ia8h31F1A1VwKja5ANSEdiB5ndVA6rSiJ4LiTT+CcvtSMUtbuWTVjAs
	iievkSMyMKl6I/enXIzAoFOfDs2Qh0sZ4mDvhpLh6bR/dNbrQ+aCXzbIR6z6sXESrg+nQ2XVLxN
	xwnRmKBMAireZ8UB/cGefNPgLS7cGllfJ5PgXdNPTqsifs2mGSJg1IaThDd+YruvtdBus3prJSv
	mSjoWy4iz9pUiwsNmHxa+wokmxaQILU1rshiS1KuPQOXydQz+seEmgq2i5ZLY4EqVvbXp3tQ4SG
	61uq4LxF5B0xw9GQ6XY9s6TWc=
X-Received: by 2002:a05:620a:5611:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c6a6963926mr1692847985a.71.1768952108324;
        Tue, 20 Jan 2026 15:35:08 -0800 (PST)
X-Received: by 2002:a05:620a:5611:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c6a6963926mr1692845585a.71.1768952107838;
        Tue, 20 Jan 2026 15:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb873dsm42409831fa.44.2026.01.20.15.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:35:06 -0800 (PST)
Date: Wed, 21 Jan 2026 01:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: qcom_battmgr: Recognize "LiP" as
 lithium-polymer
Message-ID: <povftv7ajr4czsqjreottqj4is44biub44zjlg32ezho4rxb2z@r4x22qkw7j4y>
References: <20260117210941.6219-1-val@packett.cool>
 <bih6lxs4u7q2kfe4kmid35cpmnqmvjltvzv4wrowah6x7v3tth@kptyk7bnmnhv>
 <74de8f03-dae1-4bf9-a2a1-973952fee2e1@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74de8f03-dae1-4bf9-a2a1-973952fee2e1@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5NiBTYWx0ZWRfX+5taHbkWrMuW
 l9Y9O8v9nUwAIPpXwVXZK49qMIsDIwS8zoKdp41wD59oR5Tf1uoM65HsVFTlvRMExbfQ1xMHbTC
 Lj6/8ckBJ/wkMACo28SpAYiQND+CfynwuvhZ9RZ7OU5IEUgPN2tkGqUbm7T7kllL3vLCTrkKM6P
 qQ0kiW3Zc25OEj2QW3rrk5+jN+8gwTDk1vQVUOCjLVZ7YMoHyBHFZ+1liQudG+VPpsc9NBarRta
 hVLahh1P1a+IeCCLXJD5WdyrRBLrwlYmJeIXQqEUs32YSqG6rQZV54XWDOJyzUBSXDLL0hH6FYS
 31oiZQnbT2kv9eXSe60ttPEaBNb03CCsnLHwFNuStzLkrMjJTYsnBj/XfQiGuzLsUPQ++yZv0R6
 n61fCOqNlD33nlKTCGLzfK4ve5xX3s+/3KKki+LjIhm12/xYN4UTXWqnk4k0d4rjXjaJ13FlnzA
 lMBfLhvZoayZvaidDrw==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=6970112d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=MEE0ftJ_FLxYTFGDHAQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CcuYmOYq-bTtVjMrEfm0skenexbr9FXo
X-Proofpoint-ORIG-GUID: CcuYmOYq-bTtVjMrEfm0skenexbr9FXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200196
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E3084DEEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:14:12PM -0300, Val Packett wrote:
> 
> On 1/19/26 3:38 AM, Dmitry Baryshkov wrote:
> > On Sat, Jan 17, 2026 at 06:09:24PM -0300, Val Packett wrote:
> > > On the Dell Latitude 7455, the firmware uses "LiP" with a lowercase 'i'
> > > for the battery chemistry type, but only all-uppercase "LIP" was being
> > > recognized. Add the CamelCase variant to the check to fix the "Unknown
> > > battery technology" warning.
> > > 
> > > Fixes: 202ac22b8e2e ("power: supply: qcom_battmgr: Add lithium-polymer entry")
> > > Signed-off-by: Val Packett <val@packett.cool>
> > > ---
> > >   drivers/power/supply/qcom_battmgr.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> > > index c8028606bba0..80e701c66434 100644
> > > --- a/drivers/power/supply/qcom_battmgr.c
> > > +++ b/drivers/power/supply/qcom_battmgr.c
> > > @@ -1240,7 +1240,8 @@ static unsigned int qcom_battmgr_sc8280xp_parse_technology(const char *chemistry
> > >   	if ((!strncmp(chemistry, "LIO", BATTMGR_CHEMISTRY_LEN)) ||
> > >   	    (!strncmp(chemistry, "OOI", BATTMGR_CHEMISTRY_LEN)))
> > >   		return POWER_SUPPLY_TECHNOLOGY_LION;
> > > -	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN))
> > > +	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN) ||
> > > +	    (!strncmp(chemistry, "LiP", BATTMGR_CHEMISTRY_LEN)))
> > Why do you have extra brackets around the second strncmp?
> 
> Copy-pasted from the line above (the "OOI" one) :) Didn't see that the first
> one in this expression doesn't have them.
> 
> Feel free to edit this when applying

It depends on Sebastian, but I'd kindly suggest sending v2.

-- 
With best wishes
Dmitry

